/*  This file is part of the KDE project
Copyright (C) 2006-2008 Matthias Kretz <kretz@kde.org>

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) version 3, or any
    later version accepted by the membership of KDE e.V. (or its
    successor approved by the membership of KDE e.V.), Nokia Corporation
    (or its successors, if any) and the KDE Free Qt Foundation, which shall
    act as a proxy defined in Section 6 of version 3 of the license.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public
    License along with this library.  If not, see <http://www.gnu.org/licenses/>.

*/

#ifndef PHONON_EXPERIMENTAL_GLOBALCONFIG_P_H
#define PHONON_EXPERIMENTAL_GLOBALCONFIG_P_H

#include <QtCore/QObject>
#include <QtCore/QSettings>

#include "export.h"
#include "../globalconfig.h"


namespace Phonon
{
namespace Experimental
{

class PHONONEXPERIMENTAL_EXPORT GlobalConfig : public Phonon::GlobalConfig
{
    P_DECLARE_PRIVATE(Phonon::GlobalConfig)

#ifndef PHONON_NO_VIDEOCAPTURE
public:
    PHONON_DEPRECATED QList<int> videoCaptureDeviceListFor(Phonon::Category category, int override = AdvancedDevicesFromSettings) const;
    PHONON_DEPRECATED int videoCaptureDeviceFor(Phonon::Category category, int override = AdvancedDevicesFromSettings) const;
    QList<int> videoCaptureDeviceListFor(Phonon::CaptureCategory category, int override = AdvancedDevicesFromSettings) const;
    int videoCaptureDeviceFor(Phonon::CaptureCategory category, int override = AdvancedDevicesFromSettings) const;

Q_SIGNALS:
    void videoCaptureDeviceConfigChanged();
#endif // PHONON_NO_VIDEOCAPTURE

}; // GlobalConfig class

} // namespace Experimental
} // namespace Phonon


#endif // PHONON_EXPERIMENTAL_GLOBALCONFIG_P_H
