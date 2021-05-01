/**
 * Created by Jessy NDAYA on 8/20/2017.
 * last update 10/20/2017.
 */
.import QtQuick 2.7 as Qt

var RUN_PROGRAME        = 0x000001
var WORKSPACE           = 0x000002
var WORKSPACEtoJS       = 0x000003
var COMPILEJS           = 0x000004
var WORKSPACEtoPythons  = 0x000005
var WORKSPACEtoPHP      = 0x000006
var WORKSPACEtoJSAndroid =0x000007
// this part of code transform blockly workspace to xml code, send the code to the web engine
// and open the KODAKA console
function runprograme(){
    webengine.engine.runJavaScript("run();",function(request){});
    consoles.open()
}

// load the runprograme() execute in the KODAKA console
function playJS(message){
    if(message==="") return;
    else {
        consoles.consoleEngine.runJavaScript("run(\""+ encodeURI(message) +"\");",function(request){});
    }
}

// initialize and load the new project template
function newProject(){
    webengine.engine.runJavaScript("realoadWorkSpace()",function(request){})
}

// this part of code open the file dialogue so that we can load new project(and load the WORKSPACE)
function openProject(){
    fileDialog.open()
}

function loadWorkSpace(script){
    webengine.engine.runJavaScript("laoadWorkSpace(\""+ encodeURI(script) +"\");",function(request){});
}

function importKDKWorkSpace(script){
    webengine.engine.runJavaScript("importWorkSpace(\""+ encodeURI(script) +"\");",function(request){});
}

// convert the WORKSPACE to js
function workToJs(){
     webengine.engine.runJavaScript("exportToJSCode()",function(request){})
}

function exportToJSCodeAndroid(){
     webengine.engine.runJavaScript("exportToJSCodeAndroid()",function(request){})
}

// convert the WORKSPACE to xml so that we can serialize in the kdk form
function workToXML(){
     webengine.engine.runJavaScript("getWorkSpaceText()",function(request){})
}

//this function get the source code and compile that in the Kodaka moc_change_to_js form
function compileJS(){
    webengine.engine.runJavaScript("CompileJS()",function(request){})
}

function workToPython(){
    webengine.engine.runJavaScript("exportToPython()",function(request){})
}
function exportToPHP(){
    webengine.engine.runJavaScript("exportToPHP()",function(request){})
}

// execute the web engine query
// the web engine query
// bundle the code to a simple JSON object that we can  manupilate easly for fetching c++ action
// the querry come as {type:Number, text:String}
// the text content the WorkSpace text and type content as query's type
// implemented in line 7-13
function runQuery(file, query){
    switch(query.type){
    case RUN_PROGRAME:
        playJS(query.text)
        break;
    case WORKSPACE:
        Utility.saveFile(file, query.text)
        break;
    case WORKSPACEtoJS:
        Utility.saveFile(file, query.text)
        break;
    case WORKSPACEtoPythons:
        var pyEncodingCode = "# -*- coding: utf-8 -*- \n" + query.text
        Utility.saveFile(file, pyEncodingCode)
        break;
    case WORKSPACEtoPHP:
        var queryText = "<?php \n" + query.text +" \n?>"
        Utility.saveFile(file, queryText)
        break;
    case COMPILEJS:
        Utility.saveToComplile(file, query.text)
        break;
    default:
        console.log('ERROR_CODE=>0x0001E0','Query don\'t match....')
        break;
    }
}
