Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D081224F0
	for <fsverity@lists.linux.dev>; Tue, 23 Apr 2024 18:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713897714; cv=none; b=vFjIAnVEUxmj8zx5IrhUvJ6mJv+GE2U8BDEbhS+b94CReSHQ5YvmjVMRnVpE9ZJWQlB3R1xX84V/uc06MBVqEJp7FQ8vdXobk5h9Ono6oQCjFilSefMlUbCIwVXTlXeoSOylRlhVRDkacmXScKY3NljJbxHNQEi6R0TxZVZkV5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713897714; c=relaxed/simple;
	bh=rkZmDBZZcJhVN6mPuWy4uMyeYcqDYd3E+rQp4e4pMmA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KOXmBm+RrOMfP7BcU18yHPJPlW5JrBk6rP7HfWgbIOBrwGhHjXVCmAqy77DH3Fp9bjIxiDrurCsVqfL6BdIMSsvEElPK9J0RtpDEBsP/iNOt7Q5JHyjkfLfTnDISVjkHyK2GK8tHSuqEBQ/xg9OREnd+jS8TA6gT2azcB6s/PZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OnnYSVgc; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OnnYSVgc"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-78efd533a00so404903885a.0
        for <fsverity@lists.linux.dev>; Tue, 23 Apr 2024 11:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713897712; x=1714502512; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rkZmDBZZcJhVN6mPuWy4uMyeYcqDYd3E+rQp4e4pMmA=;
        b=OnnYSVgcK5AYM3MBBeJqGGafRW2mW+RzPGZn+f+8khWVNi+Sqq05kyTijRhd2tieOm
         cNSrfx2gIrIDYe9atMjFh33jBIwvafNBXarLV+qcRPAVmPISnTfx+Q5nuoP/ROnWPpHo
         Xq1nGE4JXw2z8a5ukAzqfhpBgBJESI14BlvcsjHnVdwaZSkcWpCJfCkcTfOqI+Lz4XJ6
         gpnGJkonO+ornqn5h1jcJ4MPIqKb4R6mRSyO8RR9NIWUZ4Tr2B6jjQgg93tyyGTTG3+V
         5rOYHFDo111D9jMmBytzn9dLkDF5bbvJLsMzVDMuIGckdhst32E5geNKlPCI30zMGvlV
         +e/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713897712; x=1714502512;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rkZmDBZZcJhVN6mPuWy4uMyeYcqDYd3E+rQp4e4pMmA=;
        b=D8b4bpkCWljUxEWuGUv6jwV9DA0YoO3Wi0LioQtGnOCUZt+ahwQ0aKKyqCqS3Vhi8l
         cbBxP6FLqyY4MEnQd9hGsyw6owjhCUIUie7a+Gf1YtkMu/SN5UnseKYCAUGgWt1aTICd
         H4tBDR1ZWHvXpgZTZXFkylQ7iLd4r3/oCmgWV9bK42jRBmOsUgWtqvXVfb8uXwM69InX
         cQ44XdUEB0JLqRZmvZoyUAEhlhTssEzkVbjIzzR5RusqyutuM3RKG+4b5ripAOIytK4j
         rYnDYg7U7qy43H2Z+UDpUaWN3BnSSHz6tOEeNzA9b8MlJSEkvKEZbF+mMY932BNDTFYE
         fe1g==
X-Forwarded-Encrypted: i=1; AJvYcCUEzhgPPYTAHplzpM/RYVpJ24Zxcf5/1Mhzr/mDNmFIu9HO4qqCetzjOdoiUrt8/wMXK2xxsJVHiAgJthQt7CSrVQLMSsXd1ck=
X-Gm-Message-State: AOJu0YyrWs6T6VHNOns5rVVzNUmcjTJeBnUoP8NI9lFNbs/jUqGfFNeS
	oIC9SIm0YUPIFhKt38mROJcBlvccBdaPWJZsaJxiPErijM4jrE8BQKjDTaN/GljzMLCNwmkIAjF
	TSyQ/S5mPRynL0jjV61FzVfC7s/1BZILbPo7W
X-Google-Smtp-Source: AGHT+IHkHCY0nAsTRn0X1AxyqTY/RSGMHd2W96s8+CnN0R0bF8TOmL0E6rUwoyEuLSPM0fhjc1ltCOp/0oJQdiys1B8=
X-Received: by 2002:a0c:c591:0:b0:6a0:5f8f:d753 with SMTP id
 a17-20020a0cc591000000b006a05f8fd753mr190211qvj.49.1713897712026; Tue, 23 Apr
 2024 11:41:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240328205822.1007338-1-richardfung@google.com>
 <20240416001639.359059-1-richardfung@google.com> <20240419170511.GB1131@sol.localdomain>
 <CAGndiTNW=AAy8p6520Q2dDoGJbstN5LAvvbO9ELHHtqGbQZAzQ@mail.gmail.com> <CAJfpegs=J5x_0DfiiXcEtsRxkoVq+ZGv_FhxFo9Vk8B++e_P3A@mail.gmail.com>
In-Reply-To: <CAJfpegs=J5x_0DfiiXcEtsRxkoVq+ZGv_FhxFo9Vk8B++e_P3A@mail.gmail.com>
From: Richard Fung <richardfung@google.com>
Date: Tue, 23 Apr 2024 11:41:13 -0700
Message-ID: <CAGndiTNRvHGtYZ3-Q7TJDCAYcFNLTypzgnGf3bCcithjwKV0tw@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: Add initial support for fs-verity
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-fsdevel@vger.kernel.org, 
	fsverity@lists.linux.dev, ynaffit@google.com
Content-Type: text/plain; charset="UTF-8"

> Please verify that I didn't mess anything up.

Tested it and it works! Thanks for updating the patch
