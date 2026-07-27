Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079581F03DE
	for <fsverity@lists.linux.dev>; Mon, 27 Jul 2026 10:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785148275; cv=none; b=r25bcVgS6+Ov2pHtsi6H7gHHyutBA0/5+7iIlY5+0P+6xDDI7v0U/zru5IsNgKAyoYF0C0yg+1w8xQbd+jWxXua+06x5ByvAQGLKFhgHwgZ9BkfOWIzsxlvp2UumoFxtVDJmFC6BsciSf7Ux6BXm8E3S5ihcLznqR9GY/EIFCI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785148275; c=relaxed/simple;
	bh=woXyy5jNb+ujgRi8bF+OOGN9qHExhfEYu5OpEGq2f1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bl+Gz3mnGbZRNpIiYsekwxUAvKhpdg+/UE5p2nYcVEUH/1Xb6F4uijOubwISed/f6jsXfYEveW4gLYnf9XR3hZ7KtmN5GMVjiYSiW6NdmqIOd+70YqfGrkLoo9iJzaAGn4kMZ8TKcLmOgIhpF/hkzmBatF6ZAmpoEdJo2xvcWKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rexbPfGp; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rexbPfGp"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so13926575e9.3
        for <fsverity@lists.linux.dev>; Mon, 27 Jul 2026 03:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785148267; x=1785753067; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4+ZEgHulxWHuwHPHorxyrYnvV0LUKlyF4fm6PY9N2wQ=;
        b=rexbPfGpJ90nhRT0O/ivyOdg4tJzCnLZey4Vu4gDRmIy0Vipx2lJ/+g0lSPP4PxCiH
         9ZW0vPjzdmP4ZCQFZ4nyopTXR37kjtDxWyDMIdw76vXm9BZk9DlaJJS20UJ5Ms+6mOiv
         T9o32AOr7zgt+xga+9Z4wVt05QlBo3EBPIj1Oz8mGO5ZY/GnxoRDOwV/s52U4qDpub+1
         QKhCyavWFjaWluhVreeu4Fwh0OlkikltcTjlp4jMQWdOqwW9FybQ8uAEB1OGlf2PhOYz
         zxZbUkpbV37i5ikPc30W8+QOc4wrHNkTyCmq9NXKsrwwYq+0qifxdCExDB5GkiBpmLTh
         1QyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785148267; x=1785753067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4+ZEgHulxWHuwHPHorxyrYnvV0LUKlyF4fm6PY9N2wQ=;
        b=qm+Q7puoZJr0T6BL1YMlEynkZ51eQDPbz6ve3Xp+O9+aQa8jGjf8CkN2/aPJnitMoo
         9y5BuEsc1soet40KwLeFHHFIyzAyfHfAm2RkIaOYpjevk5fzMN+FHVm2aLaJoW9i/Pc5
         mb/kCknmC2P0IE2EEfDlKeDgrYrGyiT86RMtbLoN0t8vdo1M0FMDKwBRYuSHgH6vtqxX
         0t9q7RdJg/NYwS5tqkMo1B82D5HEnsjDGuSL1mc8oCnASWhaKxgfjnx1HxJLe8WEdzw+
         PZLtSRhB7sPzOMgjeTVFK1HHGajkip1B5CqBLuIRYr5eJsEsvvyirl/irz+zEdFx1Ool
         MQoA==
X-Forwarded-Encrypted: i=1; AHgh+RpwXPLkSgTa+8ERemqxcsDcsmGAJVkWnXRRVWKx81gCHzzFuKhF5KXxEQIkvgLAa1XvcE4DoKtDFg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5ItbQtB2+rWdDcwqkpnRdNHuTJWdiZdmirrJfrOjOLOB1Fnkz
	q36L1BlRNLnrjwzLeXoCOjEoob0OL7QCiGHHL2kTPhtLyTrbjBTRLsR8
X-Gm-Gg: AR+sD112YWfW70HMO55Sjeedax3GHs0+9RoW+63cCB9pLJ67glgXKdZqlfbJMe8tu45
	hBIv1qlFcIuzg0rkxI8NbiGHuR5fpZ7aUWbf4rPk4Y5tiHknMJ55GsKHHTmhtfVDekhvcJPJ4db
	/ur4MCLzp3iaDOfzVdvk2JDpibOUjx+2zY6x1V/hsV5a//HVrpmEX2mEWAnw71Z4A0GNvvcvVsY
	Bwx15S1EGU91SLhHfvom7B9NhY+2AXU+G1Djs3PCBKvFdh0X1n3gtyvc20ReKmP5B2TJG72u9pM
	/1rm2HxXe+k0Vv3VXKDPst1TSK7TbuwUahDH81DXB0tiJywn8plS6vXqWr9y0UNqYm4gEz5lS2L
	faephlPmuQMq6jKmT8MAXqCFAXJlMKfhN/4fAKRgB5Nf9msVnE5X3qP0Pb2/oG7VxoCQ0oV3m7h
	QJ3IMsFg==
X-Received: by 2002:a05:600c:19c9:b0:492:4a50:41fe with SMTP id 5b1f17b1804b1-496b56ff171mr106409805e9.22.1785148267024;
        Mon, 27 Jul 2026 03:31:07 -0700 (PDT)
Received: from spark.Home ([2001:8a0:7280:4000:53fe:effd:424:fa7e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b49a6e17sm204884765e9.13.2026.07.27.03.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 03:31:06 -0700 (PDT)
From: Eric Curtin <ericcurtin17@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Eric Curtin <ericcurtin17@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Eric Biggers <ebiggers@kernel.org>,
	"Theodore Y . Ts'o" <tytso@mit.edu>,
	Gao Xiang <xiang@kernel.org>,
	Chao Yu <chao@kernel.org>,
	fsverity@lists.linux.dev,
	linux-erofs@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] init: boot image-based systems without an initramfs (rootimage=)
Date: Mon, 27 Jul 2026 11:31:04 +0100
Message-ID: <20260727103104.2531937-1-ericcurtin17@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727-gepaukt-eislauf-waran-7c03f0e47609@brauner>
References: <20260718191551.1703670-1-ericcurtin17@gmail.com> <20260727-gepaukt-eislauf-waran-7c03f0e47609@brauner>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 2026-07-27 10:55 +0200, Christian Brauner wrote:
> So I have several structual and design issues with this.
[...]
> You're embedding a whole deployment topology into the core code here as
> well... There are _five_ interacting __setup parameters. Every real
> deployment immediately wants a sixth knob: A/B fallback inside the
> mechanism. Because in your current model every failure is a panic().
>
> But that also means image selection must live in the bootloader anyway:
> composefs/overlay stacking, LUKS-encrypted state partitions as command
> lines can't do crypto secrets, fsck of the carrier, directory-based
> deployments yadayadayada.
>
> This is just turning do_mounts.c into policy it shouldn't be involved
> in.

Thanks for the detailed review. Let me state the goal plainly, since I
think it explains the choices even though several of your specific
findings below are real bugs I should just fix rather than defend.

The goal is A/B image updates from a *single* partition, without
paying for a second userspace spin-up at boot.

Today there are basically two ways to do A/B on Linux:

 1. N partitions/dm-verity volumes, each a full root image, selected
    by the bootloader (dm-mod.create= + a GPT attribute flip). This
    is the ChromeOS/Android model. It costs Nx the storage/partition
    budget up front and the slot count is fixed at provisioning time.

 2. A single filesystem holding N image files (what bootc/ostree/
    composefs already do), where something picks which file becomes
    root. Far more space- and slot-count-flexible, but "pick a file
    and expose it as root" is currently dracut/initramfs's job, so
    you pay for a whole extra userspace stage whose only work is the
    five steps in the cover letter.

rootimage= targets (2): keep single-partition flexibility, drop the
"spin up a second userspace just to switch_root" cost. On fast-boot
targets that first userspace (loading dracut/busybox, forking,
possibly loading modules) isn't free and is pure overhead for five
mechanical steps.

To be clear, I'm not trying to relitigate "no bootloader spec in the
kernel" - I agree with that call, and A/B slot selection/fallback
bookkeeping is meant to stay in the bootloader, exactly as it does
with dm-mod.create= today. rootimage= is only meant to do the same
mechanical "resolve the one path the bootloader already chose, verify
it, make it root" step dm-mod.create() does for partitions - just for
the file-backed case, where there's no dm table to describe it. So
the "sixth knob" is intentionally out of scope; where you're right is
that I haven't specified what happens when this step fails (currently
panic()), and that needs a real answer, not "bootloader's problem".

On the rest, these read like real bugs, not disagreements, and I'd
rather fix them than defend the current code:

 - filp_open()/fput() unused, and no guaranteed relationship between
   the fsverity-checked file and the path/inode init_mount() and
   erofs's own filp_open(fc->source) resolve independently - agreed,
   this needs a real "mount from an already-open fd" path.
 - multi-device erofs / rootimageflags=device= meaning the digest
   only covers the primary image - agreed, real gap.
 - the carrier fs being fully parsed, including reading the fsverity
   descriptor itself, before anything is verified - agreed, that
   ordering defeats the point.
 - zombie superblock / dangling source path / no loop-style
   backing-file equivalent after detach - agreed, needs fixing.

I'll rework this into a v2 that only tries to solve the "take an
already-resolved, already-open file and make it root, verified"
problem, drop the multi-knob framing, and either fix the fd-vs-path
lookup properly or wait for the generic "mount from fd" infra you
mentioned.

Thanks for going through this in such detail.

Eric
