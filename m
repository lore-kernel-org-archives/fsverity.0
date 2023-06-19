Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF77522A
	for <fsverity@lists.linux.dev>; Mon, 19 Jun 2023 22:17:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB770C433C8;
	Mon, 19 Jun 2023 22:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687213042;
	bh=4sh3RxfsfmAtwSyOwC4E6s7/PaOf07c5a/+6EG4z2rc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J6R1PvpsRinN3FHqqYUoAfTOgBf98rhOYTZcsTiP+jY0hj1oJja8LbOLP6wevAvq3
	 awpAwPXDDQM43mkBUOIUSNUWHQyYcGrsDBBgrS2yl3BAr3OVengNUY7OZDe8sIULVa
	 +drr+NQ6/ujziowjzhF4EwV8bZyISYDgcQKMT1jTjR9p+DqbP/TlLL70WJ/irCVzwI
	 OrKmwkEdsQIr3+v46Qg12v51dL0C6ggsOh97xhgRCf2FSazYKlamj8X71IoHBNH7jP
	 20wBfO5C60OdRCbUZ3E5gcDwHGoU8pqnWHbZXJ+9AnID7FhtMKZ67CLjyloHxZOqWc
	 XpnsiHdGIdPYg==
Date: Mon, 19 Jun 2023 15:17:20 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: fsverity@lists.linux.dev
Cc: linux-integrity@vger.kernel.org, linux-doc@vger.kernel.org,
	Colin Walters <walters@verbum.org>,
	Alexander Larsson <alexl@redhat.com>,
	Luca Boccassi <bluca@debian.org>,
	Victor Hsieh <victorhsieh@google.com>
Subject: Re: [PATCH v2] fsverity: improve documentation for builtin signature
 support
Message-ID: <20230619221720.GA2993@sol.localdomain>
References: <20230619221048.10335-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230619221048.10335-1-ebiggers@kernel.org>

On Mon, Jun 19, 2023 at 03:10:48PM -0700, Eric Biggers wrote:
> +  authenticate applications before loading them.  In these cases, this
> +  trusted userspace code can authenticate a file's contents by
> +  retrieving its fs-verity digest using `FS_IOC_ENABLE_VERITY`_, then

Sorry, the above is supposed to say FS_IOC_MEASURE_VERITY.

- Eric
