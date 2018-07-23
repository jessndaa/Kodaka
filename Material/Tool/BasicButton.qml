import QtQuick 2.0

Rectangle {
    id:root
    x: 128
    y: 106
    width: 95
    height: 25
    color: "#22f0b7"
    signal clicked
    Text {
        anchors.centerIn: parent
        color: "#ffffff"
        text: qsTr("creer")
        font.pixelSize: 13
    }
    MouseArea{
        anchors.fill: parent
        onClicked: {
           root.clicked()
        }
    }
}
