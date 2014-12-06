//
// This file is part of the Marble Virtual Globe.
//
// This program is free software licensed under the GNU LGPL. You can
// find a copy of this license in LICENSE.txt in the top directory of
// the source code.
//
// Copyright 2013 Mihail Ivchenko <ematirov@gmail.com>
// Copyright 2014 Sanjiban Bairagya <sanjiban22393@gmail.com>
// Copyright 2014 Illya Kovalevskyy <illya.kovalevskyy@gmail.com>
//

#ifndef WAITEDITWIDGET_H
#define WAITEDITWIDGET_H

#include <QWidget>
#include <QModelIndex>

class QDoubleSpinBox;

namespace Marble
{

class GeoDataWait;

class WaitEditWidget: public QWidget
{
    Q_OBJECT

public:
    WaitEditWidget( const QModelIndex& index, QWidget* parent=0 );

Q_SIGNALS:
    void editingDone( const QModelIndex& index );

private Q_SLOTS:
    void save();

private:
    GeoDataWait* waitElement();
    QModelIndex m_index;
    QDoubleSpinBox *m_spinBox;
};

} // namespace Marble

#endif
