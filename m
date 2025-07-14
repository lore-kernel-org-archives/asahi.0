Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B094225C713
	for <asahi@lists.linux.dev>; Mon, 14 Jul 2025 15:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752508785; cv=none; b=DdBvmmNkJy3j6iJ1hdwgf1oUF3ixrns6Qfl1W+85vH8kytbqiwTykJFEyqEMJEV5GAmdEW2QfD8+dT2bZHxgBh57PnswbCyEBk47YQzW8Ru71W0g2ASW6UfYEgTKtcocosTAYvb8eDNpo2W7I4jfq3P5bC1vBff3dySJfp1lix4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752508785; c=relaxed/simple;
	bh=5BYeSn92YzzQF+VMS4Brh9M0r6cRiJUgo31LKCP5UVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NzYNOLp1ZC5rFBGDLLkZBYKEc38Q3OFMdIlvAIlgsoUd6HVDaK4arCVmnOBGzwspNH+NSj+j3EntTLBnSr43uhheSqAnyqssCyYwglaqeWs5ifUY9xH/AfDBH6FkCK4a0/qI3CTWf7JNQDZhe/13hrhD27NYx/aJIAPxAErt/kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JUH3YjuP; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JUH3YjuP"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-74b52bf417cso2898318b3a.0
        for <asahi@lists.linux.dev>; Mon, 14 Jul 2025 08:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752508783; x=1753113583; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5BYeSn92YzzQF+VMS4Brh9M0r6cRiJUgo31LKCP5UVE=;
        b=JUH3YjuPRxTzQuN5x5GzXrebLBc9MeK6PfW9w6JXTz3CaI4sP5xkq5eTO+sMS6DhxA
         1V5f6M+HSvn4VdHR5wKmPAccblvFLDvAvMK+O3n+3Fmzez3k/GR0MssVIbEnTYC/YO8A
         g7bXzSmZl/9AiCY3PqdPa10g1s4Og1TzXVKKejYw8qSUUxIi3BOCnAOpqGl6+GQOpKbH
         xa3tOntbjHt9eOPq1Jxk5LwFt1m6fkhc8br2XggMoo2JUddD78OBv7mxMlT+Q2VlceUU
         QgBDo1OT9L2DHNQ5yXvhJkhVEajEhCGSAezicQesxmoJGSOfqrbhvb90tqzUdW/eAKnM
         Nu7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752508783; x=1753113583;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5BYeSn92YzzQF+VMS4Brh9M0r6cRiJUgo31LKCP5UVE=;
        b=GCc4EEJs4wG4ppmzL8dF2aFfv0hQavNp7gucVXQrfTPh8I4DzBdkZJrKE8J4mb4Fup
         xSoKG47+Gr3o+sKclw9JtyX+M2G+aU+/67mc4mZUMywn+DrB/TpfbKu89Fa2aOeC3Ot7
         g96Ui5ZlYUkqabcZbKu84cIvvB0XrPolZmkvPumb9nXxocjqA8nLYqPAGshR7/gDRUAY
         /noE/u4W4LiLdomc/sCTrwmb986IACUR/yJVg1nuBIARE+0uQ9IGq8UplQrOa3G+Ql9+
         WYiZ/8XiOlzRZogNjSeRnAaMyZGh77AiGcTEI/TDAxO1Mee2ys4zusSA8pZpBeXNGVgs
         8Nvg==
X-Forwarded-Encrypted: i=1; AJvYcCXSROObdcTd4KRpBX8/QfDSBgQqAf9+Jgm/jCGmyNRgBQ79PxppQC8tkBts3QH9Qevho4Miow==@lists.linux.dev
X-Gm-Message-State: AOJu0YyWtep3tB14ovvAzYdlZqab1qw/6Xxxmlfux3PFG/C02bgvheKY
	i41yheJ4VZZHjuLrW5Oq+HcCHd8TTp88hu+Segm5OAzZx+6SVTi1EEF4
X-Gm-Gg: ASbGncsbomdoIZMYsfpArcZDlhCCpbotlPpRvE8hbyov2GCCT5bI+dYQ2/a69PoWinG
	B9wQQ00NugtZilpdw+Wcf4UZNjHIkA1/WuNEA60pcfzVIOs480x7dY22qtFFHmR1AchLJNPWXnT
	B78a61ztLjI63vABOXy8iwnQtAVx51/cV78Sn7A5MMLveE85QrmO3n1oCB0zSGe2cCov0NeuCQQ
	qTpG1A426Gems8uvBq0bZTFgXTYEvISfAiPeQkrf7Zy4QEwoiOGvMksDc3PGgrv5C3ZLWz1QVOT
	RuKobUUSKUHSIbvS6qnSQPAbWtlK1tHD6vEBj5269aNDBkgUbIFtvmPXeTmltjkmdJe0KUmxgoq
	VVREwwaH+KbLdNt9FOs7JsmPqn54mVNW5/XYF1ye0oZNMActWE3brvY+4ATtVL+s=
X-Google-Smtp-Source: AGHT+IFQh7ea6LSr/0o4y+3tyMlqQDNYfa/MKNj7Iq4WOAh0qAjPKYZF07a8RNp0seFp+oT3EdK8AQ==
X-Received: by 2002:a05:6a20:3d8c:b0:21f:86f1:e2dd with SMTP id adf61e73a8af0-2311e939eecmr20538952637.11.1752508782754;
        Mon, 14 Jul 2025 08:59:42 -0700 (PDT)
Received: from [192.168.0.124] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f49f80sm10152790b3a.117.2025.07.14.08.59.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 08:59:42 -0700 (PDT)
Message-ID: <be327242-ad55-476a-bed4-44c33c263962@gmail.com>
Date: Mon, 14 Jul 2025 23:59:36 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v7 00/21] drivers/perf: apple_m1: Add Apple A7-A11,
 T2 SoC support
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>,
 Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
 <aHUeUMmn_19EayL1@willie-the-truck>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <aHUeUMmn_19EayL1@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Will Deacon 於 2025/7/14 夜晚11:12 寫道:
> On Mon, Jun 16, 2025 at 09:31:49AM +0800, Nick Chan wrote:
>> This series adds support for the CPU PMU in the older Apple A7-A11, T2
>> SoCs. These PMUs may have a different event layout, less counters, or
>> deliver their interrupts via IRQ instead of a FIQ. Since some of those
>> older SoCs support 32-bit EL0, counting for 32-bit EL0 also need to
>> be enabled by the driver where applicable.
>>
>> Patch 1 adds the DT bindings.
>> Patch 2-7 prepares the driver to allow adding support for those
>> older SoCs.
> Modulo my nits, the patches look alright to this point...
>
>> Patch 8-12 adds support for the older SoCs.
> ... but I'm not sure if anybody actually cares about these older SoCs
> and, even if they do, what the state of the rest of Linux is on those
> parts. I recall horror stories about the OS being quietly migrated
> between CPUs with incompatible features, at which point I think we have
> to question whether we actually care about supporting this hardware.
The "horror" story you mentioned is about Apple A10/A10X/T2, which
has a big little switcher integrated into the cpufreq block, so when the
cpufreq driver switch between states in the same way as on other
SoCs, on these SoCs that would silently cause a CPU migration. There
is only one incompatible feature that I am aware of which is 32-bit EL0
support. However, since the CPUs in these SoCs does not support
4K pages anyways in practice this is not an issue for as long as
CONFIG_EXPERT is disabled.
>
> On the other hand, if it all works swimmingly and it's just the PMU
> driver that needs updating, then I could get on board with it.

As mentioned above, it does all work fine when CONFIG_EXPERT is not
enabled, and if it is enabled, then 32-bit process may crash with illegal
instruction but everything else will still works fine.

>
> Will
>
Nick Chan
