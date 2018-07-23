import QtQuick 2.0
import "Tool" as Tl
import "../Window/MainApp.js" as Js
Rectangle{
    width: 40
    height: 600
    color: "#fff"
    signal runClicked
    signal configCliked
    signal helpClicked
    signal newClicked
    signal openClicked
    signal debugCliked
    signal saveClicked
    signal androidClicked
    signal exeClicked
    Column{
        y: 15
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 30
        //content of the simple use case of application
        Column{
            y: 15
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10
            Tl.IconButton{
                width: 25
                height: 25
                anchors.horizontalCenterOffset: 0
                icon: "Tool/deafault/new.png"
                anchors.horizontalCenter: parent.horizontalCenter
                opacity: .83
                onClick: {
                    newClicked()
                }
            }
            Tl.IconButton{
                width: 25
                height: 25
                anchors.horizontalCenterOffset: 0
                icon: "Tool/deafault/open.png"
                anchors.horizontalCenter: parent.horizontalCenter
                opacity: .83
                onClick: {
                    openClicked()
                }
            }
            Tl.IconButton{
                width: 25
                height: 25
                anchors.horizontalCenterOffset: 0
                icon: "Tool/deafault/saveicon.png"
                anchors.horizontalCenter: parent.horizontalCenter
                opacity: .83
                onClick: {
                    saveClicked()
                }
            }
        }

        // content of the debug and run function
        Column{
            y: 15
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 14
            //this button specify the run button
            Tl.RoundedButton{
                id:run
                width: 23
                height: 23
                anchors.horizontalCenter: parent.horizontalCenter
                onClick: {
                    runClicked()
                }
            }
            //this button specify the exe compile button button
            Tl.IconButton{
                width: 25
                height: 25
                anchors.horizontalCenterOffset: 0
                icon: "Tool/deafault/exe.png"
                anchors.horizontalCenter: parent.horizontalCenter
                opacity: .83
                onClick: {
                    exeClicked()
                }
            }
            //this button specify the exe compile button button
            Tl.IconButton{
                width: 25
                height: 25
                anchors.horizontalCenterOffset: 0
                icon: "Tool/deafault/android.png"
                anchors.horizontalCenter: parent.horizontalCenter
                opacity: .83
                onClick: {
                    androidClicked()
                }
          }
        }
    }
    Column{
        y : parent.height - 100
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 6
        Tl.IconButton{
            width: 25
            height: 25
            anchors.horizontalCenterOffset: 0
            icon: "Tool/deafault/help.png"
            anchors.horizontalCenter: parent.horizontalCenter
            opacity: 0.75
            onClick: {
                helpClicked()
            }
        }

        //fixed Positioner bug...
        Tl.IconButton{
            width: 25
            height: 25
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            opacity: 0.75
        }
    }
}
