Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DF7330327
	for <fsverity@lists.linux.dev>; Mon, 26 Jan 2026 11:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769427526; cv=none; b=fPxJB0BaaZc7sg4xby6z+CYoSgm0SP8J6ha4LblYORAz7rnE+g1x3Bqee8gamj+2wtSF1Jb21J3bEn320zneUy457tu9vhbdhNId8NWjpLeUVuhIsuIWV4+p/yALAnAeTz8deA4YCshzJS2TfxuoNjHK+ihaUsia+O+jMuQghRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769427526; c=relaxed/simple;
	bh=1uHeImTsp6sBfS6z2fR4NTz5MZQI5nrGvZIHDs2hZB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=PnBK0jqPJizPiDvJ+ZPIUWUyRBXWgZmakpcsMH72aC0WGC42QDB6AWICTyXHwfLfawsZMfdl9cz6IjC2WYhhHP6E1XEQEeS/5m9vnMciNDUo4Mjw5lsgOGc0edjPz98dJFVJTrDBgtPMn+8DX5GEzggMndH6iWvh3eVqb2YnkB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jAaIVy1W; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jAaIVy1W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769427523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4JuzNiza5HwpYpdBev/Gv0nk5c9jouzzFaS/rXxrFzM=;
	b=jAaIVy1Wl8lYFNMtxCldZKifB/Om4xmUCABdzIsuw83zBVATXNK1snJ5HozHj1+qa4RLzE
	tZaQYtukcufhLdGmPl4OYk0eHtSvwICZDFV2SsYR6I01pTYlmM8MnHtWdvMz+asn1AM5EO
	AOTjhTTTN9iAkCEdFhoxvq86/5ciRPg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-378-IsgPgQAJNjSUF_ejKTcqJg-1; Mon, 26 Jan 2026 06:38:42 -0500
X-MC-Unique: IsgPgQAJNjSUF_ejKTcqJg-1
X-Mimecast-MFC-AGG-ID: IsgPgQAJNjSUF_ejKTcqJg_1769427521
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-b88484ee1f7so132643066b.0
        for <fsverity@lists.linux.dev>; Mon, 26 Jan 2026 03:38:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769427521; x=1770032321;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4JuzNiza5HwpYpdBev/Gv0nk5c9jouzzFaS/rXxrFzM=;
        b=CiB39qYlG0NVgdtNAJQtly2TO2c6gBSynLkZQHsNQud+y7rufPXo4bkN+ObkfTxhCr
         a3/thvNrcaiATyfByaPZSRofSD68dL8Pgfnsi2vAnSzcLT0dkhOOvi7vgYHHFs5EcBZO
         lPEk5jFfC2BqwVU0LXG9D2WrqoI8hDYlDnvjoBtXdfJQxci8CuG7oz4bhrssElqAuovF
         mguswc0TOg8jfd1PptSAj6DIfR2mpDYCLl8XcYjK+BY8MPdWIdBwdNtDFqT/66BCZVxu
         LGlP/gHM7tBq5WnLK8DWpyxDRgzKSLQbEx4jUoNUJHFHT/zUxElvmsncjU8HH0BnpASr
         s9TA==
X-Forwarded-Encrypted: i=1; AJvYcCXF1esqsj3JEc10mIM+wqEL4D8SlvcS1aK7jS3PyZjh3X8e8LHZc4uTP9F2PMiBMotCdypfu17Gkw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxqfA26GVUy+iPk15C+p+lsmgij4TAhe7PVDOrv/SmaysXaKk68
	9Ve9SIfUXnOAU/6fRkx4VLwZlkhaIu4xwcU4VAoxWCdK4Jm5VB6YEWRy4PRTCRH+DjzowQE49r5
	Q91+UEReJPPjF+EgnfYM6mALBHVe23XoRkFT4pho7ym1ZCjacHoG4LoSCCsw=
X-Gm-Gg: AZuq6aKxb67gb8dFX8CY6o7LGexpLwFtHIF2sfKQJmfrdyx6YgbOC4u3Mep1BcuG1PG
	6ZX+jc5Z6D0HLtFv7sBofTBqLSCSP6HPbmAPasjKkObEjPJo3UOl02Cd3Z92g+C+A+3QtOfKq8D
	feNZ/WXWx3HBDLqYWGwahdn2fTqBNCNO4p8TrDnFxnWSI0plvK0IoLtS6QlfzmXhRreuJ3C/3IC
	S3qk6TVqmiUI0WSEKx5WN933NDY0/f9uEFEI3JhJKTt0rIqy/WTJryiL2kX9UF/qaRdmQflJpRy
	BBiae0hRBap/JoxNuJJsAcuGR8hebKKuDhKilBS3w0q6JOtkvaB8hFCtQKtq0CfYRxkYq1Jytc4
	=
X-Received: by 2002:a17:906:6a0b:b0:b79:eba9:83b4 with SMTP id a640c23a62f3a-b8ceed585e1mr334869666b.6.1769427521195;
        Mon, 26 Jan 2026 03:38:41 -0800 (PST)
X-Received: by 2002:a17:906:6a0b:b0:b79:eba9:83b4 with SMTP id a640c23a62f3a-b8ceed585e1mr334867266b.6.1769427520658;
        Mon, 26 Jan 2026 03:38:40 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b3d9ae1sm622689466b.13.2026.01.26.03.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 03:38:40 -0800 (PST)
Date: Mon, 26 Jan 2026 12:38:09 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, linux-xfs@vger.kernel.org, fstests@vger.kernel.org, 
	djwong@kernel.org, fsverity@lists.linux.dev
Subject: Re: [PATCH v2 2/2] fsverity: add tracepoints
Message-ID: <fr5qdcfxeok2rjtiqwz7jibxccq7ntrczvfcnvv2g3avauljdo@lmzqhlnq3vox>
References: <20260119165644.2945008-1-aalbersh@kernel.org>
 <20260119165644.2945008-3-aalbersh@kernel.org>
 <20260121003917.GC12110@quark>
 <20260124184954.GC2762@quark>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260124184954.GC2762@quark>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6Y90_ZYQihjfdavRvOG-ztqMHnkHMR1P-XJsN5XJmp4_1769427521
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-01-24 10:49:54, Eric Biggers wrote:
> [+Cc fsverity@lists.linux.dev]

ops, wrong autocomplete, thanks!

> 
> On Tue, Jan 20, 2026 at 04:39:17PM -0800, Eric Biggers wrote:
> > On Mon, Jan 19, 2026 at 05:56:43PM +0100, Andrey Albershteyn wrote:
> > [...]
> > > +	TP_printk("ino %lu data size %llu tree size %llu block size %u levels %u",
> > [...]
> > > +	TP_printk("ino %lu levels %d block_size %d tree_size %lld root_hash %s digest %s",
> > 
> > Would be nice to make these consistent.  3 of the parameters are the
> > same, but the naming and order differs slightly.
> > 
> > [...]
> > > +	TP_printk("ino %lu pos %lld merkle_blocksize %u",
> > > +		(unsigned long) __entry->ino,
> > > +		__entry->data_pos,
> > > +		__entry->block_size)
> > 
> > Likewise here.  So now we have "block size", "block_size", and
> > "merkle_blocksize", all for the same thing.
> > 
> > > +	TP_printk("ino %lu data_pos %llu hblock_idx %lu level %u hidx %u",
> > > +		(unsigned long) __entry->ino,
> > 
> > And here's data_pos as a %llu, whereas in the previous tracepoint it's
> > just pos as an %lld.
> > 
> > > +TRACE_EVENT(fsverity_verify_merkle_block,
> > > +	TP_PROTO(const struct inode *inode, unsigned long index,
> > > +		 unsigned int level, unsigned int hidx),
> > 
> > And the 'index' here is what the previous one calls 'hblock_idx'.
> > 
> > I think consistent naming would be helpful for people trying to use
> > these tracepoints.
> 
> Andrey, let me know if you're planning to send a new version with the
> naming cleaned up, or if I should do it in a follow-up patch instead.

I will send v2 with renames

-- 
- Andrey

