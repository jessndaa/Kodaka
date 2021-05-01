/*code from Qt template written by Jessy NDAYA */
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <qtwebenginecoreglobal.h>
#include <QtWebEngine>
#include "utily.h"
#include <QDebug>
#include <iostream>
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QCoreApplication::setApplicationName("Kodaka Studio");
    QCoreApplication::setApplicationVersion("1.0.1");
    QCoreApplication::setOrganizationName("Kodaka");
    QCoreApplication::setOrganizationDomain("cd.kodaka.rdc");
    QGuiApplication app(argc, argv);
    QtWebEngine::initialize();
    std::cout<<" std: " << QString::fromUtf8(argv[1]).toStdString();
    QQmlApplicationEngine engine;
    //register context in qml
    Utily utility(QCoreApplication::applicationDirPath());
    engine.rootContext()->setContextProperty("Utility", &utility);
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;
    if(!QString::fromUtf8(argv[1]).isEmpty()) utility.loadArgFile(QString::fromUtf8(argv[1]));
    return app.exec();
}
