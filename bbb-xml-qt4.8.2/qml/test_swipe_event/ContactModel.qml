import QtQuick 1.1

XmlListModel {
    id: feedModel
    source: "http://www.vesta-tab.com/jo/test_xml.php"
    query: "/vesta/item"

    XmlRole { name: "title"; query: "title/string()" }
    XmlRole { name: "img"; query: "image/string()" }
    XmlRole { name: "message"; query: "message/string()" }
}
