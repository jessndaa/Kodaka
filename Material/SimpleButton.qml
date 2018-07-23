import QtQuick 2.0

Rectangle {
    id:root
    width: 100
    height: 27
    color: "#8e66a4"
    property alias text: label.text
    signal clicked
    Text {
        id: label
        color: "#ffffff"
        anchors.centerIn: parent
        text: qsTr("your text")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 15
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        onClicked:root.clicked()
    }

}
