Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B457845A295
	for <asahi@lists.linux.dev>; Wed,  7 Oct 2026 12:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791377663; cv=none; b=TO9ip69fV5roUQEUdRUFKGnNVrAFZOoaBCvLZIGmIuZ7pGLlpJXEEqnNCJtsIftKASkJ8Dqu7Bae/AbA0mw+Amn1KLgxVuxNPgODKDZf4eJr3z6yvywLL4mYEq8H9Dw41lZUqr+p3UGwazLWwHk7dpfZqmSWCINWDUprmYFvRwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791377663; c=relaxed/simple;
	bh=vQ5ti0IRpJKxnO/ajOgsAv5J3ZdzP6Vf+7alXOHlJ2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G7K7wk4sRa0FDY3Ou2vjb8BBt1gcLBbcWNm5r+/aUS5NQRLvuEYUVOIvNmXzTPHlYOcD7zJc3obNZe0eABaPBFCdIGKRaXL6GcROyRvWPWlUxLCgM3+C3N3sWckApL0iGNorhmLmZ1ZWOrh5RhnL7KneH0MYl/+lWM1osohAXF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=EkQ95eLZ; arc=none smtp.client-ip=209.85.214.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="EkQ95eLZ"
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-2e60f9af6e6so4513395ad.3
        for <asahi@lists.linux.dev>; Wed, 07 Oct 2026 05:54:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791377654; x=1791982454;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WRr2bOzV+ACM051eiPZmuzY0jHiw8RpNfmmijxyyZ5s=;
        b=Xn+mgZi1xKPiqxrGw78+pvuXoPO29R3Ugp4793RobnnVBlrVpdnEhgDpBSxae1M3HX
         t8L1lAlfkW46YIXSt6htc6zSLCwk2zQo3FULG0uhYuu5vcciLJ7FG6fIciq4IPWEkIze
         wis4/2jlbtnvBsjV/pXlSJvgvYpkFLTtMpUEd7YPZ9CAjI6ZIvmPz9ffCC6fUqMjm4XW
         Ui3Vi5lvg9xkKBh00I+MLfAzIXmWjGThzhRy8Yuz0Nc9YKhtlr43JNRp7r4eKiDKzW92
         w7v7c4w3NFq/xT2qfFV5cJkSp9xN+t6QJ6d61EvQSglCrN8hMcS0nzYPySVPhBOA/j1i
         x5wQ==
X-Forwarded-Encrypted: i=1; AKwUvByP5UsWpL39tHQoOvlnbjgzBrNVsVtXkHmPjZqjsVzr8hmlTlJ9wv/v1uFcpwVxsN9NT4t97Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYLo54mMU5IEPd+kpUHo9Dt+8EUeonshqrrkgZm08BR60gGDnigA
	g2X9SY6yQXvLnBjAnN5Jy3YUWaoMlr7dNL/0RQsBN4xNs2BkaZ3N+qsff7d70qJXUuLBjSmUW8V
	y93lzQRE6DGzNAR/2Rg3BEvY6Kc6tQ+CnzCtOaU8gdr9GMnUotbiYgXqeErUj2vmvQFm2FnPNnR
	vMpT/73AOeNx1Xcz5YuJKBsUM/YSQllFoe4VYK/YsY408I0Ptl+89NqDkupBjvQ8XxrxkWevU9t
	2u9SM1Ld5RbanjM
X-Gm-Gg: AYBFou0dZg3Eytr7wHLFHNznog9GospLFc4+E6mUfhMamyrHjjePkd4drRqchn/OC0I
	iuTJXB3x6Hroo6N7P9tiEm+uOUiuSw90IhEZJHBjxFkO3OvbZL84ajsxnSUACRJ8yLqKc7lfcsd
	2Os4J0sULBqd8qjEDuNUSHcVcWpogXS0fRtwjhJ16AQ0TMjEaQADVbrnLaForV4B/3JOOfQVB5l
	idsGeXpuxVC3Uj8coDyNWH4AAPh1EUk1Kxj7+IxdgocqqlePDltX9iWkb2u4HyIUAU6+1Usd6Ej
	UZfjZbt6zfcpRwyDA/aYOYpUf9DmFgaQ9Hrjc5OkCU6IIIKYRCSraqQNVX8yUAD8nIQgkYygBN+
	P4/GJKjJ/YUiGj6mCMOhH7ZwWY6MeAgPYJIT5C7+PdNWsdR55TK47xgHL9zGi0e62t3vgbuD466
	w2oJ6PUoKSKxIqGPPdbLNpR4jXJo2h6AM9Vx2vYIcthw==
X-Received: by 2002:a17:902:db02:b0:2e3:1d30:8654 with SMTP id d9443c01a7336-2e5ffc3b453mr21073585ad.10.1791377653745;
        Wed, 07 Oct 2026 05:54:13 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-124.dlp.protect.broadcom.com. [144.49.247.124])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2e60481edefsm822685ad.38.2026.10.07.05.54.13
        for <asahi@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Oct 2026 05:54:13 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-88c4da716f4so5331030b3a.3
        for <asahi@lists.linux.dev>; Wed, 07 Oct 2026 05:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791377652; x=1791982452; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WRr2bOzV+ACM051eiPZmuzY0jHiw8RpNfmmijxyyZ5s=;
        b=EkQ95eLZ03h1+2k8wHuMpy4hoZrEf4bFV+7JF7ISUOfoAKE2Ha6HPD6M1N0aBdTVia
         mH4vskyEj0nhfdZ+sIzNmZ1qGaLmZOCMx8/S5Mqbe7rWOZVnGWk6TKa8dLPPULoYzNZC
         8EozG0UMxYUwTqlvG/aWQ2GPs0VjrGjDmKd6s=
X-Forwarded-Encrypted: i=1; AKwUvBye5y5Jd5NHZUIgHQ4SCN7Zh/fOf6sINaNfEf49eMDNaXtQdwOCao9fzvKVG9n8MK79yfNStg==@lists.linux.dev
X-Received: by 2002:a05:6a21:3990:b0:3dd:85aa:452c with SMTP id adf61e73a8af0-3e134044716mr1756556637.30.1791377651838;
        Wed, 07 Oct 2026 05:54:11 -0700 (PDT)
X-Received: by 2002:a05:6a21:3990:b0:3dd:85aa:452c with SMTP id adf61e73a8af0-3e134044716mr1756535637.30.1791377651379;
        Wed, 07 Oct 2026 05:54:11 -0700 (PDT)
Received: from [10.176.2.78] ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd0a92d5b51sm1411697a12.14.2026.10.07.05.54.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 05:54:10 -0700 (PDT)
Message-ID: <d28a1cfd-1bcc-4319-bbbf-7189a1ff8dc3@broadcom.com>
Date: Wed, 7 Oct 2026 14:54:04 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/13] wifi: brcmfmac: Add BCM4388 support
To: michael.reeves077@gmail.com, Pieter-Paul Giesberts
 <pieterpg@broadcom.com>, "Franky Lin (Zhenhui)" <frankyl@broadcom.com>,
 Mathy Vanhoef <vanhoefm@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, asahi@lists.linux.dev,
 Hector Martin <marcan@marcan.st>, Daniel Berlin <dberlin@dberlin.org>,
 Janne Grunau <j@jannau.net>, linux-kernel@vger.kernel.org,
 Hante Meuleman <meuleman@broadcom.com>, linux-hardening@vger.kernel.org
References: <20260925-brcm4388-submit-v1-0-b5cbc2cde2fb@gmail.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20260925-brcm4388-submit-v1-0-b5cbc2cde2fb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 25/09/2026 15:43, Michael Reeves via B4 Relay wrote:
> The Broadcom BCM4388 chipset requires new PCIe initialization and
> firmware interfaces. Add support for these interfaces to brcmfmac to
> enable basic station operation.
> 
> This series adds:
> - Signed firmware loading and mailbox transport
> - Fixes for chip identification and firmware capability matching
> - Versioned scan and join requests, and extended PMK payloads
> - Updated event mask handling

Thanks for this series. It is taking me longer to review the full 
series, but wanted to let you know I am looking at it.

Regards,
Arend
