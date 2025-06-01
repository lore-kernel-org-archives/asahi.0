Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B761E9915
	for <asahi@lists.linux.dev>; Sun,  1 Jun 2025 18:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748804380; cv=none; b=A05f44SBrDgi4qcRHHbbIDMo1bfGBZQdLy+X2LRptwPCI1TtkRJcmuD4jmAmYrtmPe4RkQfnabKr6ddC6JAhGNpiFHxXz7Z+DnFmahht8bxAjmNrWPa1+hZCoLgTdx1AjTHTCcerZYTrGs3W7PJT72ir3/J05bVezzT+BwNh9Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748804380; c=relaxed/simple;
	bh=CYLV8wcogXdtY6I8xKrSP6yV3kKGzgHfcr3A9i96Yx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rzVPZWdAJgy+mkzzFEU9RdKYhZ6181RiGuuYoHP09Og9dBUSLiAaTNdSiBZyKhftihLYkGEL2rkNKgj63AVMGxFwF0qAiuxfw0QwrTtn4Unf+HOuUe6KiHhYInp9tIaD6AfhfVNRwQUiJmeKtM4phHpj+fHBRCRcuXzeT0KG1nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fkfKBZps; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fkfKBZps"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60461fc88d7so7310508a12.0
        for <asahi@lists.linux.dev>; Sun, 01 Jun 2025 11:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748804377; x=1749409177; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OIzFU3oveHSb3b2sYKrjUAfhi3Wxf+qS7iSQYpFodfw=;
        b=fkfKBZpsfRbMYTUrycnYVmvuVRhY9ehC7p72rwLO0UrgnNxPCiDmPVrIblmjPiQ5h5
         qSaZNAtceQE17zU/cXSMbtaOLzGuJIFx/uL4mMso6A+Q3p2sXHSpSwpNhBBHOLgCoX2H
         c26PZEPwDnH+mmhYT495kgCp3WzhOM1q582D1lvsGBS2Wecx5c8N8OgqPFPlHE2bL/SQ
         LgGjxj8ivWZ+g+FlSQNl8l2iHZcqzZYU5pm7F0KzGMVVn2OHi1kW+kBVA2ucizbtLZ7F
         qa1uw2EkYbgdHTvKFv9B9c7kCxT/NybUe2dXc/HhohjM2TL6e77EymzX81X771fnEDs9
         7iZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748804377; x=1749409177;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OIzFU3oveHSb3b2sYKrjUAfhi3Wxf+qS7iSQYpFodfw=;
        b=fj/3Ts3bRnc+v4pUSJDZ9Ua8Gz5zGkMhv2zO5IbPE8q1mHg8IPvUwEiiCU7vRIHkw1
         4S9AwDBIP1C1NHg56f6F/++GGAkuooFZeFAN4C8cNJXyVMsGPXe04d/WcLRP3eikwZvO
         I1DhQO8SlG26GHnIV5d2pm1diIH7UgDlsk9qQtXx3H8kUGQ5LPGRSv/IuQloYGonxY/9
         yblEwvMNurLAH6cDhVHzzXlkHm85+VjGt7989cR+IyX+/Dx6vJ3Hg4dAEDHUwq0QH829
         kfw8CtcR4ZHNVBfvBHJBYO1x1tAAu36BNLxqHu86rjlg6R18nKmzlXEW6jPU6ogIcMJ6
         YWiQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7u4OUmqslaPQpC+zedRRWmaBpB5+XVX7G8dMNiXLkI8GtVz80xqI3CJwenvwUH+Oq9HpGOw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxIbj+ugh29cDZ6iMfaAKV9kWOkA8Mfozu6qgZvQKZJU4ID3BI2
	w931lo2zF81WdAwPxj/PIhNu7I6Mbjk952Fmq5iy6xNEaHc6jMtL5goo
X-Gm-Gg: ASbGnct6lNe37TLCzGCi2+qABRVdlVIlajjUrIWswQughxC1RvITAHo3sa4cYvcT2fx
	pK+Qj0JUDD9BiiZg2kumynYd7ljUOL1Gwdj98f3RVgOqwxjD5z5pPqm3cF/S3H6ay6S6boe3uYv
	XcRgeaZJo40RFTGknpkQX5/Uom7p9nPZSl7O3Vr8jCfLkriCSourbS0Imt1MQ9D+2QTTipDw7Jm
	mqvAwe8eh+rKhnwf9MxQ03Mz5w3/xMbDskDAE2aaNgAgS3uupogO6tyIz8kH09fqd1uXOzA3PsL
	EmWRBlcl1JJZVxfAXz6OtAvcwvNJqBAHbfwjDJik+inhYFr8Ilcp4nAe43Hfqea+VofmwbEM1a6
	YnkoaGT8XAywyGoMyAirClGzjPyZNiA==
X-Google-Smtp-Source: AGHT+IEP2x5ZAxqIc1gsA4YFDwl3131Qs5D19FYWLp46cTsFeKuOi08zZGcuKt6dA7kp1G6jlmOOpw==
X-Received: by 2002:a05:6402:90e:b0:601:a35e:6dd1 with SMTP id 4fb4d7f45d1cf-6056ef00a9amr8866615a12.21.1748804377131;
        Sun, 01 Jun 2025 11:59:37 -0700 (PDT)
Received: from [192.168.1.105] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-605ae6eb0e2sm3059856a12.3.2025.06.01.11.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Jun 2025 11:59:36 -0700 (PDT)
Message-ID: <8d14bc8d-6a29-4317-9ee6-143a2919d17b@gmail.com>
Date: Sun, 1 Jun 2025 21:59:35 +0300
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/21] drivers/perf: apple_m1: Add Apple A10/A10X/T2
 Support
Content-Language: en-US
To: Nick Chan <towinchenmi@gmail.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250510-apple-cpmu-v7-0-bd505cb6c520@gmail.com>
 <20250510-apple-cpmu-v7-11-bd505cb6c520@gmail.com>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250510-apple-cpmu-v7-11-bd505cb6c520@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/10/25 18:10, Nick Chan wrote:
> Add support for the CPU PMU found in the Apple A10, A10X, T2 SoCs.
>
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>

Tested-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

> ---
>  drivers/perf/apple_m1_cpu_pmu.c | 127 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 127 insertions(+)
...
>  static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
>  {
>  	cpu_pmu->name = "apple_icestorm_pmu";
> @@ -1155,6 +1281,7 @@ static const struct of_device_id m1_pmu_of_device_ids[] = {
>  	{ .compatible = "apple,blizzard-pmu",	.data = m2_pmu_blizzard_init, },
>  	{ .compatible = "apple,icestorm-pmu",	.data = m1_pmu_ice_init, },
>  	{ .compatible = "apple,firestorm-pmu",	.data = m1_pmu_fire_init, },
> +	{ .compatible = "apple,fusion-pmu",	.data = a10_pmu_fusion_init, },
>  	{ .compatible = "apple,twister-pmu",	.data = a9_pmu_twister_init, },
>  	{ .compatible = "apple,typhoon-pmu",	.data = a8_pmu_typhoon_init, },
>  	{ .compatible = "apple,cyclone-pmu",	.data = a7_pmu_cyclone_init, },
>

