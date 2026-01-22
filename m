Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCC634C124
	for <fsverity@lists.linux.dev>; Thu, 22 Jan 2026 10:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769076309; cv=none; b=UE1SppPqM/bpofI6jCzcNRPgIavsA5pAdyXXYp0GjDXEGByh8PWmOik4ZqAPRH6tag5nlosUDwPS7J9pxH0WiJWDYAS7Vg4f6AfVanIVr8aG7aDfxQtkXTR5wLzjQ52JSg8gomhL7pxDSqvi4yl84SiOnpkqBS75mGmivDCe/qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769076309; c=relaxed/simple;
	bh=MRan9B0EEcK8gXicfj+D1fSVd5Gt317ZxAZHXGkA7nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=hqdyshF1kN9BDMzZ1w2F5krUgqA+zUz/JIO6ECPgKNmCmxFX7bq/nXfx2UwfE8MLW0uheUmaB/q74+c+wRMvYbF6r17mKtlWKyoFCppwD8NGpcKf2Iq+c3Vkm/QLTU3t4WsIvAa1USLWGM67PyNZaw+49hH4ogGGVVz+JZFa7Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XWf8CMi7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XWf8CMi7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769076307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YNqvczIVehNho1K6yzOe7LZ08YqMOyw0NvDlIw+P6AI=;
	b=XWf8CMi72NELo3h9CCYJe6airjNy8gH8lzXJiSPqO2Sh9VCBzFGjLHnMlNPSrhLXWFD72g
	bWbC11vmPKUscRUifPz8mF88PrwdRv5Dp5IvyfeOzjRc9cu2b4fdQkEJkQj3OOlQQWYoBx
	HrZrVhkuGWAoru6QNh5ddV/Fcw7pY0s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-400-jyj80bisO96uGNeJpqe27g-1; Thu, 22 Jan 2026 05:05:05 -0500
X-MC-Unique: jyj80bisO96uGNeJpqe27g-1
X-Mimecast-MFC-AGG-ID: jyj80bisO96uGNeJpqe27g_1769076305
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4801bceb317so7117445e9.1
        for <fsverity@lists.linux.dev>; Thu, 22 Jan 2026 02:05:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769076305; x=1769681105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YNqvczIVehNho1K6yzOe7LZ08YqMOyw0NvDlIw+P6AI=;
        b=ApKmBq7ZNs4GAebZrOoJWR3Bsmb2pnhoayOqbSfW8I0ahhCWiCrMLnyF6L+Mced25A
         IGrGv1GS9BPqZJ1MSs0kYdDxhXLWl361CQQUe9UKRVSEuzH5q8LwoPwQmvW1H1pKuhLy
         JRxOZYvFCSON8OG9Ez/hqnWCqvmw+DTADqgT0YyxvmmJeBfTDBdqoFfAjN278HQlnNkv
         kYIxRaLqiOVpfYhcivrH6CwGuKY7HnLI56E5q52dbPoepWLU5GT+utiC3hIQJ5PMEkjA
         Hlzbq+8OsEt7WCewilF0SS2Iurp0/P5CA9fAu1MUt60Pi8xO8YgeQpb+MgCInfQcpzTx
         TgLA==
X-Forwarded-Encrypted: i=1; AJvYcCUiSsVTqqm9r7k/i3DBiM3oVKbVtVS5ueas2p518C8yAIFP7CDy1rcA8NAaLWZX9jfIbnfp+bbd+g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwpB6J8nxL8PWtYOuoe+WyhS9aanWo58wUgjHL9G/E6W76HWCFF
	2lSw35rXx2k5DYModoLeoPrxqjwh3IxtXc8Tvrjgkf2wQA7Ps22amLcYqA1p6gperWU9QTJZ6aS
	dGwwYvh7PgEK4olL7TH7IARGgTDPJ0HO3aDalgd0ygJCtVLK3+jfaQ5BswMI=
X-Gm-Gg: AZuq6aLcP+/QIxhR+Q/JoItyzdrQgDEbbJWLITdHcT6g7DJT0I8G5mn7TEGUN51Br63
	82ADgdbSQXnviOdecDr07cN52UumD7spOCeM7q57ZisZVi/CGgmOpCxj4YyS14ur6jRGSpMiiWq
	wdphrqlZVswKNLBGtq2x9Ee4HnolqkcK1fqwmavbNKUHuH/odI1tMsQ5I5kaMdeaGexxMYmPrLW
	ZtWi5I5M4gSb6lci8RZKuBtEKgrpaWH/yiTTTcxxAMGkWU310PsRBNSsUmcuCitIG5eR6vspscX
	fXL/Cb5QYUwxreMtPE+2gI3SkiAULjiciwDqHuoCJ1YDqoWxUiLyzM2yCqoTvbfxERZgcyxYkzU
	=
X-Received: by 2002:a05:600c:1388:b0:477:a36f:1a57 with SMTP id 5b1f17b1804b1-480409ca767mr113935795e9.3.1769076304254;
        Thu, 22 Jan 2026 02:05:04 -0800 (PST)
X-Received: by 2002:a05:600c:1388:b0:477:a36f:1a57 with SMTP id 5b1f17b1804b1-480409ca767mr113935225e9.3.1769076303635;
        Thu, 22 Jan 2026 02:05:03 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804704087asm53174235e9.6.2026.01.22.02.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:05:03 -0800 (PST)
Date: Thu, 22 Jan 2026 11:04:32 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Eric Biggers <ebiggers@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, David Sterba <dsterba@suse.com>, 
	Theodore Ts'o <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, fsverity@lists.linux.dev
Subject: Re: [PATCH 03/11] fsverity: pass struct file to
 ->write_merkle_tree_block
Message-ID: <2i3y4kybtm2lusa7eoutefawgrkhoqhuyquilu3qvkziyhpbvf@jeyk27glmeyg>
References: <20260122082214.452153-1-hch@lst.de>
 <20260122082214.452153-4-hch@lst.de>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260122082214.452153-4-hch@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tUVOG2Mv32g2rKprLLT9D7-4khDBwWhPFXdDK-DjsR8_1769076305
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-01-22 09:21:59, Christoph Hellwig wrote:
> This will make an iomap implementation of the method easier.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

looks good to me
Reviewed-by: Andrey Albershteyn <aalbersh@redhat.com>

-- 
- Andrey

