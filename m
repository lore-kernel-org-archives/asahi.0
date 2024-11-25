Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650E218A6C4
	for <asahi@lists.linux.dev>; Mon, 25 Nov 2024 08:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732524215; cv=none; b=mWUfwmzHIyT1hrEPpKDqBiXUm8FFHXF38KRlvol60N2lhcUNYfx0TeGmuYrLFuNqvp7fl8idrCOlhx2Y7XPbGJtt6CWKvnmCPb5aM5B3usAwrXaOZ1ShkzgRpUBuz6SqJYtFdJFLCJE+kkemLX2DQ8FE1pqyxd9ooAQQ/iFycHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732524215; c=relaxed/simple;
	bh=AsbyBTK9GRr6ucLVmXwxS+szhGmlI1Yq48V5IFbo/Dg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LuXs+ByYpyEfmz8I3qEy+E+ZyC3VQFWMDbsk9MYH81TS8ZbQ5R8HSHqBmhGD+dQvVxx9bPrZa0s/yDvYLISsLi6yTfsquR0NdEN0+gsHnD0kSjdpj8m9j/aRPcIbrIpuMDUhQf52y3B9ou6IsYZEgRGwT5/5VmixjakEgzRKri0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hgtIGAEp; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hgtIGAEp"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7fc2dbee20fso541133a12.3
        for <asahi@lists.linux.dev>; Mon, 25 Nov 2024 00:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732524214; x=1733129014; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pI8BQQ/T5SVzIWF61zZavJ6P7DIvRK0aGvjhr4khLmI=;
        b=hgtIGAEp3fre+3SD/3WeKytiaoSgljEoJlns59UqlJHPOQKixSVa/Pw3xGGrSXf6mn
         YuAjLzKgZWWrwxjDLc/SKIcil0GJzpBuhwZoqLCqqvB8+1BM35QzuKcYCMv5OTI4YLjT
         XWkvwZqkHnNHii7C4N/A3Sq3ncC73At5gVrsfDQDWvP9+dkrdZeLGTNxEI70YfQlIjKR
         lfqN/0E3LDAQBvbB5wU1Yi2bOVJx7iJpkjiNm8NVZLYrMfE+MULMSuMhDbJj1caH3p2P
         Buc6uUGkhvfBlcTKpuR23COChszVZfhLqd+OQykuAu6IAscXEBhIcC/WGUu4i8uB3+0/
         vOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732524214; x=1733129014;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pI8BQQ/T5SVzIWF61zZavJ6P7DIvRK0aGvjhr4khLmI=;
        b=HDTxB+PL2HJ5BBQCz/LE+73xPKswrLGPZX0jH6Y9nuqOpzq+WrrNOmMbchd6E4YYJe
         Amg8KuEIuXWcIAedq8VgLIib8oaV5zRfIJaAFvHRPu++hTjzeO5uMD8sDENJz1z8OOCN
         8GNjEE4f722JEVmKAIX8CyOzkO4ftfTzBNY4jjP0d4WN1Q3/tfJYtmOsmymrRFunmayk
         q6VgrodCB5tluCOOpcxZ/14HarYefXPXTWlv321bT0oFkvbY14yXBfMlN+FiC17d55Nr
         Y2u9SmZIu6g8kU+hEo5G1St6vYxz7OJ2/bnulMtphmxYENAlUkYxDyzm8Vm/wF23R0Ww
         YgTA==
X-Forwarded-Encrypted: i=1; AJvYcCXQaybJ7Jm3nDpxuoJFR5b3nHhU7NGMWAR7sPYtGj+qMyqjMZsTPIznkcEFgyLT7GKt/J9LbQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyFHiCad69/KEpJnRVW4sFOW2CnCq7ePToblmAC8Q1WcDBaK/bL
	iW9IKmzV0uoZtiEyYG9mTQzR88Vh8wOvHmR/LxviglF8BLeKZmNG
X-Gm-Gg: ASbGncuUE7K88ZJ1Kp2eHb8Rsq5AiC8cUPPHR3+3mrje0wSOU0nUiMK3HLBs2PE6G2l
	8MvH8MqStIZAOVqQlc9ZBHSg3fepZ8VWMGEFaLxVJpR0FLPZFkp2YUoYSqXFFqWDzZp6m/MA8/Q
	oVz2kAc74roKucTaqR2z0x/lsZjZCAMgO5tjWqOEjJTktdysuxq8WVUDEVcIkP91G33IdeOBgON
	JGlodUl8uMj6Rdi4CPQL5yieX4vcgQ1E/WalaqiloFo5WaAMuktTzk5kZI6rCQMqdJK
X-Google-Smtp-Source: AGHT+IGhgxcXQ0ft9/Za4vorVCq/dkomo2GMsbGwiP5RlHt6aZtAoqt6aKppLpP3grbtnbLAwPJzMA==
X-Received: by 2002:a05:6a21:7881:b0:1e0:c92a:c838 with SMTP id adf61e73a8af0-1e0c92ac9e8mr5471906637.35.1732524213648;
        Mon, 25 Nov 2024 00:43:33 -0800 (PST)
Received: from [192.168.0.115] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129db9fdd5sm59524145ad.58.2024.11.25.00.43.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 00:43:33 -0800 (PST)
Message-ID: <4a3c832b-0c8d-4487-b1bc-122450a57516@gmail.com>
Date: Mon, 25 Nov 2024 16:43:28 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: apple: Add touchbar screen nodes
To: fnkl.kernel@gmail.com, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Janne Grunau <j@jannau.net>
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com>
 <20241124-adpdrm-v1-4-3191d8e6e49a@gmail.com>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20241124-adpdrm-v1-4-3191d8e6e49a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Sasha Finkelstein via B4 Relay 於 2024/11/25 早上6:29 寫道:

[...]
> diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
> index 1666e6ab250bc0be9b8318e3c8fc903ccd3f3760..726b11376692580abb129b9be35107bee1550a93 100644
> --- a/arch/arm64/boot/dts/apple/t8112.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8112.dtsi
> @@ -379,6 +379,31 @@ cpufreq_p: cpufreq@211e20000 {
>  			#performance-domain-cells = <0>;
>  		};
>  
> +		display_dfr: display-pipe@228200000 {
> +			compatible = "apple,t8112-display-pipe", "apple,h7-display-pipe";
> +			reg-names = "be", "fe", "mipi";
> +			reg = <0x2 0x28200000 0x0 0xc000>,
> +				<0x2 0x28400000 0x0 0x4000>,
> +				<0x2 0x28600000 0x0 0x100000>;
> +			power-domains = <&ps_dispdfr_fe>, <&ps_dispdfr_be>, <&ps_mipi_dsi>;
> +			interrupt-parent = <&aic>;
> +			interrupts = <AIC_IRQ 614 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ 618 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "be", "fe";
> +			status = "disabled";

Forgot to add, status should go after other properties here as well.
> +			iommus = <&displaydfr_dart 0>;
> +		};
[...]

Nick Chan
