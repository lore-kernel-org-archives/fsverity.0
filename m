Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39317C950
	for <fsverity@lists.linux.dev>; Wed,  5 Apr 2023 22:14:59 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id z10so22674363pgr.8
        for <fsverity@lists.linux.dev>; Wed, 05 Apr 2023 15:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20210112.gappssmtp.com; s=20210112; t=1680732898;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sr4CJdOOx/6apQcfPjVNK8msYC2J6U4ttJpvFiO5hDA=;
        b=m04BZY35RD6EaPYELcRel51CNq6xM8X8aXbJWM0zpFJg5R9ZEfx3ALXHe27ZQTx/ML
         RjdLwwAr7+4sz13cFeM+4MFXL0NDeO0sDJVA9EpyReHBMnIHkm92ebNusykZudTLT4kb
         ZJt9w2GuxyrtFAj7oogjC2Nr0HL+r4kpZ6lzOt6rcmOuXKj15Zw+5iQ9+bIRQa16RXYd
         mqYE+wyM7waca64HeD0ztnx4PCy2qkyJsPtmJxS4X1sOHozTDe94atNRk2yRkagS/8TC
         Xykh3m9EUSbsut3dD/LJF9fvakINcF2XcNSqQnSe8WA/qL2Bzj/UsimauCtRgN2YOZNg
         vv0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680732898;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sr4CJdOOx/6apQcfPjVNK8msYC2J6U4ttJpvFiO5hDA=;
        b=2FjDsjrNzsavgG7DMCtbilzV/jwhGV0kcFjP0HCxX3hCEcIHCvC83quMtNgyjqcnGc
         bL0gBgZLxiHXe422R0p9shL/evcwXXIymmPQytubVmmRYbeae9VPy/k2l/xlQvnuAvIW
         W32G8GBP7aS/sJwDmZ51TsNkAJ9Sg+7CBk34dc5qCq/VseLOPS75zqHJr5DlCODsUZDZ
         AaewGtKd6R8Kj239qX6qk7J7Z7NiKxsUOCFrZpuZbyn8BVvXLq90GuX/6vnu/pecYCYr
         y9vdwdGW0LOhQSPRAOpwbw3d9l1t/SnKSmXmIXkZ22PjnmeLxK7leuH39+nY3naU+Q5j
         6Z2g==
X-Gm-Message-State: AAQBX9cppVZ2SwaP49IzOp/UzMLq9PKOl2MXT2YoYCamfH2PLrGyGMwP
	TiI4BCvlIr4AxWlhI63zY3lHvQ==
X-Google-Smtp-Source: AKy350buwNZtgpjQjNrpY+dRBomVST4nFtdRBnQ6Mea8vZue8EC+2ZTK97MNMJLE5y0NZdZDQ14O+g==
X-Received: by 2002:aa7:9a44:0:b0:626:1c2a:2805 with SMTP id x4-20020aa79a44000000b006261c2a2805mr5960988pfj.25.1680732898541;
        Wed, 05 Apr 2023 15:14:58 -0700 (PDT)
Received: from dread.disaster.area (pa49-181-91-157.pa.nsw.optusnet.com.au. [49.181.91.157])
        by smtp.gmail.com with ESMTPSA id t17-20020a62ea11000000b005a9ea5d43ddsm11542560pfh.174.2023.04.05.15.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 15:14:58 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1pkBP4-00HUS4-Uz; Thu, 06 Apr 2023 08:14:54 +1000
Date: Thu, 6 Apr 2023 08:14:54 +1000
From: Dave Chinner <david@fromorbit.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Andrey Albershteyn <aalbersh@redhat.com>, dchinner@redhat.com,
	linux-xfs@vger.kernel.org, fsverity@lists.linux.dev,
	rpeterso@redhat.com, agruenba@redhat.com, xiang@kernel.org,
	chao@kernel.org, damien.lemoal@opensource.wdc.com, jth@kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com
Subject: Re: [PATCH v2 19/23] xfs: disable direct read path for fs-verity
 sealed files
Message-ID: <20230405221454.GQ3223426@dread.disaster.area>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-20-aalbersh@redhat.com>
 <20230404161047.GA109974@frogsfrogsfrogs>
 <20230405150142.3jmxzo5i27bbc4c4@aalbersh.remote.csb>
 <20230405150927.GD303486@frogsfrogsfrogs>
 <ZC2YsgYRsvBejGYY@infradead.org>
 <ZC23x22bxItnsANI@gmail.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZC23x22bxItnsANI@gmail.com>

On Wed, Apr 05, 2023 at 06:02:47PM +0000, Eric Biggers wrote:
> And I really hope that you don't want to do DIO to the *Merkle tree*, as that

Not for XFS - the merkle tree is not held as file data.

That said, the merkle tree in XFS is not page cache or block aligned
metadata either, so we really want the same memory buffer based
interface for the merkle tree reading so that the merkle tree code
can read directly from the xfs-buf rather than requiring us to copy
it out of the xfsbuf into temporary pages...

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
