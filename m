Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD9D4156EB
	for <fsverity@lists.linux.dev>; Tue, 11 Aug 2026 08:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786436293; cv=none; b=q/BV2pnVYoRu48Gl5VrgJKXfb3Zu4eWvFWZHz1oanlOP2CavAc+9K05YdwdK6xag/tslyu5L5OSWl+NwCsXY94QhNZ5yAKCZwqGhrDhQ+0O7YpgX88i56vczoUCX5muvcLB+EzMzSsk5cNASoasYMPEf/oejfNHojeLrDwt1v9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786436293; c=relaxed/simple;
	bh=0m0VCrVFS50IL0+ZPUc8eV8aQ+yXJjlZWMeXsIJ1aBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=NZXTQh0exDa/QDMBYGiRnAhbJHGNsTfP2+Fec7xirgHDyvhgVMo+52OsWSQG64u7Aa4Fkrsl6EfR8xm6K4VzBfuHK7OZUj+qU0WbDJv3Od54qwa/dX5KTHgqP+3hczuWFj4yaVMHIL/quTSIbeDtyZas0I7tigZ76wlcgCUgPJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jGk31qTM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jGk31qTM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786436290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rQoYgawLl/uFdgKGximNInLlgWg1ECp2Ql+MmIdl1KM=;
	b=jGk31qTMZe89vYcLuMtG1w29oh5Txnm9VLlzyTkNm3Pa+A6Hs3LmIVqpzk6aCJKSCVSHOF
	ZX08u9Tdo/pGoR9S45MDsa+weOr+Wf0SpIQrTFJPGqoru8QyDmOmNOR17nz7K4ThLaYpYe
	Lk1eI6MtKN+3gHV+Q9eWuJAvhVPG1x4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-113-cHZnaj5tNpaXS_733F2gyg-1; Tue, 11 Aug 2026 04:18:09 -0400
X-MC-Unique: cHZnaj5tNpaXS_733F2gyg-1
X-Mimecast-MFC-AGG-ID: cHZnaj5tNpaXS_733F2gyg_1786436288
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49955a9dbcdso15773295e9.1
        for <fsverity@lists.linux.dev>; Tue, 11 Aug 2026 01:18:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786436288; x=1787041088;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rQoYgawLl/uFdgKGximNInLlgWg1ECp2Ql+MmIdl1KM=;
        b=oGZOMaf/JCwvqGIMV0zXEZmxFtsLiH/HcXc1wERy5QAVo2jzdrSfTedv/w1P2DrFOl
         FR7ZxEzlCguGbsBbJDBH13V1GUIe3bPJFu2YzL017yiVzf+Ami2zCqdCO3FLGXCpOd+Y
         1VIdw8RSjXmfpB90/PRYoArk5/dtUiYLHRgba2FGVIVHAEugzl9d/KsdOr5pYzlHy8Xz
         GuaY7683aMK51JSvvfJJAk2MV3nGPAn64GBT8uAZS6ApaeUS2E19ahPVuh5GU4et7CX8
         8aMBjIDjD/85wPEs+2wB0Fvb5+jGKcySr9th2EOWHBhae8go9oh6wB9kn1aeJ95mu9a6
         n0gA==
X-Forwarded-Encrypted: i=1; AHgh+Rot+vifrEt9yC4N/rrQAOec5TCMMtfhlPDSqYPufIkFromcYsvy9ddxbn4tEopJhcUlldy2sBEyqw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyC0Ull+5s+rVslHFCYMg+AiEIX18DwkmsF3nS52ev0ivMGr7VR
	IOnvbtQzwKNlyHQJZ/pG/s4AblrKb3FsEgzGUYQmx75Lfa6JYDD1WXFRbo1IGSDg6dsq3cGPva/
	9Xo+RuccuxyV+5g5Uw6M93Xo0aXdlONl2qDtmdDB+LETZtOrb/OYzdjveIik=
X-Gm-Gg: AR+sD11Zrh5eG0wd5NOcC6TtdKPQqGmxwVKcsm3If9VN5gzUTfnRjp0LpZWZd94ioQ+
	GJAxhsfecax/hNaW66kjlX8SmYgHMHTeMRl95zFsxt0yU4uH3o8rRIzvH4o1gvXkdMjGAXqTyTK
	jD7Al55OoiJMZGU2mpsq+n2JwpshGgFo5Z+CUFZIGlNpds6ZIGqripH+esOQW2gHM3YAg9WuSQi
	XBNYZLkvFqvGd+X/uvKwugfZO822h3XzcNkgJAljzh3TZyj/LnT4P171KCNgLZ9oVyIJsKj0uif
	ETFp+b5KHRlqAtDEUKagbpPfgFBJMHXJRyagRjOI+mw7UQRcWFa7IUS7LMbUWPKVP40UWBv8y5N
	oXEckuKJiCFivf9J+jUVDRh5vBmSIUj0Qdne46Q==
X-Received: by 2002:a05:600c:4683:b0:499:5210:c537 with SMTP id 5b1f17b1804b1-4997842c1efmr23686095e9.1.1786436287897;
        Tue, 11 Aug 2026 01:18:07 -0700 (PDT)
X-Received: by 2002:a05:600c:4683:b0:499:5210:c537 with SMTP id 5b1f17b1804b1-4997842c1efmr23685055e9.1.1786436287342;
        Tue, 11 Aug 2026 01:18:07 -0700 (PDT)
Received: from aalbersh-thinkpadx1carbongen13.rmtcz.csb ([91.245.205.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499788f11b8sm26013505e9.10.2026.08.11.01.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 01:18:07 -0700 (PDT)
Date: Tue, 11 Aug 2026 10:18:05 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, hch@lst.de, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-btrfs@vger.kernel.org
Subject: Re: [PATCH v14 13/21] xfs: use read ioend for fsverity data
 verification
Message-ID: <anrZR9SarXJMBLgI@aalbersh-thinkpadx1carbongen13.rmtcz.csb>
References: <20260803200820.393203-1-aalbersh@kernel.org>
 <20260803200820.393203-14-aalbersh@kernel.org>
 <20260804183632.GO3556460@frogsfrogsfrogs>
 <anmNNNNy4YsV_KLB@aalbersh-thinkpadx1carbongen13.rmtcz.csb>
 <20260810183102.GY3556460@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260810183102.GY3556460@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NeeJetEBU4o_MSeKxsgzOOeOwXoW3cP2hQdOyMk854g_1786436288
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> > > "If we have fsverity and block device integrity attached to this bio,
> > > we need to run both validations from the separate fsverity workqueue
> > > to avoid deadlocking due to fsverity issuing its own reads."
> > > 
> > > (Assuming I understand the fsverity && pi case correctly.)
> > > 
> > > One thing I'm not clear about -- why is it safe to do the fsverity
> > > validation here if PI isn't enabled?  Can't that also issue IO to pull
> > > in merkle tree blocks?
> > 
> > Without PI, fsverity metadata is read without XFS bio completion
> > path, we don't get here for the descriptor/metadata reads
> > (see xfs_get_iomap_read_ops()). So, we won't block the queue, as
> > data ioends won't be mixed with metadata ioends.
> > 
> > With PI, all fsverity reads goes through this path. We could get a
> > case that data ioend is waiting for metadata IO to be completed which
> > in turn is pending for data ioend to be finished (due to batch
> > processing of multiple BIOs in the bio_complete wq).
> > 
> > So, this will issue more IO, but this IO will not get onto this
> > queue (it will go through iomap_bio_submit_read()).
> 
> Ah, ok.  Maybe add to that comment:
> 
> "If we have fsverity enabled but block device integrity is not enabled,
> completion of the fsverity metadata reads does not require a workqueue
> so there is no deadlock potential."
> 
> then?
> 
> (Just echoing you to make sure I understand completely.)
> 

yes,

I've changed it to:

+       /*
+        * If we have fsverity and block device integrity attached to this bio,
+        * we need to run fsverity verification of data folios from a separate
+        * fsverity workqueue. This is necessary to avoid deadlocking due to
+        * fsverity issuing more reads of fsverity metadata which would be
+        * processed by the same worker in the BIO completion workqueue.
+        *
+        * Without device integrity, fsverity metadata IO will not use ioends for
+        * completion.
+        */


-- 
- Andrey

