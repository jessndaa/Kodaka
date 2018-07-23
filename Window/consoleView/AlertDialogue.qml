import QtQuick 2.0
import "../ButtonType"
Rectangle{
    id: root
    width: 400
    height: 400
    signal accepted
    property alias labelBox: labelBox.text
    signal quitClicked
    signal forwardClicked
    Text {
        id: labelBox
        width: 343
        height: 120
        anchors.centerIn: parent
        text: qsTr("DefaultText")
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 20
    }

    Rectangle {
        id: rectangle
        x: 0
        y: 368
        width: 201
        height: 32
        color: "#fd1818"
        border.color: "#00000000"

        Text {
            color: "#fdfdfd"
            text: qsTr("Quitter")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 12
            anchors.centerIn: parent
        }
        MouseArea{
            anchors.fill: parent
            onClicked: quitClicked()
        }
    }

    Rectangle {
        x: 201
        y: 368
        width: 199
        height: 32
        color: "#0099b6"
        Text {
            color: "#fdfdfd"
            text: qsTr("Suivant")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 12
            anchors.centerIn: parent
        }
        MouseArea{
            anchors.fill: parent
            onClicked: forwardClicked()
        }
    }
}
