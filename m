Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7033C1F57
	for <asahi@lists.linux.dev>; Mon, 31 Aug 2026 11:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788175995; cv=none; b=BANrCBo0qBhWalJJCdWiM+/u8RpXGtv692Cx3jQzI97IMgwZatc5j8GQN5Dn71lyjT9HPte+TUGXUPPKN8BjcCcy2zAnEwFzM3x5wLsdeFSi0gZheNNc2TPXgwO27TTapY+WLh8YzWBj9NAUpT59bg32W5Aejveqpfhj2qzBR5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788175995; c=relaxed/simple;
	bh=JA8jrHKuhk0CJFLWQ126/WU45hXRi8573vPGNkgvooI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M+XmjLcS46GmfXtjPKGzoRW50cLJSo3lPMmoSW4Olsp+A8Zaks/Agc9W3ILxDccAZkPjW2XOaZx/UTwe0FKp+zPpTIn3ZLQIWM/79AykKd8MnoICQy9Afmge34wcq3yym2Pdy5GhL3bfS+BVtf9rGkSpAHzDkVveR8w0RgFzuLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U6qKO4MV; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U6qKO4MV"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc11a905ba5so2367581a12.2
        for <asahi@lists.linux.dev>; Mon, 31 Aug 2026 04:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788175993; x=1788780793; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YwoI9pJbspw0thPYgo5uRAdd6p/MMBJUTUU3yjoPKkw=;
        b=U6qKO4MVlSO1kIhGtAAaSvGMaI/LiNatyZHVxFWEUlJx0V6Xxh8Xmxcz3BaFq0Fndl
         Vs+Z1Ct4keMK19LnP+NbFWJZoxlBp37OU+SX05VCMLihLvztqPdmt7Pdy3iK9qdsT0yj
         7++Wwu8itFD1nQUYjKXOg64KOMiVGJaEYIi1XnrGV3r2hj83HdZt4PfG8M/9tSIHJA3R
         Hn5W8WhTK6obblsKXRKYgQdAMBPyeZjp+HT6xMq3iVYMMMYeDXxuiS9AfTjjAN2Swc2q
         fgJPbU7PLGRCrqPhPmIgO92x7C7UyBJnR2B+UUgEjRaIxSm9c9cS3BAE0Y5TuAm7dXnK
         uxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788175993; x=1788780793;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YwoI9pJbspw0thPYgo5uRAdd6p/MMBJUTUU3yjoPKkw=;
        b=HtRxgb49RIGB1Ta0bwIWvYqvRMI3xbLT7BxqrbV8CfwjVgtL2zGkPIorKGcc4A9v/3
         H9398Boi7U0aZr6BjsfXcSQ27pnk+pojM29fttQNMj7A7iLC43R+2QPL9rDLxQTf2fbf
         XdMM34mE5rrZaq6Q3CH6HR1gnzIK3z0CitLIlQg3JBDwsUh0i7GAy4FvzbweQGJpmxsL
         CKHO2bIKpr76C4HWz702Kgj8T7eB98MAUN+ovieXVbEijvSHcf7UHHlnb1+TACAfWC3M
         tsr7qogXWlAteZ4TtSyR+Rqgo5jrS1rhfJoCE+EZn9RILUMLj/24/0djW56tyBvEaXbp
         ybCA==
X-Forwarded-Encrypted: i=1; AKwUvBzOgrhBODQ5ebQHw+FqH/5d+H0jo9DEuDBfV2gw5H0dOzgmWfLLgZQNIVupGurj/biiVfZAFA==@lists.linux.dev
X-Gm-Message-State: AFuF++mTvXoVmWdnxtVaFzItbeE4yJ+griV2QTp+rTgNoFEZeLqG5I/0
	ZCExDDAh19WXvLaxBpna3QBh4Vw8T+tIYIudr8MA/K2DVNRor9bnwjVc
X-Gm-Gg: AYBFou0RlDLXQf5pi8sPe89jQ0QhdAomyb4zxRA0XPANI9WQrB+LWJ5x9+IJkxpO7Ri
	7yxlMJAZoGXKltGBROLBmmwOtz7c+Ajk+OhdhjZyxfi8tsah8dHmsiF9LYtA0CznG+5gjXFTF28
	q09m+UalbnivlGw+iNSQ23365OwijjlBKKIYvNyfCnKDKCc482wkcb/t4QIlr40LpL3XxF3HbAW
	FhbWmozlf0JDLGy1CODqHuAtRXgmDAu1htNvpegdCEBkeXUFEUeIqD8WFEYSN9ftOKzdRuw7dw1
	CR1DhIlgS2dJuwIMpqIBK9hb8d6AHTHqoXCM8wVTJZmJctAuin7zzQIG7vC5PC2DlIKGaoC0jKy
	ZbK83BM9hQCQrZwBvGFKAJbMwpOxHi1B6RmdEF/mzzy2JXk34XwvuTmRMkuYF2MIb9HPRVGCxGd
	+W92sFmRUrFAgIVNbKgz3FeeRpHTQO2CuBpjiExpdT3CXObQA8QZsaldyQEf0lkZ1dqlfDJ4InQ
	yE66HLzXzrAoBFSGX0nFTKsZRz49jgu/Bp40zJVdcd4KIH8HCLLrFC9wgq6Hrg6Aepnn4lRzrgL
	6G4prRjKi+QoOc22Yc7Avdc3Kv5Oo8ChWPbygjLDanjEdpw=
X-Received: by 2002:a17:90b:2f0f:b0:396:41d1:cbc7 with SMTP id 98e67ed59e1d1-396d0d92d15mr41287848a91.3.1788175992822;
        Mon, 31 Aug 2026 04:33:12 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bc825sm34111826eec.9.2026.08.31.04.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 04:33:12 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH 0/3] Enable shared GPIO for Apple Silicon audio support
Date: Mon, 31 Aug 2026 21:32:38 +1000
Message-Id: <20260831-apple-shared-gpio-v1-0-e855b12e18ce@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWTNJqVKBqxAXFX5gCIGmo8aEc
 HcrLr/FezspokCpyXaKeIvKtiYUeUbd5NcRLH0yWWOdqWzNPoQFrJOP6HkMsrEzQ+Vwu+JSekp
 diBjkcz7b+9/6eszonr8RHccXNvdv2HUAAAA=
X-Change-ID: 20260829-apple-shared-gpio-60f86e74e35a
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2665;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=JA8jrHKuhk0CJFLWQ126/WU45hXRi8573vPGNkgvooI=;
 b=kA0DAAoW1DYy0VH3eWAByyZiAGqVZm6gk8hq/DZpJ7Sxzc6aABaz6Amen7+KLPp8mgNqyZt2h
 IiRBAAWCgA5FiEEsIISSJsyBtmPFHm91DYy0VH3eWAFAmqVZm4bFIAAAAAABAAObWFudTIsMi41
 KzEuMTIsMywyAAoJENQ2MtFR93lgVXIA/jxuSb36HlgsJsBZYezGXmJU5VV9xJiVbYBpEWb7i9w
 ZAP94S1jJis0hOEMTV0nlB7uKc1AoDcePfnSn7FH6oi7sBw==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Hi folks,

On Apple Silicon Macs, every speaker codec's software shutdown pin
is connected to the same GPIO line. This line must be pulled high
whenever any codec asserts it so.

This makes power management impossible. When we goe through the list of
codecs and call each suspend/resume, the GPIO line is asserted low or high
by the first suspended/resumed codec. This causes issues for the subsequent
codecs; they are already shut off by the time we try to cache the register
state on suspend.

In the downstream Asahi Linux kernel[1], we were previously (ab)using the
regulator API to work around this safely. We replaced the shutdown-gpios
property in the codec Devicetree nodes with a virtual regulator which acts
as a proxy for the GPIO line. The regulator will not deassert the pin until
every consumer wants it off, and it will assert it as soon as any one
codec requires it.

Now that the kernel has shared GPIO support, this has become unnecessary.
The first commit in this series enables shared GPIO for ARCH_APPLE so
that we can take advantage of this new(ish) infrastructure.

The shared GPIO infrastructure considers the first state change of a
line to be the "default" state, which is the state that it will allow
to be asserted without all consumers agreeing. Currently the TAS2764 and
TAS2770 drivers initialise the shutdown GPIO high, which means the first
change is to low. This does not help us, as the line will not be reasserted
on resume until all codecs have tried to assert it. Since both drivers
explicitly pull the line high on codec probe, we can initialise it low,
causing the first state change to be from low to high. This makes the
shared GPIO proxy behave as we intend. The second and third commits in this
series implement this.

This has been enabled in the Asahi Linux kernel since 7.1.9, and addresses
the last obstacle to attempting to upstream the machine driver for this
platform.

We intend to take the Kconfig patch via our soc tree. The two codec driver
changes should be taken via asoc.

Regards,
James

[1] https://github.com/AsahiLinux/linux

---
James Calligeros (3):
      arm64: Kconfig: Select HAVE_SHARED_GPIOS for Apple Silicon
      ASoC: tas2764: Initialise SDZ GPIO low
      ASoC: tas2770: Initialise SDZ GPIO low

 arch/arm64/Kconfig.platforms | 1 +
 sound/soc/codecs/tas2764.c   | 2 +-
 sound/soc/codecs/tas2770.c   | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)
---
base-commit: cf72cbb39da84b6f02f90c07f33b102fc10b16f0
change-id: 20260829-apple-shared-gpio-60f86e74e35a

Best regards,
--  
James Calligeros <jcalligeros99@gmail.com>

