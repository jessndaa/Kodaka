/**
 * Created by Jessy NDAYA on 11/12/2017.
 */
let socket = io('http://192.168.173.1:6687')
var secondaryEvent;
var json;
workSpace.addChangeListener(onWorkSpaceChange);
socket.on('modify', (data)=>{
    console.log(data);
    workSpace.removeChangeListener(onWorkSpaceChange);
    var secondaryEvent = Blockly.Events.fromJson(data, workSpace);
    secondaryEvent.run(true);
    socket.emit('data_sent');
})

socket.on('data_sent',()=>{
    workSpace.addChangeListener(onWorkSpaceChange);
})

// Convert JSON back into an event, then execute it.
function onWorkSpaceChange(event) {
    if (event.type === Blockly.Events.UI) {
        return;  // Don't mirror UI events.
    }
    // Convert event to JSON.  it could  be transmitted a cross computer.
    json = event.toJson();
    socket.emit('wschange',json)
}
