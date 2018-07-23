import QtQuick 2.0
Item {
    width: 60
    height: 60
    property alias icon: icon.source
    signal click()
    Image {
        id: icon
        source: "deafault/standard_close.png"
        anchors.centerIn: parent
        fillMode: Image.PreserveAspectFit
        width: parent.width * 0.7
        height: parent.height* 0.7
    }
    MouseArea{
        anchors.fill: parent
        onClicked: {
            parent.click()
        }
    }
}
