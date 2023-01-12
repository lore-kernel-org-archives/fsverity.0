Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CD718D
	for <fsverity@lists.linux.dev>; Thu, 12 Jan 2023 16:47:12 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-4d4303c9de6so97363057b3.2
        for <fsverity@lists.linux.dev>; Thu, 12 Jan 2023 08:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=contractor.linuxfoundation.org; s=google;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5tnxnGhfeCh9anRkbR7gFfkOY9k8KOjaPMN8uNJipIU=;
        b=NZzKRwExmfRtMKuihPdTrQhx6WiqlEazPWNaN/Aad9esZ05w2wCxpmdYtX9EwBBX9C
         yNgfK7PJH+uXj2e9EOtYofWjZcQ+byJ7zCIkQYmMjxt0YU6M88Q1p5dZWuzS2/aU3s4G
         5LeT+hcZKHpZibVMkTmSsWJrRGiGVKJqxyjmoNaLPi2rDhRB8Jp7jxj8ioZWpRS1XVus
         hfPk2z/HHKeLy08bpKhD5NtU2IQaHMpfTMbqFC+6Chx9UzjiZAP1j4Y0bX6xUs+3UB0K
         TBoTIgSav8qUJbcaDz8SOI/HSKp9QRMRVM382dJd8sFjOL1wzohUu8myd9gf3agCyqnv
         Oc/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5tnxnGhfeCh9anRkbR7gFfkOY9k8KOjaPMN8uNJipIU=;
        b=71gk1L/PnGa+wnNmPH2XTDP+1FTK4uVh5LaKB1tODX/AuK4kvz7ADJLa9atxMF2V9V
         VPePylyiViAa9cMnkJdiWSS1GtT2q7k3aZNcKLyKObzYxL1hjjAaMz33yhnGJnkM0rqg
         gFtESb5Q89raPjVZPdu7at/O/+l0Qvct1EnVcMGTR0gsfkW7Tgq4xFcTuBV9f4zGnZQI
         YC/EiaKMfAe7KsfDg/gBbd3sAiKVWYB6dsVrf9XDLGwievyjiNLpniUQHFSttoMY63yR
         6bskINYJkGXiFR55y4FwwYL3HyhJUpcndPGuQ92Amw9MK0+yMdIb2shyC91cGS1d5EZX
         OuQw==
X-Gm-Message-State: AFqh2krLnpMpmK4wMEIcbm+IfFbbCn1J+SMSjZDWd1DOWBc3s2lWs5To
	lCy3aeXtR1wmwhE9ygcNOx3G05Bw6obeJli/JhoJd3wLd6flnw==
X-Google-Smtp-Source: AMrXdXsZ34KDWgqTk3NM075ZjgJjgfs9S/a/2eJzcVlHDDk9SDyt8Vm1ucjDrw8+fHYhJMOyvCCc7TA426rfUZ5YpoI=
X-Received: by 2002:a81:ad5c:0:b0:471:d0:fcdf with SMTP id l28-20020a81ad5c000000b0047100d0fcdfmr1927714ywk.108.1673542031398;
 Thu, 12 Jan 2023 08:47:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Shyam Kumar <skachukattu@contractor.linuxfoundation.org>
Date: Thu, 12 Jan 2023 22:17:00 +0530
Message-ID: <CAH=dH99Cw8BCyRkKkwKACM2Tq0+J+kMvj5i1LatFSPgu0F9WFA@mail.gmail.com>
Subject: Test Mail to FSVerity
To: fsverity@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

This is Test mail.

-- 
Regards
Shyam Kumar
The Linux Foundation Core Projects
