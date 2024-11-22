Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E041DE889
	for <asahi@lists.linux.dev>; Fri, 22 Nov 2024 09:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732269294; cv=none; b=JfzahjlNQDcif63tL414scAXsqsNGQ88DizTbsLGBABt9WjMQ1GB/aFLxOa9fJEFzb3c3aX5+CDwhBSQ6LNw4snPXpnuF7SS1d37FS53p9G/pemYE0xxGuw9OmtMuDnAzz8m6ZDhg2RQLwuRFa7KGn7UN8mZ12BBIWW7c/7Oxlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732269294; c=relaxed/simple;
	bh=Wqum4+2DlKwXPJfGBhEHgIowTNVYGsF7gXpmJi2mZCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pXXp9qXt0VOVvUMJThtX7sShSAJIf+K1qmD2LKh+o+GBnnK2m9UTTgkBKpvFBOcuah26Za7K2dPzW36HPTptuMglyykrjqzAn9KckGQqxDoYFYv4i+WZdb7KPrLWbr4g+aiku/k8qzEbUekPpt5Phr/OZEaITkT3qPYY9nhA23k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bzdufnNQ; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bzdufnNQ"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7180cc146d8so1005185a34.0
        for <asahi@lists.linux.dev>; Fri, 22 Nov 2024 01:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732269291; x=1732874091; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZj8MLvtC5u5/G8dsckvO4061YfoeeWz6Ah03C4dE/Y=;
        b=bzdufnNQyPjuIt99kFRHcRTKogF8gOtM5ngyqnnK1BcF5u/4dPYmOqVpmtgzLb5ZDM
         5wsiQ3ef10hjQEBlVaNLHtyHHKwaNxxS6Gqhfrb82Mj0FoE1Gt51rO1aerhNX/aRsH55
         T9H9Mr2aCkumb7yPbR02wm1dmd7cTqnfGozgxZbnSySnS1qWt2XctkfS9H7gn2CiRx/w
         9hcs2VoOX02JF/pwUN6skb295tbwoGNrpz6YHhBjBFJhbP/dbtMV8ZvAd1TzeduWrCMq
         LBpg/0Lh1jLZhnHKaX4NLBpSf2hYiUCC9YMhLna5WJuwxgxEFhT8SPwbr/FrSi1PWEX6
         56Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732269291; x=1732874091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dZj8MLvtC5u5/G8dsckvO4061YfoeeWz6Ah03C4dE/Y=;
        b=N1/ikjkpx3pJyisJ6sB7x3u8qs8seGDWXZdkge5zq7IVkou3kssQNv6xdN/KnUfmH8
         K44SrqttSN+3+NFNM9iBeghFwFF1v/mB+xu8YS7sw3+JgqZ6H1EW1GS6G7A+kwDA1svl
         z1QAl3ScT2q0MmbESh3wWPbAHMrPEp/OG1XN+xsZ4Z8YwFqtwQqNs+O4OxDaXUsMtDbp
         yWN/iRvz72EL0BnfMwyL+NP8JCMZV4JoHEHd05lMCgvry57y9IA+8fIFvhBFOZITg4z3
         1+JIuerXPOJ+3g8D6plRMRnEV+SJXhciCsMMRTT7+kcWhUuuXaZhrAgmIjnuSC2bw9Iy
         Olrw==
X-Forwarded-Encrypted: i=1; AJvYcCWFSPMD3TojZt3UnKUEy81BY/KfGBeHb/CpY8VJtmbglB3+AU8I5SfQWjBUbcF1Yw2u6o0glQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzQgzDyF4CkfDtFPXbMJh1mKk1GtPmg1Zrvl6OmXp8Dt4xwDaNO
	jVc3ZS2lcjkl/Jgc+HV/zYo6GbjlcD14ko8ot2R2gBLAiKL8EW1J
X-Gm-Gg: ASbGnctynF1LYr4J1UST8beSw/90XFencWTgma0RYZA4laxkZYL8YTzHjK5HSBXKTt+
	7AVth592G1oiXXDAZkVjIu+L7rFHwyRlR5JB4LSjDdfCc97wTex52SXfHXqGhnw2OVg0vwC76lz
	Ku3A3T+qWYXYDSCJi27EpuSYuW2u8PYM6/VkRFGCNKP6AyPgjbgH1Z0zVbZYDATRa2qZj7cCjJU
	sTop6u897lz702n4+kKADeB1K9+afDkj63KxhjecYed+aiKyOmlZcPSvwfV0YUaoW0=
X-Google-Smtp-Source: AGHT+IG3hD3q5LZu0dQvO6MYBBaE4l5bWQ+TAv0Mm/WrpYD7A7y8o6WfJF/9NAbaY9owNSrzD7ujWQ==
X-Received: by 2002:a05:6830:4908:b0:718:83f7:9df4 with SMTP id 46e09a7af769-71c04ce52b8mr2529770a34.23.1732269291392;
        Fri, 22 Nov 2024 01:54:51 -0800 (PST)
Received: from localhost.localdomain ([182.152.110.125])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7fbcc218a87sm1236332a12.39.2024.11.22.01.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:54:51 -0800 (PST)
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
Subject: [PATCH v3 RESEND 05/10] arm64: dts: apple: t7001: Add PMGR node
Date: Fri, 22 Nov 2024 17:50:34 +0800
Message-ID: <20241122095136.35046-6-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241122095136.35046-1-towinchenmi@gmail.com>
References: <20241122095136.35046-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds the PMGR node and all known power state subnodes. Since there
are a large number of them, let's put them in a separate file to include.

Acked-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7001-air2.dtsi |   1 +
 arch/arm64/boot/dts/apple/t7001-pmgr.dtsi | 650 ++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t7001.dtsi      |  13 +
 3 files changed, 664 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/t7001-pmgr.dtsi

diff --git a/arch/arm64/boot/dts/apple/t7001-air2.dtsi b/arch/arm64/boot/dts/apple/t7001-air2.dtsi
index 19fabd425c52..e4ec8c1977de 100644
--- a/arch/arm64/boot/dts/apple/t7001-air2.dtsi
+++ b/arch/arm64/boot/dts/apple/t7001-air2.dtsi
@@ -20,6 +20,7 @@ chosen {
 		framebuffer0: framebuffer@0 {
 			compatible = "apple,simple-framebuffer", "simple-framebuffer";
 			reg = <0 0 0 0>; /* To be filled by loader */
+			power-domains = <&ps_disp0 &ps_dp>;
 			/* Format properties will be added by loader */
 			status = "disabled";
 		};
diff --git a/arch/arm64/boot/dts/apple/t7001-pmgr.dtsi b/arch/arm64/boot/dts/apple/t7001-pmgr.dtsi
new file mode 100644
index 000000000000..7321cfdcd189
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t7001-pmgr.dtsi
@@ -0,0 +1,650 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * PMGR Power domains for the Apple T7001 "A8X" SoC
+ *
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+&pmgr {
+	ps_cpu0: power-controller@20000 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20000 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "cpu0";
+		apple,always-on; /* Core device */
+	};
+
+	ps_cpu1: power-controller@20008 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20008 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "cpu1";
+		apple,always-on; /* Core device */
+	};
+
+	ps_cpu2: power-controller@20010 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20010 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "cpu2";
+		apple,always-on; /* Core device */
+	};
+
+	ps_cpm: power-controller@20040 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20040 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "cpm";
+		apple,always-on; /* Core device */
+	};
+
+	ps_sio_p: power-controller@201f8 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x201f8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sio_p";
+	};
+
+	ps_lio: power-controller@20100 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20100 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "lio";
+		apple,always-on; /* Core device */
+	};
+
+	ps_iomux: power-controller@20108 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20108 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "iomux";
+		apple,always-on; /* Core device */
+	};
+
+	ps_aic: power-controller@20110 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20110 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "aic";
+		apple,always-on; /* Core device */
+	};
+
+	ps_debug: power-controller@20118 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20118 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "debug";
+	};
+
+	ps_dwi: power-controller@20120 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20120 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dwi";
+	};
+
+	ps_gpio: power-controller@20128 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20128 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "gpio";
+	};
+
+	ps_mca0: power-controller@20130 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20130 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_mca1: power-controller@20138 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20138 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca1";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_mca2: power-controller@20140 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20140 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca2";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_mca3: power-controller@20148 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20148 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca3";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_mca4: power-controller@20150 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20150 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca4";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_pwm0: power-controller@20158 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20158 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pwm0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_i2c0: power-controller@20160 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20160 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "i2c0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_i2c1: power-controller@20168 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20168 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "i2c1";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_i2c2: power-controller@20170 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20170 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "i2c2";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_i2c3: power-controller@20178 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20178 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "i2c3";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_spi0: power-controller@20180 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20180 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "spi0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_spi1: power-controller@20188 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20188 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "spi1";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_spi2: power-controller@20190 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20190 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "spi2";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_spi3: power-controller@20198 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20198 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "spi3";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart0: power-controller@201a0 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x201a0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart1: power-controller@201a8 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x201a8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart1";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart2: power-controller@201b0 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x201b0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart2";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart3: power-controller@201b8 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x201b8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart3";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart4: power-controller@201c0 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x201c0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart4";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart5: power-controller@201c8 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x201c8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart5";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart6: power-controller@201d0 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x201d0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart6";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart7: power-controller@201d8 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x201d8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart7";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart8: power-controller@201e0 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x201e0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart8";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_aes0: power-controller@201e8 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x201e8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "aes0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_sio: power-controller@201f0 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x201f0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sio";
+		power-domains = <&ps_sio_p>;
+		apple,always-on; /* Core device */
+	};
+
+	ps_usb: power-controller@20248 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20248 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb";
+	};
+
+	ps_usbctrl: power-controller@20250 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20250 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usbctrl";
+		power-domains = <&ps_usb>;
+	};
+
+	ps_usb2host0: power-controller@20258 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20258 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb2host0";
+		power-domains = <&ps_usbctrl>;
+	};
+
+	ps_usb2host1: power-controller@20268 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20268 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb2host1";
+		power-domains = <&ps_usbctrl>;
+	};
+
+	ps_usb2host2: power-controller@20278 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20278 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb2host2";
+		power-domains = <&ps_usbctrl>;
+	};
+
+	ps_disp_busmux: power-controller@202a8 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x202a8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "disp_busmux";
+	};
+
+	ps_disp1_busmux: power-controller@202c0 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x202c0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "disp1_busmux";
+	};
+
+	ps_media: power-controller@202d8 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x202d8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "media";
+	};
+
+	ps_isp: power-controller@202d0 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x202d0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "isp";
+	};
+
+	ps_msr: power-controller@202e0 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x202e0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "msr";
+		power-domains = <&ps_media>;
+	};
+
+	ps_jpg: power-controller@202e8 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x202e8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "jpg";
+		power-domains = <&ps_media>;
+	};
+
+	ps_disp0: power-controller@202b0 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x202b0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "disp0";
+		power-domains = <&ps_disp_busmux>;
+	};
+
+	ps_disp1: power-controller@202c8 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x202c8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "disp1";
+		power-domains = <&ps_disp1_busmux>;
+	};
+
+	ps_pcie_ref: power-controller@20220 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20220 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie_ref";
+	};
+
+	ps_hsic0_phy: power-controller@20200 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20200 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "hsic0_phy";
+		power-domains = <&ps_usb2host1>;
+	};
+
+	ps_hsic1_phy: power-controller@20208 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20208 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "hsic1_phy";
+		power-domains = <&ps_usb2host2>;
+	};
+
+	ps_ispsens0: power-controller@20210 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20210 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "ispsens0";
+	};
+
+	ps_ispsens1: power-controller@20218 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20218 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "ispsens1";
+	};
+
+	ps_mcc: power-controller@20230 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20230 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mcc";
+		apple,always-on; /* Memory cache controller */
+	};
+
+	ps_mcu: power-controller@20238 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20238 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mcu";
+		apple,always-on; /* Core device */
+	};
+
+	ps_amp: power-controller@20240 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20240 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "amp";
+		apple,always-on; /* Core device */
+	};
+
+	ps_usb2host0_ohci: power-controller@20260 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20260 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb2host0_ohci";
+		power-domains = <&ps_usb2host0>;
+	};
+
+	ps_usbotg: power-controller@20288 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20288 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usbotg";
+		power-domains = <&ps_usbctrl>;
+	};
+
+	ps_smx: power-controller@20290 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20290 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "smx";
+		apple,always-on; /* Apple fabric, critical block */
+	};
+
+	ps_sf: power-controller@20298 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20298 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sf";
+		apple,always-on; /* Apple fabric, critical block */
+	};
+
+	ps_cp: power-controller@202a0 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x202a0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "cp";
+		apple,always-on; /* Core device */
+	};
+
+	ps_dp: power-controller@202b8 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x202b8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dp";
+		power-domains = <&ps_disp0>;
+	};
+
+	ps_vdec: power-controller@202f0 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x202f0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "vdec";
+		power-domains = <&ps_media>;
+	};
+
+	ps_ans: power-controller@20318 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20318 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "ans";
+	};
+
+	ps_venc: power-controller@20300 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20300 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "venc";
+		power-domains = <&ps_media>;
+	};
+
+	ps_pcie: power-controller@20308 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20308 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie";
+	};
+
+	ps_pcie_aux: power-controller@20310 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20310 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie_aux";
+	};
+
+	ps_gfx: power-controller@20320 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20320 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "gfx";
+	};
+
+	ps_sep: power-controller@20400 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x20400 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sep";
+		apple,always-on; /* Locked on */
+	};
+
+	ps_venc_pipe: power-controller@21000 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x21000 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "venc_pipe";
+		power-domains = <&ps_venc>;
+	};
+
+	ps_venc_me0: power-controller@21008 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x21008 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "venc_me0";
+		power-domains = <&ps_venc>;
+	};
+
+	ps_venc_me1: power-controller@21010 {
+		compatible = "apple,t7000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x21010 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "venc_me1";
+		power-domains = <&ps_venc>;
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/t7001.dtsi b/arch/arm64/boot/dts/apple/t7001.dtsi
index a76e034c85e3..c471f57cca0e 100644
--- a/arch/arm64/boot/dts/apple/t7001.dtsi
+++ b/arch/arm64/boot/dts/apple/t7001.dtsi
@@ -72,9 +72,18 @@ serial0: serial@20a0c0000 {
 			/* Use the bootloader-enabled clocks for now. */
 			clocks = <&clkref>, <&clkref>;
 			clock-names = "uart", "clk_uart_baud0";
+			power-domains = <&ps_uart0>;
 			status = "disabled";
 		};
 
+		pmgr: power-management@20e000000 {
+			compatible = "apple,t7000-pmgr", "apple,pmgr", "syscon", "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			reg = <0x2 0xe000000 0 0x24000>;
+		};
+
 		wdt: watchdog@20e027000 {
 			compatible = "apple,t7000-wdt", "apple,wdt";
 			reg = <0x2 0x0e027000 0x0 0x1000>;
@@ -88,11 +97,13 @@ aic: interrupt-controller@20e100000 {
 			reg = <0x2 0x0e100000 0x0 0x100000>;
 			#interrupt-cells = <3>;
 			interrupt-controller;
+			power-domains = <&ps_aic>;
 		};
 
 		pinctrl: pinctrl@20e300000 {
 			compatible = "apple,t7000-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x0e300000 0x0 0x100000>;
+			power-domains = <&ps_gpio>;
 
 			gpio-controller;
 			#gpio-cells = <2>;
@@ -121,3 +132,5 @@ timer {
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
 };
+
+#include "t7001-pmgr.dtsi"
-- 
2.47.0

