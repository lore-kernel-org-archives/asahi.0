Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B76234041E
	for <asahi@lists.linux.dev>; Fri,  3 Jul 2026 12:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783082679; cv=none; b=O3c9BJOTPiHR/q8TFR6YAm3Pe0AjD++X1c2CF9JGBfNrJ6TBQUzs6sMg9DOhBAzLrdUR0ksRKx8EvmVj5K2NzFwEl2QfgqT5nE2f1CZcosEGrsk/4Xy1kpF53fU7FQWKWX1rQLsMGV8duaqr4U0WlGowHtbcUKEOqdRt0qqXwsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783082679; c=relaxed/simple;
	bh=y/nTCCubfQIHxjED5Vxzczov4TsOcbe98Fn/E9FqjtI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PW2KxDktuCJ1OAHCI8AaHHpLz6B2tU2d70JFepUSNYsS+0ryu9xD36oGDpEb+gNcspnHFUTSYCzoh3xz3bCfbNjXUyDXsRIwY4L3+kdepnjaDvUYmiF1nrBnTt9Dc1k/y6zNg5JAbDliSCyuM3rYhCY6StjXBHBT3CY3TLSDOw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=nna0ZAbg; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="nna0ZAbg"
Received: by chaosmail.tech (Postfix) id 7C8601CC222;
	Fri, 03 Jul 2026 12:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1783082671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rTQPPhDVeTbGbJ1qfR9lTcAhGLsRnezT+O5gDJeLhT4=;
	b=nna0ZAbgfE+raie1SEfLKDyU1rZAk2SWuar1szhT9MXZtCV/rnnR774F91hbKNJDVaqP9u
	Xcx1m6W+YkXgIA/TtSneOwkxrrXyS290mOz50iyJhg4/4uUbyrJ5uDpTWxlsP9n1uaABKw
	BPSg+7hHoGQFwTYOK8vcleF9QappsC8=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Fri, 03 Jul 2026 14:44:13 +0200
Subject: [PATCH v2 3/3] arm64: dts: apple: Add pmgr-misc nodes to t60xx
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-pmgr-misc-v2-3-4b26ba10c5a4@chaosmail.tech>
References: <20260703-pmgr-misc-v2-0-4b26ba10c5a4@chaosmail.tech>
In-Reply-To: <20260703-pmgr-misc-v2-0-4b26ba10c5a4@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783082668; l=1610;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=y/nTCCubfQIHxjED5Vxzczov4TsOcbe98Fn/E9FqjtI=;
 b=NcUH7DaXmKG24ycJYKmxrayyvP32EBz/OBB2MJk3hgPnmt3IsTokCyRAZE7Z/CntY3mXDpMja
 /5TS8hw6kTbDSVyfkdXRuxU2iIPTl64WgrUNAh4B3+Mis3J0cDAIKd8
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

Adds the PMGR misc control nodes for M1/2 Pro/Max/Ultra series devices.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 arch/arm64/boot/dts/apple/t600x-die0.dtsi | 7 +++++++
 arch/arm64/boot/dts/apple/t602x-die0.dtsi | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
index f715b19efd16..3271d234b483 100644
--- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
@@ -24,6 +24,13 @@ aic: interrupt-controller@28e100000 {
 		power-domains = <&ps_aic>;
 	};
 
+	pmgr_misc: power-management@28e20c000 {
+		compatible = "apple,t6000-pmgr-misc";
+		reg = <0x2 0x8e20c000 0 0x400>,
+			<0x2 0x8e20c800 0 0x400>;
+		reg-names = "fabric-ps", "dcs-ps";
+	};
+
 	smc: smc@290400000 {
 		compatible = "apple,t6000-smc", "apple,smc";
 		reg = <0x2 0x90400000 0x0 0x4000>,
diff --git a/arch/arm64/boot/dts/apple/t602x-die0.dtsi b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
index 8622ddea7b44..121f2cf75915 100644
--- a/arch/arm64/boot/dts/apple/t602x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
@@ -23,6 +23,13 @@ aic: interrupt-controller@28e100000 {
 		power-domains = <&ps_aic>;
 	};
 
+	pmgr_misc: power-management@28e20c000 {
+		compatible = "apple,t6020-pmgr-misc";
+		reg = <0x2 0x8e20c000 0 0x400>,
+			<0x2 0x8e20c400 0 0x400>;
+		reg-names = "fabric-ps", "dcs-ps";
+	};
+
 	nub_spmi0: spmi@29e114000 {
 		compatible = "apple,t6020-spmi", "apple,t8103-spmi";
 		reg = <0x2 0x9e114000 0x0 0x100>;

-- 
2.55.0

