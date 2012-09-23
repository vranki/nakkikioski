import Qt 4.7
import QtMultimediaKit 1.1
Rectangle {
    color: "black"
    width : 800
    height : 600

    Video {
        id: video
        anchors.fill: parent
        onStatusChanged: {
            if(status==Video.EndOfMedia) {
                video.play()
            }
        }

        Menu {
            id: menu
            z: 100
        }
        VideoControls {
            id: videoControls
            z: 100
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                menu.state = "displayed"
                videoControls.state = "displayed"
                hideControlsTimer.start()
            }
        }
        Timer {
            id: hideControlsTimer
            interval: 5000
            repeat: false
            onTriggered:  {
                videoControls.state = "hidden"
                menu.state = "hidden"
            }
        }

        focus: true
        Keys.onSpacePressed: video.paused = !video.paused
        Keys.onLeftPressed: video.position -= 5000
        Keys.onRightPressed: video.position += 5000
        Keys.onEscapePressed: Qt.quit()
        Component.onCompleted: menu.state = "displayed"
    }
}
