Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B3A2AE84
	for <asahi@lists.linux.dev>; Sun,  3 Nov 2024 07:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730619221; cv=none; b=BojHF5FmEuGIdprrp4UjXWOIquQ3TyaUM2CDVS0e2nf41agkSdvsBRRlduhfMG8uUz90U+3AIOwUGqn9BjkBP7MAIFXzE0+HgDmjkjg8jDak2RhjznqvrM3xNuhsVydBK2Ppj9OwEilm7oFgS5yOFjU51rdGtm+YRHIBhHYrj0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730619221; c=relaxed/simple;
	bh=iJDACKEXdrr4mcyjON6lv7CP6tLtsf3Oxbt6vCwmHp4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c6X9oVZJMX1zD/GXqrqitUspR24KzjUXD3lLI5tyh1W0k5GXVZ+sJGN6IeJXXR0tcb9QlXey/JI7hj8pGAkGF9RXA9wrV98Qdz7/kJxr109mcrVYIFgfB340EisllraS/HDMuII14aTD2p01kmF5LI9uscuL0GLlXlX77qcfV58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gAonFWGo; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gAonFWGo"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2e2eb9dde40so2560297a91.0
        for <asahi@lists.linux.dev>; Sun, 03 Nov 2024 00:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730619219; x=1731224019; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JK9/LDUBjeqfgN2Gg/DD/Yg8tlljxY1YXMgl96rzOhc=;
        b=gAonFWGoI1inWwOvci6KaZ3WLn7RrHBYOCWt+Ls17AtcHeGqWY9cojc/JyTIRT9BAg
         ZLtrtkfErFYBi0b9mZLm5RdCMWk0lboGjsuSR6HcB8fUFB0FlHgrIE/M2XNSAsGQjk9M
         UKubUeRGay8FUfUiiNAJazHchImlBYRM9S/njNG3fYifqtE9pJ7HoyiuEAQ2jiivG4Jj
         2gpeBwog2e6pPIRWvR0/DUxUxn8WhfQRVXoboy/kTPRA31nSUUd2263VmpBF0M8IlXCD
         hFGZBFmgxkPvfWDwn691PxyvjVZTnkQmPOV/aLAEsJXBl8Kf7+KyVqGqamerk3eRmunY
         x4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730619219; x=1731224019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JK9/LDUBjeqfgN2Gg/DD/Yg8tlljxY1YXMgl96rzOhc=;
        b=nv+lQSBrHnesl0pdM2Hv9i9SlP+CitTCdQjn7Rc6K+Vuilif5CsefdytZxwKdpCl3z
         ArYkAS2axPp3H65wmGzyGLwmiTUvLlFs7ZmsXTGjUvYyE+yJjgfE+4jqkCNq6Rjeqi9n
         xVBXYBVo2ABYF9z55FtreOZ9/j60xB7pmMCqi/2JdBcWSQHLQIImchb0v70P0Mbi6qQV
         fadD0Hc6YX7660qH2pHQ+yJpWILAPWi4lrMTH9HOkVZooL/Ym/QFzpOYxw+ER2CFyKLg
         OJB33Y3y18DooQj++MH71KwKDx0RvB7E2kGR6s7CLxEyHtNxykqOeSBai7CHF5WrKGkj
         OISQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGkoB3t/7WJpzwB0jP9rqaaNODCfL6k7CQ4dP0lzD8G+UOg1wW+YsNlzjCZ5lHG5+3TZVCmw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxbroA73nC07BoVoM9b2v5OC+GK2niIN6PNSmsYlSBxZRCZsDi8
	RQfoV6QC6BgMH889eWE7J7FrGJcg4CjJSqRGJclbr+NNInX1g7+G
X-Google-Smtp-Source: AGHT+IHpO6ChUYhlaktb2w//U/SuJc4GICT1u8EbdcOi6DCPXEF/TjJe/FrYq9R1QV8LS7U+4HIwDg==
X-Received: by 2002:a17:90b:2e45:b0:2e2:d181:6808 with SMTP id 98e67ed59e1d1-2e93c1d3a03mr16305519a91.30.1730619219400;
        Sun, 03 Nov 2024 00:33:39 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2e93da983f9sm5353443a91.5.2024.11.03.00.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 00:33:37 -0700 (PDT)
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
Subject: [PATCH asahi-soc/dt v3 00/10] Add PMGR nodes for Apple A7-A11 SoCs
Date: Sun,  3 Nov 2024 15:31:11 +0800
Message-ID: <20241103073319.30672-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds the PMGR nodes and all known power state subnodes for
Apple A7-A11 SoCs, along with the associated dt-bindings.

Changes since v2:
- Removed "apple,always-on" property from "ps_pmp" from s8001, t8011,
t8015 power domains. It is not on at boot. (Mixed up with ps_pms which
is required to be on)
- Add asahi-soc/dt back into the subject prefix, missing from v2.

Link to v2: https://lore.kernel.org/asahi/20241102011004.59339-1-towinchenmi@gmail.com

Changes since v1:
- Removed "framebuffer0" dt aliases. It is not standard and not needed.

Link to v1: https://lore.kernel.org/asahi/20241029010526.42052-1-towinchenmi@gmail.com

Nick Chan
---

Nick Chan (10):
  dt-bindings: arm: apple: apple,pmgr: Add A7-A11 compatibles
  dt-bindings: arm: apple: apple,pmgr-pwrstate: Add A7-A11 compatibles
  arm64: dts: apple: s5l8960x: Add PMGR node
  arm64: dts: apple: t7000: Add PMGR node
  arm64: dts: apple: t7001: Add PMGR node
  arm64: dts: apple: s8000: Add PMGR nodes
  arm64: dts: apple: s8001: Add PMGR nodes
  arm64: dts: apple: t8010: Add PMGR nodes
  arm64: dts: apple: t8011: Add PMGR nodes
  arm64: dts: apple: t8015: Add PMGR nodes

 .../bindings/arm/apple/apple,pmgr.yaml        |   5 +
 .../bindings/power/apple,pmgr-pwrstate.yaml   |   5 +
 arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi    |   4 +
 arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi  |   4 +
 arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi |   4 +
 arch/arm64/boot/dts/apple/s5l8960x-pmgr.dtsi  | 610 ++++++++++++
 arch/arm64/boot/dts/apple/s5l8960x.dtsi       |  13 +
 arch/arm64/boot/dts/apple/s8000-pmgr.dtsi     | 757 ++++++++++++++
 arch/arm64/boot/dts/apple/s8000.dtsi          |  22 +
 arch/arm64/boot/dts/apple/s8001-common.dtsi   |   1 +
 .../arm64/boot/dts/apple/s8001-j98a-j99a.dtsi |  26 +
 arch/arm64/boot/dts/apple/s8001-j98a.dts      |   1 +
 arch/arm64/boot/dts/apple/s8001-j99a.dts      |   1 +
 arch/arm64/boot/dts/apple/s8001-pmgr.dtsi     | 822 ++++++++++++++++
 arch/arm64/boot/dts/apple/s8001.dtsi          |  22 +
 arch/arm64/boot/dts/apple/s800x-6s.dtsi       |   4 +
 arch/arm64/boot/dts/apple/s800x-ipad5.dtsi    |   4 +
 arch/arm64/boot/dts/apple/s800x-se.dtsi       |   4 +
 arch/arm64/boot/dts/apple/t7000-6.dtsi        |   4 +
 arch/arm64/boot/dts/apple/t7000-j42d.dts      |   1 +
 arch/arm64/boot/dts/apple/t7000-mini4.dtsi    |   4 +
 arch/arm64/boot/dts/apple/t7000-n102.dts      |   4 +
 arch/arm64/boot/dts/apple/t7000-pmgr.dtsi     | 641 ++++++++++++
 arch/arm64/boot/dts/apple/t7000.dtsi          |  14 +
 arch/arm64/boot/dts/apple/t7001-air2.dtsi     |   1 +
 arch/arm64/boot/dts/apple/t7001-pmgr.dtsi     | 650 ++++++++++++
 arch/arm64/boot/dts/apple/t7001.dtsi          |  13 +
 arch/arm64/boot/dts/apple/t8010-7.dtsi        |   4 +
 arch/arm64/boot/dts/apple/t8010-ipad6.dtsi    |   4 +
 arch/arm64/boot/dts/apple/t8010-n112.dts      |   4 +
 arch/arm64/boot/dts/apple/t8010-pmgr.dtsi     | 772 +++++++++++++++
 arch/arm64/boot/dts/apple/t8010.dtsi          |  22 +
 arch/arm64/boot/dts/apple/t8011-common.dtsi   |   1 +
 arch/arm64/boot/dts/apple/t8011-pmgr.dtsi     | 806 +++++++++++++++
 arch/arm64/boot/dts/apple/t8011-pro2.dtsi     |   8 +
 arch/arm64/boot/dts/apple/t8011.dtsi          |  22 +
 arch/arm64/boot/dts/apple/t8015-common.dtsi   |   1 +
 arch/arm64/boot/dts/apple/t8015-pmgr.dtsi     | 930 ++++++++++++++++++
 arch/arm64/boot/dts/apple/t8015.dtsi          |  21 +
 39 files changed, 6236 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8000-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8001-j98a-j99a.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8001-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7000-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7001-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8010-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8011-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8015-pmgr.dtsi


base-commit: 5c9de6f45db36b8a74c12e448cf9db87c97bf1e5
-- 
2.47.0

