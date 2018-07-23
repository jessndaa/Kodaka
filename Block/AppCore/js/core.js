/**
 * Created by Jessy NDAYA on 10/20/2017.
 */

const RUN_PROGRAME      = 0x000001
const WORKSPACE         = 0x000002
const WORKSPACEtoJS     = 0x000003
const COMPILEJS         = 0x000004
const WORKSPACEtoPython = 0x000005
const WORKSPACEtoPHP    = 0x000006
const WORKSPACEtoJSAndroid   = 0x000007

function run() {
    var script = Blockly.JavaScript.workspaceToCode(workSpace);
    console.log(JSON.parse(toQuery(RUN_PROGRAME, script)).text)
    console.log(toQuery(RUN_PROGRAME, script));
}

function getWorkSpaceText() {
    console.log(toQuery(WORKSPACE,generateXml()))
}

function laoadWorkSpace(script){
    realoadWorkSpace()
    script = decodeURI(script)
    var xml = Blockly.Xml.textToDom(script)
    Blockly.Xml.domToWorkspace(xml, workSpace)
}

function importWorkSpace(script) {
    script = decodeURI(script)
    var xml = Blockly.Xml.textToDom(script)
    Blockly.Xml.domToWorkspace(xml, workSpace)
}

function exportToJSCode() {
    var script = Blockly.JavaScript.workspaceToCode(workSpace);
    console.log(toQuery(WORKSPACEtoJS,script))
}
function exportToJSCodeAndroid() {
    var script = Blockly.JavaScript.workspaceToCode(workSpace);
    console.log(toQuery(WORKSPACEtoJSAndroid,script))
}

function exportToPython() {
    var script = Blockly.Python.workspaceToCode(workSpace);
    console.log(toQuery(WORKSPACEtoPython,script))
}

function exportToPHP() {
    var script = Blockly.PHP.workspaceToCode(workSpace);
    console.log(toQuery(WORKSPACEtoPHP,script))
}

function CompileJS() {
    var script = Blockly.JavaScript.workspaceToCode(workSpace);
    console.log(toQuery(COMPILEJS,script))
}



function generateXml() {
    var xmlDom = Blockly.Xml.workspaceToDom(workSpace)
    var xmlText = Blockly.Xml.domToPrettyText(xmlDom)
    return xmlText
}

function realoadWorkSpace() {
    workSpace.clear()
}

function toQuery(type, text) {
    var query = {type:type, text:text}
    return JSON.stringify(query)
}
