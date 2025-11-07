Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6523D21578F
	for <fsverity@lists.linux.dev>; Fri,  7 Nov 2025 03:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762485943; cv=none; b=CCWXhXbiu0cxoS2sTvSk/N028MMN4uXEJAKSCik4lbQvqYXmdkkCwgSXv8zt3jg1Zu0wj0eLFVdyPkUsJtArWtbV9yelGMuzf3xyllsOx4N3GU3ww3288EeXCQ1WamDWr7Gnn2GuI/DDlCJ/Ny2XZoWGGev1m58eWANyVE0oH7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762485943; c=relaxed/simple;
	bh=sDq4LG4SQd3eesqa0aLwvUqV1Msst2Ua/S6HT++i18I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TxzyGz7IKZpLV3fUwbR7xiriZAACqS9FnHxypNrwR7piPFhTYcjUPfeKVwXCWWjfb7CNSKgDL1NhDrNV71wttXTAOEIoc+/MVr6cxjkbElrgNaw3qJ2TP5mt/hFeXzu12deY+koDrmqf6OXPAdI6VZ7I1OEu7BkeI55yixPEO0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4d2kw76TM0zKHLyH
	for <fsverity@lists.linux.dev>; Fri,  7 Nov 2025 11:25:27 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 8828F1A0FA3
	for <fsverity@lists.linux.dev>; Fri,  7 Nov 2025 11:25:37 +0800 (CST)
Received: from [10.174.178.254] (unknown [10.174.178.254])
	by APP2 (Coremail) with SMTP id Syh0CgCH3UWwZg1pnK3kCw--.48250S3;
	Fri, 07 Nov 2025 11:25:37 +0800 (CST)
Message-ID: <13ecedeb-c636-4005-a8ce-e4fbd527c924@huaweicloud.com>
Date: Fri, 7 Nov 2025 11:25:35 +0800
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [QUESTION] Does fs-verity support large folios / large block size
 in ext4?
Content-Language: en-GB
To: Eric Biggers <ebiggers@kernel.org>
Cc: fsverity@lists.linux.dev, Theodore Ts'o <tytso@mit.edu>
References: <10f8d4f8-14c8-46a9-be6e-07758b96bb59@huaweicloud.com>
 <20251106204451.GC7015@quark>
From: Baokun Li <libaokun@huaweicloud.com>
In-Reply-To: <20251106204451.GC7015@quark>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Syh0CgCH3UWwZg1pnK3kCw--.48250S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFW5uFy3tFyfCF18tr4Dtwb_yoW8Xw1Upa
	909F1vkF45Ga1IyrsrJF1Fva4093yxCasrJas5XrW7tF1DA3Z29r1qyF45Cayq9rsxCw1k
	Za1fXr9rJas7ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUgvb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIev
	Ja73UjIFyTuYvjxUzsqWUUUUU
X-CM-SenderInfo: 5olet0hnxqqx5xdzvxpfor3voofrz/1tbiAgAEBWkMdTAPIgACsM

On 2025-11-07 04:44, Eric Biggers wrote:
> On Thu, Nov 06, 2025 at 09:02:53PM +0800, Baokun Li wrote:
>> I have recently been working on enabling large block size support in ext4.
>> I had assumed that fs-verity does not support large folios / large block
>> size. However, when testing with 64k LBS using:
>>
>>     `kvm-xfstests -c ext4/64k -g verity -x encrypt`
>>
>> the tests passed successfully.
>>
>> Is this just a coincidence, or has fs-verity code already been updated to
>> support large block size / large folios?
> It might work already.  I already added support for verifying data from
> large folios several years ago:
>
>     commit 5d0f0e57ed900917836385527ce5b122fa1425a3
>     Author: Eric Biggers <ebiggers@google.com>
>     Date:   Fri Jan 27 14:15:29 2023 -0800
>
>         fsverity: support verifying data from large folios
>
> Note that the Merkle tree block size is still limited to <= PAGE_SIZE.
> But that's fine for now; generally people want 4K Merkle tree blocks
> anyway.  So the configuration in question, which should be getting
> tested when you run that command and should theoretically work, should
> be: filesystem_block_size=64K, PAGE_SIZE=4K, merkle_tree_block_size=4K.
>
> Is there a git tree with your work that I can take a look at and confirm
> that this is happening?
>
> - Eric

I sent out v1 without enabling LBS support in verity. Since you have
already done some adaptation work, I plan to enable it in v2. v2 will be
sent out today, and I will cc you.

Thank you very much for helping to confirm!


-- 
With Best Regards,
Baokun Li

