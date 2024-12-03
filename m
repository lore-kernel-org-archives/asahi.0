Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9880F817
	for <asahi@lists.linux.dev>; Tue,  3 Dec 2024 05:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733202437; cv=none; b=nYsdrYqqln3Io4h5UCso4AuG8iIa3Mp4tGVf4FU3y7PfMpOcIk2IYjh22KZ//xJjgDzX7jqkhhPG9vd+fZSYZO/+Ii7884qmnmfGUwcnfZIHlT2c0J65+tpwjPuA5tE/6oaFz87ovQUy5M38vip8TvXZLHKWTaBiOvy9O+FqixI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733202437; c=relaxed/simple;
	bh=mKNFYhHNL0v4AvoQavKMO8Rr8+7P897pTzA0dJM28/U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nCrmmcgc4mbyVx52RMnJwo/qpt0hnt//kKQ+zSeD2SBPeRtiFZ//uQwv0ErKaWiDWQVKGkIDGNLdUQVbeh5Ep+DZwUFDnt18n3CnGAtWUnzNIizrVRjEcUCLeMX0BmD6FgZOR3CQII/9pT0iFc7LnJ++FoLvmI5Wzdl2xN6nswk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BDEOJHJk; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BDEOJHJk"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7251ace8bc0so4228273b3a.0
        for <asahi@lists.linux.dev>; Mon, 02 Dec 2024 21:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733202435; x=1733807235; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z1y/UHRMXAPYx3GISOfCtLlDpAXY6Bu+5WAmn6OKXMQ=;
        b=BDEOJHJkyt27HyZrTmEP56NJZz+2f1mJra5Xk1AQHulUdo+QZ+studNjZRvR5x52S6
         5i5i1ZgSZfr/W6V8ckKy0skomWVcUp6tnU/RE+Um7+vcuGrxE2t5gmAQEbArd6T97GxH
         GPbKedCb7242BS2lVNzbmOKdkg8aEBGDIqWF1gS0gPcRQpxZ7scK6JrGeP1Jq2xm/ZvL
         doBHB3Wb4qP+Ifzreh4m5XzKX4J30YdPw6va+YHX5reHZBMAD6/c4KB5UGV9JhHwiDDa
         QF9Akjc3dWK21pxUawVKghN03kq8QhxuMYQb2MUpZb0LFgFBuIdgLz6DUtpeJ9Ta7Bdo
         QKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733202435; x=1733807235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z1y/UHRMXAPYx3GISOfCtLlDpAXY6Bu+5WAmn6OKXMQ=;
        b=DwNz7FXVo02rxMGlxZzdkrF1RIEbgQzGQeqPX8WCRGm9nsxqs6Pyh7S+UL9sEtsQ1W
         ze4A3WpK4VrWb/w4Fs41JWSMfAjB8IHO1W/H+lX0Wgir9ps7tj4qSNTxhH+cYqYgNNA1
         xWhD/l/4GyEQXVkMn0yKz3CslHQtc8p1vJ6vhqdbEsMP7+C4Tx7CLyFhb3oy7duqgSEG
         LIm050oRyKlr2mNGG42/ErZ821cOxIsFg8RDZ+mVGc6pU8czwhpFRbIRkpWpxJvOa+Wr
         SLqzXutVoZTEUUJKcqkfAy0gTrBQh92nIGVVrwk19b9h/awfNTF7KCD5extSZpfvi8tD
         wOBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIXnGL+ihLZCbyGb4o1kBMWwO1KAt1mYo6cfbZBnI4Pa1fUCvYw5Pfz0ZEjR5ot9U2+oesNg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzcZ1eI7eszzvd3N/oW+vrullmR22cQqCtSxnMeDSSUeXyfaCgl
	VHHdrZsTgGTSTzkiWqgbpOjWtzWZK6zMx1jQ53hrLcvak5DT2rtN
X-Gm-Gg: ASbGnctfRtqt42crFJIxWJeDnsOtBKfD9YpeQPjDr4aM64o+3psv4nL4aJ8zK0IdVo9
	PULB9eR4EhsM2aitRVsgoOY9viCKm3mGknHOFWP5hVlmXvrrD7Qsxl8rmMuAPHi/A7cpW1M9Nhq
	Kb1Th3ic+X/D58KHFsYLpMrhmUyq2mr6sScl6fWr56hs1J5CTg7FJvw3h4r1+tKW40G98PwTTgo
	CxiUMZyKHc4nOA4Ch2H26ncQTpDC7BABInXSlco3dUGqCreMjdkbTXteRobOHWdmg==
X-Google-Smtp-Source: AGHT+IEbfoV1aAFVp9GssTPLkbkHiqHshw1BAHV/JqI8/B7VSItMkDiZOcTGZQPqX+w+8P/MSchV7w==
X-Received: by 2002:a17:902:f688:b0:215:ba2b:cd55 with SMTP id d9443c01a7336-215bd45d02dmr16275355ad.2.1733202434761;
        Mon, 02 Dec 2024 21:07:14 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21586d40afasm33242385ad.270.2024.12.02.21.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 21:07:14 -0800 (PST)
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
Subject: [PATCH v5 00/10] Add PMGR nodes for Apple A7-A11 SoCs
Date: Tue,  3 Dec 2024 13:05:30 +0800
Message-ID: <20241203050640.109378-1-towinchenmi@gmail.com>
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

