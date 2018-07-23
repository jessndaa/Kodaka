import QtQuick 2.0
import QtQuick.Controls 2.2  as T

/* * this code implement the Degre's Menu Button style
   * and provide some user experence(We call that Design Hack).
   */
/* * this code is extends to QtLabs library
   * implemented by Qt for more info check the documentation inside of Qt creator
   */
T.Button{
    id:root
    width: 200
    height: 40
    property alias label: labelo.text
    property string icon: ""
    property string localIcon:"Tool/deafault/menu/"
    background: Rectangle{
        id:bg
        implicitWidth: root.width
        implicitHeight: root.height
        color: "#0492cc"

        /* * this code help us to builde pressed action and give some effects when user press to the ButtonDegreMenu
           */
        Image {
            fillMode: Image.PreserveAspectCrop
            source: root.pressed ? "hover.png" :""
            anchors.fill: bg
        }
    }
    T.Label{
        id:labelo
        text: "Andoid"
        anchors.verticalCenterOffset: 0
        color: "#c6d5df"
        font.pixelSize: 15
        anchors.verticalCenter: root.verticalCenter
        x:34
    }
    /* this part of code import the ButtonDegreMenu incon */
    Image {
        id: image
        source: localIcon+ icon
        anchors.verticalCenter: parent.verticalCenter
        x:8
        width: 20
        height: 18
        anchors.verticalCenterOffset: 0
    }

}
