#ifndef PLOTBUFFER_H
#define PLOTBUFFER_H

#include <QObject>
#include <qcustomplot.h>

#include "signals.h"


class PlotBuffer: public QCPGraphDataContainer
{
public:
    PlotBuffer();
    PlotBuffer(int index_x, int index_y);
    inline int getIndexX() const {return m_index_x;}
    inline int getIndexY() const {return m_index_y;}
    inline void increaseCounter() {m_count++;}
    int decreaseCounter();
private:
    int m_index_x; // x axis signal index
    int m_index_y; // y axis signal index
    int m_count;
    int m_xmin, m_xmax, m_ymin, m_ymax;

};

class PlotBuffers: public QObject
{
    Q_OBJECT
public:
    PlotBuffers(Signals* signal);
    ~PlotBuffers();
    QSharedPointer<QCPGraphDataContainer> getBuffer(struct Signal xaxis, struct Signal yaxis);
    void removeGraph(struct Signal xaxis, struct Signal yaxis);
    void addData(char* data, int length);
    static inline float* getFloatPointer(int position,char* data){return (float*)(&data[position]);}
    static inline double* getDoublePointer(int position,char* data){return (double*)(&data[position]);}
    static inline int16_t* getShortPointer(int position,char* data){return (int16_t*)(&data[position]);}
    static inline uint16_t* getUShortPointer(int position,char* data){return (uint16_t*)(&data[position]);}
    static inline char* getCharPointer(int position,char* data){return &data[position];}
    static inline uint8_t* getUCharPointer(int position,char* data){return (uint8_t*)(&data[position]);}
    static inline bool* getBoolPointer(int position,char* data){return (bool*)(&data[position]);}
    static inline int* getIntPointer(int position,char* data){return (int*)(&data[position]);}
    static inline uint32_t* getUIntPointer(int position,char* data){return (uint32_t*)(&data[position]);}
	static inline int64_t* getInt64Pointer(int position,char* data){return (int64_t*)(&data[position]);}
	static inline uint64_t* getUInt64Pointer(int position,char* data){return (uint64_t*)(&data[position]);}
    static double getValue(char* data, int length, struct Signal signal);
    void clearPlots();
public slots:
    void plotBufferSizeChanged(int plot_buffer_size);
    void removeSignal(struct Signal xaxis, struct Signal yaxis);
signals:
    void dataChanged();
private:
    QVector<QSharedPointer<PlotBuffer>> m_plot_buffer;
    Signals* m_signals;
    int m_plot_buffer_size;
};

#endif // PLOTBUFFER_H
