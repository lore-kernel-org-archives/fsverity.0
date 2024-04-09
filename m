Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF3650260
	for <fsverity@lists.linux.dev>; Tue,  9 Apr 2024 14:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712674225; cv=none; b=TXCr3UKtqTdEIaZuckJeL0LHv1SgcFMZAt3zGwdoV1CoSFZFsH98dyxD6h/NteR8MrQiZhOGnv0ecx68Ow6l9hKkoQsM9ghWu4QH0BJ3EWvoT2rFiUKVZSDMszztdTvkt0u9VlOntrO+LXyA/wMMYCleGIIne7td43uDpXLZbNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712674225; c=relaxed/simple;
	bh=i6kz3Q2dnYL0OW1aHnTfjYKIt9T0R/0xsI8bXOvteiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B4W6BfsuMa66Otdu5L4JGkGUynVWOGN4fTanZCOEHwkCBgio+lrmkXjLWo1/Xkmv8eF+wfC9yBSmhj60dFZoPxlTxeOc/uJ6Qc3KZR4leGMsbIx2/MyFgBEN6d3Cptzy23IZCjVaqHu7lqzRvm6bP8UGme5heCzMIr/J0+Y5mww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=NrsBEiIn; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="NrsBEiIn"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-56e56ee8d5cso3484330a12.2
        for <fsverity@lists.linux.dev>; Tue, 09 Apr 2024 07:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1712674222; x=1713279022; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=evULbkEmDkE2I68uywZgrm/PKi02rLv1h8SrHCCkGGA=;
        b=NrsBEiIn2BXQ5vaguX1pJ3bRTeGsh9v0Qk4bT5AA9KnqWkPbWwSSGi5dtjZTkUYvct
         kr15YN6pFcG3++xSZtkv3VUMmVztEV0onCakrjkMR9vT3Fh201olDPpOmtwUVklUCxOz
         v3oXI3k8991I3myJBIyA7sR1c1+Fcyr1Dq6F0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712674222; x=1713279022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=evULbkEmDkE2I68uywZgrm/PKi02rLv1h8SrHCCkGGA=;
        b=CZQ2PbHD5jd1Dx6R2PfoyueIjdqfRh3h2FHaGd6s6sujFri8GVsp51nY0logDCMSqz
         ytUoDZuokU8gjbPmf3YkM2Ae0s3P1syPmxy0S9WRpNQj88Fla9TejAeEGTDIPL3fJCiJ
         1a5NKNiavmA6o3akGlaWsWiTT5e+E0DzFdGkptAAbXqHWjocnTgr922dshCXjBq7+9te
         qM8hel7d5tAqeWcm7hPLBiE5HvA1wFq984BWAQGxzXD5Fp9Ah7Wsvd4H1E5bhdd/U0E2
         Om02qnCR8QnGl/OOVar1d8/lZAFwWTS/10YdhALYq7yJdNXbUBa1UKK0a62kWrGgyWbY
         MNfQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7XQU1DyZmOtglY//6rMjn493EJO4U9JgqkJY4Rx58hyzmCnYwZuFiyoR6BxfUYxUqFNkfPS23ENaf1nATpmBHkwGI6iNVCHg=
X-Gm-Message-State: AOJu0YxiQTnXG1vA5F3IF3BkpndxWL01rl4QQ3xLkMd+lY7nF4KHVVeu
	9WGXNEX7gVlh4eN85UXuIoI2Gu2DsQg0aobMuVV/rjne7jSspnDyVdjD1jM7Pe0YueiNOmHTTbX
	B2gWuNGq9U95+NgqcyBMjBECIJY0ShkfBmu9oGw==
X-Google-Smtp-Source: AGHT+IHc6LVv2T36wCeU0Ce+15D6rxumbeQhe6frfBp977Gr422jFSZNqO+H7kNZmfvIhKm0myPpuEe62RAzbyd8+iI=
X-Received: by 2002:a17:907:7e97:b0:a51:ab6a:fb96 with SMTP id
 qb23-20020a1709077e9700b00a51ab6afb96mr11699755ejc.45.1712674221736; Tue, 09
 Apr 2024 07:50:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240328205822.1007338-1-richardfung@google.com> <20240328205822.1007338-2-richardfung@google.com>
In-Reply-To: <20240328205822.1007338-2-richardfung@google.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 9 Apr 2024 16:50:10 +0200
Message-ID: <CAJfpegvtUywhs8vse1rZ6E=hnxUS6uo_eii-oHDmWd0hb35jjA@mail.gmail.com>
Subject: Re: [PATCH 1/1] fuse: Add initial support for fs-verity
To: Richard Fung <richardfung@google.com>
Cc: linux-fsdevel@vger.kernel.org, fsverity@lists.linux.dev, 
	Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 28 Mar 2024 at 21:58, Richard Fung <richardfung@google.com> wrote:
>
> This adds support for the FS_IOC_ENABLE_VERITY and FS_IOC_MEASURE_VERITY
> ioctls. The FS_IOC_READ_VERITY_METADATA is missing but from the
> documentation, "This is a fairly specialized use case, and most fs-verity
> users won=E2=80=99t need this ioctl."
>
> Signed-off-by: Richard Fung <richardfung@google.com>
> ---
>  fs/fuse/ioctl.c | 52 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>
> diff --git a/fs/fuse/ioctl.c b/fs/fuse/ioctl.c
> index 726640fa439e..a0e86c3de48f 100644
> --- a/fs/fuse/ioctl.c
> +++ b/fs/fuse/ioctl.c
> @@ -8,6 +8,7 @@
>  #include <linux/uio.h>
>  #include <linux/compat.h>
>  #include <linux/fileattr.h>
> +#include <linux/fsverity.h>
>
>  static ssize_t fuse_send_ioctl(struct fuse_mount *fm, struct fuse_args *=
args,
>                                struct fuse_ioctl_out *outarg)
> @@ -227,6 +228,57 @@ long fuse_do_ioctl(struct file *file, unsigned int c=
md, unsigned long arg,
>                         out_iov =3D iov;
>                         out_iovs =3D 1;
>                 }
> +
> +               /* For fs-verity, determine iov lengths from input */
> +               switch (cmd) {
> +               case FS_IOC_MEASURE_VERITY: {
> +                       __u16 digest_size;
> +                       struct fsverity_digest __user *uarg =3D
> +               (struct fsverity_digest __user *)arg;
> +
> +                       if (copy_from_user(&digest_size, &uarg->digest_si=
ze,
> +                                                sizeof(digest_size)))
> +                               return -EFAULT;
> +
> +                       if (digest_size > SIZE_MAX - sizeof(struct fsveri=
ty_digest))
> +                               return -EINVAL;
> +
> +                       iov->iov_len =3D sizeof(struct fsverity_digest) +=
 digest_size;
> +                       break;
> +               }
> +               case FS_IOC_ENABLE_VERITY: {
> +                       struct fsverity_enable_arg enable;
> +                       struct fsverity_enable_arg __user *uarg =3D
> +               (struct fsverity_enable_arg __user *)arg;
> +                       const __u32 max_buffer_len =3D FUSE_MAX_MAX_PAGES=
 * PAGE_SIZE;
> +
> +                       if (copy_from_user(&enable, uarg, sizeof(enable))=
)
> +                               return -EFAULT;
> +
> +                       if (enable.salt_size > max_buffer_len ||
> +               enable.sig_size > max_buffer_len)
> +                               return -ENOMEM;
> +
> +                       if (enable.salt_size > 0) {
> +                               iov++;
> +                               in_iovs++;
> +
> +                               iov->iov_base =3D u64_to_user_ptr(enable.=
salt_ptr);
> +                               iov->iov_len =3D enable.salt_size;
> +                       }
> +
> +                       if (enable.sig_size > 0) {
> +                               iov++;
> +                               in_iovs++;
> +
> +                               iov->iov_base =3D u64_to_user_ptr(enable.=
sig_ptr);
> +                               iov->iov_len =3D enable.sig_size;
> +                       }
> +                       break;
> +               }
> +               default:
> +                       break;
> +               }
>         }
>
>   retry:

I'm not thrilled by having ioctl specific handling added to the
generic fuse ioctl code.

But more important is what  the fsverity folks think (CC's added).

Thanks,
Miklos
