import QtQuick 2.4

Rectangle{
    width: 100
    height: 100
    color: "#ffcd00"
    radius: width/2
    property alias mouse: mouse
    Image {
        width: parent.width/2
        height: parent.height/2
        fillMode: Image.PreserveAspectFit
        source: "deafault/run.png"
        anchors.centerIn: parent

    }
    MouseArea{
        id:mouse
        anchors.fill: parent
    }

}
