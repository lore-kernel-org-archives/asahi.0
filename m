Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795250081;
	b=qLrYjwms5QxCx19TNxlhPin73CyxnIScWf2CBlB/48S0ezGDl9rPvMKACMUoA/qJxtgU
	 W0gCAMnjkD1EP6kx8JtWcACUMYtmAiZT7G9kYufBrY2mD6x+68yYtHaXDTJDbW0feVW22
	 DMLITZ5XPkBaVTjAjL87mKFaTSfJzvuG5wSM4b0+I4YbBtLqbj/2htziBq2kChGhm2ynQ
	 1sfV9Vpm0VXPkvzZfoZzLzGxyFs5tA2kiXCVHdEe7Hka/OmCf1rGF2wdYz0I7+LgLeAAz
	 U43ve2M3qJDpcvperrvlCLOkHHpKAJCVZ9nQfsXc5y4CttJVx9huSMXxSwF8BkSw4NQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795250081;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=rL0MUx276mgMEoRjX+bVIlwuG86tWqK7KWE3DnOCyNk=;
	b=XrHWfEMMxBsKYlfltbZEgDRHXbCkPgfIuHQO8TSH4CkIl9S4AQT4n5ninVoY6FS0OqQI
	 BB65hhnGG3cPixEwnCbkFQN4d1FkcE9xLuWIBrHFkj1/ZJzKRKWcN+/dvGgoyH0RO7PkE
	 n9BxlO8Z2kZnsugZKwDdigFIixmpsPpMbcB80h72FBRLXefzzFe90n+9dOdkq6eABPL47
	 GXFxaY+F75rD7TMbariL82C74h4gN0h4EiiaQBH5eZGKq7aSsCsjgzO1L08SwzHdzj7Zo
	 +wabHc+1q+Hvap4nTjwJeaUgztZ3iXpn4cbKQ8NdjSIm2Dg3KPZynn+016dQiSAv2Ng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hpxxNDGC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34723606A333;
	Sat, 21 Nov 2026 08:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hpxxNDGC
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795250081;
	b=qGrMZ26wf5Z47XgYEPR2/vUqJ4iKygmaxTvkbmfcCDhDALQRz8XCI8ISSN8C5inDk/w/
	 9TFmtS2Jfv2TQSKwea2FB3MgqkAcBO0jGxRCGBD3IQvmcOYybcIfBLizSDmS5WHsnCpcD
	 5QRuCT2Bnnk9BgpWp3hBON5eNGg7kwugMZy4rTwMebr2MUoWaBPLL5HQUZk3ZvE/Z4/Ij
	 VPB0poSWWvgCM1CFrna8k94hCmJrjzbstxY2lzNiPjcqYSsY2Vybu0YlolesMN92GLavh
	 5dQOIBNZT5TgX08J+BJEDVEP1fK3Cfcx5HcnzJJiobWXMW/5oYpMnlrnCqJDuZ5Adxw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795250081;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=rL0MUx276mgMEoRjX+bVIlwuG86tWqK7KWE3DnOCyNk=;
	b=jAq5EFH2UQFjcEvcnQ7b7FLo2R10COn2fgV7M7vWkD01Y93b1O0HWNHyZuUCFaUlr+Kr
	 vQiqgJJLtsfJ1SpszEwSiEiBpV+pBb63/e3Ggp0vWTr+nsfBZ18Tk3tHPw6zzngQkqhyS
	 1PT4KCbpVjSWn68AP5ZwWCqW5v/9VplppdKJHMDSiD0djVD6mtN6vu4F6uyqdWk7PC00W
	 KstWc5mKLClckPsGuaKLvsQgzp22HUamDJDUed53wBMA9jiF08QqNDHXgsQ2tcbVdwyGy
	 b/LTu4QTm4vF53ALRqES74Qo9wmvKFvnOrB5Yy5o22+fE8YT3XogSmwSZ7TLdBoGNWw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 12B201F000C0;
	Sat, 21 Nov 2026 08:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795250081;
	bh=rL0MUx276mgMEoRjX+bVIlwuG86tWqK7KWE3DnOCyNk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=hpxxNDGCHMLFMLXd+NM4KMYZihw6v9cfchd5Xo7Y7FvmEWRhCWugMX6h+1YYWUai9
	 mD9Dm6O4Jj7qPCugRRGWXl0q4oiIUOMc50GWpAlb30mA68iJPQ25xQS545gJDYMSYU
	 iFcSqY70AECzCglI2Oa6UbvfdwVNBTHHkTL9EnQf7MYZc+Jm+G7qtVyLb1FavLuaWb
	 R/RnzQRbMBmdtCtr7stBfYWa4BjWEVrjsnC1e6TZzi3tjCKV5CLy0AgK8Se6ARUEmN
	 CI0N6wuQ+LXcJvCWnZYYID9SOo51DiPSbJtm45AfQiHRs3xnKWULBl6XLjltAZbsx9
	 E8FgjLGdDU8mw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9435D4BB9B;
	Sat, 21 Nov 2026 08:34:39 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 08:34:17 +0000
Subject: [PATCH 3/4] arm64: dts: apple: t8122: Add NUB SPMI controller and
 PMIC
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261121-t8122-smc-dt-v1-3-898f3f5d6228@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795250077; l=2163;
 i=michael.reeves077@gmail.com; s=20261107; h=from:subject:message-id;
 bh=WIEK8D0DKokW1yUBnum23jVc4HEfCGnQdTPUuT8Oy9E=;
 b=W625NLC3d6xr9LAGJdlO6jThPUcK6j4G4VQEz5SeOSMndkaQlE96OwEsqIE8BG68Zx/nhPdvn
 GXGsKNpWsC+BWxcruLi4GZYC3bSEnM2BrNetv/6oOSDZmNjCM1kGY8H
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=ykwkLcuByJYb/cdLc2UuoYP03pIzwrscEZg30+4tJL8=
X-Endpoint-Received: by B4 Relay for michael.reeves077@gmail.com/20261107
 with auth_id=1442
X-Original-From: Michael Reeves <michael.reeves077@gmail.com>
Reply-To: michael.reeves077@gmail.com

From: Janne Grunau <j@jannau.net>

Add the NUB SPMI controller node and its attached Stowe PMIC with the
fixed NVMEM layout for the Apple M3 (T8122) SoC. These NVMEM cells
provide boot stage, shutdown, panic, and RTC offset storage used by SMC.

Signed-off-by: Janne Grunau <j@jannau.net>
Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
---
 arch/arm64/boot/dts/apple/t8122.dtsi | 57 ++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8122.dtsi b/arch/arm64/boot/dts/apple/t8122.dtsi
index 959ddf36efa1..3766da3c7b18 100644
--- a/arch/arm64/boot/dts/apple/t8122.dtsi
+++ b/arch/arm64/boot/dts/apple/t8122.dtsi
@@ -411,6 +411,63 @@ wdt: watchdog@2e42b0000 {
 			interrupts = <AIC_IRQ 432 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		nub_spmi: spmi@2e4714000 {
+			compatible = "apple,t8122-spmi", "apple,t8103-spmi";
+			reg = <0x2 0xe4714000 0x0 0x100>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+
+			pmic1: pmic@e {
+				compatible = "apple,stowe-pmic", "apple,spmi-nvmem";
+				reg = <0xe SPMI_USID>;
+
+				nvmem-layout {
+					compatible = "fixed-layout";
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					fault_shadow: fault-shadow@867b {
+						reg = <0x867b 0x10>;
+					};
+
+					socd: socd@8b00 {
+						reg = <0x8b00 0x400>;
+					};
+
+					boot_stage: boot-stage@f701 {
+						reg = <0xf701 0x1>;
+					};
+
+					boot_error_count: boot-error-count@f702,0 {
+						reg = <0xf702 0x1>;
+						bits = <0 4>;
+					};
+
+					panic_count: panic-count@f702,4 {
+						reg = <0xf702 0x1>;
+						bits = <4 4>;
+					};
+
+					boot_error_stage: boot-error-stage@f703 {
+						reg = <0xf703 0x1>;
+					};
+
+					shutdown_flag: shutdown-flag@f70f,3 {
+						reg = <0xf70f 0x1>;
+						bits = <3 1>;
+					};
+
+					pm_setting: pm-setting@f801 {
+						reg = <0xf801 0x1>;
+					};
+
+					rtc_offset: rtc-offset@f900 {
+						reg = <0xf900 0x6>;
+					};
+				};
+			};
+		};
+
 		pinctrl_smc: pinctrl@2ec820000 {
 			compatible = "apple,t8122-pinctrl", "apple,t8103-pinctrl";
 			reg = <0x2 0xec820000 0x0 0x4000>;

-- 
2.56.0


