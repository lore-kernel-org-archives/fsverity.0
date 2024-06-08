Received: from wfhigh8-smtp.messagingengine.com (wfhigh8-smtp.messagingengine.com [64.147.123.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF2D1865A
	for <fsverity@lists.linux.dev>; Sat,  8 Jun 2024 21:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717881792; cv=none; b=Dao7S2UhPzyy6Q1VkeOAgrxiY1XHmtgIyyGXm7faLTHTJma1cXfARkGTvoO+bWIKoJgwR+Igu57rvfE8+no4C9XMwQHXZRyzbTx2jwr/KIfhUHmdfAEbejNPb6Ljjp7rmGN5BxgrdJFIvDJtPgZZ4O7N1QokH+lHIvUlmLq/jC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717881792; c=relaxed/simple;
	bh=nPpfHqjB8ECJoQcQxd81rwO8kyHOA7R3sHnvHxyFwHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j92d12NOUPxZ1AyDay5GKxgrhxuN8DUrLjO36sehHZhrlZno+f/fLKVYb8j13LKtM46GRvip4azbaSZrscj6n+OHjQgWTI4KZ+lV/NrhhvUA3o/UxqFaRQMWf/RZgeeAI/CG9F+FO1UMWQMl2pYb57utRs4nm4fSwr0UN08RNJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dxuuu.xyz; spf=pass smtp.mailfrom=dxuuu.xyz; dkim=pass (2048-bit key) header.d=dxuuu.xyz header.i=@dxuuu.xyz header.b=EZ71DIVy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OuI1V7Th; arc=none smtp.client-ip=64.147.123.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dxuuu.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dxuuu.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dxuuu.xyz header.i=@dxuuu.xyz header.b="EZ71DIVy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OuI1V7Th"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.west.internal (Postfix) with ESMTP id 10B9C1800097;
	Sat,  8 Jun 2024 17:23:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sat, 08 Jun 2024 17:23:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1717881789; x=1717968189; bh=yYg7wzIf8U
	Ce8+qz6R6GMATvHmkISuN1P+RUeT4wo50=; b=EZ71DIVyNH9rjssYyLvsTPGhGq
	rhgZfMsRKOmKw2eTO0ApVIJiLrVEUAhgXJk4MtCH/Aj1z7rmnV5lhlpxZtYE1bXt
	3VoPSegW4N2PNFQSIOSes2nfil4yrJVtybtjeDMzSupUmjwuqdRgIw3FQOmhy9so
	mhazy17eIMttZZvBw1qq+/fYU4c3jKeM1Z6RaRq4CwyQKoMZyCetDg4RLOiWg7Go
	SgOhcBR+FebK6eHm14n4ZtVUhTfnsCYF8QK6MeBshGv+xfmIeSq8F9UlW1qPeGjc
	xa7KloZz3aEC6Wbxuf8w4C1+QL54Gs39GMrktNinomyosGRN78AEU+qyY1yw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1717881789; x=1717968189; bh=yYg7wzIf8UCe8+qz6R6GMATvHmkI
	SuN1P+RUeT4wo50=; b=OuI1V7ThYhR87o9tdmTKzKGRr5LNmMRdCrzGUfnYHkKu
	cKpGd3voCTHpqMqxfaMWG+TKlZW7EGNoXrQ3/Wo0HrfSSedk8GZ6t3yNiihFytJl
	XZezf6r4wsDDeQB30xo3+eC04YwKXVNcLwgh3a+S37gdd+ojfXh8O9Ju561TEmUf
	neh+EKqm+TSaawpLZ7+oQyCHqfe2rdW45gnQ+w+TSv+ZL2yWkOFyhk27kpaBQIRK
	RQ/SslrwN76apqhhAHVzU8qfVAPkrKbLBcd6GGx9QDeA9sh9NMJGvgXOnmdAoJqr
	b8c0yG8elDiacJjrE6kSOJddEftfeFAAEsRtZQqtBQ==
X-ME-Sender: <xms:vctkZi_ZJou4ViJXB0GLAI2FxYEa93h83llvqELmeDRfOS4KGtOZsQ>
    <xme:vctkZivP9GfrfT_T1Jkx6EOY4yTJamoq44eucpYgx1PK21xNKvJVeJPjS_rrcM8T7
    lxJwiD6TPowgnsvwg>
X-ME-Received: <xmr:vctkZoAvYXIehuvjywTIQK1HPjJEc8FdSw2nPfLobgaGJPYOJhtrX_Y1AjlPU05pM0GX7l5VMc-uSAcFw2CkcFqZuza2P3rf3w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedtgedgleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfeehmdenucfjughrpeffhf
    fvvefukfhfgggtuggjsehttdfstddttddvnecuhfhrohhmpeffrghnihgvlhcuighuuceo
    ugiguhesugiguhhuuhdrgiihiieqnecuggftrfgrthhtvghrnheptdejkeduleeitedvfe
    egvdegjeehhfdvgffgjeduuedtgeevieevtdfhheefleeknecuffhomhgrihhnpehgihht
    hhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegugihusegugihuuhhurdighiii
X-ME-Proxy: <xmx:vctkZqel8RJnfssnLySoE6DfrGKmzXHihudZe2AAUNa1sg3rmBITOA>
    <xmx:vctkZnNW7--PBrfyGjsqeNptdRUfBnjjwZcyKy-eAFiWLnU-LnusoQ>
    <xmx:vctkZkm9fR0U_LnkVUfQDnyyIwSArCPAUB-mYHU_FpVfejhu9eGkUQ>
    <xmx:vctkZpu_gsaXF8A8VL-_WqnLEkmkvZbFJEw0a4-_5Cd66OxVEKaoww>
    <xmx:vctkZumlfhUgr33CAQiTNZf9iBaPdvHw09-p0crfWlLi_eAHeql01SLZ>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 8 Jun 2024 17:23:08 -0400 (EDT)
Date: Sat, 8 Jun 2024 15:23:07 -0600
From: Daniel Xu <dxu@dxuuu.xyz>
To: linux-kselftest@vger.kernel.org, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, fsverity@lists.linux.dev, andrii@kernel.org, olsajiri@gmail.com, 
	quentin@isovalent.com, alan.maguire@oracle.com, acme@kernel.org, eddyz87@gmail.com
Cc: kernel-team@meta.com
Subject: Re: [PATCH bpf-next v4 00/12] bpf: Support dumping kfunc prototypes
 from BTF
Message-ID: <u42jmbratxsej74zrtzn47j7evmdksswyrp6kfvr5tze36qcwt@mbl5e7fkekrz>
References: <cover.1717881178.git.dxu@dxuuu.xyz>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1717881178.git.dxu@dxuuu.xyz>

On Sat, Jun 08, 2024 at 03:15:56PM GMT, Daniel Xu wrote:
> This patchset enables both detecting as well as dumping compilable
> prototypes for kfuncs.
> 
> The first commit instructs pahole to DECL_TAG kfuncs when available.
> This requires v1.27 or newer. v1.27 is nearing release at time of
> writing. Following this, users will be able to look at BTF inside
> vmlinux (or modules) and check if the kfunc they want is available.
> 
> The final commit teaches bpftool how to dump kfunc prototypes. This
> is done for developer convenience.
> 
> The rest of the commits are fixups to enable selftests to use the
> newly dumped kfunc prototypes. With these, selftests will regularly
> exercise the newly added codepaths.

I tested that this patchset works for both pahole:

    <1.27: https://github.com/kernel-patches/bpf/pull/7168
    >=1.27: https://github.com/kernel-patches/bpf/pull/7163

I meant to include that in the cover letter but I forgot. I'll try to
remember next time.


