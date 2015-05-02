#include "object.h"
#include "globals.h"

static int state=0;

Object::Object(QObject *parent) :
    QObject(parent)
{
}

QString Object::getPreviousImage()
{
    if(state>0)
        state--;

    //return "http://www.vesta-tab.com/jo/getImage.php?id="+QString::number(state);
    //return "file:///home/jo/vesta/IMAGES/"+QString::number(state)+".jpg";

    return "file:"+imagesName[state];
}

QString Object::getNextImage()
{
    if(state<nbMessage-1)
        state++;


    //return "http://www.vesta-tab.com/jo/getImage.php?id="+QString::number(state);
    //return "file:///home/jo/vesta/IMAGES/"+QString::number(state)+".jpg";

    //qDebug() << "file://"+imagesName[state];
    //qDebug() << "nbMessage="+QString::number(nbMessage);
    //qDebug() << "state="+QString::number(state);


    return "file:"+imagesName[state];
}
