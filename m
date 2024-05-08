Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBCD63E
	for <fsverity@lists.linux.dev>; Wed,  8 May 2024 17:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715188661; cv=none; b=LjEyHXeGn3g6mbEbyrAB2H3zT5oRm/4asygitxIofXI5chwy2rgwFID4W2pb76lvOQas+DFNJMfJHy+/KOY52aNbtvzPBWNu4Q9MG8sXE313WeQKBIzakyLH4po6/BRUT/0VWGCVE2MgxMDnY81M/RNJRvpODYdKJYTSZjylsnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715188661; c=relaxed/simple;
	bh=Kxn1OpXajAC4QAVxlaCCK4ZVHRi/UjZM97fUkWUoxJE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JCX69MdmeqGZ4jTdSz2yNE2N1dOEK9xcquP7F8LGW/T1QhN83xeLfyZHuZKmmW++S0EV+M1veB9Ikv+hcYTrYiUhE1GZUlDcPTA04LLGA1alJTEhQRObPmQsxSyFpOES75LyzgGnmWZ6W5g43muVYPDHpBsTzFd9sPsE8bNM5L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UQZSEvOK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UQZSEvOK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715188659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RgumTHjw5lWA0kR5RCBEM/DVrmph4hHsyV7IvxPwa1U=;
	b=UQZSEvOKc3TwylvwvgeGi4A8kfHMo28jV1mIUQSrupd8kwNetXZ7gHuUneF3K1DVgBN29z
	dlG0aulTguwrwXTZw2bJOYTvlzeyxUuJGBVC6Enhi045NI2mEDx5+TpaHG9Gln7W+w9Ad6
	A4mEt+NCnHA+ir9PvrBzlMeJPbkKOCA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-xjcmPchrNO2ZGK2OhCc-NQ-1; Wed, 08 May 2024 13:17:36 -0400
X-MC-Unique: xjcmPchrNO2ZGK2OhCc-NQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29F60101A551;
	Wed,  8 May 2024 17:17:35 +0000 (UTC)
Received: from file1-rdu.file-001.prod.rdu2.dc.redhat.com (unknown [10.11.5.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BCD8A1C066AC;
	Wed,  8 May 2024 17:17:34 +0000 (UTC)
Received: by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix, from userid 12668)
	id 9EA9C30C2BDF; Wed,  8 May 2024 17:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix) with ESMTP id 986D73E5E0;
	Wed,  8 May 2024 19:17:34 +0200 (CEST)
Date: Wed, 8 May 2024 19:17:34 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Fan Wu <wufan@linux.microsoft.com>
cc: corbet@lwn.net, zohar@linux.ibm.com, jmorris@namei.org, serge@hallyn.com, 
    tytso@mit.edu, ebiggers@kernel.org, axboe@kernel.dk, agk@redhat.com, 
    snitzer@kernel.org, eparis@redhat.com, paul@paul-moore.com, 
    linux-doc@vger.kernel.org, linux-integrity@vger.kernel.org, 
    linux-security-module@vger.kernel.org, fsverity@lists.linux.dev, 
    linux-block@vger.kernel.org, dm-devel@lists.linux.dev, 
    audit@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v18 12/21] dm: add finalize hook to target_type
In-Reply-To: <1714775551-22384-13-git-send-email-wufan@linux.microsoft.com>
Message-ID: <aa767961-5e3-2ceb-1a1e-ff66a8eed649@redhat.com>
References: <1714775551-22384-1-git-send-email-wufan@linux.microsoft.com> <1714775551-22384-13-git-send-email-wufan@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7



On Fri, 3 May 2024, Fan Wu wrote:

> This patch adds a target finalize hook.
> 
> The hook is triggered just before activating an inactive table of a
> mapped device. If it returns an error the __bind get cancelled.
> 
> The dm-verity target will use this hook to attach the dm-verity's
> roothash metadata to the block_device struct of the mapped device.
> 
> Signed-off-by: Fan Wu <wufan@linux.microsoft.com>

Hi

Why not use the preresume callback?

Is there some reason why do we need a new callback instead of using the 
existing one?

Mikulas

