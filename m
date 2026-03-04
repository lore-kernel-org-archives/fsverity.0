Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128823988FF
	for <fsverity@lists.linux.dev>; Wed,  4 Mar 2026 09:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772616641; cv=none; b=mvRiAbYoXdj88uSV96IVifvkIH90NguJ5icZ/cgud1mTOxChVn0AzUODrxoZb9AXzv679frrNwyfGSVvIEtURIsnzE4FBj+8RZopMrW9j8E2RvhJLBhAOv6PfisDQrhRJd1PfTpJBMofDF6aDQPtA5HMWoD9m+ACg+NCmllguag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772616641; c=relaxed/simple;
	bh=qyvL/iXE6+TakoKVVxVCaopqm1BpX+f7Q05dx5gBHDE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HDPr1OfTBfEcrwDuczZC8CdfD0X5RNhHccT7x0TQK26K1nH92n70iWFqAbUtQ/XNwi1eBgSHHxpSGlmraDPEj8jygOCOGtB4txkkqXediCY6VOEx22t1lVZ337M+v47H2gLV4YQ+QwVPaUYociOSoH9tazQe+WVe62CEQ6s+elQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VXBfZ85W; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VXBfZ85W"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-483a233819aso64872395e9.3
        for <fsverity@lists.linux.dev>; Wed, 04 Mar 2026 01:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772616636; x=1773221436; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BUzQoESoh9/PqMSFbMpuw4Pmh5IPXiGP/qvOjxX4wwo=;
        b=VXBfZ85WCNnS1YA4riE7WlgmBU7lDNyYyUkse0B+ZqjOYf4uij3TO0G0VIVlItsoyQ
         zAisFncEc0hzAiz4WVTGvlxd7IlvTOo6yMyx5qxCLP66yZzaTWPAyJdNuH1ivv4Bjtph
         hWFMcdVn3En92NYldPlrnVGr70YURQO569q9dc9Mnt68sMQBldt9RLTXIQyR37Rg4oze
         GdeM6Es1wjdG5iCUgXW5efpFfJApVOOw9ZFt7aTzcxg7OoXctaJXnzHzyA6zs59BdHgJ
         5tx48GMwBIkyqIWAJ4dlLGO+IKeKjfX749jXPLP1dr4XWtMiVmSdXK1+slJu3yWNQHtU
         pb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772616636; x=1773221436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BUzQoESoh9/PqMSFbMpuw4Pmh5IPXiGP/qvOjxX4wwo=;
        b=f1VEiIo3CmcrZI9I4P+ZhURjCVXSa6PXv3XtR6HQ4VPtoWYIqFKI1vaY0LlamcccO9
         htUeikPrGZIktWT9F2u2opW1hJAHMsoR9yVAgnM+RsiRWhHkVvlIYs+5rdAg30Wh+3oL
         PgYlMlSd8wL0BkN/XkFAr8D9a+XRDGJgg/LZBT9h9bYv/QeEyii2g+Z1o9WhwUlQdsWv
         Ww1XcSUbyVthnQThiGqUizi/J0il+EIbphKdLJzg4tYKZ2KpoVjnXjsDkO2xzOCBGveg
         8nSpXoKHtgRqUrxVW0l1l/PHzaWtA+KabBj/um0fbmyL1rhAC+NOEKCqbamoGvYQAC8j
         xrIA==
X-Forwarded-Encrypted: i=1; AJvYcCVJktseGSSaTrAnmyGrMgPFJjpy+yOlFj0rUMhGkwleAPQm3oXaKb+DHRSLsoVDUV9BoHmBXKiPjQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwCzSmGyM30JnviTPJyNERffnWZtaa29G5WLNaCj76JhJT2roo9
	nZa4fUv3HykKyevBfiZ9Z2ZJUtXjEYpZt/KFqViH+xJwXVbwslrMzwu6
X-Gm-Gg: ATEYQzxlCm5PmEHckO9xb9TrpFPAvK5/LmfOmZusOB0iU+iJaRfd1qdl7Td/tM/DDW+
	AVMMTjSuegomqg3Tcyvn3bLRRABgnC5rIbnXFhB+MFy2VGOO+KF3BafYhDqUli++ZNCfNL+CBaT
	mz+8YDUEjalrjOXAqhQfHe1u0wMFg9jCrDC6tUwXl+g9cuGv7NfwyWO+Col3jy/19jbNKBuVP8X
	N5siQAexWkFiXDeqaESmtHhYpmDV54OKZo6mCwmqX4a6QWhqlxtxN34NyNST3jwyL8aIz+Cv/Vr
	U0LNG4lADCHOTyUxAAhUkMRjJnu/XbvGHkvuby1Z+LnIXuAhwhqMcnj8cLuol3bweEyf+K69Kd9
	W1CmF0rsk3uIZuliwyAFEnLI6owC+qHHwgTbub6INWRrB+oaoXMMBjKYIjoFF2UjwFfIGm9vhA1
	Cr1V5/N2Cchys02EJNoCr0OPoMVDRKJD/LW2tLuQxcrJGvJhHNE5kBhDtXvjjDu6cs
X-Received: by 2002:a05:600c:8b53:b0:483:498f:7963 with SMTP id 5b1f17b1804b1-4851989024emr19550785e9.26.1772616636117;
        Wed, 04 Mar 2026 01:30:36 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851884225asm38972555e9.6.2026.03.04.01.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:30:35 -0800 (PST)
Date: Wed, 4 Mar 2026 09:30:33 +0000
From: David Laight <david.laight.linux@gmail.com>
To: NeilBrown <neilb@ownmail.net>
Cc: "Jeff Layton" <jlayton@kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 nvdimm@lists.linux.dev, fsverity@lists.linux.dev, linux-mm@kvack.org,
 netfs@lists.linux.dev, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-nfs@vger.kernel.org,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-nilfs@vger.kernel.org, v9fs@lists.linux.dev,
 linux-afs@lists.infradead.org, autofs@vger.kernel.org,
 ceph-devel@vger.kernel.org, codalist@coda.cs.cmu.edu,
 ecryptfs@vger.kernel.org, linux-mtd@lists.infradead.org,
 jfs-discussion@lists.sourceforge.net, ntfs3@lists.linux.dev,
 ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org,
 linux-unionfs@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org,
 selinux@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, netdev@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-hams@vger.kernel.org,
 linux-x25@vger.kernel.org, audit@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-can@vger.kernel.org,
 linux-sctp@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH v2 000/110] vfs: change inode->i_ino from unsigned long
 to u64
Message-ID: <20260304092559.554ac9a9@pumpkin>
In-Reply-To: <177260561903.7472.14075475865748618717@noble.neil.brown.name>
References: <20260302-iino-u64-v2-0-e5388800dae0@kernel.org>
	<1787281.1772535332@warthog.procyon.org.uk>
	<1c28e34c7167acf4e20c3e201476504135aa44e8.camel@kernel.org>
	<177260561903.7472.14075475865748618717@noble.neil.brown.name>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 04 Mar 2026 17:26:59 +1100
NeilBrown <neilb@ownmail.net> wrote:

> On Tue, 03 Mar 2026, Jeff Layton wrote:
> > On Tue, 2026-03-03 at 10:55 +0000, David Howells wrote:  
> > > Jeff Layton <jlayton@kernel.org> wrote:
> > >   
> > > > This version splits the change up to be more bisectable. It first adds a
> > > > new kino_t typedef and a new "PRIino" macro to hold the width specifier
> > > > for format strings. The conversion is done, and then everything is
> > > > changed to remove the new macro and typedef.  
> > > 
> > > Why remove the typedef?  It might be better to keep it.
> > >   
> > 
> > Why? After this change, internel kernel inodes will be u64's -- full
> > stop. I don't see what the macro or typedef will buy us at that point.  
> 
> Implicit documentation?
> ktime_t is (now) always s64, but we still keep the typedef;
> 
> It would be cool if we could teach vsprintf to understand some new
> specifier to mean "kinode_t" or "ktime_t" etc.  But that would trigger
> gcc warnings.

A more interesting one would be something that made gcc re-write the
format with the correct 'length modifier' for the parameter.

That would save a lot of effort!

	David

> 
> NeilBrown
> 

