import QtQuick 2.0

Rectangle {
    id:root
    width: 250
    height: 70
    color: "#0098e4"
    signal clicked
    property alias label: label.text
    Text {
        id: label
        color: "#f0efef"
        anchors.centerIn: parent
        text: qsTr("Text")
        font.pixelSize: 22
    }
    MouseArea{
        anchors.fill: parent
        onClicked: {
            root.clicked()
        }
    }

}
