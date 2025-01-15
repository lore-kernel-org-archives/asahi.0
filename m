Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC7B2BB04
	for <asahi@lists.linux.dev>; Wed, 15 Jan 2025 14:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736950072; cv=none; b=ETFP85ZFiu4EIsYQ9vygXDYfi7J7odLOAAxhNFi3Lk1IPa6IyT2BEy1xVAOX3DB47Iuz8KPCsS6EM37nuY2hij410FGd5xCsgyVSvqD36z4Kk/3pXsBjxW+ZUrIT4EeVD8g0VtyI3uhLlPoAUW4Qp0c9PuM59lI/2suxIDUvFwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736950072; c=relaxed/simple;
	bh=pYNI0+DrSHxt8IA4pT0Q6TIGUdZHoKvWFTtA9bR9DVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u4l0Jld9yY6aohh5hKqQu3LkiW79gaG2OUynCbTIRrjcQtEP8CcTv8cjvR2HN9OPBIv+YIa48Ql/Is6OBpXHYcngnJRkDxrB8K0IHHSFa3iESIjCBRp9hf6nliG9vgqoKuP1pa1+ZI7T0BqvESKIlQIVkVN1P0+3vYqmgtdNuTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kcF3mlPL; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kcF3mlPL"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21628b3fe7dso117185435ad.3
        for <asahi@lists.linux.dev>; Wed, 15 Jan 2025 06:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736950070; x=1737554870; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5vCPLadSTG0XNEadulJx4woFN95JwHE+lHWPlfdFjqo=;
        b=kcF3mlPLwQ9VU1Jb5hMVJApjWYQbH6fuL5pjIpFjpoQmxz/xPpWw2ToGMJZKF75SMP
         crGp4GB+GMhyPftDtuAKXqJa3NSWwFXl7qigm4ELWw/EyAMGY3j9uspuxmpkCupeawn1
         TGwW/WzPdQLVKrEdfJ9WDEEwaddCazEvRAUA3NoFwn7Bn2vcCjFIK6hl3TUUVXC3LEh+
         pWHfKNjlxnUQM6HiFFDXmBPMfL/Bcqqv1QDnKtE8lMcW3HWTpqIMTTXtCm1qOw1zywAG
         fKjI456lE1Bb5J9TGruS5C2unJqsZYy5Q51RtL1lejYybl27ykBBWSD7E1M1BF1zoRAw
         XFxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736950070; x=1737554870;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5vCPLadSTG0XNEadulJx4woFN95JwHE+lHWPlfdFjqo=;
        b=wcIPbkcvCbcVTtqMbXpIwM6gPkKnOjlpZ8enyARwR7a8KDIGUjmD9yibDf0srLpBco
         Y7xGWFpcl1RcwATHKpz0a8oE2Gz/vie0qFTfpDw+g71wVmbSCuNtWv0TDSbUdF8+sIU2
         rR9oQRvnZzRoPEqZ5hNkdGtTzJ3tb/N4+TQ6ikZp6NTR+1Vk2dgzCKfhWR+jC+bXWBoV
         4n7G8YSo0oY/NSDBB3TzayERxQP/edH6TuD2n4eKqK96IYJrZTP1Z//IWGV56PlAjBUK
         5BRYfVjpl6YRFmQ2nkKrirrFHrYi/Ik4a6iM4nuJtkgLG2iySFh9whSLxeA+heotx5S8
         v1Zg==
X-Forwarded-Encrypted: i=1; AJvYcCUF2EOAusHOaV8mllrtAKV6jtq26cGE48AXXu2iAe91kN3xUWZtrs7obsJQE+TIo8D4aqPNWQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwR2+sidWO2GTAMm3qIY2px4egmcM/Yzmzcn6tz9PvFHRjAW8cT
	CZlRca7d1MHHVIo2ZAB4kNrWk7o5eBfghhRSV5v8u6f+EVrBnF21
X-Gm-Gg: ASbGncsKZTTpI/eK76jlaNC5IiFpPiH/65/XQRMLmgmDVCGbcCmYMFFpuimCyp4kR9d
	stnx/IaemeiVHlYkq+IqhbTANHbO4qinGhvwnDjRIIGWcCFRmbZAi9gNULjdndk9inQcyre4ILT
	W92xuYtmaYHl8oFYjRJS+vCmWm8jcv4X1+xLZlj8G8nwixeaky7kJOTcmNmi/fjZEOZzp8JCAUi
	kEp4OyRBlg5mSGLAn3NKKuYHpTalSC5Dh/SY3/jW00eJck2NqhKJ0u+MLvSu5TG
X-Google-Smtp-Source: AGHT+IEOHm6oG8q2/VBX+YnEUddFnG0FmgHB02S4iMBT+29EuCT2i15IMPwhfxsK6EdgDfF5iHJflA==
X-Received: by 2002:a05:6a00:368d:b0:727:99a8:cd31 with SMTP id d2e1a72fcca58-72d21f47fc5mr39933032b3a.14.1736950070133;
        Wed, 15 Jan 2025 06:07:50 -0800 (PST)
Received: from [192.168.0.116] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a317a07cce2sm9929464a12.4.2025.01.15.06.07.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 06:07:49 -0800 (PST)
Message-ID: <00863806-d481-44a1-b97f-ead0fc6f9581@gmail.com>
Date: Wed, 15 Jan 2025 22:07:44 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] arm64: dts: apple: Add touchbar screen nodes
Content-Language: en-MW
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
 Alyssa Ross <hi@alyssa.is>, Janne Grunau <j@jannau.net>
References: <20250114-adpdrm-v4-0-e9b5260a39f1@gmail.com>
 <20250114-adpdrm-v4-4-e9b5260a39f1@gmail.com>
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250114-adpdrm-v4-4-e9b5260a39f1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 15/1/2025 05:38, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Adds device tree entries for the touchbar screen
> 
> Co-developed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  arch/arm64/boot/dts/apple/t8103-j293.dts | 31 ++++++++++++++++
>  arch/arm64/boot/dts/apple/t8103.dtsi     | 60 +++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8112-j493.dts | 31 ++++++++++++++++
>  arch/arm64/boot/dts/apple/t8112.dtsi     | 61 ++++++++++++++++++++++++++++++++
>  4 files changed, 183 insertions(+)
> 
[...]
> diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
> index 9b0dad6b618444ac6b1c9735c50cccfc3965f947..9b088f74e0cb9f42fbc8df822fca6451dcd1b717 100644
> --- a/arch/arm64/boot/dts/apple/t8103.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8103.dtsi
> @@ -356,6 +356,66 @@ cpufreq_p: performance-controller@211e20000 {
[...]
> +
> +		displaydfr_mipi: dsi@228600000 {
> +			compatible = "apple,t8103-display-pipe-mipi", "apple,h7-display-pipe-mipi";
> +			reg = <0x2 0x28600000 0x0 0x100000>;
> +			power-domains = <&ps_mipi_dsi>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";

Missing empty line.
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				dfr_mipi_in: port@0 {
> +					reg = <0>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					dfr_mipi_in_adp: endpoint@0 {
> +						reg = <0>;
> +						remote-endpoint = <&dfr_adp_out_mipi>;
> +					};
> +				};
> +
> +				dfr_mipi_out: port@1 {
> +					reg = <1>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +				};
> +			};
> +		};
> +
[...]

With that in mind,

Reviewed-by: Nick Chan <towinchenmi@gmail.com>
