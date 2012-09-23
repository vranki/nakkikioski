// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    property string text: "NO_TEXT"
    property string fileToPlay: ""
    width: buttonLabel.width + video.width/20
    height: buttonLabel.height + video.height/20
    Rectangle {
        anchors.fill: parent
        color: "black"
        border.color: "white"
        border.width: 2
        radius: height/10
        opacity: 0.6
    }
    Text {
        id: buttonLabel
        text: parent.text
        color: "white"
        anchors.centerIn: parent
        font.pointSize: video.height/50
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            hideControlsTimer.restart()
            if(fileToPlay=="pause") {
                video.paused = !video.paused
                return
            }
            if(fileToPlay=="restart") {
                video.position = 0
                video.play()
                return
            }
            if(fileToPlay=="rewind") {
                video.position -= 15000
                return
            }
            if(fileToPlay=="fast_forward") {
                video.position += 15000
                return
            }
            video.stop()
            video.source = fileToPlay
            video.play()
            menu.state = "hidden"
        }
    }
}
