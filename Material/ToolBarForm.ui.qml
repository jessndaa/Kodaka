import QtQuick 2.4
import "Tool" as Tl

Rectangle {
    width: 800
    height: 60
    color: "#4052b6"
    border.color: "#00000000"
    property alias window: window
    Item {
        width: 100
        height: parent.height
        anchors.right: parent.right
        Tl.WindowsStryleIcon {
            id: window
            width: parent.width * 0.7
            height: parent.height
            anchors.centerIn: parent
        }
    }

    Image {
        id: image
        x: 40
        width: 50
        height: 55
        anchors.verticalCenterOffset: 0
        anchors.verticalCenter: parent.verticalCenter
        fillMode: Image.PreserveAspectFit
        source: "../logo/iconekdk.png"
    }
}
