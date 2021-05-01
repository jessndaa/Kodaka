import QtQuick 2.4
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
Drawer {
    id:root
    width: 200
    height: 600
    signal newClicked
    signal openClicked
    signal kdkImportCliked
    signal phpExportCliked
    signal pythonExportCliked
    signal jsExportCliked
    signal saveClicked
    background: Rectangle{
        implicitHeight: root.height
        implicitWidth: root.width
        color: "#0492cc"
    }
    Column{
        y:35
        spacing: 5
        width: parent.width
        MenuButton{
            width: parent.width
            label: "open"
            dataIcon: "Tool/deafault/menu/Door Opened_50px.png"
            onClicked: openClicked()
        }
        MenuButton{
            width: parent.width
            label: "new project"
            dataIcon: "Tool/deafault/menu/File_50px.png"
            onClicked:newClicked()
        }
        MenuButton{
            width: parent.width
            label: "save"
            dataIcon: "Tool/deafault/menu/Save Archive_50px.png"
            onClicked: saveClicked()
        }


        //////////////////////////////////////////////////////////////////////////////////////
        Rectangle {
            id:separator
            width: parent.width * 0.8
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: -9
            height: 1
            color:"white"
            opacity: 0.4
        }
        /////////////////////////////////////////////////////////////////////////////////////


        MenuButton{
            width: parent.width
            label: "compile to PHP"
            dataIcon: "Tool/deafault/menu/PHP_50px.png"
            onClicked: phpExportCliked()
        }
        MenuButton{
            width: parent.width
            label: "compile to Python"
            dataIcon: "Tool/deafault/menu/Python_50px_1.png"
            onClicked: pythonExportCliked()
        }
        MenuButton{
            width: parent.width
            label: "compile to JavaScript"
            dataIcon: "Tool/deafault/menu/JavaScript_50px.png"
            onClicked: jsExportCliked()
        }
        MenuButton{
            width: parent.width
            label: "import a kdk file"
            dataIcon: "Tool/deafault/menu/kdk_50px.png"
            onClicked: kdkImportCliked()
        }
    }
}
