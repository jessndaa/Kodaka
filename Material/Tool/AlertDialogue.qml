import QtQuick 2.4

AlertDialogueForm {
    signal accept
    boutton.onClicked: {
        accept()
    }
    Behavior on x{
        NumberAnimation{
            duration: 500
            easing.type: Easing.InCurve
        }
    }
}
