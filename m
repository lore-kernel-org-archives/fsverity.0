Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B83E3603E9;
	Wed,  7 Oct 2026 06:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791354790; cv=none; b=iWbwLRtXTgVexGmjw01NC65UviSXLCTIq2TMTIr0n1QqzYQlbIRN4cS+gcI2VHCreRwtl1YkJVmYv6dHEceN+w9qiyKg1kfcTpJ+B0D5cEPfHbO4XUJosnN+YtnFPp6qj42oFG3l94ddUdf5UwwPPzo+Fe6UMSAxVnDsVHf6NWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791354790; c=relaxed/simple;
	bh=KLbyB7Rub1uhQt1/n66RBK90JE7eOxmRHZ6KVW4w79I=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=LC+f9jJbmfPoMK8T2Mj9/mhKLh2Hm4fFgvejGP2vCR7PcYBG2f5i1Jd6kXFr0VElnfXxJMi7pwLPXUenZxx8J0Pr+X+6AVwliXb4ZArYTIFJ/ASccZaW2O18l3uNlKElKCRn3ZwjZ9pt69lb21QEw7suLlooO5UUvtwipMbs0Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=M+3x2CxS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="M+3x2CxS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 319251F0089B;
	Wed,  7 Oct 2026 06:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791354788;
	bh=cnAwa71PIzrB+x15YPZi9nZSZZcVhzXq/FLZZ8pXgl4=;
	h=Subject:To:Cc:From:Date:In-Reply-To;
	b=M+3x2CxSPvKpAFwl0o7W+1HvxcwmG/c80ArT19oK6srZcjc6ZM0eJmKucdd04oUxr
	 +6BTiL+2/a4OdgQH5mlGBoahKLQVTORjtreAJQRNNBvXOwRnPfZ5lYbdtcxrSoYr/K
	 jKJ545Eh054EksCttsXIKt13h+Cw0zx+/lQwWd1Q=
Subject: Patch "fs,fsverity: reject size changes on fsverity files in setattr_prepare" has been added to the 6.18-stable tree
To: djwong@kernel.org,ebiggers@kernel.org,fsverity@lists.linux.dev,gregkh@linuxfoundation.org,hch@lst.de,jack@suse.cz
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Wed, 07 Oct 2026 08:32:54 +0200
In-Reply-To: <20261006213605.46946-2-ebiggers@kernel.org>
Message-ID: <2026100754-drizzle-shape-0a72@gregkh>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore


This is a note to let you know that I've just added the patch titled

    fs,fsverity: reject size changes on fsverity files in setattr_prepare

to the 6.18-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     fs-fsverity-reject-size-changes-on-fsverity-files-in-setattr_prepare.patch
and it can be found in the queue-6.18 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-352117-greg=kroah.com@vger.kernel.org Tue Oct  6 23:38:38 2026
From: Eric Biggers <ebiggers@kernel.org>
Date: Tue,  6 Oct 2026 23:36:04 +0200
Subject: fs,fsverity: reject size changes on fsverity files in setattr_prepare
To: stable@vger.kernel.org
Cc: fsverity@lists.linux.dev, Christoph Hellwig <hch@lst.de>, Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>, Eric Biggers <ebiggers@kernel.org>
Message-ID: <20261006213605.46946-2-ebiggers@kernel.org>

From: Christoph Hellwig <hch@lst.de>

commit e9734653c523c744f03333ece6ae7a315187f05c upstream.

Add the check to reject truncates of fsverity files directly to
setattr_prepare instead of requiring the file system to handle it.
Besides removing boilerplate code, this also fixes the complete lack of
such check in btrfs.

Fixes: 146054090b08 ("btrfs: initial fsverity support")
Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jan Kara <jack@suse.cz>
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
Link: https://lore.kernel.org/r/20260128152630.627409-2-hch@lst.de
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 fs/attr.c                |   12 +++++++++++-
 fs/ext4/inode.c          |    4 ----
 fs/f2fs/file.c           |    4 ----
 fs/verity/open.c         |    8 --------
 include/linux/fsverity.h |   25 -------------------------
 5 files changed, 11 insertions(+), 42 deletions(-)

--- a/fs/attr.c
+++ b/fs/attr.c
@@ -169,7 +169,17 @@ int setattr_prepare(struct mnt_idmap *id
 	 * ATTR_FORCE.
 	 */
 	if (ia_valid & ATTR_SIZE) {
-		int error = inode_newsize_ok(inode, attr->ia_size);
+		int error;
+
+		/*
+		 * Verity files are immutable, so deny truncates.  This isn't
+		 * covered by the open-time check because sys_truncate() takes a
+		 * path, not an open file.
+		 */
+		if (IS_ENABLED(CONFIG_FS_VERITY) && IS_VERITY(inode))
+			return -EPERM;
+
+		error = inode_newsize_ok(inode, attr->ia_size);
 		if (error)
 			return error;
 	}
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -5898,10 +5898,6 @@ int ext4_setattr(struct mnt_idmap *idmap
 	if (error)
 		return error;
 
-	error = fsverity_prepare_setattr(dentry, attr);
-	if (error)
-		return error;
-
 	if (is_quota_modification(idmap, inode, attr)) {
 		error = dquot_initialize(inode);
 		if (error)
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1123,10 +1123,6 @@ int f2fs_setattr(struct mnt_idmap *idmap
 	if (err)
 		return err;
 
-	err = fsverity_prepare_setattr(dentry, attr);
-	if (err)
-		return err;
-
 	if (unlikely(IS_IMMUTABLE(inode)))
 		return -EPERM;
 
--- a/fs/verity/open.c
+++ b/fs/verity/open.c
@@ -384,14 +384,6 @@ int __fsverity_file_open(struct inode *i
 }
 EXPORT_SYMBOL_GPL(__fsverity_file_open);
 
-int __fsverity_prepare_setattr(struct dentry *dentry, struct iattr *attr)
-{
-	if (attr->ia_valid & ATTR_SIZE)
-		return -EPERM;
-	return 0;
-}
-EXPORT_SYMBOL_GPL(__fsverity_prepare_setattr);
-
 void __fsverity_cleanup_inode(struct inode *inode)
 {
 	struct fsverity_info **vi_addr = fsverity_info_addr(inode);
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -179,7 +179,6 @@ int fsverity_get_digest(struct inode *in
 /* open.c */
 
 int __fsverity_file_open(struct inode *inode, struct file *filp);
-int __fsverity_prepare_setattr(struct dentry *dentry, struct iattr *attr);
 void __fsverity_cleanup_inode(struct inode *inode);
 
 /**
@@ -251,12 +250,6 @@ static inline int __fsverity_file_open(s
 	return -EOPNOTSUPP;
 }
 
-static inline int __fsverity_prepare_setattr(struct dentry *dentry,
-					     struct iattr *attr)
-{
-	return -EOPNOTSUPP;
-}
-
 static inline void fsverity_cleanup_inode(struct inode *inode)
 {
 }
@@ -338,22 +331,4 @@ static inline int fsverity_file_open(str
 	return 0;
 }
 
-/**
- * fsverity_prepare_setattr() - prepare to change a verity inode's attributes
- * @dentry: dentry through which the inode is being changed
- * @attr: attributes to change
- *
- * Verity files are immutable, so deny truncates.  This isn't covered by the
- * open-time check because sys_truncate() takes a path, not a file descriptor.
- *
- * Return: 0 on success, -errno on failure
- */
-static inline int fsverity_prepare_setattr(struct dentry *dentry,
-					   struct iattr *attr)
-{
-	if (IS_VERITY(d_inode(dentry)))
-		return __fsverity_prepare_setattr(dentry, attr);
-	return 0;
-}
-
 #endif	/* _LINUX_FSVERITY_H */


Patches currently in stable-queue which might be from ebiggers@kernel.org are

queue-6.18/fs-fsverity-reject-size-changes-on-fsverity-files-in-setattr_prepare.patch
queue-6.18/fs-fsverity-remove-check-for-fsverity-being-enabled-in-setattr_prepare.patch
queue-6.18/fsverity-add-dependency-on-64k-or-smaller-pages.patch
queue-6.18/crypto-x86-aes-gcm-fix-always-true-check-for-last-aad-segment.patch
