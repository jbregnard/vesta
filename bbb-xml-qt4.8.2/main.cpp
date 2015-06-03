#include "qtquick1applicationviewer.h"
#include <QApplication>


int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QtQuick1ApplicationViewer viewer;
    viewer.setCursor(Qt::BlankCursor);
    viewer.addImportPath(QLatin1String("modules"));
    viewer.setOrientation(QtQuick1ApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String("qml/test_swipe_event/main.qml"));
    viewer.showFullScreen();

    return app.exec();
}
