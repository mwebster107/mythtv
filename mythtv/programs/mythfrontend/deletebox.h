#ifndef DELETEBOX_H_
#define DELETEBOX_H_

#include <qwidget.h>
#include <qdialog.h>

#include <pthread.h>

class QSqlDatabase;
class QListViewItem;
class MyListView;
class QLabel;
class QProgressBar;
class TV;
class NuppelVideoPlayer;
class RingBuffer;
class QTimer;
class ProgramInfo;
class MythContext;

class DeleteBox : public QDialog
{
    Q_OBJECT
  public:
    DeleteBox(MythContext *context, TV *ltv, QSqlDatabase *ldb, 
              QWidget *parent = 0, const char *name = 0);
   ~DeleteBox(void);
    
    void Show();
  
  protected slots:
    void selected(QListViewItem *);
    void changed(QListViewItem *);
    void timeout(void);
    
  private:
    void GetFreeSpaceStats(int &totalspace, int &usedspace); 
    void UpdateProgressBar(void);

    QSqlDatabase *db;
    TV *tv;

    QLabel *title;
    QLabel *subtitle;
    QLabel *description;
    QLabel *date;
    QLabel *chan;
    QLabel *pixlabel;

    MyListView *listview;

    QLabel *freespace;
    QProgressBar *progressbar;
 
    QString fileprefix;

    float wmult, hmult;
    int descwidth;

    void killPlayer(void);
    void startPlayer(ProgramInfo *rec);

    QTimer *timer;
    NuppelVideoPlayer *nvp;
    RingBuffer *rbuffer;
    pthread_t decoder;
 
    MythContext *m_context;
};

#endif
