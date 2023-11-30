Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4946154BF;
	Thu, 30 Nov 2023 04:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QsnyDU+A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701317025; x=1732853025;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cR5Izo2xklzJNmbee5XWcMhiPrBrVwOZxtcbWhIh74g=;
  b=QsnyDU+ABOYa9voRxI/LQJHF4WIF5cHZ5otSoPHF2ARTDaM40Eq90kdR
   ervyKVMs595tSL5G9rDUi1aQako1aOMpVQX4h3cl0fZceeHiPiHhGftEp
   5PtzDw7wm2q5tt9YJACua/7QUNke/naL57zxYtA+Vhwas9uMDM1e0/7M+
   VpIrHcoI+CNDWX6++4H8Y9iPgoWVtww2QcalJlNecPQQTkJeYxpEOCaUc
   4EFi6OUMo0binhplJa+g85GhRlS0OVul1JMprL4gfP7/1jAJ0S3K+l+L9
   ojSmjiItK21Cgdz4N4rRd5v5g8fYiZaa6nQv0oCCwf9vhwOe++teXyN0Q
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="14819196"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="14819196"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 20:03:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="1016502568"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="1016502568"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 29 Nov 2023 20:03:06 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8YGW-0001KE-26;
	Thu, 30 Nov 2023 04:03:04 +0000
Date: Thu, 30 Nov 2023 12:02:53 +0800
From: kernel test robot <lkp@intel.com>
To: Song Liu <song@kernel.org>, bpf@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, fsverity@lists.linux.dev
Cc: oe-kbuild-all@lists.linux.dev, ebiggers@kernel.org, ast@kernel.org,
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
	brauner@kernel.org, viro@zeniv.linux.org.uk, casey@schaufler-ca.com,
	amir73il@gmail.com, kpsingh@kernel.org, roberto.sassu@huawei.com,
	kernel-team@meta.com, Song Liu <song@kernel.org>
Subject: Re: [PATCH v14 bpf-next 6/6] selftests/bpf: Add test that uses
 fsverity and xattr to sign a file
Message-ID: <202311301002.mGJ2mc2v-lkp@intel.com>
References: <20231129003656.1165061-7-song@kernel.org>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129003656.1165061-7-song@kernel.org>

Hi Song,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Song-Liu/bpf-Add-kfunc-bpf_get_file_xattr/20231129-084133
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20231129003656.1165061-7-song%40kernel.org
patch subject: [PATCH v14 bpf-next 6/6] selftests/bpf: Add test that uses fsverity and xattr to sign a file
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311301002.mGJ2mc2v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311301002.mGJ2mc2v-lkp@intel.com/

All errors (new ones prefixed by >>):

>> progs/test_sig_in_xattr.c:36:26: error: invalid application of 'sizeof' to an incomplete type 'struct fsverity_digest'
      36 | char digest[MAGIC_SIZE + sizeof(struct fsverity_digest) + SHA256_DIGEST_SIZE];
         |                          ^     ~~~~~~~~~~~~~~~~~~~~~~~~
   progs/test_sig_in_xattr.c:36:40: note: forward declaration of 'struct fsverity_digest'
      36 | char digest[MAGIC_SIZE + sizeof(struct fsverity_digest) + SHA256_DIGEST_SIZE];
         |                                        ^
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
