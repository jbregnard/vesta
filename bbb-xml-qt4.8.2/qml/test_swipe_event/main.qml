import QtQuick 1.1


Rectangle {
    id: mainWindow
    width: 800; height: 480
    color: "black"

    XmlListModel {
        id: test
        source: "http://www.vesta-tab.com/jo/test_xml.php"
        query: "/vesta/item"

        XmlRole { name: "title"; query: "title/string()"}
        XmlRole { name: "img"; query: "image/string()"}
        XmlRole { name: "message"; query: "message/string()"}
        XmlRole { name: "date"; query: "date/string()"}
    }

    Component {
        id: messDelegate
        Item {
            width: mainWindow.width; height: mainWindow.height-80
            Column {
                Image {width:mainWindow.width; height:(mainWindow.height-80)*0.8; fillMode: Image.PreserveAspectFit; source:  img}
                Text {width:mainWindow.width; height:(mainWindow.height-80)*0.1; color:"white";font.pointSize: 24;horizontalAlignment:Text.AlignHCenter; text:date}
                Text {width:mainWindow.width; height:(mainWindow.height-80)*0.1; color:"red";font.pointSize: 24;horizontalAlignment:Text.AlignHCenter; text:message}
            }
        }
    }

    Column
    {
        Rectangle {
            id: mainBar
            width: mainWindow.width; height: 80
            color: "gray"

            Image {
                id: refresh
                x: 0
                y: 0
                width: 80
                height: 80
                fillMode: Image.PreserveAspectFit
                source: "file://home/jo/IMAGES/refresh.png"

                MouseArea {
                    id: refreshButton
                    anchors.fill: parent
                    onClicked: test.reload()
                }
            }

            Image {
                id: battery
                x: mainWindow.width - 80
                y: 20
                width: 60
                height: 40
                fillMode: Image.PreserveAspectFit
                source: "file://home/jo/IMAGES/full-battery_design.png"
            }

            Image {
                id: wifi
                x: mainWindow.width - 150
                y: 20
                width: 60
                height: 40
                fillMode: Image.PreserveAspectFit
                source: "file://home/jo/IMAGES/wifi_logo.png"
            }

        }

         ListView {
            id: list
            width: mainWindow.width; height: mainWindow.height-80
            model: test//ContactModel {}
            delegate: messDelegate
            highlightRangeMode: ListView.StrictlyEnforceRange
            orientation: Qt.Horizontal
            snapMode: ListView.SnapOneItem

        }
    }
}
