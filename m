Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211632045B6
	for <asahi@lists.linux.dev>; Mon,  3 Feb 2025 12:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738585140; cv=none; b=CS2pvZiMNaGWPUy7ao68mmCrpFYZNSivlKPNsU61ROuVdspZetVXA4D6CbOo9/n/FkB90a+jM29eV0+im7DlMqk30QeC412j2hQPOUGPAihO3/psF+4iEdP2RvVxAYqPKXM6ZuhhmSjjBURON1qF4JaLxBYkOufXSdaUuFI4wA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738585140; c=relaxed/simple;
	bh=5w++ng0t8AmnGHxvT0Mmm6vdBAdXaAL3u+jefbSRZG4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XFTV31S9Kyp9Ri8RDpFys/V+BCKwJiuHL1V9cSqAynVOA/DhEOKvhfTEfNB8q5x63966kzZHs2Hx/WK3cmP1sYvdJNOf0yDD/w5l1y+jdafUMNjLNlfTF3vgySZNLoBCgnpRaxwqgcG8YkwRKJKdMPIAaQ6iOKitoMCw4DbdlaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q+3ZASUl; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q+3ZASUl"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2efd81c7ca4so5440764a91.2
        for <asahi@lists.linux.dev>; Mon, 03 Feb 2025 04:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738585138; x=1739189938; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vQ0bIWQ9q6zEM/5sxJXyhS9znYkoFFSEkIGy2uTUko0=;
        b=Q+3ZASUlefa1EFJmhH4boNM6lDyFGqhu0ShahGhIeln3yYba0BIDgrllWAE0A44M8O
         JrluPTIpugVClmc9CIrVZ/PD72iQUszK90oxZFqAvub3Fr71oFHsh4Z7PjPkrM7ptrRd
         qdCV/7oVP0oQfO2inRsU/LeOubeCznSSuPGYAWqctWLnAUFa7pskNUsEc7cZ0AjRuhA3
         KFqvSQ2rgU7we2IX6nlXiJNjjBtcgItDjCgFGE4dnUs+Dp/7Xxkj2ZyEDjAJ5r4D1x8P
         eyDP2bs8Dmz+qDaWG+RTdG9aEIwqrZL5VpuvcRXjzgsKQj3z0pavEsSokCmAUCegv3h5
         NjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738585138; x=1739189938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vQ0bIWQ9q6zEM/5sxJXyhS9znYkoFFSEkIGy2uTUko0=;
        b=m0NVRpHDAoz0qjufF/1SmN4XNJHdR8f8/SqySSQDXb/03XZ9/4UWpLtg3d8zWKNgxT
         tW7Os2DrvpAW2lJl740w3Bz+0R8J3Ai1g4mwQ3PLlPwswjL+ZhIHBrvFXXFY3lIFd7Go
         KxcwqyWrPfqL5jIP6t45z4Plv0xg9w6ftCuoNdQa0VYCOM49hAtmg7Vrh1vf2j7rU/08
         XRnmJbKh3yEzZ8vQ0XPJGoQJAz6W9pcLmpWRntruhL84Dn6cDCRxcXIng7H+nIDeiQg+
         rteaotGbpRxVqOCMmxm6Ka+Aw0VKHqywo0BXLMyuXgJSVZRFL+WSwSSytLlhO0ThQ1DW
         24Ow==
X-Forwarded-Encrypted: i=1; AJvYcCUy2eiaJWTy6cohbrDTPXov/wXQOQJ0LdN9WTt7KyKZ03gR2PgYWFk7ehCxyagClQwxjAZRsw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyCypYbAGq/Xq5wmO0iSfE6lk3KXUR627gGlcnKf/xEcLtes2Q+
	x9pij5umMfCCV3BwOKX/EBPITlo8X33i2Cp8WLForC3bwgfUyPHd
X-Gm-Gg: ASbGnctdLXHVt9EI2eJ3f+PKF1uRvV+jkghkXJl35xoSgqIH9hCcXFsc58uZutRcQx6
	S9dSXxzegEmovDvZiOuma7vz0CTyyVXJgSTkFd9r+oFgbIjjW6CxiJ2y4IXltkcSwVvNT7z99E/
	yWe/N9QrYCtsCWZY1rSrl4ERKqC41v0Pjp9IPSdL0PXIwoNMv+Edr1mCfsdIwFZ5EFFONsbSb6M
	g4sn8UAAOYtE3ITCc7BZBQZ3dfbNu7Io8o7g4VG4WBVkdztpS2K0Y/bYMv84Q8+nNNbPEPEqRA+
	FUBXVojZ8lRjburK
X-Google-Smtp-Source: AGHT+IFFymEkMEGgrkjU7zGyOQqWTVsUSLUR/9aihtoecd2Y1Z2PQnMwmmui1qhml39JCWlRaPhsIA==
X-Received: by 2002:a17:90b:2f0d:b0:2f6:dcc9:38e0 with SMTP id 98e67ed59e1d1-2f83aa7cfcdmr39474128a91.0.1738585138321;
        Mon, 03 Feb 2025 04:18:58 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2f8489aefc4sm8789225a91.12.2025.02.03.04.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:18:57 -0800 (PST)
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
Subject: [PATCH v7 RESEND 00/11] Add PMGR nodes for Apple A7-A11, T2 SoCs
Date: Mon,  3 Feb 2025 20:15:44 +0800
Message-ID: <20250203121831.36053-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds the PMGR nodes and all known power state subnodes for
Apple A7-A11, T2 SoCs, along with the associated dt-bindings.

Dependencies:
- Split s8000/s8003 SoC DTS files
https://lore.kernel.org/asahi/20250203113949.14760-1-towinchenmi@gmail.com/T

- Device Tree for Apple T2 (T8012) devices.
https://lore.kernel.org/asahi/20250203114417.16453-1-towinchenmi@gmail.com/T

Changes since v6:
- Now arch/arm64/boot/dts/apple/s800-0-3.dtsi builds, somehow this went
under the radar this whole time...

Link to v6: https://lore.kernel.org/asahi/20241222173750.148071-2-towinchenmi@gmail.com/T

Changes since v5:
- Rebase the series such that splitting s8000/s8003 device trees is the
first patch to be applied. Now this series depends on Apple A9 device
tree being split, and the T2 SoC PMGR nodes are added in this series.

Link to v5: https://lore.kernel.org/asahi/20241203050640.109378-1-towinchenmi@gmail.com/T

Changes since v4:
- Use imperative mood in commit messages.

Link to v4: https://lore.kernel.org/asahi/20241201161942.36027-1-towinchenmi@gmail.com/T

Changes since v3:
- Add "apple,always-on" property to "ps_spmi" in t8015 power domains.
This is required for cpufreq to function correctly which will be added
in a later series.

Link to v3: https://lore.kernel.org/asahi/20241122095136.35046-1-towinchenmi@gmail.com/T

Changes since v2:
- Removed "apple,always-on" property from "ps_pmp" from s8001, t8011,
t8015 power domains. It is not on at boot. (Mixed up with ps_pms which
is required to be on)
- Add asahi-soc/dt back into the subject prefix, missing from v2.

Link to v2: https://lore.kernel.org/asahi/20241102011004.59339-1-towinchenmi@gmail.com/T

Changes since v1:
- Removed "framebuffer0" dt aliases. It is not standard and not needed.

Link to v1: https://lore.kernel.org/asahi/20241029010526.42052-1-towinchenmi@gmail.com/T

Nick Chan
---

Nick Chan (11):
  dt-bindings: arm: apple: apple,pmgr: Add A7-A11, T2 compatibles
  dt-bindings: arm: apple: apple,pmgr-pwrstate: Add A7-A11, T2
    compatibles
  arm64: dts: apple: s5l8960x: Add PMGR node
  arm64: dts: apple: t7000: Add PMGR node
  arm64: dts: apple: t7001: Add PMGR node
  arm64: dts: apple: s800-0-3: Add PMGR nodes
  arm64: dts: apple: s8001: Add PMGR nodes
  arm64: dts: apple: t8010: Add PMGR nodes
  arm64: dts: apple: t8011: Add PMGR nodes
  arm64: dts: apple: t8012: Add PMGR nodes
  arm64: dts: apple: t8015: Add PMGR nodes

 .../bindings/arm/apple/apple,pmgr.yaml        |   5 +
 .../bindings/power/apple,pmgr-pwrstate.yaml   |   5 +
 arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi    |   4 +
 arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi  |   4 +
 arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi |   4 +
 arch/arm64/boot/dts/apple/s5l8960x-pmgr.dtsi  | 610 ++++++++++++
 arch/arm64/boot/dts/apple/s5l8960x.dtsi       |  13 +
 arch/arm64/boot/dts/apple/s800-0-3-pmgr.dtsi  | 757 ++++++++++++++
 arch/arm64/boot/dts/apple/s800-0-3.dtsi       |  22 +
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
 arch/arm64/boot/dts/apple/t8012-pmgr.dtsi     | 837 ++++++++++++++++
 arch/arm64/boot/dts/apple/t8012-touchbar.dtsi |   1 +
 arch/arm64/boot/dts/apple/t8012.dtsi          |  22 +
 arch/arm64/boot/dts/apple/t8015-common.dtsi   |   1 +
 arch/arm64/boot/dts/apple/t8015-pmgr.dtsi     | 931 ++++++++++++++++++
 arch/arm64/boot/dts/apple/t8015.dtsi          |  21 +
 42 files changed, 7097 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s800-0-3-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8001-j98a-j99a.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8001-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7000-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7001-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8010-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8011-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8012-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8015-pmgr.dtsi


base-commit: 146773acdbf5afd40b0faf7383061a95adee8a2f
-- 
2.48.1

