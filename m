Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C576648B378
	for <asahi@lists.linux.dev>; Wed, 15 Jul 2026 15:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784130933; cv=none; b=b8YThV19Lf4se4ZVY2kR2PxhE66PvVOozTJg1Q4UVTvrK2Qs7WxOfkF+1iXXodwNKoBfd3f81LWti/BJt5Iv6R1VrM/hLB3kMWTq0FOFe3Fe+nwZi1OsSm5sb1DhUF01oCT6SIs35+aqSi4uJ/h1Aetlz3Rj+Mq3wD6ZEAVs0aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784130933; c=relaxed/simple;
	bh=IID5kgeurKnoekfI2FiPcWkF4NEcB7GrhvyOYE2CjyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HrrfDpdybrtyeR+GxqmxVZ440TCQyCJJ5BHyT2XOLJDBTnqqCowy0RWYgvF9qNoM1gG9UWEyulDXBd1xriLUSizVfYBaJDLx7/1l1nQzLS6UHrLQa1Z5RyCMXosYi9ifvJy/mujpSNJCfi7B4Tp9JEn7KAdZz7pryJtic2QNqLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=khaqxZPD; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="khaqxZPD"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c7c61b5292so32821755ad.0
        for <asahi@lists.linux.dev>; Wed, 15 Jul 2026 08:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784130929; x=1784735729; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mT1rikS6b8kB2u/uSUaszdBIfsLkUe2Hiqjm+R1lo7o=;
        b=khaqxZPD7WzCuXdfSF5WJJlhLR5WIJKTTyuR1yQFNG2IXLmVhqObeCfI8XkLf2Dwr3
         eRynL2MNdqZbk7jF+r5SU5aCjJ9GnglNV5Sj/PJyIi267vb1RO2IP+qy8nW8u82xkkWK
         I8BiGzAy/yditOMXHvq414zOtcVtNlmMES1amoK5eV808ps3/KHdK6z7pRDyeNuQ8i3A
         vgIMXRuhXUCr6RjrPrBim9n7ZmA4t9T/iCCIUUMKalTKDuL51XAWpPob66IHd+19ILRZ
         LytEQPEapYnBYRifL4cf7qBj3Ao7FiPip6gVm+BlnabyD6m/oBefZHY9VU+iVD09h9qN
         NxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784130929; x=1784735729;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mT1rikS6b8kB2u/uSUaszdBIfsLkUe2Hiqjm+R1lo7o=;
        b=A2nXxfBY8JbKmM/cOP4vTMtXnzHPTzzPYjjAUFSJF3ozJkEOhx7UyJDTepUQ6Pf/1D
         IedLlko4ShXgKpA5jtEW9GsAHGm+nGj5swtyIDoTEii/liFIMmO47cFuJaHb4llM/S+9
         NmqDe3dF9HfS8fvL9o+sK7+6UU24WRl4oetQ8XRslgZcqvTrPOjuCWhzEsrQNQ9xrzCm
         nEn1pp2iEUxK/XhxUcGQJqvZ/uwNUmyWRec9sfZ9vNFncK+SuNnIBhV+r1N4+ce4qC4w
         M7sGm6MXwu5kFbN8Lld+ZikQmTde0+Nid7o2yEb5RLffslE0uHZ2PtrpvDscF5Ln5/lz
         Or3w==
X-Gm-Message-State: AOJu0YzK/O0cL6ca2cvFw1lyRJ9YDYbekMvUjaq1GCMyqANuFEluS9GG
	yMWPwNVTrgqPBndeHHTc93aGijl8bf9CwOcaZkPn//8ER84YrUotwCB8
X-Gm-Gg: AfdE7cmwhcNJZH/CqYPYiNJRsBhlQPjxmru4pa6KNU/5pTHWnipSshspjo/iGSz89yH
	Q+GKaXcKz4FxXWoz14lEIXvFuFlvpPZtBVw8hBj4If6oRQ5sSQVQP3oCc68pQW5bW8Ex9HJ/QiI
	oGg1ZECM28P83dIrH/2RuOq1O3JGKnBrPm5F5N4G/py3w+NXQsNp1Y/J2zLhXW0wWm9FjjEx7Vw
	FbkQaagn7UvooYjEJg3usUQNCWgZi99bMB33+4aNCsNdd3vIQ+CEnEMlH5Az3B2FGdghinTQ+CQ
	FwpK6ee8MJbTs2gnELpuP/WFn5HBS82U3GwTcHKU7QvfjkPUV/55UcSspQ9eFbB6KrOvhzLw9WF
	orf/d23+2f2N3JM7+81ZUmTDaWjFSGuxkynhSpHQTnke8I6nfuUbR6Qb2VMSHpabV+PgdQMEwxi
	VUCzjWY5MbnnNrHJNMXUf5yQlgDU2hi8GI1Z4iQTIgT8eFPbckVtIP4gqjjWNLKw==
X-Received: by 2002:a17:902:d990:b0:2cc:ffa6:4622 with SMTP id d9443c01a7336-2ce9f053471mr176948735ad.41.1784130928644;
        Wed, 15 Jul 2026 08:55:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf105bc642sm4637235ad.63.2026.07.15.08.55.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 08:55:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c2bbbd1a-a188-41f0-8225-65ca52ee3afe@roeck-us.net>
Date: Wed, 15 Jul 2026 08:55:24 -0700
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/10] Initial Apple M3 Pro, Max and Ultra device trees
To: Janne Grunau <j@jannau.net>, Sven Peter <sven@kernel.org>,
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Andi Shyti
 <andi.shyti@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, Sasha Finkelstein <k@chaosmail.tech>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-pwm@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <20260715-apple-t603x-initial-devices-v2-0-df65b2485710@jannau.net>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260715-apple-t603x-initial-devices-v2-0-df65b2485710@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/15/26 02:11, Janne Grunau wrote:
> This series adds device trees for Apple silicon devices with M3 Pro, Max
> and Ultra SoCs. The M3 generation has fewer devices than their M1 and M2
> predecessors. The only non-laptop device is the M3 Ultra Mac Studio. The
> Laptops are the known 14 and 16-inch Macbook Pros now with M3 Pro and
> M3 Max SoCs. The M3 Max variant with fewer CPU and GPU cores has
> additionally only a 384-bit wide memory bus instead of 512-bit of the
> full M3 Max. It has a separate identifier (T6034) and so there are six
> laptop device trees.
> Another difference to M1 and M2 Pro/Max/Ultra is that the M3 Pro is
> distinct SoC design and not a smaller M3 Max. For this reason both M3
> Max variants and the M3 Ultra will use "apple,t6030" as compatible
> prefix. In the M1 and M2 generations Pro, Max and Ultra SoCs shared
> "apple,t6000" / "apple,t6020" as common prefix. There is currently no
> known difference but M3 Pro and M3 Max are not as closely related as
> previously.
> 
> This series adds the same level of hardware as the base M3 (T8122) has
> in v7.2-rc1. This includes CPU cores, interrupt controller, power
> states, watchdog, serial, pin controller, i2c and the boot framebuffer.
> This is intended as base so that support for additional hardware can be
> added to all M3 based devices at the same time.
> 
> Merge strategy:
> Since the dt-binding add new compatible strings without driver changes
> it would be preferred if the whole [1] series would be merged through
> apple-soc/arm-soc. This will help ensuring a warning free
> `make dtbs_check` for followup series with additional M3* hardware
> support I hope to send for this cycle.
> 
> This series will conflict with the M4 series [3] sent A couple of days
> ago. I would prefer if this could be merged first (in order of SoC
> release).
> 
> [1]: I see that the M4 watchdog change was already picked up by Guenter
>       in [2]
> 

Whatever one does with individual patches in such series seems to be
wrong. Are you saying that I should drop the M4 (t8132) patch from
the watchdog-next branch ?

Guenter

