Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BDE285CB9
	for <fsverity@lists.linux.dev>; Mon, 26 Jan 2026 19:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769455984; cv=none; b=pHZK9djfpb5Rzuuif5QIH6WByvctrHdHIn/zryYKCwJyaZunG1dHqyQlYG5NdZ5UyDExts3V3sM7rMb29Z8kE5k4/XSAlFB4FMfT9Pd8nERTjb++UA4fUIVPKAroUD4anPoZk2dCeutpbX1j7ZTzb5MCJdNnXna1JfJ9O+jLd4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769455984; c=relaxed/simple;
	bh=j0oUx4mXVkYZygx8JnHmEjQQehQQZ65Fq7kvPKHhpVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BxcNIXrf0KVzEJNnG8fX0UGvJFOo57pm0Wbavf+tfEAf/2aVrDmnrpyaK31xr98GXr8OshdFkwa8/t1xAxnFkPD82IV7kLznb4pFuNGNxywxorkg4jtx9wNnK3icQq/LnFW95UdLxgEY2xKPz1UmHjHeMPPpCRTBJA2tkayQznA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KCO2rPDv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KCO2rPDv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21083C116C6;
	Mon, 26 Jan 2026 19:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769455984;
	bh=j0oUx4mXVkYZygx8JnHmEjQQehQQZ65Fq7kvPKHhpVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KCO2rPDvUc2dlokFtFkHzeJe8dlxe8rHZarV/qx/oXanSB5t6pRBeRS3KJXvXDLsT
	 hpCo9pMoTMqGc4vwePRCqGx5FyG5NQD9E4YZQDoU+54UlTnI3+0eVratbvwLiPfNZu
	 rxZAZKEdQ30dHkRehW2GE5Wx9lwL90CQAPSUkKrUWoXE3mWzbyQiMAKJSR3/hXGblh
	 crVM1Hhrfs8abDdF8GPSMfYqjFDIvnaSXLXKrqRK/kjovUIvzWzAuwvPE7BJ/htqRf
	 h4VU/pOzzbfPW6QjWeJAgATzjeiLHTTxHhIzvgWjfBbmofOQan1IGD0yh/nuGaG2qH
	 Dg6ObypPubpbA==
Date: Mon, 26 Jan 2026 11:33:02 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Andrey Albershteyn <aalbersh@kernel.org>
Cc: fsverity@lists.linux.dev, "Darrick J. Wong" <djwong@kernel.org>
Subject: Re: [PATCH v3 2/2] fsverity: add tracepoints
Message-ID: <20260126193302.GB2305@quark>
References: <20260126115658.27656-1-aalbersh@kernel.org>
 <20260126115658.27656-3-aalbersh@kernel.org>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126115658.27656-3-aalbersh@kernel.org>

On Mon, Jan 26, 2026 at 12:56:58PM +0100, Andrey Albershteyn wrote:
> fs-verity previously had debug printk but it was removed. This patch
> adds trace points to similar places, as a better alternative.
> 
> Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> Reviewed-by: Darrick J. Wong <djwong@kernel.org>
> [djwong: fix formatting]
> Signed-off-by: Darrick J. Wong <djwong@kernel.org>

I applied this as-is, but for future reference, the same person
shouldn't have both a Signed-off-by and a Reviewed-by.

- Eric
