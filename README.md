![image](logo/kdkicon.png)

# KODAKA STUDIO

KODAKA is software for learning computer programming through a block language.

![image](logo/kodaka.png)
## About KODAKA

First unveiled at the Computer Days of the University of Kinshasa in 2017, KODAKA provides a programming interface and a language in the national language based on Google Blockly.

## Building

Starting from Qt 5.2, there is ```windeployqt``` tool you can use. Just run it from command line to get help. But basic usage is, give it the .exe file, it will copy Qt dependencies to go with it.

You will want to use ```--qmldir``` option to let the tool know where your QML files are, so it can figure out the needed QML dependencies.
### Note :
KODAKA uses Qt Webengine which is only compatible with MSVC ++ 2015-2019, make sure to use an MSVC compatible with your Qt version.
## Testing
to make sure you have everything, test in computer with no Qt SDK, or temporarily rename the Qt directory. 