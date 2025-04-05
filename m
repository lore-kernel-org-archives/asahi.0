Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7547E28EC
	for <asahi@lists.linux.dev>; Sat,  5 Apr 2025 00:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743811985; cv=none; b=N5KPi2cltkt2Zw+iY6OMHSvgLJZkXL8jywOtyb+xsxHFUL9ZLpiV0SrZTibZqLrJ8IKsAqtul5vgqMlp2G+Mvgq1ealFddI6cRGOSYBziJiVTtQrycJDXlaTM4+abVJ1pOnIZ45q9s+KDslmrxAz5twFJdu+RkqJUYWZkXfpxAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743811985; c=relaxed/simple;
	bh=KjmspBpiu6mD534nIbOHzgRUTwHmzEQbjmM6iuUZ4SY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=djcR54nWOyzzxLet+muTHyoprJlscpLCOGzLmm9fZe54eT0SmlfFJqRoeVL/49XVWXdWyH8W+RqIj+Jf4/XCMWOXdKeug4/ASATgKFF2RqzfziJ8t0buZfYzplBtba/HZdus9em59IoYJ1jKEaLDlkagBWY7XcriiX8CG4el2bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DN7dXelS; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DN7dXelS"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-af28bc68846so2347833a12.1
        for <asahi@lists.linux.dev>; Fri, 04 Apr 2025 17:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743811982; x=1744416782; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lVB5BztCQcbNtQipgi9Dw0n6uAY2frFJeooMsuQ6oIc=;
        b=DN7dXelScujcoLB1mh9EzAogaxP3MWyRz6eV3JpVQB3dPbGPf6DVaLNhVwPuvAlqEO
         wP7fsYRMZSTOjEgWtO+UTAE7G1F9VJp4LezsqGHPdJk0Eh9ji9kQr1b4C+JPtUgaXt//
         vz7hy18TdY3FPkkxEIY/uLPuZBQjyuoOr8Rb4pHekLe8zyTn38uwc1DdO1zj44eiJfej
         tKr6/UYWZOu7l/uP1Xc0ITB/puizS0iIl0y/qhadBNsIKrydNcJXYMZxgeZyhLMS6UeB
         YbnwWqf0p+O46JvRuOR5jRUDpa1OC53WabsSMbfGeeTZIK/3SlKdQ2Ht4wU6MwakR+rw
         NS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743811982; x=1744416782;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lVB5BztCQcbNtQipgi9Dw0n6uAY2frFJeooMsuQ6oIc=;
        b=AhNlVdYznssbz+jh2onl0KTv2fTrwdwN5HIc/qyHVIpZBcCZ0nWS1bnhKMOPCogduU
         9pUdBQIEpZSTdsoTu8eZNwVEAXq9NoiMRXO1rjypheh2HLfXblAqRaF6C9OYtpbyZQ7A
         g3aL/HrHXDQlXyItoHC4WeZY4DS0J57Azr76ccxlrSidk1ckIjlqpvko1gR/7L+opMma
         Quy71RzUPM4lpui9sHXTm4LY/NNWoY4XeMfV02XAsPzVw0Bj4EPq6reLwnSWq/1yMAic
         xXGIYgwaCVEZwGp68wL1OCx8qMPh25c6iZzdH+fc4MDykriXL21XbQqhsr45jX6YiE7B
         GF5w==
X-Forwarded-Encrypted: i=1; AJvYcCUa8ShPq2XcsFea2H3SpztLAzkC36+ehGnMovLsEEx6KaqtOjbtO+ePpLMNl5JTPJMb9AJZew==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9bpjn7SsGIGWWr94Q+rzpB9RwI4W/ADQFlWKCBbVB7HbiPZTL
	WQbvYnWk1S0ZngS51yNaO/tJveWw3RujaPg2Ls6WtsCSj+8VFiFS
X-Gm-Gg: ASbGncshSzLAo5FurIdSKCIWxTuHk8cMcNn1k/XpcfdgpBQA8w4OmAITZgwAPfHVYcJ
	pTkKdTKJk/oivgFguX4yIAo+4Bqmuori44vdqIvghPtfKJ8fkAePa5OnVjdNd+yIM6C0A89s6wU
	UnYZQlowNEvrukgY0JeEu+B/nvruDkWu5Gx43zCKRXdwviv7q+ILboJz+qh6EFylu9wnBXXquft
	uetAXZSp40jpzyFxBhiul4Mu9wE4fe5yTMQazDJcTlS10gKm239ovttMpwDG4ZTboAc8G8MU+T+
	yjF6XS6ahtLoVceNkrCQrFbfxh2VYf73sC/fPd7T/AGw4UtILtObm/y7NdFZ+ZbUWOL8l6WgmoE
	R6tuq/KaFfGrq+Sxu166LIX22X9CSR3vP6U9kCLBhgi72SdHMvA==
X-Google-Smtp-Source: AGHT+IGrwu27oF8ex/7piw96e+w8tE/abSdux4k8o9zBQQLxkK/kmB/PCrq8JJx1uFaSmXIk45Yzfg==
X-Received: by 2002:a17:90b:56cf:b0:2ee:45fd:34f2 with SMTP id 98e67ed59e1d1-306a61208demr5871471a91.6.1743811982462;
        Fri, 04 Apr 2025 17:13:02 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb5d665sm4327855a91.30.2025.04.04.17.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 17:13:02 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH v4 00/10] ASoC: tas27{64,70}: improve support for Apple
 codec variants
Date: Sat, 05 Apr 2025 10:12:37 +1000
Message-Id: <20250405-apple-codec-changes-v4-0-d007e46ce4a2@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHV18GcC/23NwQqDMAyA4VeRntfRpradO+09xg61jVpQK3bIh
 vjuq46BDI9/SL7MJOLoMZJrNpMRJx996FPkp4zYxvQ1Uu9SE2AgGfCcmmFokdrg0NLvRqQKlVT
 OcoTckXQ5jFj516beH6kbH59hfG9PJr5Of5489CZOGdUgpCpK4CUvbnVnfHu2oSOrN8HeuBwbk
 IxCgFaschqZ/jfEzgB9bIhk2LLkgjHBjK32xrIsH4MQNUM+AQAA
X-Change-ID: 20250214-apple-codec-changes-6e656dc1e24d
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Dan Murphy <dmurphy@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shi Fu <shifu0704@thundersoft.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Hector Martin <marcan@marcan.st>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-hwmon@vger.kernel.org, 
 Neal Gompa <neal@gompa.dev>, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3691;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=KjmspBpiu6mD534nIbOHzgRUTwHmzEQbjmM6iuUZ4SY=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkfSlulp10oyHoUveehUZ7i6UXywj4iKxbKHt/y9/DrT
 XV+qV3WHaUsDGJcDLJiiiwbmoQ8Zhux3ewXqdwLM4eVCWQIAxenAExkkSIjw7NvpVMMrk1giMuq
 muSxvknT+L3JsZcOjeXvfHbea6uVW8zIcGDJ0vfOh+a96A2o3hj4kuncWsvgl0uEErepC1yp35K
 +gBcA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Hi all,

This series introduces a number of changes to the drivers for
the Texas Instruments TAS2764 and TAS2770 amplifiers in order to
introduce (and improve in the case of TAS2770) support for the
variants of these amps found in Apple Silicon Macs.

Apple's variant of TAS2764 is known as SN012776, and as always with
Apple is a subtly incompatible variant with a number of quirks. It
is not publicly available. The TAS2770 variant is known as TAS5770L,
and does not require incompatible handling.

Much as with the Cirrus codec patches, I do not
expect that we will get any official acknowledgement that these parts
exist from TI, however I would be delighted to be proven wrong.

This series has been living in the downstream Asahi kernel tree[1]
for over two years, and has been tested by many thousands of users
by this point[2].

v4 drops the TDM idle TX slot behaviour patches. I experimented with
the API discussed in v3, however this did not work on any of the machines
I tested it with. More tweaking is probably needed.

[1] https://github.com/AsahiLinux/linux/tree/asahi-wip
[2] https://stats.asahilinux.org/

---
Changes in v4:
- Moved remaining changes to the top of the set
- Dropped already merged commits
- hwmon now reads temp from regmap
- Bumped regmap max reg patch above Apple quirks patch
- Dropped TDM idle slot TX behaviour patches
- Link to v3: https://lore.kernel.org/r/20250227-apple-codec-changes-v3-0-cbb130030acf@gmail.com

Changes in v3:
- Add Rob's Acked-by to Devicetree compatible additions
- Dropped cherry-picked patches
- Droped abuse of regulator API
- Droped bespoke sysfs interface
- Rationalised temperature reading for hwmon interface
- Set SN012776 device ID with OF match data
- Changed probe ops reliant on device ID to case/switch statement
- Added documentation for new Devicetree properties
- Improved a number of poor quality commit messages
- Documented behaviour of die temperature ADC
- Link to v2: https://lore.kernel.org/r/20250218-apple-codec-changes-v2-0-932760fd7e07@gmail.com

Changes in v2:
- Changed author field of patch to match Martin's Signed-off-by
- Added Neal's Reviewed-by to reviewed patches
- Moved fixes to existing code to the top of the series
- Removed tas2764's explicit dependency on OF
- Removed complicated single-use tas2764 quirks macro and replaced with
  if block
- Added hwmon interface for codec die temp
- Fixed a malformed commit message
- Link to v1: https://lore.kernel.org/r/20250215-apple-codec-changes-v1-0-723569b21b19@gmail.com

---
Hector Martin (4):
      ASoC: tas2770: Power cycle amp on ISENSE/VSENSE change
      ASoC: tas2770: Support setting the PDM TX slot
      ASoC: tas2770: Set the SDOUT polarity correctly
      ASoC: tas2764: Enable main IRQs

James Calligeros (2):
      ASoC: tas2770: expose die temp to hwmon
      ASoC: tas2764: expose die temp to hwmon

Martin Povišer (4):
      ASoC: tas2764: Reinit cache on part reset
      ASoC: tas2764: Crop SDOUT zero-out mask based on BCLK ratio
      ASoC: tas2764: Raise regmap range maximum
      ASoC: tas2764: Apply Apple quirks

 sound/soc/codecs/tas2764-quirks.h | 180 +++++++++++++++++++++++++
 sound/soc/codecs/tas2764.c        | 176 +++++++++++++++++++++++-
 sound/soc/codecs/tas2764.h        |   3 +
 sound/soc/codecs/tas2770.c        | 160 +++++++++++++++++++++-
 sound/soc/codecs/tas2770.h        |   6 +
 5 files changed, 519 insertions(+), 6 deletions(-)
---
base-commit: 3a0f0a4355df0240485ed62b6bd6afa5b3e689c5
change-id: 20250214-apple-codec-changes-6e656dc1e24d

Best regards,
-- 
James Calligeros <jcalligeros99@gmail.com>

