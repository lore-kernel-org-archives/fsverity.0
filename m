Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EACE1E4B3
	for <fsverity@lists.linux.dev>; Fri, 23 Feb 2024 13:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708693366; cv=none; b=p2BHJheDMOGGo+pmMKEV8sUSJPWYdFcPyaV4fproJybbJaHyt3ZcLI8t4KypdRNTB0EPrIhwH+b5Qsj5Q4DhBiiABUxqNw0o7QVpNadFFpDA7hPPfFdRDAt8s8DQBSIHCkK/w2sA2a38ry9OoQuKuTTCt1L7M57eqLldlETNPHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708693366; c=relaxed/simple;
	bh=RUPGz4uWHNl3T0qSIFmu8luoF5GX7vvcylxL8fCjZrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Z+HXwLoJfAHEknpYA3F7HplrdgxnseJ7ZZSdsV3V2pm2o9tYoZ6Swb9l+U79h4vp3Jb2v2O+tKnP0trHJe52jJu5evEQC/2iHwiOr5jYIq76yWVYHnwyYwRgn6LMjrpSP44yPyZANSyVdWe+lov595dGBm4HzdL9HDt1yO4TnWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PQ5GZ53M; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PQ5GZ53M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708693364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9nNIDOJ7U57ZqFG+S4c1ph7aQNyUgoEFYAGarXzmePc=;
	b=PQ5GZ53M/R1sthy6cUFARcWaypZB1+rVjhOioEtRPyLUr96kwb2A1qALI5/h7qYOge4H0H
	e0vKtUStAfYEy4cTnkQNX/dHENBPvGo3RzDPOWf8Oow/p5j776x81skkNI3x6XQ2O+BMCp
	nlA9HPWTadyah62IjBAcAvtOg/uZsNw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-KZUcVW9HPq-AbZ42bH-XsA-1; Fri, 23 Feb 2024 08:02:43 -0500
X-MC-Unique: KZUcVW9HPq-AbZ42bH-XsA-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-33d73e15097so343843f8f.1
        for <fsverity@lists.linux.dev>; Fri, 23 Feb 2024 05:02:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708693361; x=1709298161;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9nNIDOJ7U57ZqFG+S4c1ph7aQNyUgoEFYAGarXzmePc=;
        b=NWZD8ii9e5k3pZxoVCnS0ypMCSo/b5q3gStA9r3H2lNlRUdUQN0htT2sfsRPjPg7Za
         DbJpaVYmJOafrmpcEQaVtJn/7dNb7M6lXghrdEZukDXi7+mjJN6daJqb5d/bh3R2//sR
         jmLrCFsLFFqskqAckY+YQ78cuXsx+1r28zThCCcZka72Xpa8Y2EYAxH4Al0IhO6puRy/
         6vlriwZPUBFnekKvLNC8iGtUWU6Ck+PabSH0KSu5vNpABpuWHOj3QfMY7QNiBEXDnIzR
         o6/vNAahgbGsS0lMvu8g150urXYSQblGv6nMvsmjA45DK6P3xw8jtO1TiEPXp8+zUVFr
         Wimw==
X-Gm-Message-State: AOJu0YwNHNdTbdoIhzcIK+VnfQHzltK9VyHd7lC6zY27S5Gy91Awo6aa
	ZNN/m/khCFPrh1cnOqZYD/ce6H3tddDuvPunCkBrOKBFS66RxXo5Ip3SqswjteARM4MonUUCCSh
	iPSdmPKn11ASTwKuQ/nU8Z+qYS4yoc1bn7Waq4jb4EvLEgCGTuvZ11vx6xfDWWuk=
X-Received: by 2002:a5d:4746:0:b0:33d:9d22:1fdd with SMTP id o6-20020a5d4746000000b0033d9d221fddmr3095862wrs.19.1708693361497;
        Fri, 23 Feb 2024 05:02:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/fELhAmOQKDfpkAa81QRAjueWrbzCylz2IBIfn4SD11H+AbnP2lo2q/006BquKc+5pg5jPA==
X-Received: by 2002:a5d:4746:0:b0:33d:9d22:1fdd with SMTP id o6-20020a5d4746000000b0033d9d221fddmr3095841wrs.19.1708693361166;
        Fri, 23 Feb 2024 05:02:41 -0800 (PST)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id d9-20020a05600c3ac900b00410cfc34260sm2345848wms.2.2024.02.23.05.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 05:02:40 -0800 (PST)
Date: Fri, 23 Feb 2024 14:02:39 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, chandan.babu@oracle.com, djwong@kernel.org
Subject: Re: [PATCH v4 06/25] fsverity: pass log_blocksize to
 end_enable_verity()
Message-ID: <ejszyutkoujv44mdmeyzvwdeqxi4z7a4crtfpdxddg7wtvjvth@jgtnqj7ginge>
References: <20240212165821.1901300-1-aalbersh@redhat.com>
 <20240212165821.1901300-7-aalbersh@redhat.com>
 <20240223042656.GB25631@sol.localdomain>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240223042656.GB25631@sol.localdomain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> There may be many Merkle tree blocks, so it doesn't really make sense to write
> "the Merkle tree block".  Maybe write "the Merkle tree block size".
> 
> Likewise in fs/btrfs/verity.c.

Right, thanks!

-- 
- Andrey

