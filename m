Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D94B18DB35
	for <asahi@lists.linux.dev>; Sat, 11 Jul 2026 01:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783732306; cv=none; b=oMW4MTl1ldR7TmuzqvkIac3VmLP35kAb9lFsCMMFGpUF2OoI83qM5vMb0AQ1MDbx+e2hPA8IhpwOFG1O8D4NOSwxQDa6XJVMnuoqo2Q5Sn3nO/bBeAQS5xW9C7pJOpIWh0Bn3tAQc2ybP1KdHJrkygv5zjMXLYTRkEtCTGRkrwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783732306; c=relaxed/simple;
	bh=hXFOnrwzN/Fwpr5HYeSXEfo2w3MV50Nayvg5kYNp94M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ONYkSZR0VZ8Ll6Jz+64XpslY2bzR2ryFrrdFhHMJW2ntXjCWic/XRngFN7YtXqpdeMVpk5k3nEKcglz4v5irnvjT59YS6Rc/UdES9wcB5c3NvRoKt4cTflE9zr/gY0CTx/I6gTvgGT7eMuvukTMQiZt/HSSEFsj7V71e/8JsdE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gzmg2avW; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gzmg2avW"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-ca97d139d8dso939807a12.2
        for <asahi@lists.linux.dev>; Fri, 10 Jul 2026 18:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783732304; x=1784337104; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=g3VNZH5oI3L1YXrYtuo88tYkoHndAa7EPBS4UgpLDK8=;
        b=Gzmg2avW+EHEjwO8KvFXLP4oltLyr3fnuO0JtaHDf/o6reK/3FxuqOS5/0EeVrbsG0
         Ma0jpoICluW6b0j/k2liLltsM2b+jcyBD2qM6fBWrvcIdQFUKgo2YYLf6agFAP3Pv8TR
         oFBliwsvDCjFHX4FKjgKLhtyr06pIezdNfNHBB3j3WyTBHP2kFnSZss+U4spOxpDjd7S
         r6ln/5h3NzCJYRLxZukxIpD5hChk9mFl17R1eIIfvcNsiglW8vehKMWiYQQzC5A2Whe+
         QMyyVqTjiWN1Og9MuCt7KEEn8IEX25K5GEXGAVzRPFnW3HmExWVYn+rh4MoPqha6/Haz
         krMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783732304; x=1784337104;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g3VNZH5oI3L1YXrYtuo88tYkoHndAa7EPBS4UgpLDK8=;
        b=Uvutf20+BpFZPM8eb5JpVRNhgJ7y3gqISr857LMWaq+yOmbR0Q2F9KIc1SPcXYB3gC
         Ixk4++3au5kJ+BOOthEwrC7nqqMnA67fgLNAokwW9c4taSmVPxj83Qjw/NhZU/n+0AMP
         hpKuAzfj+5vDYfJtpAdtKuky/jBFm3+7SeAFpeRltXFvYg9umCfjWe/SfijD2/GKFKFw
         851C5ygKZ09HGYLTyjBpNSExzcNw9ToKYEqYPQzS2yfcdNp7pHpnri9XfyW56usvqzl1
         nFjxwmCd0VCJHHJwnWE7w8REcWMnQl1KisQOu6qciu4UtVxEG8U/RfUWTumc5AOlFZlK
         CtFw==
X-Gm-Message-State: AOJu0YzggsL6Vk0QroFz7qFyKxFyrVXKsbCPaE6KrXF9SYIgwZJz8bMG
	KCAniQOqN7HQJ9gaxFr/U0pCH+P+g4McShRfScG7XUh/WSx31x8wi0qi
X-Gm-Gg: AfdE7cm+l77avo1BXK+Fi8lWJqRQ6w3HsCmL0znMusQT98XK+A3j98ew9+u1BS3PiVP
	b8vvqFB5JxmVHDWmQFS1rUffNbRnsZKKa683YV8B7RO2RycmgAJ89vMs2qSDFnTLqwSnXsUUofl
	ZozQT5BfM/+Lw2VLO9BsSklWPkJmZ8I0LqUTF9DFrkmOcJzkdEpYzZUf3qDwWwa0I78pmrKO4Tr
	IHhpNE1ZHJypu/PFJir6FT/XHHNQWPFAJlf46H0LH6Krmz+46YgLOyRhQwa+xeV4M4eeTiYkaGK
	cc7Zfr2rH17rzuNtCvG8u/6lrZaW0WPsTo9Gj5V8WSKpuyh91b2tOe4IxHatBkbViBk9JxCtIVu
	LLZkxmr+T0ZyWi960ndRMWx1Rp5gB2tBNxKo5TiMyXUjxBrLeDFDvkOEo05Cx06LhzNoNxdQvJC
	XPdBR/pAiNab68ZDJAH13eU//Rt/q2uBpFIwupeEkJ9veCDJJ8YAnVADNoTaw/gNLEhLdhp3/Er
	SHih2XZ4L6L3fYmVFTG0RtdTjHS4ruiGRYhktq0RA4U4TDaQBheSxAuL7xGt2MfShaGBTlMZAS/
X-Received: by 2002:a05:6a00:1807:b0:848:32f5:4999 with SMTP id d2e1a72fcca58-84889715a44mr1127795b3a.30.1783732304377;
        Fri, 10 Jul 2026 18:11:44 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-848530c5a12sm3751929b3a.5.2026.07.10.18.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 18:11:43 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH v4 0/7] ASoC: apple: mca: support simultaneous I2S capture
 on the frontend
Date: Sat, 11 Jul 2026 11:11:18 +1000
Message-Id: <20260711-apple-audio-redux-v4-0-2994d87c2f24@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23NTQ6CMBCG4auQrq1pplDAlfcwLvozhRoQ0gLBE
 O5uwRhdsHyTb55ZSEDvMJBLshCPkwuue8ZITwnRtXxWSJ2JTYCBYAI4lX3fIJWjcR31aMaZqly
 l3JSagbQk3vUerZt383b/dBjVA/WwQduidmHo/Gt/OsG2+/rFgT8BZVRwKECUuhQZXKtWuuasu
 5Zs/sR/Qs6yI4FHwdpc5tIiKKH+hXVd31OmiaIGAQAA
X-Change-ID: 20260623-apple-audio-redux-b7b43d9c02af
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2515;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=hXFOnrwzN/Fwpr5HYeSXEfo2w3MV50Nayvg5kYNp94M=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmBM9wsz7EYCtcyFG7K3P3z6f2MtP9dsuLbPCeulud5I
 2y4y7miYyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNV7JzD8r7c80ylzlNPruvoTy2dZXU/mqpSZy71eluYlcHGv0ZpXNQz/zKdbX9/
 jtZ35V3LByt58e8GeonPZjfvcdnXsyxb8evoeCwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Hi folks,

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
Changes in v4:
- Fix remaining port_driver reference (sorry...)
- Link to v3: https://patch.msgid.link/20260705-apple-audio-redux-v3-0-ff7a7afe2b6b@gmail.com

Changes in v3:
- Changed magic number write in fe prepare to BIT(port)
- Link to v2: https://patch.msgid.link/20260628-apple-audio-redux-v2-0-6328269c9652@gmail.com

Changes in v2:
- Drop readx_poll_timeout use. It ended up being unreliable. Fall back
  to just bumping up the delay on SERDES reset :/
- Rebase on asoc/for-next
- Drop the one patch that was applied
- Drop clock shutdown relocation patch. This was not actually required
  and the incorrect thing to do anyway.
---

Link to v1: https://lore.kernel.org/asahi/20250518-mca-fixes-v1-0-ee1015a695f6@gmail.com/

Regards,
James

To: Martin Povišer <povik+lin@cutebit.org>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Hector Martin (2):
      ASoC: apple: mca: Do not mark clocks in use for non-providers
      ASoC: apple: mca: Add delay after configuring clock

James Calligeros (1):
      ASoC: apple: mca: increase SERDES reset delay

Martin Povišer (4):
      ASoC: apple: mca: Separate data & clock port setup
      ASoC: apple: mca: Factor out mca_be_get_fe
      ASoC: apple: mca: Support FEs being clock consumers
      ASoC: apple: mca: Support capture on multiples BEs

 sound/soc/apple/mca.c | 300 +++++++++++++++++--------
 1 file changed, 207 insertions(+), 93 deletions(-)
---
base-commit: be44d21728b6646189779923b841ad3a46d694e5
change-id: 20260623-apple-audio-redux-b7b43d9c02af

Best regards,
--  
James Calligeros <jcalligeros99@gmail.com>

