Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB7418A6C1
	for <asahi@lists.linux.dev>; Sun,  1 Jun 2025 18:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748804111; cv=none; b=nEAXg68uIU+nTXsL9FBn3BDtVZHpWXvKnirWuLJAcVcxJs28fjGUlPI62zm2WcI2AEmdsRomr48enWSq5kKm8zqFDLp12uGNkgeudWPEVF/BLXHvU8GvlS4faUkEXJc7m5e1hnGQIR8/qsBwI2BJMLaNllSgI7z60enfiuhqtNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748804111; c=relaxed/simple;
	bh=OX4yvUON3tISGUsgbOemPrVvgvCC4QWKwQAy9TZhFdo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CCy0nIUaiJEgRhTLH60PfvlQ34mBLXsAxDGjCT4gMFSZSgjgrRTSy5M+iZEfWEi+/KSm2S/W/0CNR9HdoDfJPXoH4htTjdR0fb0Z/VAnG9H5RK6WP8mpYtuqdCF8tIYXKSVaxZUeDj9hrc6F0yDdsV2xV5YWSxogT7ZqHSACguY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gA15GKrm; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gA15GKrm"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6055f106811so4773532a12.0
        for <asahi@lists.linux.dev>; Sun, 01 Jun 2025 11:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748804108; x=1749408908; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g+rZXeg2h8FFJjzzSKXnu2tsAZmNScsbIa1AmfrMPH8=;
        b=gA15GKrmW6xwlGz6iCXSMkdyeL9Y6BpltzNzO35VAqfGF/8wrJvgNhk/TXrP3LZjXb
         q3IhfIC+1dOq1uANR9D2dyVO6pygPKgKZm1Yr9IilHC1Y0JbAC1fjJy5ZsRxJX9OfuHM
         Kz5cHWbrO11rix8eR/L27WR/DPC1Xh35hUyor8rUByESsBCEGe2LIjUQ2cYRGdC3dn/J
         gegziLZ/1GyB9K1kCA+9Vp18pbPiK0J8KgpMLtZwXbt8n1mUeDqf1zxJMajzzl6+6vJp
         g4qp3ajQWJdTqKnYYAwZw2PGlDXGO85TSlni+y/MdudJ+wDNGZULqA+o3QYuTyww93fR
         orHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748804108; x=1749408908;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g+rZXeg2h8FFJjzzSKXnu2tsAZmNScsbIa1AmfrMPH8=;
        b=aL3jRg4Z3ZxD4TgVXv1zI1vHyjIVFgANc/Awp2W0b10U3UbKQhkzrzRbqF5bXU4Mh5
         EjRTvfpNJDoArJwub4l1aAg+XrvBpJS6XqS/0l12jWY8/2aAvaH4DxM3qyjAuVI9LZTZ
         8ypQuNHilkXjXiZjAxnlnmPwSetx2oorj80N2AQgQOV4soYG54zj+NSEJ495IRNPR1Ek
         DD4oNMwWIFAsC774yN6CxJocJizbrDoN58CvBNisG9xpmRZEbxLL++ft6f3Jwuy6wbk/
         OPIT6gKmhEOpU/wcREzqmMXlIOf29nlKFD0fqLxaWi9rjwmS7HeeFOaOC2nr13CCXbFx
         MkQw==
X-Forwarded-Encrypted: i=1; AJvYcCVQdKxJk30FMsfthSEzBAMyxlycdkA+hT9ypdL9bwGomGxc3thoRpScgvPpFv28tOLLGr4fXg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7t3O9hSEmJ5WrXD1cy/wi51PSNj5zivVOF9uuVoFLx7Mu8jui
	sZbFyn9nyVOyDYOTQ7vafvieovcxbrHfPbV5f6iJlgH3ss2Yf82F0W5d
X-Gm-Gg: ASbGncsiwfgVWT5ZCUwnlglL0sN0fB1fMgvnE7GKGWrERKfgyPt2lQjMro6C9lqhflW
	cbo5y3bgD+E7LOKXNQ5wPCGnY7KeHjydRCsEd7yUBUasnNnJA4OV94gYIlDfpra79NBVKJ7zG0H
	GgwfU8PXH73yDfvzuaLW65q7A3Uhk8fufuS5MYtnCx60abhvZQLpP7cP0Wz5dEGMrioUMSD32Hi
	qRvUFmeO/pxYvyZJnliQcbPxBG4q2exJsapi9+qDq8P4juft2yVrYLqOcqnBAgiPtu8EU975T1H
	1c0JH7I8myfLKLH+1GNqGgHCFIWMO4EOw8uF7hp1t06BPZMOBOmzSggPQ0TAyxbRT5OIrfYDSCJ
	j8eaqA0FQem59sZHWfOh1ySERV3hO2w==
X-Google-Smtp-Source: AGHT+IFp/ARVXyjA6tzOC4tGnmBvidx5QlpVw7FOMafdXAdEPbHMfgPxKJm7amG7iCl+8q+ttzGUoQ==
X-Received: by 2002:a17:907:7f93:b0:ad8:976e:533e with SMTP id a640c23a62f3a-adb494bd4demr514846066b.34.1748804107861;
        Sun, 01 Jun 2025 11:55:07 -0700 (PDT)
Received: from [192.168.1.105] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7fee1esm682786366b.25.2025.06.01.11.55.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Jun 2025 11:55:07 -0700 (PDT)
Message-ID: <c27311d7-8fa3-4ee2-a751-154517cf7d68@gmail.com>
Date: Sun, 1 Jun 2025 21:55:05 +0300
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/21] drivers/perf: apple_m1: Add Apple A8/A8X support
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
 <20250510-apple-cpmu-v7-9-bd505cb6c520@gmail.com>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250510-apple-cpmu-v7-9-bd505cb6c520@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/10/25 18:10, Nick Chan wrote:
> Add support for the CPU PMU found on the Apple A8, A8X SoCs.
>
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---

Tested-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

>  drivers/perf/apple_m1_cpu_pmu.c | 124 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 124 insertions(+)
>
...
> +
>  static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
>  {
>  	cpu_pmu->name = "apple_icestorm_pmu";
> @@ -912,6 +1035,7 @@ static const struct of_device_id m1_pmu_of_device_ids[] = {
>  	{ .compatible = "apple,blizzard-pmu",	.data = m2_pmu_blizzard_init, },
>  	{ .compatible = "apple,icestorm-pmu",	.data = m1_pmu_ice_init, },
>  	{ .compatible = "apple,firestorm-pmu",	.data = m1_pmu_fire_init, },
> +	{ .compatible = "apple,typhoon-pmu",	.data = a8_pmu_typhoon_init, },
>  	{ .compatible = "apple,cyclone-pmu",	.data = a7_pmu_cyclone_init, },
>  	{ },
>  };
>

