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
            label: "Ouvrir"
            icon: "Door Opened_50px.png"
            onClicked: openClicked()
        }
        MenuButton{
            width: parent.width
            label: "Nouveau"
            icon: "File_50px.png"
            onClicked:newClicked()
        }
        MenuButton{
            width: parent.width
            label: "Enregistrer"
            icon: "Save Archive_50px.png"
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
            label: "Exporter en PHP"
            icon: "PHP_50px.png"
            onClicked: phpExportCliked()
        }
        MenuButton{
            width: parent.width
            label: "Exporter en Python"
            icon: "Python_50px_1.png"
            onClicked: pythonExportCliked()
        }
        MenuButton{
            width: parent.width
            label: "Exporter en JavaScript"
            icon: "JavaScript_50px.png"
            onClicked: jsExportCliked()
        }
        MenuButton{
            width: parent.width
            label: "Importer un ficher kdk"
            icon: "kdk_50px.png"
            onClicked: kdkImportCliked()
        }
    }
}
