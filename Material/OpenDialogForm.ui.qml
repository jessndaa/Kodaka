import QtQuick 2.4
import QtQuick.Controls 2.2

Popup {
    closePolicy: Popup.CloseOnEscape
    modal: true
    focus: true

    property alias help: help
    property alias btnNew: btnNew
    property alias btnOpen: btnOpen
    property alias btnExemple: btnExemple
    property alias btnRecent: btnRecent
    property alias error_label: error_label
    property alias swipIndex: swip.currentIndex
    property alias back: back
    property alias exHelloWord: exHelloWord
    property alias exMultiplication: exMultiplication
    property alias exDivers: exDivers
    property alias exTabSin: exTableauSinus
    property alias exListe: exListe
    Rectangle {
        width: 392
        height: 212
        color: "transparent"
        visible: true
        SwipeView {
            id: swip
            visible: true
            currentIndex: 0
            anchors.fill: parent
            spacing: 500
            Item {
                id: container
                visible: true
                Rectangle {

                    width: 392
                    height: 212
                    color: "#ffffff"
                    visible: true
                    Column {
                        x: 216
                        y: 37
                        width: 148
                        spacing: 10
                        SimpleButton {
                            id: btnNew
                            width: parent.width
                            height: 27
                            text: "new project"
                        }

                        SimpleButton {
                            id: btnOpen
                            width: parent.width
                            height: 27
                            text: "open project"
                        }

                        SimpleButton {
                            id: btnRecent
                            width: parent.width
                            height: 27
                            text: "recent"
                        }

                        SimpleButton {
                            id: btnExemple
                            width: parent.width
                            height: 27
                            text: "exemples"
                        }
                    }

                    Rectangle {
                        x: 8
                        y: 8
                        width: 186
                        height: 196
                        color: "#eaeaea"
                        Image {
                            id: image
                            width: parent.width
                            fillMode: Image.PreserveAspectFit
                            anchors.bottom: helptext.top
                            anchors.top: parent.top
                            source: "Tool/deafault/design.png"
                        }
                        Rectangle {
                            id: helptext
                            x: 0
                            y: 110
                            width: 186
                            height: 86
                            color: "#ff9a2d"
                            border.color: "#ff9a2d"
                            Text {
                                id: text2
                                x: 8
                                y: 8
                                width: 145
                                height: 70
                                color: "#ffffff"
                                text: qsTr("learn to code...")
                                wrapMode: Text.WordWrap
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignLeft
                                font.pixelSize: 24
                            }
                        }
                        MouseArea {
                            id: help
                            anchors.fill: parent
                        }
                    }

                    Rectangle {
                        id: error_label
                        x: 209
                        y: 193
                        width: 170
                        height: 19
                        color: "#fe5353"
                        visible: false
                        property alias text: text1.text
                        Text {
                            id: text1
                            color: "#fefefe"
                            text: qsTr("Il n'y a pas des fichier recent")
                            font.pixelSize: 10
                            anchors.centerIn: parent
                        }
                    }
                }
            }
            Item {
                id: min
                Rectangle {
                    width: 392
                    height: 212
                    color: "#e7e6e6"

                    Grid {
                        id: grid
                        spacing: 5
                        columns: 3
                        anchors.centerIn: parent
                        ButtonEnter {
                            id: exHelloWord

                            Text {
                                id: text4
                                x: 15
                                y: 55
                                color: "#747474"
                                text: qsTr("Hello word")
                                font.pixelSize: 10
                            }
                        }
                        ButtonEnter {
                            id: exMultiplication
                            source: "Tool/deafault/table_de_mul.png"
                            Text {
                                id: text5
                                x: 9
                                y: 55
                                color: "#747474"
                                text: qsTr("Multiplication")
                                font.pixelSize: 10
                            }
                        }
                        ButtonEnter {
                            id: exListe
                            source: "Tool/deafault/liste.png"
                            Text {
                                x: 28
                                y: 55
                                color: "#747474"
                                text: qsTr("Liste")
                                font.pixelSize: 10
                            }
                        }

                        ButtonEnter {
                            id: exTableauSinus
                            source: "Tool/deafault/table_de_sinus.png"
                            Text {
                                x: 8
                                y: 55
                                color: "#747474"
                                text: qsTr("Table de sinus")
                                font.pixelSize: 10
                            }
                        }

                        ButtonEnter {
                            id: exDivers
                            source: "Tool/deafault/divers.png"
                            Text {
                                x: 24
                                y: 55
                                color: "#747474"
                                text: qsTr("Divers")
                                font.pixelSize: 10
                            }
                        }
                    }

                    Text {
                        id: text3
                        x: 8
                        y: 15
                        color: "#008df2"
                        text: qsTr("<")
                        font.pixelSize: 45

                        MouseArea {
                            id: back
                            anchors.fill: parent
                        }
                    }
                }
            }
        }
    }
}
