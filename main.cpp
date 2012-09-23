#include <QtGui/QApplication>
#include "qmlapplicationviewer.h"
#include <QDir>
#include <QDebug>
#include <QDeclarativeContext>

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));

    QmlApplicationViewer viewer;
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    QDir dir = QDir(QDir::home());
    dir.cd("Videos");
    dir.setFilter(QDir::Files);
    QStringList entries = dir.entryList();
    QDeclarativeContext *ctxt = viewer.rootContext();
    ctxt->setContextProperty("filesModel", QVariant::fromValue(entries));
    ctxt->setContextProperty("filesRoot", QVariant::fromValue(dir.absolutePath()));

    QPixmap nullCursor(16, 16);
    nullCursor.fill(Qt::transparent);
//    QApplication::setOverrideCursor(QCursor(nullCursor));
    viewer.setMainQmlFile(QLatin1String("qml/nakkikioski/main.qml"));
    viewer.setResizeMode(QDeclarativeView::SizeRootObjectToView);
    viewer.showExpanded();
    viewer.showFullScreen();

    return app->exec();
}
