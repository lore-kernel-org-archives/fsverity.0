Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23F2171096
	for <fsverity@lists.linux.dev>; Tue, 30 Apr 2024 12:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714481136; cv=none; b=Ox+lLcdcyAazGgTgkukhWJTLdLsvIHliXq8uK2wUAagyiab29ZQi2jwHDleRrOdtSgQ6/nRChtqfGsg+X3Mv4MFsDMCc+mefxNIZ/FwIoJtooZz1nQ4YHepTy06WHRuTziHRNQoJC1V0/fwt95fBwGcHfilMzRwBkALck0mTG2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714481136; c=relaxed/simple;
	bh=sBwO4tPURPfK/Tpoqq7ijMiBEHW84wlDyIODrCdIFCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=oYg2Rzsg5p+ww86NsgpREc3GD1rCoiKkM2Q0GTBSAh6kfJye08/rh+5fqbwGIK0PYZ30zoYMKcCmYVkevsO1/gkZgfSruR/AqzG8lkbvXd81sji83j/wZqx/jYVy9VNl7mxlFjyNAyEAhdkhtUqU0VcCBAcNcSW3toUF7UYshOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HDCOFFrv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HDCOFFrv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714481133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R4X6n0pLuVBUf+BlkM+ca3r2rZEzvEw8vYRriJB7tN4=;
	b=HDCOFFrvaj8c3/90tyF8lTssXiGQVLHf1YRgOnhF7Rb/0VKdGKomL3Vvf7GLoBb6fGZqNu
	rwsSImXjGVJEVNV+4+0Rwz9YBeKB0rMGU429XXA7J/p/uPZLENOdH3fdz4EcF2xqUXXXfJ
	pFqxbIi847JLAki7KSTAKNus6W1Dp2M=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-32-AI9PadtiPTuT-vonse65ow-1; Tue, 30 Apr 2024 08:45:32 -0400
X-MC-Unique: AI9PadtiPTuT-vonse65ow-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a524b774e39so607191666b.1
        for <fsverity@lists.linux.dev>; Tue, 30 Apr 2024 05:45:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714481131; x=1715085931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4X6n0pLuVBUf+BlkM+ca3r2rZEzvEw8vYRriJB7tN4=;
        b=okfZ0LU8tHstnEBTXuHOVe3CYHOLXapsPcOM0e/bxlou2tjFbFa/hQX/YLZNbvmGib
         uf6uBBaAwQO+9RnBuNpNMNGh9nC84PB5HX0BnCQTsj18ytGhaLQIJMx0tcLvBNduuVUi
         VD9Pcs4zR3CdNZoclNwnpuzzWyOeoRYoptDb8oONurXPqYajG/8+kVazFE13mCXdXiFM
         vm7tWTEAQVMedv3XgtNBlSTqxoZa/gf1gVy0wIwuK8gijGmsr3jE4PHpc8OTTiEkGB//
         p2YMxinJMmQFI/JEPb4N5IviYFJHOt9DTuJVuOl7FNnatf+AZDGmAt+tx4EFjc6oGKnJ
         4CEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMVNWTePM6JyplRs0MQJtfXetX8Ng3Q8Avi/KAFUK9fXekUHIZCJr1W67il7JexjA5RODvkyVGdT5ZX+iJS+CbYNWie1E0ajs=
X-Gm-Message-State: AOJu0YyCjpw2zYidpjUfR0QaPEPzJpxgQoTYAWrZF2wHahiXiSAUBgon
	l+eaN6Zr/uQ7Re3WI72IbAqoV3WcbMmttfpQtgqqR2DqCw8OD+pzEQAZF1TTGA+8/+uLI1ALDc3
	OnjbwweBYlyTxnuyaSRkU9Gdr9HyWtFa8K0N+ZJmWFcyyQMADECh6AM0MMGqUsms=
X-Received: by 2002:a17:906:384b:b0:a58:7172:1ab0 with SMTP id w11-20020a170906384b00b00a5871721ab0mr2477677ejc.16.1714481130942;
        Tue, 30 Apr 2024 05:45:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTDZWzi552+qruMRrzcUaprNH9Uh7FvvQtJYCo7WBIUu82K3ES4iheNJ+29jVddUBCcqoTNQ==
X-Received: by 2002:a17:906:384b:b0:a58:7172:1ab0 with SMTP id w11-20020a170906384b00b00a5871721ab0mr2477642ejc.16.1714481130382;
        Tue, 30 Apr 2024 05:45:30 -0700 (PDT)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id a4-20020a1709062b0400b00a58bf7c8de8sm5776845ejg.201.2024.04.30.05.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 05:45:30 -0700 (PDT)
Date: Tue, 30 Apr 2024 14:45:29 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: zlang@redhat.com, ebiggers@kernel.org, fsverity@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, guan@eryu.me, linux-xfs@vger.kernel.org, fstests@vger.kernel.org
Subject: Re: [PATCH 3/6] xfs/122: adapt to fsverity
Message-ID: <wrxpj5cduflmsthmgrlbdewpis5mkpz6rnrcsmgapybtznavxp@dryj5f364uxa>
References: <171444687971.962488.18035230926224414854.stgit@frogsfrogsfrogs>
 <171444688024.962488.13214660928692324111.stgit@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <171444688024.962488.13214660928692324111.stgit@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2024-04-29 20:41:34, Darrick J. Wong wrote:
> From: Darrick J. Wong <djwong@kernel.org>
> 
> Add fields for fsverity ondisk structures.
> 
> Signed-off-by: Darrick J. Wong <djwong@kernel.org>
> ---
>  tests/xfs/122.out |    2 ++
>  1 file changed, 2 insertions(+)
> 
> 
> diff --git a/tests/xfs/122.out b/tests/xfs/122.out
> index 019fe7545f..22f36c0311 100644
> --- a/tests/xfs/122.out
> +++ b/tests/xfs/122.out
> @@ -65,6 +65,7 @@ sizeof(struct xfs_agfl) = 36
>  sizeof(struct xfs_attr3_leaf_hdr) = 80
>  sizeof(struct xfs_attr3_leafblock) = 88
>  sizeof(struct xfs_attr3_rmt_hdr) = 56
> +sizeof(struct xfs_attr3_rmtverity_hdr) = 36
>  sizeof(struct xfs_attr_sf_entry) = 3
>  sizeof(struct xfs_attr_sf_hdr) = 4
>  sizeof(struct xfs_attr_shortform) = 8
> @@ -120,6 +121,7 @@ sizeof(struct xfs_log_dinode) = 176
>  sizeof(struct xfs_log_legacy_timestamp) = 8
>  sizeof(struct xfs_map_extent) = 32
>  sizeof(struct xfs_map_freesp) = 32
> +sizeof(struct xfs_merkle_key) = 8
>  sizeof(struct xfs_parent_rec) = 12
>  sizeof(struct xfs_phys_extent) = 16
>  sizeof(struct xfs_refcount_key) = 4
> 
> 

Shouldn't this patch be squashed with previous one?

-- 
- Andrey

