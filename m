Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8869F77F11
	for <asahi@lists.linux.dev>; Sun, 22 Dec 2024 17:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734889092; cv=none; b=CrMm4ya3LCAkWOGkGQAo2DvQIF5cxYB5OJST7kWcxwG/rvuVmPfm1hhmMdFJNdPiHXVxb4rW6koM5SrO21vrBSke5PDr4JoEdAbW3ocfZQvQXNepfYQWuPwM8D5zMT5EB3F8wBCArNfhXKM/+AqF6lbBrz5+AZ9s2pxg7amiCjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734889092; c=relaxed/simple;
	bh=y8s2hsyykJKLZFCY/RsXZjiEsG4QjKF1qEhFGLlHPFs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mu4anSdHHoueS6NvsJtciAPYkIWX6xlS3BfJ7+ETD2egxj43xg0+B1Ptiq9/UoRB9krXch6cN4tzum5V8miLbqT5sH+RRIkDcivVqU26WJtdXm+sGf+6sfWxb6bERdKarNXLyr1Tf4iRPBtdcAHItgCQu2L40WIkM35C5Mxk1vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dvTrTS8A; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dvTrTS8A"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-216401de828so29849845ad.3
        for <asahi@lists.linux.dev>; Sun, 22 Dec 2024 09:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734889090; x=1735493890; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S80oaXL7tWde73OJYkrltFLEiYprDrAutl/drFrRVyI=;
        b=dvTrTS8AkmRgUHYDrxRicfSU0jFhP6aF7II8hLjmgEvJhhNcDu8/ouaNPmuCZcWw6g
         fJlmlGNlutgrsp8sy0sBT08l6TYstPE9j87W5+GMmDLWtmwfVCcGnCU+EI4XjttWT1l9
         jIv9xiTgI505kJ8lu7KUeiA38VLAd/IvgQvdtJGlW7pgevswM0n3nb1laI7/rnsO8lTd
         X9XJClehgYFXZfrvoPBTwtCHbipunLO2t4edVfs2LyS3HSA90vPktek8gGURXdNmBoVU
         pE0En7KkMLOhdbNA+FDzUuKFr5uErvbKObcZuo23UBq2T9Kh/dXZO/buxtB6mngEt4ld
         +mBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734889090; x=1735493890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S80oaXL7tWde73OJYkrltFLEiYprDrAutl/drFrRVyI=;
        b=qvaAryPzAyxyYY5G6toSzUlIdLgko83DIdTX1izfviS8GSejMSR++K/CDDkJ9KvsxP
         MIwQ0zkxhGS0Leqw78HuSxJIbJiUdtoPl8MUaFSm0AlboUowm2uxpoLbxxuMMKa09ezI
         NCv9y/9wa1iPmWTaJwQifdTzaGa8yvwRfY3AdOZ7JVesEuq5iHS39/VYaUwoo4v6zobG
         +fC3v6ieeokcNy7GtwTQr3P6I8SiwVm8L6J0VER+Avd0CfiAEe6VQojVAgWMhJbjs7He
         P1D8PNCZQGRnKUxiGQg/rH1H9RHIjblCwMLJNHYQ+3RI/Zcj58iddtabU7wFeUUN/oQt
         RDNg==
X-Forwarded-Encrypted: i=1; AJvYcCVErPHghHc7I6e/eKxLyfTHee+sbkDVFMSIx0fruqdlDz7jM0bSYIcgarQtyxNS4CBntPj5fg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxuKAeZr2zl4FUgTyeJZxMJ+ol9tJPbmWvTEh0vY6G6jYkKa1EC
	iK+hcVqVeLFsGPvRo8OQolWWX7gvMncBIYb1OvTjTqNv/o4wI8RX
X-Gm-Gg: ASbGnctiS1ZVFkxb7/Tg8OGTyPXOY48OL9X1t1vJhvMoxPoHPYWZlBK4pkeSdO444+S
	X3yTN3OmP79p2uoa4WSkLOUQf64fkhlq7BlPPQ5v3vBog84+XqrnKiuCdpGvhOFbiyiOFG1y91a
	RNQAnVJXN+pFfISolJOqkKUhKUsKTQxX80WB8pAEcGDgn2L18ZVVlImMVXeg0196qcjnzYvjtik
	/CWg6w1hqs6uYss4cYfe1uK2aQV2FJkmMiELBTze1IEiFXHIoao1ThKhA==
X-Google-Smtp-Source: AGHT+IG/coJgJoRcCwH+ym9eEokRTEI5QsTKkiAPkjlmzFEzuwTbG0HAJLv5pnLBA72WAXtndYWp3A==
X-Received: by 2002:a17:903:2acb:b0:215:9470:7e82 with SMTP id d9443c01a7336-219e6e88179mr122699005ad.4.1734889089738;
        Sun, 22 Dec 2024 09:38:09 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dc964a73sm59328175ad.45.2024.12.22.09.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:38:09 -0800 (PST)
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
Subject: [PATCH v6 00/11] Add PMGR nodes for Apple A7-A11, T2 SoCs
Date: Mon, 23 Dec 2024 01:34:50 +0800
Message-ID: <20241222173750.148071-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds the PMGR nodes and all known power state subnodes for
Apple A7-A11 SoCs, along with the associated dt-bindings.

Dependencies:
- Split s8000/s8003 SoC DTS files
https://lore.kernel.org/asahi/20241222172735.145764-1-towinchenmi@gmail.com/T

- Device Tree for Apple T2 (T8012) devices.
https://lore.kernel.org/asahi/20241222173240.147675-1-towinchenmi@gmail.com/T

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
  arm64: dts: apple: s8000: Add PMGR nodes
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
 arch/arm64/boot/dts/apple/s800-0-3.dtsi       |  20 +
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
 42 files changed, 7095 insertions(+)
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


base-commit: 9a33cbb3b1e4a0b520a131aec028ddeb99da48c3
-- 
2.47.1

