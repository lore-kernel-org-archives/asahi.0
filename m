Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E4835E1B7
	for <asahi@lists.linux.dev>; Tue, 14 Jul 2026 06:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784010555; cv=none; b=hOId224EGn5P5ZUT1/kYiirPf0M78qBYLprWh3thycUUxsOtSEb0rGmdGfddGxZsb7x4kIeetoziYaj+CPr8b2vVQ2Vp0d/RhOJ7Vba0RLsC5L5WpxLAIRb91FVE9OwxNo8s1CIwEd16lU/bz2MzLNeKb2jXFHE0/EPEj5rNZy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784010555; c=relaxed/simple;
	bh=cPhUEwaWC4vFg+vWUv3YAUV9bYjnh8Y5E9GoO7RBxkE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HxyVFxZbG7J0ViKR/QzyPwYBmvX43UD1rnzEUFUrQ0x+K1rH/FAwmGkcgV+E3+JvaIYrkUUbq9zQ2YSojx9uho32YLaah4JUuhvRsCY4rXZnHoQZiz0OVqhZQDzB18wed6pJvy8l6hm9M8bQU1vdduQ3mLE+BIgdzCKnIOyBZtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EzWWpDA4; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EzWWpDA4"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ce7d2adef4so7663665ad.3
        for <asahi@lists.linux.dev>; Mon, 13 Jul 2026 23:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784010553; x=1784615353; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ByqUUoCmAxr64mZfxOgoGrIy+E/ii+Kkqp5CiJVXt+U=;
        b=EzWWpDA4R+XHekOryDQhUq1/XKjsZvxbdMCsmpSunlXNul7Oeiy3xsK2aNBBD+kA9a
         Glfd7ybvabUS4Vw/WnpNyONqIRAiFmHI8+n9km/Ken3fUuWIuk6XbJLgEeD/AcVBzI08
         GRhmMAL+vBaZJ95ImiDn++PEKe9OBCVnnEFf1MJ924WNLwaCJJXEt7yHyBS65iOicpkJ
         dq9NUhdCXIfs2uw4wlMZ9X2vpr76FyvaypxFkLOkrMW4G4b/P8wnSu4vscPrgIprlgRY
         YoGd6Zg+9G0qZhABKLSa1BADFvBmdwhtUYuSIresbuyBCh1F1nRa9I2H2bJFORqDLS6h
         Naog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010553; x=1784615353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ByqUUoCmAxr64mZfxOgoGrIy+E/ii+Kkqp5CiJVXt+U=;
        b=rNZY2PVuQLsbVubSLHmsKrEK/vaUoM3SRYfGcRHO2ZjTrxroyImxGrYVg5u/krFwrm
         xnDLec38EQUz+WdOdonBY8s9etxS+bGhbngAG8QxKbyFr/TCh64Cwmv54vSYbVYRbGin
         GtgsRAeCYv3xYvb0Otr8CakR9Gz6B8JhnG9U2VchbpTvHAdCtJQYDOYZ+UAg+aDKrky/
         tQM+PfDIFTaEUnZfoZdPtv046avVBBcInpLy3z09CFveWnCXoOH1OebGaXeBTGs6rhN4
         GRr0DLNNymyFU5xyAwuPPoMsIe6VxbEnw5VVR61Kp3Vhy7l8QOTPIx8tc1ufI7fUP4f6
         Ry9g==
X-Gm-Message-State: AOJu0Yyq61icCGwyiGgqpoTeEVQ0fpLvhTEblRnlQcNoorkMAdJZlei5
	4mU211YNzTq9fJtQQGkLPIBQN4eruGNBXuUruloOVRJ5eFV/R2w2Q++5O3qnKg==
X-Gm-Gg: AfdE7cnSPFy4pYINvcWEagkvcqvZer63/XkSfIpZrg3/XU51GywdvyuTJy3IfAYkvEX
	OAOr2u+hBJS1qM8FwL71prv20oRtXZDj7Mo9dpLe8Ck/O04BQOK5IiXiAtZE33BN0WQZRs0WKrV
	jYnbujE9dxiFjLqFRyXlaJI12AUOI3hN/btH/C1vK2E7TqxbSeSDC+uaIVI/cv2guk77FTwXH8c
	hsYJ23yg9W5mMNliI2bwYBLJbiWt8lsje8s72zJPc5Xxm9zCB3EPVi63EoCOsK+HlrZlm2Lv9KA
	c+e8+urFSLSjWvOPooKzWb0+kshqBGcpmC7JPBOcdz8XDQxS6TySkVyZoo0bf41A0w6YTOjWMqV
	LneOje0yXNmWxEXC+o5K1IqghDKV6rrTvEztDr2OJr0asWt8Tfo3FCaTFcrNCivItV3XN4fm+DD
	DAOzgovI4j6j82OrMs+JpFZjtGKdRBLHJ8k2Uqmmzrd73wNFbrKpu7fmG/95rBcKlDLUBD5zUVD
	BS0BrnitdRdVEikzdE94BZ78KzhgLDZj+NenVjPf34qS+yO+UIeeNmyKIe32LN6
X-Received: by 2002:a17:902:ef0a:b0:2ca:9ab:e725 with SMTP id d9443c01a7336-2ce9e59d62cmr125013935ad.1.1784010552958;
        Mon, 13 Jul 2026 23:29:12 -0700 (PDT)
Received: from [10.160.5.76] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc99cc5aasm110915985ad.0.2026.07.13.23.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 23:29:12 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 14 Jul 2026 16:28:19 +1000
Subject: [PATCH v2 12/12] arm64: dts: apple: t60xx: jxxx: Add
 device-specific SMC hwmon sensors
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-smc-subdev-dt-v2-12-13fa78873121@gmail.com>
References: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
In-Reply-To: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2868;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=cPhUEwaWC4vFg+vWUv3YAUV9bYjnh8Y5E9GoO7RBxkE=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmh1xnnR1SwsOTv9eNQ3bE66PE5DjtG/yOLj7VfcsmLO
 cbxv3xHx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKrldjH80yzWPOwV2XW/ap3i9sV/e+798Dn1aptA26qa2r/cEh7ZXAz/jINkVvd
 eP3tJW8Us3FL5ktTfJ9lz/lhN9pKTXen746g6GwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the device-specific hwmon sensors for select T60xx-based devices

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t6001-j375c.dts      | 2 ++
 arch/arm64/boot/dts/apple/t6002-j375d.dts      | 2 ++
 arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi | 2 ++
 arch/arm64/boot/dts/apple/t6020-j474s.dts      | 2 ++
 arch/arm64/boot/dts/apple/t6021-j475c.dts      | 2 ++
 arch/arm64/boot/dts/apple/t6022-j475d.dts      | 2 ++
 6 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6001-j375c.dts b/arch/arm64/boot/dts/apple/t6001-j375c.dts
index 2e7c23714d4d..08276114c1d8 100644
--- a/arch/arm64/boot/dts/apple/t6001-j375c.dts
+++ b/arch/arm64/boot/dts/apple/t6001-j375c.dts
@@ -24,3 +24,5 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,okinawa";
 };
+
+#include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6002-j375d.dts b/arch/arm64/boot/dts/apple/t6002-j375d.dts
index a2a24d028cbb..e6eb6b6c386d 100644
--- a/arch/arm64/boot/dts/apple/t6002-j375d.dts
+++ b/arch/arm64/boot/dts/apple/t6002-j375d.dts
@@ -184,6 +184,8 @@ atcphy5_usb3: endpoint {
 	};
 };
 
+#include "hwmon-fan-dual.dtsi"
+
 /* delete unused USB nodes on die 1 */
 
 /delete-node/ &dwc3_2_dart_0_die1;
diff --git a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
index fee84f809a9c..caded1636f3d 100644
--- a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
@@ -367,3 +367,5 @@ &atcphy3 {
 };
 
 #include "spi1-nvram.dtsi"
+#include "hwmon-laptop.dtsi"
+#include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6020-j474s.dts b/arch/arm64/boot/dts/apple/t6020-j474s.dts
index 7c7ad5b8ad18..e3c2635d84fa 100644
--- a/arch/arm64/boot/dts/apple/t6020-j474s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j474s.dts
@@ -45,3 +45,5 @@ &pcie0 {
 			<0x200 &pcie0_dart_2 1 1>,
 			<0x300 &pcie0_dart_3 1 1>;
 };
+
+#include "hwmon-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6021-j475c.dts b/arch/arm64/boot/dts/apple/t6021-j475c.dts
index 533e35774874..9fe17f1f7f59 100644
--- a/arch/arm64/boot/dts/apple/t6021-j475c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j475c.dts
@@ -35,3 +35,5 @@ &port01 {
 &pcie0_dart_1 {
 	status = "okay";
 };
+
+#include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6022-j475d.dts b/arch/arm64/boot/dts/apple/t6022-j475d.dts
index 31f24bbda968..32938a3bf96a 100644
--- a/arch/arm64/boot/dts/apple/t6022-j475d.dts
+++ b/arch/arm64/boot/dts/apple/t6022-j475d.dts
@@ -44,6 +44,8 @@ &typec5 {
 	label = "USB-C Front Left";
 };
 
+#include "hwmon-fan-dual.dtsi"
+
 /* delete unused USB nodes on die 1 */
 /delete-node/ &dwc3_2_dart_0_die1;
 /delete-node/ &dwc3_2_dart_1_die1;

-- 
2.55.0

