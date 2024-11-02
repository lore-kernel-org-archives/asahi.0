Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE68D18E2A
	for <asahi@lists.linux.dev>; Sat,  2 Nov 2024 01:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730509838; cv=none; b=FRl8zY1ua8KtaMWbS1aVf7eeT4Ix3q/95ILrNUSUptZpexU+ChJpdIMijY1UfmO/KJCizn5JUNm4eQxmRyr24/biyr+JNaT2rZoaH2xyfkR6zNn5dyZTjPoFBpc7BjLokrJG4DINzhkv9i/tlgL1GXimQ3+yPkf9o5r5/3GGHW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730509838; c=relaxed/simple;
	bh=nOZEpYLWODo6wCvNazjMs6r9inyyUKqd57/QStZot3g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mwBodmHfRIVhHNC2/UTD/+GE3Fi/lPQckDD+/1v2EPVCWe/KB6beAbBLkr+aZ+NNyePEqCal4ayXPqyY6bfsUCJFIw/GZO7fGmqMnTv/XPZLdsNW8VS0nhVfgi+DGn/gfvBJ2nrKS9KOArgGhYo9XDMLGAIc+NyvQp6IwHgqu2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=haXibpjt; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="haXibpjt"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7205b6f51f3so2206148b3a.1
        for <asahi@lists.linux.dev>; Fri, 01 Nov 2024 18:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730509836; x=1731114636; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lMoIS/YJD9sh9c73w4cs+pas2HnFmm3Lw2P98QNL9Pk=;
        b=haXibpjtCW14EGguih3FZsvICKYFTpmvIfds/QWSdSX+hOcmOJLuBQATAwZ9wtYn3O
         18SoxZ8stbgOyPVfn1g1tIY44Aqf87b4H+5pz6XJbHA+1TiE81KPXAWbbbtlSfVIGgU7
         EUxtCUgWHrmwBVxeeHNzj1uJHlSO/Y6TPkrcSBCwjLcnKiwepkE2tE8iY/jHCMldnbzU
         Dosxq5rHTEDhwQOKubxLoJgmQvUwbU4vQDHQVQsjnsVF5n2nZibiGg4mqN3JOeteYQ4+
         MZVt7CgorZn994+eo64tDVKh37L4xfXAqRFAlVTQ4IHJbwz7Z1iEOVxYfh9qftOn9Mgd
         UPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730509836; x=1731114636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lMoIS/YJD9sh9c73w4cs+pas2HnFmm3Lw2P98QNL9Pk=;
        b=hFlqWZ6IpmLH/4mAZlynbdV3tGQzFYB+g/jHa8dm5jTLHer8AnOzOv5SldfMNfd1nO
         kvn6bliTwYJQvCPQlSmwOgk6KLS+TWzEy8tZs5RX5d09lvxBLgwoegoajoN/49lWsQD8
         8pzDT4rm6guYtiEDkX+FfSnzmWpYYYxszx1WxSzdhbYK9BfCUgeuCKYzRCe0mhbYI9gU
         v5T5ST05Yy98yhvscVKWhkm796lqW9s006/zScr6GcmULkV9RDW6+3hDAcyaNUJcH/PB
         RUF7w2bIEodgvNwB3zpea5trKC3wrGCcYsXRNPJvxbhJDeSzcWaXUR1r6juurmVQUIMN
         wrRg==
X-Forwarded-Encrypted: i=1; AJvYcCUCGBE7AY1a3ltid2u6ToIF7+qEdIY0+mau6LBBSgaREqfcAIlgzaY8wwI9MTN3+gbms979kg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4FmzhwLHjWlY8K+gZ+3mbPSq511RF6FOAmpQKIFxGewi86e/Z
	leHyQDSfinThfi0CfseKDEOb12J9z/0R4bprMVq+MrMUs8fQ65QU
X-Google-Smtp-Source: AGHT+IEpMR9EC8+eszT/o70QjUzgjmv2oXMMW1IPjKItDvh9v599rjOcDiZyLNgjd+IOFJOO/cBK0A==
X-Received: by 2002:a05:6a00:1490:b0:71d:eb7d:20ed with SMTP id d2e1a72fcca58-720c98adb50mr8357982b3a.12.1730509835843;
        Fri, 01 Nov 2024 18:10:35 -0700 (PDT)
Received: from localhost.localdomain ([49.130.42.137])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-720bc2c38adsm3287708b3a.133.2024.11.01.18.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 18:10:35 -0700 (PDT)
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
Subject: [PATCH v2 00/10] Add PMGR nodes for Apple A7-A11 SoCs
Date: Sat,  2 Nov 2024 09:08:22 +0800
Message-ID: <20241102011004.59339-1-towinchenmi@gmail.com>
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

Changes since v1:
- Removed "framebuffer0" dt aliases. It is not standard and not needed.

Link to v1: https://lore.kernel.org/asahi/20241029010526.42052-1-towinchenmi@gmail.com
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
 arch/arm64/boot/dts/apple/s8001-pmgr.dtsi     | 823 ++++++++++++++++
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
 arch/arm64/boot/dts/apple/t8011-pmgr.dtsi     | 807 +++++++++++++++
 arch/arm64/boot/dts/apple/t8011-pro2.dtsi     |   8 +
 arch/arm64/boot/dts/apple/t8011.dtsi          |  22 +
 arch/arm64/boot/dts/apple/t8015-common.dtsi   |   1 +
 arch/arm64/boot/dts/apple/t8015-pmgr.dtsi     | 931 ++++++++++++++++++
 arch/arm64/boot/dts/apple/t8015.dtsi          |  21 +
 39 files changed, 6239 insertions(+)
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

