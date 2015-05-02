#include <QApplication>
#include <QDeclarativeContext>
#include <QtDeclarative>
#include "qmlapplicationviewer.h"
#include "object.h"
#include "downloader.h"





Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));

    QmlApplicationViewer viewer;



    //system("sudo ifup wlan0");

     Downloader d;
     d.doDownload("http://www.vesta-tab.com/jo/showId.php");

    Object data;

    viewer.setCursor(Qt::BlankCursor);
    viewer.rootContext()->setContextProperty("image", &data);

    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    //viewer.setMainQmlFile("qrc:/main.qml");
    viewer.setSource(QUrl("qrc:/qml/BBB/main.qml"));
    viewer.showFullScreen();

    return app->exec();
}
