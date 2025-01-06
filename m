Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2BE1DACA1
	for <asahi@lists.linux.dev>; Mon,  6 Jan 2025 12:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736166505; cv=none; b=InliAuzKI1vXYfaAqkmbx1VhVsuYf2vKqNstS+Jl35hjhbA+PYmKCLMw9SV96zmHXpsN6mbS9eHQ/59TRNcvND5ePcYxXpsIN6o3DC3j1lN0oKhdwrT7XKh3D0kWp7LQCv21c19cIuTaelsDQfmNmmutDHdYTeAmu5RM/JPP/2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736166505; c=relaxed/simple;
	bh=KGvWSWl9uk2ed0ekxB7H3nn7K1sUUMXaQXVtDpYPick=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HryjsvOcXd5g6DfwOuWSGktce36ODkCDXjFPbAvi18fqarRWxoMyurqbsOaOCMdHpl90PLp/g3kiG4lEzHSddmJfcK71t/08J3C4ItBlEh9Qri5JQsH6CYtK58o5aBSVVyP6Pd+zT6OTriyFQKo9S6KaV6lPWlnyqLKQDVpd60U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iAKr25A3; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iAKr25A3"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21649a7bcdcso198043195ad.1
        for <asahi@lists.linux.dev>; Mon, 06 Jan 2025 04:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736166503; x=1736771303; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FaE6jA7/9ttNgKRSpfqIqxN/gQu26rH/PYdcqquPoas=;
        b=iAKr25A3f0IJ4Nh25xRa7PvsiPjmmWGG3m1I6Q1epjI3rKirEgrS61sYiEcEuaEZ+X
         aX86Ff+XwMEKMea6gI3g/Hc3LOjiMHrS+uS+9IYtAE7CPMfSZ/3GIFqbqAR2q7bntWMp
         S5VVjypjhZHkr7hO3Hnwk3oexB/XHriw3FTA/awaeRlQm26ZY6qqBwGbFqLY0LK3suKP
         7Wdr/UAuPaitsqCXgPDEtUCUYk7jNRNXoRv289BWh2PFjZaKCeK9OKDZ+8v8JPMpD3oB
         Rb0xu3IoOabX8OysK4jRDnxnBWp4crTPDtET7JgBud5jkqlPPerRtFfZcnzeSoI54Fmd
         KfNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736166503; x=1736771303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FaE6jA7/9ttNgKRSpfqIqxN/gQu26rH/PYdcqquPoas=;
        b=skrDRPbpZKfKSqdaGXG+HPYapUF6xLS6WCKA71FSvnam3eBibdXPxYf/u4c1QQMORw
         BplA69wPbGih62nPbs7xnyl8g/IF8OZT6/xIwRRinA5vZ8DexhACezUbBnQdS8Vpc470
         PoCrlJDTuOASp8IUQ+beJeUItBeolonkVuoZ5cbY04HGa+jHX0tb8w9C6EKHGVRDaHqA
         5bbX7mhd4FW6o1uMjhMuKau2CHJUwO21xEVPkXwi+427MTlsbFgksDYwyHxax8WVRI3/
         7D+42IIcTNrm4sk5DfhsHkyF/JkzwlLMRmIbeAt6DVqTYCUTMsdkM8Nhzdih/7ZxCbfl
         9XYA==
X-Forwarded-Encrypted: i=1; AJvYcCW3ALSAJeeSkPLg+d0oZ6fGqNmSBhwEKWMc2i9zSJmkLSo8EG0/apTrbW4g7z+1nZ4tHlAMcg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzooJPlsvdXmCeI7nvJGqzKoImYguQVFN9uxg1xqKMpep/bBnFm
	+I0Jx8kGHQCiygdobmP3qInKYpB99+KX4jQ4WvQ3FX1jLDtGKYzF
X-Gm-Gg: ASbGncsFQHnUa7VwhOKSSD1hE83qduSrZvIGwixKpoLsAxd9kWPFaxpVedPtiztz/kc
	xWeSGSWK19fJJ7q+9Fi0BOJ9Gs9YOcSEJtzZPQFqEH98YxWRAolIwZbkdIUtZBi1XoWnwS6eEA2
	doQEo7mPUyvTxi4nau7P33BVYDwl+bYF3WZA5V77cNUNe7HwATEl0ku26XHjnENO6k/YBvD3bBw
	Od9Z2fho3c8ogF2ewtezJuRPClEuo+gMr6KkDH74dkVAh9NYc8/+juoEA==
X-Google-Smtp-Source: AGHT+IEtmv/rpXen4PxhtrgIHjNBw796XJqJRJF2YmhT/CZwKLvKOi2KzJX4cOgtxTYNo+/18MSJDw==
X-Received: by 2002:a17:903:2345:b0:216:4e8d:4803 with SMTP id d9443c01a7336-219e70bf2e8mr696777205ad.42.1736166502616;
        Mon, 06 Jan 2025 04:28:22 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dc9650bcsm292678655ad.39.2025.01.06.04.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 04:28:22 -0800 (PST)
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
Subject: [PATCH v7 00/11] Add PMGR nodes for Apple A7-A11, T2 SoCs
Date: Mon,  6 Jan 2025 20:26:17 +0800
Message-ID: <20250106122805.31688-1-towinchenmi@gmail.com>
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
https://lore.kernel.org/asahi/20241222173240.147675-2-towinchenmi@gmail.com/T

Changes since v6:
- Now arch/arm64/boot/dts/apple/s800-0-3.dtsi builds, somehow this went
under the radar this whole time... a bad merge after the bad rebase
made this not noticed earlier.

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


base-commit: 657dda2ef61e9b9e7107b672a0c49d2c594508c9
-- 
2.47.1

