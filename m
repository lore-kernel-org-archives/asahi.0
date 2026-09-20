Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2CB3438B9
	for <asahi@lists.linux.dev>; Sun, 20 Sep 2026 04:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880112; cv=none; b=akIfuAZuHoE1p8GlOny/EgJeaXy3tN9ZnnRE25pgZvbmdcu0mk48bwLF5kMBUIKXNWmq82uzEKYs/R0kJUDyABhRxYgsfRZDhBcjxYEpWPdk6RTGVrYqNEV89wsOtcOBCSg6FH/jgP6TT/wjIDpm3oocexjOytpjWJwD+QMgRk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880112; c=relaxed/simple;
	bh=CFj0wXW59irlghkyjdPh8VaRRF+k+fzH58xy0dEOiyw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CQou101Ii1TqSfPCqJOtzdyTE83RB83oH8Ec6Ni3PdlAtt+eD7EyT/nTkQC6RbFmsC4vtltnRS4as9sHsTbMAMNyhTzTYUnfSlhcsZEmACBTwOL6cTxC7/5S3pNuRMABQNw7BNdzg3ODykYnaWcc8orIDH6+zvp8s0MgTNaTm1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QdhgGQfa; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QdhgGQfa"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2dd88a115ebso16258375ad.2
        for <asahi@lists.linux.dev>; Sat, 19 Sep 2026 21:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880109; x=1790484909; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zHfStuZ9Xz/dxvNMxRM9GTvjt+Pmq5h7RaUmSX+aOCo=;
        b=QdhgGQfamepLbVfUebIarjhBKSe7AYRmX92ND5xQztxRWnp9cdveKNN8OBYy8fd1qU
         K+ggE1AGsHjNwD9NWnD2UK0AWgGaU9PGaaujQyvN6VbC1yoL/QmL6lCu1famae/CENfR
         ni1Yg3guZ4HCHS5roSJsTfSrRxq39Tmj8vnXGpT1Y6siOgFqDVVYV7cO7klURscSvMM3
         uoXo1qZ16dQRmL0Hp+2xCfjeVJprHtus8AsxxHaf30Bf/yTkS/FnPwgWDYRozKKF7kSD
         1FKatfVm5c2wj3YSQQJ0gA/EWXqHMne1R1A69SWbKn/ifzx6HEybd5Twom16T+G29yUe
         Kssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880109; x=1790484909;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zHfStuZ9Xz/dxvNMxRM9GTvjt+Pmq5h7RaUmSX+aOCo=;
        b=CzXB2qnYuPXVYsDAIPjpMFCjofG/brRpJLtsJNHoows18SM7eJheULmSUHYU0XVgXM
         4xvwO6l4iwyNTtknktrfTJYTXg/RbFa83DDxTrCaq9zrq0KI6wsDcVFfrpqeb3GdI7DJ
         z0kaWctpWlD6nEMmXjhrC93gao6XKh94e1GeA6eEnrbd9tLOpPMBqlG8onrAwF0s2gJg
         +Q2n4WQiGvjiF0I9/xOeg8Zke07I2v8q4VKLrPH5Js70D9n1acr2FhF/nixCSBorvKaJ
         wwDdiJlnaVpNjgLRxdkAwNkxLzBv2XLa8P9oX3wlLQEshw+F1qpslsEEmIHkl06FWXA2
         jCZQ==
X-Gm-Message-State: AFuF++mi5TYmOy5Qae8jvXtHYqe6pzLChJIVNv4uzOkbSFOIvZSkZEWS
	qf5KEuc+iH7qFIBSg5pV/wdyQP614wNYnBvgLFe5s8gReNV3UOs3mlYv
X-Gm-Gg: AYBFou1QjPasJdfmyWEYwexY1z8QIVSl0umgEWqa9rp7ksOGP77p2nb8IJ3k8tgz4QR
	h10e+6wnO41LAVQGj3LgbevyG7OtSKvDxqm6AevDvozpLzaRwYjMke/OMh8VmlsjubGqHVQzZS7
	QM7Koh9N1GlQiX4XJIt2+UcgLBqTusgMyV4R0QIEdsprxNmArxuAvyuOrvKH04iO1MDQP28FXJl
	WLMu5ebmENsQtPgrUclrL6+tE0cfIGnPz3hQFi+ZfcwsZVzNExmCsstPysUhNqn2aoPfxrQ7EQ/
	rLjem2EhDdsCWen2IZ+stCi6pNZX/XQnKmpzJ16gR6/3pdlHOItMduLrUrv1SfdcX7/CqnLnII8
	wAX7RrxG04P79uKTxzutMuc8VJIHgsgwY59dz3Dm8s/HnqKz8y1wZlkPkKSDw4kAVsd+XvkAJOb
	UnUkqpgkAaw/WRV9Ip70xp6lqUPq3v2Jrr3d4siGi5RoMy30YpPT62VOnGGW1TQxRVEwv/Y7ery
	MoYva6ayg2ZwjfIF/N2F8/lzye/Mt8gZ6hZLOGdIQYagLvgG2NQE29FT1spLYddDn7l4ybAcJhF
	z360zczAlS0X24hlqJvt41/HM3XmdhDy+3MVV7jwwl/iYb8i8By5J1jMyg==
X-Received: by 2002:a17:903:bcf:b0:2dd:c100:425a with SMTP id d9443c01a7336-2ddc1004524mr36709245ad.62.1789880108858;
        Sat, 19 Sep 2026 21:55:08 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:55:08 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH 00/28] Add speaker and headset jack support for Apple
 Silicon Macs
Date: Sun, 20 Sep 2026 14:53:39 +1000
Message-Id: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0NT3dzE5MTSlMx8XWPjZMNkkzRjA5OURCWg8oKi1LTMCrBR0bEQfnF
 pUlZqcglIv1JtLQBCLL0xbAAAAA==
X-Change-ID: 20260915-macaudio-33c1c4f304da
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik@protonmail.com>, 
 Hector Martin <marcan@marcan.st>, Sasha Finkelstein <k@chaosmail.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6822;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=CFj0wXW59irlghkyjdPh8VaRRF+k+fzH58xy0dEOiyw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr06V5yx5xv/43uWvHJDGm6S8k1Samr9oaOf/cZ57DC
 +f+vDCrvGMiC4MYF4OlmCLLhiYhj9lGbDf7RSr3wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6xjpGDFycAjDVaesZ/vBV8e3vZv5ismfvufyrfV/qHs47e7ivIo4jodXY6gqv0HdGhvfyKuF
 nzV4Kz+j1nHm94OL6ptkiKne/cl15LKU/zXyRAicA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Hi folks,

This series finalises support for the main
audio subsystem on Apple Silicon Macs. It adds a machine driver
called macaudio, which is based on an RFC sent many years ago
by Martin Povišer[1]. The driver uses the DPCM model to dynamically
glue a backend DAI (combination of MCA ports and codecs) to a
frontend PCM. While this theoretically allows us to route any
backend to any frontend, this is not used in practice; the "Primary"
frontend is always used for the headset codec and the "Secondary"
is always used for the speakers.

The audio subsystem on Apple Silicon Macs is rather complicated.
The speaker arrangement is highly variable; some machines have a
single mono woofer while others pull together multiple woofers
and tweeters into a single stereo pair. The driver also exposes
the headset jack's capture PCM. The builtin microphones on equipped
Apple Silicon Macs are not handled by this driver as they are
connected to the Always-On Processor (not actually always on).

Many functions which are handled by firmware on other platforms
must be handled by the kernel or userspace. Most notably, speaker
protection is handled by speakersafetyd[2], a userspace daemon.
The macaudio machine driver facilitates this by exposing a capture
PCM from which the voltage and current across each speaker's voice
coil can be read. Given that there are absolutely no hardware or
firmware level failsafes preventing permanent damage to the fragile
speakers found on these machines, the driver also implements a
failsafe that will mute and lock the kcontrol of every speaker
unless speakersafetyd is running.

This (rather large, sorry) series is split up into logical sections:

1. Devicetree binding for the macaudio driver;
2. Minor ALSA/ASoC fixes required to drive the audio subsystem on
   these machines correctly;
3. Minor ALSA/ASoC API additions to facilitate the driver's
   integration with speakersafetyd and the insane combinatorics
   required to cater for such a wide array of possible setups;
4. The machine driver itself; and
5. Devicetree updates for M1 and M2 series machines.

Adding the required Devicetree updates for M3 series devices would
have bloated this series to an unreasonable size as they are still
missing most prerequisite hardware nodes. They will be added in a
future series.

Regards,
James

[1] https://lore.kernel.org/asahi/20220606191910.16580-1-povik+lin@cutebit.org/
[2] https://github.com/AsahiLinux/speakersafetyd

---
Hector Martin (6):
      ASoC: cs42l42: Set a faster digital ramp-up rate
      ASoC: apple: mca: Fix PD link double-frees
      alsa: pcm: Remove the qos request only if active
      ALSA: dmaengine: Always terminate DMA when a PCM is closed
      ALSA: control: Add kcontrol callbacks for lock/unlock
      ASoC: ops: Export snd_soc_control_matches()

James Calligeros (13):
      ASoC: tas2764: Set up V/ISENSE on codec probe
      arm64: dts: apple: t8103-j274: Add speaker/headset jack nodes
      arm64: dts: apple: t8103-j313: Add speaker/headset jack nodes
      arm64: dts: apple: t8103-j293: Add speaker/headset jack nodes
      arm64: dts: apple: t8103-j45x: Add headset jack nodes
      arm64: dts: apple: t8112-j413: Add speaker/headset jack nodes
      arm64: dts: apple: t8112-j415: Add speaker/headset jack nodes
      arm64: dts: apple: t8112-j473: Add speaker/headset jack nodes
      arm64: dts: apple: t8112-j493: Add speaker/headset jack nodes
      arm64: dts: apple: t600x-j31x: Add speaker/headset jack nodes
      arm64: dts: apple: t600x-j375: Add speaker/headset jack nodes
      arm64: dts: apple: t602x-j41x: Add speaker/headset jack nodes
      arm64: dts: apple: t602x-j47x: Add speaker/headset jack nodes

Martin Povišer (9):
      dt-bindings: sound: Add Apple Macs sound peripherals
      ASoC: cs42l42: Fix typo
      ALSA: Support nonatomic dmaengine PCMs
      ASoC: ops: Move guts out of snd_soc_limit_volume
      ASoC: ops: Accept patterns in snd_soc_limit_volume
      ASoC: ops: Introduce 'snd_soc_deactivate_kctl'
      ASoC: ops: Introduce 'soc_set_enum_kctl'
      ASoC: card: Let 'fixup_controls' return errors
      ASoC: apple: Add macaudio machine driver

 .../bindings/sound/apple,macaudio.yaml   |  235 ++++
 .../arm64/boot/dts/apple/t6000-j314s.dts |    5 +
 .../arm64/boot/dts/apple/t6000-j316s.dts |    5 +
 .../arm64/boot/dts/apple/t6001-j314c.dts |    5 +
 .../arm64/boot/dts/apple/t6001-j316c.dts |    5 +
 .../arm64/boot/dts/apple/t6001-j375c.dts |    5 +
 .../arm64/boot/dts/apple/t6002-j375d.dts |    5 +
 .../boot/dts/apple/t600x-j314-j316.dtsi  |  128 ++
 .../arm64/boot/dts/apple/t600x-j375.dtsi |   58 +
 .../arm64/boot/dts/apple/t6020-j414s.dts |    5 +
 .../arm64/boot/dts/apple/t6020-j416s.dts |    5 +
 .../arm64/boot/dts/apple/t6020-j474s.dts |    5 +
 .../arm64/boot/dts/apple/t6021-j414c.dts |    5 +
 .../arm64/boot/dts/apple/t6021-j416c.dts |    5 +
 .../arm64/boot/dts/apple/t6021-j475c.dts |    5 +
 .../arm64/boot/dts/apple/t6022-j475d.dts |    5 +
 .../boot/dts/apple/t602x-j414-j416.dtsi  |   35 +
 .../boot/dts/apple/t602x-j474-j475.dtsi  |   10 +
 arch/arm64/boot/dts/apple/t8103-j274.dts |   60 +
 arch/arm64/boot/dts/apple/t8103-j293.dts |  104 ++
 arch/arm64/boot/dts/apple/t8103-j313.dts |   75 ++
 arch/arm64/boot/dts/apple/t8103-j456.dts |   33 +
 arch/arm64/boot/dts/apple/t8103-j457.dts |   33 +
 arch/arm64/boot/dts/apple/t8112-j413.dts |  101 ++
 arch/arm64/boot/dts/apple/t8112-j415.dts |  125 ++
 arch/arm64/boot/dts/apple/t8112-j473.dts |   55 +
 arch/arm64/boot/dts/apple/t8112-j493.dts |  101 ++
 include/sound/control.h                  |    7 +
 include/sound/cs42l42.h                  |    4 +
 include/sound/soc-card.h                 |    2 +-
 include/sound/soc.h                      |    8 +-
 sound/core/control.c                     |   16 +-
 sound/core/pcm_dmaengine.c               |   37 +-
 sound/core/pcm_native.c                  |    5 +-
 sound/soc/apple/Kconfig                  |   19 +
 sound/soc/apple/Makefile                 |    4 +
 sound/soc/apple/macaudio.c               | 1729 +++++++++++++++++++++++++
 sound/soc/apple/mca.c                    |   16 +-
 sound/soc/codecs/cs42l42.c               |   12 +-
 sound/soc/codecs/tas2764.c               |   61 +-
 .../soc/mediatek/mt8188/mt8188-mt6359.c  |    4 +-
 sound/soc/soc-card.c                     |   12 +-
 sound/soc/soc-core.c                     |    5 +-
 sound/soc/soc-ops.c                      |  182 ++-
 44 files changed, 3268 insertions(+), 73 deletions(-)
---
base-commit: 0e5a521109e0d2fb7ac226bd6301ec1facca1c26
change-id: 20260915-macaudio-33c1c4f304da

Best regards,
--  
James Calligeros <jcalligeros99@gmail.com>

