Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2863B37BE64
	for <asahi@lists.linux.dev>; Sun, 18 Oct 2026 05:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792302963; cv=none; b=Oo3E7222Rx91+DoSoDaRr/a1MPHiMe25sDm7Iw+1Xz4fq6bl5iUuulUt6RXPl4ps3wXS25sVDoTIyJlZhwGp1lCmpWQLe9neczkNtNRWkceu38NHDxu6mhrUOI4vw3fyemHQteANvZYLGp4g0oA4KuwXlwA7qRymGvR9S720BO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792302963; c=relaxed/simple;
	bh=KU3BimG1w/tGdivUHCFc4QDicVE1ue8ULpff7ZYuYZc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IQV+H8DasrHqnwiYBiqezESwqV1Q043PQYAaIco6YP1tUWZq0N0hsTc2hXtwTsuHuxFMc/KLQr231BIXoZnQAGZTCmlEd6rLnfUtw0h5FQrn8bMyT2T7dZuJNfqdSEUigY0rOoRnmD0wrUKUx6qykX+mJQBQwb7oaXSVWZ+5gGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nNOQYbdS; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nNOQYbdS"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3a706146559so914855a91.2
        for <asahi@lists.linux.dev>; Sat, 17 Oct 2026 22:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302960; x=1792907760; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hF4JMWs272sSEGsqzXfRRdeL0HGexoAGbLW26/BzJH4=;
        b=nNOQYbdS8PnvZwa8XCXUk284zenfNT6UYWGGIdg1cOvgob9TAQkDtpi0FV5nIfGHcs
         kS6uxoP7+OZd+a++Wfzj3aDC9+d6aT9i8wwU3L/CW3Fmlp/t9ie8x0jT6RlUnHvmLSRh
         +06o8AW7mKS6pFrl6caRFy+HOR9o7iCiCyNW1ny/rf3fnADK2nMmXH5UrKqESJu12yjo
         273q+kFvfCQN0E5Mw3kJBBVjZIYAMu8wcfO8DagDbGz19ZekADxe5KEPg36y622bM3bX
         mWSC8nmAl2dAntsaJU8Hg0HxCHF0oVc/zL05QuYh/IbVkYTmNe4wWTgq+aWmMrwrMT5m
         SMRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302960; x=1792907760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hF4JMWs272sSEGsqzXfRRdeL0HGexoAGbLW26/BzJH4=;
        b=ncoU5LZkAIxi4FxLFpl9unJ1w00sxTw/6xZcNWnAPOnkPbxc1hKwjwWob5zn1Kr7N+
         R4P9JGmDyM9UMz5cpMgSqNX/thGWsQgtwj8xFUizcGXgVqayuG0A0yNtL7QDqdBwMPjI
         lmmEa82GnQUxv6AdIvRpY4GdvZcXvnVW4PO0SgmtJuWmYhxOWnxbPZr1dpPg8APowD6c
         2dVgUe6kJNoMpcRvyI+k77+BVxpX/7CbZEdTVCqgRhR6Jc4hbqbSlcen7X7/mihKLzL1
         6uqn3/eqfmoMgxmJfw14tSp5zkru+ZlHD4mbqEpPolT+fy/dtENbUzI/OmPR+AHkoMxz
         vyoA==
X-Gm-Message-State: AFq9FYJF99ksOjazaEEeeDgOvspziynMcDfGcL1D5G5bLSqz2nOlQkRo
	ow4VjM2iOxv1UnAC0XNqd9bF9uMxBGD+haZGjNrqycJt5Y7babc4K/BY
X-Gm-Gg: AYBFou2S3LYpwBDJLe1PQNASR3rtmGeZuEoGtonfzboXgY7sN/X6DPcrypgkou5Jbjs
	s9Qr2Iwb757A3q6fNG5rkYvXT/6B9wUIFyHHHA1RH9rwf7ZsjAhVNxuOadcZLhRCOFtUdCiYlwM
	1Kj6eBJTyppkOcT3Ieuj7PPaKzsZzs2VKPnZORW3SYxNe2K/jHFTP/jS1MFYdUesUydtLOVFQl3
	wR7mQScWbpEknMwB0B7k/4KxuRJQLZCdm2UFJJN2DS61OuGboN2hXt7X89y+0Kt2Wh2s+PxuKqj
	nInsRZStyJ240axLeXMWWHfk8EBwCSyQAc+sEIrhd4JZ9XMxoPvgb/qiZIA0R68FGsI9G9K+v5d
	CRFze765AhAV5Kk44r/Unp4pys52gS4oJcTXaSedxQd14eFuPzFnhq1MzD/EZfIKuzJGazbO8CQ
	mcfgTVyUIvK7ZjBgIa3sSp7UPSxwWJetY7lFAbf19J47DoLDDQF84J38lE7fZC0jQwJqjbaD4Gi
	TqAlmiZcNn0KnScnDgJeSjFmEvO+kBwdLv2KNW1v+nlnFtZ8+SW/AMMfmxV92OgqMhq+zrYZYIL
	UqZq5ABxhwv3p//b5OX+Dhl4BUWDmTFrBK0u8LEoaexwoQ==
X-Received: by 2002:a17:90b:5643:b0:3ac:95d7:2f9e with SMTP id 98e67ed59e1d1-3acef4e492fmr3874379a91.38.1792302960536;
        Sat, 17 Oct 2026 22:56:00 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:55:59 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:03 +1000
Subject: [PATCH v3 09/21] arm64: dts: apple: t8103-jxxx: Add regulators for
 CS42L83 power supply
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-9-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
In-Reply-To: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1782;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=KU3BimG1w/tGdivUHCFc4QDicVE1ue8ULpff7ZYuYZc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4nkOfZBinBN/YGlX0O5SvnfvnwlviQh5vf3pG8Wow
 u1aYrPYOiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFPtH8vwV0hFKrt3PdNppgyXZRkNSyQVK5OOKKUtnDtdWvvKqVv31RgZnvPLX/9
 g9pT3TfXN1ROaHBufK3Ku+GX6Y3bd+yu27Cw5TAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The CS42L83 codec found on M1 series Apple Silicon Macs gets its voltages
from fixed regulators managed by the platform. Add these to the template
Devicetree so that they can be referenced on the relevant devices.

We do not (officially) know how the power is delivered to the chip
(voltage rail names, commoned pins, physical regulators, etc.) so
the regulators expressed here are just stand-ins.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t8103-jxxx.dtsi | 32 +++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
index 686fb1dd215d..7483fc5cbd20 100644
--- a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
@@ -38,6 +38,38 @@ memory@800000000 {
 		device_type = "memory";
 		reg = <0x8 0 0x2 0>; /* To be filled by loader */
 	};
+
+	/*
+	 * The CS42L83 found on all T8103 boards requires VA, VCP, VCP_FILT,
+	 * VL, VD and VP regulators. We don't (officially) know how power
+	 * gets to the codec, so these fixed regulators are stand-ins.
+	 */
+	jack_va_reg: regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-va";
+	};
+
+	/* CS42L83 VCP and VCP_FILT */
+	jack_vcp_reg: regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vcp";
+	};
+
+	jack_vl_reg: regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vl";
+	};
+
+	/* VD_FILT */
+	jack_vd_reg: regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vd";
+	};
+
+	jack_vp_reg: regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vp";
+	};
 };
 
 &serial0 {

-- 
2.56.0

