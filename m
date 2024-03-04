Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910A77D3E7
	for <fsverity@lists.linux.dev>; Mon,  4 Mar 2024 19:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709579554; cv=none; b=UBsXM+jfs7pW7d4/uZAdC/Zz/PZ4++/adTl/fmwMe/CBSSpS8oE+0Z3FHrq8k2V87/OPENyxC4jeKXeA/bIwK1od7LTGIXToxQDsRSnAdf3o8/hc78FPR72SwOk0GNWr1BIHJumUyVzKt5Dphl+Xk/eiecutZ8jjuTJ3r34BvCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709579554; c=relaxed/simple;
	bh=q0TWMGdcx6UYw2sFq8ZSAnpd1rQAgwPeqQNrYl42ZRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BIGX+Ev8bj47/q4A8lCONUdpl++QKUaShPhYgxhRTPfZ7xqXQ8V3wCM+ppltEdBBr8lN7U1TZEbyqR81QLubmz3t3s/VgtNLxsy6GDd46ObDq4Sjcxk9Ee4dwWdq0PUntCO1X+9hVAvUNmjdu36qrleg8m3ZGwEd6YcjMjchI90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JGFyTA1P; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JGFyTA1P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709579551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tZJgKDbZKO9AEPv9hol4NRfnrrJXjSrBKcTnHhFLOjw=;
	b=JGFyTA1P8B/+GNyMXSaydr7CfuUAbe0p8Awsd/HBs18GKBdTt4LJZ2E/y7/VVw72jFLDdD
	gEFcsagc4RkpghZxNtkrXWbn2hVEABnNcq1en+X61KsTb/SvzscWA8OeCh6g+Cwp6YhOjp
	6UcfeGe02jSjGYFXevqyQkvf5h+aLYI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-jj2fDi19PKeiheTpsEWgEg-1; Mon, 04 Mar 2024 14:12:30 -0500
X-MC-Unique: jj2fDi19PKeiheTpsEWgEg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a30f9374db7so615131566b.0
        for <fsverity@lists.linux.dev>; Mon, 04 Mar 2024 11:12:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709579549; x=1710184349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tZJgKDbZKO9AEPv9hol4NRfnrrJXjSrBKcTnHhFLOjw=;
        b=e0lFg948q9X/dzVMFTmrydWOYDq6s0Gvk77vL4VwJXgfJX5anFFfICml7iU+cnRWvZ
         Wxsvae4XEjCxgGBb3k1q4BXl0XMzDitNOA+XEIhwzPJFkSUXrD3MYVdHIa7B1QHuX/j9
         UJjx3mhUvWpxquwjSfxjiQa3NJSO4gC+/hl0/DJaA0n9OS/jTVrlhs3c2DwQ0sGKFXMR
         ME4bJbJDg9wun+81argRDukej0ECGIlIbq7qx6Ewh8mr8WfnJNVlX2bVh32KFCPVfuOZ
         Fawj5Z7fCS1o5GpWhv8wxZU0+HtanQGWk1s0nmLtqMJxDAU/+m3z7qI90jR0DpJTdt/L
         l1hQ==
X-Gm-Message-State: AOJu0YzmiIusQxfPl41XitBEe3vOZdO4Z6tBO7UzyWFraJKyxn1jCNvQ
	VvmjB8Wv0SVwihRd115ErKRrvogoRTXJNv0auazq1H8/bxyOfVYjeKQvHesh2ch34O9RRRXLcRO
	thv8b8D0Bkmm2UtJ37VrQmulEHoBKEA2u9AakmtlRi1nOTl4E8iHXgPoqwlHd8CoNwSgdkwUYHz
	IWFjTt1niQO/m0HShI3N/dHxGaP+nCIMX7BWlU3FY=
X-Received: by 2002:a17:906:3950:b0:a45:73b0:bcc3 with SMTP id g16-20020a170906395000b00a4573b0bcc3mr412640eje.34.1709579548884;
        Mon, 04 Mar 2024 11:12:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcXQkCy+qbM5MpjP28mYSzksscG7NinAKQc6R+cEtFLFSGXNxJn80ppRV0QWT9HBUWJwZUQg==
X-Received: by 2002:a17:906:3950:b0:a45:73b0:bcc3 with SMTP id g16-20020a170906395000b00a4573b0bcc3mr412595eje.34.1709579548091;
        Mon, 04 Mar 2024 11:12:28 -0800 (PST)
Received: from thinky.redhat.com ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id a11-20020a1709064a4b00b00a44a04aa3cfsm3783319ejv.225.2024.03.04.11.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 11:12:27 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: fsverity@lists.linux.dev,
	linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	chandan.babu@oracle.com,
	djwong@kernel.org,
	ebiggers@kernel.org
Cc: Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v5 19/24] xfs: don't allow to enable DAX on fs-verity sealsed inode
Date: Mon,  4 Mar 2024 20:10:42 +0100
Message-ID: <20240304191046.157464-21-aalbersh@redhat.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240304191046.157464-2-aalbersh@redhat.com>
References: <20240304191046.157464-2-aalbersh@redhat.com>
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

fs-verity doesn't support DAX. Forbid filesystem to enable DAX on
inodes which already have fs-verity enabled. The opposite is checked
when fs-verity is enabled, it won't be enabled if DAX is.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/xfs/xfs_iops.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
index 0e5cdb82b231..6f97d777f702 100644
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@ -1213,6 +1213,8 @@ xfs_inode_should_enable_dax(
 		return false;
 	if (!xfs_inode_supports_dax(ip))
 		return false;
+	if (ip->i_diflags2 & XFS_DIFLAG2_VERITY)
+		return false;
 	if (xfs_has_dax_always(ip->i_mount))
 		return true;
 	if (ip->i_diflags2 & XFS_DIFLAG2_DAX)
-- 
2.42.0

