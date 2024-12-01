Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2708918A94C
	for <asahi@lists.linux.dev>; Sun,  1 Dec 2024 16:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733068844; cv=none; b=TgT07PSrXq7j64xZeymyjgPDcdrEqF8P062mGvTUUkC5AyuhqxRfGXIOhVcFuhdp6PB/WkTtV0Zm7RbxNIwAVAr9lUEft3797Jhw588UpC7AgL+93MJ48ePYRV2rwY78Rjrw2QavVQZIkWHfbANJvnSBt9gRekES9e+2qADdO0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733068844; c=relaxed/simple;
	bh=yt9X+1PBEQfF2AmldoMT5luhhth2c6LUe3IRgSiyEvg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o4An7TXMVG1iXr5Ycp9HzyTzUjqxjPXpVgVTCpJw5hROVhZZq19stzZYDgL2h0bXwCZGLGV5LkA8utArsajOWaao/dQdS8f0JZA9GwbRF/lpLZAbxefDzGnEF5YCrbMkk11XG3S1fD7xSW4KWqu58pP18FxdNw8a5UHdp4FcvEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LEeJAXMY; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LEeJAXMY"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ee86a1a92dso696578a91.1
        for <asahi@lists.linux.dev>; Sun, 01 Dec 2024 08:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733068842; x=1733673642; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hLTw328DQY3n+nYpsFgKV/IZtfLPh9HpMEQT4J4adnI=;
        b=LEeJAXMYkAqkGx3uNPJT26UcePSJ3rVPSJ6xFIud0pJuZHAL0gA/gMS8oiJVDXqBTh
         Po3lErh1jnJTk7q1ypBqlWI3UcCBZtsgFW/NGiWjcgLupSltN/7tQxoGeRATRgAlvhhC
         LvMJVmNCW1XD+0Q28B1iF81VojfMARxreZkbjE/jDwOF3oa5eypAwvDm9T3yFJKDybqS
         qdq9BO+5qhmFdJzQL3fAHoVGgS0RVGEEiIqvFMPWrzqUhd9O4haZcl3xpCLiAGm68g7e
         Vro5+o9jLN9H4AZBQ82n7FWiiJUGK3BTB/Tw2PrCaqGDNJKmenTB2KZ0tktE3Wxf1/UH
         pNag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733068842; x=1733673642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hLTw328DQY3n+nYpsFgKV/IZtfLPh9HpMEQT4J4adnI=;
        b=NgHv7nVMOXWKTdXbBZ0Ma55heNAjfzo1GldxqrF3ng2i34cF+azbLQTL1q/GLhv3W9
         BzD2ezslDAgFuenbwFQ57yMjA3LzXIRJl6Ymv5hSN5Gir4hyCmDGH7t4lmovR7lw3IHs
         7QOeHZD08y3gQsGb+ZDxp+3XsplYwNqgTQmV+tkGBWkrmVagG7nMkYEKSyt+gJIxBrZy
         Q0UQbm4Hr+9xuzzBsHO/L5T8UYKgCUNTuUbfA/EIaRvad51kbk8IJ0PqXwTm/fy9n1lI
         FDliBuWmv1m29/CrO/csdAHDamG/8PqZKpq4dIQa7CQmGZoJhaz1dxHcm9rl7/aHoG3l
         XB5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUHB1/PV0mwxDmeNKlU8uqVw3sffMhabWqciVGA22HZds5E/RbUgsIFrS7dKGAAF+VK/mu49Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxIaTyFav7JkHVTM5GUfCfgQfXuMLc3wdJ1x8/ToVc1H5jo9WzH
	Kmsg/lxaLasqHMplv71epm2lsgRZKs+aPQe5oGuArNwhwmA3IkjU
X-Gm-Gg: ASbGncutqlVyosb2CdyTuhTIVLI1UbgI0+dlD3Jv0Zg5WV5P1JmGD8iv0K0gTdCqEEl
	ADs0FnRK1jm8bB8oCqUo30KvAMBZ+A8IuuISpoc6ZuCYYbc9bikytgnquNtrNub+n3130cslKR8
	V1Cui3qEK+wAFKNJBxWhhZfE+tBkcu7uSGCxcHA3gZSKm8DTJmrexxsOZGh4yekKGCt6tpFLCpg
	3rLAo/Z209FfP8xwLaTjK+Cj3gyG3cf1cC2NTSQ2f3RyGklmGV0xYTFfMx5xsul9Q==
X-Google-Smtp-Source: AGHT+IGchtk633+rQf9MvvkRJKgrKmqU7Z/WSWsyNWH69akPMsMA/WPwo6E4IF9tYA9VQ12V1KU66A==
X-Received: by 2002:a17:90b:4a83:b0:2ee:bf84:4fe8 with SMTP id 98e67ed59e1d1-2eebf845036mr1872439a91.30.1733068840880;
        Sun, 01 Dec 2024 08:00:40 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2ee6ebc4a73sm2395173a91.0.2024.12.01.08.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 08:00:40 -0800 (PST)
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
Subject: [PATCH v4 00/10] Add PMGR nodes for Apple A7-A11 SoCs
Date: Sun,  1 Dec 2024 23:56:37 +0800
Message-ID: <20241201155820.29259-1-towinchenmi@gmail.com>
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

Changes since v3:
- Add "apple,always-on" property to "ps_spmi" in t8015 power domains.
This is required for cpufreq to function correctly which will be added
in a later series.

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
 arch/arm64/boot/dts/apple/t8015-pmgr.dtsi     | 931 ++++++++++++++++++
 arch/arm64/boot/dts/apple/t8015.dtsi          |  21 +
 39 files changed, 6237 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8000-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8001-j98a-j99a.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8001-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7000-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7001-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8010-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8011-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8015-pmgr.dtsi


base-commit: 9ad55a67a788c0806b0fe23be36fae6dbfbc3fc5
-- 
2.47.1

