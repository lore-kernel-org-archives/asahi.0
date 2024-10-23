Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FED818453E
	for <asahi@lists.linux.dev>; Wed, 23 Oct 2024 09:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729676268; cv=none; b=CZMox7P8zjpJDFs7H4Eh2BS8yMOiKT9s6LzXDNMROywKwluIGCD5tnki9rEFOhsSNZqFQ7N6WQ4u/SOPlwr7tqGoOVXJDfkNqggJbjNvw5ZZfso+7+1iO7F1s0t2HjlDqIXW5zAyYybbcF7NIyOrzdakpmmSDdaCNvQiNyAOCzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729676268; c=relaxed/simple;
	bh=eKHkaNfVW95RqBjaVbuk+1RTrbIoLjh24DVEysWLzBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pdr7kTk8rMB8tvvhH2psjoxicb4nP4JiIpV6y7Lc+GxUoQYfwJZQrN4chIUBsi7Fd9r9/5M5AlBXvkvoMF8BcWkKVbDz1gRfKYB+DxfdYZnJKfl6xsaeOSqNhijE2KJSjyWdndgmKLOM/AdreGi13IJWnkDoC1iSOlT9wszQ7cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IPP5kJvD; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IPP5kJvD"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-20cf3e36a76so64570715ad.0
        for <asahi@lists.linux.dev>; Wed, 23 Oct 2024 02:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729676266; x=1730281066; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ICmxhOxf3rIdsIFy95QRYT4rZHpdER7Q9+r8wV6MVMs=;
        b=IPP5kJvD2tr+FJcD5mmFdzc4q/MnuzIu40s08U/h9qntiCCoDv7nObDjKl55nqe9uX
         nU/ow1OZPkcrhTQoTwtQUEiLjXgWMpSHNq1MVtEex6fBrkpEVKTgPZSplRL63GBtDQ38
         sQBEtvzY+LmDeIRSO4Le3Y6hGEGOeUbvP36K7Y/3kmiqgxcZtBfP4QueOsnk6q5NuQpR
         l7iecZYUHuSbMjLJHyOssnKV9vhUKfr2IkddnI1N3QOVC31TSdr+t0iayho4PTdZF8zc
         epr9vkp+8fD4xlkxjDSR88ga6FyWiR+j2DP3dV1MbtBichh5X/ptHIBJ5Y91yHfVOUQv
         sIGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729676266; x=1730281066;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ICmxhOxf3rIdsIFy95QRYT4rZHpdER7Q9+r8wV6MVMs=;
        b=chzug77MBsdLWgpkJ5IFSAcu5AU6WGuPYWyG4RK8XVpUKmAi9J7TCkedKCjIcDw1qe
         Acfe6ZN++ofZ0vCXVsDNbYhz8f01hYNHVCVUyBP8V7aph2/7opXrUR8EZKysX+jxZf6N
         3bZEzl37X0TvBQjuY5nBQjf88NKryJ2zo/21phB6R+kcHvFufq+FjpBIh2EmgOV9KBLP
         w/2OsEq085MG6uQMbMHsZFy4Vh52KUcM4qSe/2+I5ezM2ww37+FpxIin2UfTVXDUuRsO
         MixlqB6lKvDw3A7R0shoISdiBOsNCtzb0qX/mBiUVreJlTwbx2IcmdZ8poW1zojsEW+u
         y8Yg==
X-Forwarded-Encrypted: i=1; AJvYcCXpYvYoFNjZjaXH8FRrrTmCq0jyp03I3BTruEjnFtSo2ap4N/pfNfO39Kfsy8xrZ3FVgwFKVA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwWarg5UAxqVhCVuBRegPAG2Nc9G49xolE0gpV5t9RSDHo61tqY
	BE9U0GQ07EnRCKf3VaEURdLy8iVrIAkF3ZtUam2ZwEYweW8KYNoi
X-Google-Smtp-Source: AGHT+IEbaEkENgj6TpE1xbgPBOJYfC4icJXGN8eoL/sRAMsaGVBxN5nGzC43ba8GaiTlcpdMpQDopA==
X-Received: by 2002:a17:902:d4c6:b0:20b:b079:5b7a with SMTP id d9443c01a7336-20fab2dbb0amr16681175ad.50.1729676266411;
        Wed, 23 Oct 2024 02:37:46 -0700 (PDT)
Received: from [172.20.10.6] ([121.202.106.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0f3302sm54066435ad.250.2024.10.23.02.37.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 02:37:46 -0700 (PDT)
Message-ID: <5e1b807f-82ac-4ab8-867c-32b2bf2a91ce@gmail.com>
Date: Wed, 23 Oct 2024 17:37:40 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 RESEND 00/20] Initial device trees for A7-A11 based
 Apple devices
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Mark Kettenis <kettenis@openbsd.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <20241023044423.18294-1-towinchenmi@gmail.com>
 <CACRpkdZP9oDd+fRKKagFtGbfLx=Rk5LJ7bvaKimw5-t25XZAfQ@mail.gmail.com>
Content-Language: en-MW
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <CACRpkdZP9oDd+fRKKagFtGbfLx=Rk5LJ7bvaKimw5-t25XZAfQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 23/10/2024 17:05, Linus Walleij wrote:
> On Wed, Oct 23, 2024 at 6:44 AM Nick Chan <towinchenmi@gmail.com> wrote:
> 
>> This series adds device trees for all A7-A11 SoC based iPhones, iPads,
>> iPod touches and Apple TVs.
> 
> This is a good and important series. FWIW:
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Are patches not getting applied since you resend them?
This series along with the watchdog reset delay series mentioned in the
cover letter have not been applied.

> 
> Yours,
> Linus Walleij

Nick Chan
