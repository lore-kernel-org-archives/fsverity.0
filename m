Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C91D1094E
	for <fsverity@lists.linux.dev>; Wed, 11 Oct 2023 11:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dxWmLdWo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697022730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/kEmWjWgOxRFcJRKEBCxKJxRrv3vBV4YFppvO0WCp44=;
	b=dxWmLdWoPY8/elF8rmaAjDIcsbtIxHmKQWS6EwQ3CjeFd0oOFFf1rQxM+9r77SEQu9ULyp
	ya7sL/rvpoB3/+4CW00um2psm57vsmvSLwpk7jA8Sn/562j/Rphrp5SIHwizqbJct6NkmB
	428rRwoYy0A2DYWc2WVkqOjTcGE/aFI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-458-_hoRsFSRMD6zYt6KuiJRNQ-1; Wed, 11 Oct 2023 07:11:53 -0400
X-MC-Unique: _hoRsFSRMD6zYt6KuiJRNQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9ae70250ef5so92884866b.0
        for <fsverity@lists.linux.dev>; Wed, 11 Oct 2023 04:11:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697022712; x=1697627512;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/kEmWjWgOxRFcJRKEBCxKJxRrv3vBV4YFppvO0WCp44=;
        b=U+5b4lDEj6+BPZTfdIRaookaMYrUsv2//o40jJcFTimR46Jh46aAcBYA6wEmegaa1b
         /Ug2hirIYZh6+OGF9ghXYG94k03Mu5KmiQ3ylMppNooLl/BKFOKyIUeAwOyq6JXoCR7B
         C1hESUkBOIPXhdJNXZgAau1zo2/aJy4VRcOSvE7Jb2YwH4ei4f4zXqj7Pulwe9/Y0fnW
         +sffgJObaGJv/ZxcyrnZT7WN+Lv0aGFxTxa9YKPaur4zyLcBQ0Q+mmfVjiCu4/wvTUq+
         po1IS89XHZGvv+dE4ygOANFBjGv6/AMqRIr7hcUTOmY9EcVDkyyx7+FjsfotLhaozKRn
         8zFg==
X-Gm-Message-State: AOJu0Yx/N9Q4GjGjCawa/3rShcPweWso1R1DF3tprYrgVQC0nankEqm/
	z9IQ8t3lGUuuR8HZSVZNElKayR1J8AGm3sStBOegJxMI4VJ02kBYfdlJSh1OzFrdQDaV/XS3xSh
	fEFlYAFE024S8dLpSBzpO1eOq6A==
X-Received: by 2002:a17:907:9454:b0:9ae:65d6:a51f with SMTP id dl20-20020a170907945400b009ae65d6a51fmr15512261ejc.18.1697022712111;
        Wed, 11 Oct 2023 04:11:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDgARfv/UqsKe2KQ66ychyLoGXLKXNYM7/TA5AoU9zv4vYFkvlQ37nunw7fm1lqRnWkTGQkw==
X-Received: by 2002:a17:907:9454:b0:9ae:65d6:a51f with SMTP id dl20-20020a170907945400b009ae65d6a51fmr15512240ejc.18.1697022711783;
        Wed, 11 Oct 2023 04:11:51 -0700 (PDT)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id cb22-20020a170906a45600b0099ce025f8ccsm9668390ejb.186.2023.10.11.04.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 04:11:51 -0700 (PDT)
Date: Wed, 11 Oct 2023 13:11:50 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	fsverity@lists.linux.dev, djwong@kernel.org, david@fromorbit.com, dchinner@redhat.com
Subject: Re: [PATCH v3 06/28] fsverity: add drop_page() callout
Message-ID: <jimlghyfxeyapqcm4jomf5wkwtz3ufcarlb4j2v3kbjxusn4iq@khjabsipk6rc>
References: <20231006184922.252188-1-aalbersh@redhat.com>
 <20231006184922.252188-7-aalbersh@redhat.com>
 <20231011030646.GA1185@sol.localdomain>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20231011030646.GA1185@sol.localdomain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2023-10-10 20:06:46, Eric Biggers wrote:
> The changes from this patch all get superseded by the changes in patch 10 that
> make it drop_block instead.  So that puts this patch in a weird position where
> there's no real point in reviewing it alone.  Maybe fold it into patch 10?  I
> suppose you're trying not to make that patch too large, but perhaps there's a
> better way to split it up.

Yes I was trying to make it easier to review. I will try to split it
differently :)

-- 
- Andrey

