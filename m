Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9F51C5F12
	for <fsverity@lists.linux.dev>; Thu, 23 Jan 2025 10:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737628375; cv=none; b=eGQp9TZCcVzwn/j4uAWN8IEfYGxTbaLOk5h0g0irvns8LVIr+KJi82moLgjRnGfdg/YymNPW5fahuDCRYChUPp1bFYsROBLK9q6HLAUXXu/gDYWiEA1dDyS4WHIXkRrXVj/fc/F8WPIx65GMbvCndyiNParG1xelDZhtx9SGKrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737628375; c=relaxed/simple;
	bh=fUjYXP1ghIhLf4LpeZ6qQoP65efdYKeEp74w3XeWh60=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=D6nHmsk186FO6a1DEkBiR9KfHRM+omMWvB0E8zKYrKGTpaqOWnJ1BQoH0D7q1ENJ9Ac61neJ+kCtDmQsmGKo/CKeDzxxCe3t8bu0ydhzZUGiQsxIat1AfkGuIGJkILd55S3Ej8hVxGzJy5JCBBQRdNHHRQWb0aPyX3ynE91/mdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=b7DaDrN7; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="b7DaDrN7"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50NAPow8022452;
	Thu, 23 Jan 2025 10:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=ZRksMEmDRxbztI+Nk8RFmAdj0qt1
	+Vvr1VSURMyxryY=; b=b7DaDrN7zBXfF9xBeO7/2vdQI//lAe2KDYxNTvUmqTMf
	9e/U8kNSBKPQ2/6IS9bzlmeVm0DJDP/ZJgVVcy2F4AtTU5THHyzsICRWcCZr0513
	tJPV5KaW9ncDFZjiJLPlAUyH/50e0VpPrbCnZLHKdF6WatwvQL3vxUoUP0Jp9ji5
	Ho9Q55I0JBCFridJDwqLcLVB6URoF8bKFP9wag5WHha4A8tri7bfokYhunsHhd8f
	cOgE/csmyFYzdAhrYt0kmDr//BmPgQMY2Jix6n+rZNGyAbSovjFpaFOPUMC0rS/P
	HgTczJJUi0V7jQa3cGxRnfJ+NPpEKbhoux3EwAsX3w==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44bbu9aac0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 10:32:51 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50N8DPh4020986;
	Thu, 23 Jan 2025 10:32:50 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 448sb1mqhc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 10:32:50 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50NAWmcu44171578
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jan 2025 10:32:48 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ADD092006A;
	Thu, 23 Jan 2025 10:32:47 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A2E220043;
	Thu, 23 Jan 2025 10:32:47 +0000 (GMT)
Received: from [9.109.217.92] (unknown [9.109.217.92])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 Jan 2025 10:32:47 +0000 (GMT)
Message-ID: <d42c3dd4-47b4-4e98-9814-99cd9c1d112d@linux.ibm.com>
Date: Thu, 23 Jan 2025 16:02:46 +0530
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Disha Goel <disgoel@linux.ibm.com>
Subject: OpenSSL engine removal and fsverity-utils compilation issue
To: fsverity@lists.linux.dev
Cc: ebiggers@kernel.org
Content-Language: en-GB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EuvR5ji7Cy3xNHhjgPYllDK6w5JDovIH
X-Proofpoint-ORIG-GUID: EuvR5ji7Cy3xNHhjgPYllDK6w5JDovIH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_04,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=657
 priorityscore=1501 clxscore=1011 adultscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230080

Hi,

Some distributions have started removing OpenSSL engine support, replacing
engine.h with an empty dummy header file. As a result, fsverity-utils fails
to compile with the following error.

Is there any plan to address this issue and support these distributions?

Please seehttps://fedoraproject.org/wiki/Changes/OpensslDeprecateEngine for more details.

# make
   CC       lib/compute_digest.o
   CC       lib/enable.o
   CC       lib/hash_algs.o
   CC       lib/sign_digest.o
lib/sign_digest.c: In function ‘load_pkcs11_private_key’:
lib/sign_digest.c:350:9: error: implicit declaration of function ‘ENGINE_load_dynamic’ [-Wimplicit-function-declaration]
   350 |         ENGINE_load_dynamic();
       |         ^~~~~~~~~~~~~~~~~~~
lib/sign_digest.c:351:18: error: implicit declaration of function ‘ENGINE_by_id’ [-Wimplicit-function-declaration]
   351 |         engine = ENGINE_by_id("dynamic");
       |                  ^~~~~~~~~~~~
lib/sign_digest.c:351:16: error: assignment to ‘ENGINE *’ {aka ‘struct engine_st *’} from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
   351 |         engine = ENGINE_by_id("dynamic");
       |                ^
lib/sign_digest.c:356:14: error: implicit declaration of function ‘ENGINE_ctrl_cmd_string’ [-Wimplicit-function-declaration]
   356 |         if (!ENGINE_ctrl_cmd_string(engine, "SO_PATH",
       |              ^~~~~~~~~~~~~~~~~~~~~~
lib/sign_digest.c:363:14: error: implicit declaration of function ‘ENGINE_init’ [-Wimplicit-function-declaration]
   363 |             !ENGINE_init(engine)) {
       |              ^~~~~~~~~~~
lib/sign_digest.c:365:17: error: implicit declaration of function ‘ENGINE_free’ [-Wimplicit-function-declaration]
   365 |                 ENGINE_free(engine);
       |                 ^~~~~~~~~~~
lib/sign_digest.c:368:21: error: implicit declaration of function ‘ENGINE_load_private_key’ [-Wimplicit-function-declaration]
   368 |         *pkey_ret = ENGINE_load_private_key(engine, sig_params->pkcs11_keyid,
       |                     ^~~~~~~~~~~~~~~~~~~~~~~
lib/sign_digest.c:368:19: error: assignment to ‘EVP_PKEY *’ {aka ‘struct evp_pkey_st *’} from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
   368 |         *pkey_ret = ENGINE_load_private_key(engine, sig_params->pkcs11_keyid,
       |                   ^
lib/sign_digest.c:370:9: error: implicit declaration of function ‘ENGINE_finish’ [-Wimplicit-function-declaration]
   370 |         ENGINE_finish(engine);
       |         ^~~~~~~~~~~~~
make: *** [Makefile:134: lib/sign_digest.o] Error 1

------
Thanks
Disha

