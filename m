Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45E34F4726
	for <fsverity@lists.linux.dev>; Fri,  9 Oct 2026 18:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791569497; cv=pass; b=NpCo1WXySmTw1uD+QtkTVjmxfixQK3it29eUJwIdhXsNnN/lQONqsppDYjPTGf5p+iU8hn94UNzgoEjaMkMi/jGmtmgqGiL1ljayDgUdNEAtWW/A8eMbcqFjokg4N9eGCOUOlmlDF0jpTYXCo6UNupH3k4V4gLC/EXlQ21On99k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791569497; c=relaxed/simple;
	bh=WdgR+YdkAuXsXE819GZyZO+BI0w8tx59DEQncF9OA9k=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=MGcScH8SnMpg95vbjhjZeVgyP0yqLsfZajhrZldRPVI0PmTDZIk3KDGTpSIUYYapSYEUOqpEozpJR3dL1D8LfNU4TACVubnqg/Aeu1utb6E+N/EDWKlvTqk0LRW9W7tLqDG6qlZryqZLj8/SHceSafuUPg8kQ/Jl30nyZMNrj7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IF/+/0he; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IF/+/0he"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2e2007dd8bso22679266b.2
        for <fsverity@lists.linux.dev>; Fri, 09 Oct 2026 11:11:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791569494; cv=none;
        d=google.com; s=arc-20260327;
        b=j5UP+2b6+INy0h2dfjdl9RelUVf1p7TO/v/q4VUEJ8U8hBLUE4/IvWYZWpOd+eOD6n
         qnomLepEkExJXxsqtIybzGtwIBGJTfBAF+cxTwxCTEMS6C5lqYMaRQJSt18S0OLXkBt9
         GZiAPlv8uyOdG9bmQbAfKEe4GPLPv0+HHrIXhqVmMHNQwb/ieARvsapoqx2nT9xQ66xV
         8dL13ihX3X4aoOaPfmLQ7WHtNf6eKGTsDRzkpp7kBro4IsRMBtdQ/5oss9MURdD13SpU
         QW2Fwsza8jpC2IvcFBAc7gc3KBya/TZ9o6urc/1GfqzwG2oAs7/UaHY6VJdKqD0mFmFA
         c86g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=No4eTPnZ+UxSBkx9itGIleDNkZefe+ociK7F/sLwaY8=;
        fh=92U4gh6LrZn3BiHx9NGlfz0aTFjBmOAljSXWsJlgNhY=;
        b=XpnVc84xgegGtrq69YIivu5vt1FS465+74rZ2X7fUhLd5smqNA24OHs7zYQWKcQUNc
         MCua0KMF90Yt0dCjcHMOrHZYNybvt6iPa9XWgLMf2wEHkUro8kKKY0GkRkys7PI0c1jR
         EskuvmzASzcuaIfZsid4nge/RGUivR5jm1AfKzcu1J1ZAOmGgBMXbiGDnyxFW+X74Xet
         UM8izMUYluc+188NSmX2+VYkEuZFUBCpHD3Iq/bDXDMva+hYlkl4ex9eBC2lMX7fmRzx
         eEWS35aSM+Ygu1iVodw6KLQB18pqu9xgWXgkcWL4RsOPz7muAL/MInVKWwL3eIg4Wsmf
         J95g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791569494; x=1792174294; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=No4eTPnZ+UxSBkx9itGIleDNkZefe+ociK7F/sLwaY8=;
        b=IF/+/0he/1kP3qXRT2S/Fo5Vmhe9D0ThpRIeaGDHm45huh7epdkI1aySyqTx5ME60l
         uncP+Qrgpw0uJGJvTmHE72LH0SW8zu7+Iq3YCl5B/WjUP9VVUw39ol/GHQkZwVBY+3Bb
         KSKpETPE3o51fbs6sa62r/3RSjtuShccKdocdy6DKBpsFlm5nGoBDDUVTKYsl/7PSxTq
         vymkZJ0WDRvwQbhx167kdbers8fciSjVrZSJkBio+tLxTSVpBo890MBKtW/AW5fZOV05
         3qiYZ61L8rXdcucrmfCCuARP9pHjSk5RjDkZ86V/6ejc0PZOZoHH0vKdHiEJATUWbuMR
         zatg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791569494; x=1792174294;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=No4eTPnZ+UxSBkx9itGIleDNkZefe+ociK7F/sLwaY8=;
        b=cWUHu+4AeKOiVUB3jyI9+xSpmQ4LCYQib+bme43olGCYf1DXUau4L1WiAW8NPy2+X2
         P492bxsb6hKIN8hplCXcSFJSljcvloONv/9QFkbKjE+p9vDq5Nig8x9clnPA/ap0SgR4
         l3sXkphm44l4ojjChcsjqI8b3zZMEUiyo9ZLXBSoltZyrLfk8pcKVEzhXS2wm6Lfui9s
         MZlH2dEeO3BV86qw5K1okuJe08/qHl8Z+blGh06aORf9Hv0b7merFzzHEXBbftFRHJIR
         98AjmmjerNI07dnhFMbQoLiTiecQnbven6cAfaG/O9ta/UPxEBB+7bnVXod5/Y6m49c2
         +nGA==
X-Gm-Message-State: AFq9FYLa0spE8LZAvPaAnhiwy7W1ithvV2BO3QsBn1wbjc4FOI/Ftkf7
	C+TCDKC7Q3eDTg/Uj1c+av3Cr7MGO7s8Bj5qbdwrqbhGld1ihyaK7n2iSriZAlNYtmZ0yvEhfzD
	VvpztxlW1WJuiYcchk1WOnuX2j7/Fois=
X-Gm-Gg: AYBFou12tDQ7nuTsfm14lt7lnnWxGENNmUWktKzkw7pt+23eWCyLrE8ZXk7uRHTYm66
	lCrXaN8EY/EFRY67Bh4jusuaoF+8M2EAAxrWTSfNxjYV7/lvNLDGJtZ8g9p4armYS9eFtEGOTAs
	g7YU4NWqvA3zyzVUad07vj3FbuOpzjRACwFn5+15iUyoGKMIMrSkEB/wkfW2niR/36cJo45DRwX
	QYidqMHuGzVwXOAXg6O/Byy2xZigRuoleRNyapgAVifEnE+KiX7wgVGwH462dBcVTsfdL6c9xXk
	Ztye+2hZnEPxq/tGQnrwEf35JtttmPh2vk34SZQZonbLFWNWWOh5iIpEDdWz5OLgp/TC2W0WGVw
	NxkKd0gCm9Vj3pJkNj/udoY9mnwzaGtHkYd7G2Jcy
X-Received: by 2002:a17:907:bb49:b0:c29:62d8:68af with SMTP id
 a640c23a62f3a-c31a9ffda78mr277596866b.47.1791569493771; Fri, 09 Oct 2026
 11:11:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: =?UTF-8?B?Um9nZXIgQWxhc8Og?= <vonbloom@gmail.com>
Date: Fri, 9 Oct 2026 20:11:22 +0200
X-Gm-Features: AclHuK_0U45sdGLsb4_JlQaS2HixZO7FmF0_k12UyuRozwqXHB_NNtmWhZpkzdQ
Message-ID: <CAELqY9==Ter2XQPRp=gjW5T75T+7kcZCXpn5roF2L6tY6mQNxw@mail.gmail.com>
Subject: [REGRESSION] btrfs: fs-verity "FILE CORRUPTED" on readahead of
 compressed extents since 7.2
To: linux-btrfs@vger.kernel.org
Cc: fsverity@lists.linux.dev, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

(Resent with a subject line: the first copy went out without one,
sorry for the noise.)

Since 7.2, reading an fs-verity file on btrfs mounted with
compress=zstd:1 logs "FILE CORRUPTED" for compressed extents read
through readahead, although every read succeeds:

  fs-verity (vda3, inode 58996): FILE CORRUPTED! pos=8912896,
  level=-1, want_hash=sha512:...

(one line in dmesg, wrapped here). The positions are mostly multiples
of 128 KiB. read() returns no error and the data is correct: the
synchronous re-read passes verification. We hit it with composefs
(bootc) objects on the root filesystem of a laptop, and reproduced it
on a second machine and in a VM.

Reproducer (root, any btrfs mounted with compress=zstd:1):

  cd /mnt/btrfs-zstd
  find /usr/lib -maxdepth 1 -name '*.so*' -size +500k -print0 |
    xargs -0 cat | head -c 60M > f
  sync
  fsverity enable --hash-alg=sha512 f
  echo 3 > /proc/sys/vm/drop_caches
  cat f > /dev/null
  dmesg | grep -c 'FILE CORRUPTED'     # 10 here

Same data with chattr +m before writing (uncompressed): no messages.
Reading with POSIX_FADV_RANDOM: no messages.

Tested on Arch Linux's kernels (no out-of-tree patches) in a KVM
guest, virtio disk:

- bad: 7.2.2-arch1, 7.2.7-arch1, 7.2.9-arch1
- good: 7.1.11-arch1, 7.0.14-arch1, 6.18.55-lts

Also on bare metal (two NVMe laptops, Intel and AMD) with
7.2.9-cachyos. A similar symptom in 6.16.8 was fixed by "btrfs: fix
incorrect readahead expansion length" (Oct 2025).

#regzbot introduced: v7.1..v7.2.2

I can test patches.

Roger
