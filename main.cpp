/*code from Qt template written by Jessy NDAYA */
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <qtwebenginecoreglobal.h>
#include <QtWebEngine>
#include "utily.h"
#include <QDebug>
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QCoreApplication::setApplicationName("Kodaka Studio");
    QCoreApplication::setApplicationVersion("1.0.1");
    QCoreApplication::setOrganizationName("Kodaka");
    QCoreApplication::setOrganizationDomain("cd.kodaka.rdc");
    QGuiApplication app(argc, argv);
    QtWebEngine::initialize();
    QQmlApplicationEngine engine;

    //register context in qml
    Utily utility(QCoreApplication::applicationDirPath());
    engine.rootContext()->setContextProperty("Utility", &utility);

    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;
    return app.exec();
}
