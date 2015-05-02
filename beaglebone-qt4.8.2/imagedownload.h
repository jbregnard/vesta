#ifndef IMAGEDOWNLOAD_H
#define IMAGEDOWNLOAD_H

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


class imageDownload : public QObject
{
    Q_OBJECT
public:
    explicit imageDownload(QObject *parent = 0);

    void doImageDownload(QString url, int image_id);

signals:

public slots:
    void replyFinished (QNetworkReply *reply);

private:
    QNetworkAccessManager *manager;
    QDir imagePath;
    QFile image;
    QString image_name;

};

#endif // IMAGEDOWNLOAD_H

