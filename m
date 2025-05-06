Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D75E24A064
	for <asahi@lists.linux.dev>; Tue,  6 May 2025 12:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746534715; cv=none; b=oKqBlc4vhZwuxH17iRWOdd34kUO0KdccgHpsTi5DbnnXuFTfuCTrwkcMJt2csE4piULiMCTlCgjFSxjzpNrLIS/PmBiXykdqaeehFNtdJmdpkfSsDRNrDZ/hEwjXWREzJnZ4C9S/1BospNI/QR/kEA+Wk+MYLWVkVw3vxWyU++o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746534715; c=relaxed/simple;
	bh=fbM50uctibnlw/qbePGAcHei61hqCspesv5iOU3zdbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TCE4mOmjEF/XsbMnupo4LQm7zP6Ci1kqe469Newt5CW6/1JJNsVz3XMiiAhN2kHWTSvJOgAI4EobwmLhG69HLm+Q+izWoEPjV58/hhd5xH7epdPqsIUSB9V0SBGzqLoSj/JbVm2jLsAa/r2127wTwHKZslJ6DMYQnyoIwEBlT/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UuUGDIDg; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UuUGDIDg"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-30863b48553so6075321a91.0
        for <asahi@lists.linux.dev>; Tue, 06 May 2025 05:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746534713; x=1747139513; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=8idUtLLebZkZiwySpCodlAhE9dZe3P+VXk1B2OGGqzg=;
        b=UuUGDIDg3pX02cCqu+5sDNSvNMPl3i7vDr3/aoOUlIDNK8ac8JCh2vowPHJIMSDn+E
         XbH4Bjdb3Q6u6BG9+ipAANOLJuywcXfxK/nZFE/EnwuQSRwCx8ZC/B2B9XQXCMCA+0KD
         nSxU6TOmeWyazaL+JG7fqspxu9sjXaN26OXsov1WjzukNvZAJKtJBYzB21Bc7MgX0+LJ
         f9+M6B3qb9/iHMZhkY4fncYi7koLdEg+Pks03aSZkN2pxGM55LXmBFK/zjJZysAwHMLt
         OCNFELoCtXRMMH54+0E39m8KMc1T55zuWMVw/5h4tqK81/9S5EYng3NZV2HQmxgOkFM+
         9P2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746534713; x=1747139513;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8idUtLLebZkZiwySpCodlAhE9dZe3P+VXk1B2OGGqzg=;
        b=lyghRsxxuZ5/VYIU2wefPl3KatF4513n7QYukZ4MZtNihOV1M35tlvvxI8A/ghEMki
         sdBzNGIq3kLUUmIQ1CA5svuOInimmVfozbAYxGqALj7Mcav4G9hIPfQWpfevU1Kf2vQ6
         Nv4cVYKmDyzbtnI9yYWcOnhn6OgqzGkogwdsE7LwAIeVxtZKDWVrOWd8DypRvaknlo4e
         iLs6jmNsDunQ0iFb0rP2kdA0UGfQrN1jw1QqfiW05qUbn452EEpcJlEFcEbvcXMKbaKe
         dA9Kis6VfAkqYJBa/qoWK/vQwb8lXVMh5SOPWQYcd5UvUzmV/OkR88Iv8UBHQJKc4fxE
         uRaQ==
X-Gm-Message-State: AOJu0Yw8j4O8HK52mqNt/N1I8QeLHw+lW3N7DM7R0p/lgOGdcEIV2Q1I
	jdcOut5tv4g3ExovV4EVna0U2bmBOd9eex8bCKOyj3ZSTw971dC2
X-Gm-Gg: ASbGncv6urQoo52WQh9AUQV0vyy/GoESYTf5kvXku/ATCIR1FAYfM67gRBAE4ISFcSw
	6VQUrGAPOIE7BK533LqLNwDGJzCapIBRmf0Vlkoehse06WCsIWHXTs5FBQjIX/N6X6K4oF8ozVk
	id8jdZsdwBINbQVOdqxYth9tD6SFv//qpgsiPEu6/sMuNYUPviFoUavqWSbXy1jGhU9K5lQ2aBE
	QqyzRtxKxe1Q7ACzkr6UjjzVC6JIEMehEeVZLIU3iohwkBZaVZk7yhPu5pLklNHeCPPog7cgpBr
	b4AhrSHJ8IIH4lfAyg+DtDZq1zwgwO7yOwHADCQsMVp88pzy7v5bBmfLMUDLbJ1RInziaTn/0cB
	j+OikKnbOHBH9JA==
X-Google-Smtp-Source: AGHT+IF1Bb1rptBpuPdUkW2OAkIn4AZYn07KmyxeIsJrvEXJzqjsDaqivcRJcoWPQV5mBelNcvBxvw==
X-Received: by 2002:a17:90b:2552:b0:308:2945:3842 with SMTP id 98e67ed59e1d1-30a7bb0ab62mr4671711a91.15.1746534712352;
        Tue, 06 May 2025 05:31:52 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4747719dsm11060910a91.19.2025.05.06.05.31.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 05:31:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7027fc8c-80d7-4d52-bf94-ad282d66e729@roeck-us.net>
Date: Tue, 6 May 2025 05:31:50 -0700
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: apple: set max_hw_heartbeat_ms instead of
 max_timeout
To: Florian Klink <flokli@flokli.de>, Sven Peter <sven@svenpeter.dev>,
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250506120111.5041-1-flokli@flokli.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250506120111.5041-1-flokli@flokli.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/6/25 05:01, Florian Klink wrote:
> The hardware only supports timeouts slightly below 3mins, but by using
> max_hw_heartbeat_ms we can let the kernel take care of supporting larger
> timeouts than that requested from userspace.
> 
> Signed-off-by: Florian Klink <flokli@flokli.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

