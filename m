Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466A436A35A
	for <asahi@lists.linux.dev>; Sun,  5 Jul 2026 08:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783239408; cv=none; b=aJYERILgtEqp/55OCtl0FrOzw4/FzlpntRcAB28nYDL6Q7jY5PDjY8UF1xlqPNBsyzBK6+dn5LGwYpeaUSxsaZjSvxeWEPFcNxvgolsHbxRZUerH3gvrBZkRlmJQp4SKT4m2OEIYkII6PEPTjpL9dpcbdDGuxqxK+VDooWRiLUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783239408; c=relaxed/simple;
	bh=CFfLk88fftolFGL9RYlmTjmzxzQVWsd9FaeCfLQnlHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ck+zyb9o6K/4rLnsZ4DZjBRydgicMyUkKBIG6G/OAZi+fs8VuJIVYdI+ucTHCsA376dCotQ/cHkcSOKN5Aj7kC/nszaXcxrmzIORnhaWbN/pF9aQfqyEa83Q8ZahgyascL9CYrbjSpo/eO4QHpTRSFQ3IPAdfDSQv2XtW0QV07Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=LCwn5pd1; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="LCwn5pd1"
Received: by chaosmail.tech (Postfix) id D26101CC223;
	Sun, 05 Jul 2026 08:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1783239400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vpS2nCsBaTttpxuKMdSMPwr/G5lT/cxF5KoIklVjXo0=;
	b=LCwn5pd1g9E3tGtZD/fIaqud3qnTgBCkjpqEManCQpRB2CUoupazemhQEyWssmfXF64WDb
	OFw7E80Fzjv6cb3lr3EFgjTrxgMO2qnanZt7nl6TSK/l/CO2XDDuX27xGwH+5fYVB8fPzW
	ItCvPV7bPvFGXzh7uEstsmfBHSJXaXM=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sun, 05 Jul 2026 10:16:32 +0200
Subject: [PATCH v3 3/3] arm64: dts: apple: Add pmgr-misc nodes to t60xx
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-pmgr-misc-v3-3-51b75fed6f73@chaosmail.tech>
References: <20260705-pmgr-misc-v3-0-51b75fed6f73@chaosmail.tech>
In-Reply-To: <20260705-pmgr-misc-v3-0-51b75fed6f73@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783239397; l=1653;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=CFfLk88fftolFGL9RYlmTjmzxzQVWsd9FaeCfLQnlHw=;
 b=jrN9WOE+xTs/fYOih0lg01H8wPUiECqeeuB1rOYfu+AlxtPbZ54560YKbPbwnKbbjjzGc4Wnq
 SHviq56kYnICJuzko0w3f6O1lC+VNPNnJLnIV3BxRHXXTAQ0/4JIX8G
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

Adds the PMGR misc control nodes for M1/2 Pro/Max/Ultra series devices.

Reviewed-by: Sven Peter <sven@kernel.org>
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

