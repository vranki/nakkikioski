// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

ListView {
    state: "hidden"
    width: parent.width
    height: parent.height
    y: video.height/100
    spacing: video.height/50
    model: filesModel

    function cleanupFilename(name) {
        name = name.substring(0, name.indexOf('.'))
        name = name.replace("_", " ")
        return name
    }

    delegate: Button {
        text: cleanupFilename(modelData)
        fileToPlay: filesRoot + "/" + modelData
    }
    states: [ State {
        name: "displayed"
        PropertyChanges { target: menu; x: video.width/100; }
    },
    State {
        name: "hidden"
        PropertyChanges { target: menu; x: -menu.width; }
    }]

    transitions: Transition {
        NumberAnimation { properties: "x"; easing.type: Easing.InOutQuad }
    }
}
