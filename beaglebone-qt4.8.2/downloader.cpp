

#include "downloader.h"
#include "globals.h"


Downloader::Downloader(QObject *parent) :
    QObject(parent)
{
}

void Downloader::doDownload(QString url)
{
    manager = new QNetworkAccessManager(this);

    connect(manager, SIGNAL(finished(QNetworkReply*)),
            this, SLOT(replyFinished(QNetworkReply*)));

    manager->get(QNetworkRequest(QUrl(url)));

}

void Downloader::replyFinished (QNetworkReply *reply)
{
    if(reply->error())
    {
        qDebug() << "ERROR!";
        qDebug() << reply->errorString();
    }
    else
    {
        QString datas=reply->readAll();
        QTextStream idStream(&datas);


        qDebug() << datas;
        int i=0;

        while(!idStream.atEnd())
        {
            idStream >> messageId[i];
            qDebug() << messageId[i];
            i++;
        }

        nbMessage=i-1;



        QDir::setCurrent("./IMAGES");

        //qDebug() << QDir::currentPath();

        for(i=0;i<nbMessage;i++)
        {
            //image = imagePath.absolutePath()+ "/" + "1.jpg"; //QString(messageId[i])
            image.setFileName(QString::number(messageId[i]) + ".jpg");

            imagesName[i]=QDir::currentPath() + "/" + image.fileName();

            //qDebug() << imagesName[i];


            if(!image.exists())
            {
                qDebug() << "No image called" << image.fileName();

                image_download[i].doImageDownload("http://www.vesta-tab.com/jo/getImage.php?id=", messageId[i]);
            }
            else
            {
                qDebug() << "image called" << image.fileName() << "exists";
            }
        }
    }

    reply->deleteLater();

}
