/* This file is part of the KDE libraries
    Copyright (C) 2000 Stephan Kulow <coolo@kde.org>
                  2000-2009 David Faure <faure@kde.org>

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Library General Public
    License as published by the Free Software Foundation; either
    version 2 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Library General Public License for more details.

    You should have received a copy of the GNU Library General Public License
    along with this library; see the file COPYING.LIB.  If not, write to
    the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
    Boston, MA 02110-1301, USA.
*/

#ifndef KIO_FILECOPYJOB_H
#define KIO_FILECOPYJOB_H

#include "job_base.h"
#include <kio/global.h> // filesize_t

namespace KIO
{

class FileCopyJobPrivate;
/**
 * @class KIO::FileCopyJob filecopyjob.h <KIO/FileCopyJob>
 *
 * The FileCopyJob copies data from one place to another.
 * @see KIO::file_copy()
 * @see KIO::file_move()
 */
class KIOCORE_EXPORT FileCopyJob : public Job
{
    Q_OBJECT

public:
    ~FileCopyJob() override;
    /**
     * If you know the size of the source file, call this method
     * to inform this job. It will be displayed in the "resume" dialog.
     * @param size the size of the source file
     */
    void setSourceSize(KIO::filesize_t size);

    /**
     * Sets the modification time of the file
     *
     * Note that this is ignored if a direct copy (SlaveBase::copy) can be done,
     * in which case the mtime of the source is applied to the destination (if the protocol
     * supports the concept).
     */
    void setModificationTime(const QDateTime &mtime);

    /**
     * Returns the source URL.
     * @return the source URL
     */
    QUrl srcUrl() const;

    /**
     * Returns the destination URL.
     * @return the destination URL
     */
    QUrl destUrl() const;

    bool doSuspend() override;
    bool doResume() override;
    bool doKill() override;

Q_SIGNALS:
    /**
     * Mimetype determined during a file copy.
     * This is never emitted during a move, and might not be emitted during
     * a file copy, depending on the slave. But when a get and a put are
     * being used (which is the common case), this signal forwards the
     * mimetype information from the get job.
     *
     * @param job the job that emitted this signal
     * @param type the mime type
     */
    void mimetype(KIO::Job *job, const QString &type);

protected Q_SLOTS:
    /**
     * Called whenever a subjob finishes.
     * @param job the job that emitted this signal
     */
    void slotResult(KJob *job) override;

protected:
    FileCopyJob(FileCopyJobPrivate &dd);

private:
    Q_DECLARE_PRIVATE(FileCopyJob)
};

/**
 * Copy a single file.
 *
 * Uses either SlaveBase::copy() if the slave supports that
 * or get() and put() otherwise.
 * @param src Where to get the file.
 * @param dest Where to put the file.
 * @param permissions May be -1. In this case no special permission mode is set.
 * @param flags Can be HideProgressInfo, Overwrite and Resume here. WARNING:
 * Setting Resume means that the data will be appended to @p dest if @p dest exists.
 * @return the job handling the operation.
 */
KIOCORE_EXPORT FileCopyJob *file_copy(const QUrl &src, const QUrl &dest, int permissions = -1,
                                      JobFlags flags = DefaultFlags);

/**
 * Overload for catching code mistakes. Do NOT call this method (it is not implemented),
 * insert a value for permissions (-1 by default) before the JobFlags.
 * @since 4.5
 */
FileCopyJob *file_copy(const QUrl &src, const QUrl &dest, JobFlags flags) Q_DECL_EQ_DELETE;   // not implemented - on purpose.

/**
 * Move a single file.
 *
 * Use either SlaveBase::rename() if the slave supports that,
 * or copy() and del() otherwise, or eventually get() & put() & del()
 * @param src Where to get the file.
 * @param dest Where to put the file.
 * @param permissions May be -1. In this case no special permission mode is set.
 * @param flags Can be HideProgressInfo, Overwrite and Resume here. WARNING:
 * Setting Resume means that the data will be appended to @p dest if @p dest exists.
 * @return the job handling the operation.
 */
KIOCORE_EXPORT FileCopyJob *file_move(const QUrl &src, const QUrl &dest, int permissions = -1,
                                      JobFlags flags = DefaultFlags);

/**
 * Overload for catching code mistakes. Do NOT call this method (it is not implemented),
 * insert a value for permissions (-1 by default) before the JobFlags.
 * @since 4.3
 */
FileCopyJob *file_move(const QUrl &src, const QUrl &dest, JobFlags flags) Q_DECL_EQ_DELETE;   // not implemented - on purpose.

}

#endif
