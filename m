Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F404274669
	for <asahi@lists.linux.dev>; Sun, 21 Dec 2025 09:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766309789; cv=none; b=szybH7rRPl3zScL6LfaWH69HMQIi0fY8Mn+L+bxH1qbC72RVCg+JBJd/yhPxxCkqyiO9coEhRxjSHt4WPKgMMTSXTOJR2mSdNfpKMTUx8wx2SlVSbMNAJo5g4UyG4M1PgSlsf4KnXwScwU+M6n+a7FdhDEF3Q9xIrvIL4QsuIPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766309789; c=relaxed/simple;
	bh=eyUwGI0ieunvRa2JS4DDwPNE6CUzg0WKFA2me2XXi8Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WifQYtaK7BMZZaH2/wiwYoAdmRhR1sP6rgRXTyQN3hCUPphP/AY3SKx9eAAkuCdIm9GGPE99RL8TYfBtRXKdgG4RFhGEQROy+3V6mI163Xf4wqIGCegwA7pLfoTpZUgROkEDMFL7eGyFrEY6DVs8UF/+4K6cCPAVfoZs1NIbtSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EQt+0yzn; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EQt+0yzn"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a0d0788adaso26963055ad.3
        for <asahi@lists.linux.dev>; Sun, 21 Dec 2025 01:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766309787; x=1766914587; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F5nB8fHKMaIzWNuSxdIiCgEFq4ZfOznDuDPNBRfGesY=;
        b=EQt+0yznBdTzoXI9adnDG9sa1n2nk3phNDENV+aWEc0PeMWmNNo78ZTMutYB7tL9eX
         W67aY9pb03kD9V2oMonWBvGc743HQFDSl6of4fCF2qgCxHZebAtuaNOej91ULBSpDese
         bq12kNjBYN3jAgUTB1jpgR5aR+W4dgk7tX/Z3/WMxwDPV3H8C5joOazlnaztW/rYwSYe
         PEFMbYytYSOUAvHL1psQ15TmB8Us8dsi8utAOLNGkHHZPPidDf0YXl6gFibFeptQmN2V
         OrBWemBk2HIOeS802X+XCKpjh0V7SgecWNWs4NTMhlHfASY95rxtzk81ePN1kDycKnMu
         y2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766309787; x=1766914587;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5nB8fHKMaIzWNuSxdIiCgEFq4ZfOznDuDPNBRfGesY=;
        b=phbYImvRXJ6znkupD7bFHp32BkX0u+ShMxa6/RJowGkl73rUnouHtrp+SplrgBbXK6
         5mdO+uJDrfB64Sqlb1hdKq2EKPk/tRrlFFHskcndNGC0UisksTd4ehbVCeq3TjKuQ1yu
         moNW6gwQyrelKZI7YeqELWekkSHzg9s6nlcW0+DmDQ992OH9b6xbOL17ARsnY4NZGn2j
         EltLNwmy8gP/AqrsPkgl3qD9SrYA9/yQZcdn0MZ19/Po/6LtFLpupd+uXRfpEqChBBwR
         I6lrQnzQI5h7QqKcsZPAYU/eFux6S8BM+qarUdLKR3sgAi6Qh1HFE0uiTFzIQs7ozo37
         DJEg==
X-Forwarded-Encrypted: i=1; AJvYcCVVp1EXl/C/Hm20MTdDZqIby0LbLlgZAY1Kax8JCp8P6vKsxvtTP3IWuF3pfrVlcbwsTR/ntA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyHGjj+wN1pD8mweGOytmiHs7vbTkwTyB8rBBkI7nYh5jnbxRvc
	HLnVZt9t9cVzlhrLiA4aOzkev3O9QrOGhAqq180m5hYLIk+ZAsh3sYD5
X-Gm-Gg: AY/fxX4s+IxEehI1xnki8ydfkZbmmD6KU+LjO4h7DcIb7TCjs0SwChdwh6lMZGccgUn
	0Uh6PXeE+fDLDXV3ZdRXAmJ7ACm02aRbEtyDtraHDfINIYWoJANvixfOJ95bJybEbxVH+iOzsc2
	6HoLida1LwEXdYbd39flrhJPvZD+zojejwVCqantatqXeMnnXJjANsF5Zpx0Hb2+a9INKlJxgcX
	tVtu/3zbFnK9FOq7PK8EVWRbZsC7RuzEG1Ykpt4kNhDxe56NjPSLwfycei4w7dZXSDIWLIHxDyA
	J/zWSLOG/NV6fSfkDUW8A6BHp2zvjAjgPSIDTjO/Fwyd0gf5QYLBYdCMJCn4UfZZMLgRg+iLBBG
	xzTAUJ/L9zsGRhYxc1BHjcxQbY13VCf1+OfduI7ZkW0dtATJ2E73OSZNuCg2/g2nSw7UxCbeuo9
	sgYU92Qg3ePjZjvqEvtY6/du2TcRc9lz5600pNtxigbpxHIoAz/CaraLD+3703EvrQ4hq9ccAcJ
	XEC0QWYckSyJT3rAcbISbEKkpi5pGxu6ziufBm+QGi+6xXTOz8qGRMZmgEOMj7/15AQcmwvIOOd
	GNmOL1rmC1dPdlu+V5c58VVPpgFRkOthRbVafgO3s67zjkR9E1M=
X-Google-Smtp-Source: AGHT+IE26hfD24ZsQ6mXHiG/tj55lbvStfyPTDRxrA921e8bn7nv2J67tWRAQHGaVgY7xl65mVGtVg==
X-Received: by 2002:a17:903:110d:b0:2a0:9402:2175 with SMTP id d9443c01a7336-2a2f2427be6mr68478635ad.27.1766309787305;
        Sun, 21 Dec 2025 01:36:27 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4d363sm67629495ad.62.2025.12.21.01.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 01:36:26 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH v2 0/7] ASoC: basic support for configuring bus keepers
Date: Sun, 21 Dec 2025 19:35:56 +1000
Message-Id: <20251221-tdm-idle-slots-v2-0-ed4d96413aec@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHy/R2kC/12MywrCMBBFf6XM2kgStVhX/od0kce0HUgaSUJQS
 v7dWHDj8pzLPRskjIQJbt0GEQslCmsDeejALGqdkZFtDJLLi5BcsGx9Uw5ZciEnJrhWQ5t6q87
 QTs+IE7324GNsvFDKIb73fhFf+0sN/6kiGGenq1V66rXhAu+zV+SOJngYa60fkP3BKKwAAAA=
X-Change-ID: 20251201-tdm-idle-slots-10ba92516da4
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4113;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=eyUwGI0ieunvRa2JS4DDwPNE6CUzg0WKFA2me2XXi8Y=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnu+/tkzmRK8Wo3Rfg3fvMzOrKLlWlqg2sPv59u01mrb
 k6t2xc7JrIwiHExWIopsmxoEvKYbcR2s1+kci/MHFYmkCHSIg0MQMDCwJebmFdqpGOkZ6ptqGdo
 qGOsY8TAxSkAU71zA8M/rZsTLl+4MlUl0P1s7sXn/XGciRdPLTS6MTdS36NSfNFnVYb/3lySG2q
 faJuIzKzd+/CE5y6/VY4XYtUvBegf10n8cE+KFQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Hi all,

This series introduces some infrastructure to allow platform drivers
to specify what a DAI should be doing when it is not active on the
bus. The primary use case for this is configuring bus keepers which
may be integrated into various codecs. The instigating use case for
this functionality is an interesting bus topology on Apple Silicon
laptops with multiple codecs.

Most Apple Silicon laptops have six codecs split into groups of
three, driving a pair of dual opposed woofers and a tweeter for
L/R stereo sound. These codecs report the voltage and current across
their connected voice coils back to the SoC via the SDOUT pin,
represented as PCM data sent via configurable TDM slots. This data is
used in conjunction with the connected speaker's Thiele/Small Parameters
to ensure that the speaker is not being driven to levels that would
permanently damage them. This is integrated into CoreAudio on macOS.
speakersafetyd[1] handles this for Linux.

All of the codec SDOUT pins are attached to a single receiver port
on the SoC's I2S peripheral, however are split across two physical
data lines (one each for the left and right codec groups). The receiver
has an OR gate in front of it, which is used to sum the two lines.

If at any point a codec is trying to transmit data, and the "opposite"
line ends up floating high, the transmitting codec's data will be
corrupted. We need to guarantee that the idle line stays idle.

In the downstream Asahi Linux kernel[2], we set up one codec in each
group to zero-fill or pull down its line while a codec on the opposite
line is actively transmitting. This is done entirely in the codec
driver, however this approach is over-fit for this one use case. This
sort of functionality may also be of use for other hardware, so following
previous mailing list discussions[3], I have tried to expose the
functionality in a more configurable and generic way.

I have integrated this approach into our downstream platform driver
and select Devicetrees as an example of how this mechanism is intended
to be used[4].

Regards,
James

[1] https://github.com/AsahiLinux/speakersafetyd
[2] https://github.com/AsahiLinux/linux/tree/bits/070-audio
[3] https://lore.kernel.org/asahi/20250227-apple-codec-changes-v3-17-cbb130030acf@gmail.com/
[4] https://github.com/chadmed/tree/tdm-revised2

---
Changes in v2:
- Reworked tdm-slot.yaml schema to silence dtschema warnings
- Properly referenced new tdm-slot.yaml schema in affected bindings,
  again silencing dtschema warnings
- Add PULLUP and DRIVE_HIGH as possible bus keeper modes
- Reworded commit messages and cover letter to more clearly explain
  what the goal is here
- Link to v1: https://lore.kernel.org/r/20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com

---
James Calligeros (7):
      ASoC: dt-bindings: convert tdm-slot to YAML
      ASoC: dt-bindings: update tdm-slot.txt references to tdm-slot.yaml
      ASoC: dt-bindings: add TDM slot idle mode properties
      ASoC: soc-dai: define possible idle TDM slot modes
      ASoC: soc-dai: add common operation to set TDM idle mode
      ASoC: tas2764: expose SDOUT bus keeper via set_tdm_idle operation
      ASoC: tas2770: expose SDOUT bus keeper via set_tdm_idle

 .../bindings/sound/imx-audio-card.yaml   | 14 ++--
 .../bindings/sound/simple-card.yaml      | 14 +---
 .../bindings/sound/tdm-slot.txt          | 29 --------
 .../bindings/sound/tdm-slot.yaml         | 82 +++++++++++++++++++++
 include/sound/soc-dai.h                  | 22 ++++++
 sound/soc/codecs/tas2764.c               | 95 +++++++++++++++++++++++++
 sound/soc/codecs/tas2764.h               | 11 +++
 sound/soc/codecs/tas2770.c               | 75 +++++++++++++++++++
 sound/soc/codecs/tas2770.h               | 12 ++++
 sound/soc/soc-dai.c                      | 40 +++++++++++
 10 files changed, 345 insertions(+), 49 deletions(-)
---
base-commit: c8d8605fc53e8072848aadc7a5aa00c2f5143cac
change-id: 20251201-tdm-idle-slots-10ba92516da4

Best regards,
-- 
James Calligeros <jcalligeros99@gmail.com>

