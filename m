Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0E4206975
	for <asahi@lists.linux.dev>; Wed, 16 Oct 2024 10:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729075327; cv=none; b=HG7HAmm2KAfvNWX7zEwKX/ixkJJivZSLjS2RDhHOUaekx4771sM4CbALjMPSvrBZZ4Kk4ERmNu+E2XUwPRwY3N3JhfYniluVVbNtRFYHDs/qdCwtVjf2t2Uqz0JPYRepZ/EBaGGZo7zcX6U3yJxSE89d8D6fadvhnW4t+5m+Z0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729075327; c=relaxed/simple;
	bh=mEq5F6t+xaQeyl3l8j0WFySka0dkQMiC1ioO2fr0s3c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QlYxuUTJid8YV9CGka18lYwTL08a2/Wa7kJ38mqBFNZXZ6eOOvAaijInSwG74CaIoAriQ9eZTHlAXbM1FMnrEUlmYr7sz4L9L99Q+6kzJ4rBvew5VaYHfda8q4m5VBweBHUwjpDZj1Iv5BQJj2l+zurLKNgcZ/NQq53Xvff+zUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ktTn17DY; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ktTn17DY"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20ca388d242so35675575ad.2
        for <asahi@lists.linux.dev>; Wed, 16 Oct 2024 03:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729075326; x=1729680126; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=105FVZgfdYE5ClHoZS1Bc0PBYQU+gjIa+OLFozcjrTU=;
        b=ktTn17DYfLPrrlhhhhr04BYT2/3oFUVM9+7STcTw1uMExyXOJIDdJTjp6dG4fhp9T6
         94caTz5V+Eyw97e8XPdcdFdVASP1uqw95XPWxMBZjmmwp05BGBby8wKRuGvAdMM+S5gN
         jlYX4XnDN0ADSdzyoV5wUAbjPb36hMIKQ08F3UrhRsFS4QcSfnSs5UBhXQNGnyippc89
         gGHqu0EpsduOEE8brJrbU29hPa4YAPnEMwsty29IxtOrdX2oD8/gKlfulgngtpcbD6Go
         CGq+80sKq3S49mfckuGEYm48t03zcBb2c9+sP9UcCrMfNXBcFK4ootSZaaiiN7NM0y1N
         DCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729075326; x=1729680126;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=105FVZgfdYE5ClHoZS1Bc0PBYQU+gjIa+OLFozcjrTU=;
        b=UgFQQO946ppfu8DyvAgBS8PZcdLaFgrH/fWJjl04RR6ki4quZneECCY+jLrDR5hazM
         3lX6AqLAURLFk3lkWaMIkSw36i5ryaH0a9NUZE3kTVFb+CsGPQ0QUeaGUd3S2DSosRs1
         GU2PU1m3j3b+aUZflSVI+TE09AfQfRH9uAgk7FRwSuUfJFtgJ+RZL8847/A0kCZdX+Jo
         9sOOCD1nNN2zOlYbXZzcV9oUjO/yQvXOFuqHahU5hPQpA9qpQNY8MoG2yurWIU8GBTV0
         DE+3yQIVIy5tu/T7kuTqwGsJxIm/Um/nwZTv/YtTvPpWdjX4txK3sKDvvN++tuhgVfZ7
         cU8Q==
X-Gm-Message-State: AOJu0YwdswlAasSY5edpRY0HWQI47UoDxTOVlQ9BB9SH9K1SDdLzS8rC
	FMJTLUm2F6gq8XQlfsKC8S/dD3zg8JVKRTVo7etQEEh3SODSvrd1
X-Google-Smtp-Source: AGHT+IFYuKRUAQGpZGNW2W3fgGvJ+I+xUzQv4JnkWoD7y5nHrjeFA/KPs9pTVFYfiSBlDtDnKaO8Ng==
X-Received: by 2002:a17:902:f552:b0:20c:862a:fcfc with SMTP id d9443c01a7336-20cbb17d8bfmr254142565ad.6.1729075325233;
        Wed, 16 Oct 2024 03:42:05 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d1804b2e4sm26319645ad.182.2024.10.16.03.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 03:42:04 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH 0/3] ASoC: add CS42L84 codec driver
Date: Wed, 16 Oct 2024 20:40:59 +1000
Message-Id: <20241016-cs42l84-v1-0-8d7e9d437d2d@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADuYD2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDA0Mz3eRiE6McCxPdNGMLYxOLFCPDZAsLJaDqgqLUtMwKsEnRsbW1ABB
 aMS1ZAAAA
X-Change-ID: 20241016-cs42l84-f38348d21c88
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1831;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=mEq5F6t+xaQeyl3l8j0WFySka0dkQMiC1ioO2fr0s3c=;
 b=kA0DAAoW1DYy0VH3eWAByyZiAGcPmHbIJy19smNGSootjbZYbY0aqkAGCtDav4ojTWY0jLfsH
 Ih1BAAWCgAdFiEEsIISSJsyBtmPFHm91DYy0VH3eWAFAmcPmHYACgkQ1DYy0VH3eWC1qQD/Vf85
 E/CLK3aUekI42LVRO9TqU3Yy1zrsoYg5eG8ZIJMBAMYsRWvrmcFNrGwjWPmc3L+bk60h5APjUsE
 X+460AVwH
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Hi all,

This patch set adds a driver for the Cirrus Logic CS42L84 codec. This chip
is (so far) found only on Apple Silicon Macs. In keeping with proud Apple
tradition, the CS42L84 is essentially just a CS42L42 with a different
regmap and no publicly available datasheet. It may also be missing its
parent's S/PDIF capabilities as none of Apple's devices support S/PDIF out,
however this cannot be positively confirmed.

This driver has lived in the downstream Asahi tree for quite a while now,
and gained some refinements along the way. I have squashed most of these
into the initial driver commit as they were small changes like tweaking
msleep()s or filling out TLVs, but left seperate a larger change to
tip/ring sense IRQ handling as it differs significantly from what is found
in the CS42L42 driver.

---
James Calligeros (1):
      ASoC: cs42l84: leverage ring sense IRQs to correctly detect headsets

Martin Povišer (2):
      dt-bindings: sound: Add CS42L84 codec
      ASoC: cs42l84: Add new codec driver

 Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml |   60 +++++++
 MAINTAINERS                                                 |    2 +
 sound/soc/codecs/Kconfig                                    |    7 +
 sound/soc/codecs/Makefile                                   |    2 +
 sound/soc/codecs/cs42l84.c                                  | 1110 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/cs42l84.h                                  |  210 +++++++++++++++++++++++++
 6 files changed, 1391 insertions(+)
---
base-commit: 469819cc17368702a6f68cec2148f518d3f3679b
change-id: 20241016-cs42l84-f38348d21c88

Best regards,
-- 
James Calligeros <jcalligeros99@gmail.com>

