Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1813A22AE59
	for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 08:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739867757; cv=none; b=H5No3fdU83337nQbxVDvcO68SG3DHViCKOWP3ldmjeci/Z7/+0ND1dI+EQ45lXhf4Gp2CcAsgK09aJ/aXzq1CFObPOBln6t+wKhPYhu/S+Xby2/ig1HSUNko0FIRTWbRtEBJc+Qlo0Rg5BemTGwVWRMuVKg5ujZvFZTF5Kht61s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739867757; c=relaxed/simple;
	bh=sFfR4eIGWeqHKx7p9Z7iGt8U9lbfIZhokJqUsiq2T+U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Qg8yEBbI0OzE4fL8pVnCVeQcXhzCdkpjTYGj7knpXrDP5uGS0lw7fKtJ7ywgmp5ZNsIBdwkXkHRDWsyhO3YTx01wN4wXsTy8PoNUVuoVeY6SHvG/3BaEXh0j8m4PB87IfEPA2WSfRAW5rUTc//Vjfn2sMNTvvCqsA6Ph9pk4KN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jl4R9RF3; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jl4R9RF3"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-220f4dd756eso64589365ad.3
        for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 00:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739867755; x=1740472555; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UasE+6v+LUcf32VIrcU6EoAVg1auG4g+9EdoM3brOBo=;
        b=Jl4R9RF3Wju8Lf4aRhfYxDhHM+59hvwBN/5rV3EFWbYYPUFRqgVWCtHhKXUGohBRl9
         ko/ItFvyM3lEpuFVH8l+XwJLrGMipJISmN/XmJQW3itQrpjshE2F/VD+XfyP9azxggho
         Kh28WxvgzpdZgGjQfHwervvURffAD9vqjFSSau9NERtgl1RXmABoQekoQv6QDnryI2Nh
         EBWUdL6I+8qoERb6tzMxa3cmtHlFjEfw/iGYyIl+TChrLDr2/e6rG82tv8NghYps6953
         hxNLvMt5nor6i+BoFgg+w9Nbq9eMS6ysq5AZOM2gYxizug/k2nGj6EdLQMECzY/Ix+QD
         DGmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739867755; x=1740472555;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UasE+6v+LUcf32VIrcU6EoAVg1auG4g+9EdoM3brOBo=;
        b=sOIbz1qltditYchqdYAuCBrZXkCMCOWjrY3cJ/gFxgh9SxL7llaRmBiQdKlugIxZUF
         lu23KBQ4pqbym9m/jHR1QGeipkLaWXFAG0znhBG4JY1YeKauvc4XgSQjo0nDYbGieQLE
         hO5xmkIDD+51/04c87/LBlwZ3a2Nm1hLDGcOdv0iLl0heqrxPVNtFhocxkjab4pRly8F
         649r6eGHlRnLr++XEgX6+3n+FWVcVSZsxz+fAmRW7Uh7TXkjru66zPk1vLl6rS0mZdk2
         JVeH9+wZyB+e8GjPWM2JcGnPywPo0MavO8DlpPBhFI8bkTc8SKqAO47rSz7/Dlzw6opl
         edfA==
X-Forwarded-Encrypted: i=1; AJvYcCWDRrcMqeuApnUKQjHiQSq9Zch2uZOzo4Lpxsq+hGpkMEtx4I+lMoH2peWNrGvz2JereXZY2A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyMnSsKaK3QepOCD8c44aD+CldkiMOSTRreq+h5PzDx0G5pu3Go
	aNictzw3fUFVIX8nvbTcjMfqpPHnmrWQUJfpB2FQXrg1EYcGP/BNtDLqxoSL
X-Gm-Gg: ASbGncves80Q6Rxo+uhJfWysAe28H5gRk8PVl1v7hX16ijzjTqnGPH6VW4oLVQSCFk3
	vCqPXgf0S/GwTNH13NWftXyIrcK24Sm0ahxSEf6LLiULWFSRf36EXIHqOfGqHYFbXyBDIO93j20
	3fcmhintL8HdMlyoYc/TYCHHqJ+xLzHlmel9PNn9qcSBC+1hQndJ9UDvpU8J3u8Jtz4Uiso7I5X
	rfstmn74lTVuAcEFeRtF9J/MUb2sKDF0nzfnJIGlC2yIaj7FTE9Ld8gJ8AsU4jBxKHBKL+aj1z5
	gO7WaL02l6IftRdiH3UJa91mi1wvWRj1ivfg7m+DEXs77MUbBfXy004LfBcD538+Va4vRa4PEvx
	6zVZ6QQth1g==
X-Google-Smtp-Source: AGHT+IFTu0Jt5oOB7cldX3rIsFRKzoyx1f3pziHi+TW8B5xeOECKaq3mlWTAmJ4KLKYw1e8wd/mIAA==
X-Received: by 2002:a62:b403:0:b0:732:6221:edea with SMTP id d2e1a72fcca58-7326221ee7dmr17780715b3a.3.1739867755169;
        Tue, 18 Feb 2025 00:35:55 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ae1ee4febb2sm787325a12.51.2025.02.18.00.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 00:35:54 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH v2 00/29] ASoC: tas27{64,70}: improve support for Apple
 codec variants
Date: Tue, 18 Feb 2025 18:35:34 +1000
Message-Id: <20250218-apple-codec-changes-v2-0-932760fd7e07@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFZGtGcC/22NwQ6CMBBEf4Xs2TV0pTV48j8MB2hX2ARo0xqiI
 fy7FePN45vMvFkhcRROcClWiLxIEj9noEMBdmjnnlFcZqCSdEmqwjaEkdF6xxa/jYSGjTbOKqb
 KQV6GyHd57tZbk3mQ9PDxtZ8s6pP+fPqvb1FY4plO2tQdqU7V135qZTxaP0GzbdsbcCaiMrYAA
 AA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3697;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=sFfR4eIGWeqHKx7p9Z7iGt8U9lbfIZhokJqUsiq2T+U=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOlb3OJnzm4P15/epLjK71BgXt5frehfYvNXmwapilpNS
 Tiw7fyGjlIWBjEuBlkxRZYNTUIes43YbvaLVO6FmcPKBDKEgYtTACay4jkjw53uyNUXn0iEmcfq
 8YhF9yi8MQ+XPiPnrd9ycd6aF0yu6owMM9dVnehcscPowLvZ38qUylk3fQniTZZIfXB/sceZ9Cv
 nmQA=
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

[1] https://github.com/AsahiLinux/linux/tree/asahi-wip
[2] https://stats.asahilinux.org/

---
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
Hector Martin (14):
      ASoC: tas2764: Fix power control mask
      ASoC: tas2770: Fix volume scale
      ASoC: tas2764: Enable main IRQs
      ASoC: tas2764: Power up/down amp on mute ops
      ASoC: tas2764: Add SDZ regulator
      ASoC: tas2764: Add reg defaults for TAS2764_INT_CLK_CFG
      ASoC: tas2764: Mark SW_RESET as volatile
      ASoC: tas2764: Wait for ramp-down after shutdown
      ASoC: tas2770: Add SDZ regulator
      ASoC: tas2770: Power cycle amp on ISENSE/VSENSE change
      ASoC: tas2770: Add zero-fill and pull-down controls
      ASoC: tas2770: Support setting the PDM TX slot
      ASoC: tas2764: Set the SDOUT polarity correctly
      ASoC: tas2770: Set the SDOUT polarity correctly

James Calligeros (4):
      ASoC: dt-bindings: tas27xx: add compatible for SN012776
      ASoC: dt-bindings: tas2770: add compatible for TAS5770L
      ASoC: tas2770: expose die temp to hwmon
      ASoC: tas2764: expose die temp to hwmon

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
 sound/soc/codecs/tas2764-quirks.h        | 180 ++++++++++++
 sound/soc/codecs/tas2764.c               | 368 ++++++++++++++++++++++---
 sound/soc/codecs/tas2764.h               |  29 +-
 sound/soc/codecs/tas2770.c               | 333 ++++++++++++++++++----
 sound/soc/codecs/tas2770.h               |  20 ++
 7 files changed, 839 insertions(+), 93 deletions(-)
---
base-commit: cc7708ae5e2aab296203fcec774695fc9d995f48
change-id: 20250214-apple-codec-changes-6e656dc1e24d

Best regards,
-- 
James Calligeros <jcalligeros99@gmail.com>

