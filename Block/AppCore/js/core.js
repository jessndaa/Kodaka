/**
 * Created by Jessy NDAYA on 10/20/2017.
 */
function run() {
    var xml = Blockly.JavaScript.workspaceToCode(demoWorkspace)
    eval(xml);
}