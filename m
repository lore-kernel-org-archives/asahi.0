Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E08199926
	for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 14:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726063547; cv=none; b=eGcyE1uQ3U57xlqDKPMbIoVaAcBzjaKzsc54XxZnkZR6xNyXcUUkEbgZN5BI8J2X/O1L1x0zrpW/QZYmeoMqP9E7LiJ76JFKDOyIrfz6DG4qVbN/+eqLS5vxH1X+kf8WczA7te6kRqYsmFy/q9lwkrh1wQct+nDxrRSWRC0f6lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726063547; c=relaxed/simple;
	bh=CXvVgiKVVo42EiBoYi+GWqFah6+XVYpe9X59iNadIIU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=tAyBaLBCiKemIMebEoQn97iUaCBEnTnMKRmkpzZr7Vm4mep7xvaozwa/E7ZUnIWOILl0vDiLTwDa8rchB01HCH+jXkXjp9KSuyC+DCdy4V+IY6uJc8Ymme6szWgbyL9PFYKYWZLat3pvD6ieFchxcyjGRgrHDkBD01nZU8SA/pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JMKVCN0O; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JMKVCN0O"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-718d91eef2eso673303b3a.1
        for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 07:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726063545; x=1726668345; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2pnLXhMia9bNNnroq4Q5YOL9U9MnwhtuwI40LclTYj8=;
        b=JMKVCN0OmJBtQ4u7m9+FoZQp5UZRPv+Rijhx+fND/jd42z54hFCDUhz4V39kd8BsTV
         QXObHJ7J/N8uOAz2xKBQ1t3dL2K9ZNG2v72z6YZOnl51ovrLOfo6SGl0S4wvZbVLbPp7
         NnogqV0d+UWKi+/6xTkhHv8St1kWKcUIhmN+hFq417akb9WQ7mekR6ExhBlXe/xipvON
         fG4zXpIBRkAcVshMYJsDSGSeV2nOgwMSvGyWKt/RMJhgHMWXKjqmVr6KBnBjbtoe7Yj6
         b2Q8hRglB1/pSHP/n9ucd/tg4xERUbtJu2qn5oXSGACFYN97xTo2Kqbvd9ogCT6cFPZs
         k8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726063545; x=1726668345;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2pnLXhMia9bNNnroq4Q5YOL9U9MnwhtuwI40LclTYj8=;
        b=wk936TmkOsbZ/4y/gmQA2ZEIrrUGMDlYBTp6V7pRcSqSqVLW7YSB00ZvBlzvSZuaWk
         TgVTQ621MBch/DmH0M6ttYxBOcv5CiFiMQVbEcoqdVrp9SywgndZLVQpI8fH0aOhuB3e
         rVyIdyGbVULkIU8KJLXr+oS2at2Fv5Vmkg6KWre9MPSox0+wmkZYO3YgnE/gII07m2it
         Dx++YBr3tHGU86RW+LKQBsC1cscMOITrqDcsi3PpQRcx/FURa02J7jBSIsJN9Cx2UZem
         wmQ7nyeCDqJcAT6As+1JcBN34rDaLOMMaxULrkISar72kxRpOHozJhjkQ69lLCKTEsyI
         MIww==
X-Forwarded-Encrypted: i=1; AJvYcCUljcWnDM/bG5YnXHLBoJCN15ls9Hg5mVYcpq6Em/c3In0Xrpkovj46y7kZitiZ6hScZ/C3Fw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwhufeM3FU0S96wVVe5fOjfgbWqnQqzdMRpxDebNNGY+tfl5JlQ
	6dkNasjgKvGtHgdIkxJ4w/ltMUyCZia+pVCK+M//xPHrjlYgpp9x
X-Google-Smtp-Source: AGHT+IFaiwWSHDTRYdWheipvNrkDIz8LsChIJnMeUpcmCh4XvfEUYk4ttb7dzHIbpGXRqrXDDY4pqw==
X-Received: by 2002:a05:6a00:4b0e:b0:717:8a98:8169 with SMTP id d2e1a72fcca58-71907e985fdmr11515101b3a.1.1726063544737;
        Wed, 11 Sep 2024 07:05:44 -0700 (PDT)
Received: from [192.168.0.122] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe2636sm3019052b3a.60.2024.09.11.07.05.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 07:05:44 -0700 (PDT)
Message-ID: <0ac53bdc-7599-4f5c-a666-dc359e747530@gmail.com>
Date: Wed, 11 Sep 2024 22:05:39 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/22] Initial device trees for A7-A11 based Apple devices
From: Nick Chan <towinchenmi@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-pm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Hector Martin <marcan@marcan.st>,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Mark Kettenis <kettenis@openbsd.org>,
 linux-arm-kernel@lists.infradead.org, "Rafael J . Wysocki"
 <rafael@kernel.org>, Sven Peter <sven@svenpeter.dev>,
 Conor Dooley <conor+dt@kernel.org>, linux-watchdog@vger.kernel.org,
 linux-gpio@vger.kernel.org, Will Deacon <will@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Viresh Kumar <viresh.kumar@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, asahi@lists.linux.dev
References: <20240911084353.28888-2-towinchenmi@gmail.com>
 <172606224294.90706.12818129202356312350.robh@kernel.org>
 <dd27d389-99ed-45f7-b2ae-c15f2633610d@gmail.com>
Content-Language: en-MW
In-Reply-To: <dd27d389-99ed-45f7-b2ae-c15f2633610d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/9/2024 21:57, Nick Chan wrote:
> 
> 
> On 11/9/2024 21:50, Rob Herring (Arm) wrote:
>>
>> On Wed, 11 Sep 2024 16:40:50 +0800, Nick Chan wrote:
>> ...
>> Error: arch/arm64/boot/dts/apple/t8010-n112.dts:21.18-19 syntax error
> Note: this is caused by missing #include <dt-bindings/input/input.h>
> This was not caught due to another error: It was not included in the
> Makefile.

I mean, it is added into the Makefile, but it got removed by the commit
to add A10X dts files...

> 
> 

Nick Chan

