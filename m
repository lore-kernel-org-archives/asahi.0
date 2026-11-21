Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795250081;
	b=M2gF66xwmJo+Oioa5QFKgKD+wtWp4hIKYeKyxpcKe0IzKzPqCNuNsdfVEpeSqk2vLw5d
	 L94YCMsXcelAcnHileehRY9Tj1TYpNXaRuFKVzKCiaTIe0s4uTEmFfDtm4rJ85BnrJNTk
	 NI0l/7KmsponnYa5aibOwsNvKsqJhypmHFQl4AQfEZL6ydKyc4GtwPB7g0SZ+W9+xQb0Y
	 I9FPSU8hpMyBzTlrO14JQPP2l8vjsdBTwue2OIs66AfLyMeDPL/2enNSHTIwRdMXDZt8s
	 Nc5QzaohP1i/F9Zl3IjvbnuqRLvfNmlqCf4cE1YMdKwwaoEwMPE+/5JnnVSu7miGFbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795250081;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LU7a14VIbTILT8wVwPXA9PdIUuL+hLFC4Wmi3m4+Cn0=;
	b=Q88vSEVaj536F6Fm/N+WPoDf8iNE8xfN1RUYl6Nxqe3ah+AKNzBi8mdd6ArIAKgfWcj5
	 4WYznSe08bFWIh9ZmDseeVjYSeb/4Xcwuil5ELRCxRyNOCZ+FzIQZR1xBWKnsLvuuPlLr
	 e+Ap+Qe8dHm3Be0uMMy6md06u08JY6plqECugTONXW+wQXWD7nt1uv9gJkG38WqOOrG9i
	 s4x0cNqIhGWNLc5LRC9zSg5YNHfcv2lYtTRCCOZW2zkgQQ8V9Q/nYKqobi3aQOmyXg1wK
	 MoV+cGBcKvrpBbBmgpMiI1ywlB9q533lmh/QYnw3IsK16g3ClXvxvohRprXl1vq20lA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EJYOqHrP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33133606A331;
	Sat, 21 Nov 2026 08:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EJYOqHrP
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795250081;
	b=RiT/8ODm6IRFfsv9eza2fAI2akjqKbaIeWUtmmZ+d9nbklyuiQ2M4J47Q13AGVpgZiq1
	 Emmjn1GAxHe04ga+CkfFMl8vkYliFNuP/styueI98IP3g0HljC8MC0hjP0SBTvDduq6tp
	 DqEE42WvNTjBqQRtWx0PPzYaEMt3PBLv6nAplJK1tROK/RbdLpt3nrkvsBOckA40x5SHH
	 bW1JsRY+DXt405Uw7ZamCl2zsmb6Bu8c02ZjPZWz+CzDrRxmetoU8HYHYkeE84b0/8FUI
	 MyeU0hpKOckh5X02TuOR6LoqsFYJJidhqDK1OoiAENgpgAg0rHaK1Zjq1txJ4wGbr+g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795250081;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LU7a14VIbTILT8wVwPXA9PdIUuL+hLFC4Wmi3m4+Cn0=;
	b=Adje+NWchs4vxObEOgcR+lcPZuCWE7Uj9VHWyt4w+UiO0wuVUaGCVBgjHmA7GQH8gXu2
	 AT28SpMqKvfJGON4xe3l4akONUtsl+zNZXH1anS0iUJ7aE8UJRu5O1ycrG4JYfceQDeaP
	 nNGJG7aMSXAUZca+1/a3toYA1vw0XbzuGgDEH1uAi9FBJgj6fls40/ZhfCBU6Fl2M3Lt1
	 6Ji8EdeVW+071DlMLlRvwEgT1za6r0O0HBDdg0I3eeBclPImtv+0fRKn/fwcwrCEbyKD+
	 PxtADGne1xiGiiRxF/7ddaKlx2k4VKnnf/qGM9s8Ryfbq0KbbtXsM7AbfUz/bbvaGBg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2ED0B1F000C4;
	Sat, 21 Nov 2026 08:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795250080;
	bh=LU7a14VIbTILT8wVwPXA9PdIUuL+hLFC4Wmi3m4+Cn0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=EJYOqHrPpKz4LyGaOM1d3Wxr7cYN8FQAj43CFuS33QVMGDihDIW0IO0/pWTDxV4yd
	 tOoc42WBXAbcO8cd5yW+nBFgskUPoYLtUHYlZYRgryG3xRi234LWGwvfg9SW2boYmo
	 yQ4lvuOAqO2lEw0XADKF+9WLHG8WZmizexrftJHsAZXOnwXVU1AE31VjxG3jMQRWie
	 FLYmd6A4tYUoYfj6xO6gp5/XAMGRTEWWswfFAbQeVMXShcn//Exq3Is29B3a7jUvBO
	 bUNIMq0EDzK0nXwwhXcVavoBqsKFey5lyz2RjT6VfVHwwxLsTUxUz5rezOtLsAD2YD
	 itUq6E1TX3o5w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id ADEB44BB9F;
	Sat, 21 Nov 2026 08:34:39 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 08:34:18 +0000
Subject: [PATCH 4/4] arm64: dts: apple: t8122: Add SMC and its mailbox
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261121-t8122-smc-dt-v1-4-898f3f5d6228@gmail.com>
References: <20261121-t8122-smc-dt-v1-0-898f3f5d6228@gmail.com>
In-Reply-To: <20261121-t8122-smc-dt-v1-0-898f3f5d6228@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sasha Finkelstein <k@chaosmail.tech>, 
 Lee Jones <lee@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 mfd@lists.linux.dev, Michael Reeves <michael.reeves077@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795250077; l=2295;
 i=michael.reeves077@gmail.com; s=20261107; h=from:subject:message-id;
 bh=tpqBT90IBSHnW53MpijwPnOkQrD4pV6ieL92p27Jfk8=;
 b=5YdoFcdoEGZzUWkidC4DWFjfIUFCfEhG23e0BOT0uEjv56GNE+fiE/672LMAcMunjlGLJDlkk
 pEuX7BYpeZrCflBtA5dXomDOoX2COWI+Djr+5F0HQF5FSFdDpOvVMnr
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=ykwkLcuByJYb/cdLc2UuoYP03pIzwrscEZg30+4tJL8=
X-Endpoint-Received: by B4 Relay for michael.reeves077@gmail.com/20261107
 with auth_id=1442
X-Original-From: Michael Reeves <michael.reeves077@gmail.com>
Reply-To: michael.reeves077@gmail.com
Content-Transfer-Encoding: 7bit

From: Michael Reeves <michael.reeves077@gmail.com>

Add the System Management Controller node, its ASC mailbox, and GPIO,
hwmon, reboot, and RTC child nodes for the Apple M3 (T8122) SoC.

Co-developed-by: Sasha Finkelstein <k@chaosmail.tech>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
Co-developed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Janne Grunau <j@jannau.net>
Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
---
 arch/arm64/boot/dts/apple/t8122.dtsi | 45 ++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8122.dtsi b/arch/arm64/boot/dts/apple/t8122.dtsi
index 3766da3c7b18..c585634250fc 100644
--- a/arch/arm64/boot/dts/apple/t8122.dtsi
+++ b/arch/arm64/boot/dts/apple/t8122.dtsi
@@ -468,6 +468,51 @@ rtc_offset: rtc-offset@f900 {
 			};
 		};
 
+		smc: smc@2ec400000 {
+			compatible = "apple,t8122-smc", "apple,t8103-smc";
+			reg = <0x2 0xec400000 0x0 0x4000>,
+			      <0x2 0xede00000 0x0 0x100000>;
+			reg-names = "smc", "sram";
+			mboxes = <&smc_mbox>;
+
+			smc_gpio: gpio {
+				compatible = "apple,smc-gpio";
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			smc_hwmon: hwmon {
+				compatible = "apple,smc-hwmon";
+			};
+
+			smc_reboot: reboot {
+				compatible = "apple,smc-reboot";
+				nvmem-cells = <&shutdown_flag>, <&boot_stage>,
+					      <&boot_error_count>, <&panic_count>;
+				nvmem-cell-names = "shutdown_flag", "boot_stage",
+						   "boot_error_count", "panic_count";
+			};
+
+			rtc {
+				compatible = "apple,smc-rtc";
+				nvmem-cells = <&rtc_offset>;
+				nvmem-cell-names = "rtc_offset";
+			};
+		};
+
+		smc_mbox: mbox@2ec408000 {
+			compatible = "apple,t8122-asc-mailbox", "apple,asc-mailbox-v4";
+			reg = <0x2 0xec408000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 502 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 503 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 504 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 505 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "send-empty", "send-not-empty",
+					  "recv-empty", "recv-not-empty";
+			#mbox-cells = <0>;
+		};
+
 		pinctrl_smc: pinctrl@2ec820000 {
 			compatible = "apple,t8122-pinctrl", "apple,t8103-pinctrl";
 			reg = <0x2 0xec820000 0x0 0x4000>;

-- 
2.56.0


