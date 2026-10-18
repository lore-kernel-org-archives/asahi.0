Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3CE37CD53
	for <asahi@lists.linux.dev>; Sun, 18 Oct 2026 05:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792302877; cv=none; b=fLTusGve5M8qsbH7j+X5j1io4LRKXiNZM0SfcVPtM9H2OqSxvKpuKvJy2R6rodOSrx8z7GGDwDRNaMCILBPMCo6K2QTbUQRGMArHTKix9Oi4x12aXpPh7mHlor40AazpxDo8SMzb1Brb5FUac6+BVx7Q4aeZEGSeAehxSMxoSGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792302877; c=relaxed/simple;
	bh=3aMcWhy4tgojr+3EfBTSz3gENuV3a19tf7UPbpG7pQs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fKRYn7UXEsNo2JfNpbLdCdi5Ce4KP6CcFcN+yKcZD0tuPPzvUe1QrXN2uuhpvtkHhj6ElNxU7E+wOentVKkHe//wGb6llWpQv1tTt3GV8WhW9rMOMILqAlYu4ZAUMgZ1agFGAZVSLN/glUTgDJ/73ZT7hx4dvlbSv42Vxmb76RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TgxMRSZV; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TgxMRSZV"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so786343a91.1
        for <asahi@lists.linux.dev>; Sat, 17 Oct 2026 22:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302873; x=1792907673; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6URPsYJRnMhn86UpOhNKjpas0t0SFBwykPnRhuPO50g=;
        b=TgxMRSZVivgBK0F7Qcfq2nmPpgmt3BQYVsQw1t5JEM2K74zGroQKJsSL32YU0sJ0Hl
         MQxFZQuseU/7RjPMSTx6VoxHgYOZFNup6GPf+xsBPNITt/Ho7bsHB+FwWvzkVQuTc8vE
         gG8HVejmxAYayvdTVxkwdY1AuuFB4rHxfgRSIR5ma+hqLADo8PHZqev5Yw6mnwEcChBg
         GNQeyuQzPB1to+pFABCxeK3wMshYXCS+R9uAeWr9llWM2/i7HQ7Op5v+gWbZDNEqOUot
         93wTrIjEyItODIxqR7Id5yGP+Ve45azg8a4Q+bz3kAe12Q6FUczgjYuHkm0MNKEMQAZH
         SzMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302873; x=1792907673;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6URPsYJRnMhn86UpOhNKjpas0t0SFBwykPnRhuPO50g=;
        b=2ZTNw/oprkgRT3T4cqwnXB6QegS+0jmOwULUvC8iv298tdGHBTgkPTfm8JDoOgmS5E
         qs6kNivmG1v7juwaCTehSNUlb4FCjW/ANTr3Kqx5F7Hty3EOxXquDmiO3Vt3ACEE92yq
         oJfeoZz/FOl8IobJ6h/OngnoWDI3d6J6Jv0YRtZRcUco6QJMRC40zMvmDaUy4rZgIo7m
         1Yx0px1GYQcVH9T0FFEUTLnKlLCJfs9P9YpGfi5q8B7Y367nTZRsBF0Db84GakUfwG13
         ez8IKtxyRwD4AZVs7rmcvrsfyspNkw79tVNh8nM9Fj9stfrtXrBzL+rRfitlWOyAxVYf
         ePog==
X-Gm-Message-State: AFq9FYIGmPVXXT9fEaLKdoruNRQClZEYuBJeHJtWAIG1lNW/jOd/DVlO
	gfrvFxKlDihIbuNbmJmpkU5dZnP2e8eMXBqc4gDbfraRQClr9RHDVuLW
X-Gm-Gg: AYBFou0NisguSvnEmhsisyGWMeAfDqULbkVDfS+C6uZE2e2pMrgnkDplo1g7hzNuHWK
	F0WxfoKg5Brl+ZjWQXziT/4wqi5KpBEUudzGGoi9z4VdPbKroJCaAckxT6DUqV7IQCRpa473I6V
	wgOrk968pnZkzWSQd9iYcmho4ME1wWZDwyp8EUYq3ZOSY6Vg/2JlNNkv5CDd1eJTsOendBV0/5/
	oFslDXiPA46J2JvP2ohczzRQoS0vpMyA0eVVxvUm4kzzpXZ0SU64Z+rAraSfF0yjhA00KKEbfDz
	MZlfVWOt1xQ2wPRmhsi0wZnWP/8g8PXDSFV/M0ka0IdeMxdaPCBRktLm45yE3ryLisGRmVypxoU
	6TgyKqn5G3kHbRLsZ90l32Mh2rlNEPdrXuvPjjwtrZsK2Wx7hcom6SnzM7tX2m8AZ70WMpaEOtc
	2jUK4ncPAEXSK5Mh18KLHTf487YK0X3urAnOYe7BJO5yXAEo9YxDhgG0xfO7S8nfaK7pSlPLCpi
	FRCJ17Z+kIr2nCQpjW9LQ+R4yDt2TMa6vxk9sB4OM826/XhxkFNI5Mc67wzSMOeNweqKxSvQ+jk
	gp5FuPDNh3oPjlxG8hcmz74PfcnSM5NNmv8FY3XMiefzWg==
X-Received: by 2002:a17:90b:45:b0:3ab:330d:6e47 with SMTP id 98e67ed59e1d1-3aceefbd753mr2884766a91.10.1792302872659;
        Sat, 17 Oct 2026 22:54:32 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:54:32 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH v3 00/21] Add speaker and headset jack support for Apple
 Silicon Macs
Date: Sun, 18 Oct 2026 15:53:54 +1000
Message-Id: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02Nyw6CMBQFf4V0bc3tA1BX/odxUW4L1Ag1LTQaw
 r9L0SjLSc7MmUgw3ppATtlEvIk2WNcvIHYZwVb1jaFWL0w48AKOLKedQjVq66gQyFDWAqRWZJk
 /vKntc01drh8OY3UzOCQ/LVobBudf61dkaffNcvhnI6NAS8kQOahSmvzcdMre9+g6krKR/0QGI
 DciT2IlS6MLIXJ12IrzPL8BlLVE8+sAAAA=
X-Change-ID: 20260915-macaudio-33c1c4f304da
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Hector Martin <marcan@marcan.st>, 
 Sasha Finkelstein <k@chaosmail.tech>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9750;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=3aMcWhy4tgojr+3EfBTSz3gENuV3a19tf7UPbpG7pQs=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4rklNL2/XD9/46bF9RVXtqTMFZk4gXXpjYn/A/l95
 30Qd+VY1zGRhUGMi8FSTJFlQ5OQx2wjtpv9IpV7YeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjqHV8ZGU5k5/1Vn6t2f4/78i+yL195a3olMZ/ZYVH6M1JLv73omS8jwz2ZiVW
 6Rx/s87Jd8PfJTo9+5RU7BJ8yvV91LeTB9F/KVjwA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Hi folks,

This series adds the machine driver and related bindings for the
primary audio subsystem on Apple Silicon Macs. The macaudio
machine driver is based on an RFC sent many years ago
by Martin Povišer[1]. 

The driver uses the DPCM model to dynamically
glue a backend DAI (combination of MCA ports and codecs) to a
frontend PCM. While this theoretically allows us to route any
backend to any frontend, this is not used in practice; the "Primary"
frontend is always used for the headset codec and the "Secondary"
is always used for the speakers.

The audio subsystem on Apple Silicon Macs is rather complicated and
the speaker arrangement is highly variable; some machines have a
single mono woofer while others pull together multiple woofers
and tweeters into a single stereo pair. Every machine also includes
a headset jack, and some also have their own builtin microphones which
are handled by a separate coprocessor with its own driver.

Many functions which are handled by firmware on other platforms
must be handled by the kernel or by userspace. Most notably, speaker
protection is handled by speakersafetyd[2], a userspace daemon.
Speaker protection is handled in userspace due to the expensive
floating point calculations and amount of per-machine configuration
data required.

The machine driver facilitates this by exposing a capture
PCM from which the voltage and current across each speaker's voice
coil can be read. Given that there are absolutely no hardware or
firmware level failsafes preventing permanent damage to the fragile
speakers found on these machines, the driver also implements a
failsafe that will significantly attenuate and lock the gains
of every connected speaker unless speakersafetyd is running.

Version 2 of this series drops numerous fixes and semi-related
patches that are not strictly necessary for the machine driver
to function correctly. These will be resubmitted at a later date.

Adding the required Devicetree updates for M3 series devices would
have bloated this series to an unreasonable size as they are still
missing most prerequisite hardware nodes. They will be added in a
future series.

Regards,
James

[1] https://lore.kernel.org/asahi/20220606191910.16580-1-povik+lin@cutebit.org/
[2] https://github.com/AsahiLinux/speakersafetyd

---
Changes in v3:
- Add TAS5770L compatible to TAS2770 driver to match binding
- Fix incorrect Right Tweeter prefix on J415
- Make reference to dai-common.yaml in cs42l{42,84} bindings for
  common properties
- Fix Devicetree binding formatting in macaudio binding
- Sort macaudio compatible list by fallback compatible
- Add references to fixed regulators for machines with CS42L83
- Fix iMac model compatibles (they are compatible with each other)
- Fix Mac Mini J474 name
- Rework kctl activate/deactivate to be a more pure wrapper of snd_ctl_activate_id
- Check for kctl->put before iterating in soc_set_enum_kctl
- Allocate structs on heap in soc_set_enum_kctl
- Rework snd_soc_set_enum_kctl to be neater
- Refactor snd_soc_set_enum_kctl to eliminate ret assignment
- Set evalue.id and info.id in soc_set_enum_kctl
- Guard against pointer arithmetic errors/null pointer deref in volume limiter
- Replace stored snd_soc_card with static struct
- Mark speaker BEs/FEs as nonatomic
- Link to v2: https://patch.msgid.link/20261004-macaudio-v2-0-7b47ed6335a8@gmail.com

Changes in v2:
- Drop patches that are only tangentially related (will be submitted
  later)
- Drop wildcard-matching API for kctls
- Relabel J473 sound model to Mac mini
- Align Devicetree changes with upstream bindings
- Relax Cirrus CS42L42 required properties to keep DT style checker happy
- Define missing properties in CS42L{42,84} bindings
- Fix mistyped DT properties
- Improve macaudio DT binding description
- Drop generic fallback compatible for apple,macaudio
- Drop now-redundant descriptions from other compatibles
- Constrain DAI link link-name property with an enum of valid values
- Drop MCA node from macaudio binding example
- Fix heading comment style in macaudio
- Drop obsolete module parameter
- Replace string functions with safer variants
- Replace dropped wildcard API with searching for full kctl name
- Rework idle props parsing to better surface errors/invalid Devicetree entries
- Add additional locking to backend setup
- Take controls_rwsem when safety functions are called from workqueues
- Replace all mutex{,un}lock calls with guard/scoped_guard
- Fix incorrect amp gain value for j37x config struct
- static const-ify all config structs
- Cancel control lock update workqueue on teardown
- Drop unused DAPM widget
- Fix commented-out safe volume calculations
- Drop speaker lock kcontrol ownership checks and related core API extension
- Link to v1: https://patch.msgid.link/20260920-macaudio-v1-0-741cc20a74e5@gmail.com

To: David Rhodes <david.rhodes@cirrus.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
To: Martin Povišer <povik+lin@cutebit.org>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Shenghao Ding <shenghao-ding@ti.com>
To: Kevin Lu <kevin-lu@ti.com>
To: Baojun Xu <baojun.xu@ti.com>
To: Sen Wang <sen@ti.com>
To: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>
To: Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Cc: patches@opensource.cirrus.com
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org

---
James Calligeros (16):
      ASoC: dt-bindings: cs42l84: Document sound-name-prefix property
      ASoC: dt-bindings: cs42l42: Document additional dai-common properties
      ASoC: tas2770: Add compatible for TAS5770L
      arm64: dts: apple: t8103-jxxx: Add regulators for CS42L83 power supply
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

Martin Povišer (5):
      ASoC: dt-bindings: Add binding for Apple Silicon Mac audio
      ASoC: ops: Introduce 'snd_soc_ctl_activate'
      ASoC: ops: Introduce 'soc_set_enum_kctl'
      ASoC: card: Let 'fixup_controls' return errors
      ASoC: apple: Add macaudio machine driver

 .../bindings/sound/apple,macaudio.yaml   |  212 +++
 .../bindings/sound/cirrus,cs42l42.yaml   |    7 +
 .../bindings/sound/cirrus,cs42l84.yaml   |    5 +
 .../arm64/boot/dts/apple/t6000-j314s.dts |    5 +
 .../arm64/boot/dts/apple/t6000-j316s.dts |    5 +
 .../arm64/boot/dts/apple/t6001-j314c.dts |    5 +
 .../arm64/boot/dts/apple/t6001-j316c.dts |    5 +
 .../arm64/boot/dts/apple/t6001-j375c.dts |    5 +
 .../arm64/boot/dts/apple/t6002-j375d.dts |    5 +
 .../boot/dts/apple/t600x-j314-j316.dtsi  |  135 ++
 .../arm64/boot/dts/apple/t600x-j375.dtsi |   65 +
 .../arm64/boot/dts/apple/t6020-j414s.dts |    5 +
 .../arm64/boot/dts/apple/t6020-j416s.dts |    5 +
 .../arm64/boot/dts/apple/t6020-j474s.dts |    5 +
 .../arm64/boot/dts/apple/t6021-j414c.dts |    5 +
 .../arm64/boot/dts/apple/t6021-j416c.dts |    5 +
 .../arm64/boot/dts/apple/t6021-j475c.dts |    5 +
 .../arm64/boot/dts/apple/t6022-j475d.dts |    5 +
 .../boot/dts/apple/t602x-j414-j416.dtsi  |   35 +
 .../boot/dts/apple/t602x-j474-j475.dtsi  |   10 +
 arch/arm64/boot/dts/apple/t8103-j274.dts |   72 ++
 arch/arm64/boot/dts/apple/t8103-j293.dts |  116 ++
 arch/arm64/boot/dts/apple/t8103-j313.dts |   87 ++
 arch/arm64/boot/dts/apple/t8103-j456.dts |   43 +
 arch/arm64/boot/dts/apple/t8103-j457.dts |   43 +
 .../arm64/boot/dts/apple/t8103-jxxx.dtsi |   32 +
 arch/arm64/boot/dts/apple/t8112-j413.dts |  108 ++
 arch/arm64/boot/dts/apple/t8112-j415.dts |  132 ++
 arch/arm64/boot/dts/apple/t8112-j473.dts |   62 +
 arch/arm64/boot/dts/apple/t8112-j493.dts |  108 ++
 include/sound/soc-card.h                 |    2 +-
 include/sound/soc.h                      |    6 +-
 sound/soc/apple/Kconfig                  |   18 +
 sound/soc/apple/Makefile                 |    4 +
 sound/soc/apple/macaudio.c               | 1715 +++++++++++++++++++++++++
 sound/soc/codecs/tas2770.c               |    1 +
 .../soc/mediatek/mt8188/mt8188-mt6359.c  |    4 +-
 sound/soc/soc-card.c                     |   12 +-
 sound/soc/soc-core.c                     |    5 +-
 sound/soc/soc-ops.c                      |   99 ++
 40 files changed, 3196 insertions(+), 7 deletions(-)
---
base-commit: 74612d0b448fe745e80cda87fe49ac3c102ccc1f
change-id: 20260915-macaudio-33c1c4f304da

Best regards,
--  
James Calligeros <jcalligeros99@gmail.com>

