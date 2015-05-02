#ifndef OBJECT_H
#define OBJECT_H

#include <QObject>
#include <QDebug>

class Object : public QObject
{
    Q_OBJECT
public:
    explicit Object(QObject *parent = 0);

    Q_INVOKABLE QString getPreviousImage();
    Q_INVOKABLE QString getNextImage();
    
signals:
    
public slots:
    
};

#endif // OBJECT_H
