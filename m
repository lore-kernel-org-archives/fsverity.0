Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCD11CB31D
	for <fsverity@lists.linux.dev>; Thu, 31 Jul 2025 14:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753973694; cv=none; b=Dku5xnZfwzy7ynXNXYjPlzdmrVcFFKrwaY0PwQ6z0u5ngd5a6iUX2c0722s/3grmqUxUXIBydpplVpO5rRGd87+i3swqwNTW+x4/iJrUsyxiS3nwxtpydvVS/R/ToDU/nqyPZWyX5S0ndkhFSmfNtvBuzLs0uiikBAGWBycQKtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753973694; c=relaxed/simple;
	bh=PTsHhQ/kGe0Fu+dlTBpQcyKEL+I08vmxkGV2copBL7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ONycpUsKsbfr2xtB4G+do/FHC0j/9Pu8q2Q8OHjQUocrWxzj/e2/i8Ou98KKF6GZ9d/PHo87kHoyobQBVRoKwPXh7MJUPsYTcIWPXfoCmxkGQhiXYE/lPcDBCqxncf1CDAX/vccwt7dHbiYIoF2Q2MtUyO689clsRkcn5OgkIpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MyYviVzf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MyYviVzf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753973692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BrfdQfBwi1hWO79GIcUjuPsQVqZpwzL238pikFlNxhM=;
	b=MyYviVzfWnAVf7chU1pPTbu/x3AG6hH7vyrkV6HW6kgpg3Wq6XyoFeR5+NckKyTyrb38Ee
	7JShpqovwohTllb1ImbXzznWe4D+kSPzUc+DUNzI/PZX6WNy0c3Xqwxl9HpKW0EXNVz7qj
	jUhfW5arWgTN8FtMhSe9f13uGFNIGF4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-nLvW3uDIPLuV50iMFeLoWg-1; Thu, 31 Jul 2025 10:54:50 -0400
X-MC-Unique: nLvW3uDIPLuV50iMFeLoWg-1
X-Mimecast-MFC-AGG-ID: nLvW3uDIPLuV50iMFeLoWg_1753973689
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-af4f3e4514dso133451766b.2
        for <fsverity@lists.linux.dev>; Thu, 31 Jul 2025 07:54:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753973689; x=1754578489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BrfdQfBwi1hWO79GIcUjuPsQVqZpwzL238pikFlNxhM=;
        b=FkI+Qt5CHjcSQuG0o5znJA4ZgYjP9QlMbNWuXVVkfvt2FV2AO5NY4kI9AfP6WioT6y
         2sy9Lb/SF1yJ6LeNvD785oynfk7n7jnyfKpBSdYsu4nNF3xjpW7anbjxqbqGigfde/7j
         1KJmzgdbtme/y0w2YtzR2e8DTgcwcXjRwu5Amejyw+HDVrecHhUbz6krRfCNJUdJN93E
         eGkX4zScM7s0/eU0VOrfcnPg6U5pwZI1mkgJiY6UMe7hqMh2rqiKItgGQYk5k2X85Bsr
         zOKzSpL+WkSNA0qb3lAXEKCNAQSzYn4agnl2GE/KKGeoob3RLXudcsvUnPwqu87gBxth
         PFHg==
X-Gm-Message-State: AOJu0YzIW0NPg3GvYyn64hNa80H5MvFloYsv0Az3pda6/B9igtg8i+SI
	doIf5IjLyZcGy+XVPN+3bZlg+ut8LhheKulniDOr0pxTH/gZXjUmkOHIs6Vff8I18k/bd3NmwCZ
	I9ERiM8vCT8gGMGK8iKxU/+vQKY3d5lQ8gERpWCioGZ1FalDWVvlbgCASINw=
X-Gm-Gg: ASbGncv3jakjhtSz5kDGbhH6g+cJpxR93wuo/3lWQLcshfvl/RqvmCk1Kym6SZG7WLd
	jmpId+WYb2Tk0XSEw3iXiXSpyc7yoVIzQt4yVgyeDdQAvL5kHHWSh5yopbdVDRgPiPHSrOuIQFK
	6Irc+ulJj0OeMzLedSLTgE4tb9lob8VqnClHX/S24ScSfV1nixt8fUrTPyJ8mQziQIWFLz2fCC0
	11fH5PIyzPFRq4LT4J3p1Uy4StUNq1KOd1z3yoe8m1QmQ8iMmdkf9xftYww/4vqwPS7W9U7v6Ug
	kV9n+/MWEe5hKON0UbrABjADzT8bOBeTSgr7B9S47zcBnqHgQroPxkdm+rk=
X-Received: by 2002:a17:907:728c:b0:ae0:ded9:7f54 with SMTP id a640c23a62f3a-af8fd97fc2fmr965811566b.28.1753973689110;
        Thu, 31 Jul 2025 07:54:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQ3bIkVHsPhtB7sHOYcgzjtiQWjSNXEBdItzzWHWGYY6piyQqHIyCNm3v0vApEyCqdPpdWZg==
X-Received: by 2002:a17:907:728c:b0:ae0:ded9:7f54 with SMTP id a640c23a62f3a-af8fd97fc2fmr965807266b.28.1753973688663;
        Thu, 31 Jul 2025 07:54:48 -0700 (PDT)
Received: from thinky (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a076409sm124698366b.12.2025.07.31.07.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 07:54:47 -0700 (PDT)
Date: Thu, 31 Jul 2025 16:54:46 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>, cem@kernel.org
Cc: fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-xfs@vger.kernel.org, david@fromorbit.com, ebiggers@kernel.org, hch@lst.de, 
	Andrey Albershteyn <aalbersh@kernel.org>
Subject: Re: [PATCH RFC 26/29] xfs: fix scrub trace with null pointer in
 quotacheck
Message-ID: <s36etkudrevqb35gfscyfeibrwetxyrepuc2z2xg2bcgp7dzpb@hhaaawzg7vjq>
References: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
 <20250728-fsverity-v1-26-9e5443af0e34@kernel.org>
 <20250729152839.GC2672049@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250729152839.GC2672049@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: npVr9L25XfizgGGpVnpnAFHlI2_Xmp_kRpjmzqLWVZU_1753973689
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2025-07-29 08:28:39, Darrick J. Wong wrote:
> On Mon, Jul 28, 2025 at 10:30:30PM +0200, Andrey Albershteyn wrote:
> > The quotacheck doesn't initialize sc->ip.
> > 
> > Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> 
> Looks good,
> Cc: <stable@vger.kernel.org> # v6.8
> Fixes: 21d7500929c8a0 ("xfs: improve dquot iteration for scrub")
> Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

@cem, could pick this one? Or if you want I can resend it separately
with tags

-- 
- Andrey

