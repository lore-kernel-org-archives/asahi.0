Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3D22C0F7A
	for <asahi@lists.linux.dev>; Mon,  8 Dec 2025 08:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765181049; cv=none; b=pxZjo4EvFWYeBCYr4g/vyL/ABJ5TArPOvIE91GJPO4GUMkgmiq6cfSLUszhNnW5uNG2VRBTtpJIWEsK/G9iKM41v5Fq+xZ75UyEYygRLmDH1ZJozYD4rWw/K9WgMvRJQcyqLBux2us/WjKc7KmAViheX6LCVmaBbBaNDOB2y+0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765181049; c=relaxed/simple;
	bh=LcIjzS/QX9OdfzWd7S5fStct/j5BiQOmeNhDz/vl8LE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bIAYadlyyE6+2TUfjOp8sjNuhSPmIe0kNop9txT7xxCWiuO9KuGto5pkEc7my2HAOih947k6ATteR1cMt6PSI1sWHh0D6wYstJx6R+8X0HTK7DDa4cPxy1HTSzLXwZOA0zBLePaa5Xz1m6JIG8+P6Ma6ww5yz1twOR8FC6kXdOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jcp8ZR6L; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jcp8ZR6L"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5943b62c47dso4071259e87.1
        for <asahi@lists.linux.dev>; Mon, 08 Dec 2025 00:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765181045; x=1765785845; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0+tebP17XJiSVpHNLRMqnpjIXpj4TNVdcjDVZw4M8+c=;
        b=Jcp8ZR6L0V1PwZpCZ+9CA1hskSfeJ7ACY4QdYff0DmpktMn7ngK0MBb1lzzX0HMjch
         9jufzpQwBIJWq7r8v/aoBzqVXM+ktjGqLEfCAyxOa77aC1POJf9mhKx8+6g27qVO6NgF
         77KDdX5225mIWgb/XCyCgIB90j3jKdtD5/7uDYqi9rLz52U3t0XUpDqGyLYzK2Sg0w4j
         q1UTAkCMRnPZ8QfMFsKgvNWQiCDxwXvwpbzUGk7bXKmQcwzH/Rm7lvaTMUVWBDECvQ2O
         yLjQfyryKYtdkKHp33lY+Lcfxl8r2lbEKmXzvdF0YO0zTuSwh2HRWVRzXoZXgfFyAl4G
         ncXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765181045; x=1765785845;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0+tebP17XJiSVpHNLRMqnpjIXpj4TNVdcjDVZw4M8+c=;
        b=bxHnIa69qYpbLiVXCFrK1Nml7Mgvqq7/r95drqZIYVE9DCmsw39CWKIbFXcF6ZCkm1
         WRh+FdfSvz/9J4u/dXdDMZltA7aDQbEHij06QDXxFNM2Fr+Hq2Z5QF7/5kghRxUPQysq
         ENxYS8AYcy/8KMw5F+WpkGxfchMq8WQI2LZDTftxeId6WZfAacgVXzmfTiRWItdaVeC6
         EziCxqsi7FqhXT8Jr79T7weK+s0w126WxUS3jbix7ciyIPURit1yvOjF/bgEhACsswBN
         jqDOrUIsBs7vxQcZtunTTjy0VWqqIsnelujd7PtdPyBMFTNXHkTeBWYojV9J7dOt5a+F
         RoOA==
X-Forwarded-Encrypted: i=1; AJvYcCWCaXQGekmXVUwyXiCBskOnE9RZSTOU8tdJx8iscCthoOdLbU/vlOvxdCybEvkJmW9cyWjMHA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzXNcxH8vOcwtSUp2rhyQ+9TLLmDhQLykFOP0Lb28aLf+gw1fwc
	I0Rdzkx6GiVvLJg1WHusQHRBs5R3UA7tCCsdmOYPRukK5nUUbTJCLxwS
X-Gm-Gg: ASbGncu/L70HF+qsxGW8np6I92UXirqrRGono0Q1RM+qFOFpNoCjymenJHzJPeZ7Kkz
	5Vepu3m4wT+BRVslQfDgf8DDdljsvq1+LCAwYCNh8Pcry4M/LDXhoeJkl+E/ZKUtoZqgi/SZWAj
	KMFdt4LP/g7+d+B4UMk9y5DuPI/szYQRI+yHXB4OL0vFuafcw2IVJPgkFDdSUx52S6yg47dfAw4
	025jYsD1ssLDvXJeSlEoiJzB4+Hk6qi2SfDHSNkzWFVqRtKWTWTqb90AOu8Iddf5tB4ccjXhMgW
	S6MD4cv1iWy1Zl4IsesXAWh3BMi0F01orlb1zIsdlCo9tKhUkvLSGvWpBPkRo/ncawwbsSH/AvT
	aKlcPMqaBVrLvRlSCQLfEwX9xVzoDOK3KqewXtLCNrpEpCp+rEYJMuPXTpA0BPFoJ85P5D72V+K
	0qFa/zbPwuAaEQkkreHkNn8OBzQH5GAsYco07DZRoFkUJZw7gdcD5oE65wuBhC0t5XoJ7mQ328F
	A17P28=
X-Google-Smtp-Source: AGHT+IEtsjzvo2jB+dbI9VQ7yZrjbx6yvK3VRttDJmqZME09yWJ/CiejjRuxkvbF6yvGpf9tC/V6mQ==
X-Received: by 2002:a05:6512:104f:b0:592:fb5d:6300 with SMTP id 2adb3069b0e04-5987e88bb77mr1971804e87.10.1765181045203;
        Mon, 08 Dec 2025 00:04:05 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c1e2b7sm3942418e87.51.2025.12.08.00.04.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 00:04:04 -0800 (PST)
Message-ID: <bcbe66b0-23bc-4ba1-93ab-f2c09262e07b@gmail.com>
Date: Mon, 8 Dec 2025 10:04:03 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kconfig dangling references (BZ 216748)
To: Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Arnd Bergmann
 <arnd@arndb.de>, andrew.jones@linux.dev, linux-omap@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-sound@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-mips@vger.kernel.org, asahi@lists.linux.dev,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Paul Kocialkowski <paulk@sys-base.io>, chrome-platform@lists.linux.dev,
 Paul Cercueil <paul@crapouillou.net>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-gpio@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Cameron <jic23@kernel.org>,
 Vaibhav Hiremath <hvaibhav.linux@gmail.com>, linux-sh@vger.kernel.org,
 x86@kernel.org, Max Filippov <jcmvbkbc@gmail.com>
References: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/12/2025 04:04, Randy Dunlap wrote:
> from  https://bugzilla.kernel.org/show_bug.cgi?id=216748
> 
> The bugzilla entry includes a Perl script and a shell script.
> This is the edited result of running them (I removed some entries that were noise).
> 
> I'll try to Cc: all of the relevant mailing lists or individuals.
> 

Thanks Randy! This is good.

> TEST_KUNIT_DEVICE_HELPERS ---
> drivers/iio/test/Kconfig:11:	select TEST_KUNIT_DEVICE_HELPERS
This is a config for stuff that never went upstream. It was replaced by 
more sophisticated kunit_device, which I believe is behind the 
'CONFIG_KUNIT'. So, this should be dropped, thanks!

Yours,
	-- Matti

---
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
