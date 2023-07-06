Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564C2110E
	for <fsverity@lists.linux.dev>; Thu,  6 Jul 2023 07:10:15 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-78a5384a5daso108701241.0
        for <fsverity@lists.linux.dev>; Thu, 06 Jul 2023 00:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688627414; x=1691219414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/qvUBgklGMGAPo2KRc2Mkn/ONNKf/kX3Szi30Vjj4I=;
        b=AgWB05NyVNtRKTxSY/ZwWbMmZE1BcpnL3GufGstsbW4byRooOKJKR6gNN5J1+rHVh3
         iUSXcjY5mibiUGOP2SK6Q9IAwJlU0UCWCNAkBPIh1f8Cslxjw+vtwlmKhWw5On4siv/F
         Qb8pYlrmX10ti/IZ/Mt/wxip+kKPDCNKLyXFk5BoLTaWbWP+RqwhpYkEESOy7BQLvou9
         decwZIT2OWQCShcePFy48/YaH8rBfOnMwYfYL4kFR+UMMi2iAmuQCZxlK8EYQaI0+2iH
         6AeCH2u+2iiqhh4bpO1apTZoEG6F/+AmY0uqV1Rc5xgz79lOlR6syyV3/un1Oy2TKrQd
         jpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688627414; x=1691219414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d/qvUBgklGMGAPo2KRc2Mkn/ONNKf/kX3Szi30Vjj4I=;
        b=DEYYF9zViBAuaIWqQfEdplqq9IMqlHbV9H/lo6IvWA9x3/JHXp5tw8goSFNLYApbf+
         8uo/xK8NFA0RKW31nzx0pe9fwmopApF8AG//HtGq6k0R4M1yplqoMgJ9evRVOqdm1kcq
         QqTpC//uJ6X1ZQ4Od3o7Ru35yHr0V7VSNtEK8PcVbVNfp5VJHGPx4Reo2aqRt+yeMyqI
         UAc855DhcFkKL1Sw0T/WQBjGWjpLeGPs+ECWqDWrGpIsqPjpWFNfogpScivBVx7n8g+4
         +5C9sdCfDybODKxyN1CSjwM/G1F6fdeAyoIZM/rI8hLo/RwjjwqV7o4G4mbH71sq8R8S
         5VMg==
X-Gm-Message-State: ABy/qLZods0Z0bPhSgeNW7iOjN+EQum217MmS5bi5u7yqDmh3ntn7Y7e
	W9xv1VRVe1ALjDvuieqOUPV5QZyLobBXKTDgo08=
X-Google-Smtp-Source: APBJJlHHTXpl53I/dwJInRaQhVgUEeaRDuTC2GvfOt7NfKOY9Phj4wDfSCorqxdbCSSqvLK1H6tFec6DSkPmYK6EnZI=
X-Received: by 2002:a67:ce0d:0:b0:445:138d:bf1d with SMTP id
 s13-20020a67ce0d000000b00445138dbf1dmr366990vsl.18.1688627413956; Thu, 06 Jul
 2023 00:10:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1686565330.git.alexl@redhat.com> <CAOQ4uxgmV1KKCeq8=8FPkAciwqPpz8JiSM8WEuxDaZbVuYcQ7Q@mail.gmail.com>
 <CAL7ro1EiYOOOqexrKy+UXRzmpGyCaNec3+LHGxnA0YfmoMDN3A@mail.gmail.com>
 <CAL7ro1FKwgUY4e7N_vYi0cFsuVx6St0-oKvcBkiRFnzLH8D1eQ@mail.gmail.com>
 <CAOQ4uxgVnv7wtwFZaBnEotFCwQD1EZcSK2KW4K4vRD8d9fzCiw@mail.gmail.com>
 <CAL7ro1FY6OmhypFGDjinOkkjyJzymntVje4nRA558dKY+KsgzQ@mail.gmail.com>
 <CAOQ4uxjuhzxgTxmRXxczJLDrMzKKr-jzS3R8ESwkw4XQ+UyAfQ@mail.gmail.com>
 <CAL7ro1GYEdMvjn+e8Y8CmMC-s_5NZOXjsj=iv7s5NbnpTZz+Cg@mail.gmail.com>
 <CAOQ4uxjS9mTjCCTS9eS1HmZqKAQV97mh1wpkqJuShCHP_MKqag@mail.gmail.com>
 <CAOQ4uxjNMJG6TQcZiT2sx8eLTyybf+iLR3GtOKaaj7QydVr_0Q@mail.gmail.com> <CAL7ro1GhLcPK-xahOVmJAtL5pbgMVm0GVd2xW7tgO+_R4dbD5Q@mail.gmail.com>
In-Reply-To: <CAL7ro1GhLcPK-xahOVmJAtL5pbgMVm0GVd2xW7tgO+_R4dbD5Q@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 6 Jul 2023 10:10:02 +0300
Message-ID: <CAOQ4uxhiU-y=dMocoSGb75Rze_jOLp82MctB26yFYPT3CMOM3g@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] ovl: Add support for fs-verity checking of lowerdata
To: Alexander Larsson <alexl@redhat.com>
Cc: ebiggers@kernel.org, tytso@mit.edu, miklos@szeredi.hu, 
	linux-unionfs@vger.kernel.org, fsverity@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 3, 2023 at 11:11=E2=80=AFAM Alexander Larsson <alexl@redhat.com=
> wrote:
>
> Cool, I wanted to look at this, but was on PTO last week.
> It looks good to me, and I synced this to:
>   https://github.com/alexlarsson/xfstests/commits/verity-tests
> To avoid drift.
>

I pushed the overlay-verity series to overlayfs-next, so you may
expect "finishing touches" bug reports from bots in the near future.
As long as they are minor fixes, you can fix your branch and let me know
and I will update overlayfs-next.

Miklos may yet have feedback on the final version, but I think all his
comments were addressed including the ACK from Eric (thanks!).

Eric,

There was no posting of v5 that addressed your v4 review comments,
so we do not have your RVB/ACK for patches 2-4.
Let me know if you want me to add that to the patches.

Alex,

wrt overlay verity-tests, please submit those tests along with the lowerdat=
a
tests to fstests anytime between now and the 6.6 merge window.
The tests are properly equipped to check for the feature and testers can
use them to test linux-next.

For test overlay/080 you may add:
Reviewed-by: Amir Goldstein <amir73il@gmail.com>
For test overlay/079 you may retain my authorship or assume authorship
I don't mind as it was co-authored and you took it to the finish line.

Thanks,
Amir.
