/*
    This file is part of the KDE libraries
    Copyright (c) 2020 David Faure <faure@kde.org>

    This library is free software; you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published by
    the Free Software Foundation; either version 2 of the License or ( at
    your option ) version 3 or, at the discretion of KDE e.V. ( which shall
    act as a proxy as in section 14 of the GPLv3 ), any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Library General Public License for more details.

    You should have received a copy of the GNU Lesser General Public License
    along with this library; see the file COPYING.LIB.  If not, write to
    the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
    Boston, MA 02110-1301, USA.
*/

#ifndef KIO_COMMANDLAUNCHERJOB_H
#define KIO_COMMANDLAUNCHERJOB_H

#include "kiogui_export.h"
#include <KJob>

class KRunPrivate; // KF6 REMOVE
class CommandLauncherJobTest; // KF6 REMOVE

namespace KIO {

class CommandLauncherJobPrivate;

/**
 * @class CommandLauncherJob commandlauncherjob.h <KIO/CommandLauncherJob>
 *
 * @brief CommandLauncherJob runs a command and watches it while running.
 *
 * It creates a startup notification and finishes it on success or on error (for the taskbar).
 * It also emits an error message if necessary (e.g. "program not found").
 *
 * The job finishes when the application is successfully started. At that point you can
 * query the PID.
 *
 * For error handling, either connect to the result() signal, or for a simple messagebox on error,
 * you can do
 * @code
 *    job->setUiDelegate(new KDialogJobUiDelegate(KJobUiDelegate::AutoHandlingEnabled, this));
 * @endcode
 *
 * @since 5.69
 */
class KIOGUI_EXPORT CommandLauncherJob : public KJob
{
public:
    /**
     * Creates a CommandLauncherJob.
     * @param command the shell command to run
     * @param parent the parent QObject
     *
     * Please consider also calling setDesktopName(), or setExecutable() and setIcon()
     * for better startup notification.
     */
    explicit CommandLauncherJob(const QString &command, QObject *parent = nullptr);

    /**
     * Creates a CommandLauncherJob.
     * @param executable the name of the executable
     * @param args the commandline arguments to pass to the executable
     * @param parent the parent QObject
     *
     * Please consider also calling setDesktopName(), or setExecutable() and setIcon()
     * for better startup notification.
     */
    explicit CommandLauncherJob(const QString &executable, const QStringList &args, QObject *parent = nullptr);

    /**
     * Destructor
     *
     * Note that jobs auto-delete themselves after emitting result
     */
    ~CommandLauncherJob() override;

    /**
     * Sets the name of the executable, used in the startup notification
     * (see KStartupInfoData::setBin()).
     * @param executable executable name, with or without a path
     *
     * Alternatively, use setDesktopName().
     */
    void setExecutable(const QString &executable);

    /**
     * Sets the icon for the startup notification.
     * @param iconName name of the icon, to be loaded from the current icon theme
     *
     * Alternatively, use setDesktopName().
     */
    void setIcon(const QString &iconName);

    /**
     * Set the name of the desktop file (e.g.\ "org.kde.dolphin", the extension is optional).
     *
     * This is an alternative solution for setIcon() and setExecutable(), i.e. the icon
     * will be taken from the desktop file, and the executable inferred from the "Exec" line.
     */
    void setDesktopName(const QString &desktopName);

    /**
     * Sets the startup notification id of the command launch.
     * @param startupId startup notification id, if any (otherwise "").
     */
    void setStartupId(const QByteArray &startupId);

    /**
     * Sets the working directory from which to run the command.
     * @param workingDirectory path of a local directory
     */
    void setWorkingDirectory(const QString &workingDirectory);

    /**
     * Starts the job.
     * You must call this, after having done all the setters.
     */
    void start() override;

    /**
     * @return the PID of the application that was started
     *
     * Available after the job emits result().
     */
    qint64 pid() const;

private:
    friend class ::KRunPrivate; // KF6 REMOVE
    friend class ::CommandLauncherJobTest; // KF6 REMOVE
    /**
     * Blocks until the process has started. Only exists for KRun, will disappear in KF6.
     */
    bool waitForStarted();

    friend class CommandLauncherJobPrivate;
    QScopedPointer<CommandLauncherJobPrivate> d;
};

} // namespace KIO

#endif
