Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDC318592F
	for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 14:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726064524; cv=none; b=MtZkjfQZi7rZ4dxq6O2Mja9zKTokXgjdjiz/NQhPaGzb2VjCHBAZBgC+ePvx8FQIzKx2kyjGRGyUbc+kWiLyW/bY35nezC4DcX0sRF3ONBakg0pby7taN7Gpr3VtO3TBjGfhOJQh0u8LzL0eQGB+QTpJtM+GDKFEwPDvzvc465U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726064524; c=relaxed/simple;
	bh=o76AcHbXbRGzANSciTEuox4Bvd9TI1DHxqnZ0Ai44mQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X/jwImDS/67yCcjPrdlTrduBkRuudW6N+QIXaJqOULxWcE0WCdMsNQRlq9FX05/cmV1FpdYTwMat9UXU2joZhaSS8mjlnj9X30xnwmYS54ghX6NDyEeIP4tjWEdnpeCfaF3hq53SydW2Umjq4JHugYPhL73KvlVU404x61VkB6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z6FATJjm; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z6FATJjm"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71781f42f75so5457808b3a.1
        for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 07:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726064522; x=1726669322; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o76AcHbXbRGzANSciTEuox4Bvd9TI1DHxqnZ0Ai44mQ=;
        b=Z6FATJjmzQuqlFoqbHOBR1dPxlpzE12z72m3CJ/MLX6hoBb08h0BEUIR3lmWPNmlBe
         xrC7CzQsTjci6f06VIh8vlt6qFw/AaPD5FSJTjDfbRBmiVEVZWehc+6aDig3V2Z0yU6+
         Y0bCL0xTttWG55em7luJ3DNbq5zQsMXrlzshhk4Ob4smIQ+3ZqBje8W7oNoCmsa+t9lv
         QKy1d7mwtPkMkWqNcvssgnHIlmiHl+gxY8EUInmsxohET2LdgDPTJTpXf2ro8jiKSaGN
         FeEMo4DgyJFluuUy0nEx+52pHBz5ebta1Tfl3aAnYW/Nex/pRh6ZGgOpbXp3aip62rRK
         tgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726064522; x=1726669322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o76AcHbXbRGzANSciTEuox4Bvd9TI1DHxqnZ0Ai44mQ=;
        b=aDSXTrOLC5Atr/G3gq/mvCtNAxj1KedheVRWpuE1KVLLDximWoKHUQYvqlDfDDewaf
         UbDtsvpIxA/iIcC6zQkAKgTV4Zy4UxbTdIY+GWFlvut7YcdaghelPcpHCEmYbw86Ox+7
         RDwWmniBmxbT3dvBXHtzBADmG0ADyizZKQa6Q9TSZQAFd1+Vqn+222wp5AP2rK3mYxuo
         40bj8nIbJcdiVkt3T9HMNV4ieLW5sRsZAml4B0nRuDYKgsrjfnf3fGRtsyouCdaVU//e
         CayYB3SO8JBY2OTP0HjT59eE1hJzaJ0V6Ncagevt91n8OAztbyra/DnzXkxi2a3tdNHj
         SR7A==
X-Forwarded-Encrypted: i=1; AJvYcCUPtVsdiNgjAbp2Z9CWzy+1pyYm8q3Jp6OGBMq2uBkPuoxVc3Z/6bvCpMT7vp0Z3vFYdMErFQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzHbSxMlVq1BSJg/sO1OtL/H3MKMhncKAfeezIZoBw36+xPrwc+
	yjcT8nEypTBGllL5Ju7fgsHWmUdO/O3XGiqgkfewIiSe4UTofNHN
X-Google-Smtp-Source: AGHT+IGHiWzhUZMlISG1wfusUmj12FDfLvKIhsEju2A7EBEjueSKjiPNUyeW6qF3DD+xQn/SjKUC0A==
X-Received: by 2002:a05:6a00:94a7:b0:710:591e:b52f with SMTP id d2e1a72fcca58-718d5ded3a6mr21737936b3a.5.1726064522266;
        Wed, 11 Sep 2024 07:22:02 -0700 (PDT)
Received: from [192.168.0.122] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fba40f2sm31734a12.7.2024.09.11.07.21.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 07:22:01 -0700 (PDT)
Message-ID: <041215c1-ad90-4257-9852-57b1d7bd490c@gmail.com>
Date: Wed, 11 Sep 2024 22:21:56 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/22] Initial device trees for A7-A11 based Apple devices
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
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
References: <20240911084353.28888-2-towinchenmi@gmail.com>
Content-Language: en-MW
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20240911084353.28888-2-towinchenmi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

There is a recommended device tree node `chassis-type` to specify the
type of the chassis. For iPhones, iPod touches and iPads it is pretty
obvious that they are `handset` and `tablet`. However, nothing really
fits for Apple TV so a new chassis-type value may need to be added.

Nick Chan
