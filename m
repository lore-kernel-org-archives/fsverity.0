Received: from smtpo79.poczta.onet.pl (smtpo79.poczta.onet.pl [141.105.16.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF5A171064
	for <fsverity@lists.linux.dev>; Thu,  2 May 2024 17:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.105.16.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714671970; cv=none; b=m3K2K+VAJS5wtzqPMK8W3YlgHiOpq70UMwO8xMX2cvQPPYMsAd7TU482ZsqQqEoiQRQAaBbM4ZQf301u4f/rdiwBsQupLvmDbnBytMxgD+jmsqf4Ny2ECyH+bMDo5j9lbqmXUav6Fv+SHLor6vQXmowIImZo93LGdoygusTMgh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714671970; c=relaxed/simple;
	bh=7SgpTePPB9SBh0nHszu2DpnMDXogd6U2nS7WmLAvVLw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=j5JM7yDciaR0MvgayCTPDLT7+BOKVSv629TTMr+35RfCImcHqHDi7jXB748jxH+xAsLNxTeLJfoWIJaH5+OVGJiY7taRRetpN8vW/q5KlmCYq7ikne6v+Zw89giW2Vcx96uLm3oo2HduYwqi7WQv3qH22Ga+3yOGKT2GrTY5ECo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=op.pl; spf=pass smtp.mailfrom=op.pl; dkim=pass (1024-bit key) header.d=op.pl header.i=@op.pl header.b=jh4Larx6; arc=none smtp.client-ip=141.105.16.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=op.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=op.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=op.pl header.i=@op.pl header.b="jh4Larx6"
Received: from wolf (arr80.internetdsl.tpnet.pl [83.17.203.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: wkuz@op.pl)
	by smtp.poczta.onet.pl (Onet) with ESMTPSA id 4VVhCX0LrDz2K2nq6
	for <fsverity@lists.linux.dev>; Thu,  2 May 2024 19:44:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=op.pl; s=2011;
	t=1714671896; bh=7SgpTePPB9SBh0nHszu2DpnMDXogd6U2nS7WmLAvVLw=;
	h=Date:From:To:Subject:From;
	b=jh4Larx6UsT+/BTw+tKAHvxYfH+KsyGmB7Q03kU8YFo/Mw+E9LBpp5fnXobd9Ef+6
	 lx9JZulrcJwdFWF+ak6DHxSpUerztjg00eIEvPFh0x7ww77VDcH72fEaL1JZ0oYbkw
	 /l/1BAGWh6yyCe/U0/F9qIs3fns1AZvmyv485m0c=
Date: Thu, 2 May 2024 19:44:49 +0200
From: Wojciech Kuzyszyn <wkuz@op.pl>
To: fsverity@lists.linux.dev
Subject: FS_IOC_ENABLE_VERITY error: invalid argument
Message-ID: <20240502194449.23bf074b@wolf>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+kdMMRRX5hyw_dLy3Ffic.w";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/+kdMMRRX5hyw_dLy3Ffic.w
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello!

I made a fresh file to pretend being a disk with:

$ truncate -s 40M test

I then made it a block device and formatted it:

# losetup -f test
# mkfs.ext4 -L test -O verity /dev/loop1

When trying to enable fs-verity on a test file inside this new
fake-device I always get the error mentioned in the subject. Of course
I have CONFIG_FS_VERITY built-in to kernel, and the file I'm testing is
a regular file created with:

$ dd if=3D/dev/urandom bs=3D1K count=3D20 | base64 > a.txt

Any ideas, what's going on?

I will really appreciate help!

Thanks,
Wojciech Kuzyszyn

--=20
xWK

--Sig_/+kdMMRRX5hyw_dLy3Ffic.w
Content-Type: application/pgp-signature
Content-Description: Podpis cyfrowy OpenPGP

-----BEGIN PGP SIGNATURE-----

iIEEARYKACkWIQSR3iw/A+cPGAg6ljJXqyS1DcwN6QUCZjPREQscd2t1ekBvcC5w
bAAKCRBXqyS1DcwN6dTeAP90QSQdfycsPaNfoHF7kVuSBF8Q4BhSgxbUUG48WZqU
RQD/Yj7pv/btv1VcX+69VxdMpXsUIHVeNFUCc2qI+1m3iw0=
=k15n
-----END PGP SIGNATURE-----

--Sig_/+kdMMRRX5hyw_dLy3Ffic.w--
