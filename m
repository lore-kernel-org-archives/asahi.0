Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272782135B8
	for <asahi@lists.linux.dev>; Sun, 18 May 2025 10:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747565472; cv=none; b=JryUYltXv6VYowCth/gp+bGlGg0NzSmy14dF3In0uIr2vUzI7SVWzrrP3eEfYUILAX+oAXj1kD51zsN7kXpFtPHhputQrItZ9zw1DEwHk6XD7e/qSvdVtB2Os9h/CAOm9GgrNwLiDK781On+s7/YhBhELCk1rdryr80e88XvmRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747565472; c=relaxed/simple;
	bh=RT2iQ5brdMeC84IB6KveIUJpZkTRlSqN7u5CsAjxDm8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YRuelesM/ObB9G9E2T5o9LQGdKgRJ1UtDXzl5YjAYq4cXGZGWSz7eyz/VJ/Rx5wrqa1SFnq5rHR3f8zIbA+gqAJqAXILnuZ5MjsnakWHE0IWNjAQqYrD+UszMu4T4ewxTN36It3w++t/ar8YPrMdz2Qgdi1Z13fQWTzxT4jFuSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZTNkkXFB; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZTNkkXFB"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22fcf9cf3c2so29264745ad.0
        for <asahi@lists.linux.dev>; Sun, 18 May 2025 03:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747565469; x=1748170269; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XKMc+c0+FW2CLyEi2+IaRcJT9E5ZB/68CPDxgtfVfbI=;
        b=ZTNkkXFBjkwuXwH6tdbIiWS76Kdvo+pszGuzlW/Zhp6PBTEiMHboefqqcx86/dz81T
         HcTgcNIaKuCh1fm6JWJNQfiR+2pLsXR64hyA6z7RU8lwdtNW4SdxW1znoRYAYFSOe5SA
         UT278d2jy9RDce2zXsWUJQDSImSFJlsPp4GUejjTXK4nNhIj8wS3Jg64Q/PZHo6wxybf
         h1CR5Xg/vSEtk5RplDlqu+vTPGVy+2O/wtWeYQbcsruXkAoEvfPSx8Q7te0NXoObluMg
         qdIaHNoOBFjOVJ5ouVA7td0j76KWhSmIs4NAxHW1xAOtPWAOrBBOrW4u4g/zLY0xYu5a
         eaFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747565469; x=1748170269;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XKMc+c0+FW2CLyEi2+IaRcJT9E5ZB/68CPDxgtfVfbI=;
        b=UaXzV2DK20a9X+9m0O+xT152pSyvV0i1DA8aHgx9NyIVTtT2M6n7ikrOUdnQUd8o+h
         otyg21KorXu+p8xeiPgDIWcb47eO2Baf1Gjr8N4dePuOC2+ig8uZ85kMKTZmBZfRzy4d
         Gus32A/SC8odvTD5ST39b//jB9spPIHw/OhUH4Alsj2q2CFDXptkEX++LYxGLO27eUyZ
         Qr/fxJiIGSIZ6Gbm5RPPKllUQDNwgxG9c+Czrr/pASePHIGHKFudys4n7cf+QSU+5J/0
         b3jjsLNMWXqgbUPgqsgWv0jKZhbQeSTaMtI68CAY/nwIjzfs6Fa9IDWgp8Nx8nZhwLzd
         53iw==
X-Gm-Message-State: AOJu0YwRVEnlK5Fizo9XLs519ScqTL40eykNJYmsvbmgSOBehXODGDuH
	TvDWWB4s9SdGvZmpRrpws/XvxSEQKnhyw8cDCocuLKC85LiAXYNvoOa0
X-Gm-Gg: ASbGncufTsmGM6cKLyOumTJZe7TzSikol06uv3rnIUZGHGne1VZBe5c3/sknmI4JlxW
	qQuRg+6iHl9M4eBN8MUI5r3N+UYDDXiLzmwzcL8kxhme/4qaa+wfwFcZxlnThjaOrmuC1H9jPuH
	SphEPT0F+nJpPW8A+qJ3/lcTSY+CRMCjhypQdZY7VXtibo0hHZlTv3aj41A+JzwoJYOfPeHb+BG
	bYJ7YN0OYxT8G3o87rAHb7lVloNHLyTLDZbjs0ljqo04pFKqR7hrQUVWAPFGHahFI2hwpv69GsN
	thrkgBAdIk806ahoPjMDZvnO8byIRdyUey07dOAJjoNI+QY7q0e//0sn85+NslhcKdIXL5v57Wk
	wmeoG38S6BXGVPeTWg7/AUdRn4+85myPaWF3OOyUEZuwrlA==
X-Google-Smtp-Source: AGHT+IEUkg1TUzp2BVrV+b8/Z3XW0MO1HoRrw61SVBQahL7dOmOnaaKx5W1Z6wx8ILbhquAihcK2AQ==
X-Received: by 2002:a17:903:1ace:b0:225:ac99:ae0f with SMTP id d9443c01a7336-231d438b657mr131062835ad.1.1747565468838;
        Sun, 18 May 2025 03:51:08 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4edd259sm41956115ad.256.2025.05.18.03.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 03:51:08 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH 0/9] ASoC: apple: mca: support simultaneous I2S capture on
 the frontend
Date: Sun, 18 May 2025 20:50:45 +1000
Message-Id: <20250518-mca-fixes-v1-0-ee1015a695f6@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIW7KWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDU0Nz3dzkRN20zIrUYl0zMzMDSxMgmZZooARUX1CUCpYAKo+Ora0FALd
 eCHtbAAAA
X-Change-ID: 20250517-mca-fixes-666094666fa0
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1591;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=RT2iQ5brdMeC84IB6KveIUJpZkTRlSqN7u5CsAjxDm8=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBmau6ezv/ts+iQwxk93erbzrFdd627P/1xwbY9t2p/5c
 1bwtm/P7ihlYRDjYpAVU2TZ0CTkMduI7Wa/SOVemDmsTCBDGLg4BWAitwIZ/vBwnDXpruRrPFR+
 2uzGAvvJFS/PKi6ImFO8IvnT+erXSRGMDCdsNPbujVYPTJw96+NCQeZDdo2rq4ulbZbeY3ndd7P
 SiQUA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Hi all,

This series introduces a number of changes to the ASoC driver
for the Apple MCA peripheral to enable support for bidirectional
I2S. This is achieved by allowing frontends to act as clock consumers
and logically ORing data input lines when multiple backends are linked
to a frontend.

This allows the Texas Instruments speaker amps used on Apple Silicon Macs
(Apple-specific revisions of TAS2764 and TAS2770) to send their IVSENSE
data back to the SoC. Since these amps do not have any sort of integrated
speaker protection logic, we must use the IVSENSE data and the Thiele/Small
Parameters of the attached speaker(s) to implement our own in software.

---
Hector Martin (3):
      ASoC: apple: mca: Move clock shutdown to backend shutdown
      ASoC: apple: mca: Do not mark clocks in use for non-providers
      ASoC: apple: mca: Add delay after configuring clock

James Calligeros (1):
      ASoC: apple: mca: use readx_poll_timeout to check for cluster reset

Martin Povišer (5):
      ASoC: apple: mca: Constrain channels according to TDM mask
      ASoC: apple: mca: Separate data & clock port setup
      ASoC: apple: mca: Factor out mca_be_get_fe
      ASoC: apple: mca: Support FEs being clock consumers
      ASoC: apple: mca: Support capture on multiples BEs

 sound/soc/apple/mca.c | 336 +++++++++++++++++--------
 1 file changed, 234 insertions(+), 102 deletions(-)
---
base-commit: 7163ff8cf6a2ee6b6861f0c521885e83a97145f9
change-id: 20250517-mca-fixes-666094666fa0

Best regards,
-- 
James Calligeros <jcalligeros99@gmail.com>

