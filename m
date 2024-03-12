Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB487D060
	for <fsverity@lists.linux.dev>; Tue, 12 Mar 2024 15:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710257602; cv=none; b=BO9u834nhStAWnxYzREG4Hvae4PVBGTQABIKdKNmhEqJCrQC1nTK+FVXGUYhb4Wfa5EJ8t7lIs3VpeuGarg2X3LLh/Owx8+MjSpYdAx98fFYZiDenTwDtLUQUQT0aGT2a/mIEe9eZXWoWnw9qi5pIQTeA0BgTw5e0EF7SkIHdq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710257602; c=relaxed/simple;
	bh=1IY9/WU+tIfw8PZoox8fcWug+ux+U3noTrSKP4re9mU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=gWLhJk7fdPBvDDpkexVyRSnn6fZy/NfoYptd1NQhR4J9GY+QiXGL6afly1VCl7tFukub5i3uhC1pZp9Ej1HBEFlq34cozCiPzMj2TmXRh+hQZiYtVjWpcghuQrNRK7a5DoG7KDC2lAm+X2o2d7V1Lx23LDaB9VMs/JTCMEcwI50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fYCgUom+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fYCgUom+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710257599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6hB7LWVOR22eWYlwayM1X+lT1/2Yk9Gp5YiWT4qGJBc=;
	b=fYCgUom+HGHj+G63FRTKkZDHCDbOMfy/tXuIvJYo1EICwzfyrA1T9VdrYIRhBL0PAQp33Q
	TNKg4CdN0lLdThs/u8IezUswB7nK5cCFcu2CaIu7y8wGMCRdt/MG5/KL9blR67Uira4dA7
	zCSYYdWDk20mnGGDJ7U3vghzmw1wjEc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-97-HqNtn9_rMBe54VWyBcw_bg-1; Tue, 12 Mar 2024 11:33:18 -0400
X-MC-Unique: HqNtn9_rMBe54VWyBcw_bg-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-412de861228so23325385e9.0
        for <fsverity@lists.linux.dev>; Tue, 12 Mar 2024 08:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710257596; x=1710862396;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:from:content-language:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6hB7LWVOR22eWYlwayM1X+lT1/2Yk9Gp5YiWT4qGJBc=;
        b=pN3FBxBITRu2dWByHBz0RkQHdtoEu4cJr2ANd1mccEoM9N26POJjdTA2Bfo/+5qJG5
         pYi62RFtYunoIZbh4ArMT1s28bAU1laocs2nz431FdVL0vlIfVBUYWtrhjvf/T74Xsqt
         z7QXyMd8WeKvrIm1imsuLgTxz8PcB+cOL9hyKUSZ9FenImhRctB77P8VdbtsoVgiW4HN
         tu0+9hGG50bRfYrsB8Z9tlmikvp59qky3Uod91BEG8is7CznWHrfpGLlcMPj7mz9yDTT
         qGndtiGNDxgrH3ebkA4EJohG+klEUHk5hZE8fH/HtW4OoqpBYonxh0Ije2vF/N+702bK
         nQQg==
X-Forwarded-Encrypted: i=1; AJvYcCVylhsD3jM06aM26+UMTM6DxgkJgmPkT/rDcK7Ey1+0MO40++lJLxm3fWkXSM2JeSG6PYI4gDqKHHOVduvkb666j6GNmqfjn28=
X-Gm-Message-State: AOJu0YxwqcvFh70P81NEGyw0jM8Xj2351PboOeecqEYu6Xn8Q20Af8uT
	ve+eSfCg1xWKlUpEro67w5AsyX+TfO40V3swpVhKwWB8LlHqiCpzfUCJKGsmqjS0j0HLm9QhlaF
	4HDQzpj6jMMHfMmEQX+p+WcjOtoV41Ug+X8t/kgFpY4kitlkcFQeBIwE7
X-Received: by 2002:a05:600c:138e:b0:413:1d40:88fb with SMTP id u14-20020a05600c138e00b004131d4088fbmr7542896wmf.17.1710257596494;
        Tue, 12 Mar 2024 08:33:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFM9rOsGIuQXoLnlnX1JMwu53T2Tnh+kgCjd44AJv10fz0mtRZKT7R+htoOmzeXQfquldBnPg==
X-Received: by 2002:a05:600c:138e:b0:413:1d40:88fb with SMTP id u14-20020a05600c138e00b004131d4088fbmr7542882wmf.17.1710257596024;
        Tue, 12 Mar 2024 08:33:16 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:4f00:a44a:5ad6:765a:635? (p200300cbc7074f00a44a5ad6765a0635.dip0.t-ipconnect.de. [2003:cb:c707:4f00:a44a:5ad6:765a:635])
        by smtp.gmail.com with ESMTPSA id d9-20020adf9c89000000b0033df46f70dbsm9450876wre.9.2024.03.12.08.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 08:33:15 -0700 (PDT)
Message-ID: <08905bcc-677d-4981-926d-7f407b2f6a4a@redhat.com>
Date: Tue, 12 Mar 2024 16:33:14 +0100
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/24] fsverity: pass tree_blocksize to
 end_enable_verity()
From: David Hildenbrand <david@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>,
 Matthew Wilcox <willy@infradead.org>
Cc: Andrey Albershteyn <aalbersh@redhat.com>, fsverity@lists.linux.dev,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 chandan.babu@oracle.com, akpm@linux-foundation.org, linux-mm@kvack.org,
 Eric Biggers <ebiggers@kernel.org>
References: <20240304191046.157464-2-aalbersh@redhat.com>
 <20240304191046.157464-8-aalbersh@redhat.com>
 <20240305005242.GE17145@sol.localdomain>
 <20240306163000.GP1927156@frogsfrogsfrogs>
 <20240307220224.GA1799@sol.localdomain>
 <20240308034650.GK1927156@frogsfrogsfrogs>
 <20240308044017.GC8111@sol.localdomain>
 <20240311223815.GW1927156@frogsfrogsfrogs>
 <9927568e-9f36-4417-9d26-c8a05c220399@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <9927568e-9f36-4417-9d26-c8a05c220399@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.03.24 16:13, David Hildenbrand wrote:
> On 11.03.24 23:38, Darrick J. Wong wrote:
>> [add willy and linux-mm]
>>
>> On Thu, Mar 07, 2024 at 08:40:17PM -0800, Eric Biggers wrote:
>>> On Thu, Mar 07, 2024 at 07:46:50PM -0800, Darrick J. Wong wrote:
>>>>> BTW, is xfs_repair planned to do anything about any such extra blocks?
>>>>
>>>> Sorry to answer your question with a question, but how much checking is
>>>> $filesystem expected to do for merkle trees?
>>>>
>>>> In theory xfs_repair could learn how to interpret the verity descriptor,
>>>> walk the merkle tree blocks, and even read the file data to confirm
>>>> intactness.  If the descriptor specifies the highest block address then
>>>> we could certainly trim off excess blocks.  But I don't know how much of
>>>> libfsverity actually lets you do that; I haven't looked into that
>>>> deeply. :/
>>>>
>>>> For xfs_scrub I guess the job is theoretically simpler, since we only
>>>> need to stream reads of the verity files through the page cache and let
>>>> verity tell us if the file data are consistent.
>>>>
>>>> For both tools, if something finds errors in the merkle tree structure
>>>> itself, do we turn off verity?  Or do we do something nasty like
>>>> truncate the file?
>>>
>>> As far as I know (I haven't been following btrfs-progs, but I'm familiar with
>>> e2fsprogs and f2fs-tools), there isn't yet any precedent for fsck actually
>>> validating the data of verity inodes against their Merkle trees.
>>>
>>> e2fsck does delete the verity metadata of inodes that don't have the verity flag
>>> enabled.  That handles cleaning up after a crash during FS_IOC_ENABLE_VERITY.
>>>
>>> I suppose that ideally, if an inode's verity metadata is invalid, then fsck
>>> should delete that inode's verity metadata and remove the verity flag from the
>>> inode.  Checking for a missing or obviously corrupt fsverity_descriptor would be
>>> fairly straightforward, but it probably wouldn't catch much compared to actually
>>> validating the data against the Merkle tree.  And actually validating the data
>>> against the Merkle tree would be complex and expensive.  Note, none of this
>>> would work on files that are encrypted.
>>>
>>> Re: libfsverity, I think it would be possible to validate a Merkle tree using
>>> libfsverity_compute_digest() and the callbacks that it supports.  But that's not
>>> quite what it was designed for.
>>>
>>>> Is there an ioctl or something that allows userspace to validate an
>>>> entire file's contents?  Sort of like what BLKVERIFY would have done for
>>>> block devices, except that we might believe its answers?
>>>
>>> Just reading the whole file and seeing whether you get an error would do it.
>>>
>>> Though if you want to make sure it's really re-reading the on-disk data, it's
>>> necessary to drop the file's pagecache first.
>>
>> I tried a straight pagecache read and it worked like a charm!
>>
>> But then I thought to myself, do I really want to waste memory bandwidth
>> copying a bunch of data?  No.  I don't even want to incur system call
>> overhead from reading a single byte every $pagesize bytes.
>>
>> So I created 2M mmap areas and read a byte every $pagesize bytes.  That
>> worked too, insofar as SIGBUSes are annoying to handle.  But it's
>> annoying to take signals like that.
>>
>> Then I started looking at madvise.  MADV_POPULATE_READ looked exactly
>> like what I wanted -- it prefaults in the pages, and "If populating
>> fails, a SIGBUS signal is not generated; instead, an error is returned."
>>
> 
> Yes, these were the expected semantics :)
> 
>> But then I tried rigging up a test to see if I could catch an EIO, and
>> instead I had to SIGKILL the process!  It looks filemap_fault returns
>> VM_FAULT_RETRY to __xfs_filemap_fault, which propagates up through
>> __do_fault -> do_read_fault -> do_fault -> handle_pte_fault ->
>> handle_mm_fault -> faultin_page -> __get_user_pages.  At faultin_pages,
>> the VM_FAULT_RETRY is translated to -EBUSY.
>>
>> __get_user_pages squashes -EBUSY to 0, so faultin_vma_page_range returns
>> that to madvise_populate.  Unfortunately, madvise_populate increments
>> its loop counter by the return value (still 0) so it runs in an
>> infinite loop.  The only way out is SIGKILL.
> 
> That's certainly unexpected. One user I know is QEMU, which primarily
> uses MADV_POPULATE_WRITE to prefault page tables. Prefaulting in QEMU is
> primarily used with shmem/hugetlb, where I haven't heard of any such
> endless loops.
> 
>>
>> So I don't know what the correct behavior is here, other than the
>> infinite loop seems pretty suspect.  Is it the correct behavior that
>> madvise_populate returns EIO if __get_user_pages ever returns zero?
>> That doesn't quite sound right if it's the case that a zero return could
>> also happen if memory is tight.
> 
> madvise_populate() ends up calling faultin_vma_page_range() in a loop.
> That one calls __get_user_pages().
> 
> __get_user_pages() documents: "0 return value is possible when the fault
> would need to be retried."
> 
> So that's what the caller does. IIRC, there are cases where we really
> have to retry (at least once) and will make progress, so treating "0" as
> an error would be wrong.
> 
> Staring at other __get_user_pages() users, __get_user_pages_locked()
> documents: "Please note that this function, unlike __get_user_pages(),
> will not return 0 for nr_pages > 0, unless FOLL_NOWAIT is used.".
> 
> But there is some elaborate retry logic in there, whereby the retry will
> set FOLL_TRIED->FAULT_FLAG_TRIED, and I think we'd fail on the second
> retry attempt (there are cases where we retry more often, but that's
> related to something else I believe).
> 
> So maybe we need a similar retry logic in faultin_vma_page_range()? Or
> make it use __get_user_pages_locked(), but I recall when I introduced
> MADV_POPULATE_READ, there was a catch to it.

I'm trying to figure out who will be setting the VM_FAULT_SIGBUS in the 
mmap()+access case you describe above.

Staring at arch/x86/mm/fault.c:do_user_addr_fault(), I don't immediately 
see how we would transition from a VM_FAULT_RETRY loop to 
VM_FAULT_SIGBUS. Because VM_FAULT_SIGBUS would be required for that 
function to call do_sigbus().

-- 
Cheers,

David / dhildenb

