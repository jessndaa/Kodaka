import QtQuick 2.7
import "Tool" as Tl
Rectangle{
    width: 100
    height: 30
    color: "#4052b6"
    Tl.IconButton{
        width: 30
        height: 20
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        icon: "Tool/deafault/undo.png"
    }
    Tl.IconButton{
        width: 30
        height: 20
        anchors.centerIn: parent
        icon: "Tool/deafault/save.png"
    }
    Tl.IconButton{
        width: 20
        height: 15
        anchors.rightMargin: 0
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        icon: "Tool/deafault/redo.png"
    }
}
