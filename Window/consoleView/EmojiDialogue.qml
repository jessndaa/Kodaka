import QtQuick 2.0
import "../ButtonType"
Rectangle{
    id: root
    width: 400
    height: 400
    signal accepted
    property string labelBox
    signal quitClicked
    signal forwardClicked
    function resolveEmoji(emoji){
        console.log(emoji)
        // begin js regular expression matchs
        var a = /&lt;emoji&gt;(\S+)&lt;\/emoji&gt;/.exec(emoji)
        // end js regular expression matchs
        //collecte emojis
        var emojis=[]
        emojis ["surprise"]="images/Surprised_48px.png"
        emojis ["nerd"]="images/Nerd_48px.png"
        emojis ["neutre"]="images/Neutral_52px.png"
        emojis ["mechante"]="images/Swearing Female_48px.png"
        emojis ["pleure"]="images/Crying_48px.png"
        //end collect emojis
        console.log(RegExp.$1)
        return emojis[RegExp.$1]
    }
    Image {
        id: image
        x: 175
        y: 175
        width: 50
        height: 51
        fillMode: Image.PreserveAspectFit
        source:resolveEmoji(labelBox)
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
