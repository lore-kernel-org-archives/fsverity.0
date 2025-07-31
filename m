Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4B0189F5C
	for <fsverity@lists.linux.dev>; Thu, 31 Jul 2025 18:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753987445; cv=none; b=cSADB0+cs2dMMdfh/9rFy0/5s8tX4J1mf+KBd7fK+cU7ff5BruHwz68Tf68TpRbhMAOyZLk1jsqxTzdazV38mGCLchjgnlQMPC8YV4tfZ2tqthi5YdB8BgKm0G6h9/yLYDdSgtxom7nLxkJnVEWbmhmqB05OcwDEUUj5NL+Dsoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753987445; c=relaxed/simple;
	bh=tOlKv+rrqN8To+nBSfkJkq09zspUm1W/xy9Q+MCRv7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fSHF2cXJ2e6kAGgQijGc/hFZwG7sJOk7WmdUqO9EL2mJOo5j4ClLXT3Dt4mExSeo8BYsKEo5Pf3oJ/skeFSAOhbjpkTe38il8BISIJvhprOKv5V+rQdKE7kaswI029u1GcMk9/5pLmvpN5QnuJ0glL4NJ+MNE4uXAHUhtLUf4aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sd2IOeQU; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sd2IOeQU"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4aef11cc90cso11279961cf.3
        for <fsverity@lists.linux.dev>; Thu, 31 Jul 2025 11:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753987443; x=1754592243; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWFqYWagfMR599n+3OklK/FNUCb6LoOeJiS/8Fkl7VE=;
        b=Sd2IOeQU2FAWNrEJLuW8XlEkn79lEPkWlH8T9kKqhPkPflOa084oyOMbRdohS8LkcL
         Mg2d28AxtxDX/ktUHHog3wuOZJ34gqre6bUaMTzls825iIe4sS2rIff03l6zuAGizXDW
         YEV4bEf0B7aOPNGc0QfguV61T1Ji2aX81F9nPRjbiGsb9xxSGD7GRAAOOEeRDJs9ZEkj
         0KjBtynWWrgFCGCRebJxMrod743+hew5eNObf3/PUz25r9nGtFhAu4rlta7WeB/wsJHZ
         4inTo+iliOSENjm2Jqmo8Di+QRnCmBUXkJP9cLjXUHDHJ4HwWQ7Q3X/2Ydy6UkNQz4ba
         99iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753987443; x=1754592243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DWFqYWagfMR599n+3OklK/FNUCb6LoOeJiS/8Fkl7VE=;
        b=Tt+WmQlWMvaCEi2vWznE3RG7jQ3IxdmEwmXhICxFBi4M3TddCZI6bFGDu6MXfjy9qt
         tF/vrRrFoSMZ07WJIAmb+FG83AvcPc0g84cP+qfyMjpHQMXW2Lhbg1Pm6AoOS0SnJWs4
         koakNtkzw+uNN6l0x7m3eLE6zPQqAeXCv73LHuohsuynbL2+vYgIoCgvY3RRqxd8LQep
         7nxCKFvx3x3JwPa2qDhLfoYlpCPrXIo8Am69232gbMtt2biW6k0uWwK6VaIA9SyE/VZW
         q9+nHyb99E+TNqJsIQ1Bsjyi6N8XI7ewXNYQmHA+v4a6/ga0MjKqTA0JowOGZHsILggQ
         JISw==
X-Gm-Message-State: AOJu0YzffWEeTjOznPFvZqX0DxWX3eSl8d51j0MUv2QO2flTGwYSCuhM
	BLFRw30Bg5huKPPIGrrJE9gJTtbXVvSQIhf87FlvJK/CgKLS8HGD3LNQcQspNbXtirkdX2Ym3PM
	hnS8RUeUiGxB0M65gaPpqz8H61lbhMDE=
X-Gm-Gg: ASbGncsX1MEpsKcgIQKRqZy3fuEOA3RXMjP9FK3wxW0/aFf/UKYEY1GvU0S5l/4IRzj
	ftpK1hMv4qgrRY9nWMg8ons/i1jTQ+owqB1D8+8zI8vNtVKHEr+YZP5f85KjNkTnof6M2hQ5iDl
	I3kHAfhH3cowK8cN8P3tTuzBPAIl6DJceZVAtfwgOdbOJetsFp1A/dwC3PCIwdr1dKiG26wj0cw
	9+Msdg=
X-Google-Smtp-Source: AGHT+IHhmBCqS24+8APnTa5CCpdzZoO0Ss4gHmN8YdL9USrYxqpqCeTk85bpPFY2B5ZsPWcuDuGL6f99NahYgIphCkU=
X-Received: by 2002:ac8:5dc6:0:b0:4ab:701c:aa35 with SMTP id
 d75a77b69052e-4aedbc739c2mr132504291cf.39.1753987442924; Thu, 31 Jul 2025
 11:44:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org> <20250728-fsverity-v1-1-9e5443af0e34@kernel.org>
In-Reply-To: <20250728-fsverity-v1-1-9e5443af0e34@kernel.org>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 31 Jul 2025 11:43:52 -0700
X-Gm-Features: Ac12FXxuG9VYtsh9H3COp6V24MyEeFZcljh_lSDrbHaWBLofpef5AmKZCKzspPg
Message-ID: <CAJnrk1ambrfq-bMdTSgj=pPrGW6GA1Jgwjvx8=sy8SVR67=bJA@mail.gmail.com>
Subject: Re: [PATCH RFC 01/29] iomap: add iomap_writepages_unbound() to write
 beyond EOF
To: Andrey Albershteyn <aalbersh@redhat.com>
Cc: fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-xfs@vger.kernel.org, david@fromorbit.com, djwong@kernel.org, 
	ebiggers@kernel.org, hch@lst.de, Andrey Albershteyn <aalbersh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 28, 2025 at 1:31=E2=80=AFPM Andrey Albershteyn <aalbersh@redhat=
.com> wrote:
>
> From: Andrey Albershteyn <aalbersh@redhat.com>
>
> Add iomap_writepages_unbound() without limit in form of EOF. XFS
> will use this to write metadata (fs-verity Merkle tree) in range far
> beyond EOF.
>
> Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> ---
>  fs/iomap/buffered-io.c | 51 +++++++++++++++++++++++++++++++++++++++-----=
------
>  include/linux/iomap.h  |  3 +++
>  2 files changed, 43 insertions(+), 11 deletions(-)
>
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index 3729391a18f3..7bef232254a3 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -1881,18 +1881,10 @@ static int iomap_writepage_map(struct iomap_write=
page_ctx *wpc,
>         int error =3D 0;
>         u32 rlen;
>
> -       WARN_ON_ONCE(!folio_test_locked(folio));
> -       WARN_ON_ONCE(folio_test_dirty(folio));
> -       WARN_ON_ONCE(folio_test_writeback(folio));
> -
> -       trace_iomap_writepage(inode, pos, folio_size(folio));
> -
> -       if (!iomap_writepage_handle_eof(folio, inode, &end_pos)) {
> -               folio_unlock(folio);
> -               return 0;
> -       }
>         WARN_ON_ONCE(end_pos <=3D pos);
>
> +       trace_iomap_writepage(inode, pos, folio_size(folio));
> +
>         if (i_blocks_per_folio(inode, folio) > 1) {
>                 if (!ifs) {
>                         ifs =3D ifs_alloc(inode, folio, 0);
> @@ -1956,6 +1948,23 @@ static int iomap_writepage_map(struct iomap_writep=
age_ctx *wpc,
>         return error;
>  }
>
> +/* Map pages bound by EOF */
> +static int iomap_writepage_map_eof(struct iomap_writepage_ctx *wpc,
> +               struct writeback_control *wbc, struct folio *folio)
> +{
> +       int error;
> +       struct inode *inode =3D folio->mapping->host;
> +       u64 end_pos =3D folio_pos(folio) + folio_size(folio);
> +
> +       if (!iomap_writepage_handle_eof(folio, inode, &end_pos)) {
> +               folio_unlock(folio);
> +               return 0;
> +       }
> +
> +       error =3D iomap_writepage_map(wpc, wbc, folio);
> +       return error;
> +}
> +
>  int
>  iomap_writepages(struct address_space *mapping, struct writeback_control=
 *wbc,
>                 struct iomap_writepage_ctx *wpc,
> @@ -1972,9 +1981,29 @@ iomap_writepages(struct address_space *mapping, st=
ruct writeback_control *wbc,
>                         PF_MEMALLOC))
>                 return -EIO;
>
> +       wpc->ops =3D ops;
> +       while ((folio =3D writeback_iter(mapping, wbc, folio, &error))) {
> +               WARN_ON_ONCE(!folio_test_locked(folio));
> +               WARN_ON_ONCE(folio_test_dirty(folio));
> +               WARN_ON_ONCE(folio_test_writeback(folio));
> +
> +               error =3D iomap_writepage_map_eof(wpc, wbc, folio);
> +       }
> +       return iomap_submit_ioend(wpc, error);
> +}
> +EXPORT_SYMBOL_GPL(iomap_writepages);
> +
> +int
> +iomap_writepages_unbound(struct address_space *mapping, struct writeback=
_control *wbc,
> +               struct iomap_writepage_ctx *wpc,
> +               const struct iomap_writeback_ops *ops)
> +{
> +       struct folio *folio =3D NULL;
> +       int error;
> +
>         wpc->ops =3D ops;
>         while ((folio =3D writeback_iter(mapping, wbc, folio, &error)))
>                 error =3D iomap_writepage_map(wpc, wbc, folio);
>         return iomap_submit_ioend(wpc, error);
>  }
> -EXPORT_SYMBOL_GPL(iomap_writepages);
> +EXPORT_SYMBOL_GPL(iomap_writepages_unbound);
> diff --git a/include/linux/iomap.h b/include/linux/iomap.h
> index 522644d62f30..4a0b5ebb79e9 100644
> --- a/include/linux/iomap.h
> +++ b/include/linux/iomap.h
> @@ -464,6 +464,9 @@ void iomap_sort_ioends(struct list_head *ioend_list);
>  int iomap_writepages(struct address_space *mapping,
>                 struct writeback_control *wbc, struct iomap_writepage_ctx=
 *wpc,
>                 const struct iomap_writeback_ops *ops);
> +int iomap_writepages_unbound(struct address_space *mapping,
> +               struct writeback_control *wbc, struct iomap_writepage_ctx=
 *wpc,
> +               const struct iomap_writeback_ops *ops);
>

Just curious, instead of having a new api for
iomap_writepages_unbound, does adding a bitfield for unbound to the
iomap_writepage_ctx struct suffice? afaict, the logic between the two
paths is identical except for the iomap_writepage_handle_eof() call
and some WARN_ONs - if that gets gated behind the bitfield check, then
it seems like it does the same thing logically but imo is more
straightforward to follow the code flow of. But maybe I"m missing some
reason why this wouldn't work?

>  /*
>   * Flags for direct I/O ->end_io:
>
> --
> 2.50.0
>
>
