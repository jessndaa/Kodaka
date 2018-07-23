import QtQuick 2.0

Image {
    id: name
    width: 75
    height: 75
    fillMode: Image.PreserveAspectFit
    source: "Tool/deafault/hello.png"
    signal clicked()
    MouseArea{
        anchors.fill: parent
        onClicked: {
           name.clicked()
        }
    }
}
