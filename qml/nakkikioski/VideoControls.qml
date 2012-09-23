// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    state: "hidden"
    anchors.bottom: video.bottom
    anchors.horizontalCenter: video.horizontalCenter
    width: buttonRow.width
    height: buttonRow.height
    visible: video.hasVideo
    opacity: 1


    Row {
        id: buttonRow
        spacing: video.width/10
        Button {
            text: "|◀"
            fileToPlay: "restart"
        }
        Button {
            text: "⟪"
            fileToPlay: "rewind"
        }
        Button {
            text: video.paused ? "▶" : "‖"
            fileToPlay: "pause"
        }
        Button {
            text: "⟫"
            fileToPlay: "fast_forward"
        }
    }
    states: [ State {
        name: "displayed"
        PropertyChanges { target: videoControls; opacity: 1; }
    },
    State {
        name: "hidden"
        PropertyChanges { target: videoControls; opacity: 0; }
    }]

    transitions: Transition {
        NumberAnimation { properties: "opacity"; easing.type: Easing.InOutQuad }
    }
}
