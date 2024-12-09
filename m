Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3070A33F9
	for <asahi@lists.linux.dev>; Mon,  9 Dec 2024 10:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733739746; cv=none; b=WEMA7OSYl3PIblczNLJ+2c+cku7Mo9GC15ED9mQXMZw9UGInwCpInVA9mkeqloXhRZW/acF0RWiqKKCYfSUrt7oMXzmMyiniXkFDqez55WskujKTkLJD6OfgxNnao4ea9sB5dMFky3z6PuGFegTnJ7QxyqnH7cezTbSwxsOAxXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733739746; c=relaxed/simple;
	bh=psJ6EdfRQDJJZjbhcaypGTvllIk2NcKhIpZ9DYRkbhA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EDvLa7QoT8nCly6ZteNYF+gYORos1V9L7rKgGsGP9uSoDjI5Yal7xVnCrTzmky+zdtnk3qN4HfaNdQ59hpasiMH27Cg6mg03VGWmSyLTbUdEVItaf8ilFY0BTdX3zqkv3qGWLgDDtcC4sa38u02aosGnplISI8PmVcIFSARdmlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZICqlAj5; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZICqlAj5"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-725ea1e19f0so628452b3a.3
        for <asahi@lists.linux.dev>; Mon, 09 Dec 2024 02:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733739744; x=1734344544; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JK+YHbwbzYxN2fA6jQpylORDnONEVEdYkbUHx87yE3E=;
        b=ZICqlAj5qs9ahxXiy2Eh1gNR5A/M5bB7yASSR3D+O0AB0IY5vfx/g5lfeWLLBmnZ4R
         +7VxzRcKKz2yO9JJV85IbiWAqZ13K5dXm7z4NpTkBiAlkDJlG23PHgJyqwV+sSf+N5hS
         ONMKGYpBX+nQqY5EHBfnHbAK2YnkiUI0l0UmUKhP5ojepnOqaUAOAOJhMGKSZSyYN9OE
         6JBUXgeber7AIzYphkSH5p4yRDKHodsH/XNe2qlQmOzjtLm0nDhi8kL/gcFunoCVmecc
         WwW1g55g4NEzj5VlJq1qJj/880xwhswy02rRyKOpJ0CMcuUard6UW4z18GCJu86Val2k
         wxRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733739744; x=1734344544;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JK+YHbwbzYxN2fA6jQpylORDnONEVEdYkbUHx87yE3E=;
        b=YF680fbzOra5iCV2f2m6LSaRgU9nifioli22zfzYgkh5uLO4DJbWnlcPzEzrgtTUp+
         Fur+sBfvLuH6HmL251Lr8df1+RUgtddDNQpKsPCMteBfCD9qSKRI4CNP78GNWbSnkF7h
         XxmzDazvi/0+NnNO2Y2stPWAw1PSMln827sCZrJw2+a6lZUjsr6CN/cxkLDNFNqsYUkc
         QrOLQOYEa5zeLLRVeN69b9BLVIOYuOKaWyv64+taiYo36+wa4ZyK33UomcOsWz/STjY1
         TfPwm+Vj0DH4oRfpMTLQJoaUSBZLO4g3JwjWe+CyY+WVdM+JwsOQB2qheIEmX79szceg
         4y0w==
X-Forwarded-Encrypted: i=1; AJvYcCUH0kxB/iem6e9o/e9Mu4BxW+bNzW5KliOxrQI1tIKE8lqwfPG1odMksyyd1eRiX+YpV4+BUQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyoeqnIzhAlHiATchF1EDDYyK7+w0pmO3hzgXDvrv5oRGlRLNfX
	kAg8ynTdKYoeQlH40M44YG0op5/knQYJQcLCIhsFZUdlxJxHnbcPFtHkJw==
X-Gm-Gg: ASbGncuv4Q8kL7vndd3ODO4r2FQoH9Chov6bSsKT+eXKK1Tp60RfuduldcPX+GUe0Zo
	5Gp36PGQVhnkvLk/Op6yt8DiPGItFWNQBIJxxIoi0kcZUxxoh9ZMiIIxe1YzzZWqbbFlQUew6aC
	e4IrE8Ek3nqUpnxuj45F8dRiHIqeWoQM7LL3NY/6n5urFltqDApH2Y7e8PetxaE0RWjvFIAR80h
	ZbhdYk5CRZA9SZ3+WwQVGt7MF/l68BpbZCkJ4xBmVwQ1PpX0MmRpFZc/si+Ua4hsEjO
X-Google-Smtp-Source: AGHT+IGIMaQLW4wct1dsitCDskJol1qDWg2mfuDdPh8GMuIT847eTTcppJMdsxFJj7Ut8lRt0yTYLQ==
X-Received: by 2002:a05:6a00:4fcc:b0:71d:e93e:f542 with SMTP id d2e1a72fcca58-725b820b43fmr19800743b3a.21.1733739744446;
        Mon, 09 Dec 2024 02:22:24 -0800 (PST)
Received: from [192.168.0.115] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725d6856bf7sm3620294b3a.192.2024.12.09.02.22.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 02:22:24 -0800 (PST)
Message-ID: <e06c5d7c-de3c-46ff-b2ee-8ed794577e70@gmail.com>
Date: Mon, 9 Dec 2024 18:22:17 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] backlight: dwi_bl: Add Apple DWI backlight driver
To: Krzysztof Kozlowski <krzk@kernel.org>, y@krzk-bin
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20241207130433.30351-1-towinchenmi@gmail.com>
 <20241207130433.30351-3-towinchenmi@gmail.com>
 <bqn4tddl3kgle7zlamgaqlh45pizw6gf5qjwlmcsbkb6fx343l@tf5w63xursi2>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <bqn4tddl3kgle7zlamgaqlh45pizw6gf5qjwlmcsbkb6fx343l@tf5w63xursi2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Krzysztof Kozlowski 於 2024/12/9 下午5:22 寫道:
>> diff --git a/drivers/video/backlight/dwi_bl.c b/drivers/video/backlight/dwi_bl.c
>> new file mode 100644
>> index 000000000000..d4bfd74b3129
>> --- /dev/null
>> +++ b/drivers/video/backlight/dwi_bl.c
>> @@ -0,0 +1,124 @@
[...]
>> +
>> +	dwi_bl = devm_kzalloc(&dev->dev, sizeof(struct apple_dwi_bl), GFP_KERNEL);
> 
> sizeof(*)

Ack this change as well for v4.

> 
>> +	if (!dwi_bl)
>> +		return -ENOMEM;
[...]

Nick Chan
