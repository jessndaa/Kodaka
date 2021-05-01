import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.1
import QtQml 2.12
import "Window" as Win

Win.MainApp{
    id: mainApp
    property alias mainApp: mainApp
    Component.onCompleted: {
        console.log("args: ",Utility.argFile);
    }
}

