import QtQuick 2.4
import QtQuick 2.7
import QtQuick.Controls 2.1
import QtWebEngine 1.4
import "MainApp.js" as Js
import QtQuick.Window 2.2
import "consoleView" as CV
import QtQuick.Layouts 1.3

Window{
    id:root
    width: 400
    height: 427
    modality: Qt.WindowModal
    property alias container: consCont
    property  string url: "html/index.html"
    property alias consoleEngine: consoleEngine
    flags: Qt.Popup
    property variant request

    Rectangle {
        id:conBar
        width: 400
        height: 28
        color: "#003556"
        Text {
            x: 158
            y: 8
            color: "#ffffff"
            text: qsTr("Kodaka Console")
            font.pixelSize: 12
        }
        Text {
            x: 15
            y: 8
            color: "#ffffff"
            text: qsTr("X")
            font.pixelSize: 12
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    theModel.clear()
                    root.close()
                }
            }
        }
    }
    Rectangle {
        id:consCont
        anchors.top: conBar.bottom
        width: 400
        height: 430
        WebEngineView{
            id:consoleEngine
            url:root.url
            anchors.fill: parent
            onJavaScriptDialogRequested: {
                request.accepted = true
                root.request = request
                switch(request.type){
                    case JavaScriptDialogRequest.DialogTypeAlert:
                        theModel.append({"message": request.message,"rtype":0x000000})
                        request.dialogAccept()
                        break;
                    case JavaScriptDialogRequest.DialogTypePrompt:
                        theModel.append({"message": request.message,"rtype":0x000001})
                        break;
                    default:
                        break;
                }
            }
        }
        Rectangle{
            anchors.fill: parent
            Image {
                source: "../Material/Tool/deafault/bgconsole.png"
                fillMode: Image.PreserveAspectCrop
            }
        }
        ListModel {
            id: theModel
        }
        ListView {
            anchors.fill: parent
            anchors.bottomMargin: 25
            clip: true
            Layout.fillWidth: true
            Layout.fillHeight: true
            displayMarginBeginning: 40
            displayMarginEnd: 40
            verticalLayoutDirection: ListView.TopToBottom
            model: theModel
            delegate: numberDelegate
            spacing: 10
        }
        Component {
            id: numberDelegate
            Rectangle {
                id: wrapper
                width: root.width
                color: "transparent"
                height: {
                        if(alert.visible) return alert.height
                        else if(emojiAlert.visible) return emojiAlert.height
                        else return input.height
                }
                Rectangle{
                    id:alert
                    color: "#e52784"
                    width: root.width * 0.80
                    anchors.centerIn: parent
                    height: text.height+30
                    visible: {
                        if(rtype=== 0x000000 && !root.isEmoji(message)){
                             return true;
                         }
                         return false
                    }
                }
                Text {
                    id:text
                    anchors.centerIn: parent
                    font.pixelSize: 16
                    width: alert.width *0.85
                    color: "white"
                    text: message
                    horizontalAlignment: Text.AlignHCenter
                    wrapMode: Text.WordWrap
                    visible: alert.visible

                }


                //implement the emoji
                Rectangle{
                    id:emojiAlert
                    color: "#00a4d9"
                    width: alert.width
                    anchors.centerIn: parent
                    height: 40
                    visible: {
                        if(rtype=== 0x000000 && root.isEmoji(message)){
                            return true;
                        }
                        return false
                    }
                }
                Image {
                    anchors.centerIn: parent
                    width: 35
                    height: 35
                    source: root.isEmoji(message)?root.resolveEmoji(message):""
                    visible: emojiAlert.visible
                    fillMode: Image.PreserveAspectFit
                }


                //implement the input
                Rectangle{
                    id:input
                    color: "#231f20"
                    width: alert.width
                    height:placeholder.height + editor.height + 10
                    anchors.centerIn: parent
                    visible: {
                        if(rtype=== 0x000001){
                            return true;
                        }
                        return false
                    }
                }
                Text{
                    id:placeholder
                    anchors.horizontalCenter: parent.horizontalCenter
                    width:  input.width *.9
                    font.pixelSize: 12
                    color: "white"
                    wrapMode: Text.WordWrap
                    text: message
                    visible: input.visible
                }
                Rectangle{
                    anchors.fill: editor
                    anchors.centerIn: editor
                    border.color: "white"
                    color: "transparent"
                    visible: input.visible
                }
                TextInput{
                    id:editor
                    anchors.top:placeholder.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width * 0.7
                    color: "white"
                    height: 20
                    font.pixelSize: 12
                    focus: true
                    horizontalAlignment: TextInput.AlignHCenter
                    verticalAlignment: TextInput.AlignVCenter
                    visible: input.visible
                    onAccepted: {
                        focus= false
                        readOnly= true
                        horizontalAlignment = TextInput.AlignHCenter
                        root.request.dialogAccept(editor.text)
                    }
                    Component.onCompleted: {
                        focus=true
                    }

                }

                //animation a chaque ajout dans la liste
                ListView.onAdd: SequentialAnimation {
                    NumberAnimation {
                        target: wrapper; property: "scale"; from: 0; to: 1; duration: 250
                        easing.type: Easing.InOutBounce
                    }
                }
            }
        }
    }
    function isEmoji(message){
        if(/&lt;emoji&gt/.test(message))
        return true;
        else
        return false;
    }

    function resolveEmoji(emoji){
        console.log(emoji)
        var emojiRoot="consoleView/images/"
        // begin js regular expression matchs
        var a = /&lt;emoji&gt;(\S+)&lt;\/emoji&gt;/.exec(emoji)
        // end js regular expression matchs
        //collecte emojis
        var emojis=[]
        emojis ["surprise"]="Surprised"
        emojis ["nerd"]="Nerd"
        emojis ["hear"]="Swearing Female"
        emojis ["pleure"]="Crying"
        emojis ["AgentSmith"]="Agent Smith"
        emojis ["Avatar"]="Avatar"
        emojis ["Boxing"]="Boxing"
        emojis ["Brain"]="Brain"
        emojis ["Breastfeeding"]="Breastfeeding"
        emojis ["Controller"]="Controller"
        emojis ["Cool"]="Cool"
        emojis ["Corgi"]="Corgi"
        emojis ["Crazy"]="Crazy"
        emojis ["Crying"]="Crying"
        emojis ["DateManWoman"]="Date Man Woman"
        emojis ["DJ"]="DJ"
        emojis ["Evil"]="Evil"
        emojis ["FortuneTeller"]="Fortune Teller"
        emojis ["FrankensteinsMonster"]="Frankensteins Monster"
        emojis ["FsocietyMask"]="Fsociety Mask"
        emojis ["Geisha"]="Geisha"
        emojis ["Groom"]="Groom"
        emojis ["Guest"]="Guest"
        emojis ["GuestFemale"]="Guest Female"
        emojis ["HandCursor"]="Hand Cursor"
        emojis ["Happy"]="Happy"
        emojis ["Hearing"]="Hearing"
        emojis ["HeartWithArrow"]="Heart With Arrow"
        emojis ["InLove"]="In Love"
        emojis ["Jumper"]="Jumper"
        emojis ["Kiss"]="Kiss"
        emojis ["LikeFilled"]="Like Filled"
        emojis ["Linux"]="Linux"
        emojis ["MentalState"]="Mental State"
        emojis ["Mime"]="Mime"
        emojis ["MouseRightClick"]="Mouse Right Click"
        emojis ["Pig"]="Pig"
        emojis ["Pokemon"]="Pokemon"
        emojis ["Print"]="Print"
        emojis ["Python"]="Python"
        emojis ["Question"]="Question"
        emojis ["Question"]="Question"
        emojis ["Question"]="Question"
        emojis ["Save"]="Save"
        emojis ["Silent"]="Silent"
        emojis ["Sleep"]="Sleep"
        emojis ["SteveJobs"]="Steve Jobs"
        emojis ["Tango"]="Tango"
        emojis ["UnderComputer"]="Under Computer"
        emojis ["USBDisconnected"]="USB Disconnected"
        emojis ["USBOff"]="USB Off"
        emojis ["Vampire"]="Vampire"
        emojis ["VenomHead"]="Venom Head"
        emojis ["WatchTVinBed"]="Watch TV inBed"
        emojis ["Windows"]="Windows"
        emojis ["Wink"]="Wink"
        emojis ["Workstation"]="Workstation"
        emojis ["Zombie"]="Zombie"

        //end collect emojis
        console.log(RegExp.$1)
        return (emojiRoot + emojis[RegExp.$1]+"_48px.png")
    }
}
