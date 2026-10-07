Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740FC3E7BA4;
	Wed,  7 Oct 2026 06:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791354787; cv=none; b=Qlwm5UT38fXXoTVeAG7+9VhoonR08/A9INRgQ90nUL+20jq7esFf+UpBMnAsP3c6ED331Yr2JqXVers/Pss1Yt9bqrrhBBaqzSU9oz9QfkM/irkvwNh5xfjtRds+IV63r/xERZZ/8M2xgrh3Th2Cav1T0d+pPXfxq2R2UlZ1+FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791354787; c=relaxed/simple;
	bh=eZvzKlYP9UAafNSMsnKbiyIL16NKs3hhOvpReJcaeJk=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=SS7YMgISrW+vghrkGuxmN3ShdkDxOPUgxIzgtB3aSlxlZVJCPfPYt3O1lWcbhWd23hyBXevgUL33lYzSJFUjikA4MidLphElWFQ6p6ulfRwa4wusx27Bqd7czJQbtFH6Z7cLKJ3cnFlsLEtJNAy5TQVlwkTLqYHmcpCaTEeTbJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TcfKHv4/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TcfKHv4/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6300E1F0089B;
	Wed,  7 Oct 2026 06:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791354785;
	bh=UdpYArlYRrhEN/amN89haMfFoDQ4DYd3Tecy9f0Jhmg=;
	h=Subject:To:Cc:From:Date:In-Reply-To;
	b=TcfKHv4/N+9QrKA3GCTUnri0Ke8Mbo0gZR5fNT55EWIcuChC8W5RpkOG8V9Or60xC
	 c/v4i7v/0S0iHGasGsN2RULr59OvsoG3OicPqDG0f7YKR4pQHJ7PhQj4uJbtdFjqXG
	 YX0irKrpQVGmEmqHjOdCEABv8BsbOAk1E5mFjwYg=
Subject: Patch "fs,fsverity: remove check for fsverity being enabled in setattr_prepare()" has been added to the 6.18-stable tree
To: aalbersh@kernel.org,ebiggers@kernel.org,fsverity@lists.linux.dev,gregkh@linuxfoundation.org,hch@lst.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Wed, 07 Oct 2026 08:32:54 +0200
In-Reply-To: <20261006213605.46946-3-ebiggers@kernel.org>
Message-ID: <2026100754-easter-stimulate-46ee@gregkh>
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

    fs,fsverity: remove check for fsverity being enabled in setattr_prepare()

to the 6.18-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     fs-fsverity-remove-check-for-fsverity-being-enabled-in-setattr_prepare.patch
and it can be found in the queue-6.18 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-352118-greg=kroah.com@vger.kernel.org Tue Oct  6 23:39:37 2026
From: Eric Biggers <ebiggers@kernel.org>
Date: Tue,  6 Oct 2026 23:36:05 +0200
Subject: fs,fsverity: remove check for fsverity being enabled in setattr_prepare()
To: stable@vger.kernel.org
Cc: fsverity@lists.linux.dev, Andrey Albershteyn <aalbersh@kernel.org>, Christoph Hellwig <hch@lst.de>, Eric Biggers <ebiggers@kernel.org>
Message-ID: <20261006213605.46946-3-ebiggers@kernel.org>

From: Andrey Albershteyn <aalbersh@kernel.org>

commit d2f96bcb89d36d488a10e3bcf819b98536968286 upstream.

The check that fs-verity is available in the kernel is not necessary
here. Filesystems could have fsverity files even without fs-verity
enabled. In that case, truncate on fsverity file will succeed, what this
check is trying to prevent.

Fixes: e9734653c523 ("fs,fsverity: reject size changes on fsverity files in setattr_prepare")
Cc: stable@vger.kernel.org
Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Link: https://patch.msgid.link/20260727094352.1734826-1-aalbersh@kernel.org
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 fs/attr.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/fs/attr.c
+++ b/fs/attr.c
@@ -176,7 +176,7 @@ int setattr_prepare(struct mnt_idmap *id
 		 * covered by the open-time check because sys_truncate() takes a
 		 * path, not an open file.
 		 */
-		if (IS_ENABLED(CONFIG_FS_VERITY) && IS_VERITY(inode))
+		if (IS_VERITY(inode))
 			return -EPERM;
 
 		error = inode_newsize_ok(inode, attr->ia_size);


Patches currently in stable-queue which might be from ebiggers@kernel.org are

queue-6.18/fs-fsverity-reject-size-changes-on-fsverity-files-in-setattr_prepare.patch
queue-6.18/fs-fsverity-remove-check-for-fsverity-being-enabled-in-setattr_prepare.patch
queue-6.18/fsverity-add-dependency-on-64k-or-smaller-pages.patch
queue-6.18/crypto-x86-aes-gcm-fix-always-true-check-for-last-aad-segment.patch
