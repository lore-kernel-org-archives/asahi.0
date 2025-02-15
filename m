Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8CF6125
	for <asahi@lists.linux.dev>; Sat, 15 Feb 2025 00:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739577794; cv=none; b=L1mA870aeA/YONUohNvKhiuFq/c4bAxFerS6fFsOD6oC8AADUJdkKdBdsBo8aOp2UqUfZqayy/CJQzBkdwHhmmAfFGePufaZu9PMDlCA6krbGlbiUrlJFo4U4XUPNnBKMzqj1MGk9PqGq6QYmA8zKFZqSJ6MauLVwYxq2QofUVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739577794; c=relaxed/simple;
	bh=75ue9XmQyJ8qhP80PF/AOl1KCjY+SUIQzJSjEnRvCuw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MZ0xdxcAT0dVExk0SZp3Jeb+DrleDMIuX36fK3msOl5QhBigIR0W5ZWq0mocx4GgThCg5uMkcwiSGgT5nVWJGufCf22BgViRs630ilxxy5nQpl7uFyCDWHZjVcs/c6qCVCC861SdtmYeVEhtbLe8+1luZ86F+np6dC8GtIi2r2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PUGbK06C; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PUGbK06C"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-220bff984a0so46085765ad.3
        for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 16:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739577792; x=1740182592; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hlljIDmRX1XH1IW3oY9g1rM7wniUPX9ut1iHFiQ3C7I=;
        b=PUGbK06Ca9qjXF3JgArZa3nHI6ND0Bjua6oTUv0J3Xn52b6Z8YWQTIB+cSHS87O7Cy
         3LFHiX2/TcCHPLS9trXGDX2vuxJFFB94jCTYqzvh0GO6jBmPlSec9UFJUXvKxPY3l8aG
         QZyqhjQVnkqOI+qADPTNOLGOOIUi3tGqKQ3t9XuEPbvjkiEcDw+i4rp/J3aBr9itUTcz
         hJGT4AnlcUyPFwbsLhyWOVXHPeOvqAPs6URZOyNBo2hSwdalBuHE0nXdkkxsMvT3PRug
         LgxsgEWe2Cj2xcjxuKMl89NCd6AlZ7oOGszVTFCMhBKZYnG/Lc+u91tkrNUUkiJpAo6I
         MuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739577792; x=1740182592;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hlljIDmRX1XH1IW3oY9g1rM7wniUPX9ut1iHFiQ3C7I=;
        b=hqs6bFycZqHTlzNTTfB+BKFnt1jlfnB9uwdmKL+jhQLPHO8z/Q7YGbM+617thG8M53
         lxTHYbO+qS/ScrtzVlXDh4WsL3jptIIIjljzoQilD3GH/g/SmoJOd1G502q3a47GouCD
         g7sFFFlY+2D2fMCimUKRTqfo4SQMZHLiv9+vjOtHxcPJFCWYQ2kiFvyRG1ofbqWYFyP7
         07iAR6flaV55P0zpdH6K56VltU7rYTS8YfFPmuUW6Puh0F7TL4Xl0o9OLlOTZWylj04s
         4HDwSPMm9vmWb5I1Em5oVmgZWl3PBc8sbq/IvA8be3EBwb1hUGdaJQ2/+7o8TJWE/XhH
         Lo1A==
X-Forwarded-Encrypted: i=1; AJvYcCWb0Qdanef99Dbd6Try3tiqrkir/d375KSXE9rkpQ4v+5Wt3MTceOkevJw9kBNrqb2AXGyhZw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8BARXFRxG9HZUDeG92dxyy+DyFlrT+aBvX+38YtIjA4518UAx
	ADRLUu/fe0mG8cVsT+G2XsXoTI8BEHxTxJaoMBrE/hpCXzTnes1/
X-Gm-Gg: ASbGncsP/tL7nbTOAENlLYGZ57nAomfHFro3Q+050Rg5ldD0X9JEORRSZKxWD5iA6g9
	NrlkadeRzGZufvD5QSm/I1QpcYkuvySlvfkUHQUYnhJLmpjT5WGMp2bt9RdbmwpeSGzpR8si8Zb
	L8h1nYEDSSafLMTKhWgB6WvbI9D3eJoSUQMpZbkP0Tqk/ZfQh/6eVoIlSdZSN3Hr0aUJRVrUEBH
	YKsXQdNYbZjAku49ROINWpS5h/LU5Y6I4BdF+ISHxHW2vTJ9zBh8ToPUN/zXUuxVDyVJcmzqmUY
	59KoBpD39Ma9lvAPqw64tXGUK/1rRAppHjsBa3P4Xh4WnhqJqoUmbhmR1sx+CqlRj+rlMjwc9In
	e1ZA0Wc1nXg==
X-Google-Smtp-Source: AGHT+IEup2zgA/YTbycAj6IzspoC2++Jftu7jKLzx1hPV3+F+i7RaOUhB21dbPrRSyLCtfppm6LLiw==
X-Received: by 2002:a17:902:fc4e:b0:220:ecf7:4b5c with SMTP id d9443c01a7336-22103f16d99mr19774315ad.14.1739577792063;
        Fri, 14 Feb 2025 16:03:12 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220f26ea127sm15071155ad.96.2025.02.14.16.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 16:03:11 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH 00/27] ASoC: tas27{64,70}: improve support for Apple codec
 variants
Date: Sat, 15 Feb 2025 10:02:33 +1000
Message-Id: <20250215-apple-codec-changes-v1-0-723569b21b19@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJnZr2cC/yWMQQqAIBQFryJ/3QcVddFVokXoqz5EiUIE0d2TW
 g7MzE0VRVCpVzcVnFLl2BuYTlFcp30BS2pMVluvrXE85byB45EQ+TcqBwQfUjSwLlErc8Es13c
 dxud5AZVWfeBlAAAA
X-Change-ID: 20250214-apple-codec-changes-6e656dc1e24d
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Dan Murphy <dmurphy@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shi Fu <shifu0704@thundersoft.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Hector Martin <marcan@marcan.st>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, James Calligeros <jcalligeros99@gmail.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik@protonmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3173;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=75ue9XmQyJ8qhP80PF/AOl1KCjY+SUIQzJSjEnRvCuw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOnrb268Kpqxx+/WY2FLY4/4DzG3N+7VWbr5oo5UrpSnt
 YO5IrNzRykLgxgXg6yYIsuGJiGP2UZsN/tFKvfCzGFlAhnCwMUpABPZeZyR4TDH5wyzDGvO3T3e
 s54v3XRAtLxbx1HiubkI94EDgnn3JjL8ld63WOZ3e2io9OOT6W9nn3zUsiMtesnuKy/PJ3UcfV4
 TyA0A
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

Regards,
James

[1] https://github.com/AsahiLinux/linux/tree/asahi-wip
[2] https://stats.asahilinux.org/

---
Hector Martin (14):
      ASoC: tas2764: Enable main IRQs
      ASoC: tas2764: Power up/down amp on mute ops
      ASoC: tas2764: Add SDZ regulator
      ASoC: tas2764: Add reg defaults for TAS2764_INT_CLK_CFG
      ASoC: tas2764: Mark SW_RESET as volatile
      ASoC: tas2764: Fix power control mask
      ASoC: tas2764: Wait for ramp-down after shutdown
      ASoC: tas2770: Add SDZ regulator
      ASoC: tas2770: Power cycle amp on ISENSE/VSENSE change
      ASoC: tas2770: Add zero-fill and pull-down controls
      ASoC: tas2770: Support setting the PDM TX slot
      ASoC: tas2770: Fix volume scale
      ASoC: tas2764: Set the SDOUT polarity correctly
      ASoC: tas2770: Set the SDOUT polarity correctly

James Calligeros (2):
      ASoC: dt-bindings: tas27xx: add compatible for SN012776
      ASoC: dt-bindings: tas2770: add compatible for TAS5770L

Martin Povišer (11):
      ASoC: tas2764: Extend driver to SN012776
      ASoC: tas2764: Add control concerning overcurrent events
      ASoC: tas2770: Factor out set_ivsense_slots
      ASoC: tas2770: Fix and redo I/V sense TDM slot setting logic
      ASoC: tas2764: Reinit cache on part reset
      ASoC: tas2764: Configure zeroing of SDOUT slots
      ASoC: tas2764: Apply Apple quirks
      ASoC: tas2764: Raise regmap range maximum
      ASoC: tas2770: Export 'die_temp' to sysfs
      ASoC: tas2764: Export 'die_temp' to sysfs
      ASoC: tas2764: Crop SDOUT zero-out mask based on BCLK ratio

 .../bindings/sound/ti,tas2770.yaml       |   1 +
 .../bindings/sound/ti,tas27xx.yaml       |   1 +
 sound/soc/codecs/Kconfig                 |   1 +
 sound/soc/codecs/tas2764-quirks.h        | 188 +++++++++++++++
 sound/soc/codecs/tas2764.c               | 302 +++++++++++++++++++++----
 sound/soc/codecs/tas2764.h               |  29 ++-
 sound/soc/codecs/tas2770.c               | 264 +++++++++++++++++----
 sound/soc/codecs/tas2770.h               |  20 ++
 8 files changed, 711 insertions(+), 95 deletions(-)
---
base-commit: cc7708ae5e2aab296203fcec774695fc9d995f48
change-id: 20250214-apple-codec-changes-6e656dc1e24d

Best regards,
-- 
James Calligeros <jcalligeros99@gmail.com>

