import QtQuick 2.4

Item {
    width: 400
    height: 400
    property alias container: consCont
    Rectangle {
        width: 400
        height: 28
        color: "#026a70"

        Text {
            x: 158
            y: 8
            color: "#ffffff"
            text: qsTr("Kodaka Console")
            font.pixelSize: 12
        }
    }
    Rectangle {
        id: consCont
        y: 28
        width: 400
        height: 372
        color: "#ffffff"
    }
}
