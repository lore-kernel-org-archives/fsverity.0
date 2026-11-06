Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793989810;
	b=e3kZ03m2l6Ufdy5IvmiDH81fmNWE0zCpmCbp9DnCElK0rnlx19dQNqO2keART7s8MTUE
	 xuFiH6F3fZNe3j4gIc1X36zI2+i5H/xBMqWPbRn3lstc0Pg7OAc/dqHCgjWT1ZMTxfopZ
	 j8aFgOBWfS4CUYAO17ZHKuzzT7OItBarCs+RQLWNCyQbrLe4WpmNfLV982OVjPjZdYBhb
	 ZJ8wb8AOKN1XSpvTnp9ZVkKjBmfWaPWvqlSgF+KzP6/qzYMAcCX6/5ppol2q2DnjkMuAk
	 tkaVAVoDZcRrL6ekfAPM4V+Zt4yZ7XOefAA7CnJdcHYoOz/iMNOa9I0PXBDH1No28AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793989810;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UliTkuKSwijkprFnPvplR6mcOQUjgocutB6yCvWNZyo=;
	b=egHtBdG8s5xwnKx+QM6RnSS+2yoOzRw2uqrp+5cdTYZT4vLsjWzmvPtRxonkSoZ1EGHy
	 WP/XuwNL/m6Izqn+z4dSjqg0D/3h22aLWPchftwhGOvVOHd0qWy7F39wJMWbEdf2znNuW
	 ZKQl9kU3iWCRCDNRMUh95hZo3CiyaljYDojh+V8nrA+dNIp0+rW2rovClpjwCrA0mxPIW
	 PBkbqcfoZqIIdrug/bv2owsJBkaW2zmJqnSco0GxWm+zxfsM31FfGCngttgGQsFbCgjYe
	 9kLG7SC3IST9s8JjcBXR6qj/XPbh/iDPcIk0y03ovkKrncLggC3/SL+3ojh0EemaMzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.win;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548B6606A326
	for <fsverity@lists.linux.dev>; Fri,  6 Nov 2026 18:30:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 548B6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.win
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b633ddfad6so1438167a12.3
        for <fsverity@lists.linux.dev>; Fri, 06 Nov 2026 10:30:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793989809; x=1794594609;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UliTkuKSwijkprFnPvplR6mcOQUjgocutB6yCvWNZyo=;
        b=2H91BH8aPqSxZuLUSGbLA2O0+c6BO5sO2S2Qa4hsEndIPI3rpK+soHE9Ls8VJ2fCl9
         QEgXQtkf6Ho07X0B06246DAq1/w0NRDt+2Wp3k1edZx19QyVNfYm9RxBkZLrMoOH6lHw
         9BWXKdU1bOZi1aqdJWmtjyG4fLA1CHYTDHS4voI8MxQusFG0m8GPJY/iMyRxj4YbJ8Zr
         H8LeEgUusKijR2FnKHi/U+jjVaJHcFgiNi8V2adLBKlotMx8rmXqKayFfIAUHM509jZ2
         xt5u2JnWs4+WqFzhmhi2HPwasmpjzINFe+hu6wCH3oYm+ugAk/Qgo/6pSqTtdZB86Nxr
         ZFaA==
X-Forwarded-Encrypted: i=1; AL+hErGTHQvvKJxjGGqpqSP8tUR2HPjkZHrhjxsWoziRfTxLr44MK7fox0rSkQSPLfSVN3V4IChoxCdlUw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+KtbJhu0VuRGrAGODuJ76DaZF68KsbBK6okgfHC9zzLJLg0Q9F
	haKZ6a+0quHsVOSV9mt5P7xv17eWcp9SI4qkAnQ1OsjzbB/7lRkEtQCBJmqFu1t8
X-Gm-Gg: AYBFou1FiJUt5zJpqciDbLQz76Rtb7DT4WRyhX/Ln4td8ifn/TMFMen6Qr3MrjpTzy8
	WT7lVcu8vDVy2l0380Em3j2azstWuiBf3599JHkX+VQw1AK77L06cqYhKvbrQ9Wn/A8ysg3GXZW
	TvcLwGploJikcQ2VazjDWLVZF972CunKIkm3evmMRcAaCRa0QZ3LGWVtffW3xAOWiSP+e6UkBle
	Q15idBZW8eDeb3sKdZVxYASGwHyW9LnVCuGCmcr9bBzvValfGZT7QYtW6SbM6IYXyLr/b5yU5KO
	keh5IXDh3hT2ul9fWrSSraxGZg4ZusrCGepqRn0on/e3xQQ3WiUKIXRqZhOKmFE4kTtAe2hJAny
	ulCdt4h5NzK7mZNsMz2wIt0XIZMkeuzEM8nQZ5/oy75A6ITBBpmZvM9DV/nFM7QavBWjdq/RlNb
	OeAp+SLvcmiPqZIHccWtO17yKG19cP8g0Zt1vxGz3zDykeElEQqT/hxe1PYR6jz4Q7OVWB7YcJR
	U9nujlOsfVTEdG+Q/onnFjv9GDbrhxyXuVtIUO+WlP4UjO6JER+edo+mamP6uxrDCo/Maq0pnOm
	z3R1Wp4FbiObctCMwv6VvW4O2mb0IJQ1ZG39bO8lZ2ygMegmEAcs30LDHB2L
X-Received: by 2002:a05:6402:2708:b0:6b5:96e9:ae95 with SMTP id 4fb4d7f45d1cf-6b5977c05b4mr2433379a12.10.1793989808664;
        Fri, 06 Nov 2026 10:30:08 -0800 (PST)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b664ad17aasm930869a12.9.2026.11.06.10.30.08
        for <fsverity@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 10:30:08 -0800 (PST)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so143820466b.2
        for <fsverity@lists.linux.dev>; Fri, 06 Nov 2026 10:30:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHoNu8IescvavWsCyJASIndB7gDnGI3lavGpKfPeY98oRasfnYNFociu+C0xHyZTWPkVZ88gryRIw==@lists.linux.dev
X-Received: by 2002:a17:907:ea89:b0:c4c:bff4:200c with SMTP id
 a640c23a62f3a-c4d3531f031mr283547466b.32.1793989808075; Fri, 06 Nov 2026
 10:30:08 -0800 (PST)
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Post: <mailto:fsverity@lists.linux.dev>
List-Help: <mailto:fsverity+help@lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fsverity+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261029232437.2581640-1-jarkko@kernel.org> <20261029232437.2581640-2-jarkko@kernel.org>
In-Reply-To: <20261029232437.2581640-2-jarkko@kernel.org>
From: Ignat Korchagin <ignat@linux.win>
Date: Fri, 6 Nov 2026 18:29:56 +0000
X-Gmail-Original-Message-ID: <CAOs+rJVNyJwqp4CR-d_T4GVjNMjgbaDL78_mZCVGGvN1xpd33w@mail.gmail.com>
X-Gm-Features: AclHuK8TGNjpH-aL7rdb3WJ8RwrdjoKcrJ52VddwbSIE-hld3YHoMNkMBO-NFbA
Message-ID: <CAOs+rJVNyJwqp4CR-d_T4GVjNMjgbaDL78_mZCVGGvN1xpd33w@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] KEYS: Introduce keyring_is_empty()
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org, 
	Eric Biggers <ebiggers@kernel.org>, Lukas Wunner <lukas@wunner.de>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
	Mikulas Patocka <mpatocka@redhat.com>, Benjamin Marzinski <bmarzins@redhat.com>, 
	"Theodore Y. Ts'o" <tytso@mit.edu>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Shuah Khan <shuah@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, 
	"open list:ASYMMETRIC KEYS" <linux-crypto@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:DEVICE-MAPPER (LVM)" <dm-devel@lists.linux.dev>, 
	"open list:FSVERITY: READ-ONLY FILE-BASED AUTHENTICITY PRO..." <fsverity@lists.linux.dev>, 
	"open list:BPF [GENERAL] (Safe Dynamic Programs and Tools)" <bpf@vger.kernel.org>, 
	"open list:SECURITY SUBSYSTEM" <linux-security-module@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 11:25=E2=80=AFPM Jarkko Sakkinen <jarkko@kernel.org=
> wrote:
>
> Introduce keyring_is_empty() in order to decouple for BPF, dm-verity and
> fs-verity how keyring internally manages the keys.
>
> Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>

Reviewed-by: Ignat Korchagin <ignat@linux.win>

> ---
>  drivers/md/dm-verity-verify-sig.c                      |  2 +-
>  fs/verity/signature.c                                  |  2 +-
>  include/linux/key.h                                    |  1 +
>  kernel/bpf/keys.c                                      |  2 +-
>  security/keys/keyring.c                                | 10 ++++++++++
>  .../selftests/dm-verity/test-dm-verity-keyring.sh      |  2 +-
>  6 files changed, 15 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/md/dm-verity-verify-sig.c b/drivers/md/dm-verity-ver=
ify-sig.c
> index aadcf5e4a47c..cad21e9144ed 100644
> --- a/drivers/md/dm-verity-verify-sig.c
> +++ b/drivers/md/dm-verity-verify-sig.c
> @@ -153,7 +153,7 @@ int verity_verify_root_hash(const void *root_hash, si=
ze_t root_hash_len,
>         if (ret !=3D -ENOKEY && ret !=3D -EKEYREJECTED)
>                 return ret;
>
> -       if (dm_verity_keyring->keys.nr_leaves_on_tree &&
> +       if (!keyring_is_empty(dm_verity_keyring) &&
>             dm_verity_keyring->restrict_link)
>                 ret =3D verify_pkcs7_signature(root_hash, root_hash_len,
>                                              sig_data, sig_len,
> diff --git a/fs/verity/signature.c b/fs/verity/signature.c
> index 0302a4e506ec..890d33b9d812 100644
> --- a/fs/verity/signature.c
> +++ b/fs/verity/signature.c
> @@ -67,7 +67,7 @@ int fsverity_verify_signature(const struct fsverity_inf=
o *vi,
>                 return 0;
>         }
>
> -       if (fsverity_keyring->keys.nr_leaves_on_tree =3D=3D 0) {
> +       if (keyring_is_empty(fsverity_keyring)) {
>                 /*
>                  * The ".fs-verity" keyring is empty, due to builtin sign=
atures
>                  * being supported by the kernel but not actually being u=
sed.
> diff --git a/include/linux/key.h b/include/linux/key.h
> index c4486e938a06..20ca43f5eab1 100644
> --- a/include/linux/key.h
> +++ b/include/linux/key.h
> @@ -439,6 +439,7 @@ extern int restrict_link_reject(struct key *keyring,
>                                 struct key *restriction_key);
>
>  extern int keyring_clear(struct key *keyring);
> +bool keyring_is_empty(const struct key *keyring);
>
>  extern key_ref_t keyring_search(key_ref_t keyring,
>                                 struct key_type *type,
> diff --git a/kernel/bpf/keys.c b/kernel/bpf/keys.c
> index bffc356839ac..24e0416abc99 100644
> --- a/kernel/bpf/keys.c
> +++ b/kernel/bpf/keys.c
> @@ -29,7 +29,7 @@ struct bpf_key *bpf_lookup_keyring(void)
>
>         if (!bpf_keyring)
>                 return NULL;
> -       if (!READ_ONCE(bpf_keyring->keys.nr_leaves_on_tree) ||
> +       if (keyring_is_empty(bpf_keyring) ||
>             !READ_ONCE(bpf_keyring->restrict_link))
>                 return NULL;
>
> diff --git a/security/keys/keyring.c b/security/keys/keyring.c
> index 5281da9d5bf7..ac48d6204915 100644
> --- a/security/keys/keyring.c
> +++ b/security/keys/keyring.c
> @@ -443,6 +443,16 @@ static void keyring_destroy(struct key *keyring)
>         assoc_array_destroy(&keyring->keys, &keyring_assoc_array_ops);
>  }
>
> +/**
> + * keyring_is_empty - Check whether a keyring is empty
> + * @keyring: The keyring to check.
> + */
> +bool keyring_is_empty(const struct key *keyring)
> +{
> +       return READ_ONCE(keyring->keys.nr_leaves_on_tree) =3D=3D 0;
> +}
> +EXPORT_SYMBOL(keyring_is_empty);
> +
>  /*
>   * Describe a keyring for /proc.
>   */
> diff --git a/tools/testing/selftests/dm-verity/test-dm-verity-keyring.sh =
b/tools/testing/selftests/dm-verity/test-dm-verity-keyring.sh
> index 1f9601ef22f8..792449d356cf 100755
> --- a/tools/testing/selftests/dm-verity/test-dm-verity-keyring.sh
> +++ b/tools/testing/selftests/dm-verity/test-dm-verity-keyring.sh
> @@ -746,7 +746,7 @@ test_keyring_inactive_when_empty() {
>      log_info "TEST: Verify dm-verity keyring is inactive when sealed emp=
ty"
>
>      # When keyring_unsealed=3D0, the keyring is sealed immediately while=
 empty
> -    # This means it should NOT be used for verification (nr_leaves_on_tr=
ee=3D0)
> +    # An empty keyring should NOT be used for verification.
>
>      log_info "Keyring state (should be empty and sealed):"
>      list_keyring_keys
> --
> 2.47.3
>
>
