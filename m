Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8AF2EC09B
	for <fsverity@lists.linux.dev>; Fri, 20 Feb 2026 17:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771607071; cv=none; b=o90JCV90bVbWS4VwWLyfBFV4RK1UtTO5/d3sVVU3RTf4FiMaIiOC3yVrBAA5owfIffpPbIhWh2Y0uWe6PQVT7eRxyDV5rxX3G/bUNWfsoy7AEA4qPjAknHI3WfXOYbHWfeyRmI2xMZ9FlzbGIIde2GoMGJ4bVxzKfXpc9njOevM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771607071; c=relaxed/simple;
	bh=lWC7kIUn6Kd2qGxzhX0BjMlBKu/uQyUotx5PYF3zyLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=qyPfoPOlWrtp9t1grZK5K6WJ1f6WJ7hllcf7Ck/uYiE75xwqBIP2QMOrBhHwxv2S7w2UBeFZp4l0J0UDBzO0Ac4tjx+JkehcOGsHqw4N+1JfsYZDeckuNf0LB6mAshnN3hdhwTkw8ljgFjfJ8TPcnbAkNlW280fuvKx/6Ipbpls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J4Z/TZXi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J4Z/TZXi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771607068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rKfTudlhTYtyQKKmPYvZFA0VzYKo3BAqGcuaoLTxpEw=;
	b=J4Z/TZXiqxY2Ws1pAjHLnx78TY2eAAFxOBQC/Ns5/ZbllS56z665HIHd1CMFjoxkkY98PC
	ZNrgF18Plmg7GJs+XymWzr7uW02LMI/Kmg2ZuZMMbyjV0UfS/FJeUvIE4wlqWseAm8tmnX
	IJHsOiojYpDnngKLcjKXBsCWwjWGAJU=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-l9qw9r4XPbCCcqah1cuqTQ-1; Fri, 20 Feb 2026 12:04:24 -0500
X-MC-Unique: l9qw9r4XPbCCcqah1cuqTQ-1
X-Mimecast-MFC-AGG-ID: l9qw9r4XPbCCcqah1cuqTQ_1771607063
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ad44941ea2so14847225ad.1
        for <fsverity@lists.linux.dev>; Fri, 20 Feb 2026 09:04:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771607063; x=1772211863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rKfTudlhTYtyQKKmPYvZFA0VzYKo3BAqGcuaoLTxpEw=;
        b=Uwl3Vwe0HIZFLp8paTppnb8pur1Hmyn9QRJGLRhYjRPNB/jhMdQuCGgh6zp9U52bVz
         DLUzxXfnCLunq1L/jfbYiUYAniakyThRXGOUHOmlCffYhBnjKJV0yHsM3nv73TikK/I+
         AczlmgcdnfADXdc8ncYu98yqChbUeu3uEbMZlfMgdrjzF0WWVs76VerMZSS52vbBp+Q0
         G73YjWdCQ2Qp03RZnW5NrsGj1GzWLg0wWrRMv+cXfngBOCZxy+JcHCkQvGA8Glih0ylE
         Qty7I1qXMS04W5WurJg+By9/zK5QVoPqXx2UrTWMKtKK241CcuEJEqnTi9sPtTzrObQJ
         pTag==
X-Forwarded-Encrypted: i=1; AJvYcCW/ehVdcwbwxhYloqApwjzrRRV4gwEH7uAZiy33pfO5fPZofhCcB+tGqFY6V3LkI7ADnOGPQBJdlg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwtUBOt/IiqiLkvoIu6A7XKNRUYRGxlcWwU3dDosdp69iP1J4y5
	ay8UO5CQPQYSPxvgQkKOGAtFvVzKWaraUD/2fnqovqN1EJiJ/ADM41S81ZOmg9v8zCYwyhFPrFR
	nnBhFWlA+zmAOT0VWEeJRA2tuK2Jdg+4UWvj89Tp0+UHFO/Z0IkN8cNhLT6zo
X-Gm-Gg: AZuq6aL3tOvbjmBs9P9q1xr/MfJOgaxiv3JNQo844pnY57fpRIHkTYZdVfMGHtUHvOE
	iulHr3QKZ5W5iURkVyAt1Cs6sLuDGXkjbump+0oifUZJnfYZw9rv0b0O0wkX4fy71bFwN8XFswi
	jpI4jpPOeLFwDj+zpWvuf42ZHOKxcF2676hBnu6csXA+xDPgqKwCWMUdPDC1nCfsKm+L58aCiHO
	WhASETFVuk67cP/r2QZWnv5ikoHLlHTOQEk3uSe6u0DDmak4t09wCKhIJH3XEC346jLEwsXL58m
	G9zeMNHQAWGTJndq6x8xMdQvnkKhL2cEFaWgqY1fDYLjfl1maGfkw4lpkinIlnA8Aqn1ANjQNVH
	j5WUKkALk5HEBBK5A1fiVKPccKM0lkJbMnkEvq1wHMF5QKbuyJB4QN6Tuz+akzQ==
X-Received: by 2002:a17:902:ea07:b0:2a7:a5b3:bf51 with SMTP id d9443c01a7336-2ad74418aeamr2151475ad.5.1771607063286;
        Fri, 20 Feb 2026 09:04:23 -0800 (PST)
X-Received: by 2002:a17:902:ea07:b0:2a7:a5b3:bf51 with SMTP id d9443c01a7336-2ad74418aeamr2151075ad.5.1771607062680;
        Fri, 20 Feb 2026 09:04:22 -0800 (PST)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d5c20sm212537305ad.46.2026.02.20.09.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 09:04:22 -0800 (PST)
Date: Sat, 21 Feb 2026 01:04:17 +0800
From: Zorro Lang <zlang@redhat.com>
To: Andrey Albershteyn <aalbersh@kernel.org>
Cc: fstests@vger.kernel.org, fsverity@lists.linux.dev, ebiggers@kernel.org
Subject: Re: [PATCH] generi/579: handle quoted cmp output
Message-ID: <20260220170417.sbykhwr53sah2s7g@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20260219152524.1770469-1-aalbersh@kernel.org>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260219152524.1770469-1-aalbersh@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1otbfQkZCtdkG2aggrUeEPHIMfsBog1iWcl7jd7Qiks_1771607063
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 19, 2026 at 04:25:22PM +0100, Andrey Albershteyn wrote:
> diffutils updated cmp with more consistent quoting in commit:
> 
> 	69ae797392bd cmp,diff,diff3,sdiff: quote more consistently

Sigh... changing the default output of core commands again.

> 
> This causes generic/579 to fail from time to time due to grep not
> catching these errors. Remove quote to work with new and old version of
> cmp.
> 
> Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> ---
>  tests/generic/579 | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/generic/579 b/tests/generic/579
> index d5fab4892e9a..19ffd4954db2 100755
> --- a/tests/generic/579
> +++ b/tests/generic/579
> @@ -71,6 +71,7 @@ for ((proc = 0; proc < nproc_reader; proc++)); do
>  			# match, regardless of whether verity has been enabled
>  			# or not yet (or is currently being enabled).
>  			cmp $orig_file $fsv_file |& _filter_scratch | \
> +				sed "s/'//g" | \

Thanks for finding this bug. So the output of cmp isn't consistent between the
old and new versions, which is going to break later cases (base on cmp) on old
or new diffutils version. We usually handle this by wrapping it in a _cmp function
to keep the behavior consistent, refer to how we handled common/attr:_getfattr().

If no more review points, I can merge this patch to fix this issue at first.

Reviewed-by: Zorro Lang <zlang@redhat.com>

I'm not sure if we need further updates on diff command, we can revisit this
if any bugs are reported.

Thanks,
Zorro

>  				grep -v "SCRATCH_MNT/fsv$i: No such file or directory" | \
>  				grep -v "EOF on SCRATCH_MNT/fsv$i"
>  
> -- 
> 2.51.2
> 

