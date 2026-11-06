Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793960858;
	b=wYtTGG3jww9rcJfR5Zem6akLoSxa5dfTBFfLdNz1R7f6AZllysWc2slmJVKMNmhcDKQt
	 +ENMcu1cPV+a3oPj+RehE8WXJ/PyuJw0CwyNcB1RYhV4l1ejhx2bhstrsjPDe25sEl7Sh
	 x+InpTUlNeP32wDS/wS1jVLRg0cBKQRkvwPqUZUtVMyrTunxustr7cNW6piVHXSuGpJkl
	 4o6d42DilHtO2aTQxmA/QgjJE9/6EUuNEZGA0eE4Jxt1+0WJ10yH+C9ULSNcIeCkgbtCF
	 kVTIeu5QbG6Yb/uv5Cf0Y0ox8NGy3A38Ru26molS0zy0tj/wwm9Vtf1CsMtpdywqPAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960858;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=Ng4EmQmVugyqJk+SkgZfhDd1lWc8URaGhyumeNdQoGs=;
	b=XeCL69oMzOCSvRquopyfC24HjSDoiSD/dNkf7mBSdUmwjjjscH/mLXn8mTTGNX3pxC60
	 We3A9XEaxAykTFaZ2lCcsIkwQtaoEWYkvwzbejovNb3s+Yne6AqLW21Y1d1R0Xuv5OQD0
	 3Ql2WwZa+xrP4q74Y5Mz1kyKHAV6ZTelrtnKpNlLJqYw9EmMTIRJkE7LeUqU5GJWyVQin
	 aqFR7cbMghN1TS23mzaPMsX+QioCM0Hf4wKn8CKSgM/vKCr6+asM0SgZtoyb+FtP5F+UF
	 WQxC3i31rU/TT/uw1067TiV+T6rzijw3JeI8W2to43qxlOmuK6C/C9eKcVgMjFxz+/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A050F606A32D
	for <fsverity@lists.linux.dev>; Fri,  6 Nov 2026 10:27:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A050F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 3CFD468BEB; Fri,  6 Nov 2026 11:27:34 +0100 (CET)
Date: Fri, 6 Nov 2026 11:27:34 +0100
From: Christoph Hellwig <hch@lst.de>
To: Andrey Albershteyn <aalbersh@kernel.org>
Cc: ebiggers@kernel.org, hch@lst.de, fsverity@lists.linux.dev,
	dsterba@suse.com, linux-xfs@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	brauner@kernel.org, viro@zeniv.linux.org.uk, jaegeuk@kernel.org,
	chao@kernel.org, tytso@mit.edu
Subject: Re: [PATCH v2 5/5] f2fs: use I_VERITY_BUILDING instead of private
 flags
Message-ID: <20261106102734.GE5319@lst.de>
References: <20261105115532.613467-1-aalbersh@kernel.org> <20261105115532.613467-6-aalbersh@kernel.org>
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Post: <mailto:fsverity@lists.linux.dev>
List-Help: <mailto:fsverity+help@lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fsverity+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105115532.613467-6-aalbersh@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

This looks good to me, but given the conflict with the f2fs tree maybe
delay this until after the current merge window?

