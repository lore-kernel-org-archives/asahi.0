Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8587A207646
	for <asahi@lists.linux.dev>; Mon,  3 Feb 2025 12:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738586916; cv=none; b=a4HLNfUp23XnceuI9AXoywgFJnP2B3vmpYWElHwGc28zbPAV1L2SDhBEzBmwDZfH9CA1x+UMrFsT4ahjGXuElSv/X49ni6j2WNnIyGr/IjBvKP8YHzqc4uih0Dsst3n64GXrP3yViDzkH8bNs4mWzudxtOJTcK4GUAV7NS0P+4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738586916; c=relaxed/simple;
	bh=iof820EKKKMpDSBwk/VGn90Y3m/jD1O5AzQTcc0iV8k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WRVnNJgnTro62YW8Akz4lV0FgcK+OobaCLbYEUJBli8fRhYCJJTVytpDk4Np6Mbe7K3aEC8vhYygYE+sSTx2U7/pKxbzX+NKYJfUJlwv93vEb9kE5kx0bGGiyLYTA7LqCg0VVMSSUv22D+ODaRdtmWS7BCLALlDveACW/vN+l+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e15gIHy9; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e15gIHy9"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21670dce0a7so88583005ad.1
        for <asahi@lists.linux.dev>; Mon, 03 Feb 2025 04:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738586914; x=1739191714; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=twHwwtRQqwdawa+fPo20Qdo3qbha0a8mea1KZO6bLrk=;
        b=e15gIHy9WSzaUAaxFbHGcqSyl76n+/8HSemYqj7wn4gsRljoMYmLdV2On3Cp5JCWfx
         h0hrV7TTyLZbUgBP64DHtXN7eHkmP2sIXr8PDXQj1dosWMDb+IvfOcJjgkvTLfTA6SvC
         LeMdmXM8TxbMrAZyVoZcJioKBjZr9tzTm0pVvnuANS/UyUPqhOUueA1qBIDm27+jnFA2
         9o3x/uNC9N/7umGV2C0dJ97LoL40qRkbysyaPvrnSEvnltRuKWQMSjJ2VsFMfkdaVb0o
         2qRbCRgjV3LzHfmAmAdAkqJ3pyyup1Ukm++8KONmT82LBWoDuSKBb+ihyulHq5BCq2wn
         4axA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738586914; x=1739191714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=twHwwtRQqwdawa+fPo20Qdo3qbha0a8mea1KZO6bLrk=;
        b=JxOHqFdYBE+Z2qsVbJ2pGncumS+ANvvh9B3JOMi/ltBnRUezHywmzqdVguy7YXrr3k
         w+3vtfwAnzOZEMm2DBDx+DSlQQmUIKsBC5KDheMLwc1wg2C+gdRACFakQWcFuMWqQMlU
         RmwgvUHgA+eOFQy3FJ7yg53qu4drRx67Gxgt8vAhKmjcszkkL6vc8qn38y6OoIDDKPA1
         /j2JS51rX4DqffRE6Y8RQjDNuX3BohM+TR+SKePA91HjjkzJg2d8hYPOC2KdbbDQmg7x
         PBiy5aPEAtPDN0CIid0dGkZVYPQxMLnmYE40+C4uxGMFbPSVEe1IuOqOsvMsIKSZ5GTG
         7lqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxJkJcE+VktCRLr3pobjqJbnxGdlUpVKINs2g3y3Z0/MUbgGO5o1HDuiaRAuHp1AMFgQMQYw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyNkCn1D/LRY7la7fkAN1A5NaNSyJ/TjfDVIRM2p58yHlIzo8Fa
	IfCCa4d1XbqF5gWzLU+vrXdlDryv1lBN8xTRpFlraq0BM/isuNbG
X-Gm-Gg: ASbGnctrPaKh9BqfIvM4XGt1jeWbeUxW25aqCoWpMI6XYGtWFikCAaf+07F3pP9STTZ
	OypoBIbW15/N5ur1xv40RzGo4s7gVllUnUw/IYH55uuWlPaSdavWoxDpVtfnjOowjGoGzln8Bqa
	xgYW2NhS8dzbHZgkNEtJ2gENca+TBik3scWvCzkpUKRpY/TZnWUcWJzh5DmeYWSwz1Ss1xsH53P
	DGJKbYa98IwQqBZdBaY1mZCFM35Aqn5fgzk4uDtNE6g/ei6cPS5urI2nPTgUN4g2eayPU2DSYHn
	/XwpXT4JOr08VJav
X-Google-Smtp-Source: AGHT+IFkG16Fy+xKUEcl7Zhyfj8sYFQhncAIzcxpAp+kKdyRiKIyPZxsk0Bgs26S0+b7QvEEARtYmQ==
X-Received: by 2002:a17:903:2a8b:b0:216:3c36:69a7 with SMTP id d9443c01a7336-21dd7de0fc4mr329572215ad.45.1738586913809;
        Mon, 03 Feb 2025 04:48:33 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-acebddbb0d4sm7835225a12.10.2025.02.03.04.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:48:33 -0800 (PST)
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
Subject: [PATCH RESEND 0/9] Add Apple A7-A11, T2 SoC cpufreq nodes
Date: Mon,  3 Feb 2025 20:43:39 +0800
Message-ID: <20250203124747.41541-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
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

- arm64: dts: apple: Split s8000/s8003 SoC DTS files
https://lore.kernel.org/asahi/20250203113949.14760-1-towinchenmi@gmail.com/T

- Device Tree for Apple T2 (T8012) SoC devices
https://lore.kernel.org/asahi/20250203114417.16453-1-towinchenmi@gmail.com/T

Note, this will have conflicts with Apple A7-A11, T2 PMGR nodes [1] due to
both of the series adding things to the same part of the .dts files, they are
unrelated, so keep both of additions.

1: https://lore.kernel.org/asahi/20250203121831.36053-1-towinchenmi@gmail.com/T

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


base-commit: a14d9039c2aea103eeedc5602ebab731ef3eb73e
-- 
2.48.1

