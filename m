Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC11330650
	for <fsverity@lists.linux.dev>; Fri, 19 Jun 2026 07:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781854127; cv=pass; b=Z0ZcHBPzXkcATY0HPkY5GQLLnoaYcPaDGdsgtziSDUp6ZLHm5hUAuhVXmRVsxcX5PTLUVxuVFY1mgRYbbzg7yW8pOoJtcs6TAjNl8Xaqt2LKXQ9N8xzhjWKyTJnmJqUTCSDl+/C3cy2LRVDyVbhnOvUWpgR/J1c+m/yHUOKga44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781854127; c=relaxed/simple;
	bh=PLjuf5U1Ldp+lKMspivltGTyqfvutQwDbWwFfF6CvPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SQSEMr2QZw3D9xiTJO0BgARTeL9oYOaReRFJeNz8mG9dERfHfBL2eE+PJ3OEnek4lNpMVjh9wdgKbMh4+epi1X7pgzdN5KXQwGgMwzKXbrNQiQCl2nDUSPMp83Mbg8POsT90Q+s8lUQgmfMectezZEl4aV1dS6/S1KddTT+k2Yg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q47iPGKb; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q47iPGKb"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-695737cf38bso2550354a12.0
        for <fsverity@lists.linux.dev>; Fri, 19 Jun 2026 00:28:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781854123; cv=none;
        d=google.com; s=arc-20240605;
        b=KA2PvanmMg8/5jtEi9NcyDsDe5QRvTE6nFSjayyCt5RRdRPXM0Tqj94RI43mYIgN2N
         W6UPIkxybEadxCeWVOXziG9P5CE/5SvGO/WGX1KPzIJ/nxV8llXVK6mDje7QYReBs091
         8pCRFkMrCrGSQ5erIdttor20z0BsDvlnqKoNPO+1OfI377Ai/hZjH/6pFu7q+pvassk6
         oO6pLhmk4UMhNvzW68COadZSKkr6Pik2TNLA551U1ts2lyTitoXFAV0YaEwrtw+bU1C9
         y7oj6DrOc/k6uP5SmLS2C5E8eVbcK/u9KRrKjomq78wc9wBEscuYpjtgBNpVTePXUZUG
         ZIiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cXsAttpCRAfo1jUwXpOflkS7AbE4OJcRHMhxuP67MIc=;
        fh=PIeWqx9UofOmIVIz4AObsAy7KZf+EaRDeQo1fExowYU=;
        b=LQlzlIcDFjXjwzjL4jw9FCsyJpRK4wH0aSzII1SkuR2Tf59kXD+dXCDS3wW8r2o1kf
         CVAmTIljfselmG2Xo7jGWDcxojbD8MrTxWXfwWizLQ56ra+3CNcPtuKIM9uHlHghH9I2
         In/32cDexGHwDjOQ3O14t95U7wjrLF2wCnbo8lZv3MYK6AbUINPkxP77RaDWka+Nf7Dl
         ukYFp5gLb/EKHJV5nHgp0ndCXgamIs5VusSjxLeaYFr8XnVZyY3m8M9T/OfKxb7rHl49
         q51NkmXgeQKJVMDiAjrIRE72rDsVN8s4NjzlmvIO+FXcZzAlbth8BpKldWAgv0ypBC2w
         czHg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781854123; x=1782458923; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXsAttpCRAfo1jUwXpOflkS7AbE4OJcRHMhxuP67MIc=;
        b=q47iPGKbZLX4fS2LyHpjd/xBAGwmFXmCAkysOrysAg95cxL/Dhftz5Ly+IsU1yU5DY
         /tCQRwDg27Hi61+/U3f9oL/Jk3Qi9DY3R6rYpghErTUcHrurtub9ePrgO/k0ldEHr264
         8DHDiIpSQqMFViOXAx5BggXre4X4AlZTh6cv3qXlyrXum/GlONuywvlZQXvcBYjc2Ahy
         LL/8iRzOB5KgGtaP7dh0+U12wZ4zwiM6HNqAZ7CTBEcgcc1o/qVrOHFuAaKpaqrBaD16
         vc/O70ffX1iD7kfwFmtXmg7V+b4mVFEAZ1b+vCG3B1dGPLHyDuMJJyISd8xdakAzqCDB
         Ulqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781854123; x=1782458923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cXsAttpCRAfo1jUwXpOflkS7AbE4OJcRHMhxuP67MIc=;
        b=ZBId0ck84P55yHcKKl4tFE1PEEllAzBlaKxz0UumTjvJg5e4RUC23f0EEjAMowXz20
         NHH0U/2pa1aTg+C15jdq7eAJrlQpQvKnB1e5/HDcQa85dTnbLq31LC/CSpT7szNijY4y
         e+lHcTVzMVjYaaZ3fCiFSrtaIiKRqTzde+cv9wnieD68HqCRs1AwHMeOpkVxbwr+VFxN
         ryXSHsL9vPASG35z1Lg1Ybst3LZ/ngu0xpJmpx2mZozPd1MLOvWieM6K35MbEbiZL0wT
         2nivDfup1zHZgO1EYsunrjrzuv7hISxxCnxIyEnjxJoT8SgVX1LKUo2wuyjQiFUHJuZ6
         hdjw==
X-Forwarded-Encrypted: i=1; AFNElJ/TDh2pO2OIb7+Uh9GtITSDcASllFCzsL9JhnccCUfCB/8Nu1ccQiQATCXZr3PqRRIrafY6p/QdOQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+WYw4KUm2MheIaGa52Lo5/2LvWGndxjpz6ngHyKeowHpZ/5b+
	YAEOohArTIwToCPsQQ+3QvRyx46Zq+t08ItF/o820nJAfqEErpeBxhwEELx9/hbaNc/Ahil49Q1
	VBVN3Yz7aJH47y7WmDeefGN994kR60Ao=
X-Gm-Gg: AfdE7clU1T12Fhgo+khEPlV7dTsy0tEJ1Za/iWGuMNcpX29e4/IqY8NAgmL95PV3MHu
	TGZqc3HaTu+ZUyUDkfqmDTYXlT9C9ooPpDy9mCm9iW72eKF+aBjkjAJ5F11dKTyVEFewMTj/Er6
	oHyVdocn3Z3g6LVQrnvskftx7y1V9Aq8c8BbOfUmdMV56mu12ifTIoMN0PodjvKMfhS3s6jZnxt
	1HGmDy6pyW3TxqF0t8842AM4ro6P56bGViUvNWevdadCig4PQXjfO2LnAuDoH0YnnmoumWWd4bN
	hoNO2bQaGqJfe739GnEYpvWV2xppegsI2hAnHRUs4A==
X-Received: by 2002:a05:6402:5107:b0:695:572a:7ab5 with SMTP id
 4fb4d7f45d1cf-69711e00675mr1216968a12.19.1781854123208; Fri, 19 Jun 2026
 00:28:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260520123722.405752-1-aalbersh@kernel.org> <20260520123722.405752-4-aalbersh@kernel.org>
 <20260520190719.GB3424023@google.com>
In-Reply-To: <20260520190719.GB3424023@google.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 19 Jun 2026 09:28:31 +0200
X-Gm-Features: AVVi8CcyPPKNjODd0CeG8qbXXsZeOsRanxA9PmKFMYeTLACw7w0uBX2gqOCDc0w
Message-ID: <CAOQ4uxh_hfiSwMw8ABhhrz7GguZWjHEiBmvb3eq16Wfqw0+ZrQ@mail.gmail.com>
Subject: Re: [PATCH v10 03/22] ovl: use core fsverity ensure info interface
To: Eric Biggers <ebiggers@kernel.org>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, hch@lst.de, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-btrfs@vger.kernel.org, linux-unionfs@vger.kernel.org, djwong@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 9:07=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> On Wed, May 20, 2026 at 02:37:01PM +0200, Andrey Albershteyn wrote:
> > fsverity now exposes fsverity_ensure_verity_info() which could be used
> > instead of opening file to ensure that fsverity info is loaded and
> > attached to inode.
> >
> > Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> > Acked-by: Amir Goldstein <amir73il@gmail.com>
> > ---
> >  fs/overlayfs/util.c | 14 +++-----------
> >  1 file changed, 3 insertions(+), 11 deletions(-)
>
> Reviewed-by: Eric Biggers <ebiggers@kernel.org>
>
> I'm still confused by the new implementation of fsverity_active() that
> got introduced by "fsverity: use a hashtable to find the fsverity_info",
> though.  I should have caught this during review of that commit.  For
> one its comment is outdated, but also the memory barrier seems to be
> specific to the fsverity_get_info() caller and probably should be moved
> to there.  Anyway, that's not directly related to this patch.

Eric, Andrey,

Did you see the Sashiko review for this patch and others in this series?

https://sashiko.dev/#/patchset/20260520123722.405752-1-aalbersh%40kernel.or=
g

It annotated some review comments as high and critical.
For this patch it is about interaction with fscrypt.

Please take a look and say if this is concerning or false positive.

Thanks,
Amir.
