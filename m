Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D45F38F93
	for <fsverity@lists.linux.dev>; Fri,  6 Oct 2023 18:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DuCHpZMq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696618344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cF6LLWd0WvBXMvGrCZkUcNG53fYlYoAeVHRxAzdPeWo=;
	b=DuCHpZMqsulZ3LmN7UW8afUW98O39iDRb+LPl8HyNqwe18UM+Jz5iC1BjhM54AZew3xrgm
	yxvCpk04XLSSM4HVM6U+iBwX4v0h5hjfe6Z/uykWVI7rk9Ys4eaAc+EQSKSxgCardnyXho
	MB6ZvKj1o3EePC53qGjYzPT4b7ZxL2U=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-GvU8k4U3OVCbK6l5j7ro5g-1; Fri, 06 Oct 2023 14:52:23 -0400
X-MC-Unique: GvU8k4U3OVCbK6l5j7ro5g-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9b95fa56bd5so210959466b.0
        for <fsverity@lists.linux.dev>; Fri, 06 Oct 2023 11:52:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696618342; x=1697223142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cF6LLWd0WvBXMvGrCZkUcNG53fYlYoAeVHRxAzdPeWo=;
        b=XsoQvg6lFe++RejlIpLNWnGdglQc5IUjp3toKDiuOBDoeOqXZuR7zrwR+MOWTCAjfH
         8hqS6XNwFr9rm1bxXSKDFnlvNHTac/+buuRFoisqg16Gi51z9MEhbbcLHhARjkXRy9PV
         P4JG1+gd14KORH0ryWTzKGk6xKK3eFhbuNzsLpUmxVBg/VIIZIpTobg52RzibBV4z27C
         jcljE2DEhuzui0YjNMuNmAqU+cMo1NT1e438aTYWY68Ob/yBoDNWJlsGezzqFB2V1f/p
         KdcZ3eyDwxADIP60yUXEc6CGy4LB0vt8yCiAWhyhCe7eY+o/fmAoapXMGvvfYWHD1LVv
         YPNA==
X-Gm-Message-State: AOJu0YwVXXuUICiqlLdbTFa/twUwiH8bjXDudypK1evNz0paVhlDIYut
	yV0uAOQ53aBu3hEzHE/oxljRrNP0lfDnPiccDN6zcGSfjdtJeax7q4iVZOny3JrrvIyg1Vv4kDk
	YezTI6ep5urTV6dtIsQ==
X-Received: by 2002:a17:906:31c5:b0:9a2:5bf:8b14 with SMTP id f5-20020a17090631c500b009a205bf8b14mr8881572ejf.22.1696618341944;
        Fri, 06 Oct 2023 11:52:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpFduafirPU1wxM0LQcObIvVD1nodvtAvtss3fSofvUPY3m4rhSa07AE3hXprDsHbpUVQvLw==
X-Received: by 2002:a17:906:31c5:b0:9a2:5bf:8b14 with SMTP id f5-20020a17090631c500b009a205bf8b14mr8881563ejf.22.1696618341727;
        Fri, 06 Oct 2023 11:52:21 -0700 (PDT)
Received: from localhost.localdomain ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id os5-20020a170906af6500b009b947f81c4asm3304741ejb.155.2023.10.06.11.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 11:52:21 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	fsverity@lists.linux.dev
Cc: djwong@kernel.org,
	ebiggers@kernel.org,
	david@fromorbit.com,
	dchinner@redhat.com,
	Allison Henderson <allison.henderson@oracle.com>
Subject: [PATCH v3 04/28] xfs: Add xfs_verify_pptr
Date: Fri,  6 Oct 2023 20:48:58 +0200
Message-Id: <20231006184922.252188-5-aalbersh@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231006184922.252188-1-aalbersh@redhat.com>
References: <20231006184922.252188-1-aalbersh@redhat.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Allison Henderson <allison.henderson@oracle.com>

Attribute names of parent pointers are not strings.  So we need to modify
attr_namecheck to verify parent pointer records when the XFS_ATTR_PARENT flag is
set.

Signed-off-by: Allison Henderson <allison.henderson@oracle.com>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
---
 fs/xfs/libxfs/xfs_attr.c      | 47 ++++++++++++++++++++++++++++++++---
 fs/xfs/libxfs/xfs_attr.h      |  3 ++-
 fs/xfs/libxfs/xfs_da_format.h |  8 ++++++
 fs/xfs/scrub/attr.c           |  2 +-
 fs/xfs/xfs_attr_item.c        | 11 +++++---
 fs/xfs/xfs_attr_list.c        | 17 +++++++++----
 6 files changed, 74 insertions(+), 14 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_attr.c b/fs/xfs/libxfs/xfs_attr.c
index 101823772bf9..711022742e34 100644
--- a/fs/xfs/libxfs/xfs_attr.c
+++ b/fs/xfs/libxfs/xfs_attr.c
@@ -1577,9 +1577,33 @@ xfs_attr_node_get(
 	return error;
 }
 
-/* Returns true if the attribute entry name is valid. */
-bool
-xfs_attr_namecheck(
+/*
+ * Verify parent pointer attribute is valid.
+ * Return true on success or false on failure
+ */
+STATIC bool
+xfs_verify_pptr(
+	struct xfs_mount			*mp,
+	const struct xfs_parent_name_rec	*rec)
+{
+	xfs_ino_t				p_ino;
+	xfs_dir2_dataptr_t			p_diroffset;
+
+	p_ino = be64_to_cpu(rec->p_ino);
+	p_diroffset = be32_to_cpu(rec->p_diroffset);
+
+	if (!xfs_verify_ino(mp, p_ino))
+		return false;
+
+	if (p_diroffset > XFS_DIR2_MAX_DATAPTR)
+		return false;
+
+	return true;
+}
+
+/* Returns true if the string attribute entry name is valid. */
+static bool
+xfs_str_attr_namecheck(
 	const void	*name,
 	size_t		length)
 {
@@ -1594,6 +1618,23 @@ xfs_attr_namecheck(
 	return !memchr(name, 0, length);
 }
 
+/* Returns true if the attribute entry name is valid. */
+bool
+xfs_attr_namecheck(
+	struct xfs_mount	*mp,
+	const void		*name,
+	size_t			length,
+	int			flags)
+{
+	if (flags & XFS_ATTR_PARENT) {
+		if (length != sizeof(struct xfs_parent_name_rec))
+			return false;
+		return xfs_verify_pptr(mp, (struct xfs_parent_name_rec *)name);
+	}
+
+	return xfs_str_attr_namecheck(name, length);
+}
+
 int __init
 xfs_attr_intent_init_cache(void)
 {
diff --git a/fs/xfs/libxfs/xfs_attr.h b/fs/xfs/libxfs/xfs_attr.h
index 3e81f3f48560..b79dae788cfb 100644
--- a/fs/xfs/libxfs/xfs_attr.h
+++ b/fs/xfs/libxfs/xfs_attr.h
@@ -547,7 +547,8 @@ int xfs_attr_get(struct xfs_da_args *args);
 int xfs_attr_set(struct xfs_da_args *args);
 int xfs_attr_set_iter(struct xfs_attr_intent *attr);
 int xfs_attr_remove_iter(struct xfs_attr_intent *attr);
-bool xfs_attr_namecheck(const void *name, size_t length);
+bool xfs_attr_namecheck(struct xfs_mount *mp, const void *name, size_t length,
+			int flags);
 int xfs_attr_calc_size(struct xfs_da_args *args, int *local);
 void xfs_init_attr_trans(struct xfs_da_args *args, struct xfs_trans_res *tres,
 			 unsigned int *total);
diff --git a/fs/xfs/libxfs/xfs_da_format.h b/fs/xfs/libxfs/xfs_da_format.h
index 307c8cdb6f10..6deefe03207f 100644
--- a/fs/xfs/libxfs/xfs_da_format.h
+++ b/fs/xfs/libxfs/xfs_da_format.h
@@ -741,6 +741,14 @@ xfs_attr3_leaf_name(xfs_attr_leafblock_t *leafp, int idx)
 	return &((char *)leafp)[be16_to_cpu(entries[idx].nameidx)];
 }
 
+static inline int
+xfs_attr3_leaf_flags(xfs_attr_leafblock_t *leafp, int idx)
+{
+	struct xfs_attr_leaf_entry *entries = xfs_attr3_leaf_entryp(leafp);
+
+	return entries[idx].flags;
+}
+
 static inline xfs_attr_leaf_name_remote_t *
 xfs_attr3_leaf_name_remote(xfs_attr_leafblock_t *leafp, int idx)
 {
diff --git a/fs/xfs/scrub/attr.c b/fs/xfs/scrub/attr.c
index 8bc6aa274fa6..f35144704395 100644
--- a/fs/xfs/scrub/attr.c
+++ b/fs/xfs/scrub/attr.c
@@ -195,7 +195,7 @@ xchk_xattr_listent(
 	}
 
 	/* Does this name make sense? */
-	if (!xfs_attr_namecheck(name, namelen)) {
+	if (!xfs_attr_namecheck(sx->sc->mp, name, namelen, flags)) {
 		xchk_fblock_set_corrupt(sx->sc, XFS_ATTR_FORK, args.blkno);
 		goto fail_xref;
 	}
diff --git a/fs/xfs/xfs_attr_item.c b/fs/xfs/xfs_attr_item.c
index 97ee9d89b5b8..63393216159f 100644
--- a/fs/xfs/xfs_attr_item.c
+++ b/fs/xfs/xfs_attr_item.c
@@ -593,7 +593,8 @@ xfs_attri_item_recover(
 	 */
 	attrp = &attrip->attri_format;
 	if (!xfs_attri_validate(mp, attrp) ||
-	    !xfs_attr_namecheck(nv->name.i_addr, nv->name.i_len))
+	    !xfs_attr_namecheck(mp, nv->name.i_addr, nv->name.i_len,
+				attrp->alfi_attr_filter))
 		return -EFSCORRUPTED;
 
 	error = xlog_recover_iget(mp,  attrp->alfi_ino, &ip);
@@ -805,7 +806,8 @@ xlog_recover_attri_commit_pass2(
 	}
 
 	attr_name = item->ri_buf[i].i_addr;
-	if (!xfs_attr_namecheck(attr_name, attri_formatp->alfi_name_len)) {
+	if (!xfs_attr_namecheck(mp, attr_name, attri_formatp->alfi_name_len,
+				attri_formatp->alfi_attr_filter)) {
 		XFS_CORRUPTION_ERROR(__func__, XFS_ERRLEVEL_LOW, mp,
 				item->ri_buf[i].i_addr, item->ri_buf[i].i_len);
 		return -EFSCORRUPTED;
@@ -823,8 +825,9 @@ xlog_recover_attri_commit_pass2(
 		}
 
 		attr_nname = item->ri_buf[i].i_addr;
-		if (!xfs_attr_namecheck(attr_nname,
-				attri_formatp->alfi_nname_len)) {
+		if (!xfs_attr_namecheck(mp, attr_nname,
+				attri_formatp->alfi_nname_len,
+				attri_formatp->alfi_attr_filter)) {
 			XFS_CORRUPTION_ERROR(__func__, XFS_ERRLEVEL_LOW, mp,
 					item->ri_buf[i].i_addr,
 					item->ri_buf[i].i_len);
diff --git a/fs/xfs/xfs_attr_list.c b/fs/xfs/xfs_attr_list.c
index 99bbbe1a0e44..a51f7f13a352 100644
--- a/fs/xfs/xfs_attr_list.c
+++ b/fs/xfs/xfs_attr_list.c
@@ -58,9 +58,13 @@ xfs_attr_shortform_list(
 	struct xfs_attr_sf_sort		*sbuf, *sbp;
 	struct xfs_attr_shortform	*sf;
 	struct xfs_attr_sf_entry	*sfe;
+	struct xfs_mount		*mp;
 	int				sbsize, nsbuf, count, i;
 	int				error = 0;
 
+	ASSERT(context != NULL);
+	ASSERT(dp != NULL);
+	mp = dp->i_mount;
 	sf = (struct xfs_attr_shortform *)dp->i_af.if_u1.if_data;
 	ASSERT(sf != NULL);
 	if (!sf->hdr.count)
@@ -82,8 +86,9 @@ xfs_attr_shortform_list(
 	     (dp->i_af.if_bytes + sf->hdr.count * 16) < context->bufsize)) {
 		for (i = 0, sfe = &sf->list[0]; i < sf->hdr.count; i++) {
 			if (XFS_IS_CORRUPT(context->dp->i_mount,
-					   !xfs_attr_namecheck(sfe->nameval,
-							       sfe->namelen)))
+					   !xfs_attr_namecheck(mp, sfe->nameval,
+							       sfe->namelen,
+							       sfe->flags)))
 				return -EFSCORRUPTED;
 			context->put_listent(context,
 					     sfe->flags,
@@ -174,8 +179,9 @@ xfs_attr_shortform_list(
 			cursor->offset = 0;
 		}
 		if (XFS_IS_CORRUPT(context->dp->i_mount,
-				   !xfs_attr_namecheck(sbp->name,
-						       sbp->namelen))) {
+				   !xfs_attr_namecheck(mp, sbp->name,
+						       sbp->namelen,
+						       sbp->flags))) {
 			error = -EFSCORRUPTED;
 			goto out;
 		}
@@ -465,7 +471,8 @@ xfs_attr3_leaf_list_int(
 		}
 
 		if (XFS_IS_CORRUPT(context->dp->i_mount,
-				   !xfs_attr_namecheck(name, namelen)))
+				   !xfs_attr_namecheck(mp, name, namelen,
+						       entry->flags)))
 			return -EFSCORRUPTED;
 		context->put_listent(context, entry->flags,
 					      name, namelen, valuelen);
-- 
2.40.1

