Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593C615AF6
	for <asahi@lists.linux.dev>; Fri, 29 Nov 2024 01:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732844964; cv=none; b=nayBDVGtlk+0nJ70VH+gAZxbpvRGfQ20JZCEb+Tl/8WkhBRWl0QGANWc5ushmJleKwFYyTCfyVtHUn5hUelIHmB8fZziWXkUDHBPDEwn+bMatX7X3nWBde7PxIV8TtOyPEvJwneOOT12o7yHolK9/LMt+D/iacVnWdWVkM6oY9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732844964; c=relaxed/simple;
	bh=sVCgEPfM3wgBZXhlAFVEjgiN1nv50L0Ltv2qTNzUFEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jCKJjXzVDuJtimcgeZxw+nsGuXTDb05yJhOf0zfyCt2dAydj8C5W6/b1cLRmnZPIYXpgsh9UT8Q+5YiWtNXF3cO5vxn8KPKqxYliPmVgubXe2frSilRmu0VI8pvY1q7S4t/mNJQWTbi2zarmVT00JTnlCKzBXoLGgXhRSPFQ/aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UFFTZ9Vu; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UFFTZ9Vu"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21527bb7eb0so7704105ad.3
        for <asahi@lists.linux.dev>; Thu, 28 Nov 2024 17:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732844963; x=1733449763; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6/u24g02F6G5dTmIgwmZ5N8zkALsWjGyEgUS5fL1byY=;
        b=UFFTZ9VujiQXJLv/FK8uClyXTiuaEwAhUY2hidWF+BV8dQJGh6KOVf21ioIAF65o0x
         me7T+IgWmtjFd86Vr44O3aaLehxY610q5Rz08YzY447BItymdyJ7hgKJuUv4Yck+A69Z
         o230gZx+Y7tHza2DVEoNRz8nXsoiZ37YPOG7TOPWcDWzGpg44n9ePKUm7iTFxE7ffSwW
         mBj6Ex9M42+uryxFG9S2jL1kL5AxYcXKN6lcWSFl1TuVHeisQjad6gVBFuqh9Zrsxz95
         9z7GRtc81jnVBIZHJ7ojWqFRB8XcvQdAKBFiBj9x9HIG1SopwYCGfumGOxbVF6GdvAu7
         ccoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732844963; x=1733449763;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6/u24g02F6G5dTmIgwmZ5N8zkALsWjGyEgUS5fL1byY=;
        b=xHDpHM1q8E5DWJHX4a7DiydtdwtjotRKyekJrsyf+wVzllyW02Uxc9vRVWpvqx39AQ
         EAQSmSC9GiXpNmpW1Wfn6+I4mVqi8VUhppkpAnxb9e7gWQ7L86f0ekLGdLcHLAMX21H/
         oxKCbiWiXeBotdnH4az0mOFJ2bUNjTAdhQNu2i71eS57eCC2Ffb2tMm7vFJFuDoBzF/8
         pOjipK/KKY24e55LpTlw0NM9vZkXobKxnKJhFo1kM3nrR8kLSjod61NVbuUzrb2Mdenc
         XmuiCJD3JDcwCUrdSU1u/b0Thup63kBjhMoFngi26VPYb2h0IoNdWlX0Be4gqPZTkDF3
         QGyA==
X-Gm-Message-State: AOJu0YxoGE4nooxannfAdFtJWr4NndaCmUhipqdqgboWNJ9DMHNEgF/8
	whR8Pp75qFoV6M2rCLO2Qn5nUUQoeKxGCLZKfWtkY717KweginZd
X-Gm-Gg: ASbGncutaDJPegt2hhqbgpfj2mIhaJtoJ75V91HItvVf+YZPpoMPg5V00ZA+sw/7Kkw
	/5jpx4/ZpdW0/bY6sDHsw4Yi3sTegAK6SYK4k3NLzVej4lh86qgN7qepW0YOY4HyPpBUq6SmUQq
	mpGMVh+cRteQaL10jlxwNOA/9Bth9r+yojuVrP/e9uFUeXQgePRwfieCj/gnToz+fGm3OYaUdXV
	H77ZxXtEZI+bnKA7iKgwhwxaWkApBVP/MAc3QUTOxr3NJD/kZoxnWNIrRcJ3zBkkUocF+uU1TrZ
	EEPNnA==
X-Google-Smtp-Source: AGHT+IFQufo5tXhmuP+UR71oQD+2OKaTxHqCGIGskq9pBU0kiHfjclL2HjYuWZdWPQ/dhvl4j1PGMw==
X-Received: by 2002:a17:902:ccca:b0:211:eb2d:e4a1 with SMTP id d9443c01a7336-2150128c1cbmr109485425ad.13.1732844962592;
        Thu, 28 Nov 2024 17:49:22 -0800 (PST)
Received: from [10.89.69.211] (wf122-211.ust.hk. [175.159.122.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725417fba8esm2279190b3a.97.2024.11.28.17.49.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 17:49:22 -0800 (PST)
Message-ID: <0cfedbf1-76c8-477a-9523-1462cf30989c@gmail.com>
Date: Fri, 29 Nov 2024 09:49:15 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: apple: Add touchbar digitizer nodes
To: fnkl.kernel@gmail.com, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
References: <20241128-z2-v2-0-76cc59bbf117@gmail.com>
 <20241128-z2-v2-3-76cc59bbf117@gmail.com>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20241128-z2-v2-3-76cc59bbf117@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Sasha Finkelstein via B4 Relay 於 2024/11/29 早上6:29 寫道:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Adds device tree entries for the touchbar digitizer
> 
> Co-developed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  arch/arm64/boot/dts/apple/t8103-j293.dts | 26 ++++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8103.dtsi     | 20 ++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8112-j493.dts | 24 ++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8112.dtsi     | 14 ++++++++++++++
>  4 files changed, 84 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
> index 56b0c67bfcda321b60c621de092643017693ff91..c31eb3f6f54268cafc9197a9244a5954fbb42802 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j293.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
> @@ -17,6 +17,14 @@ / {
>  	compatible = "apple,j293", "apple,t8103", "apple,arm-platform";
>  	model = "Apple MacBook Pro (13-inch, M1, 2020)";
>  
> +	/*
> +	 * All of those are used by the bootloader to pass calibration
> +	 * blobs and other device-specific properties
> +	 */
> +	aliases {
> +		touchbar0 = &touchbar0;
> +	};
> +
>  	led-controller {
>  		compatible = "pwm-leds";
>  		led-0 {
> @@ -49,3 +57,21 @@ &i2c4 {
>  &fpwm1 {
>  	status = "okay";
>  };
> +
> +&spi0 {
> +	status = "okay";
> +
> +	touchbar0: touchbar@0 {
> +		compatible = "apple,j293-touchbar";
> +		reg = <0>;
> +		spi-max-frequency = <11500000>;
> +		spi-cs-setup-delay-ns = <2000>;
> +		spi-cs-hold-delay-ns = <2000>;
> +		reset-gpios = <&pinctrl_ap 139 GPIO_ACTIVE_LOW>;
> +		interrupts-extended = <&pinctrl_ap 194 IRQ_TYPE_EDGE_FALLING>;
> +		firmware-name = "apple/dfrmtfw-j293.bin";
> +		touchscreen-size-x = <23045>;
> +		touchscreen-size-y = <640>;
> +		touchscreen-inverted-y;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
> index 9b0dad6b618444ac6b1c9735c50cccfc3965f947..9b83341a799d9a37578e5461e6b184f81ee7435c 100644
> --- a/arch/arm64/boot/dts/apple/t8103.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8103.dtsi
> @@ -326,6 +326,13 @@ clkref: clock-ref {
>  		clock-output-names = "clkref";
>  	};
>  
> +	clk_200m: clock-200m {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <200000000>;
> +		clock-output-names = "clk_200m";
> +	};
> +
>  	/*
>  	 * This is a fabulated representation of the input clock
>  	 * to NCO since we don't know the true clock tree.
> @@ -441,6 +448,19 @@ fpwm1: pwm@235044000 {
>  			status = "disabled";
>  		};
>  
> +		spi0: spi@235100000 {
> +			compatible = "apple,t8103-spi", "apple,spi";
> +			reg = <0x2 0x35100000 0x0 0x4000>;
> +			interrupt-parent = <&aic>;
> +			interrupts = <AIC_IRQ 614 IRQ_TYPE_LEVEL_HIGH>;
> +			cs-gpios = <&pinctrl_ap 109 GPIO_ACTIVE_LOW>;
> +			clocks = <&clk_200m>;
> +			power-domains = <&ps_spi0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled"; /* only used in J293 */
> +		};
> +
>  		serial0: serial@235200000 {
>  			compatible = "apple,s5l-uart";
>  			reg = <0x2 0x35200000 0x0 0x1000>;
> diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
> index 0ad908349f55406783942735a2e9dad54cda00ec..3332cc87cdf1a418c4c2247639baf5d2a42ed3c2 100644
> --- a/arch/arm64/boot/dts/apple/t8112-j493.dts
> +++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
> @@ -17,8 +17,13 @@ / {
>  	compatible = "apple,j493", "apple,t8112", "apple,arm-platform";
>  	model = "Apple MacBook Pro (13-inch, M2, 2022)";
>  
> +	/*
> +	 * All of those are used by the bootloader to pass calibration
> +	 * blobs and other device-specific properties
> +	 */
>  	aliases {
>  		bluetooth0 = &bluetooth0;
> +		touchbar0 = &touchbar0;
>  		wifi0 = &wifi0;
>  	};
>  
> @@ -67,3 +72,22 @@ &i2c4 {
>  &fpwm1 {
>  	status = "okay";
>  };
> +
> +&spi3 {
> +	status = "okay";
> +
> +	touchbar0: touchbar@0 {
> +		compatible = "apple,j493-touchbar";
> +		reg = <0>;
> +		spi-max-frequency = <8000000>;
> +		spi-cs-setup-delay-ns = <2000>;
> +		spi-cs-hold-delay-ns = <2000>;
> +

Remove the empty line
> +		reset-gpios = <&pinctrl_ap 170 GPIO_ACTIVE_LOW>;
> +		interrupts-extended = <&pinctrl_ap 174 IRQ_TYPE_EDGE_FALLING>;
> +		firmware-name = "apple/dfrmtfw-j493.bin";
> +		touchscreen-size-x = <23045>;
> +		touchscreen-size-y = <640>;
> +		touchscreen-inverted-y;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
> index 1666e6ab250bc0be9b8318e3c8fc903ccd3f3760..977c1ca5e8c1b566bb3876b6619ea8812b98e072 100644
> --- a/arch/arm64/boot/dts/apple/t8112.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8112.dtsi
> @@ -467,6 +467,20 @@ fpwm1: pwm@235044000 {
>  			status = "disabled";
>  		};
>  
> +		spi3: spi@23510c000 {
> +			compatible = "apple,t8112-spi", "apple,spi";
> +			reg = <0x2 0x3510c000 0x0 0x4000>;
> +			interrupt-parent = <&aic>;
> +			interrupts = <AIC_IRQ 751 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clkref>;
> +			pinctrl-0 = <&spi3_pins>;
> +			pinctrl-names = "default";
> +			power-domains = <&ps_spi3>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";

/* only used in J493 */ ?
> +		};
> +
>  		serial0: serial@235200000 {
>  			compatible = "apple,s5l-uart";
>  			reg = <0x2 0x35200000 0x0 0x1000>;
> 

Nick Chan
