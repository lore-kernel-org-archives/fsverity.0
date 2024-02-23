Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EF97CF07
	for <fsverity@lists.linux.dev>; Fri, 23 Feb 2024 13:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708694638; cv=none; b=S0z+sA5T39Ff3fvQw/peBsmKl3HWl9jS+7ZPkFJDRRYS6Fi1G7riaAdEGN4N+uuPQVuCP4k+rcDiOzFi9YyPBiqGpajjhk/NEGkjm0/qkeCYNJJbmfnIq4zIFp+CAFijvyYHN+AxfmaxV9rZoP5lgdFWQlcscFnY83GEAZ7WFVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708694638; c=relaxed/simple;
	bh=6e0O4DMzFkHvn7pXNTJf65SMbBZkdyOQG4/zKdeHt/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=qr9nTTSN9SZuX6nKM231rHaWCFrbnNiYV/AOviPXeJ6djzR4cVrp7kesjfQUpqvhQtOUqK3tUqs3nN/r5P3IYcdxBi87OazRitsYOQn0Da9wpocRugXEbqC2DHpVtjX3e7X0CVzNUZAEP6IuEb+V6Xeut5Hp+zDsDq3Faqvmydk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O/3AiaNV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O/3AiaNV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708694636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hqt7S1NoHacsgWuh60F4sxJhipun6fhVaSw2FUE+AfQ=;
	b=O/3AiaNVnkzaUz7CPQW6rEVvqJ5Tmew8q5Vga8MI+sS23Qxf60sNkh5LJOS7kh3oVmvPmz
	SqBa49aZy3cvIajIOzPcmiFR6CLxbILg+z4Z1GtQRH0Oxtm6U2LSbGgrRKRTV8ngG6zY4h
	KzziJeqRWhbQU1nH9/zwfP2xdHYY6Ss=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-218--zU0NKsyPxeeRt1J4MliAA-1; Fri, 23 Feb 2024 08:23:55 -0500
X-MC-Unique: -zU0NKsyPxeeRt1J4MliAA-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-33d23c8694dso151586f8f.1
        for <fsverity@lists.linux.dev>; Fri, 23 Feb 2024 05:23:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708694633; x=1709299433;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqt7S1NoHacsgWuh60F4sxJhipun6fhVaSw2FUE+AfQ=;
        b=UZvvdfwmyJpw40VPIRBZ1Hfj7MLL08gqBnk+9s5eBMD3zS0tF4WHy1uC9b4RMwKJLP
         JvvWBoVs7njBsNnpDFc10WKlDX059AXnJ+N4W1IvhCq5iY5ufraW8+hDGERt5Nl14FyN
         vMoB4mbuE2kllEyMS6riEP8otjV/ALNDnXrWc0TDFBgIY4CupEXBZpeYZgvrJvrS7gl/
         z35URaAdwLDU/Oz1IlkzA6cTUVylu33pZ7pO8szDEpOa5sm+jnJ//Yytlb2hON/o086J
         Z2Ktd+6bafjU/uLyzYmN0IFXJwZ5CUAnd92LK9/SByRpMavci8nBdPnAS+N2ptMhzGRP
         ZKVA==
X-Gm-Message-State: AOJu0YxP2MnwlwKI0Bgs4o5mKpjnCEX4PjBtNAMbfhKVm/LPNH7rCh34
	caHjxfNqLotP0gcrULayvFErp6uX+FZsiXygpPqhrf4Py0CLqOrdWUTxcmA5uAxeFttdFJFFSNV
	TuHiMxKbF8SRdVXu842oJoTJRKehn5HyfqkQ3XdnnCEEDj9L6kJalWfg=
X-Received: by 2002:adf:eac3:0:b0:33d:7eb:1a6a with SMTP id o3-20020adfeac3000000b0033d07eb1a6amr1294414wrn.68.1708694633705;
        Fri, 23 Feb 2024 05:23:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcPXl8fo1bQL43nBgcdbRjOKnZSJ455k+RrAoRssBnbauM8/hwRjxl2I7+BEiwDHQq9Z7L/Q==
X-Received: by 2002:adf:eac3:0:b0:33d:7eb:1a6a with SMTP id o3-20020adfeac3000000b0033d07eb1a6amr1294402wrn.68.1708694633392;
        Fri, 23 Feb 2024 05:23:53 -0800 (PST)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id l7-20020a5d4bc7000000b0033afc81fc00sm2737566wrt.41.2024.02.23.05.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 05:23:53 -0800 (PST)
Date: Fri, 23 Feb 2024 14:23:52 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, chandan.babu@oracle.com, djwong@kernel.org
Subject: Re: [PATCH v4 09/25] fsverity: add tracepoints
Message-ID: <copvwl7uhxj7iqlms2tv6shk4ky7lce54jqugg7uiuxgbv34am@3x6pelescjlb>
References: <20240212165821.1901300-1-aalbersh@redhat.com>
 <20240212165821.1901300-10-aalbersh@redhat.com>
 <20240223053156.GE25631@sol.localdomain>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240223053156.GE25631@sol.localdomain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2024-02-22 21:31:56, Eric Biggers wrote:
> On Mon, Feb 12, 2024 at 05:58:06PM +0100, Andrey Albershteyn wrote:
> > fs-verity previously had debug printk but it was removed. This patch
> > adds trace points to the same places where printk were used (with a
> > few additional ones).
> 
> Are all of these actually useful?  There's a maintenance cost to adding all of
> these.
> 

Well, they were useful for me while testing/working on this
patchset. Especially combining -e xfs -e fsverity was quite good for
checking correctness and debugging with xfstests tests. They're
probably could be handy if something breaks.

Or you mean if each of them is useful? The ones which I added to
signature verification probably aren't as useful as other; my
intention adding them was to also cover these code paths.

-- 
- Andrey

