/* code whriten by jessy ndaya */
import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import "../Material" as Ma
import QtQuick.Window 2.2
import Qt.labs.platform 1.0
import "../Material/Tool" as Tl
import "MainApp.js" as Js
import Qt.labs.settings 1.0
import QtQml 2.12
ApplicationWindow {
    id:root
    visible: true
    width: 1000
    height: 700
    // flags: Qt.Popup
    // TODO: check the load configuration for open file loader
    Timer{
        running: !webengine.loading
        interval: 5000
        onTriggered: {
            if(Utility.argFile){
                root.currentFile = Utility.argFile;
                root.script = Utility.readFile(root.currentFile)
                Js.importKDKWorkSpace(root.script)
                welcomeDialog.close()
                fileAlreadyExits = true
            }
            stop();
        }
    }


    property string currentFile: "sans titre"
    property string script: ""
    property bool fileAlreadyExits: false
    property string currentFileRef:{ if(currentFile ==="sans titre") return saveState.recentFile
                                     else return currentFile
                                    }
    x : (Screen.width/2) - (width/2)
    y : 30
    title: qsTr(" - " + root.currentFile)
    Settings{
        id:saveState
        property alias recentFile:root.currentFileRef
    }

    // implement the backGround style and make the window more visible
    background: Rectangle{
        Image {
            anchors.fill: parent
            source: "../Material/Tool/deafault/bg.png"
        }
        color: "#efefef"
    }

    //the welcome window design and moving prospect
    Ma.OpenDialog{
        id:welcomeDialog
        x:(root.width/2)-200
        z:5
        btnNew.onClicked: {
            welcomeDialog.close()
        }
        btnOpen.onClicked: {
            if (webengine.loading) {
                error_label.text = "Attendez la fin chargement..."
                error_label.visible = true
                return
            }
            fileDialog.open()
        }
        btnRecent.onClicked: {
            if (webengine.loading) {
                error_label.text = "Attendez la fin chargement..."
                error_label.visible = true
            }
            else if(saveState.recentFile !== null){
                root.currentFile = saveState.recentFile
                root.script = Utility.readFile(saveState.recentFile)
                Js.loadWorkSpace(root.script)
                welcomeDialog.close()
                return
            }
            else error_label.visible = true


        }
        btnExemple.onClicked: {
            swipIndex = 1
        }
        back.onClicked: {
            swipIndex=0
        }
        exListe.onClicked: {
            getFileToReadAndPlay("Liste.kdk")
        }
        exMultiplication.onClicked:  {
            getFileToReadAndPlay("table_de_multiplication.kdk")
        }
        exDivers.onClicked: {
            getFileToReadAndPlay("divers.kdk")
        }
        exHelloWord.onClicked: {
            getFileToReadAndPlay("hello_kodaka.kdk")
        }
        exTabSin.onClicked: {
            getFileToReadAndPlay("table_de_sinus.kdk")
        }
        function getFileToReadAndPlay(file){
            if (webengine.loading) {
                error_label.text = "Attendez la fin chargement..."
                error_label.visible = true
            }
            else if(saveState.recentFile !== null){
                console.log(Utility.appDirLoc+"/exemples/"+file)
                root.script = Utility.readFile("file:///"+Utility.appDirLoc+"/exemples/"+file)
                Js.loadWorkSpace(root.script)
                welcomeDialog.close()
                return
            }
        }
    }

    // show the executable icon for lunshing, exe compile directorie
    Rectangle{
        id:exeDir
        width: 60
        height: width
        radius: width/2
        color:"#1fffa3"
        y: 10
        x:parent.width-width-10
        anchors.margins: 10
        state: "notCompile"
        Image {
            anchors.centerIn: parent
            fillMode: Image.PreserveAspectFit
            width: parent.width * .50
            height: parent.height*.50
            source: "../Material/Tool/deafault/exe_.png"
        }
        function show(){
            exeDir.visible = true;
            exeDir.state="compile";
        }
        function hide(){
            exeDir.visible = false;
        }
        Component.onCompleted: {
            hide();
            exeDir.state="notCompile";
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                Utility.showCompileExplorerDir();
            }
        }
        states: [
            State {
                name: "notCompile"
                PropertyChanges { target: exeDir; color: "#ff0e7f" }
            },
            State {
                name: "compile"
                PropertyChanges { target: exeDir; color: "#1fffa3" }
            }
        ]
        transitions: [
            Transition {
                from: "notCompile"
                to: "compile"
                ColorAnimation { target: exeDir; duration: 2000; easing.type: Easing.InBounce }
            },
            Transition {
                from: "compile"
                to: "notCompile"
                ColorAnimation { target: exeDir; duration: 100}
            }
        ]
    }

    // show the executable icon for lunshing, apk compile directorie
    Rectangle{
        id:apkDir
        width: 60
        height: width
        radius: width/2
        color:"#1fffa3"
        y: 10
        x:parent.width-width-10
        anchors.margins: 10
        visible: false
        state: "notCompile"
        Image {
            anchors.centerIn: parent
            fillMode: Image.PreserveAspectFit
            width: parent.width * .50
            height: parent.height*.50
            source: "../Material/Tool/deafault/Android_.png"
        }
        function show(){
            exeDir.visible = true;
            exeDir.state="compile";
        }
        function hide(){
            exeDir.state = "notCompile";
            exeDir.visible = false;
        }
        Component.onCompleted: {
            hide();
            exeDir.state="notCompile";
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                Utility.showCompileApkExplorerDir();
            }
        }
        states: [
            State {
                name: "notCompile"
                PropertyChanges { target: exeDir; color: "#ff0e7f" }
            },
            State {
                name: "compile"
                PropertyChanges { target: exeDir; color: "#1fffa3" }
            }
        ]
        transitions: [
            Transition {
                from: "notCompile"
                to: "compile"
                ColorAnimation { target: exeDir; duration: 2000; easing.type: Easing.InBounce }
            },
            Transition {
                from: "compile"
                to: "notCompile"
                ColorAnimation { target: exeDir; duration: 100}
            }
        ]
    }

    //plateform style file dialogue
    FileDialog{
        id:saveDialoge
        nameFilters: ['"Kodaka (*.kdk)"']
        fileMode: FileDialog.SaveFile
        folder: StandardPaths.writableLocation(StandardPaths.DocumentsLocation)
        onAccepted: {
           root.currentFile = currentFile
           webengine.file = currentFile
           Js.workToXML()
           fileAlreadyExits = true
        }
    }
    FileDialog{
        id:compileDialogue
        nameFilters: ['"Kodaka (*.exe)"']
        fileMode: FileDialog.SaveFile
        folder: StandardPaths.writableLocation(StandardPaths.DocumentsLocation)
        onAccepted: {
            //register the compile file name so to be ready to compile
            Utility.readyToCompileFile = currentFile;
            //register the javascipt file to compile with the kodaka file
            webengine.file = Utility.appDirLoc+"/platform/jscompile.js";
            //compile the javascript file and generate the windows's exe file
            Js.compileJS();
            //show the icon that visualize in the explorer file
            exeDir.show();
        }
    }
    FileDialogue{
        id:fileDialog
        onAccepted: {
            root.currentFile = currentFile
            root.script = Utility.readFile(root.currentFile)
            Js.loadWorkSpace(root.script)
            welcomeDialog.close()
            fileAlreadyExits = true
        }
    }
    FileDialogue{
        id:kdkImportFileDialog
        onAccepted: {
            root.script = Utility.readFile(currentFile)
            Js.importKDKWorkSpace(root.script)
        }
    }
    FileDialogue{
        id:jsExportFileDialog
        onAccepted: {
            webengine.file = currentFile
            Js.workToJs()
        }
    }
    FileDialog{
        id:saveJSDialogue
        nameFilters: ['"Kodaka (*.js)"']
        fileMode: FileDialog.SaveFile
        folder: StandardPaths.writableLocation(StandardPaths.DocumentsLocation)
        onAccepted: {
           webengine.file = currentFile
           Js.workToJs()
        }
    }
    FileDialog{
        id:savePythonDialogue
        nameFilters: ['"Kodaka (*.py)"']
        fileMode: FileDialog.SaveFile
        folder: StandardPaths.writableLocation(StandardPaths.DocumentsLocation)
        onAccepted: {
           webengine.file = currentFile
           Js.workToPython()
        }
    }
    FileDialog{
        id:savePHPDialogue
        nameFilters: ['"Kodaka (*.php)"']
        fileMode: FileDialog.SaveFile
        folder: StandardPaths.writableLocation(StandardPaths.DocumentsLocation)
        onAccepted: {
           webengine.file = currentFile
           Js.exportToPHP()
        }
    }
    FileDialog{
        id:androidCompileDialogue
        nameFilters: ['"Kodaka - Android (*.apk)"']
        fileMode: FileDialog.SaveFile
        folder: StandardPaths.writableLocation(StandardPaths.DocumentsLocation)
        onAccepted: {
            console.log(currentFile)
            webengine.file ="file:///"+ Utility.appDirLoc+"/build-tools/24.0.3/assets/compile.js"
            Js.workToJs();
            Utility.toAndroidApk(currentFile);
            apkDir.show()
        }
    }

    property bool isMax: false
    property string blockly:"../Block/AppCore/index.html"

    StackView {
        id: stack
        initialItem: loadingLogo
        anchors.fill: parent
    }

    /*implement the timer indicator to enter to the man app
     * show codaka groupe for any one who open the Application
     */
    Timer{
        id:timer
        interval: 4000
        running: true
        onTriggered: {
            stack.pop()
            stack.push(main)
            toolbar.visible = true
            webengine.open()
            if(welcomeDialog.visible === false){
                welcomeDialog.open()
            }
        }
    }

    // componant of every widget style and show the Application main (aka AppCore) and design
    Component{
        id:main
        Item{
            // Session Menu style
            Ma.SessionMenu{
                height: root.height
                x:0
                onNewClicked: {
                    currentFile = "sans titre"
                    Js.newProject()
                }
                onOpenClicked: {
                    Js.openProject()
                }
                onRunClicked: {
                    Js.runprograme()
                }
                onAndroidClicked: {
                    androidCompileDialogue.open()

                    apkDir.hide()
                    exeDir.hide()
                }

                onExeClicked: {
                    compileDialogue.open()
                    exeDir.hide()
                    apkDir.hide()
                }
                onSaveClicked:{
                    if(!fileAlreadyExits)
                    saveDialoge.open()
                    else {
                        root.currentFile = currentFile
                        webengine.file = currentFile
                        Js.workToXML()
                    }
                }
                onDebugCliked: {

                }
                onHelpClicked: {
                    stack.push(doc)
                    webengine.visible= false
                }
            }
            //loading resouce... engine is load
            Tl.LoaderDesign{
                visible: webengine.loading
            }
        }
    }

    // code implement applicatons main and studio :: the web engine view
    // cotent of the blockly workSpace
    Ma.WebEngineCorps{
        id:webengine
        width:root.width* 0.8
        height: root.height *0.85
        anchors.centerIn: parent
        url: root.blockly
        opacity: 0
        onLoadingProgressChanged: {
            if(loadingProgress>80 && !timer.running){
                welcomeDialog.open()
            }
        }


    }
    Component{
        id:loadingLogo
        Rectangle{
            color: "white"
            width: root.width
            height: root.height
            Image {
                source: "icons/logo kdk (2).png"
                anchors.centerIn: parent
                width: parent.width * 0.30
                height: parent.height * 0.30
                fillMode: Image.PreserveAspectFit
            }
        }
    }

    // implement the kodaka console
    KodakaConsole{
        id:consoles
        x: (root.width/2) - (width/2)
        y:(root.height/2) - (height/2)
        visible: false
        // function open cosole's window event handler
        function open(){
            visible = true
        }
    }
    onClosing: {
        console.log("the current file:   "+currentFile)
        if(currentFile==="sans titre"){
            currentFile = "file:///C:/tmp/enregistrement_automatique.kdk"
            webengine.file = "file:///C:/tmp/enregistrement_automatique.kdk"
            Js.workToXML()
        }
        else{
            currentFile = currentFile
            webengine.file = currentFile
            Js.workToXML()
        }
    }

    Component{
        id:doc
        Item{
            LicencingWindow{
                onBackClicked: {
                    stack.pop();
                }
            }
        }
    }

    // implente the codaka menu
    Ma.Menu{
        id:appMenu
        height: root.height
        onOpenClicked: {
            fileAlreadyExits = true
            appMenu.close()
            fileDialog.open()
        }
        onNewClicked: {
            fileAlreadyExits = false
            currentFile= "sans titre"
            Js.newProject()
        }
        onSaveClicked: {
            fileAlreadyExits = true
            appMenu.close()
            saveDialoge.open()
        }

        onKdkImportCliked: {
            appMenu.close()
            kdkImportFileDialog.open()
        }
        onPythonExportCliked: {
            appMenu.close()
            savePythonDialogue.open()
        }
        onJsExportCliked: {
            appMenu.close()
            saveJSDialogue.open()
        }
        onPhpExportCliked: {
            appMenu.close()
            savePHPDialogue.open()
        }
    }
    //implement the ToolBar that content minimize, maximum and close action
    header: ToolBar{
        id:toolbar
        visible: false
        Ma.ToolBar{
            width: parent.width
            height: parent.height
            window.onCloseCliked: {
               close()
            }
            window.onMaximizeCliked: {
                if(root.isMax){
                    root.showNormal()
                    root.isMax = false
                    return
                }
                root.isMax=true;
                root.showMaximized();

            }
            window.onMinimizeClicked: {
                root.showMinimized()
            }
        }

        Text {
            text: root.title
            color: "white"
            x:90
            font.pixelSize: 13
            anchors.verticalCenter: parent.verticalCenter
        }
        ToolButton{
            id:menu1
            Image {
                source: "../Material/Tool/deafault/menu.png"
                anchors.centerIn: parent
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                   appMenu.open()
                }
            }
        }
    }
}
