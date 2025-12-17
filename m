Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1472634FF52
	for <asahi@lists.linux.dev>; Wed, 17 Dec 2025 16:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765988737; cv=none; b=mYpegE5rSRS/jrA5fm5NJSYFkdGyTfwy8Xk9HS6hWA/EDo/t1h0+uPKB+O3LHhiggvUtBEZg6118canv69eICaDLti7E+yqqEMa/LOfe28+YzBHFPBCYhwi+xBtFEtrejNTWHvCg7u4bkfwjotheFRv3voGJUUhrInBtNIltXuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765988737; c=relaxed/simple;
	bh=PzJR4btrOIgWAbbA9/PgDRkfL56Q2zFHfShoVsaxiHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IK0HsFI9JdVQibYi36K8JhVno4R/SN6D00GbM1YJp94eXWdFAd5fM+yFjw5+BzKMdM4uLCMuYBtGBXd6+b1f1v+ERzfn+kCKqPBGGhEoZxLVsiuVl4+dZgC9LIHVlw0yRF2VLcyfaKiucWxzpn3Tt3mSsK/Q30q/AohifvhL/F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bZw5uII2; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZw5uII2"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a1360e1392so20302915ad.2
        for <asahi@lists.linux.dev>; Wed, 17 Dec 2025 08:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765988733; x=1766593533; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0XIbviOhDk9tWhSGjjMU+OiN82Iat2rqIxD675mZ2oo=;
        b=bZw5uII2v0YG9P9JjV8Vpe4d1lBf9FRiNJyJGkCotvUCcQA6oWFH2AZOEk4Gly2Hqg
         qekqGUAyVMJpKstr8rGG2CtVU01meTCrugQanrqTm4FrwFO/F3BINfncWkjsmtZnveT4
         1sHYRCy3AToeSPYVWRtnrvp7xaTONx4cTKnO/JoE7cT3JjVHOYnD9lS2V1M06MtB7ExX
         QR53miRHiTgydy9pZ8WtkKNMSfkKGm0y575vnEMZgKhtAUwzW3yIX4r6FybykXpRR0dy
         r13aPg0xYiW/vzPZtAJauyvPP+HSZLp/Zwe0S02JgfLWB67el15uX1jv94sTs/puHD8E
         OD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765988733; x=1766593533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0XIbviOhDk9tWhSGjjMU+OiN82Iat2rqIxD675mZ2oo=;
        b=K9CVkESGEtS3SQF15x1yBR9I/FxTxCS2ahapSGL2I0DlS3aMykNRRFIKnAdCy2OvTT
         YSA4ibRvcJP07nx1SNnLGirQAoo8K4vzZjYdVufqehnFZK9cBW2JSceGUxtA5BHuERMJ
         sOeLLvFJpjfZMMpIev4k9CKmf6fVZNXCcgZQhi2OWhPZKrTi5N5c4/iajSNz9eula+Cb
         gBO+DVzdeXnzwS5WopEn1vbtkeockhEs9kE1TfF8mdSEgHQjiRJ8CCsNKsKZAZLXHaN0
         FSSOFBrJ7LdIToTnkXdVzBOcsh9Yvzr8IOStOiXk7FmsMRlmoStHpvL0jw+QTNk1a2sD
         UyAg==
X-Forwarded-Encrypted: i=1; AJvYcCWaNNeWcujuhNfSYt71AHcMWb/SKK4QRyRxNOCgw8vwM9Xfp/YgJ7tqJnPNSQlXv52Tm/Oqnw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzHrnQYVAREJvuj4CS/02Mr3a8p6sbCZImlc/EK6fmHZpOAhjeq
	y6xoxeM9MdRit42I/BEPiI3yHCxyKHGKzqlpZQsiHMmoO5Pb+8Bzn7/ru+u7oBB2
X-Gm-Gg: AY/fxX4Q0t+58DNtTZcPdlr10dKzI+pRJ4qPmiGdz9iOtXeq5NNL5HVZRw/5Ni3ByCT
	3XPcnzrZTV04d5ejbRoENNSTPvV+2iQdt20+VRIsGNkTh9VLlmi0T7bwbYYlEoINmzq9I3f0GG8
	i540yAd2A1oRTsgwMOxpy2U38zZI3r7RaKl2U9qLqaLcjj6teeXBNKlhkZKiVejGIzejB9yE3pf
	LcUQVKwE8vShEgE6JD3Ey82aezH+saUOrhVqmo8BKIIw+tTjU7D7qmFZkAtH0N1xws1WWwyKcwA
	6EoqoTxzRzdMibnBXSlaF5Aje++Z3anAqNaoeg7VizGsV8bu1DQD3woeu+iLYyYvaIqvhE5leCa
	JmaD1aB8oa86xehWAapE+D6xqoZmU7wsYpxT6B6Zht50ICUVMWgZ6FDeHefu/IP+54gOx5JoUcC
	00ZsyevLdFlR2NgyscLi27lGI=
X-Google-Smtp-Source: AGHT+IFWcAl2eDJLxZCIcaifcs1mNO/2r3sxH7mEEr1iZiQh6yjVgtkLQjrhGVLNZjs2M6eo4amITw==
X-Received: by 2002:a17:902:db08:b0:2a0:f0e5:9468 with SMTP id d9443c01a7336-2a0f0e597c9mr105953605ad.32.1765988733320;
        Wed, 17 Dec 2025 08:25:33 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a0b0687c62sm122980415ad.88.2025.12.17.08.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:25:32 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 18 Dec 2025 00:23:30 +0800
Subject: [PATCH v9 17/21] arm64: dts: apple: s8001: Add CPU PMU nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-apple-cpmu-v9-17-4deadbe65d03@gmail.com>
References: <20251218-apple-cpmu-v9-0-4deadbe65d03@gmail.com>
In-Reply-To: <20251218-apple-cpmu-v9-0-4deadbe65d03@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=895; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=PzJR4btrOIgWAbbA9/PgDRkfL56Q2zFHfShoVsaxiHQ=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpQtlC18frqHrWhi62ycOZTQzFYElAtT3Uwm0CD
 IaXXMI0j++JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaULZQgAKCRABygi3psUI
 JNATEACn01v27AmuZVEofWUCxDzFsb920+rtnSrQ8l32muph5xC9coNw8T6bCYcDAwiPtDlfs6m
 /4SQvgpQoMAXxUd4HrCz3m8UKruDmVLOed4fFRje/PU18xUyzwWlweBTZDVbZzf5wKvLwTiBFqn
 2epA+tLbEi2kpSoyc59zMYv89FfoAN4EIEeULAePwCeTMxDT+0JCcfcPl+b6CSrzaZgf64SnyAA
 lhHBUIF6tHU9ruCWPqwk5Nrb9SHN1NgxdOC63Vla+HsFYc+GMqawJgvCP5AUiZju6sQfPIdvngD
 4aMSddwWxID9hSD0kwWH7F7RkDD9N1EwJBJR7x7YI4/X1lAgf1REiES5b8A3kB3j8QB/J0cFrFM
 agu/2DGetmXyT5qPZyR9FLV3pOUUZszvmy5Ch4bvWd/aktds4UGJt7HPnyrkJgzGFlMhkfMThjp
 B1+MNLbRG4enS1qpNxIrKN7rWbNnatkHgxbOAFO+RJCyW5ek5w29o5/r442NTNSK/MgK1JB5dxN
 lmQ7qHiJZMjf2DS87FHgvVeNI1KzeJsx19AB/h7vPN92sveEQ0KdQH0Jtx+pOOlhK2yjpP010SP
 bN8kt4pyhSbTGbulgl1ffdEvUgA9OSKgeCdUPI0Qt9oKuzgeDSqtRkg8eCP90fjUX6E/zNiHXcg
 djIbLrDiSNYJvfQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A9X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s8001.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s8001.dtsi b/arch/arm64/boot/dts/apple/s8001.dtsi
index b5b00dca6ffa4caa1d504860693da001a8ced80e..83c5c479c87fc1ae1bb7c6889aed9a71fb55d29c 100644
--- a/arch/arm64/boot/dts/apple/s8001.dtsi
+++ b/arch/arm64/boot/dts/apple/s8001.dtsi
@@ -298,6 +298,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,twister-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 83 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "s8001-pmgr.dtsi"

-- 
2.52.0

