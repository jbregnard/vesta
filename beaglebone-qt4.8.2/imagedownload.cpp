

#include "imagedownload.h"

imageDownload::imageDownload(QObject *parent) :
    QObject(parent)
{
}

void imageDownload::doImageDownload(QString url, int image_id)
{
    image_name= QString::number(image_id);

    manager = new QNetworkAccessManager(this);

    connect(manager, SIGNAL(finished(QNetworkReply*)),
            this, SLOT(replyFinished(QNetworkReply*)));

    manager->get(QNetworkRequest(QUrl(url + image_name)));

    qDebug() << "Start download!";
}

void imageDownload::replyFinished (QNetworkReply *reply)
{
    if(reply->error())
    {
        qDebug() << "ERROR!";
        qDebug() << reply->errorString();
    }
    else
    {
        QFile *file = new QFile("/home/jo/vesta/IMAGES/" + image_name + ".jpg");
        if(file->open(QFile::WriteOnly))
        {
            file->write(reply->readAll());
            file->flush();
            file->close();
        }
        delete file;

    }

    qDebug() << "Download finished!";

    reply->deleteLater();

}

