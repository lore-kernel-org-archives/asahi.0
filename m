Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793345738;
	b=PrVYXFbPgqKFtl48Bt8qhWu3m4XEOuw2Z71MHPu7AmbNS0foUi7Z3A6FiFWDpFNYhw6I
	 rJmAaWW4wT5LnV7vA++aQMRea1yf8UjcQY7L09NCae9phz1jxkCgTlz2lmyU5L0EWwPID
	 K/W9nkj/YkE/K4yjHHhPygOmh5m1TRETmc5UQs6aX86o4h0pggwiK0HUVut2ioneKLQ3/
	 03Zr4K6aey9wVeWhZskvanvn9YM+BLJ6UtV51sUfOc9nuTMPxSiifpdiKJzC55Z7M1f31
	 ROOpthDPKl+s5QEkbYQ62ntrv4jv6q0GDpbKMt39IKdJlebSgckVFciM/cO44eXiKsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793345738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=eGiW8RvcVr3fwqj1crm//CbfJIk1OPn7AoDBhadQcmo=;
	b=R3qchHiBf3FA7M8tbVfsM6Y61OXZcwJwWW+ystaM1Ig5PMSuyZfc45MCRdgeyHh5VG6W
	 yvYk5lSzRJTNLlr+zI4WgqQfVtaRqC9QYsZwwyZVcWPifHzRklVCTkau6+Do5HU4Lr+zv
	 q5M+oRZzRQHCp0ordrjkBe1fT+HkXs/nEBhJbrfb6vmwQw0gXfDDpT09BwPxfiWoGJUVz
	 4A/+UyFXVJTMz2RHBj1ErVlNPYCVCPtQxlIBRpjge9H0tAFxtdNhbo89Uq+OwJo+Wcftw
	 Z6NogmBYqz9qh/W6wu5bsMUg3UvDUy19LpapHn1m4/ztDqnqpNlBYmDTKTuXMdk6Pww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DQCQUZ0d;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6611606A31D
	for <asahi@lists.linux.dev>; Fri, 30 Oct 2026 07:35:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6611606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DQCQUZ0d
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso60996466b.3
        for <asahi@lists.linux.dev>; Fri, 30 Oct 2026 00:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793345736; x=1793950536; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGiW8RvcVr3fwqj1crm//CbfJIk1OPn7AoDBhadQcmo=;
        b=DQCQUZ0d1tw6T+wmTYIoHzo4S7+RRiKLEUE/K2AABMSzg3K7zd6ofxMhU4GOKvjlS2
         4wjxJTtatBDM22asYcVhL2rN9M2/x0cay95AV0TTDoSHUvsBS0hPiF4U7AhqlIOuc2QK
         tS1pHhWMkmDpxEXbcKDjTiEodL2CqgpJc1bwUBowg3WhfG72KTc7SbzhV2VAVTkwCyEt
         cN3X2NWYN1nvqVRJlrSlFg+9g2G02CA5DUQRI49CsDKOLs5Zvc5kxr1zVsa88+atCiNO
         55P2uhjgXM5MxRpKcKqs4htoCkSyJSbDNDzU3lc47IDgeQ2xka+FbegzVKudCMDd4ZjL
         jtoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793345736; x=1793950536;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eGiW8RvcVr3fwqj1crm//CbfJIk1OPn7AoDBhadQcmo=;
        b=F9m1lImfyhWwwP4eKHlOfekrHhaglybdo9SiSKR1UyVhVnsCs/qkDqaLhQV5fkELtg
         iqOwkiTOOojHLXI5dRW4t7v5/jeBxmx4aEr/QeLFbCqSmmY9VUfoACDq+44wXTuJ7dMc
         whfN9sYCyvrR6+6FluIfEdl4CM17jwlwvwB5qLasClEHCBr3IwnObGLS8S7CBQq6ff/U
         +MKd6Ef7lSWg/hIGl47bCBtT2qrw3qQ3KpGa/GIY8O+eVHE+ReQfXynP1WRyRtXCLAFN
         2cu/q2q5AZhrqf6k7O2Ms9yOVtUiqu+WY+8osQYky2xSSxv1oj5UDksQuMz+Vs6/YLx9
         1mYA==
X-Forwarded-Encrypted: i=1; AKwUvBxTyjFmk2o5KP0sDnEL/RLcGMHbuU5RubrG/1IkY4bwaPkS3mGveoqmpt0kaltjPDyegI1UOA==@lists.linux.dev
X-Gm-Message-State: AFq9FYLtnDZPSiZsikokd5KIm7E3kVIqh0sQSnVG8zE4XkR8n0AYb0jE
	3rb7mGEW4u1KmiBjHZeMvk3Yfx0vmksBF5roRjNySaJU+WMteuUblngl
X-Gm-Gg: AYBFou2jre075DzPIp6B67qct9cl9msIxpsO+DRqfdgm7QJyDwxzAbbJkNI80JQu4M6
	Wd2+rveWF1zHAUamGNm8cjP3lNYyuw6L986AzZm12aL95hFPuuXbC/MI6TQsMuLAkBkxrizodBh
	mAyIIirMqjxv45voJ5+GnfR8qBUaZ/0zpORXMxWq+ytUPt5Ge+Aql4p6AqgoEO/3tS/jN1KXiWA
	09Bxliy2q+pu8APojs7Z+7S3eiBj3oy3RpzsR0DAVFRxKCJMrs2h7AAia9RSooqwkQkWg3WoouP
	81K6o2psM+O+U08z3R0amniJcgLcULf28rOmVwt4mVKIJ4GMHC55JrgXpdn/nAgB8Yd5QG4Hs6c
	1ONB5GZOKp3z9TWtRJNpLKGcwiq78fvWvznJhiVptsNoebHBI5UXkDxWJNfm3joxUFv92R3UZy/
	mUSEB/h2EqbIeXbHCrk9K40DYJ/Vcgj9c/6lKTYrfhCoDyIx0m5z5pTyVpq7sUyuwV0DWBTFZd3
	EBjM1rDq77xF8VgAAnZdl0mBliZW8p3c+ymml3vId9ab/X2CnSVe1iOm0p0exTjfX8KoLUAFqpr
	Ny5ECqAMynS4nogBhEibjnBAibWvFWgSU4dnHL1GqwUrUqjS0fUKTmx66L4ONu1laYtfckFj60R
	92SxC43wuzxULUDbkaaTSgIN8xObjmw4/ZxRVSfN/ktO14A==
X-Received: by 2002:a17:906:c14d:b0:c40:4f39:22e8 with SMTP id a640c23a62f3a-c4ca7acfb41mr120166166b.44.1793345735937;
        Fri, 30 Oct 2026 00:35:35 -0700 (PDT)
Received: from [192.168.1.229] (20-144-89-188.ftth.glasoperator.nl. [188.89.144.20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc1920csm34203666b.5.2026.10.30.00.35.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 00:35:35 -0700 (PDT)
Message-ID: <80246e46-8b9b-4cc8-b3a0-b07f9e5aaf8f@gmail.com>
Date: Fri, 30 Oct 2026 08:35:34 +0100
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: apple-admac: Fix position one period ahead at
 period boundary
To: =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261029105908.22809-1-sn125164@gmail.com>
 <E5478149-FA00-4A41-8CAC-7E8CF8578473@cutebit.org>
Content-Language: en-US
From: Jacob Procee <sn125164@gmail.com>
In-Reply-To: <E5478149-FA00-4A41-8CAC-7E8CF8578473@cutebit.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/29/26 17:10, Martin Povišer wrote:
> Rewriting admac_cyclic_read_residue to avoid the race altogether would be
> best but until then, your change looks to be a strict improvement.

Hi Martin,

Thanks for the ack and the extra background info. I would love to take a
look at a race-free version of admac_cyclic_read_residue() as a separate
follow-up patch; v2 of this fix follows shortly. A complete test setup
is ready on my machine that traces every position read and logs the raw
registers. If you have any pointers on how REG_DESC_RING behaves, or
already have a direction in mind, that would help.

Best regards,
Jacob
