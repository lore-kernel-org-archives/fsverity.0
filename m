Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A02208B1
	for <fsverity@lists.linux.dev>; Wed, 11 Oct 2023 14:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GW47cFL3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697035027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=34baUARs91EkkCBFmzlWLNU8Iitqc+tKVHHJesgsXbs=;
	b=GW47cFL3KFnRvLgAsjZcBrmKZ53XPXMYpdC26O9+UxX+ye5FC2YZ3FopNmwkMaQXX6UlPb
	vGpPBqexCAFtIsgR8K6dax4PEViiJwhFTMu8BFlBwiTP6BN+wivIXYa3n8ZgWwrKQkXFs/
	+25AqzuLRcQ3PSGdI+/kEOUgP5iNlIc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-aXFfxQHRM7u4KLM_zGgm3A-1; Wed, 11 Oct 2023 10:37:04 -0400
X-MC-Unique: aXFfxQHRM7u4KLM_zGgm3A-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9ae0bf9c0b4so556720766b.0
        for <fsverity@lists.linux.dev>; Wed, 11 Oct 2023 07:37:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697035023; x=1697639823;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=34baUARs91EkkCBFmzlWLNU8Iitqc+tKVHHJesgsXbs=;
        b=HCyPPw0++Q0jG9T+3SS48B126Nbo2JSPImzvWo8CKvuCg/9ekv1XN1yRL5qTxrLxMj
         7UxBxUTrn8umaRFzPoM/DsP0NU5pvNmCVjXppcboSAIYlkqAiWyE9xkwpneJMRJSNBP6
         pW92TjgYVsLdx2hvtiHOpHBCQYbqUw8e6hgS//+6bKgz79cXFn6LiEZvzwNMlDv5I25v
         gySg3fNkC0kQNujLe7nsLzMrSCXg3E8uMCPys7nXz5KxHPrl6/7Qkf4r0tZDIDxPcdT9
         8fLPZ5Gjjxw/xtFZ1SpRBxtXfhQ/Q6i5iDAYrJ5Wd0tggaznAaM9lFuMUw/f5ZWV6DCf
         IIfg==
X-Gm-Message-State: AOJu0YyQvYqRVlavSSPAfxM+TMvSe+ARDoTlFRSGLVze1XYolWX1OBhX
	er4HxTxVaGJ80cnSyGWryV7iMePk1zbbcD8NaIAhCj73vsnE3gVJ8HDFWHxv9nJ+Tk+AdUs5uX0
	8toJeNvLnbQ1bnl9G0UCZBW45ZQ==
X-Received: by 2002:a17:906:4c9:b0:9a6:572f:597f with SMTP id g9-20020a17090604c900b009a6572f597fmr17398649eja.38.1697035023441;
        Wed, 11 Oct 2023 07:37:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPo2YB484LHLqni0xArxuSgEFDfsRNtQl070YQebW8HyUaykksPcIpxZzOOF+gbR7567Puiw==
X-Received: by 2002:a17:906:4c9:b0:9a6:572f:597f with SMTP id g9-20020a17090604c900b009a6572f597fmr17398636eja.38.1697035023119;
        Wed, 11 Oct 2023 07:37:03 -0700 (PDT)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id dx8-20020a170906a84800b0099cbfee34e3sm9819150ejb.196.2023.10.11.07.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 07:37:02 -0700 (PDT)
Date: Wed, 11 Oct 2023 16:37:02 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	fsverity@lists.linux.dev, ebiggers@kernel.org, david@fromorbit.com, dchinner@redhat.com
Subject: Re: [PATCH v3 26/28] xfs: make scrub aware of verity dinode flag
Message-ID: <6o4zaqtxsyetq2cfaxuxfpkxf55tazafoen7plhjywetei6h6q@xnzapk24io6e>
References: <20231006184922.252188-1-aalbersh@redhat.com>
 <20231006184922.252188-27-aalbersh@redhat.com>
 <20231011010641.GI21298@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20231011010641.GI21298@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2023-10-10 18:06:41, Darrick J. Wong wrote:
> On Fri, Oct 06, 2023 at 08:49:20PM +0200, Andrey Albershteyn wrote:
> > fs-verity adds new inode flag which causes scrub to fail as it is
> > not yet known.
> > 
> > Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> 
> Reviewed-by: Darrick J. Wong <djwong@kernel.org>

Thanks!

-- 
- Andrey

