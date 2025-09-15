Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15A22566
	for <asahi@lists.linux.dev>; Mon, 15 Sep 2025 23:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757978307; cv=none; b=Ychd8qCbq4O6sKSu3Z0kF5fCV8f1x6DqhwQc6+8Q2vowKtY9BdZaQJVKz8ZbYUUD7cbdqPjL5HLJ/4TEa0ikXke1PqqIDUmQh4HWMLM3YJi2Pw2lBsnC2NVqhUlZrF3FDBpE3vsdIO42bp6/Hs5TieHn5rTBb7cmp50uSSjVkyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757978307; c=relaxed/simple;
	bh=DhCA90u7D3AwaG1VR64HFW/35fMpdcE6pkDbJ0hCWDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WWzy6bULaqJ+ZDvORgThKM5doBcXz0ZXlggasBPoNu6WFKVi4n4gY65BBpi94+KR1DDgtmRnC8Q5hZx9yuIub1j03toJERIU5aiTq9sNice5QXW7y4vCE3V964VuPjfXH340JxWCZjqvpWSWj4rgfUq0XpdPiMjjMquXshuZT7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FBvcJbm1; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FBvcJbm1"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so4471807b3a.1
        for <asahi@lists.linux.dev>; Mon, 15 Sep 2025 16:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757978305; x=1758583105; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+l7LUQcajOsjM5wGJwbkfQJik4Yq7alB7BOereQy2VE=;
        b=FBvcJbm1dKMi62TQ3A5YjOHL9JTcdSbQxaysE9GePjVd6f7WUDRVbbL7p14uvM6c/l
         BvsAhEr5Lkj9QMVFUkgcGBJ1BVlEz2Lw9KbKRSjKqsfdmDebM0ieqK8fA2wwvqxiRCHg
         DRIX1TrWXXFZaFRMVlX6wOs5bBNDtdwfUTNuY+GYW2pvM7UKoE/r62kXYpoSZxRpCNu6
         t8ozl7kWQUI+BeNfWQLcPUVpUy3AuhwGvfHrmBexdDQsEpDHW0AGXcF+GWmH2GVoSEcP
         BvG0BjovDRTfOUplw0MAetJQyiHcqs36UkyigkG47tDQutTmwT4GpUDV6zcaJjChJIIb
         H7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757978305; x=1758583105;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+l7LUQcajOsjM5wGJwbkfQJik4Yq7alB7BOereQy2VE=;
        b=onl4QA2EOcyLVT6vQzkXPai12d60QyE6J6zSs6OGyduawPAxy4beDPt9ACzM6tM1L+
         N2oeWKE0ReBELZvKceNjKzjoGcIeIY8c0sdVqnF2R9Pyv3WHsqovie2tya7vFZmBTURJ
         aLYou6b+pvAROe+ls677W/zRoIojJXnLTrsPgo25RHO5rvQIpFfJ/0gd9eFFjO5XQSCK
         nFmg+IApQSbBTL90sTJy8dBIYm5LIMELZvUwJVUMZTvLsIaT37f7lYx/qfI7shk0gHJy
         tCDF60JSXlhZ3YxZn4SDfqjNDqPyRI/sHT6uT11QTX6byE/VJdCMv2RpxXUV+GymzNv5
         6NFw==
X-Forwarded-Encrypted: i=1; AJvYcCX6RaWzDT4iZRdIBRevrPygYFQPV4m81Xx1TflHXq5Zm32qmNmcPOKILPRMMzMRsiLF/Lhr5A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5g8Pl9UcXoCUxhr3VBdfpadMO7U6zlAmgPWT8kxR4/antYNyx
	nwd2cYb16m6a4O7M5TLtQrwHhVBaaKWYyEijq5b+/JUO/ZGF3qXQICF8
X-Gm-Gg: ASbGncsqA9LMF/qjSqx/B3RSqx5isAh3/gWHrmDGGoj3Ojx7MICAzJHc28qt6hNSdA5
	CS5OD8i7w9aFy5U/DqDZT3++1aazqydDmdB3bVfuyPUrNcLESKFjPy2Z26f2ZpNjb+tVsSxrfE/
	EygZZeKg3Cz2oZsW738Tj1mscoxxhgX1EgvhoJvp2KnZ30vLfYiXZzBzgRyYUS5N4hXWF6XRs+Y
	oaJpO7VZFFF8LZWgmF3+jdkep8JLhu5RWKbH3k2GL8h8VxO+7ri0ENsSJkUZ6iWvPhZqk5RfhHE
	WrwdfSFBYAkh95vxmTJfweOEmKxoiyDcj6TICXf8TskJuG7AH5h9NvUaYVh5iyd4zocvwKy+byG
	+v+T/RxJUYCM1cvrwSeKrNzpgAnqoJyQ66iLtXTjo9rJNl1msohi22dNxV7ek
X-Google-Smtp-Source: AGHT+IEeWggDjh2aRCpx1suFPoqcxzvxrWOO8w9b7MPKM4IOfFG1MlxM/2ym7uq0iEUOJ01ZQNukyQ==
X-Received: by 2002:a05:6a20:6a25:b0:247:55a7:695a with SMTP id adf61e73a8af0-266ed65b2b6mr265970637.15.1757978305237;
        Mon, 15 Sep 2025 16:18:25 -0700 (PDT)
Received: from [192.168.1.105] ([59.188.211.98])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ea0859e20sm324333a91.0.2025.09.15.16.18.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 16:18:24 -0700 (PDT)
Message-ID: <2fb684e0-449b-4377-81a5-5be03cdf3e6c@gmail.com>
Date: Tue, 16 Sep 2025 07:18:20 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: spmi: Add Apple A11 and T2 compatible
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Sven Peter <sven@kernel.org>, linux-kernel@vger.kernel.org,
 Janne Grunau <j@jannau.net>, Stephen Boyd <sboyd@kernel.org>,
 Neal Gompa <neal@gompa.dev>, devicetree@vger.kernel.org,
 asahi@lists.linux.dev
References: <20250915-t8015-spmi-v4-0-758620b5f2ae@gmail.com>
 <20250915-t8015-spmi-v4-1-758620b5f2ae@gmail.com>
 <175794440092.2724212.9818605948916059174.robh@kernel.org>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <175794440092.2724212.9818605948916059174.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Rob Herring (Arm) 於 2025/9/15 晚上9:53 寫道:
> On Mon, 15 Sep 2025 09:52:24 +0800, Nick Chan wrote:
>> The SPMI bus found on Apple A11 and T2 SoCs are compatible with the
>> existing driver for t8103's spmi so add their compatibles.
>>
>> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
>
> If a tag was not added on purpose, please state why and what changed.

As stated in cover letter, the tags are dropped in v4 because the dt-binding patch has changed
significantly from v2. (really should be dropped in v3 though but that did not happen). And this
is actually a different patch from v3, the only difference is a newline is no longer removed.


>
> Missing tags:
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>
>
>
>
Best,
Nick Chan
