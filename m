Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9F13321A5
	for <fsverity@lists.linux.dev>; Thu,  6 Nov 2025 13:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762434181; cv=none; b=bJIonNCikuh4aC+yEvw1d1jc4UkeyWonPL749tJ5TyIvP0Rjhcto0IOHNVevfsO3sjeRd+MtyuRT6MP4gYK8Q9rG+933yTL9JqFNAfDAbD0SjCy6qWHpnpHNqDmrgi5TjusAN9XpYUsOnFABDgN9sC6T8bEc3fvBs+1AY9QCWRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762434181; c=relaxed/simple;
	bh=lLp/g4EReyTZ5jYuaamuEaYfb75YVwUFR1Pv+MLViy4=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Afu9g9G8AcJva4YSux7WUe26+ftDXp8RBrFcC71MWqwCCxYQqBje+xHy5ztlyx9gxo6VPyiL+xwqiBrxTnny0MtvORVvz6lcLxOsZaoeXSDLXnpDWXpJ9lsUuOQsOJ5YwCnOoLVXnlhu+J+cr7jSsq/gIoPmVjbiIq3jShgDQUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4d2MmX6ZklzYQtqV
	for <fsverity@lists.linux.dev>; Thu,  6 Nov 2025 21:02:36 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 5070A1A12D6
	for <fsverity@lists.linux.dev>; Thu,  6 Nov 2025 21:02:55 +0800 (CST)
Received: from [10.174.178.254] (unknown [10.174.178.254])
	by APP2 (Coremail) with SMTP id Syh0CgDnPUZ9nAxptBigCw--.37038S3;
	Thu, 06 Nov 2025 21:02:55 +0800 (CST)
Message-ID: <10f8d4f8-14c8-46a9-be6e-07758b96bb59@huaweicloud.com>
Date: Thu, 6 Nov 2025 21:02:53 +0800
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: fsverity@lists.linux.dev, Eric Biggers <ebiggers@kernel.org>
Cc: Theodore Ts'o <tytso@mit.edu>, Baokun Li <libaokun@huaweicloud.com>
From: Baokun Li <libaokun@huaweicloud.com>
Subject: [QUESTION] Does fs-verity support large folios / large block size in
 ext4?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Syh0CgDnPUZ9nAxptBigCw--.37038S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ArW3XFy7ury3CFW5KrWDXFb_yoW8WFW3pF
	4Sk3WIkry5Gw18G3ZFqr98J34DAFs2qa1DJr95Ja1IkF17Cw1UuFnxWrykWrWYgayfXrWF
	yFZ5XFn8uF48A3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_JF0_
	Jw1lc7CjxVAKzI0EY4vE52x082I5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
	1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
	b7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
	vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAI
	cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa
	73UjIFyTuYvjfUUHUDDUUUU
X-CM-SenderInfo: 5olet0hnxqqx5xdzvxpfor3voofrz/1tbiAgAEBWkMdTAPIQAAsN

I have recently been working on enabling large block size support in ext4.
I had assumed that fs-verity does not support large folios / large block
size. However, when testing with 64k LBS using:

    `kvm-xfstests -c ext4/64k -g verity -x encrypt`

the tests passed successfully.

Is this just a coincidence, or has fs-verity code already been updated to
support large block size / large folios?


Thanks,
Baokun


-------------------- Summary report
KERNEL:    kernel 6.18.0-rc4-next-20251103-dirty #880 SMP PREEMPT_DYNAMIC
Thu Nov  6 19:27:12 CST 2025 x86_64
CMDLINE:   -c ext4/64k -g verity -x encrypt
CPUS:      2
MEM:       7944.47

ext4/64k: 9 tests, 59 seconds
  generic/572  Pass     3s
  generic/573  Pass     2s
  generic/574  Pass     6s
  generic/575  Pass     4s
  generic/577  Pass     6s
  generic/579  Pass     25s
  generic/624  Pass     1s
  generic/625  Pass     2s
  generic/692  Pass     1s
Totals: 9 tests, 0 skipped, 0 failures, 0 errors, 50s

FSTESTVER: blktests 698f1a0 (Mon, 27 May 2024 11:30:36 +0900)
FSTESTVER: fio  fio-3.28 (Wed, 8 Sep 2021 08:59:48 -0600)
FSTESTVER: fsverity v1.6 (Wed, 20 Mar 2024 21:21:46 -0700)
FSTESTVER: libaio   libaio-0.3.108-81-g1b18bfa (Mon, 28 Mar 2022 11:30:33
-0400)
FSTESTVER: quota  v4.05-43-gd2256ac (Fri, 17 Sep 2021 14:04:16 +0200)
FSTESTVER: xfsprogs v5.13.0 (Fri, 20 Aug 2021 12:03:57 -0400)
FSTESTVER: xfstests-bld 1bdd10a-dirty (Fri, 3 May 2024 16:14:41 -0400)
FSTESTVER: xfstests v2024.05.12 (Sun, 12 May 2024 20:28:48 +0800)
FSTESTCFG: ext4/64k
FSTESTSET: -g verity -x encrypt
FSTESTOPT: aex

