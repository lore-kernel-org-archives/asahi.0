Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691617;
	b=qE0zrAL8vuxd6tY/1V4PciGR2MFmUUyJiFI1Fycf93tlThiIZwTOoq4GO0d5B2e6EyaF
	 Fy2SfIdkgjc1aSf0YX9OrNoCbMWq1aBDpmrRPiz2mrybKQ/Mj3sGEVNAmIXGUvqlomwLn
	 mqryxWm6eeulYbNEIBZIDOcSW9C42V9SsArgdye9WgBbzSpBVGfD1y7dMIwxFUzmRV8iX
	 VcM+Nl7sYZ4ogDHeWvCSCJItaLNdl+LwyPBG/uUsZJGgoCY5IJv/pXpA10nFRGAvSBGMs
	 eRGiQpv9eQK10ZpblmRvnNuZ3Eld/OGIIKsVIZMTAIoBrP4cRKIdyTNQKyaSP29t6Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=RY/sXJR+//XYZDqNeUIB/EseqfgzZRdyY7oVg4AHbJk=;
	b=s9iwNG+xPlDyiwQnFATj71/vFSiay2zBeewkJLDyLqI0Y7c+Wan3T/FPOK5d2B3rbyOk
	 A90I8Ii2efEWZRnDbcJp8CZsJlTQ/e+ezo9geKqL8ELWNh4MWmnlzGTm2JTPMQOk5naTY
	 HMk6NsNBDr9609Y5YwGnS3HfQT5VJzSnnkpP081QLibkE5ZLyD/sz20PZ0ixalDnjAmni
	 elxEO0NSgQLdDVs76jYlrgr8iOyCEytGJ3nNV/WgjDRD7u7SIi32dBTaPR5PAHUKXRbJn
	 8hz2yXJZV3f1bm57DNubVDxTgCKCvBF+HHRfQXztDcR6Knb6DCff8/xIygl/w1UQMxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YGAohIqY;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C58606A329
	for <asahi@lists.linux.dev>; Tue,  3 Nov 2026 07:40:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71C58606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YGAohIqY
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cd67cc518a6so2684553a12.1
        for <asahi@lists.linux.dev>; Mon, 02 Nov 2026 23:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691610; x=1794296410; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RY/sXJR+//XYZDqNeUIB/EseqfgzZRdyY7oVg4AHbJk=;
        b=YGAohIqYnCmHKoHSZnxXCyPd55pd8XyaQtio++G2mAQZvObhG54eJbbl1IWPY7ZTcf
         O6+gCbfUGdJGdCNuQ2yreK000GbvOcWKTORx/XITOK/GJlc2UU8sSs23BBHNcYWL7CXR
         Hd2q8w6bLF+mXEy5s43M2ShaDmkoSDKy+ms+Y5lTMDnEaEh4kru9qaoIwtniTszMmp2U
         /4d8uZdgYP+s5OEnySh7wnGRAyxzS/bB/D2aErP2BQUejB0cLfSK/YXom7sqCApOpM+J
         uUFq2qYYbdQynhFdNBpnA7Ssmtm535V77kUafdnciblT7awc8Q1TbvZMUxhy8hZvinJH
         NC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691610; x=1794296410;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RY/sXJR+//XYZDqNeUIB/EseqfgzZRdyY7oVg4AHbJk=;
        b=2amMXb+A+WuIayuhzye2anbcBWcJ7ltELkMgzt0u7cEOC7eWoMXFOjiPWwbUHeOfpV
         7XXHeAo1Z+AaRrXqXC7c+MGFZF1md+iUG8cth1YuQF6LKmhLMWXwj9GvNhCzaXc2Y4Y3
         3nyr6E/Pbu2v5UJktQWWTPHZOMLijzTNvAcxSpNMeuugQlc8LieJHGmx1fj1py0JLxWQ
         D3ZdaTJLPWMOmHOgbm9AdyxEzCiZJXjihYizzK/34MRwlQCL8catn9P/z1+LT0E57Xqf
         BVHyDejJq3tEoVRcGnVQ7B1i+dYEzMxASiq+Ur84bDDJIrhNZRjzD8KVjq5ou4niVXma
         gO8g==
X-Gm-Message-State: APuU4Z/7qVgY3gNVl9C2JNbdovWNFFErj4J+p19299oFpWQSHEFPCoaV
	H3TfZHm3EuzqEB+ZzYGOSGfo9xladkfQf7FbtRmKFr4nhgyeWXQnHHe3
X-Gm-Gg: AYBFou2mJenyb80ZE4mn1CbY501eOz7mv89ZqIIJpXn4uk8VDpRk6N1QZ1DnlP7J4TL
	jbPyrbJ95vkeg+JMaC/a2MCzC6jg2Y35bS77lg+mfa8HQFKf//qEHa3XSfdFSWaL2cE6mZ1l6Ps
	w02Mcutv0QhVhqG03q+bXbs8Bcka6dh4IV/QHteH2A0D/hIJJtn7Xdg4EAiLmlC1tqpELGdHB45
	b3Tt0JGeGqie+X31XiY2o0YSqsQ7cbvIOrPELkHZuW8wUgo6GYErq+dXdMLONANg913f/iaASof
	b1ccEw0guLbZwAFVKxeiprsf5K4/oKT9DpAA7EoQipJUTiIsMczgCyIz8zUaCpkwYTuXbN0ueMW
	2HV/dt0gAXLoMzjAs0jF4UXcp9WKDmIbZejXLouqWxr6MT5RyGcWG/n8cjSByU2JtM+3/jfLMMg
	vcDOrg02z8DSieEr1yAtra6IX1neydJ5wg9gaQvRcdtQCrMPVFERVlNp5tV9PstFeGWk5mTwQvF
	P0wotGN4WAbcBYt9IlQ16q6yJBR0ba23zT4wla1BRHlEM/c6QiQ7opG6nbn8YDmAIdwCEYIKUrc
	q86cugp2Qwe6c0nDxam0/0L6Nj4IxEX4pZpjKowAHFxwjzHKtpcLoHsVyG+0Wnsr9KuM6a11PFA
	7I6NTnL/62Cd31TNaOjTbrNJ44vMcZYnwnSMQpXLPMXoWCkekK5QqtLL9mfwBO5voJyYXYss4ps
	ypb+8=
X-Received: by 2002:a17:90b:4cd0:b0:3a4:f8da:2478 with SMTP id 98e67ed59e1d1-3ae8974b76dmr9984235a91.29.1793691609740;
        Mon, 02 Nov 2026 23:40:09 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:40:09 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH v4 00/22] Add speaker and headset jack support for Apple
 Silicon Macs
Date: Tue, 03 Nov 2026 17:39:48 +1000
Message-Id: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13Nyw6CMBQE0F8hXVvTFw9d+R/GxaW9QI1QQ4FoC
 P9ui0aJy0nmzMzEY2/Rk2Mykx4n663rQlC7hOgGuhqpNSETwUTGDjylLWgYjXVUSs21qiRTBki
 o33us7GOdOl/e2Y/lFfUQfWw01g+uf65fE4+9z6xgv9mJU0ZzxbUWDHKF6aluwd722rUkzk7iC
 zljagNFhKXK0WRSplD8Q7mBvNhAGSCUpqry8GsQtnBZlhc4fx/SJAEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11310;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=6g7QVojQmSRkyvrUrdmAVUMi6as1nE3Ga0sd7SW9+ZE=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+09t28WuuO3Qo91/7y7c36ur8VBM8utk9aTVajvM/
 i7PbZjH0DGRhUGMi8FSTJFlQ5OQx2wjtpv9IpV7YeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjqzl6Gf0bpGu/MXu65yBy5drbCOwGfdfOPKbB817p/R2CT/KfvH34xMix/fca
 t58X51o0VSjKeubxH5iV5SJgpPWjny+9qiCq5xAcA
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
Changes in v4:
- Allow additional properties from dai-common in CS42L42 and CS42L84
- Extend base tdm-slot.yaml idle mode props instead of defining bespoke ones
- Clean up macaudio binding formatting
- Give CS42L83 regulators unique node names
- Drop useless reg property from macaudio dai-link, replace with named
  nodes for headphone and speaker links
- Fix up snd_soc_set_enum_kctl declaration to match altered argument names
- Set TDM idle mode/mask for single-codec machines
- Put card and jack back on the heap; not having these around causes more
  problems than it solves
- Prevent headphones from routing to the secondary mux, and speakers from
  routing to the primary mux as the primary mux cannot drive the speakers
  anyway
- Avoid leaking OF node references on failed driver probes
- Replace platform_remove with devres release action to cancel enqueued work
- Use str_has_prefix for checking speaker link name
- Link to v3: https://patch.msgid.link/20261018-macaudio-v3-0-abdff7741dea@gmail.com

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
James Calligeros (17):
      ASoC: dt-bindings: cs42l84: Allow referenced dai-common properties
      ASoC: dt-bindings: cs42l42: Allow referenced dai-common properties
      ASoC: dt-bindings: tdm-slot: Allow indexed TDM idle properties
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

 .../devicetree/bindings/sound/apple,macaudio.yaml  |  195 +++
 .../devicetree/bindings/sound/cirrus,cs42l42.yaml  |    5 +-
 .../devicetree/bindings/sound/cirrus,cs42l84.yaml  |    8 +-
 .../devicetree/bindings/sound/tdm-slot.yaml        |   34 +-
 arch/arm64/boot/dts/apple/t6000-j314s.dts          |    5 +
 arch/arm64/boot/dts/apple/t6000-j316s.dts          |    5 +
 arch/arm64/boot/dts/apple/t6001-j314c.dts          |    5 +
 arch/arm64/boot/dts/apple/t6001-j316c.dts          |    5 +
 arch/arm64/boot/dts/apple/t6001-j375c.dts          |    5 +
 arch/arm64/boot/dts/apple/t6002-j375d.dts          |    5 +
 arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi     |  131 ++
 arch/arm64/boot/dts/apple/t600x-j375.dtsi          |   61 +
 arch/arm64/boot/dts/apple/t6020-j414s.dts          |    5 +
 arch/arm64/boot/dts/apple/t6020-j416s.dts          |    5 +
 arch/arm64/boot/dts/apple/t6020-j474s.dts          |    5 +
 arch/arm64/boot/dts/apple/t6021-j414c.dts          |    5 +
 arch/arm64/boot/dts/apple/t6021-j416c.dts          |    5 +
 arch/arm64/boot/dts/apple/t6021-j475c.dts          |    5 +
 arch/arm64/boot/dts/apple/t6022-j475d.dts          |    5 +
 arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi     |   35 +
 arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi     |   10 +
 arch/arm64/boot/dts/apple/t8103-j274.dts           |   70 +
 arch/arm64/boot/dts/apple/t8103-j293.dts           |  114 ++
 arch/arm64/boot/dts/apple/t8103-j313.dts           |   85 +
 arch/arm64/boot/dts/apple/t8103-j456.dts           |   43 +
 arch/arm64/boot/dts/apple/t8103-j457.dts           |   43 +
 arch/arm64/boot/dts/apple/t8103-jxxx.dtsi          |   32 +
 arch/arm64/boot/dts/apple/t8112-j413.dts           |  104 ++
 arch/arm64/boot/dts/apple/t8112-j415.dts           |  128 ++
 arch/arm64/boot/dts/apple/t8112-j473.dts           |   58 +
 arch/arm64/boot/dts/apple/t8112-j493.dts           |  104 ++
 include/sound/soc-card.h                           |    2 +-
 include/sound/soc.h                                |    6 +-
 sound/soc/apple/Kconfig                            |   18 +
 sound/soc/apple/Makefile                           |    4 +
 sound/soc/apple/macaudio.c                         | 1734 ++++++++++++++++++++
 sound/soc/codecs/tas2770.c                         |    1 +
 sound/soc/mediatek/mt8188/mt8188-mt6359.c          |    4 +-
 sound/soc/soc-card.c                               |   12 +-
 sound/soc/soc-core.c                               |    5 +-
 sound/soc/soc-ops.c                                |   99 ++
 41 files changed, 3182 insertions(+), 28 deletions(-)
---
base-commit: f308b528e539c2a14dc7d59201cff45d89b00ab2
change-id: 20260915-macaudio-33c1c4f304da

Best regards,
--  
James Calligeros <jcalligeros99@gmail.com>

