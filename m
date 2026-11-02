Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631436;
	b=STPSHgZbKnHeRxW0eawTHroJbeG9/pudPCNsx9ndFHbZvjxQi0ASsCQI58OIwFobRNLj
	 CqPUYh60lBZNXVsBaBTXlnqCaEHLxmjmKyaPs5hEEysCgEFHh0LnzZJQqjuBBMpUnMhVy
	 7K7Oh1/WUGjABk5MOuGeD/iwIgedbkuJCMS8zHbtaOGFw86kEWeHH3Q1cOR+VlHofAQOc
	 58aSn5/ytLyu8XGdRi/V6I0hE4YqR9qwaswsZWhD6XFoKlSS114/XAYAx8MK5T17ph/xw
	 DizMk08G+vCqpfKogCyAD1OWrjge6eF8RN+FjL0+zEGy7KUfpGnNEsxTC+9/JzGTqlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631436;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iN6uG/dTDB77/oM0Gf6ZwQAMXFrOSBDVeGUfCQQJuj4=;
	b=h2WVctRfQtidHW0kvDYGDETtEUJ1ivdR3FGU/NameHw6My2eRiY99xKW6PHvbNBjIkgN
	 16lRRBa6vStcLAeP4WwITmDei7c3NQHwlDWFuzLDIJXY3tCk4zp21ksGcM0dDSlFyIlin
	 Q6+FLC8ZRGeTFXu/TjNBylPqCfxBYTduR0oGiG10k/YjQJGEZWiGDR4Kh7eG35Ys+RW0m
	 OlKQjhYXBmBX+B2xlZupsUP6gv/2NKq0Tj+oT3kqr0aZtHRkwyxGCOg+tpEhJ7MNNvlWy
	 nyqr+T+g62FhUsBrI6qAYbKk7ICBWAvBu34hoyRNj04Z7Oa9gsdlWbwf6OuoyRPEKtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oUEKstmT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF02606A59B
	for <fsverity@lists.linux.dev>; Mon,  2 Nov 2026 14:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oUEKstmT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5529B1F00A17;
	Mon,  2 Nov 2026 14:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793631435;
	bh=iN6uG/dTDB77/oM0Gf6ZwQAMXFrOSBDVeGUfCQQJuj4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oUEKstmTETRTkyrKzLpgg4Khtqp/uYMsUaAHD8UHaF7He+IBlsQkNwdnpOftIguB/
	 dGiY2EM77ghDkqYfWTYfQItnad10xvZXdp1fXFPYAiScao+hdiDoXLaplNQRa9AOHy
	 nkSzGykpeI+lHmyygrDRg4cFiEDAIQk84UX2mdpXvrI9khYmtD1xi2/hzpzm5yHqIU
	 PfCnaInIwPZJ+BY1wC9/+m/EMCxlpMjo+UrBzLeUDxVU+U5uS2VhZRfQmcNx3GXtE4
	 IXuR3Jr3JqtamTJ/ENJfTb3KXU5cU/DrHAvDI9c9IAl3sQ/rok+pqKHAUm3nqNptJ1
	 O+LTRRPb+lAcg==
Message-ID: <sashiko-outbox-193620@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 06/15] xfs: use read ioend for fsverity data
 verification
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrey Albershteyn" <aalbersh@kernel.org>, ebiggers@kernel.org, hch@lst.de, "Carlos
 Maiolino" <cem@kernel.org>, fsverity@lists.linux.dev
Cc: david@fromorbit.com
In-Reply-To: <20261102144147.2393369-7-aalbersh@kernel.org>
References: <20261102144147.2393369-1-aalbersh@kernel.org>
 <20261102144147.2393369-7-aalbersh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 14:57:14 +0000
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Post: <mailto:fsverity@lists.linux.dev>
List-Help: <mailto:fsverity+help@lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fsverity+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] xfs: missing include of xfs_fsverity.h in fs/xfs/xfs_super.c breaks=
 build
--

commit ee4503160b45b8debf89daa601b6a9be79307262
Author: Andrey Albershteyn <aalbersh@kernel.org>

xfs: use read ioend for fsverity data verification

This commit uses read ioends to offload fsverity data verification to a
dedicated fsverity workqueue, avoiding deadlocks with metadata read
completions. It also adds a slab cache and mempool for fsverity ioend
structures and passes fsverity_info from the iomap context to the ioend.

> diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
> index 5a06132aa3846..3a7d7334e9a65 100644
> --- a/fs/xfs/xfs_super.c
> +++ b/fs/xfs/xfs_super.c
> @@ -2516,8 +2516,20 @@ xfs_init_caches(void)
>  	if (!xfs_parent_args_cache)
>  		goto out_destroy_xmi_cache;
> =20
> +#ifdef CONFIG_FS_VERITY
> +	xfs_fsverity_ioend_cache =3D kmem_cache_create("xfs_fsverity_ioend",
> +					     sizeof(struct xfs_fsverity_ioend),
> +					     0, 0, NULL);
> +	if (!xfs_fsverity_ioend_cache)
> +		goto out_destroy_parent_args_cache;
> +#endif
> +
>  	return 0;
> =20
> +#ifdef CONFIG_FS_VERITY
> + out_destroy_parent_args_cache:
> +	kmem_cache_destroy(xfs_parent_args_cache);
> +#endif
>   out_destroy_xmi_cache:
>  	kmem_cache_destroy(xfs_xmi_cache);
>   out_destroy_xmd_cache:
> @@ -2580,6 +2592,9 @@ xfs_destroy_caches(void)
>  	 * destroy caches.
>  	 */
>  	rcu_barrier();
> +#ifdef CONFIG_FS_VERITY
> +	kmem_cache_destroy(xfs_fsverity_ioend_cache);
> +#endif
>  	kmem_cache_destroy(xfs_parent_args_cache);
>  	kmem_cache_destroy(xfs_xmd_cache);
>  	kmem_cache_destroy(xfs_xmi_cache);
> @@ -2660,10 +2675,14 @@ init_xfs_fs(void)
>  	if (error)
>  		goto out;
> =20
> -	error =3D xfs_init_workqueues();
> +	error =3D xfs_fsverity_init();
>  	if (error)
>  		goto out_destroy_caches;
> =20
> +	error =3D xfs_init_workqueues();
> +	if (error)
> +		goto out_fsverity_exit;
> +
>  	error =3D xfs_mru_cache_init();
>  	if (error)
>  		goto out_destroy_wq;
> @@ -2740,6 +2759,8 @@ init_xfs_fs(void)
>  	xfs_mru_cache_uninit();
>   out_destroy_wq:
>  	xfs_destroy_workqueues();
> + out_fsverity_exit:
> +	xfs_fsverity_exit();
>   out_destroy_caches:
>  	xfs_destroy_caches();
>   out:
> @@ -2763,6 +2784,7 @@ exit_xfs_fs(void)
>  	xfs_cleanup_procfs();
>  	xfs_mru_cache_uninit();
>  	xfs_destroy_workqueues();
> +	xfs_fsverity_exit();
>  	xfs_destroy_caches();
>  	xfs_uuid_table_free();
>  }

[Severity: Low]
Does fs/xfs/xfs_super.c fail to build at this commit because xfs_fsverity.h
is not included yet?

In fs/xfs/xfs_super.c, xfs_init_caches() and xfs_destroy_caches() reference
xfs_fsverity_ioend_cache and struct xfs_fsverity_ioend when CONFIG_FS_VERITY
is enabled, while init_xfs_fs() and exit_xfs_fs() unconditionally call
xfs_fsverity_init() and xfs_fsverity_exit().

Those declarations and static inline stubs live in fs/xfs/xfs_fsverity.h,
which is not included in fs/xfs/xfs_super.c until a later commit in the
series, 996c2dec93ad ("xfs: add fs-verity support").

Should #include "xfs_fsverity.h" be moved into fs/xfs/xfs_super.c in this
commit so the series remains bisectable under both CONFIG_FS_VERITY=3Dy and
CONFIG_FS_VERITY=3Dn?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102144147.2393=
369-1-aalbersh@kernel.org?part=3D6
