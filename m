Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC092500CC
	for <fsverity@lists.linux.dev>; Mon, 25 Nov 2024 20:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732565206; cv=none; b=I4bbcxsubbmY8uochroDA+lUzuK4oWPeyWeXn1LD4rOckEdjKEVrQnxYAGQwCitrG1+fssh4rG+nibcpCOM2/s1Rpk88DCYyAgOxE08x4MWQfiRw3ikBJ9yHIGTfbJoBBXeEu6QugD6+2qMl9YsGiWqjpwSIHmDD2LjTJNZTg3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732565206; c=relaxed/simple;
	bh=u6af+I92f6sSXpFnjnWX3Cc2b1rzCyg+Lxjc/DSzym4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AoCX53xHE8zf//5cvAPkIqE/nj88zMhIpPLW26NwPLvEA8yqjIu/qA2ywSI1ZjYrEtYd/JOcz/1CE5nu2MM5Q18arClVGcMLrQi/fbNtUh9XJsDwBS9AK1wpikfnNKbf1cCeu/I9Ld2DCoqcnHV+4wvfr9iGm1yc90pQ4BBts3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ad5QmfFn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ad5QmfFn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732565202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=shgv0jrPPol0J1FVe+rJN96wHpyBBM3FApulHaXX7sQ=;
	b=ad5QmfFn8AX8X3uB2YsjCneTg12rXaQki8K6AR/sgciV4O4eKGf3XqmI6j4aLx4xgF9oOX
	5dJbMt/Fyl8sNRuEaqd6mKiIu21pIDixARCbjR7qbORo4rZ8VzKUU4XwFXNxxr8K+Sdd+B
	y+UpnpZyyPV4SRh5tz2jXDTO4y4ecAI=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-347-gRdIRjztPDehFLK3nUUY6A-1; Mon, 25 Nov 2024 15:06:38 -0500
X-MC-Unique: gRdIRjztPDehFLK3nUUY6A-1
X-Mimecast-MFC-AGG-ID: gRdIRjztPDehFLK3nUUY6A
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-5f1f53f407aso718523eaf.0
        for <fsverity@lists.linux.dev>; Mon, 25 Nov 2024 12:06:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732565197; x=1733169997;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=shgv0jrPPol0J1FVe+rJN96wHpyBBM3FApulHaXX7sQ=;
        b=l4FylmcBiq/weXNlJNqxJdUdgjD0E8axqiWlxiRN+bivAiqUWR6Cu5/tRlc9rKMK/o
         /CAsVzD1CbYca8LDP+NukDWDnc95JkUCDKu2jhL9+cmgv77wX9wrARxxPhmN8O24nI89
         5t9tb3CTK4Z2tbKdrj2Ps5caclV6qnz8N9se50OcszKtzIKJRl4aEhfvIb/DknFOUZm5
         JPwtzTJCW1LVmyxXxaYXcaL8dNoriIWi/8qTIuXbkt+d3gxd+GTmJtNxOEn6Qgdt1v1R
         cM2D8cGJJIX/wkqKS8hkLDlXkXDbcWfiyMO6nepyUVudwCnauuEepmEE8zghSkxCKrP1
         K9hg==
X-Forwarded-Encrypted: i=1; AJvYcCVjpLQoGQoRW9BnEU8GaCoh5yRMdUoB/ZG6VNDDftfURKRAg1+0OdX8P9BVK9P6/fUERZzmM8N5iA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwGD3XHC01QECDj4fimbkNEQvWLNfMdk1jTRnIrq5cbhkNjbksC
	byy+C9AHnBAujVejeXfaRIeNlQmLfAveW4ZWQqT3RilBFpdfI2Wkp0/1sKwLZ6t6VAqBzpktPNi
	NQNJqDuhtZ9SJwNFJ4gGAh01bchSueJIHTmC0RAG7SHGZ5D8fez2rfXjPm3hwmPga7l3xQlCodZ
	lXwUoZTsBkeTFdypZ1iuJRgULQrZfmaxN085tQBy+FwzMy
X-Gm-Gg: ASbGnculhf7KkyPETuDlH+0/lk+SjgT5QunX2LkeKs9421J4x0Ide1yzunqKKZfNVFU
	WOnNu5FRNTSfRewF/cT49gtDN0RlyEAyQ4a3XBJcQEffHX387Py/z6jNdkIo7qA==
X-Received: by 2002:a05:6820:512:b0:5e5:c073:9ea5 with SMTP id 006d021491bc7-5f06a9e2371mr12093872eaf.6.1732565197397;
        Mon, 25 Nov 2024 12:06:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3v1WdRk0SUJArCrg3aog310uLhXDI+XFSKoQAHBgEKoNJVKhd24ZJR/QKdpx9OG0bSQwdA6vMSi29RD9r+2A=
X-Received: by 2002:a05:6820:512:b0:5e5:c073:9ea5 with SMTP id
 006d021491bc7-5f06a9e2371mr12093855eaf.6.1732565197103; Mon, 25 Nov 2024
 12:06:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241125084111.141386-1-allison.karlitskaya@redhat.com> <20241125181117.GB1242949@google.com>
In-Reply-To: <20241125181117.GB1242949@google.com>
From: Allison Karlitskaya <allison.karlitskaya@redhat.com>
Date: Mon, 25 Nov 2024 21:06:25 +0100
Message-ID: <CAOYeF9W0BUAkrAf0LTpKiD_Au5W8OUdeBZAdDOYxu=HLbC=jHQ@mail.gmail.com>
Subject: Re: [PATCH] btrfs: add FS_IOC_READ_VERITY_METADATA ioctl
To: Eric Biggers <ebiggers@kernel.org>
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, linux-btrfs@vger.kernel.org, fsverity@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: j2gCXJ9LW4qCeJR5uRiEjuGWzDn8meCVsfvQID8z7KU_1732565197
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

hi Eric,

Thanks for the reply.

On Mon, 25 Nov 2024 at 19:11, Eric Biggers <ebiggers@kernel.org> wrote:
> At the time, btrfs did not support fs-verity.

Oops.  I missed that detail. :)  I wonder why they did the
implementation without the metadata ioctl, then...

Would you like me to change the commit message?  (or feel free to do
it yourself...)

> This ioctl isn't too useful, but I suppose adding it to btrfs can't hurt.

I ran into the missing implementation because I'm trying to use it here:
  https://github.com/tytso/e2fsprogs/pull/203
for the ultimate purpose of this:
  https://github.com/containers/composefs-rs/blob/main/examples/uki/build

tl;dr: I'm trying to build filesystem images in user-space with
fs-verity-enabled files inside of them, by copying the metadata up
from the host filesystem.   I have btrfs on my work machine, so for me
this ioctl is definitely very useful at the moment. :)

> Can you run xfstests generic/624 and generic/625, which test this ioctl?

I managed to get a patched Fedora kernel built (which was quite an
ordeal) and ran the requested tests.  Here's a session log:

root@fedora:/home/lis/xfstests# cat local.config
# Ideally define at least these 4 to match your environment
# The first 2 are required.
# See README for other variables which can be set.
#
# Note: SCRATCH_DEV >will< get overwritten!

export TEST_DEV=/dev/loop0
export TEST_DIR=/mnt/test
export SCRATCH_DEV=/dev/loop1
export SCRATCH_MNT=/mnt/scratch
export FSTYP=btrfs
root@fedora:/home/lis/xfstests# ./check generic/624 generic/625
FSTYP         -- btrfs
PLATFORM      -- Linux/x86_64 fedora 6.11.10-300.fc41.x86_64 #1 SMP
PREEMPT_DYNAMIC Mon Nov 25 12:51:20 UTC 2024
MKFS_OPTIONS  -- /dev/loop1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/loop1 /mnt/scratch

generic/624 1s ...  1s
generic/625       [not run] kernel doesn't support fs-verity builtin signatures
Ran: generic/624 generic/625
Not run: generic/625
Passed all 2 tests

root@fedora:/home/lis/xfstests# dd if=/dev/urandom of=4096 bs=4096 count=1
1+0 records in
1+0 records out
4096 bytes (4.1 kB, 4.0 KiB) copied, 0.000132844 s, 30.8 MB/s
root@fedora:/home/lis/xfstests# dd if=/dev/urandom of=4097 bs=4097 count=1
1+0 records in
1+0 records out
4097 bytes (4.1 kB, 4.0 KiB) copied, 0.000104737 s, 39.1 MB/s
root@fedora:/home/lis/xfstests# fsverity enable 4096
root@fedora:/home/lis/xfstests# fsverity enable 4097
root@fedora:/home/lis/xfstests# fsverity dump_metadata merkle_tree
4096 | hexdump -C
root@fedora:/home/lis/xfstests# fsverity dump_metadata descriptor 4096
| hexdump -C
00000000  01 01 0c 00 00 00 00 00  00 10 00 00 00 00 00 00  |................|
00000010  8c 23 a1 d2 cf 86 16 40  2c 60 cd 04 05 a8 03 db  |.#.....@,`......|
00000020  8e f7 1e 4e c8 bc 9b 78  ce 9c dd 1d a2 22 44 e0  |...N...x....."D.|
00000030  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
00000100
root@fedora:/home/lis/xfstests# fsverity dump_metadata merkle_tree
4097 | hexdump -C
00000000  96 b4 01 30 4c 9a 13 2b  b0 97 da 5d d2 5f 19 e4  |...0L..+...]._..|
00000010  ff 34 d9 70 40 80 68 99  82 db 14 5f b6 00 f9 cd  |.4.p@.h...._....|
00000020  33 16 3f 33 a0 2f c6 e7  74 f8 65 b6 d9 e0 af 5f  |3.?3./..t.e...._|
00000030  53 2b 11 7f d9 02 57 e1  89 b8 ea e7 d6 26 26 dc  |S+....W......&&.|
00000040  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
00001000
root@fedora:/home/lis/xfstests# fsverity dump_metadata descriptor 4097
| hexdump -C
00000000  01 01 0c 00 00 00 00 00  01 10 00 00 00 00 00 00  |................|
00000010  7a fb db 76 d0 17 54 62  4c 17 28 b9 d1 19 a6 fe  |z..v..TbL.(.....|
00000020  56 56 5e d9 e3 90 f9 f5  02 74 a3 f4 65 4f ea a5  |VV^......t..eO..|
00000030  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
00000100
root@fedora:/home/lis/xfstests#

As you can see, the Fedora kernel doesn't have signature support, so
that test got skipped.  Indeed, the config contains this:

# CONFIG_FS_VERITY_BUILTIN_SIGNATURES is not set
# CONFIG_FS_VERITY_DEBUG is not set
CONFIG_FS_VERITY=y

I guess it's not particularly relevant to verity the functioning of
this API, though.

In its place, I've included some manual tests for querying the
merkle_tree (both for a file that gets directly hashed into the
descriptor, and also for one that requires a tree layer) plus the
descriptors for those.  I'd really prefer if I didn't have to build
another kernel: my laptop isn't so beefy and this one already took
most of my work day...

Please let me know if you need any extra information.

Thanks again,

lis

