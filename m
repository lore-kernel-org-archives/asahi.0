Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543172B2CF
	for <asahi@lists.linux.dev>; Sun, 22 Dec 2024 17:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734888790; cv=none; b=uCpfAnLZ6Y/o/SMM/ILVPYLtzdrtqpiRmFVKqkGzXM8Zkk944bKIVQQ3h5JCrR/WzDcVDF9GOfAXpKf2FIeupZMvHW84COV3ISfmhBesX1qlKWEghA0LG+RwXA+HKZvVIhGI0CmFaZwjRFKxgqRZLEHMMJEEm3j5pbq1zUsfh1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734888790; c=relaxed/simple;
	bh=HB+VBj3tJ5Uo1Xk4nGHh6TnsKpRhnzX1WYQDYwTd+V8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lfpUX7ZfTEZYXBsFGVlHIxjEWDPJ85eQogiMElvtGtkn6wuIdm7G9k+MBjnhCDmhWj4svMb7kYnMSUn1U54N6oUPggM6jP90+w4LBlWe/qMikr45SyPypshkF6ouu2KoAqJdqlMNYcuKrJ0wFv3NtQo80+CFBS3CcE70b7nubBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDGHzu9e; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDGHzu9e"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7fd526d4d9eso2645274a12.2
        for <asahi@lists.linux.dev>; Sun, 22 Dec 2024 09:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734888789; x=1735493589; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gPPjd3s39nBr3krlLS6DkSRw+C8geW511O7IiYKzB+A=;
        b=SDGHzu9erG883kFy0DF2O9/okmB2PhQqDojmmBe8Jb8fgYTbiZ2fxTtNSftHhOv/Bg
         r2Zbm2cItwicUly0jvbvdatDVEd5Fm1p6nP2+miv2UgM4zS8HTg+EoiyS7HH8gymlKGb
         eBzSrUVwJUSfAV4UArI1XtWIlN/xDBzfokrfQtm0AirNs+CY1ploDhRH10AqqBx69ONP
         RPvqGQCGmzkBn038n7ViRkaCf3SKv2o3nO3jQbjAsjCrfuPjIguEnU44rexWr/cNO736
         iNUYvo1iAwwpKeWbAp3Luq2xH2G+eDp22NEVVSgIreXrKJ9m5eb4Yz7onwxGeoyS/pS4
         EAIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734888789; x=1735493589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gPPjd3s39nBr3krlLS6DkSRw+C8geW511O7IiYKzB+A=;
        b=iEIAu6tpCza89XjqAVcpiOnXpARJ/XJOLupRGCaAiG7p9vhvndPeaRimV3L/QRkGcG
         DPPPDtsx9QEBDef0gwPbH5+DfUww1nrQfpeCy5fQKXyJmEWno/x6FoQ+Rq0zQ9UcDLDR
         hUVXCgjKNpxTHzzYUQm30MSTp8+cTMq2PzHmtCZvrndaZWIMuhnG8Y78IYgrxa2q2B+j
         GIhWn9UPSzO2Y8YcHt1SvD9YNqf/Q6wQcwSjUuSjn09SRlqsLqSKEp/jc8VF7CfPs7xm
         ZNjU/deotmKmE4rzAeyIXGRBUmm42GG7rxL2Q4uMrPo3kfCbL1BsjsUFyh42CNwzm4rG
         IMIA==
X-Forwarded-Encrypted: i=1; AJvYcCX08OB2wULZaa2QgHDVFwe9fsmgYicHYm7Nz1N9COD1Y2s/k6QCMCZjnCBfYWv1FEWvaqjTJA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwF3b/neSG1Jjjcwqe6lTIgWkhvIBSTsQ+Xdhyxen/v6pvUL/5u
	gQ1l8IrCAijdQrYca2aBlZRlAD7l3Lxk6O7pQ/NidZNpUneHAD7C
X-Gm-Gg: ASbGncvTbl7H2ifpDbPu4Vux/cTu6x0KHd0ab1dZuxoIgz8aF8ReP6LBVbkEPwm+tfE
	I+XFsX69YSf4GLV/i2ykhHseTnaJSF8ZJGXsNlbRQ4h+DK1OxULuLwpnenWpbgTtG/se7oogJ/a
	prUCvteTnV10ZYXqNiAtyhH4saK8ch6vjvuV6x9vd7xEcNxTEpeRrBEU50ENwQeTMhV35uLJ6HS
	bNwdPxtRgz9J+AmE+M92um7UpvIsaOR3kg8/no/PdD66rk/ON1UYcItyA==
X-Google-Smtp-Source: AGHT+IFZKtlmUdh5emhOPXWQQU+C9eJT7EuMyhwCWbhtjsp/XYx8q3zWVUTywWzBdiJQT20JGLxHTA==
X-Received: by 2002:a17:90b:2e4a:b0:2ee:fa0c:cebc with SMTP id 98e67ed59e1d1-2f452e38d0emr15732309a91.20.1734888788739;
        Sun, 22 Dec 2024 09:33:08 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2f4477987f4sm7567552a91.2.2024.12.22.09.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:33:07 -0800 (PST)
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
Subject: [PATCH v3 0/2] Device Tree for Apple T2 (T8012) SoC devices
Date: Mon, 23 Dec 2024 01:31:46 +0800
Message-ID: <20241222173240.147675-1-towinchenmi@gmail.com>
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

Changes since v2:
- Drop PMGR nodes, moved to PMGR nodes for A7-A11, T2 SoC series.

Link to v2: https://lore.kernel.org/asahi/20241203051147.110980-1-towinchenmi@gmail.com/T

Changes since v1:
- Use imperative mood in commit messages

Link to v1: https://lore.kernel.org/asahi/20241201161942.36027-1-towinchenmi@gmail.com/T

[1]: https://lore.kernel.org/asahi/20241203050640.109378-1-towinchenmi@gmail.com/T

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


base-commit: 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
-- 
2.47.1

