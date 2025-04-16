Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7411A2643
	for <asahi@lists.linux.dev>; Wed, 16 Apr 2025 00:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744763332; cv=none; b=LgdetQaImzPOz8ONjmR2apeBU6q428x1bCA1Jbe/BnTHd8jQ4K/WWNR1NiFcybJJiTGHdudI/nnghLMdbCP6P9rqd8yzt0PQGEV4mczghXAXn/EbB1jP7gQ925mvPs0J/D/jcS4XtwSEOBYLWeTyph3AyifG4zYBb6wFV0Uylfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744763332; c=relaxed/simple;
	bh=aZ8e9E4oy+FC9t47KpCQnXZ1uYFzFoMu5h6MhZiLvsk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jdTFfD4zTAQRosjO5IlUOKd9TZM1LBxQHX/7KivXVRIAc9jKkbVOg8+LdzWTsfILb9cXXczg9/sFLBQJkIGXACF8t8IrTlC9hlrm8dds4gYxaRWiUNtg91UG4i/u5VNrGZ6m4utQLyVKF9mPKKpQy7kenltrJIJv1I4V5hPNDVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ijpkf0dN; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ijpkf0dN"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-af5085f7861so3958159a12.3
        for <asahi@lists.linux.dev>; Tue, 15 Apr 2025 17:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744763330; x=1745368130; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f/jQln6EvrU5OsZbEU25l6V6bVkwJkGV9R7Ry8hxcQY=;
        b=ijpkf0dNLWbpqQPP1uFRiFKJ4lvF0r0fSbmBnJrkUtUUVL7/SB1lMQJxqPxo6eXETs
         +eMl0GUA3Q2HjOimy0+PaLwv4t52cz0DZS3naR7gxUswQnnaxwNcyAC7coO/Uworf97S
         NcsQGK3YePhjdA41WBMCgbKsiJyIA3Cg89BxfgRfjR4l52J54qaKMPai9Bu7kmnFQ/uD
         QoNAiYH9/MBWfCyRtuzgKinT8leyQ2u/faR9owYCzhVQQ1SzxsQ5Oj4f/h56mDnlgYPn
         nJV/+pGpwHpnynYfyeBgmOZVafvZPaNkeJm9XEEKfAIUT3qsUWPosiOJJ6lYcxeNaPjC
         9+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744763330; x=1745368130;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f/jQln6EvrU5OsZbEU25l6V6bVkwJkGV9R7Ry8hxcQY=;
        b=JdIuwbGtMly3xtTKp+k4IhY067kR1FqKmT/FJlIE/K28R7grpF8QEB6ExoYxpLcV6A
         76DExw1bXVswf2tngiz/rWt/BiAshRIIqAMpxEURNjABWy2XTkeQ0geM2nbL0e4HoYg3
         EH1OEhV+sxdxfDuu5Ak1jBs2UKzVprZUUVQ79KDOFRFiND68Z8LbG0CP3LN0KgLH27wd
         FDvzc6xM/E/1r52jS8VUjDADfL2njs5UrlecU4Gq+EHVDawU4efrZW6BvCdQI41kbzoK
         mDXhik0yFSWGcrSHYijf/a9vIvjd09QyHKJKnqG5ZZODdUQOTbwlhvk3XHtKOcAB81mZ
         I7wg==
X-Gm-Message-State: AOJu0YxEbxlhlGM0S/cPjXNa9IQ5QnoTdOzsgQum6dm5c0OQSiJQhw8r
	VDmfPdFdT0Rvw6wI8tAbtL15Jrki3G+pWGSGTUy37dA0AzgLxQ6f
X-Gm-Gg: ASbGncuhJSV9DI2ArNoliAWgWV8EvAxioaPMpHVVimzaXR3GbprWfElPEARA7Wp67QV
	9iXQnaJ4lqdPS8QkewKf2tD5xJJCydUglIn0Bc+gR0KNSdu0h14d8mYfazcMrmA85SJ/hrmn0oK
	9dewUuTJ7S6fXvqTUKeFcFA5avC9QM1ODeMpibjh2mQVm9yU7XVyj7STC18qUNpCm8QXSP2weH4
	2svfyFQbLJOPd26AuDLQ0IsbxwxWHMypn9+N6KVRngz7K9GH3o3XpzboOixuYaiL1IOY3lKKjmB
	NPUMzujDj3iDJVfz9pHrcA4ZxFJK25rDsLheSSqMXR+W8/c5TU26TQyUhp50EbOq
X-Google-Smtp-Source: AGHT+IGtQ/Ej18r+8kc7C8PSEgqWMtrQoxZsB9NyLbPlB+AasEwznrdWOuaSLp8n5bhqJPQw3iGZKg==
X-Received: by 2002:a17:90b:2784:b0:2ee:ed1c:e451 with SMTP id 98e67ed59e1d1-3085eedbef2mr2079796a91.15.1744763329584;
        Tue, 15 Apr 2025 17:28:49 -0700 (PDT)
Received: from [192.168.0.101] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308613b3719sm263756a91.33.2025.04.15.17.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 17:28:49 -0700 (PDT)
Message-ID: <47643fc7-240e-4af8-80c5-236f1afa8524@gmail.com>
Date: Wed, 16 Apr 2025 08:28:45 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: apple: Add PMU NVMEM
To: fnkl.kernel@gmail.com, Sven Peter <sven@svenpeter.dev>,
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hector Martin <marcan@marcan.st>
References: <20250415-spmi-nvmem-v1-0-22067be253cf@gmail.com>
 <20250415-spmi-nvmem-v1-3-22067be253cf@gmail.com>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250415-spmi-nvmem-v1-3-22067be253cf@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Sasha Finkelstein via B4 Relay 於 2025/4/16 清晨5:52 寫道:
> From: Hector Martin <marcan@marcan.st>
>
> Add device tree entries for NVMEM cells present on the PMU
>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  arch/arm64/boot/dts/apple/t6001.dtsi      |  1 +
>  arch/arm64/boot/dts/apple/t6002.dtsi      |  1 +
>  arch/arm64/boot/dts/apple/t600x-die0.dtsi | 50 +++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8103.dtsi      | 50 +++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8112.dtsi      | 50 +++++++++++++++++++++++++++++++
>  5 files changed, 152 insertions(+)

Aside from things that are already mentioned in the feedback for the bindings:

>
> diff --git a/arch/arm64/boot/dts/apple/t6001.dtsi b/arch/arm64/boot/dts/apple/t6001.dtsi
> index 620b17e4031f069874aaabadbf06b7b29ec4031e..d2cf81926f284ccf7627701cc82edff31d4d72d6 100644
> --- a/arch/arm64/boot/dts/apple/t6001.dtsi
> +++ b/arch/arm64/boot/dts/apple/t6001.dtsi
> @@ -11,6 +11,7 @@
>  #include <dt-bindings/interrupt-controller/apple-aic.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/pinctrl/apple.h>
> +#include <dt-bindings/spmi/spmi.h>
>  
>  #include "multi-die-cpp.h"
>  
> diff --git a/arch/arm64/boot/dts/apple/t6002.dtsi b/arch/arm64/boot/dts/apple/t6002.dtsi
> index a963a5011799a0480f88688fb4372a31f0bbf806..e36f422d257d8fe3a62bfa6e0f0e0dc6c34608a4 100644
> --- a/arch/arm64/boot/dts/apple/t6002.dtsi
> +++ b/arch/arm64/boot/dts/apple/t6002.dtsi
> @@ -11,6 +11,7 @@
>  #include <dt-bindings/interrupt-controller/apple-aic.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/pinctrl/apple.h>
> +#include <dt-bindings/spmi/spmi.h>
>  
>  #include "multi-die-cpp.h"
>  
> diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
> index 4c224e686ffe5602329f7f394d3354559c4130ab..9e4402b0bdc085a32d26048ccf1ac4ea20c1e0c2 100644
> --- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
> +++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
> @@ -50,6 +50,56 @@ nub_spmi0: spmi@2920a1300 {
>  		reg = <0x2 0x920a1300 0x0 0x100>;
>  		#address-cells = <2>;
>  		#size-cells = <0>;
> +
> +		pmu1: pmu@f {
> +			compatible = "apple,maverick-pmu", "spmi-nvmem";
> +			reg = <0xf SPMI_USID>;
> +
> +			nvmem-layout {
> +				compatible = "fixed-layout";
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +
> +				pm_setting: pm-setting@1405 {
> +					reg = <0x1405 0x1>;
> +				};
> +
> +				rtc_offset: rtc-offset@1411 {
> +					reg = <0x1411 0x6>;
> +				};
> +
> +				boot_stage: boot-stage@6001 {
> +					reg = <0x6001 0x1>;
> +				};
> +
> +				boot_error_count: boot-error-count@6002 {
> +					reg = <0x6002 0x1>;
> +					bits = <0 4>;
> +				};
> +
> +				panic_count: panic-count@6002 {
> +					reg = <0x6002 0x1>;
> +					bits = <4 4>;
> +				};
> +
> +				boot_error_stage: boot-error-stage@6003 {
> +					reg = <0x6003 0x1>;
> +				};
> +
> +				shutdown_flag: shutdown-flag@600f {
> +					reg = <0x600f 0x1>;
> +					bits = <3 1>;
> +				};
> +
> +				fault_shadow: fault-shadow@867b {
> +					reg = <0x867b 0x10>;
> +				};
> +
> +				socd: socd@8b00 {
> +					reg = <0x8b00 0x400>;
> +				};

Please order by unit address.

> +			};
> +		};
>  	};
>  
>  	wdt: watchdog@2922b0000 {
> diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
> index bdb1cb9e406a441e458b1c735359b0148146e91b..03bfe1cb173de009b4cd46508e24358008cf42f5 100644
> --- a/arch/arm64/boot/dts/apple/t8103.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8103.dtsi
> @@ -747,6 +747,56 @@ nub_spmi: spmi@23d0d9300 {
>  			reg = <0x2 0x3d0d9300 0x0 0x100>;
>  			#address-cells = <2>;
>  			#size-cells = <0>;
> +
> +			pmu1: pmu@f {
> +				compatible = "apple,sera-pmu", "spmi-nvmem";
> +				reg = <0xf SPMI_USID>;
> +
> +				nvmem-layout {
> +					compatible = "fixed-layout";
> +					#address-cells = <1>;
> +					#size-cells = <1>;
> +
> +					pm_setting: pm-setting@d001 {
> +						reg = <0xd001 0x1>;
> +					};
> +
> +					rtc_offset: rtc-offset@d100 {
> +						reg = <0xd100 0x6>;
> +					};
> +
> +					boot_stage: boot-stage@9f01 {
> +						reg = <0x9f01 0x1>;
> +					};
> +
> +					boot_error_count: boot-error-count@9f02 {
> +						reg = <0x9f02 0x1>;
> +						bits = <0 4>;
> +					};
> +
> +					panic_count: panic-count@9f02 {
> +						reg = <0x9f02 0x1>;
> +						bits = <4 4>;
> +					};
> +
> +					boot_error_stage: boot-error-stage@9f03 {
> +						reg = <0x9f03 0x1>;
> +					};
> +
> +					shutdown_flag: shutdown-flag@9f0f {
> +						reg = <0x9f0f 0x1>;
> +						bits = <3 1>;
> +					};
> +
> +					fault_shadow: fault-shadow@a67b {
> +						reg = <0xa67b 0x10>;
> +					};
> +
> +					socd: socd@ab00 {
> +						reg = <0xab00 0x400>;
> +					};

Please order by unit address.

> +				};
> +			};
>  		};
>  
>  		pinctrl_nub: pinctrl@23d1f0000 {
> diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
> index 950d1f906ba3023c1d118179207a2099345aae94..55ab72cf627efe2e3295409b9af1b2128b829801 100644
> --- a/arch/arm64/boot/dts/apple/t8112.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8112.dtsi
> @@ -787,6 +787,56 @@ nub_spmi: spmi@23d714000 {
>  			reg = <0x2 0x3d714000 0x0 0x100>;
>  			#address-cells = <2>;
>  			#size-cells = <0>;
> +
> +			pmu1: pmu@e {
> +				compatible = "apple,stowe-pmu", "spmi-nvmem";
> +				reg = <0xe SPMI_USID>;
> +
> +				nvmem-layout {
> +					compatible = "fixed-layout";
> +					#address-cells = <1>;
> +					#size-cells = <1>;
> +
> +					pm_setting: pm-setting@f801 {
> +						reg = <0xf801 0x1>;
> +					};
> +
> +					rtc_offset: rtc-offset@f900 {
> +						reg = <0xf900 0x6>;
> +					};
> +
> +					boot_stage: boot-stage@f701 {
> +						reg = <0xf701 0x1>;
> +					};
> +
> +					boot_error_count: boot-error-count@f702 {
> +						reg = <0xf702 0x1>;
> +						bits = <0 4>;
> +					};
> +
> +					panic_count: panic-count@f702 {
> +						reg = <0xf702 0x1>;
> +						bits = <4 4>;
> +					};
> +
> +					boot_error_stage: boot-error-stage@f703 {
> +						reg = <0xf703 0x1>;
> +					};
> +
> +					shutdown_flag: shutdown-flag@f70f {
> +						reg = <0xf70f 0x1>;
> +						bits = <3 1>;
> +					};
> +
> +					fault_shadow: fault-shadow@867b {
> +						reg = <0x867b 0x10>;
> +					};
> +
> +					socd: socd@8b00 {
> +						reg = <0x8b00 0x400>;
> +					};

Please order by unit address.

> +				};
> +			};
>  		};
>  
>  		pinctrl_smc: pinctrl@23e820000 {
>
