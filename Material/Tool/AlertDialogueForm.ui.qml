import QtQuick 2.4
import QtQuick.Controls 2.2

Rectangle {
    id: root
    width: 350
    height: 150
    property alias prompt: textInput.text
    property alias boutton: acceptButton
    property alias textFocus: textInput.focus
    Rectangle {
        width: parent.width
        height: 26
        color: "#00569b"
        Text {
            color: "#f9f9f9"
            text: qsTr("Creation d'une variable")
            font.pixelSize: 12
            anchors.centerIn: parent
        }
    }

    Rectangle {
        border.color: "black"
    }
    TextInput {
        id: textInput
        x: 67
        y: 63
        width: 201
        height: 24
        text: qsTr("")
        font.pixelSize: 12
    }

    BasicButton {
        id: acceptButton
        anchors.horizontalCenter: parent.horizontalCenter
        y: 109
        color: "#00569b"
    }
}
