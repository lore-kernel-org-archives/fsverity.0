Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CFB3C0B2
	for <fsverity@lists.linux.dev>; Tue, 13 Jun 2023 17:59:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 845E2C433F1;
	Tue, 13 Jun 2023 17:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686679169;
	bh=CONyUZqGphXLnif9HJpI3hCBWVcuUeD7SdmKhoOVvag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s0I5ZWw7+csrpAqilpjXApMRMZmvsIEfHGg5sXZHHVDeVMP8wdTgni3XWzUaAk5pp
	 rjzBpNKOBBtLv8QR+QsaJzkCvx3DnNIWjV1TIai6mR/5Yu8EgGk7laKmlimiIxlTtS
	 0QZLtavAiNow+gl1keTH485QRZh6lYsEGHwIrelrxLcdvfTkKGpcUuNjZc3tmobs2D
	 LywcsFBA+DirvHVGOu3QoaoUlPrBJA2GK8Sd6JMfxwcJzJVpA7tIT4g9rUpRlLn3ig
	 Jm0Agq/ktgfMjoo9a8EfPv5BrgnPhzxUTJdFP/paAmA2FLGshCjNx1f4pI7dKSE/pr
	 EF1i852Cv8Rlg==
Date: Tue, 13 Jun 2023 10:59:27 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Alexander Larsson <alexl@redhat.com>
Cc: miklos@szeredi.hu, linux-unionfs@vger.kernel.org, amir73il@gmail.com,
	tytso@mit.edu, fsverity@lists.linux.dev
Subject: Re: [PATCH v3 0/4] ovl: Add support for fs-verity checking of
 lowerdata
Message-ID: <20230613175927.GB1139@sol.localdomain>
References: <cover.1686565330.git.alexl@redhat.com>
 <CAL7ro1EWzvWvwsO4dTc28HVj9nGfniz8HFix=pm40giTGv3YAg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL7ro1EWzvWvwsO4dTc28HVj9nGfniz8HFix=pm40giTGv3YAg@mail.gmail.com>

On Tue, Jun 13, 2023 at 03:57:48PM +0200, Alexander Larsson wrote:
> 
> I pushed a new version of this branch with the following changes:
> 
>  * Includes and uses the new fsverity_get_digest() rework from Eric
>  * The above means we now use the FS_VERITY_ALG_* enum values in the xattr
>  * Made the overlayfs.rst document change a bit more explicit on what
> happens and by whom
>  * Ignore EOPNOTSUPP failure from removexattrs as pointed out by Amir
> 
> The previous patchset is available as the overlay-verity-v3 tag so you
> can compare the differences.
> 

Where can I find the new version?

- Eric
