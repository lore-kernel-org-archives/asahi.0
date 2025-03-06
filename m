Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305C8224FA
	for <asahi@lists.linux.dev>; Thu,  6 Mar 2025 01:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741224059; cv=none; b=gVU/v1s/IvEu+vvTC7dWvSR8Jq1G4jZKNyma2KlINkC6e+CyaGehWY5HAnzmK23Xgs2qStfY0+8/mfvWFUxvUvJEGpMUlX9AhJ8TPUHiZt34jNrKYhj20aTXCGMt+f+7uG0JqQXc86aIbOK/+fBYWZBcdR0lRgQT27au3mC6GmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741224059; c=relaxed/simple;
	bh=qChrOs8Y7o3tEDCaxcShduGkeVGkFSi1RvOK1nsdh0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M/bssauEWRw60WKc98tHg39KczwekzsmgPeYjag74UdSj34GMoDbWD6ubwNt0XkOndzgYBj8YYQeZD19OZZZ1dp24UVMsHqR8CdhyBu/ysysel7d9s9qZahsbWx8jzCgtQLEOFWhg8HCNM1MOg9oNJ2tePJDyS170JyxXRL0JN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YOJqlF+a; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YOJqlF+a"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2fecba90cc3so307790a91.2
        for <asahi@lists.linux.dev>; Wed, 05 Mar 2025 17:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741224057; x=1741828857; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ply0/CzY0yvzBEfEzCiDMoXMyvQu4tZWubmfbiISKOM=;
        b=YOJqlF+a1r0QrHJVUsrpAUS4/ZK8rGO1ikPxcYsqcYK+r944Z7mOMJYNb43tDqR8PZ
         RTrbCoTT5PQLvj+oTXkNLXIIAhmiUQJ5/GFZGVdCWu7bnsVSzNb2PN/RvRGTHrXxaasE
         J0qc/mmstuTRt4R7azXIhs/mO2Idq7vCNVY659g+bisDmz+wpeIbp5QOlVg37YTcwm5t
         HwApzkeshfhkngdqMOVdZnlhj7+7xvr9i6q8we/ndyJ+qrKJcYQbPAacCEy+zr2ecwwK
         kTWZ37CP3/sJnv6frjsoCPfoULnzggxhGJIHZAtWOqLVsHg2Na1X0YvO2Prx2CKJH/iz
         GBXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741224057; x=1741828857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ply0/CzY0yvzBEfEzCiDMoXMyvQu4tZWubmfbiISKOM=;
        b=fh2sYEmMskQrhS/9zgSZ7o6kPE7Wtbx5L2DgKRDQkhMcaRq9O+dLPnyPU0zyaoOkTK
         xhMLM8qc+6oA2fIJauNo3BIbPYRrM8eesOL+hOSq6Tg8u4SmsEew6QJNIq9sBYOPz2GG
         jb0ywpoWj51CBNOx3rpynv0Yj26GKe5/0OwztNCI7c8wCp089EzPDoGAX4Fr8ORgK6QP
         2vg8eioDrVsIDi80H07RZV7cvWRrHpGVMYXnblEyOA8B5Tx+8AkDJ0kShZeB49+C5H3x
         Opz1dC82h+4MNQd+O5IiRSPPyHzKycsefV3ZQxmlGx7dyZ3y3cR5qhz313SOVLyY0WR9
         36fA==
X-Gm-Message-State: AOJu0Yw3bIWk7/4KJidqnkC4PWSHIto3BpxRzSS+8o1W7Fah6gRSXdmZ
	VPH3giABRcStCg+1m0Zvc4PT03fMrUMZAbih+sJfXPyIyC6VP1aV
X-Gm-Gg: ASbGncs1MRGVNyDK51jXsWdZ9BE4INVJDZA0AHzictCsY/mBSaBLiHoSGG5nEvHXYpG
	yPqyFyWGGSlAbdfyOa5APPcUjSnPqVYVUEvv6g0Wb3Ll5IB3/EW/wJdy3+QhL1lyG5g1OIlNOiN
	ZKWu09aM3l4okVYeowYx1ArWehV2+5jgYZWywpRjRfjEQWDEj/6RjmmCH3WxXNQzeIEyCE8lf/L
	yWY4uIR3YbItIUJGCbfyF1hpnnaaNug6A5I84wfuavG9WgcHNgvSTR+hLeeIk4OP8bIWO7TYTvq
	DJHjrx6ftAkbYphrRitkyZYsJG12WIO3tMfXNEYdLDlMDBfpk9G5/bC+3OKwB9S1tWeWP6t69JX
	WRcyP
X-Google-Smtp-Source: AGHT+IFojcpy6KUP4bTQSiEwcKBMBi3P0iygm73XtFG4pDDpmIlmVKc+itvV/UD4VcBCJUi2g4g2pw==
X-Received: by 2002:a17:90b:3c41:b0:2fa:ba3:5457 with SMTP id 98e67ed59e1d1-2ff497cce9amr10138543a91.17.1741224057323;
        Wed, 05 Mar 2025 17:20:57 -0800 (PST)
Received: from [10.89.236.32] (wf126-032.ust.hk. [175.159.126.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109ddfc7sm730455ad.22.2025.03.05.17.20.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 17:20:56 -0800 (PST)
Message-ID: <b13f29b8-2906-489d-b955-3f94a9bcb231@gmail.com>
Date: Thu, 6 Mar 2025 09:20:53 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: apple: Add SPMI controller nodes
To: fnkl.kernel@gmail.com, Sven Peter <sven@svenpeter.dev>,
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250305-spmi-v1-0-c98f561fa99f@gmail.com>
 <20250305-spmi-v1-3-c98f561fa99f@gmail.com>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250305-spmi-v1-3-c98f561fa99f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Sasha Finkelstein via B4 Relay 於 2025/3/6 凌晨4:26 寫道:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
>
> Add device tree entries for the SPMI controller
>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  arch/arm64/boot/dts/apple/t600x-die0.dtsi | 7 +++++++
>  arch/arm64/boot/dts/apple/t8103.dtsi      | 8 ++++++++
>  arch/arm64/boot/dts/apple/t8112.dtsi      | 8 ++++++++
>  3 files changed, 23 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
> index b1c875e692c8fb9c0af46a23568a7b0cd720141b..d544a35c8af414c583d38b040e1aa753902f1c93 100644
> --- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
> +++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
> @@ -53,6 +53,13 @@ wdt: watchdog@2922b0000 {
>  		interrupts = <AIC_IRQ 0 631 IRQ_TYPE_LEVEL_HIGH>;
>  	};
>  
> +	nub_spmi0: spmi@2920a1300 {
> +		compatible = "apple,t6000-spmi", "apple,spmi";
> +		reg = <0x2 0x920a1300 0x0 0x100>;
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +	};
> +
>  	sio_dart_0: iommu@39b004000 {
>  		compatible = "apple,t6000-dart";
>  		reg = <0x3 0x9b004000 0x0 0x4000>;
> diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
> index 9b0dad6b618444ac6b1c9735c50cccfc3965f947..0f03dc808cf7c6b7d71afc79dd29d368f957f979 100644
> --- a/arch/arm64/boot/dts/apple/t8103.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8103.dtsi
> @@ -11,6 +11,7 @@
>  #include <dt-bindings/interrupt-controller/apple-aic.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/pinctrl/apple.h>
> +#include <dt-bindings/spmi/spmi.h>
>  
>  / {
>  	compatible = "apple,t8103", "apple,arm-platform";
> @@ -604,6 +605,13 @@ pcie_pins: pcie-pins {
>  			};
>  		};
>  
> +		nub_spmi: spmi@23d0d9300 {
> +			compatible = "apple,t8103-spmi", "apple,spmi";
> +			reg = <0x2 0x3d0d9300 0x0 0x100>;
> +			#address-cells = <2>;
> +			#size-cells = <0>;
> +		};
> +
>  		pinctrl_nub: pinctrl@23d1f0000 {
>  			compatible = "apple,t8103-pinctrl", "apple,pinctrl";
>  			reg = <0x2 0x3d1f0000 0x0 0x4000>;
> diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
> index 1666e6ab250bc0be9b8318e3c8fc903ccd3f3760..4b3730c46c4d14a582627f69094b458ec7481da9 100644
> --- a/arch/arm64/boot/dts/apple/t8112.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8112.dtsi
> @@ -641,6 +641,14 @@ pcie_pins: pcie-pins {
>  			};
>  		};
>  
> +
> +		nub_spmi: spmi@23d714000 {
> +			compatible = "apple,t8112-spmi", "apple,spmi";
> +			reg = <0x2 0x3d714000 0x0 0x100>;
> +			#address-cells = <2>;
> +			#size-cells = <0>;
> +		};
> +
>  		pinctrl_nub: pinctrl@23d1f0000 {
>  			compatible = "apple,t8112-pinctrl", "apple,pinctrl";
>  			reg = <0x2 0x3d1f0000 0x0 0x4000>;
>
Reviewed-by: Nick Chan <towinchenmi@gmail.com>
