Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792965503;
	b=FWPFVPejgPJyNNXNVlvWJqkrRSp72PvnmTuK1p47umCe5b7Qdr2UerYd4xWLim3XqgmU
	 awxOeothcuS0R7y+POx7JuAma1pNPwqUiDt5yZd7jUDK7C/HRojCICevDj1/NuulWo58W
	 ECjjWDYuW5jPuCYitUTQdrgRqXJXh6K8nlbUuV1+wmHqP8e/gnGxvdGlCcNflu4VjqZJN
	 uoVWvGU5XAke6+1vInE4qmSln80Dp6eiTjNi7maVV+kF5/3yqKOIUX4ZtilgFNzM0p0O2
	 h684r75ajnXWQt1SJaKHvfDisBJJYOyQaok8h+R4+Fwzl+5wYtwUUexKwz7P+UODYVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792965503;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=kvZ3lSi6Tt2Wj33E5oFIA9PxiWNdWQfCeDMs2YC+DR4=;
	b=TdXvQT1YB9Ef0hIoNH0rMYJRq21kBDLs2yCHb7C4hu4juNNQoJAwhZ977CAUZgxPIAj3
	 am4R0voIYvSI2ReXC/Ey0jOTkkMFOjv4D8M7LPY5DHdpbop/D1Re/j2Zdlsq8tfFgF3S5
	 OV2jqHEhJALXjhJ9XbrXKPIvt/ZydIufGrlkdYWjhCp+YnnaASuFjXI2Vfabki6n6BhBw
	 UDK++tlxHUddTW1LjYkqdV4AUlUcQp9iuf/a6HQH9TgKTmquRvhyuzN4RgIiXVb45Mull
	 7FQF4UXlHu0pUYltbhAbHUqIykgZt3IY0aFv6gGFkPErDH8bwtlL6L6wkdKoTQA5Sqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KQxHI0dA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065B3606A31A
	for <fsverity@lists.linux.dev>; Sun, 25 Oct 2026 21:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KQxHI0dA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D78551F01825
	for <fsverity@lists.linux.dev>; Sun, 25 Oct 2026 21:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792965502;
	bh=kvZ3lSi6Tt2Wj33E5oFIA9PxiWNdWQfCeDMs2YC+DR4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KQxHI0dAJiLxxdbR4qfQm6fsrrKTOB9IG0PelY/iqQJiw5sNeUlPGnIfItTQ3U/78
	 eWWgnXjPE17D3vAyueewP2qtqIBrmTntZfkljJXGMgIJICzGDZr5QvYPHvRx/vK0t3
	 LjrNc2LoScJwzkxo6Miil34nN446FUQgXUJd3Pwmv94fLvsrpkuBmuHoeJPWqT+9OB
	 Qy/6In445T4fhu46mZtPTz+a/e9OHK8C4QMvgJRpFk6+8DzTMsqofeT9eKJbKq1iwJ
	 CxR4x818i76Khapo5Z/GceMo+HSHmxOfY2U47DwuUcF7vpa/OhL3Y4LimNWihxkTX3
	 v5bulLWMMilWg==
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1931ff67a29so5458544c88.1
        for <fsverity@lists.linux.dev>; Sun, 25 Oct 2026 14:58:22 -0700 (PDT)
X-Gm-Message-State: AFq9FYJVXHSBdMC+jfGdBUraRciGE+8WjevNigXVxsCTpEjie1uMDJ6w
	U4JIKvnRDI7iOuHhgyetTv7JZiRaZt+KeVBJA8ZrzmEUmSDF7Pnul8YOJaEYtoR/oaFXrSrWmFw
	iebugbkhLHP5rShVosdXzhMoERmzd0gY=
X-Received: by 2002:a05:7022:b90a:b0:14d:baf5:c415 with SMTP id
 a92af1059eb24-1993499de9fmr7765063c88.7.1792965502214; Sun, 25 Oct 2026
 14:58:22 -0700 (PDT)
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Post: <mailto:fsverity@lists.linux.dev>
List-Help: <mailto:fsverity+help@lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fsverity+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261025204534.122506-1-ebiggers@kernel.org>
In-Reply-To: <20261025204534.122506-1-ebiggers@kernel.org>
From: Fan Wu <wufan@kernel.org>
Date: Sun, 25 Oct 2026 14:58:10 -0700
X-Gmail-Original-Message-ID: <CAKtyLkEoM0denNMUygkhVxrREfAjD7C6x1JKRhG+g0OXuLMsdQ@mail.gmail.com>
X-Gm-Features: AclHuK9DXVo7gzKYi3TIlVq-U2b7yv3AWnPgaGZUiil2pj-fz5cZeytCqyAm4uc
Message-ID: <CAKtyLkEoM0denNMUygkhVxrREfAjD7C6x1JKRhG+g0OXuLMsdQ@mail.gmail.com>
Subject: Re: [PATCH] fsverity: Tell LSMs about signature only after verity is enabled
To: Eric Biggers <ebiggers@kernel.org>
Cc: fsverity@lists.linux.dev, linux-security-module@vger.kernel.org, 
	Fan Wu <wufan@kernel.org>, Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E . Hallyn" <serge@hallyn.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 1:45=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> FS_IOC_ENABLE_VERITY calls security_inode_setintegrity() before verity
> has finished being enabled.  That's broken because enabling verity can
> still fail at that point, e.g. due to insufficient xattr space.
>
> Afterwards, arbitrary contents can be written to the file, which doesn't
> actually have verity enabled.  The in-core inode stays the same, so the
> LSM considers it to have verity enabled with a valid signature.  (Or
> rather, in the case of IPE, which is the only LSM that implements
> security_inode_setintegrity(), it also checks IS_VERITY(), which can be
> bypassed by enabling verity with no signature after the file writes.)
>
> Fix this by moving the call to security_inode_setintegrity() out of
> fsverity_verify_signature() and into a new function that is called from
> the appropriate places.
>
> Fixes: 7c373e4f1445 ("fsverity: expose verified fsverity built-in signatu=
res to LSMs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---

Thanks for the fix!

Reviewed-by: Fan Wu <wufan@kernel.org>
Tested-by: Fan Wu <wufan@kernel.org>
