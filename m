Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEABB70825
	for <asahi@lists.linux.dev>; Tue,  3 Dec 2024 05:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733202728; cv=none; b=JpEBUZszUd4lAFq9S1P4buSB1l0vb9sEalbgsVMhcBBxehOBaIBezqlJxGnu31tVRjryvRrx+J6lVmlWA5yv8p0wUA0kXYkyAgSAgd8xAUpR0cqnP8jE9uilAi2llv9rQuMf8LP2s9z4C4lsPiC1aCjFLhzRt4DDLLQngEUtJJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733202728; c=relaxed/simple;
	bh=IMlmGBUwgtv1jPmaH3aQf2iXHx+4qQUPO8/WcIT0iPU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n2AU7z4TerDk83UqY82Dq24bEzthBu6mrsnMBJj4abVk8/2eXIEGXjCY/Mh2Cw87ZCwFutUF3JsnIA5sl9g9J3eeH5FhRrWCkdImvLLqRnmPDfgKTQQ0P8O81J4a/oqxGnG6kt+G022UVeWzZATTdf25tL1QyzqdGNWNrz6ahBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l1q98EQy; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l1q98EQy"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7256dc42176so1918853b3a.3
        for <asahi@lists.linux.dev>; Mon, 02 Dec 2024 21:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733202726; x=1733807526; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L8n4o1v2RJyro7eTP9OXPaLkCulfPUB3irYVBi0m5MY=;
        b=l1q98EQy1pAw18fHP8gX2Gdp5zzIi4BDqtfBTKJO37/OWMrSKEl8J07h5E8WQQEIaE
         C3rJ5PXeuDRmjOvkVwiNPR0QXYGyLZA0a+sOhODxK/VL413CM/U5bBDv81p7eZPjqbYw
         yIwSW5OiiEnyXsaCIGBvZ97EnvIIkEYEcVc06/6b598B0T9yDxmemdA1fc/LDy19Z+Qg
         RKOpltqCoerOJunaSz148j98RZFs+I1NDhcgfXOuQF27ePsOVuYBV8JkeVY5QPvG/MSP
         vd3LoyXdc5Lvy1WrzMSKsfJ6OaCKul03HNPV0e1Gkq1ZwXd2NKuv2BM+mMumJ5iWP3GT
         H4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733202726; x=1733807526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L8n4o1v2RJyro7eTP9OXPaLkCulfPUB3irYVBi0m5MY=;
        b=LCONnM1AA80nVUN6eGCjDJbr4vPh8DGJ0ZrLFjIfWsoKYJpkp3rAoWYyqgD37hNQh5
         incqy3CRaxCxRxpwgS2QreTZjMprvxNGpJx5Esr2VCJOKguPFYK2LkIM3uB2OHDugJ86
         lVGp/xlxwr7Pcx8gXezyP398yZnieo9iwY9wKLDekqtoiAbdiQTDeRQ64aflnWJRm1AX
         tn6ocjj9t3rPnfXpEO8Xx/y7BHelNXEg1aHxT1q0/Yk1lqnq+z9Wu36Kg/YiGCHlWC80
         fZ85q6c44lIbSDesDx8+/Zp3O9OPVuYt+7OXDfUSpAhB0JW/5mAEwOx5uC7t6z06Q8jI
         385Q==
X-Forwarded-Encrypted: i=1; AJvYcCWYEuHnjUlG+ehGanPFuh47jamTWjOAauyBh8tdujRKlm9ITxYO4RumOervm9RIJcLvtrOAMw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+IXA3+6NwBfrr5W9QqVbYFdCqidz9YCOr7xMokq2E6Ln8ODfM
	iGohwoG718giPMHrlaKLIk2c11odC9wgbvoPjmS7QLvhcn5J4d2p
X-Gm-Gg: ASbGncuN8c67cEsj6Y4LLQ4vtietFinBCmh8m2Kzd+xyd8bLON4oa2APqNVXL8YsO9Y
	UQ8Og74jl2Gi8lJyDt78Hll9QLlNdUjr4XsuQec92ilLfXGGeU4MUojz/sKtleuR1ElptMKc3XY
	t1wlqdu6KLvi5cJoELmNqbIxsRhI+mgWEJh/kAM4d70XT0paxLaxiY6lLwj7kj58+55PjaGunZL
	KRGNU4nFfWj3XOHyjaD2unP0eoyaWnPP808lZ3C5xQjkO7FdEQymnRNLscD/vIviQ==
X-Google-Smtp-Source: AGHT+IGnu83UebF01ikbueB6H+BqrayrW3tr1aPcP1nMIYcEm8aOI82S07uAdTSrZ6i9cAF+koyUfw==
X-Received: by 2002:a05:6a00:2d2a:b0:71e:6c67:2ebf with SMTP id d2e1a72fcca58-7257fa67cf3mr1425111b3a.11.1733202725908;
        Mon, 02 Dec 2024 21:12:05 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72541848916sm9525047b3a.172.2024.12.02.21.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 21:12:05 -0800 (PST)
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
Cc: Aun-Ali Zaidi <admin@kodeit.net>,
	Paul Pawlowski <paul@mrarm.io>,
	Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v2 0/3] Device Tree for Apple T2 (T8012) SoC devices
Date: Tue,  3 Dec 2024 13:10:26 +0800
Message-ID: <20241203051147.110980-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds device trees for the Apple T2 Security Chip found on
some Intel Macs released after 2017. This SoC is based on Apple A10
(T8010) SoC and, for many hardware blocks, can share the A10 compatibles.

This series requires the PMGR power domains series for A7-A11[1] for
the "apple,t8010-pmgr-pwrstate" and "apple,t8010-pmgr" compaibles,
but otherwise can be applied cleanly.

Changes since v1:
- Use imperative mood in commit messages

Link to v1: https://lore.kernel.org/asahi/20241201161942.36027-1-towinchenmi@gmail.com/T

[1]: https://lore.kernel.org/asahi/20241201155820.29259-1-towinchenmi@gmail.com/T

Nick Chan
---

Nick Chan (3):
  dt-bindings: arm: apple: Add T2 devices
  arm64: dts: apple: Add T2 devices
  arm64: dts: apple: t8012: Add PMGR nodes

 .../devicetree/bindings/arm/apple.yaml        |  41 +
 arch/arm64/boot/dts/apple/Makefile            |  16 +
 arch/arm64/boot/dts/apple/t8012-j132.dts      |  14 +
 arch/arm64/boot/dts/apple/t8012-j137.dts      |  14 +
 arch/arm64/boot/dts/apple/t8012-j140a.dts     |  14 +
 arch/arm64/boot/dts/apple/t8012-j140k.dts     |  14 +
 arch/arm64/boot/dts/apple/t8012-j152f.dts     |  15 +
 arch/arm64/boot/dts/apple/t8012-j160.dts      |  14 +
 arch/arm64/boot/dts/apple/t8012-j174.dts      |  14 +
 arch/arm64/boot/dts/apple/t8012-j185.dts      |  14 +
 arch/arm64/boot/dts/apple/t8012-j185f.dts     |  14 +
 arch/arm64/boot/dts/apple/t8012-j213.dts      |  15 +
 arch/arm64/boot/dts/apple/t8012-j214k.dts     |  15 +
 arch/arm64/boot/dts/apple/t8012-j215.dts      |  15 +
 arch/arm64/boot/dts/apple/t8012-j223.dts      |  15 +
 arch/arm64/boot/dts/apple/t8012-j230k.dts     |  14 +
 arch/arm64/boot/dts/apple/t8012-j680.dts      |  15 +
 arch/arm64/boot/dts/apple/t8012-j780.dts      |  15 +
 arch/arm64/boot/dts/apple/t8012-jxxx.dtsi     |  44 +
 arch/arm64/boot/dts/apple/t8012-pmgr.dtsi     | 837 ++++++++++++++++++
 arch/arm64/boot/dts/apple/t8012-touchbar.dtsi |  20 +
 arch/arm64/boot/dts/apple/t8012.dtsi          | 198 +++++
 22 files changed, 1387 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j132.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j137.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j140a.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j140k.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j152f.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j160.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j174.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j185.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j185f.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j213.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j214k.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j215.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j223.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j230k.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j680.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j780.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-jxxx.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8012-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8012-touchbar.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8012.dtsi


base-commit: bcdb59aa6d1f196ec853235957aba5852d6697cc
-- 
2.47.1

