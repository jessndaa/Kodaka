import QtQuick 2.0
import QtWebEngine 1.4
import "Tool" as Tl
import "../Window/MainApp.js" as Js
Item {
    id: root
    property alias url: engine.url
    property alias engine: engine
    property alias loading: engine.loading
    property variant request
    property string file: ""
    property alias loadingProgress: engine.loadProgress
    WebEngineView {
        id:engine
        url: "http://www.qt.io"
        anchors.fill: parent
        property string jsFromCode

        onJavaScriptDialogRequested:{
            request.accepted = true
            switch(request.type){
                case JavaScriptDialogRequest.DialogTypeAlert:
                    break;
                case JavaScriptDialogRequest.DialogTypePrompt:
                    root.request = request
                    alertDialogue.visible = true
                    break;
                default:
                    break;
            }

        }
        onJavaScriptConsoleMessage: {
            console.log(message)
            try{
                var query = JSON.parse(message)
                Js.runQuery(root.file, query)
            }
            catch(e){console.log(e.message)}
        }
    }
    Tl.AlertDialogue{
        id:alertDialogue
        visible: false
        anchors.centerIn: parent
        onVisibleChanged:textFocus = visible
        onAccept: {
            root.request.dialogAccept(prompt)
            prompt = ""
            alertDialogue.visible = false
        }
    }
    Behavior on opacity {
        NumberAnimation{
            easing{
                type:Easing.InOutBounce
                period: 1.0
            }

            duration: 1000
        }
    }
    function open(){
        opacity = 1.0
    }
    function hide(){
        visible=false;
    }
}
