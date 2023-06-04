Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4BD17F6
	for <fsverity@lists.linux.dev>; Sun,  4 Jun 2023 03:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yG53rDUNy32ApUZwULaYdrONbirFkZQd1ynfP3mjuCA=; b=nZGNqh9SIVAfF55CM22MIxezB1
	3HCA3zNiwJ8piLAd7pq96fVk8T5xjWqLOZE7aiQGiRIpTu9EFNwyqesOZfJJCnmaMB/M15tCDAnd9
	eD7AAPg94jppG2fL52f6FHzrCHJPbbv63IV3ygaWXwCIvredO6ygszXYk9AKRKVlVhB2HVwBhQcrz
	3BpLChGF9yrRwMjgj4sv1d6pi9Qtag4p72doKeaN5bSUSly0Kmqb1RH1gJijGNBdOi+C+Z5GnmkM8
	paPq6u2SWyyUf77iphsx+i/BDjTgtU2OaUwzN+8B1ObHJeONRqiui0EMhYM8gN/a6rK5Kcolbizrc
	nKGH2SEg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1q5ePH-00Ahdg-JK; Sun, 04 Jun 2023 03:27:51 +0000
Date: Sun, 4 Jun 2023 04:27:51 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] fsverity: don't use bio_first_page_all() in
 fsverity_verify_bio()
Message-ID: <ZHwEty6ubvBnxIM+@casper.infradead.org>
References: <20230604022101.48342-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230604022101.48342-1-ebiggers@kernel.org>

On Sat, Jun 03, 2023 at 07:21:01PM -0700, Eric Biggers wrote:
> bio_first_page_all(bio)->mapping->host is not compatible with large
> folios, since the first page of the bio is not necessarily the head page
> of the folio, and therefore it might not have the mapping pointer set.

Yes, that's true.  It is going to depend on the filesystem, since these
two bios are equivalent:

(folio->page[0], offset=0x4000, len=0x300)
(folio->page[4], offset=0, len=0x300)

and we don't yet have a rule that filesystems must construct one or the
other.  We probably _should_, but that was pretty low down my list of
things to care about right now.

> Therefore, move the dereference of ->mapping->host into
> verify_data_blocks(), which works with a folio.

Seems reasonable.

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>

> @@ -320,7 +321,6 @@ EXPORT_SYMBOL_GPL(fsverity_verify_blocks);
>   */
>  void fsverity_verify_bio(struct bio *bio)
>  {
> -	struct inode *inode = bio_first_page_all(bio)->mapping->host;

An alternative fix could be

	struct folio *first = page_folio(bio_first_page_all(bio));
	struct inode *inode = first->mapping->host;

Or we could add a bio_first_folio_all() that wraps that for you.
