#-------------------------------------------------
#
# Project created by QtCreator 2018-09-10T10:41:01
#
#-------------------------------------------------

QT += core gui widgets printsupport
QT += network

TARGET = "com.github.Murmele.UDPLogger"
TEMPLATE = app

isEmpty(flatpak){
    flatpak = false
}

# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0
equals(flatpak,true){
    LIBS+= -L/app/lib -lxlnt
    LIBS+= -L/app/lib -lnetcdf_c++4
}else: unix:!android {
    LIBS += -L/usr/local/lib -lnetcdf_c++4
    LIBS += -L/usr/lib -lxlnt
}


CONFIG += c++11 \
        c++14
INCLUDEPATH += \
    src \
    includes

SOURCES += \
    src/udp.cpp \
    src/changegraphdialog.cpp \
    src/main.cpp \
    src/mainwindow.cpp \
    src/plot.cpp \
    src/plots.cpp \
    src/plotscontextmenu.cpp \
    src/qcustomplot.cpp \
    src/settingsdialog.cpp \
    src/signals.cpp \
    src/plotbuffer.cpp \
    src/triggerwidget.cpp \
    src/datafile.cpp \
    src/exportdata.cpp \
    src/changediagramproperties.cpp

HEADERS += \
    includes/changegraphdialog.h \
    includes/mainwindow.h \
    includes/plot.h \
    includes/plots.h \
    includes/plotscontextmenu.h \
    includes/qcustomplot.h \
    includes/settingsdialog.h \
    includes/signals.h \
    includes/udp.h \
    includes/plotbuffer.h \
    includes/triggerwidget.h \
    includes/datafile.h \
    includes/exportdata.h \
    includes/changediagramproperties.h

FORMS += \
    forms/changegraphdialog.ui \
    forms/mainwindow.ui \
    forms/settingsdialog.ui \
    forms/triggerwidget.ui \
    forms/changediagramproperties.ui

# Default rules for deployment.


equals(flatpak, true){
    target.path =/app/bin
    message("Target path: " $$target.path)

}else: unix:!android: target.path = /opt/$${TARGET}/bin


INSTALLS += target
