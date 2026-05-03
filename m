Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB613B389A
	for <asahi@lists.linux.dev>; Sun,  3 May 2026 12:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777811028; cv=none; b=msRrv4K6oKetfHyLurL+b7zufagNa1PYWnvCkkTqvwhHIOGMiFcT0fOpt2hdo6Z9P1sh2Ib54fPbyRObV266P2ihzZvv2hO1kqLG8U0M/D5IQFPEeBYOsFmDysbxxq2cVTuNdvgduzoPV5YrYbBrmpbOM/kcbIfOTU/loKYjfjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777811028; c=relaxed/simple;
	bh=cBF/PgoBgDQMZImfi0PK9EOQ4KdCg26XWDCXf0kpwQE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JCxllwUDpvOIGYfAV+BX3joDOA9BhtLNpld/XzD9Doiuz6IdOUl8nf7Yle+l6dHY/4/inpvrfqeaw03sWOfzk3rR4BqNYhVqn4wna9ajuj887ISDt29JagifFpMdfw0OuUuOpr0gpmawlPIlfyUntVeuhSieY24EfOsArSkjNu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=elmLSsP3; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="elmLSsP3"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c801d732058so276458a12.1
        for <asahi@lists.linux.dev>; Sun, 03 May 2026 05:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777811026; x=1778415826; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NYp4Og2+ktDZKSQruyvoX8pnwkOqiEAo3XA3+4ENvyA=;
        b=elmLSsP332hMaWeHMrZWuZDNw35qVZLVJkMN2aOrFO50zkKvcAV3N41+0gDmBETE6f
         bm8dJ7k0/74JJMQGY6CklhOfQWFzl2RsQnWv644pxyT+Ug4gVMqoicBXYM0ImkphcFxP
         eFWnRIPdM7EfLGChavhzWpx4edQzojTzfvky4ZsC2pMDXAnw5y7obplk858oifrbJ31p
         M1RvvHl6mF2iiokS3f988NvObP2an7DhNZMICfWiPRTZYdZFcERM6WmU8SxK6jckoUSm
         3QmuUNjbnK+Lw3qqPFgVFhAhmL3gpTX3kVWk5YuPyt2gq43gHKdVhhxv4jgnMYkrCgKW
         yrCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777811026; x=1778415826;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYp4Og2+ktDZKSQruyvoX8pnwkOqiEAo3XA3+4ENvyA=;
        b=rBelVOO1CAfdx10gdTpHn3+scFenNC43e5M+jwZjKErkAWriquboXSyi8g/RJgdQZu
         NdVL32/7uAZ6Zn6GrNB5a/mjId5D+AdV+h01du3F9wCKZ3xFa/qVdDNn42kjrRgRigvr
         l3VjqsLvO+PWIKZYWRpncO1qJZaRp200CgOg3Ofulfu3mR61yWLm/2BJJR4ykt500Yzo
         18qjMY8xWNxYwtQqoPXGMZuH8M7kBwv1F1fA4oXzv72jYIyaDcSuv8/Id0gN6Hh4y9o0
         PTh7KcU8Hbr+OF/zESiWXHatVVfpIy8HpCFM1FdCOmpD4oZGSsTT27ZAHbhhh8wz5kJ+
         J0iw==
X-Forwarded-Encrypted: i=1; AFNElJ80pCtJpkYy/GN1qBBxpVkWHc4HbfCKYLoEEKRrDEbhSsLzMhg+EzEKQuzd0sAuQJOXGbWGIw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzmLh4/LV8kGfQLythOwGrM7GXrmVLGFRJlAsX32R0Cz5yMZWqD
	5Q9Fj22LtMlIbw/EUwYZp/Eyek6zzpB/oKD2AKmiqKa4ZYR9UwTgvQ5N
X-Gm-Gg: AeBDieuggEPh0qRFpbSf9RylH+ml8TJHDASV0zV+41sH/q96ZVU+0parWKC9sKlDUOE
	TrN10r6ymr7EhPvRVG6mqYSmGjCvZVf+iuJ6pGPamWFt2IkCYes9eHM377Y5bIdEGZryrzfNNkW
	daH2sXs2TdRvn41O+uyqu/01sI/yP32ScGMPlQcEX4xQY+ROmYhjig8BFFChUeqrPhqHQzPL+yi
	hHfRuVH2NojnXxejYbb66yg0k/F3QOM9xlkMNo/Vf46WSZlenXA/Lx5eShrfafD/1nlefU69l13
	Xu7jPBlAzcFR1QrxBCFICiCgiAIkEHreOqBAghFLZSyezOzRe91Az5NAsBzkjuf8JmgMV9RnSHM
	7B9AolJjZ4RUA7cZUmu05utQSjFYF/GpSHaP6b+qGzayDqua4J5FP6dwvyBbknF+ID9/DIztz98
	JOoptQ2xb+a+ol/qoqCTBJP9A9poahFmKHeIAkgyqHsjASOxoAYEn1gCdqj9CThCrH32jFNtgJe
	Ib7N4hl6pATHvrZY3/Y+QZj8uh6lKAbzrsVaPKpCQcL1E3SPGWKgKgbeJMTfFq48E7wMHmXmpgi
	tRwqf/2rp3M=
X-Received: by 2002:a05:6a20:3ca8:b0:3a2:ed4a:5d7e with SMTP id adf61e73a8af0-3a3d20bcbc3mr12745793637.22.1777811026410;
        Sun, 03 May 2026 05:23:46 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8023e6eabesm2098464a12.5.2026.05.03.05.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 05:23:45 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH v2 0/2] ASoC: tas27{64,70}: Fixes for hwmon temperature
 readout
Date: Sun, 03 May 2026 22:23:22 +1000
Message-Id: <20260503-tas27xx-hwmon-fixes-v2-0-208e802be4ac@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADo+92kC/32NwQ6CMBBEf4Xs2TVtoVo9+R+GA9QFaqQ1XUQM4
 d8tePf4MvNmZmCKjhjO2QyRRscu+ARql4HtKt8SultiUEIdRKE0DhWr4zRh9+6Dx8ZNxNhYowt
 BRp60gGQ+I21BEq/lj/lV38kO69Ta6BwPIX6221Guvf8Po0SBJrcyrw2ZRheXtq/cY29DD+WyL
 F9PcILCyAAAAA==
X-Change-ID: 20260425-tas27xx-hwmon-fixes-fc8540e81950
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Sen Wang <sen@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1811;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=cBF/PgoBgDQMZImfi0PK9EOQ4KdCg26XWDCXf0kpwQE=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnf7XxiecQLFfdNTzg352qrQLfoU9ddPYfuM4XddlZJY
 M2om5bWMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmGqRZEaG2YfPR9ZVahobpdmetPt7oHXz3MYW9i6FlIDOP3WeUdXRjAw3tyqniTf
 J6/tOCTX/n7xbe/Iqs/lTFBz4py2e2H19ZRErAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Hi folks,

This series makes some fixes to the hwmon temperature reading
functionality added as part of [1].

- The arithmetic for TAS2770 was incorrect, leading to readings
  which deviated from the true value sampled by the ADC.
- TAS2764 was returning the cached value for each read after the
  first register sampling.
- Both chips were returning nonsense values before the ADC was
  fully powered up, causing issues with some monitoring software.

Regards,
James

[1]: https://lore.kernel.org/all/20250406-apple-codec-changes-v5-0-50a00ec850a3@gmail.com/

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
Changes in v2:
- Drop applied commits
- Respect non-ENODATA error codes when checking for a fault condition
- Link to v1: https://patch.msgid.link/20260425-tas27xx-hwmon-fixes-v1-0-83c13b8e8f54@gmail.com

To: Shenghao Ding <shenghao-ding@ti.com>
To: Kevin Lu <kevin-lu@ti.com>
To: Baojun Xu <baojun.xu@ti.com>
To: Sen Wang <sen@ti.com>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: James Calligeros <jcalligeros99@gmail.com>
To: Martin Povišer <povik+lin@cutebit.org>
Cc: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
James Calligeros (2):
      ASoC: tas2764: Deal with bogus initial temperature register value
      ASoC: tas2770: Deal with bogus initial temperature value

 sound/soc/codecs/tas2764.c | 35 +++++++++++++++++++------
 sound/soc/codecs/tas2770.c | 23 +++++++++++++++-
 2 files changed, 49 insertions(+), 9 deletions(-)
---
base-commit: 425b3a9530f53cfa5f156ab69228a5e0b8de1667
change-id: 20260425-tas27xx-hwmon-fixes-fc8540e81950

Best regards,
--  
James Calligeros <jcalligeros99@gmail.com>

