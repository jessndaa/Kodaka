import QtQuick 2.0

Rectangle {
    id:root
    width: 120
    height: 40
    color: "#f20050"
    property alias text: text1.text
    signal clicked
    Text {
        id: text1
        color: "#ffffff"
        text: qsTr("licence name")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 15
        anchors.centerIn: parent
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            root.clicked()
        }
    }

}
