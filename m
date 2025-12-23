Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CCD126BF7
	for <asahi@lists.linux.dev>; Tue, 23 Dec 2025 14:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766499257; cv=none; b=GPcJDIT9DHpGe0WxhgrI/M6AIX0jmic2UtIVcNaiGlralloyMYXSiZPvCkptKNx/kriRjMt/ALEts5f4EZBKT2T4nv9kimKKBP1cwCu0a4Mbp26yG45Ji4JC8iwZyUIPA9+INHoO4xxpunQtM7shcgQ4sFrU5ZXcwHiFeA60Dqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766499257; c=relaxed/simple;
	bh=2GuJTyWIrsDeGaNyuHSnV8PC6KHT0nLXNngeZNALiqY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=K4J3VlGbPa5Py3XWafAS9dmMyn5wGGqbhC4YjOO97VPc+trnQV21VBpbogT5upYxcbBS6wUfaV1/9Iv0YnGrxk+Erk98FF+bpw518iSYpIbNhClIBy0QPvf0ttC0htTEwTy+Cz9q5cj2p4P6+WBzUOeRNUY4/WNsIpS+ybxFgPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HRlFHW+v; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HRlFHW+v"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a0b4320665so76150445ad.1
        for <asahi@lists.linux.dev>; Tue, 23 Dec 2025 06:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766499254; x=1767104054; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wiq2+idlG0hH4ZrZSix3sKLK8vSbIBlzF1NOft2de3U=;
        b=HRlFHW+vNibrWacBYIBSFuaWynbFQMDOd6seK/F32BKJSstCIkVbMHmMOVgQj6GYeW
         XwoNOtsAwtl8zVuV2CYCk65WOm4hKeNclR0V0MGJr7HwVGaFlMSYvUN9AovURZZJNYNk
         EVNu9mrIx61E/FJLDuoxdhsA4JTyce0p2wyoN4wA0QogZtCKmK4TAnc6ccWXhbENGsjL
         Mh/BX9R9bsBzsoQsOK+3WgHNI0rIYZ/Jttsc/lws/oW1EMXu8jn51Z4qVkJBDYGjv3jc
         74m1xxG5MqkVK59uwQB90KIEQAFu5r3y2Aw3mf3bAFVi2JLvF+6o/SEgCZANdy6gGv7z
         ymzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766499254; x=1767104054;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wiq2+idlG0hH4ZrZSix3sKLK8vSbIBlzF1NOft2de3U=;
        b=VtQO0w3i4vd/cxx1TXPOTN4qWUpEpADKH0jI1qdCcGISFP3CPCw6ej99SgNTMbFTGh
         jG7bUrzWyhtAQG774kBvgCBVul+wHCKbozUakliH/D9uO4s1T55/cnuxYvvoACcL0S/E
         MaFdiFTrrIjvRg89s0apxcAJpCa2oviPWScmY5Y89ktBpVrPP3B5gbl4DIbJ49E02Is0
         LPoev7MBdjcIsQDuj4f4EqnTkFiNYB5bRZ8ebRInJwM43wU2zxwRTpvD1q+DihB2vCwk
         EjFNBZIpjWD2HP0P+hxEicHibt35uA1NGYkuW9uTUMLdFU3FNakEWjAF4M/VkproFZ0F
         CsXQ==
X-Gm-Message-State: AOJu0YwOdz74aVbgh3mdUhIDO8TUNtKkN2N9zLBM4Tdu/3F/AcapRIGV
	WroburtqF90QkRxcj4CmMgJy4QkxuIde/euc0YgoP+tbxd3iLWC7F5/8
X-Gm-Gg: AY/fxX7ywx1hJvFsBM/FsowjJnkV958Gt//rhJJ/Kn5rRF6+fIfIjxVfx+7c0MKTssB
	sI78wMHKEX0cBZKVLQJNo/TCxt+RtBVeIBpQ5WO7sIXCcuC5/Khru00Xv7fXI+d8XwOCHozPVKm
	Ea48jxZUi2wpP8uhFh5ynWn1DjLiSLmCtuTuX1EEf1pmp0L/dKbBjbdfcy6NMDxJO7brV9+X+pU
	cthByFmaPHblfRLB6leLOlVE1T2e0DdoPfBdNq0cI6WAzsoXtLgdbQ4qxivT6NzV01+/J8CGEqp
	QHcOKOtObFHRKT47BKIMxeQ0l8b0mbQ0OCEqNut21fYK2wVpr+3nbePf54rcyBEqEiQl4uFJHWB
	Jq6qR7B4IMdb0hs5fh0IrNn+7h+XqFKIBoSypmGQb3sB0Ta1z3oIk6bq8OW9AtQr0R+1pj/l5L0
	i5vKTzKRtA3t0o
X-Google-Smtp-Source: AGHT+IFyvVOEweNxrh16YD20mE77IBN0Po8lftDP9+7uthANKKUtoM/hDSrwfGPJXxWtS2gW83cJIA==
X-Received: by 2002:a17:902:f60b:b0:2a0:b44e:9ab6 with SMTP id d9443c01a7336-2a2f222aedcmr158395745ad.7.1766499254507;
        Tue, 23 Dec 2025 06:14:14 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a2f3d5dea1sm126783015ad.81.2025.12.23.06.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 06:14:13 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 0/3] RTKit protocol version 10 support
Date: Tue, 23 Dec 2025 22:13:41 +0800
Message-Id: <20251223-rtkit-v10-v1-0-12b4783d6403@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJWjSmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIyMj3aKS7MwS3TJDA93klOQ0E8OklMTE1DQloPqCotS0zAqwWdGxtbU
 AMb6qb1sAAAA=
X-Change-ID: 20251222-rtkit-v10-cdcf41bdaaef
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1300; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=2GuJTyWIrsDeGaNyuHSnV8PC6KHT0nLXNngeZNALiqY=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpSqOwxGpt66m0Ftv7sWbJM0JlxwkPw0O04MAXv
 mmMcoQCcu6JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaUqjsAAKCRABygi3psUI
 JMVQD/41UkTQa0076LW9gr+nbJAiCTI0Es0JhXXGB9F25C6yySKvUBTX0fMP2YAfWSuZh5ezjLS
 Rs92NfEZcUDUltXsObHEcMbNJOyyOoW/RfvW9Dr3gYtwS2ajezbcbMWEfjv65GeN2Q9FcMh/TlV
 /AVhPfp9YT8mHCdGRMeek3P1BcqrDStLc5sbvgdolmFaMtI+bLRM70t1LD6VZBe4eAATVTaJdiM
 I8hULkYZt62gj5Kk4wUYmavF7p3hDeGN52lvjUe9N//O4G+adeVSBNMfZ3zA/La3mic13RX9gb/
 ho4PuLkiDVS1vWKXjnzNvmoWaqbOM2/UlBOFssflYJl5/cWOb0jR0O/y16GqU52/XROSJdyEdwE
 fC6kp40kNOvqlAwk3Q8kNHXSVtbq46LkmineLmXfyzoDsN/xwLWB3wCnhtIOhmtRyqZHVXCtiXt
 Oc0/7/3BeBxK0SxzRxlyj+i2VfefBMCxpn2/oAdNDe9yZuJsSDiiySihjzofqFykhDChjaLjuii
 V70Gg6BreUjgECgt/Z+TnkWUAEkW1nowyP7X6j90VW+Y/Y3TgKKoKJSIcWFRZ2rtx1s+nSz9vSJ
 G5DTimceg38O9ypV3Rx4bxC5ffkdYAmNwBM8NAxuhcdfDwzN2/nAVP1A/Pq7zndJaOHXWhjetie
 KYa8w3mxCvBEWzw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add support for version 10 of the RTKit protocol which is used from iOS 11
to iOS 13. In version 10 epmap is always completed within 1 message, and
app endpoints start at 0x6 instead of 0x20.

A new interface apple_rtkit_app_ep_to_ep() is added to accommodate the
difference in app endpoints. Consumer drivers that uses RTKit app endpoints
need to be modified to use the new interface to work with protocol
version 10.

Add support in macsmc to get the SMC endpoint with the new interface.
nvme-apple does not use any RTKit app endpoints.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Nick Chan (3):
      soc: apple: rtkit: Support verison-specific app endpoint start
      soc: apple: rtkit: Add protocol version 10 support
      mfd: macsmc: Support variable app endpoint start

 drivers/mfd/macsmc.c               | 18 +++++++-----
 drivers/soc/apple/rtkit-internal.h |  4 ++-
 drivers/soc/apple/rtkit.c          | 59 ++++++++++++++++++++++++++------------
 include/linux/mfd/macsmc.h         |  2 ++
 include/linux/soc/apple/rtkit.h    | 10 +++++++
 5 files changed, 67 insertions(+), 26 deletions(-)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20251222-rtkit-v10-cdcf41bdaaef

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>

