#ifndef DOWNLOADER_H
#define DOWNLOADER_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QUrl>
#include <QDateTime>
#include <QFile>
#include <QDebug>
#include <QDir>
#include <QString>
#include "imagedownload.h"


class Downloader : public QObject
{
    Q_OBJECT
public:
    explicit Downloader(QObject *parent = 0);

    void doDownload(QString url);
    bool newMessage;
    int messageId[100];
    //int nbMessage=0;
    //QString imagesName[100];

signals:
    void signalImagesName(const QString &text);

public slots:
    void replyFinished (QNetworkReply *reply);

private:
    QNetworkAccessManager *manager;
    QDir imagePath;
    QFile image;
    imageDownload image_download[100];

};

#endif // DOWNLOADER_H

