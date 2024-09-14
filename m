Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0132D1D0967
	for <asahi@lists.linux.dev>; Sat, 14 Sep 2024 17:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726334285; cv=none; b=X7GCHKLuiDaAu4GOdEjAwHttUcACQz2lNFg/M+JSELldxkExzZpOuoVxCH2SpwSwL72EkQ3/SWNkvwXEkXS9UAyuf9C99jmwhwy9ZqhK7kps6Gt7+VPdPPzh8eQ1BSLP7zeB9gqX+fcEYbLua+2DrQBWaeKROIoMKW/Hp17y2m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726334285; c=relaxed/simple;
	bh=aRytwP9pLBei3TTlU1BMBB5/oF2kGbMPm/3Y+2Ugk9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pVd6oIxVJ2f+34yNzTPZ/Cv9mf/H+gVDutWrO8tIoTM8l7STwfQQweES0DJiyGbZiiLCNboS2XPHjkfiEBhrTmSjypEl28AtFuVsBd/Y7A6ZkFOWpCvf9dQ5w1aDMdmaXsL2AMew49hR3JH9aI6Rabra2g4b4abj1hA/LBW3XNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m5knE8yB; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m5knE8yB"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-718f28f77f4so3022031b3a.1
        for <asahi@lists.linux.dev>; Sat, 14 Sep 2024 10:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726334283; x=1726939083; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5+GhMoA3xa1971oY2HzI8hp5Uk+PbFfIHHqZtQjkbuw=;
        b=m5knE8yBJkptePNoRKIekVf0cylnCDBmXpDa/HfHw4CVFCHKr696RNXXTSt61Rr/Ef
         OMjCgELF/RlBJkWrBn5o3pAHIgVtqb6LYDWO9pzOG6JyIFhPBtIosPrPd23eAJV3YnEl
         N3pv9zROxlzzSFUedcTkyRol27UaR7kqLOw8b2jFdFGd+DWyHkDFwNEe4vLM+5boSL18
         BGaTXYDFZ6Up5OdUz6818R0jc49vgjJX4ievG6mlqYMLLmPdWPrUGV4CT/wdnV3yoAKa
         yg49ZKFTiBb1a3TW5NlXYXzKLHVmg6GKVJyLurn5BrfF+WD1O+8bYg6AYCUmP6v4sglD
         gNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726334283; x=1726939083;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5+GhMoA3xa1971oY2HzI8hp5Uk+PbFfIHHqZtQjkbuw=;
        b=QA2K7h7PKdGUBWDl4oyR4BlJxzAstrV2D+D2ZNIxu+1jqRsAkrchBdoCA59SgYV/TF
         BgzZd3xfNrAapg9MXPa014IZpuKQcju5CSc5PR7jxK+NidyRIrX1IGCVDhSc0ZKo5meo
         6vz9/uICSo6UJX9tPnjjKYaMpdnlnKQpfSKT2lwUuTStV2aszcRgdJ/Ow5VfJrqwZA2O
         tvtWMoESjDFtcz3gvBDT+CWG2VUHh3LGU3eqAJmocgppZ05ktGlnmGj8WnsKEXLWt9YS
         SE4EZfyh40rCOTA6bL0BKRT75jhfFBFUx4qoThC7jocD8tkNtLTSUoopH0P2s+4aHJVr
         GOtw==
X-Forwarded-Encrypted: i=1; AJvYcCXSMaWctu0Nm27GuXNoqZBtBX1ezJvzzGOKNfMFPmScMsghZajn0VOQmwJDIFnoSv6h0crfXg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxZ/KyTaT7Tne26JXjNRQ+DAI6/MaFTslzUJzdpoXlcjhJMxuaX
	xvODILVV62ha7IlvfpeP4nFdDHfhOVcNYye9c9bn2RT77CcRHt4O
X-Google-Smtp-Source: AGHT+IEVlENJgk8dXWBf4D2XILJQRHJRlYjJlO5FZwJPUxVX2SZ1X5qAa0SOTNhIkEM4keufiASuDw==
X-Received: by 2002:a05:6a00:b92:b0:717:8d81:e548 with SMTP id d2e1a72fcca58-7192606523bmr15785200b3a.1.1726334283027;
        Sat, 14 Sep 2024 10:18:03 -0700 (PDT)
Received: from [192.168.0.122] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db4999cfb7sm1397145a12.79.2024.09.14.10.17.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Sep 2024 10:18:02 -0700 (PDT)
Message-ID: <2ebf5258-b55d-4010-aa94-d5bab1f93bb5@gmail.com>
Date: Sun, 15 Sep 2024 01:17:57 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/22] dt-bindings: cpufreq: apple,cluster-cpufreq: Add
 A10 compatible
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Mark Kettenis <kettenis@openbsd.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20240914052413.68177-1-towinchenmi@gmail.com>
 <20240914052413.68177-6-towinchenmi@gmail.com>
Content-Language: en-MW
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20240914052413.68177-6-towinchenmi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 14/9/2024 13:17, Nick Chan wrote:
> The block found on the Apple A10 SoC is compatible with the
> existing driver so just add its per-SoC compatible.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  .../devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml    | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml b/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
> index 76cb9726660e..e0d1a9813696 100644
> --- a/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
> +++ b/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
> @@ -24,7 +24,9 @@ properties:
>                - apple,t8112-cluster-cpufreq
>            - const: apple,cluster-cpufreq
>        - items:
> -          - const: apple,t6000-cluster-cpufreq
> +          - enum:
> +              - apple,t8010-cluster-cpufreq
> +              - apple,t6000-cluster-cpufreq
>            - const: apple,t8103-cluster-cpufreq
>            - const: apple,cluster-cpufreq
>  

Have to retract the cpufreq patches, a v3 without them will be available
tomorrow. cpufreq works on iPad 7 (A10). However it is already pretty
weird when the cpufreq did not work on Apple TV 4K (A10X), with adjusted
p-states. However, it seems that iPhone 7 (A10) is also not working. So
this is definitely broken. As far as the hardware interfaces go they should
be compatible, so the only explanation that makes sense is that the behavior
is not correct on t8010 and t8011 and it only *happened* to work on iPad 7,
with some incorrect behaviors.

Marked as deferred on patchwork.

Nick Chan
