#include "utily.h"
#include <QFile>
#include <QTextStream>
#include <QDebug>
#include <QDir>
#include <QFile>
#include <QDirIterator>
#include <QProcess>
#include <QDir>
Utily::Utily(QObject *parent) : QObject(parent)
{

}

Utily::Utily(QString appDirNam)
{
    _appDirLoc = appDirNam;
    _appDirName = appDirNam;
    qDebug()<<_appDirName;
}

QString Utily::readFile(const QString& file){
    auto url =  resolveUrl(file);
    QFile fileFetch(url);
          if (!fileFetch.open(QIODevice::ReadOnly | QIODevice::Text))
              return QString("");
    QTextStream in(&fileFetch);
    QString line;
    while (!in.atEnd()) {
      line += in.readLine();
    }
    return line;
}


void Utily::saveFile(const QString &file,const QString& data)
{
    auto url =  resolveUrl(file);
    QFile fileFetch(url);
    if (!fileFetch.open(QIODevice::WriteOnly | QIODevice::Text))
        return;

    QTextStream out(&fileFetch);
    out<<data;
}

void Utily::compileApp(const QString& AppName)
{
    qDebug()<<"begin to compile.....";
    //this part resolve the app dir and the app name
    QFileInfo info(resolveUrl(AppName));
    _exeCompileInfo = info;
    auto exeName = info.fileName();

    auto exeDir = info.path();

    QDir dir;
    QDir dirToCopy;

    const auto AppDir = _appDirName+"/platform";
    QDir::setCurrent(AppDir);
    auto allFilesAndDirs = dir.entryInfoList(QDir::Files);
    dirToCopy.cd(exeDir);
    foreach (const auto& el, allFilesAndDirs) {
            qDebug()<<"name: "<<el.fileName()<<"size: "<<el.size();
            QFile::copy(el.absoluteFilePath(),exeDir+"//"+el.fileName());
    }
    dirToCopy.rename("untitled4.exe",exeName);
}

void Utily::saveToComplile(const QString &file,const QString& data)
{

    QFile fileFetch(file);
    if (!fileFetch.open(QIODevice::WriteOnly | QIODevice::Text))
        return;
    fileFetch.write(data.toUtf8());
    fileFetch.close();
    compileApp(_readyToCompileFile);
}

void Utily::toAndroidApk(const QString & apk)
{
    auto url =  resolveUrl(apk);
    _apkCompileInfo = QFileInfo(url);
    QProcess apkProcess;
    QDir::setCurrent(_appDirName+"/build-tools/24.0.3/");
    apkProcess.execute(_appDirName+"/build-tools/24.0.3/aapt.exe", QStringList() <<"remove"
                                                                   <<"-v"
                                                                    <<"app-debug.apk"
                                                                    <<"assets/compile.js");
    apkProcess.execute(_appDirName+"/build-tools/24.0.3/aapt.exe", QStringList() <<"add"
                                                                   <<"-v"
                                                                    <<"app-debug.apk"
                                                                    <<"assets/compile.js");
    apkProcess.execute(_appDirName+"/build-tools/24.0.3/zipalign.exe", QStringList()
                                                                    <<"100"
                                                                    <<"app-debug.apk"
                                                                    <<url);

}

// the function show the executable director by lunshing cmd command prompt
void Utily::showCompileExplorerDir()
{
    QProcess exeProcess;
    QDir::setCurrent(_exeCompileInfo.absoluteDir().absolutePath());
    exeProcess.execute("explorer.exe",QStringList()<<".");
}

void Utily::showCompileApkExplorerDir()
{
    QProcess exeProcess;
    QDir::setCurrent(_apkCompileInfo.absoluteDir().absolutePath());
    exeProcess.execute("explorer.exe",QStringList()<<".");
}
QString Utily::resolveUrl(QString url){
    QString cleannd = "";
    for(auto i = 8; i< url.length();i++)
        cleannd.append(url[i]);
    return cleannd;
}
