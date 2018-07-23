import QtQuick 2.4

RoundedButtonForm {
    id:root
    signal click
    mouse.onClicked: {
        root.click()
    }
}
