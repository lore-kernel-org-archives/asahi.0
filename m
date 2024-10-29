Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A113D179A3
	for <asahi@lists.linux.dev>; Tue, 29 Oct 2024 01:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730163979; cv=none; b=J2lwvUjzVX+MlNLl0U3v945/riLLMcTpSRZNeUh98RSgwD7ww8eUDyInHXS01LxtcPhm0nS8A9sjwhwHnT0cNq/84ci/6F8nbB0MEKPjkE26VLuSnO0JEvlOVjYYuajUMYlvuoYoiTHlqq7KqDIufMFB3VVzDCkKiQp1kyaod8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730163979; c=relaxed/simple;
	bh=va9+w+Y+AxYHcFoDkr3/FAmROlEOkdPrgxr1Tr7QqsA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k8vcSByudfAkPaoPuWJQc85ZOr4bDuINz94eB2n1IZA1jZRAhp5+IzrQmP4AQ13vqkmjgYaMxuI8ReRGC/E4YHNRk+kvaus+YJVHKTEuXLN2SDzOeLBV2ab+ZZtOq3zZqc1CuDRKqoIjDBuXsSrrAG/QY9iJNagT3qr7yevtk+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pa8oomd5; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pa8oomd5"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20cceb8d8b4so28105935ad.1
        for <asahi@lists.linux.dev>; Mon, 28 Oct 2024 18:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730163977; x=1730768777; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6QZuqlncHnASFQSfQcw4aMTWgJLEaZN0b1kh9Wmj6pk=;
        b=Pa8oomd5zhbTx3rp68yPaH6RfjL8JKofDo98oiUUQkEfUCf6GTHA/S0azlSP71U8Rp
         Vxv7iprnfihbckrBSG0gQyS0LRi0ZVOVOUQ3Y8pM6J4278iqnW+mTEuzEE6GAw/T3nWX
         lT3tEaTarutXBjzDlJARmvdLkfHric6U6x8P0BRRmJNliP+WkQGZnNxiAcQW1GFqt+Lb
         872irMTGA8Xi6aXVBSqAh4uuI4do9HlairOuxYAsT1bhtw5mo5imXAiueFb3t5Nob1mc
         oTPYtZJSkWYbXL3ZeYUVGqs9/LFN2IcozMHkKR3627BdKiX+UR7iMlpVCwpT8Oe/23t3
         AL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730163977; x=1730768777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6QZuqlncHnASFQSfQcw4aMTWgJLEaZN0b1kh9Wmj6pk=;
        b=pI+UorN0Ee0jnqY0eianG7KZsSRkIFdj9q2jRRsDbl81G64AKjIUrBF5XZp56dZo84
         5gUP+O/db+N4kxpDToWxgJ1Li7sKmOm7JBadTz0eLFPDtt7LOLizys0+IGqZKQO7UNtA
         ZpZvAvDRjTV+sAIUMixyqHz+Tc1kwL0HC0oujbnJnFW1ktlUw/LnTG+0Fzmga6fSFH7M
         ocb2d6smOO6lM/y0G9qVZTZaHNsBGrXHZxql4SbIDDCpLuZ1BLisoNRVG1yUiZpAHMjE
         STuUelGUdot6yp9X0IbNxdQkMfRcCEVY4q/z3CvF8AOJ07UJB2MOXSBMLLbn6lhkXxeS
         N7rg==
X-Forwarded-Encrypted: i=1; AJvYcCWnxLt6P5vPAQ1pagITOHvSHjYT+wVkNP29y1kcDssMafNGN6cRLOos76vWEluV1qcA3HJC/A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwLlrWotsDwHS/ChdhIqy2l227hPZu+c++F3NdYJCrUcL027Gja
	lm8yt/SZsbnY21oKzj6QQI2n7QW83PX6KnyC6h5PBTQgl6pELS0M
X-Google-Smtp-Source: AGHT+IHXmpqlNME9SpK/s72If+aWe6wFxCuZu7NIgnm7bl3z3OsIfdfVuVaBDQuhav9xcbuN7m8D2Q==
X-Received: by 2002:a17:902:e811:b0:205:7007:84fa with SMTP id d9443c01a7336-210ed46b161mr5094555ad.28.1730163976746;
        Mon, 28 Oct 2024 18:06:16 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-210bc02efb1sm56306225ad.221.2024.10.28.18.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 18:06:16 -0700 (PDT)
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
Subject: [PATCH asahi-soc/dt 00/10] Add PMGR nodes for Apple A7-A11 SoCs
Date: Tue, 29 Oct 2024 09:03:58 +0800
Message-ID: <20241029010526.42052-1-towinchenmi@gmail.com>
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
 .../arm64/boot/dts/apple/s5l8960x-common.dtsi |   1 +
 arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi |   4 +
 arch/arm64/boot/dts/apple/s5l8960x-pmgr.dtsi  | 610 ++++++++++++
 arch/arm64/boot/dts/apple/s5l8960x.dtsi       |  13 +
 .../arm64/boot/dts/apple/s800-0-3-common.dtsi |   1 +
 arch/arm64/boot/dts/apple/s8000-pmgr.dtsi     | 757 ++++++++++++++
 arch/arm64/boot/dts/apple/s8000.dtsi          |  22 +
 arch/arm64/boot/dts/apple/s8001-common.dtsi   |   1 +
 .../arm64/boot/dts/apple/s8001-j98a-j99a.dtsi |  26 +
 arch/arm64/boot/dts/apple/s8001-j98a.dts      |   1 +
 arch/arm64/boot/dts/apple/s8001-j99a.dts      |   1 +
 arch/arm64/boot/dts/apple/s8001-pmgr.dtsi     | 823 ++++++++++++++++
 arch/arm64/boot/dts/apple/s8001.dtsi          |  22 +
 arch/arm64/boot/dts/apple/s800x-6s.dtsi       |   4 +
 arch/arm64/boot/dts/apple/s800x-ipad5.dtsi    |   4 +
 arch/arm64/boot/dts/apple/s800x-se.dtsi       |   4 +
 arch/arm64/boot/dts/apple/t7000-6.dtsi        |   4 +
 arch/arm64/boot/dts/apple/t7000-handheld.dtsi |   4 +
 arch/arm64/boot/dts/apple/t7000-j42d.dts      |   1 +
 arch/arm64/boot/dts/apple/t7000-mini4.dtsi    |   4 +
 arch/arm64/boot/dts/apple/t7000-n102.dts      |   4 +
 arch/arm64/boot/dts/apple/t7000-pmgr.dtsi     | 641 ++++++++++++
 arch/arm64/boot/dts/apple/t7000.dtsi          |  14 +
 arch/arm64/boot/dts/apple/t7001-air2.dtsi     |   1 +
 arch/arm64/boot/dts/apple/t7001-pmgr.dtsi     | 650 ++++++++++++
 arch/arm64/boot/dts/apple/t7001.dtsi          |  13 +
 arch/arm64/boot/dts/apple/t8010-7.dtsi        |   4 +
 arch/arm64/boot/dts/apple/t8010-common.dtsi   |   1 +
 arch/arm64/boot/dts/apple/t8010-ipad6.dtsi    |   4 +
 arch/arm64/boot/dts/apple/t8010-n112.dts      |   4 +
 arch/arm64/boot/dts/apple/t8010-pmgr.dtsi     | 772 +++++++++++++++
 arch/arm64/boot/dts/apple/t8010.dtsi          |  22 +
 arch/arm64/boot/dts/apple/t8011-common.dtsi   |   1 +
 arch/arm64/boot/dts/apple/t8011-pmgr.dtsi     | 807 +++++++++++++++
 arch/arm64/boot/dts/apple/t8011-pro2.dtsi     |   8 +
 arch/arm64/boot/dts/apple/t8011.dtsi          |  22 +
 arch/arm64/boot/dts/apple/t8015-common.dtsi   |   1 +
 arch/arm64/boot/dts/apple/t8015-pmgr.dtsi     | 931 ++++++++++++++++++
 arch/arm64/boot/dts/apple/t8015.dtsi          |  21 +
 43 files changed, 6246 insertions(+)
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

