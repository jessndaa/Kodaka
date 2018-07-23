#ifndef UTILY_H
#define UTILY_H

#include <QObject>
#include <QString>
#include <QFileInfo>
class Utily : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString appDirLoc READ appDirLoc WRITE setAppDirLoc NOTIFY appDirLocChanged)
    Q_PROPERTY(QString readyToCompileFile READ readyToCompileFile WRITE setReadyToCompileFile NOTIFY readyToCompileFileChanged)

public:
    explicit Utily(QObject *parent = nullptr);
    Utily(QString appDirName);
    Q_INVOKABLE QString readFile(const QString& file);
    Q_INVOKABLE void saveFile(const QString& file, const QString &data);
    Q_INVOKABLE void compileApp(const QString&);
    Q_INVOKABLE void saveToComplile(const QString &file,const QString& data);
    Q_INVOKABLE void toAndroidApk(const QString&);
    Q_INVOKABLE void showCompileExplorerDir();
    Q_INVOKABLE void showCompileApkExplorerDir();

    ~Utily(){

    }
    QString resolveUrl(QString url);

    QString readyToCompileFile()const{
       return _readyToCompileFile;
    }
    void setReadyToCompileFile(const QString& infoChek){
        _readyToCompileFile = infoChek;
        emit readyToCompileFileChanged();
    }

    QString appDirLoc()const{
        return _appDirLoc;
    }
    void setAppDirLoc(QString& newDir){
        _appDirLoc = newDir;
        emit appDirLocChanged();
    }

signals:
    void appDirLocChanged();
    void readyToCompileFileChanged();
public slots:
private :
    QString _appDirName;
    QString _appDirLoc;
    QString _readyToCompileFile;
    QFileInfo _exeCompileInfo;
    QFileInfo _apkCompileInfo;
};

#endif // UTILY_H
