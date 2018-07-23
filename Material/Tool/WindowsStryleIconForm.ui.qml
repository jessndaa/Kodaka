import QtQuick 2.4

Item {
    width: 200
    height: 60
    property alias minimize: minimize
    property alias maximize: maximize
    property alias close: close
    IconButton {
        id: minimize
        anchors.left: parent.left
        width: parent.width * 0.22
        height: parent.height
        icon: "deafault/standard_minimize.png"
    }
    IconButton {
        id: maximize
        anchors.centerIn: parent
        width: parent.width * 0.22
        height: parent.height
        icon: "deafault/standard_maximize.png"
    }
    IconButton {
        id: close
        anchors.right: parent.right
        width: parent.width * 0.22
        height: parent.height
        icon: "deafault/standard_close.png"
    }
}
