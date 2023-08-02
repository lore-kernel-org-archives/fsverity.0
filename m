Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFAA15B0
	for <fsverity@lists.linux.dev>; Wed,  2 Aug 2023 04:15:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82FE0C433CC;
	Wed,  2 Aug 2023 04:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690949747;
	bh=qVu2h+90Sr9xTEFTCM5T6XS4B1BUEaWCYaE9ful83Bg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nCZKIym2/Jx5XI1zKv4mYtoXLKPWqdTnJx9IdZMfvZtPy7D0rd3W2X3v4Ksa28AUe
	 EHvM7Q8c898oh3vY2mVdnxMlpz7st7bs99MzmR38gz84Arz+G72o6AlYaSfRTFD9Se
	 pSg8fDonEN2lR8/+2H6eKFA76p1zwIL5J9JNDdSIcEKc1yCv4qCwRKZXwkf5Q/xAmW
	 4OEIPspMIaU0z7aZuAOx78a09zWmsgEUzZ0pz6kbBu3TfFA372AKNWbkgKa3pY7LCM
	 RIgh8z1fzfBnsrm9DE1APXRmSSj+wdWeGUMaTkBLEzxJsVF5uYBs+KVlSrz8djVo9L
	 D/fI/X+2w9x6A==
Date: Tue, 1 Aug 2023 21:15:45 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Victor Hsieh <victorhsieh@google.com>
Cc: fsverity@lists.linux.dev, keyrings@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] fsverity: skip PKCS#7 parser when keyring is empty
Message-ID: <20230802041545.GA1543@sol.localdomain>
References: <20230801050714.28974-1-ebiggers@kernel.org>
 <CAFCauYMrQf4TJJ+8atPrsihDa9+nKb5zn-rCKqB3081d8ZvZoA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFCauYMrQf4TJJ+8atPrsihDa9+nKb5zn-rCKqB3081d8ZvZoA@mail.gmail.com>

On Tue, Aug 01, 2023 at 09:07:44AM -0700, Victor Hsieh wrote:
> Should the whole use of "d" be moved into the else block?

In v2, changed to use an early return instead.

- Eric
