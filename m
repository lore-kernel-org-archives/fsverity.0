Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA6758AC6
	for <fsverity@lists.linux.dev>; Tue,  2 Apr 2024 09:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712051523; cv=none; b=k63VnS+mdUQ0fr2rr3ZGrXeDh5bCRR581BoVcSgphPRrIUN99q3a+9UeuF024nWMmuaf65WgUNVN/5Y/rnFdezH7gC7YGs1yZ/mV2/ecXYlEWXCFRt3gVzefhizK520DKME8e7tZNjRf5T/ecQ5pxcZmIfKCFc7rfC4Cp1IyLxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712051523; c=relaxed/simple;
	bh=BuLeAglhQb+OLxYbcXbn2earzV76rOgrs3rntBWRzGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=DBcrnxDDP5RIwHI0tZD9+oeFRJf7pD+PDoOgR/fPbqUFZZy4HcxBkCLY+ZNDCXypp7Bz84QYTTWlrXVeYNlh+EBCoNzniVWb4WhzXJgUE+2CZL6qxdNf29DoJaYmlivXGQnsgwqcPsO8eR565AU91ZJy1XtiKnGZZmIAlsKG794=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JU7CYQOw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JU7CYQOw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712051520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xE74JKyaieEZ865fOLwKIWnIcIp4KmBPIzJgotjw5B0=;
	b=JU7CYQOwEsrn2mxR1YqSlsEy3+6ODFGTcaSondEszrkZq9GuhGs9x61686kdKmcUvYWWoQ
	B1r/wJRfW1KyGJO25Ha0hUMOsoiKONE1NCm8SC27ES6ECXzkZvDGagATULUC94DGoiZ4mZ
	xZPjfgbCtGWX8xCoifYRzlEtyQQq2u8=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-ZucOPlJAO9-Lbxt6R_veVg-1; Tue, 02 Apr 2024 05:51:59 -0400
X-MC-Unique: ZucOPlJAO9-Lbxt6R_veVg-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-51596f968c1so4703142e87.3
        for <fsverity@lists.linux.dev>; Tue, 02 Apr 2024 02:51:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712051518; x=1712656318;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xE74JKyaieEZ865fOLwKIWnIcIp4KmBPIzJgotjw5B0=;
        b=S4OURXQ+p26AIakMzOoL+a8+XOSCmvWUXoTUETWx8CSpmY/AHoCeWfRZ+rMsHEh+oj
         jcB6aOyZ0J/5zgDlamT5BpK6/RH5LPOGLtw7yp0O782L9SoywHoJ3nqcNxcrbGc7XPbg
         4FJhKnr7Zja2ozMKjLEdXELOUeOUR1f1m5Ptaj4PMd6/dpM+HnX0GVwzILau5HoV9h56
         GvSn9hwf1SPxxOKNEkApMuBW5s403uH/V1WeBRLhVqfzKVxDfGrgaUmTiYcqGrQZ+nny
         a2XIybRrZWv/Y6dZNc2bU/G1uzZi/4zmBzd3WyMI4UU0CMR064kMnvwmlvxZ4Caai805
         1mQg==
X-Forwarded-Encrypted: i=1; AJvYcCXcgzjCNa6QxsEAy6Hz0TCODwXgl8vjhEZr7HFk7on/m3zWyj/EbcsVdY/LhggZlBPtOylMWQ648RCLW+HrL7G7RZd5iDWMWe4=
X-Gm-Message-State: AOJu0YyjXv8X0ZsXfHVQH38up5c5e0lv0ozjxVUOD1JVX6aYxrAb8wKZ
	Oa/36mnVmeLqdszlBClGAfD6iAFD3eqAgLOqPujp++Gj2ngy7pC/vLyjOIfhsIyQvP6IO9IjYkL
	WCVxqVldNQoMSgw5D9730rZNN0xwL/NEA9QYOfcs70KhxV5HBvcZxDrU=
X-Received: by 2002:ac2:5dc3:0:b0:515:d4bc:c63e with SMTP id x3-20020ac25dc3000000b00515d4bcc63emr6164313lfq.63.1712051517734;
        Tue, 02 Apr 2024 02:51:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgP8+1XbBJ5ff68r07k1FqXNHSiMuetoQuLpbDHs4hLQfzFExtQKN0mhpH/OIqMg/05NwZRQ==
X-Received: by 2002:ac2:5dc3:0:b0:515:d4bc:c63e with SMTP id x3-20020ac25dc3000000b00515d4bcc63emr6164300lfq.63.1712051517095;
        Tue, 02 Apr 2024 02:51:57 -0700 (PDT)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id q17-20020a1709060e5100b00a4623030893sm6228283eji.126.2024.04.02.02.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 02:51:56 -0700 (PDT)
Date: Tue, 2 Apr 2024 11:51:55 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: ebiggers@kernel.org, linux-xfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, fsverity@lists.linux.dev
Subject: Re: [PATCH 01/29] xfs: use unsigned ints for non-negative quantities
 in xfs_attr_remote.c
Message-ID: <nx4hkurupibsk7fgxeh3qhdpeheyewazgay3whw5r55immgbia@6s253r4inkxn>
References: <171175868489.1988170.9803938936906955260.stgit@frogsfrogsfrogs>
 <171175868577.1988170.1326765772903298581.stgit@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <171175868577.1988170.1326765772903298581.stgit@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2024-03-29 17:36:19, Darrick J. Wong wrote:
> From: Darrick J. Wong <djwong@kernel.org>
> 
> In the next few patches we're going to refactor the attr remote code so
> that we can support headerless remote xattr values for storing merkle
> tree blocks.  For now, let's change the code to use unsigned int to
> describe quantities of bytes and blocks that cannot be negative.
> 
> Signed-off-by: Darrick J. Wong <djwong@kernel.org>
> ---
>  fs/xfs/libxfs/xfs_attr_remote.c |   54 ++++++++++++++++++++-------------------
>  fs/xfs/libxfs/xfs_attr_remote.h |    2 +
>  2 files changed, 28 insertions(+), 28 deletions(-)
> 
> 
> diff --git a/fs/xfs/libxfs/xfs_attr_remote.c b/fs/xfs/libxfs/xfs_attr_remote.c
> index a8de9dc1e998a..c778a3a51792e 100644
> --- a/fs/xfs/libxfs/xfs_attr_remote.c
> +++ b/fs/xfs/libxfs/xfs_attr_remote.c
> @@ -47,13 +47,13 @@
>   * Each contiguous block has a header, so it is not just a simple attribute
>   * length to FSB conversion.
>   */
> -int
> +unsigned int
>  xfs_attr3_rmt_blocks(
> -	struct xfs_mount *mp,
> -	int		attrlen)
> +	struct xfs_mount	*mp,
> +	unsigned int		attrlen)
>  {
>  	if (xfs_has_crc(mp)) {
> -		int buflen = XFS_ATTR3_RMT_BUF_SPACE(mp, mp->m_sb.sb_blocksize);
> +		unsigned int buflen = XFS_ATTR3_RMT_BUF_SPACE(mp, mp->m_sb.sb_blocksize);
>  		return (attrlen + buflen - 1) / buflen;
>  	}
>  	return XFS_B_TO_FSB(mp, attrlen);
> @@ -122,9 +122,9 @@ __xfs_attr3_rmt_read_verify(

fsbsize in xfs_attr3_rmt_verify()?

Otherwise, looks good to me:
Reviewed-by: Andrey Albershteyn <aalbersh@redhat.com>

-- 
- Andrey

