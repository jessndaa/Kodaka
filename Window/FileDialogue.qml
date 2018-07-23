import QtQuick 2.0
import Qt.labs.platform 1.0
FileDialog {
    id: fileDialog
    fileMode: FileDialog.OpenFile
    nameFilters: ['"Kodaka (*.kdk)"']
    folder: StandardPaths.writableLocation(StandardPaths.DocumentsLocation)
}
