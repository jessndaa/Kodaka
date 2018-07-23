import QtQuick 2.4

WindowsStryleIconForm {
    signal closeCliked()
    signal minimizeClicked()
    signal maximizeCliked()
    close.onClick: {
        closeCliked()
    }
    minimize.onClick: {
        minimizeClicked()
    }
    maximize.onClick: {
        maximizeCliked()
    }
}
