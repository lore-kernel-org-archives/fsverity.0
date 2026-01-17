Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6E52D6E78
	for <fsverity@lists.linux.dev>; Sat, 17 Jan 2026 23:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768692893; cv=none; b=Yqe+PyZjD+B3haLJiY8e94p/aJHuZOVksvSJXzLGW64LlSgpM0a758HHkpbYcB6wF6ezZqEtQ+FeMHhOBkVpVwUieAGVldZQbJqGEIZGEjQaNnabGT+iInh+KOeTYEM/oYkY2yisv2aHjAXLW5LcMWlt0d8zUzHtzD9gfH0eIcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768692893; c=relaxed/simple;
	bh=HFPY5OstzPjEk0Sl7pKypVxgwWqkjB8bb7QY4A2iY0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AeFSgKyXc+6QhxmkNPv55CtRzEPiyT0tVythWQmEMupoMCyezMTAVJHUo9wpDPpKJeQvwv2gd/pzNtPCCcpLXKGakT2FiNvmoBSLatrrykAb/FSMwyNP/EuIEXvx2ez6D5VfYFt93mkFG4UFOrp2rS3apcLC+s1cFl12VCbrL3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tGLNOBoA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tGLNOBoA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B91D7C4CEF7;
	Sat, 17 Jan 2026 23:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768692890;
	bh=HFPY5OstzPjEk0Sl7pKypVxgwWqkjB8bb7QY4A2iY0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tGLNOBoAvq4fp1ATuRVaKavdwFpqlPEZgYzWbIWKbP5i1E17eDH9aYpm6fwxI+QSD
	 2LXEEzBWsmdL5BG3CZAGnVNOz7p6UU6wQPefhEp8+5jjo2KHP1UAjrgPhYRBVADhuN
	 evchjLBLEjf1uTHYka542b4E1TCa0w2eBcz7Fl70DzWDTTg3E9gBCwdlKmIqaY79nA
	 VHzcINNxzKM0MhFEqvkKuUl+G3eVSOILV6oEACvIGrcLpIQxvTP0mdf13CM3oVCDlO
	 V8tJVLoL++60x64wMdFWUrkYUhriUXjvV37JXPBXGRHLoQmkoQC5z/1qlwGmv0+vzh
	 1v66zpKrUIFMQ==
Date: Sat, 17 Jan 2026 15:34:43 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Andrey Albershteyn <aalbersh@redhat.com>
Cc: fsverity@lists.linux.dev, aalbersh@kernel.org, djwong@kernel.org
Subject: Re: [PATCH 0/3] Add traces and file attributes for fs-verity
Message-ID: <20260117233443.GC74518@quark>
References: <cover.1768219885.patch-series@thinky>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1768219885.patch-series@thinky>

On Mon, Jan 12, 2026 at 01:13:35PM +0100, Andrey Albershteyn wrote:
> Hi all,
> 
> This two small patches grew from fs-verity XFS patchset. I think
> they're self-contained improvements which could go without XFS
> implementation.
> 
> Andrey Albershteyn <aalbersh@kernel.org>:
>   fs: add FS_XFLAG_VERITY for fs-verity files
>   fsverity: add tracepoints

I assume there wasn't intended to be a third patch, despite the cover
letter saying 0/3?

- Eric
