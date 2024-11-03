Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0950C15E5CA
	for <asahi@lists.linux.dev>; Sun,  3 Nov 2024 07:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730619249; cv=none; b=kcpBtyF9r4yP2v1Ib7MYwytlk01Fl95HrylCT1Gsw6PnV2/yTuTvnHPVL9yUAQsRjmjulCeGTrDPAQb3aXp3ZQN3SY8jE5kesTIonbaqlS4sWTi3ihtx56dY13rx00/HWXMxvJtmzQ1nf6QK5IUEBf+adn8EzI3g3UKQeStCbiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730619249; c=relaxed/simple;
	bh=GgZaBlxEMl3rlCm+fj6dftUD1gCQg4eBNrF1dG3t82s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IbI7HIT82YP/sBh9aUbF9GBvHnNsJBhrVMg+73c+Q+DRisDE8D7BJiTE9XuciIn6bipaXVKqgAfsGaOPbewUMxesXF2D+zBi9PbcOzzBGIfuDXUA+LtbyFn0/tv9yu2Atnx+YZg/+bBDc6OfTOjJaMKMg+zqpQjp0Hpd8RmWm/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TwiZwFIP; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TwiZwFIP"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7edb3f93369so2155963a12.1
        for <asahi@lists.linux.dev>; Sun, 03 Nov 2024 00:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730619246; x=1731224046; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4CJzztxfdkkIZuRwygV7t/6ife5xKV01tz5d3mSTVk0=;
        b=TwiZwFIPxVDb1d45yuxyPr/iPEeSA9Igqa63GyeToZp/0Nw8vSACi5cRSI7GXUUk57
         0bBs753jOBz5+nIPdWCAIPJ4JzL54uRMTtR1LS1WUeWiaTGGphSjA20GWH3Lip4Ir7m1
         9nFSjPxYkGED0Yp3Cp7o1vSLKRzsj+Jm8ZLm1k/ZE609gvaw1trdAQf/OZPjVn2s2FU4
         P6nyiQnpiXW2gFEn189CXP3W+GgUseOToORvUnip8y7xAnsIzyZxCb1rHMpSzSdN4TIq
         x5w0XtGsytRfv0ikFNST0JagHOXgt28MIzbRluosTsBkxqhiohiJDbtD0R1uMPvf9Jbl
         ezpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730619246; x=1731224046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4CJzztxfdkkIZuRwygV7t/6ife5xKV01tz5d3mSTVk0=;
        b=Oy5tzhnN6YUTfaip0ERGxo1AUnMv212+2DjoXhrSgeIsOcqVcCdZTOqYKhNVTraP3N
         22NIFcZrPmax+sADkLUTTdmaLMQ6zH2HU8J8P1LOrn8ESjJt205Ym5a+O2fk/bNeOOXz
         3T70D0ARm6k+wvROBCZDIAiYB2SNjYMGlXfPyII1I6JtDS7D7c2qPG+knhtBqL67O7zk
         FWEfr8SJrSO3cq8HiSFrYU0R0T0qMWyeDCtSDW9xsnlvRzOH4XsmLeM5pfslZZO0/poP
         kmh7eAFoWAcS9B1JN8I0ko60THrGUHQDdUt8s/EX0287rkPo8gTYhUzwLbVEt/09FA8d
         5ifQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQK7SXj0J+HNUn9QNrr9x/pRQEnToLCishrwKeyHgis19bH96RZu4noROnV7ZRciM9VV5PWA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwE0UnJ3awwmgrbMkzeBgTTD5ojdf3OjaXqNPNRMG033O1PuF4I
	01Zw5SJm+OqZTrc3rBKzRHcTSBo/6NuFbjRZfiL4MWsj6AMisGqY
X-Google-Smtp-Source: AGHT+IFJoPiRLtSm8A3IJg2pP9BqjrbeDZtctGxBlQfykqERM7l4NrtrpFEQbdyvx76sAF7ACIL3ZQ==
X-Received: by 2002:a17:90b:38c3:b0:2e2:e937:7141 with SMTP id 98e67ed59e1d1-2e94c2e4777mr13795756a91.20.1730619245941;
        Sun, 03 Nov 2024 00:34:05 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2e93da983f9sm5353443a91.5.2024.11.03.00.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 00:34:05 -0700 (PDT)
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
Subject: [PATCH asahi-soc/dt v3 09/10] arm64: dts: apple: t8011: Add PMGR nodes
Date: Sun,  3 Nov 2024 15:31:20 +0800
Message-ID: <20241103073319.30672-10-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241103073319.30672-1-towinchenmi@gmail.com>
References: <20241103073319.30672-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds the two PMGR nodes and all known power state subnodes. Since
there are a large number of them, let's put them in a separate file to
include.

Acked-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8011-common.dtsi |   1 +
 arch/arm64/boot/dts/apple/t8011-pmgr.dtsi   | 806 ++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8011-pro2.dtsi   |   8 +
 arch/arm64/boot/dts/apple/t8011.dtsi        |  22 +
 4 files changed, 837 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/t8011-pmgr.dtsi

diff --git a/arch/arm64/boot/dts/apple/t8011-common.dtsi b/arch/arm64/boot/dts/apple/t8011-common.dtsi
index 44a0d0ea2ee3..2010b56246f1 100644
--- a/arch/arm64/boot/dts/apple/t8011-common.dtsi
+++ b/arch/arm64/boot/dts/apple/t8011-common.dtsi
@@ -22,6 +22,7 @@ chosen {
 		framebuffer0: framebuffer@0 {
 			compatible = "apple,simple-framebuffer", "simple-framebuffer";
 			reg = <0 0 0 0>; /* To be filled by loader */
+			power-domains = <&ps_disp0_fe &ps_disp0_be &ps_dp>;
 			/* Format properties will be added by loader */
 			status = "disabled";
 		};
diff --git a/arch/arm64/boot/dts/apple/t8011-pmgr.dtsi b/arch/arm64/boot/dts/apple/t8011-pmgr.dtsi
new file mode 100644
index 000000000000..c44e3f9d7087
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8011-pmgr.dtsi
@@ -0,0 +1,806 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * PMGR Power domains for the Apple T8011 "A10X" SoC
+ *
+ * Copyright (c) 2024 Nick Chan <towinchenmi@gmail.com>
+ */
+
+&pmgr {
+	ps_cpu0: power-controller@80000 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80000 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "cpu0";
+		apple,always-on; /* Core device */
+	};
+
+	ps_cpu1: power-controller@80008 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80008 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "cpu1";
+		apple,always-on; /* Core device */
+	};
+
+	ps_cpu2: power-controller@80010 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80010 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "cpu2";
+		apple,always-on; /* Core device */
+	};
+
+	ps_cpm: power-controller@80040 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80040 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "cpm";
+		apple,always-on; /* Core device */
+	};
+
+	ps_sio_busif: power-controller@80158 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80158 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sio_busif";
+	};
+
+	ps_sio_p: power-controller@80160 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80160 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sio_p";
+		power-domains = <&ps_sio_busif>;
+	};
+
+	ps_sbr: power-controller@80100 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80100 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sbr";
+		apple,always-on; /* Apple fabric, critical block */
+	};
+
+	ps_aic: power-controller@80108 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80108 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "aic";
+		apple,always-on; /* Core device */
+	};
+
+	ps_dwi: power-controller@80110 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80110 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dwi";
+	};
+
+	ps_gpio: power-controller@80118 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80118 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "gpio";
+	};
+
+	ps_pms: power-controller@80120 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80120 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pms";
+		apple,always-on; /* Core device */
+	};
+
+	ps_pcie_ref: power-controller@80148 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80148 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie_ref";
+	};
+
+	ps_mca0: power-controller@80170 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80170 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_mca1: power-controller@80178 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80178 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca1";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_mca2: power-controller@80180 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80180 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca2";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_mca3: power-controller@80188 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80188 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca3";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_mca4: power-controller@80190 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80190 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca4";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_pwm0: power-controller@80198 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80198 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pwm0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_i2c0: power-controller@801a0 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801a0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "i2c0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_i2c1: power-controller@801a8 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801a8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "i2c1";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_i2c2: power-controller@801b0 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801b0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "i2c2";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_i2c3: power-controller@801b8 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801b8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "i2c3";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_spi0: power-controller@801c0 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801c0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "spi0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_spi1: power-controller@801c8 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801c8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "spi1";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_spi2: power-controller@801d0 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801d0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "spi2";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_spi3: power-controller@801d8 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801d8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "spi3";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart0: power-controller@801e0 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801e0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart1: power-controller@801e8 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801e8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart1";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart2: power-controller@801f0 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801f0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart2";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart3: power-controller@801f8 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801f8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart3";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_sio: power-controller@80168 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80168 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sio";
+		power-domains = <&ps_sio_p>;
+		apple,always-on; /* Core device */
+	};
+
+	ps_hsic0_phy: power-controller@80128 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80128 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "hsic0_phy";
+		power-domains = <&ps_usb3host>;
+	};
+
+	ps_isp_sens0: power-controller@80130 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80130 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "isp_sens0";
+	};
+
+	ps_isp_sens1: power-controller@80138 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80138 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "isp_sens1";
+	};
+
+	ps_isp_sens2: power-controller@80140 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80140 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "isp_sens2";
+	};
+
+	ps_usb: power-controller@80288 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80288 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb";
+	};
+
+	ps_usbctrl: power-controller@80290 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80290 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usbctrl";
+		power-domains = <&ps_usb>;
+	};
+
+	ps_usb2host: power-controller@80298 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80298 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb2host";
+		power-domains = <&ps_usbctrl>;
+	};
+
+	ps_usb2dev: power-controller@802a0 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802a0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb2dev";
+		power-domains = <&ps_usbctrl>;
+	};
+
+	ps_usb3host: power-controller@802a8 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802a8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb3host";
+		power-domains = <&ps_usbctrl>;
+	};
+
+	ps_usb3dev: power-controller@802b0 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802b0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb3dev";
+		power-domains = <&ps_usbctrl>;
+	};
+
+	ps_media: power-controller@802e8 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802e8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "media";
+	};
+
+	ps_isp_sys: power-controller@802e0 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802e0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "isp_sys";
+	};
+
+	ps_msr: power-controller@802f8 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802f8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "msr";
+		power-domains = <&ps_media>;
+	};
+
+	ps_jpg: power-controller@802f0 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802f0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "jpg";
+		power-domains = <&ps_media>;
+	};
+
+	ps_disp0_fe: power-controller@802c8 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802c8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "disp0_fe";
+	};
+
+	ps_disp0_be: power-controller@802d0 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802d0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "disp0_be";
+		power-domains = <&ps_disp0_fe>;
+	};
+
+	ps_dpa: power-controller@80230 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80230 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dpa";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart4: power-controller@80200 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80200 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart4";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart5: power-controller@80208 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80208 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart5";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart6: power-controller@80210 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80210 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart6";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart7: power-controller@80218 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80218 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart7";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart8: power-controller@80220 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80220 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart8";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_hfd0: power-controller@80238 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80238 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "hfd0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_mcc: power-controller@80240 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80240 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mcc";
+		apple,always-on; /* Memory cache controller */
+	};
+
+	ps_dcs0: power-controller@80248 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80248 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dcs0";
+		apple,always-on; /* LPDDR4 interface */
+	};
+
+	ps_dcs1: power-controller@80250 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80250 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dcs1";
+		apple,always-on; /* LPDDR4 interface */
+	};
+
+	ps_dcs2: power-controller@80258 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80258 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dcs2";
+		apple,always-on; /* LPDDR4 interface */
+	};
+
+	ps_dcs3: power-controller@80260 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80260 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dcs3";
+		apple,always-on; /* LPDDR4 interface */
+	};
+
+	ps_dcs4: power-controller@80268 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80268 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dcs4";
+		apple,always-on; /* LPDDR4 interface */
+	};
+
+	ps_dcs5: power-controller@80270 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80270 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dcs5";
+		apple,always-on; /* LPDDR4 interface */
+	};
+
+	ps_dcs6: power-controller@80278 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80278 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dcs6";
+	};
+
+	ps_dcs7: power-controller@80280 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80280 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dcs7";
+	};
+
+	ps_smx: power-controller@802b8 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802b8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "smx";
+		apple,always-on; /* Apple fabric, critical block */
+	};
+
+	ps_sf: power-controller@802c0 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802c0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sf";
+		apple,always-on; /* Apple fabric, critical block */
+	};
+
+	ps_dp: power-controller@802d8 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802d8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dp";
+		power-domains = <&ps_disp0_be>;
+	};
+
+	ps_venc_sys: power-controller@80320 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80320 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "venc_sys";
+		power-domains = <&ps_media>;
+	};
+
+	ps_srs: power-controller@80390 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80390 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "srs";
+		power-domains = <&ps_media>;
+	};
+
+	ps_pms_sram: power-controller@80308 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80308 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pms_sram";
+	};
+
+	ps_pmp: power-controller@80300 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80300 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pmp";
+	};
+
+	ps_pcie: power-controller@80328 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80328 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie";
+	};
+
+	ps_pcie_aux: power-controller@80330 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80330 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie_aux";
+	};
+
+	ps_vdec0: power-controller@80310 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80310 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "vdec0";
+		power-domains = <&ps_media>;
+	};
+
+	ps_gfx: power-controller@80338 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80338 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "gfx";
+	};
+
+	ps_sep: power-controller@80400 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80400 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sep";
+		apple,always-on; /* Locked on */
+	};
+
+	ps_isp_rsts0: power-controller@84000 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x84000 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "isp_rsts0";
+		power-domains = <&ps_isp_sys>;
+	};
+
+	ps_isp_rsts1: power-controller@84008 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x84008 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "isp_rsts1";
+		power-domains = <&ps_isp_sys>;
+	};
+
+	ps_isp_vis: power-controller@84010 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x84010 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "isp_vis";
+		power-domains = <&ps_isp_sys>;
+	};
+
+	ps_isp_be: power-controller@84018 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x84018 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "isp_be";
+		power-domains = <&ps_isp_sys>;
+	};
+
+	ps_isp_pearl: power-controller@84020 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x84020 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "isp_pearl";
+		power-domains = <&ps_isp_sys>;
+	};
+
+	ps_dprx: power-controller@84028 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x84028 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dprx";
+		power-domains = <&ps_isp_sys>;
+	};
+
+	ps_venc_pipe4: power-controller@88000 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x88000 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "venc_pipe4";
+		power-domains = <&ps_venc_sys>;
+	};
+
+	ps_venc_pipe5: power-controller@88008 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x88008 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "venc_pipe5";
+		power-domains = <&ps_venc_sys>;
+	};
+
+	ps_venc_me0: power-controller@88010 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x88010 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "venc_me0";
+	};
+
+	ps_venc_me1: power-controller@88018 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x88018 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "venc_me1";
+	};
+};
+
+&pmgr_mini {
+	ps_aop: power-controller@80000 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80000 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "aop";
+		power-domains = <&ps_aop_cpu &ps_aop_filter &ps_aop_busif>;
+		apple,always-on; /* Always on processor */
+	};
+
+	ps_debug: power-controller@80008 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80008 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "debug";
+	};
+
+	ps_aop_gpio: power-controller@80010 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80010 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "aop_gpio";
+	};
+
+	ps_aop_cpu: power-controller@80048 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80048 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "aop_cpu";
+	};
+
+	ps_aop_filter: power-controller@80050 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80050 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "aop_filter";
+	};
+
+	ps_aop_busif: power-controller@80058 {
+		compatible = "apple,t8010-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80058 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "aop_busif";
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/t8011-pro2.dtsi b/arch/arm64/boot/dts/apple/t8011-pro2.dtsi
index f4e707415003..5eaa0a73350f 100644
--- a/arch/arm64/boot/dts/apple/t8011-pro2.dtsi
+++ b/arch/arm64/boot/dts/apple/t8011-pro2.dtsi
@@ -40,3 +40,11 @@ button-volup {
 		};
 	};
 };
+
+&ps_dcs6 {
+	apple,always-on; /* LPDDR4 interface */
+};
+
+&ps_dcs7 {
+	apple,always-on; /* LPDDR4 interface */
+};
diff --git a/arch/arm64/boot/dts/apple/t8011.dtsi b/arch/arm64/boot/dts/apple/t8011.dtsi
index 6c4ed9dc4a50..b845fa6f6d64 100644
--- a/arch/arm64/boot/dts/apple/t8011.dtsi
+++ b/arch/arm64/boot/dts/apple/t8011.dtsi
@@ -69,19 +69,30 @@ serial0: serial@20a0c0000 {
 			/* Use the bootloader-enabled clocks for now. */
 			clocks = <&clkref>, <&clkref>;
 			clock-names = "uart", "clk_uart_baud0";
+			power-domains = <&ps_uart0>;
 			status = "disabled";
 		};
 
+		pmgr: power-management@20e000000 {
+			compatible = "apple,t8010-pmgr", "apple,pmgr", "syscon", "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			reg = <0x2 0xe000000 0 0x8c000>;
+		};
+
 		aic: interrupt-controller@20e100000 {
 			compatible = "apple,t8010-aic", "apple,aic";
 			reg = <0x2 0x0e100000 0x0 0x100000>;
 			#interrupt-cells = <3>;
 			interrupt-controller;
+			power-domains = <&ps_aic>;
 		};
 
 		pinctrl_ap: pinctrl@20f100000 {
 			compatible = "apple,t8010-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x0f100000 0x0 0x100000>;
+			power-domains = <&ps_gpio>;
 
 			gpio-controller;
 			#gpio-cells = <2>;
@@ -103,6 +114,7 @@ pinctrl_ap: pinctrl@20f100000 {
 		pinctrl_aop: pinctrl@2100f0000 {
 			compatible = "apple,t8010-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x100f0000 0x0 0x100000>;
+			power-domains = <&ps_aop_gpio>;
 
 			gpio-controller;
 			#gpio-cells = <2>;
@@ -121,6 +133,14 @@ pinctrl_aop: pinctrl@2100f0000 {
 				     <AIC_IRQ 131 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		pmgr_mini: power-management@210200000 {
+			compatible = "apple,t8010-pmgr", "apple,pmgr", "syscon", "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			reg = <0x2 0x10200000 0 0x84000>;
+		};
+
 		wdt: watchdog@2102b0000 {
 			compatible = "apple,t8010-wdt", "apple,wdt";
 			reg = <0x2 0x102b0000 0x0 0x4000>;
@@ -139,3 +159,5 @@ timer {
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
 };
+
+#include "t8011-pmgr.dtsi"
-- 
2.47.0

