Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF973200B99
	for <asahi@lists.linux.dev>; Mon,  3 Feb 2025 11:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583112; cv=none; b=ENKfPrIZrjBzyFGvN4L7M1XEJtciWimm7CDPCoD/Gblw5RgQBzp6N4/NJeLwE4G1cbKc8AhG998Kub9r/4WNCZV4L+0JvLtiBiMGbtoSz1rkiO/D9Z61HhlZ5ZFmIz0XQHF8g0hghFR/8qT7VzeTf/8RUDvMtVon8J9CBhEu5jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583112; c=relaxed/simple;
	bh=XP8IRyDmZh10co9TViUNR08fqaeIzLLfB8HFj8AcU94=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t4eYGZq1c24LTnxAyAYkq+yXtO/ChbfZvYRLIdNqvLesfKbYrT7wmxchi/2gRUy98JFpL3yyFniQQDWKYLbXKqic8rO1hP1AQ7QEVCxYX15VixmOvPXClVCxVFJ4LO3AlN1+tV/9eXp0SkcTbCLW3XSZSRpqtnZRFh/6X3lgN+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IrRzsLVA; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IrRzsLVA"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ee989553c1so7012597a91.3
        for <asahi@lists.linux.dev>; Mon, 03 Feb 2025 03:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738583110; x=1739187910; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RA0XtAJL96WJLxRbWatCDndiWUNj7K4Qgw/hFBCvBuI=;
        b=IrRzsLVATXUtSl/P+LGC2rRM6Rr4UFMjQyEI0S2nIcBiTyhbNoBL5mQTNyquy9py3U
         /yRjQA//2QesHO+MfU+2P1oSTV2dWuMSVX9F1YG5EFjgXBwoBXE/FBlQXKox7cszzjvo
         FmcgmV3I3Flb2Wy9bjBZ5crkighuTzWXBrqli+tEeLVXUlkP2M0G8ygBLYbotsP+W1UG
         fNFVKgF4uIS6m2hT/ubriB76HnHcAjlPG8OzLkbWx/EDNefIkhfCvLoIhKrWlzjR/Q7q
         WA5cDOTp6eJUVRU7yHp+3NJxGVMWzOMEkRt3HLqU7CN4Ak31qxSrHiYfQRbp5dD9GE8y
         mCfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583110; x=1739187910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RA0XtAJL96WJLxRbWatCDndiWUNj7K4Qgw/hFBCvBuI=;
        b=pwGv7aFpSroXXouX3JWwueCkOKma4KI7yrv8E4djdREaQE0v+SSLutfoTY8Ss87iC0
         tjAg7t9ILb+cWphozcJVlDJZVbel1TxNw2/DQ+iQOmk05DG4jdGXDoix2S4NkRSPzBY1
         nfUwsOVpFRjTg6lZXbdQCpb2YJ8N73sx6hZAsD2MfMINbhNoazpGDgLJdRgpjStBb2Dn
         ayDwfuY0gVw4g9tjfISiV8QVR3nO3kcK6iTxnr1EeRRyZTnoURE+2pJyUkOIsm7mo8OZ
         +WqGMxuqMYwvLiy7zmMRy6DncKBcKNIvzFrdEZwB+rR1UcEdouzFktP08z+mDYTlnpri
         2kQg==
X-Forwarded-Encrypted: i=1; AJvYcCU+xkkcv6b8Fu1T9SgtnzlmATmL6egbIE+lJO4BX1EypyXqDLMVkCeGgtpAyadnnwcRj+HDAw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3Xw8L3QAdwArX8bj+sV5q2jD7IqNvw1QFWEuLGAQeko2aMffB
	LuRWx9AfspQftiBNWidg7vPTo1wfKcwcOuFPf6MdF6nuxJOIr2vO
X-Gm-Gg: ASbGnctv1hW5RQPxvg4sXTBsNW+n3yG4coL1+5wwYo96V8EFrylrEDfg8fVGXjpz6Wn
	tJSPKyHn9l3vYzIHQu6AjxLO0FBDeFKEg57h2lrDcvWN1Co7e7aOjwKC2mYFVA5MNjH0dI7qY61
	dUkBpPu2H7Q7VLxRfmiDgkIrZ5oT9WYHG8xHyWTSxrq4oT0/gmrgJolhCTaF6fvTtqWrJMpLdMy
	b53iYZgJcNQfmsnmQ7as9bZpMTNX+xjcDN8wknmTFTc0ZRW2ucq4BIXta9hQaetqItUmYwP7C5P
	i0QjgLW5fCACkI/1
X-Google-Smtp-Source: AGHT+IHHjGHPnhtBshFZlL0STf36xDX/jcGjHEfsZF68knOtHxu3Ihb1HeH8FtH6IcuizJVxYRGNvg==
X-Received: by 2002:a17:90b:2711:b0:2f7:d5f8:f393 with SMTP id 98e67ed59e1d1-2f83aca3021mr31267475a91.35.1738583110013;
        Mon, 03 Feb 2025 03:45:10 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2f848976d1fsm9712490a91.3.2025.02.03.03.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:45:09 -0800 (PST)
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
Cc: Nick Chan <towinchenmi@gmail.com>,
	Aun-Ali Zaidi <admin@kodeit.net>
Subject: [PATCH v3 RESEND 0/2] Device Tree for Apple T2 (T8012) SoC devices
Date: Mon,  3 Feb 2025 19:42:51 +0800
Message-ID: <20250203114417.16453-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
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

Changes since v2:
- Drop PMGR nodes, moved to PMGR nodes for A7-A11, T2 SoC series.

Link to v2: https://lore.kernel.org/asahi/20241203051147.110980-1-towinchenmi@gmail.com/T

Changes since v1:
- Use imperative mood in commit messages

Link to v1: https://lore.kernel.org/asahi/20241201161942.36027-1-towinchenmi@gmail.com/T

[1]: https://lore.kernel.org/asahi/20241203050640.109378-1-towinchenmi@gmail.com/T

Nick Chan

Cc: Aun-Ali Zaidi <admin@kodeit.net>

---
Nick Chan (2):
  dt-bindings: arm: apple: Add T2 devices
  arm64: dts: apple: Add T2 devices

 .../devicetree/bindings/arm/apple.yaml        |  41 ++++
 arch/arm64/boot/dts/apple/Makefile            |  16 ++
 arch/arm64/boot/dts/apple/t8012-j132.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8012-j137.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8012-j140a.dts     |  14 ++
 arch/arm64/boot/dts/apple/t8012-j140k.dts     |  14 ++
 arch/arm64/boot/dts/apple/t8012-j152f.dts     |  15 ++
 arch/arm64/boot/dts/apple/t8012-j160.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8012-j174.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8012-j185.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8012-j185f.dts     |  14 ++
 arch/arm64/boot/dts/apple/t8012-j213.dts      |  15 ++
 arch/arm64/boot/dts/apple/t8012-j214k.dts     |  15 ++
 arch/arm64/boot/dts/apple/t8012-j215.dts      |  15 ++
 arch/arm64/boot/dts/apple/t8012-j223.dts      |  15 ++
 arch/arm64/boot/dts/apple/t8012-j230k.dts     |  14 ++
 arch/arm64/boot/dts/apple/t8012-j680.dts      |  15 ++
 arch/arm64/boot/dts/apple/t8012-j780.dts      |  15 ++
 arch/arm64/boot/dts/apple/t8012-jxxx.dtsi     |  44 +++++
 arch/arm64/boot/dts/apple/t8012-touchbar.dtsi |  19 ++
 arch/arm64/boot/dts/apple/t8012.dtsi          | 176 ++++++++++++++++++
 21 files changed, 527 insertions(+)
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
 create mode 100644 arch/arm64/boot/dts/apple/t8012-touchbar.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8012.dtsi


base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.48.1

