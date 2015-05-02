// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1


Rectangle {
    id: rectangle3
    width: 400
    height: 400
    color: "#343434"

    Image {
        id: image1
        anchors.left: parent.left
        anchors.leftMargin: 79
        anchors.right: parent.right
        anchors.rightMargin: 80
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        source: "file:IMAGES/vesta.png"
    }

    Rectangle {
        id: rectangle1
        x: 19
        y: 142
        width: 51
        height: 116
        color: "#343434"
        anchors.left: parent.left
        anchors.leftMargin: 19
        anchors.verticalCenter: parent.verticalCenter

        MouseArea {
            id: mouse_area1
            x: 0
            y: 0
            width: 51
            height: 264
            anchors.topMargin: 0
            anchors.fill: parent
            onClicked: image1.source=image.getPreviousImage()

            Text {
                id: text1
                text: qsTr("<")
                anchors.fill: parent
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 30
            }
        }
    }

    Rectangle {
        id: rectangle2
        x: 337
        y: 142
        width: 51
        height: 116
        color: "#343434"
        anchors.right: parent.right
        anchors.rightMargin: 12
        anchors.verticalCenter: parent.verticalCenter
        MouseArea {
            id: mouse_area2
            anchors.fill: parent
            onClicked: image1.source=image.getNextImage()

            Text {
                id: text2
                x: -1
                y: 7
                color: "#000000"
                text: qsTr(">")
                font.pixelSize: 30
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
    }
}
