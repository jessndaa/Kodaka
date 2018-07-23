/**
 * Created by jessy ndaya on 10/20/2017.
 */
var emojigenerate =(emoji)=>{
   return {
       "message0": "%1",
       "args0": [
           {
               "type": "field_image",
               "src": emoji,
               "colour": 160,
               "width": 20,
               "height": 20,
           },
       ],
       "output": "String",
       "colour": 350,
   }

}

var emojiFile = (file)=>{
    return {
        init: function() {
            this.jsonInit(emojigenerate("media/emoji/"+file+"_48px.png"));
            // Assign 'this' to a variable for use in the tooltip closure below.
            var thisBlock = this;
            this.setTooltip(function() {
                return 'emoji a utiliser';
            });
        }
    };
}

Blockly.Blocks['smile_emoji'] = emojiFile("Crazy")
Blockly.JavaScript['smile_emoji'] = function(block) {
    var code = "\"<emoji>surprise</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['pleure_emoji'] = emojiFile("Crying")
Blockly.JavaScript['pleure_emoji'] = function(block) {
    var code = "\"<emoji>pleure</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['nerd_emoji'] = emojiFile("Nerd")
Blockly.JavaScript['nerd_emoji'] = function(block) {
    var code = "\"<emoji>nerd</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['hear_emoji'] = emojiFile("Swearing Female")
Blockly.JavaScript['hear_emoji'] = function(block) {
    var code = "\"<emoji>hear</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['AgentSmith_emoji'] = emojiFile("Agent Smith")
Blockly.JavaScript['AgentSmith_emoji'] = function(block) {
    var code = "\"<emoji>AgnetSmith</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['Avatar_emoji'] = emojiFile("Avatar")
Blockly.JavaScript['Avatar_emoji'] = function(block) {
    var code = "\"<emoji>Avatar</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['Boxing_emoji'] = emojiFile("Boxing 2")
Blockly.JavaScript['Boxing_emoji'] = function(block) {
    var code = "\"<emoji>Boxing</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['Brain_emoji'] = emojiFile("Brain")
Blockly.JavaScript['Brain_emoji'] = function(block) {
    var code = "\"<emoji>Brain</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['Breastfeeding_emoji'] = emojiFile("Breastfeeding")
Blockly.JavaScript['Breastfeeding_emoji'] = function(block) {
    var code = "\"<emoji>Breastfeeding</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['Bride_emoji'] = emojiFile("Bride")
Blockly.JavaScript['Bride_emoji'] = function(block) {
    var code = "\"<emoji>Bride</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['Controller_emoji'] = emojiFile("Controller")
Blockly.JavaScript['Controller_emoji'] = function(block) {
    var code = "\"<emoji>Controller</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['Cool_emoji'] = emojiFile("cool")
Blockly.JavaScript['Cool_emoji'] = function(block) {
    var code = "\"<emoji>Cool</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['Corgi_emoji'] = emojiFile("Corgi")
Blockly.JavaScript['Corgi_emoji'] = function(block) {
    var code = "\"<emoji>Corgi</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['Crazy_emoji'] = emojiFile("Crazy")
Blockly.JavaScript['Crazy_emoji'] = function(block) {
    var code = "\"<emoji>Crazy</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['Crying_emoji'] = emojiFile("Crying")
Blockly.JavaScript['Crying_emoji'] = function(block) {
    var code = "\"<emoji>Crying</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['DateManWoman_emoji'] = emojiFile("Date Man Woman")
Blockly.JavaScript['DateManWoman_emoji'] = function(block) {
    var code = "\"<emoji>DateManWoman</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['DJ_emoji'] = emojiFile("DJ")
Blockly.JavaScript['DJ_emoji'] = function(block) {
    var code = "\"<emoji>DJ</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['Evil_emoji'] = emojiFile("Evil")
Blockly.JavaScript['Evil_emoji'] = function(block) {
    var code = "\"<emoji>Evil</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['Folder_emoji'] = emojiFile("Folder")
Blockly.JavaScript['Folder_emoji'] = function(block) {
    var code = "\"<emoji>Folder</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['FortuneTeller_emoji'] = emojiFile("Fortune Teller")
Blockly.JavaScript['FortuneTeller_emoji'] = function(block) {
    var code = "\"<emoji>Fortune</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['FrankensteinsMonster_emoji'] = emojiFile("Frankensteins Monster")
Blockly.JavaScript['FrankensteinsMonster_emoji'] = function(block) {
    var code = "\"<emoji>FrankensteinsMonster</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['FsocietyMask_emoji'] = emojiFile("Fsociety Mask")
Blockly.JavaScript['FsocietyMask_emoji'] = function(block) {
    var code = "\"<emoji>FsocietyMask</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['Geisha_emoji'] = emojiFile("Geisha")
Blockly.JavaScript['Geisha_emoji'] = function(block) {
    var code = "\"<emoji>Geisha</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['Groom_emoji'] = emojiFile("Groom")
Blockly.JavaScript['Groom_emoji'] = function(block) {
    var code = "\"<emoji>Groom</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['Guest_emoji'] = emojiFile("Guest")
Blockly.JavaScript['Guest_emoji'] = function(block) {
    var code = "\"<emoji>Guest</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['GuestFemale_emoji'] = emojiFile("Guest Female")
Blockly.JavaScript['GuestFemale_emoji'] = function(block) {
    var code = "\"<emoji>GuestFemale</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['HandCursor_emoji'] = emojiFile("Hand Cursor")
Blockly.JavaScript['HandCursor_emoji'] = function(block) {
    var code = "\"<emoji>Breastfeeding</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['Happy_emoji'] = emojiFile("Happy")
Blockly.JavaScript['Happy_emoji'] = function(block) {
    var code = "\"<emoji>Happy</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['Hearing_emoji'] = emojiFile("Hearing")
Blockly.JavaScript['Hearing_emoji'] = function(block) {
    var code = "\"<emoji>Hearing</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['HeartWithArrow_emoji'] = emojiFile("Heart With Arrow")
Blockly.JavaScript['HeartWithArrow_emoji'] = function(block) {
    var code = "\"<emoji>HeartWithArrow</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['InLove_emoji'] = emojiFile("In Love")
Blockly.JavaScript['InLove_emoji'] = function(block) {
    var code = "\"<emoji>InLove</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['Jumper_emoji'] = emojiFile("Jumper")
Blockly.JavaScript['Jumper_emoji'] = function(block) {
    var code = "\"<emoji>Jumper</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['Kiss_emoji'] = emojiFile("Kiss")
Blockly.JavaScript['Kiss_emoji'] = function(block) {
    var code = "\"<emoji>Kiss</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['LikeFilled_emoji'] = emojiFile("Like Filled")
Blockly.JavaScript['LikeFilled_emoji'] = function(block) {
    var code = "\"<emoji>LikeFilled</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['LikeIt_emoji'] = emojiFile("Like It")
Blockly.JavaScript['LikeIt_emoji'] = function(block) {
    var code = "\"<emoji>LikeIt</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['Linux_emoji'] = emojiFile("Linux")
Blockly.JavaScript['Linux_emoji'] = function(block) {
    var code = "\"<emoji>Lunix</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['LOL_emoji'] = emojiFile("LOL")
Blockly.JavaScript['LOL_emoji'] = function(block) {
    var code = "\"<emoji>LOL</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['MentalState_emoji'] = emojiFile("Mental State")
Blockly.JavaScript['MentalState_emoji'] = function(block) {
    var code = "\"<emoji>MentalState</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['Mime_emoji'] = emojiFile("Mime")
Blockly.JavaScript['Mime_emoji'] = function(block) {
    var code = "\"<emoji>Mine</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['MouseRightClick_emoji'] = emojiFile("Mouse Right Click")
Blockly.JavaScript['MouseRightClick_emoji'] = function(block) {
    var code = "\"<emoji>MouseRightClick</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['Pig_emoji'] = emojiFile("Pig")
Blockly.JavaScript['Pig_emoji'] = function(block) {
    var code = "\"<emoji>Pig</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['Pokemon_emoji'] = emojiFile("Pokemon")
Blockly.JavaScript['Pokemon_emoji'] = function(block) {
    var code = "\"<emoji>Pokemon</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['Print_emoji'] = emojiFile("Print")
Blockly.JavaScript['Print_emoji'] = function(block) {
    var code = "\"<emoji>Print</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['Python_emoji'] = emojiFile("Python")
Blockly.JavaScript['Python_emoji'] = function(block) {
    var code = "\"<emoji>Python</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['Question_emoji'] = emojiFile("Question")
Blockly.JavaScript['Question_emoji'] = function(block) {
    var code = "\"<emoji>Question</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['Save_emoji'] = emojiFile("Save")
Blockly.JavaScript['Save_emoji'] = function(block) {
    var code = "\"<emoji>Save</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['Silent_emoji'] = emojiFile("Silent")
Blockly.JavaScript['Silent_emoji'] = function(block) {
    var code = "\"<emoji>Silent</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['Sleep_emoji'] = emojiFile("Sleep")
Blockly.JavaScript['Sleep_emoji'] = function(block) {
    var code = "\"<emoji>Breastfeeding</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['SteveJobs_emoji'] = emojiFile("Steve Jobs")
Blockly.JavaScript['SteveJobs_emoji'] = function(block) {
    var code = "\"<emoji>SteveJobs</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['Tango_emoji'] = emojiFile("Tango")
Blockly.JavaScript['Tango_emoji'] = function(block) {
    var code = "\"<emoji>Tango</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['UnderComputer_emoji'] = emojiFile("Under Computer")
Blockly.JavaScript['UnderComputer_emoji'] = function(block) {
    var code = "\"<emoji>UnderComputer</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['USBDisconnected_emoji'] = emojiFile("USB Disconnected")
Blockly.JavaScript['USBDisconnected_emoji'] = function(block) {
    var code = "\"<emoji>USBDisconnected</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['USBOff_emoji'] = emojiFile("USB Off")
Blockly.JavaScript['USBOff_emoji'] = function(block) {
    var code = "\"<emoji>USBOff</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['Vampire_emoji'] = emojiFile("Vampire")
Blockly.JavaScript['Vampire_emoji'] = function(block) {
    var code = "\"<emoji>Vampire</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['VenomHead_emoji'] = emojiFile("Venom Head")
Blockly.JavaScript['VenomHead_emoji'] = function(block) {
    var code = "\"<emoji>VenomHead</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['WatchTVinBed_emoji'] = emojiFile("Watch TV in Bed")
Blockly.JavaScript['WatchTVinBed_emoji'] = function(block) {
    var code = "\"<emoji>WatchTVinBed</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['Windows_emoji'] = emojiFile("Windows")
Blockly.JavaScript['Windows_emoji'] = function(block) {
    var code = "\"<emoji>Windows</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['Wink_emoji'] = emojiFile("Wink")
Blockly.JavaScript['Wink_emoji'] = function(block) {
    var code = "\"<emoji>Wink</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['Workstation_emoji'] = emojiFile("Workstation")
Blockly.JavaScript['Workstation_emoji'] = function(block) {
    var code = "\"<emoji>Workstation</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};

Blockly.Blocks['Zombie_emoji'] = emojiFile("Zombie")
Blockly.JavaScript['Zombie_emoji'] = function(block) {
    var code = "\"<emoji>Zombie</emoji>\"";
    return [code, Blockly.JavaScript.ORDER_MEMBER];
};


//////////////////////////////////////////////////////////////////////////////////
