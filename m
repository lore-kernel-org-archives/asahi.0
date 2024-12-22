Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FDD143759
	for <asahi@lists.linux.dev>; Sun, 22 Dec 2024 17:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734890009; cv=none; b=CIn2eaYqX0xlrWMuwfSBBSwBAFx3q9+rniG0pgVsEPQBaCST3MUjecSoVPWLXUmLBbSttzaqvabcmBLSPojhpCr9Osn81bIb/vNPlrTVqdSQHvvdWCbKQX8FdlkOx68wMOUDFfTX60onOvH7VI9oalP+FRXwQlMJz2AsW/7IbHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734890009; c=relaxed/simple;
	bh=8MNRPepJkkLCTQ/iyaC5U9L9+CTiTsdOPf+rDYQGrVA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UlR0aY7GiBI4ypcphRmXqRBH7li5b5LGzVlmKvGsAzIcp6TOHAFcDASQBteYqpZVVdYomHbS/CKPG/rnFpEn9LikGGx13Z0fL6Zb1yu9igA8ZFEZbhTJqlv44BTKEsmjGoThkpoyfdsNl4XVNn4YbaulxiV8a5UlBxjjb2w8xkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XuOVKVzn; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XuOVKVzn"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21680814d42so30342925ad.2
        for <asahi@lists.linux.dev>; Sun, 22 Dec 2024 09:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734890007; x=1735494807; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zDMdLkzK4YXyBfIRpCGTdJZPn7J+kcoIKRDno7O4/7c=;
        b=XuOVKVzn/+AkKgcYuzYMK5pTy/M9OZRsd9VjnSOselsfLnCGTdI71V2aYJ7DJ3KZxu
         LtFiOR+TQNFJZLBaS2ctu8DtVyvAk11ngPqaKiNiZ1yR8DCUui0iwDPne7BM9FDHACdC
         sVNTj4OsXrMFkzCBQy9p3sNtesRdwnz/noUpmDaH1IjVgiR5+7wRDnr9nBAPJzzyiAox
         jbakZpA/FzMF5JRMpVUAKXy5uTaVwdyxlGAG/hM0Qn76ukYS3dFqHQHRc1mDc+Sk5iwM
         5tpYP3HJSieD7Z3fFk74kcMz0Jg4pcMb/atI407t0eVs+B3Z9U/cvhcsL8GrjqeaiMju
         Ojlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734890007; x=1735494807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zDMdLkzK4YXyBfIRpCGTdJZPn7J+kcoIKRDno7O4/7c=;
        b=gXXGJM3RgzguwodB5vVMMHO+OGAP3WqPTZnHjRYFyTF4VlgnNDFH4oJtBZuu+LtmV9
         +ZhrwU3MFNMdnPyZycclsMul/7OUOfRloWrYHTrKCTNjUXqaG7YOaMxPemI0NAnCPdsW
         PtuB0LEk395BKnuoHI1XqIxsCHgui2xGq8Y7MSB+2R48I/OhI8h8GnPv4w+NkcxEaM8A
         pTmpPKGWIKgEfqqFOz8cWUHluwtLtyY+WldKhrb8ao+9xg+Dhuyzb2v27ytSniGvLnLG
         SqVvM64an9xiShioep9qJTh829vv70OJF1GHsSPHSNI9Wfzvs5PpC4m7853XW8Meaqhs
         2+AQ==
X-Forwarded-Encrypted: i=1; AJvYcCVL+AV6Pj5xcSpK1cESMexvINiAOqL6SJb8Lfv5740vqzQvI+HV2Tm3GvFPnUoHYuIUDFL4ng==@lists.linux.dev
X-Gm-Message-State: AOJu0YyUpZY4+/9K8WaNQxQHzmk5hyHT/yndCoBDYaVwDQTD7Hl3NdAp
	2+ArNiUkqUBbMo8b11yOkLD6jvGCzVtxFYisC2c0NcofEN8s/EuD
X-Gm-Gg: ASbGncsRWpkWeN0zfggTkSShvI7J4dEwql5ASbF/rHn/iKZ24lBOKQi8GKaEqvtjXCh
	g3R4yVORyCrwv4qnI5sjz9z+Oq4/F3mrI0I0mlmf3hQlAMpTzMX/f3kcbhbCDGZJVkDMP2ch6Xj
	cx3QJC+38My8aIctf7TrMFom2gAJa23wphynEm/cai5xwCzrZuZp+qMT1D2htGr45wXhPzInF3t
	8Q8yf9ppdmcDmUnyMA0D8IG6iaytGgN6s0WRYintS+Jzkt/PRD4TGT1Gw==
X-Google-Smtp-Source: AGHT+IG2c5ImIZhO72M0oe5oieCq6SaUFn68rpgEdkMuKrS32fV+fQUK2a/x6HLbVFBi143LXmxggA==
X-Received: by 2002:a17:90b:534b:b0:2ee:ab29:1a65 with SMTP id 98e67ed59e1d1-2f452dfaee6mr14740405a91.4.1734890007511;
        Sun, 22 Dec 2024 09:53:27 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dca04c33sm59503685ad.247.2024.12.22.09.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:53:27 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 0/9] Add Apple A7-A11, T2 SoC cpufreq nodes
Date: Mon, 23 Dec 2024 01:52:00 +0800
Message-ID: <20241222175314.151437-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds performance-controller and operating-points-v2 cpufreq
nodes for Apple A7-A11, T2 SoCs.

Dependencies:

- Apple A7-A11, T2 SoC cpufreq support, in PM tree.
https://lore.kernel.org/asahi/20241218182834.22334-1-towinchenmi@gmail.com/T

- arm64: dts: apple: Split s8000/s8003 SoC DTS files
https://lore.kernel.org/asahi/20241206135051.56049-1-towinchenmi@gmail.com/T

- Device Tree for Apple T2 (T8012) SoC devices
https://lore.kernel.org/asahi/20241203051147.110980-1-towinchenmi@gmail.com/T

Nick Chan

---

Nick Chan (9):
  arm64: dts: apple: s5l8960x: Add cpufreq nodes
  arm64: dts: apple: t7000: Add cpufreq nodes
  arm64: dts: apple: t7001: Add cpufreq nodes
  arm64: dts: apple: Add cpufreq nodes for S8000/S8003
  arm64: dts: apple: s8001: Add cpufreq nodes
  arm64: dts: apple: t8010: Add cpufreq nodes
  arm64: dts: apple: t8011: Add cpufreq nodes
  arm64: dts: apple: t8012: Add cpufreq nodes
  arm64: dts: apple: t8015: Add cpufreq nodes

 arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi    |   1 +
 arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi  |   1 +
 arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi |   1 +
 arch/arm64/boot/dts/apple/s5l8960x-opp.dtsi   |  45 +++++++
 arch/arm64/boot/dts/apple/s5l8960x.dtsi       |  10 ++
 arch/arm64/boot/dts/apple/s5l8965x-opp.dtsi   |  45 +++++++
 arch/arm64/boot/dts/apple/s800-0-3.dtsi       |  10 ++
 arch/arm64/boot/dts/apple/s8000.dtsi          |  53 +++++++-
 arch/arm64/boot/dts/apple/s8001.dtsi          |  59 +++++++++
 arch/arm64/boot/dts/apple/s8003.dtsi          |  53 +++++++-
 arch/arm64/boot/dts/apple/t7000-6.dtsi        |   4 +
 arch/arm64/boot/dts/apple/t7000-j42d.dts      |   4 +
 arch/arm64/boot/dts/apple/t7000-mini4.dtsi    |   4 +
 arch/arm64/boot/dts/apple/t7000.dtsi          |  46 +++++++
 arch/arm64/boot/dts/apple/t7001.dtsi          |  52 ++++++++
 arch/arm64/boot/dts/apple/t8010-7.dtsi        |   8 ++
 arch/arm64/boot/dts/apple/t8010-ipad6.dtsi    |   8 ++
 arch/arm64/boot/dts/apple/t8010.dtsi          |  86 ++++++++++++
 arch/arm64/boot/dts/apple/t8011.dtsi          |  79 +++++++++++
 arch/arm64/boot/dts/apple/t8012.dtsi          |  83 ++++++++++++
 arch/arm64/boot/dts/apple/t8015.dtsi          | 123 ++++++++++++++++++
 21 files changed, 773 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-opp.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s5l8965x-opp.dtsi


base-commit: 9a33cbb3b1e4a0b520a131aec028ddeb99da48c3
-- 
2.47.1

