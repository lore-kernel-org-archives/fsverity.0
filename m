Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C75287277
	for <fsverity@lists.linux.dev>; Tue, 29 Jul 2025 12:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753790801; cv=none; b=AD1m7qKaXhtL2noqvT6zdWXrIX+YAzlBOFwDt+XOBVdtt3jlq1wP0EDRSbjjQh4VglWzhudUaOZisK19muvIN52utVs0KQ8YYG7odrLMIy7/Oaq1667kc463Ywp3Qk22xPj64je9zW3Y0rM/PY42hbXBLEHUeGaBn4vgsR+69c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753790801; c=relaxed/simple;
	bh=DXWM/ypqIDZ58I2QbqRtV7LraPXmMsDAr8ESaTpEyVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UvHndhEetqYUNKzuLAz6plmY2cSECp2vLP+jWrbk8+EVg1QcRxooE5YFN/XDpnx8+T6cn0NW9r75MjatRWNtO+cFqWRdAG5EnjN97O5Dgsp42xEMkZp0DPufrSe2bL3+ysmJTNdrJ0BAbOvWIY5JfTWkpQa0PLi9qoDJjvtodO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=beZ//I8N; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="beZ//I8N"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-60789b450ceso10283730a12.2
        for <fsverity@lists.linux.dev>; Tue, 29 Jul 2025 05:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753790798; x=1754395598; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXWM/ypqIDZ58I2QbqRtV7LraPXmMsDAr8ESaTpEyVE=;
        b=beZ//I8NdTruv8eUaM2jdzlUXxz5+Hj+L+d9L9chEcRjK5o+kxU7U4nNNc09jBRDhz
         5R+ivwXR8CxUoHiqFZ+e5rsm/joVKueUF8M5QI7iKXTjT99ffSzwmUGdchkubnh6h+Zd
         21xnGM7Fu5n8mBXw3ytD65Tyih/G6FHXn3YPgjRpORooFe7xaVxSSQpy5m/BJ42JPrvl
         uyPArdjQrfsEN8Syg5U5FpDG7GMQQ1PKkMrvzWdhv9w9bi2+MF9BDEMBCx1/sEt4N2Cq
         nwd3sehGknHr2yL6+yOipP3pchmli5uC3+9giKbt2Bucmr+29S1HKSOaBY5UNyl2jDhu
         tBAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753790798; x=1754395598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXWM/ypqIDZ58I2QbqRtV7LraPXmMsDAr8ESaTpEyVE=;
        b=Ns6DKEVmi+ePD//CTQ/igPrZHK5jgppk/Fdz5KHZwKbnpfLVa2Z28t9huys3scl1Y9
         3Mz1gVio4XtJM42hYOTZjnhAmyuZmqmzvjwghnnEUpWiWbpfiMxwgPz6iHsGRxAnRBIu
         lVu/gmaxtpCga/o94erX0XGkHMuStSLoRVYM+6J6GgpkD1R/W1zRiGnV+AhjRd1RJvVl
         ujWGTTQPpm6VehaJ9mbq3rEDYx5E4ifscbKj4ODpdeX6vV+XXKTdqZQEdtw19CL95oa5
         C7ELMG9d47onPVT2MUdW/bzE9VOW/WHCrB4QmgKCmH4TQwuM5VFDlDObSKToOYVNMXNt
         P10A==
X-Forwarded-Encrypted: i=1; AJvYcCVa+ibWJqEVHbSNwjaaqsE7EqIRROX7ZuOzj5Wh6fNQBE4SgNBP491aZ6IicqP9R68+xhVygQylJg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxHh20aRZ6WJ9cfk6p/jr6uEm90pGPGM9G884iqS4cStH0N7Kuw
	oIZSDsn+DVaz/nvwAA4SkloWFi+OQ8/SUIrWP6DbrL/riMmw5ByD5+T807vmvLd3EH82bGijMQh
	YMOpV7CwcUSWC6dCIWSnDjplh82mRH04=
X-Gm-Gg: ASbGnctetxZzBbwDyReYcNrPWExx5fWqKC0McUI6l+yXXuutXi5qobizmg4pkGyCuLX
	dIcGA/0Ym0plin4olOj3yPx4Wus3zlJx7oMItFFTJf7nCL1VZAIyZkDlsTRa2wKUGB+2wqYSlMl
	BrxO3D1r8LCjQvZAhw7HZikw08ucAhCz9N5GITYmAORhDy5L3kojPSgUExgKSzje6n6PFhFMuAY
	WvKJlE=
X-Google-Smtp-Source: AGHT+IEf+MIS97B7TPFbqcda/Jx9eHeq1SlqXKCodea7X91A4GGrjGOuW5kxjPHpb2b7c6ZvuSJ1EY/0SG2I5iBGMqs=
X-Received: by 2002:a05:6402:2710:b0:615:3a7a:5108 with SMTP id
 4fb4d7f45d1cf-6153a7a5347mr5806402a12.21.1753790798120; Tue, 29 Jul 2025
 05:06:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
 <20250728-fsverity-v1-3-9e5443af0e34@kernel.org> <CAOQ4uxjXucbQderHmkd7Dw9---U4hA7PjdgA7M7r5BZ+kXbKiQ@mail.gmail.com>
 <ppcw73dlw4qdumbmel4spy2uvlaocnqfowquiop4mhauw3xxc4@kjad3vbucx7v>
In-Reply-To: <ppcw73dlw4qdumbmel4spy2uvlaocnqfowquiop4mhauw3xxc4@kjad3vbucx7v>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 29 Jul 2025 14:06:26 +0200
X-Gm-Features: Ac12FXxizHAQToV0suLhQNsm6KvYYdlbWlziqM1NTUuwTvmkgl5EEy7GOiXJo8E
Message-ID: <CAOQ4uxjZ9zOpo==20xw9dQnumCMY3Buk0vhGgSft0tOEf2+k=A@mail.gmail.com>
Subject: Re: [PATCH RFC 03/29] fs: add FS_XFLAG_VERITY for verity files
To: Andrey Albershteyn <aalbersh@redhat.com>
Cc: Christian Brauner <brauner@kernel.org>, fsverity@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org, david@fromorbit.com, 
	djwong@kernel.org, ebiggers@kernel.org, hch@lst.de, 
	Andrey Albershteyn <aalbersh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2025 at 12:35=E2=80=AFPM Andrey Albershteyn <aalbersh@redha=
t.com> wrote:
>
> On 2025-07-29 11:53:09, Amir Goldstein wrote:
> > On Mon, Jul 28, 2025 at 10:31=E2=80=AFPM Andrey Albershteyn <aalbersh@r=
edhat.com> wrote:
> > >
> > > From: Andrey Albershteyn <aalbersh@redhat.com>
> > >
> > > Add extended attribute FS_XFLAG_VERITY for inodes with fs-verity
> > > enabled.
> >
> > Oh man! Please don't refer to this as an "extended attribute".
> >
> > I was quite surprised to see actually how many times the term
> > "extended attribute" was used in commit messages in your series
> > that Linus just merged including 4 such references in the Kernel-doc
> > comments of security_inode_file_[sg]etattr(). :-/
>
> You can comment on this, I'm fine with fixing these, I definitely
> don't have all the context to know the best suitable terms.
>
> >
> > The terminology used in Documentation/filesystem/vfs.rst and fileattr.h
> > are some permutations of "miscellaneous file flags and attributes".
> > Not perfect, but less confusing than "extended attributes", which are
> > famously known as something else.
>
> Yeah sorry, it's very difficult to find out what is named how and
> what is outdated.

indeed.

>
> I will update commit messages to "file flags".
>

"file attributes" is better fit IMO considering the method name fileatte_*
and structs file_attr file_kattr and the comments in file_attr.c/fileatttr.=
h.

Thanks,
Amir.
