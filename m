Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165FC25A322
	for <asahi@lists.linux.dev>; Sat, 10 May 2025 15:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746889942; cv=none; b=g0j65HRtKTvPfuKx55XD0bXEgTer4blTGEUTfldMlW3ZsLV/O+/nz7Rl4HFtCJgRO2gAq2flSjQQIIqKgQ2C7letnm43Jth7OQie6PL/N+O/fPLMo4W6wQuzCiI4qawGJxNIhNAuuyL3r9VQh3pko64vLL8mwdDGIOTNSeeMLUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746889942; c=relaxed/simple;
	bh=/9xxkCL20iFcrQUCvIdlPD0ncxR9ZewCh+wmud58YcU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QrkR1n5/WL1IEhiCCwT5Uj4NsaCO/GY7ImE2HYPP1bOHHcJrBKTaVcvvztz8qzRV1uNIpjLgeUc03aVHF3Z8VULD9Vtr9SUTaUKcCKkfHm51gvNUameVPRjBpVr5OwuzktWIUMDaRC+n34KjFtHU6hfe/EPtSZhldpjBVSEo/0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WyKGQjyv; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WyKGQjyv"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-741b3e37a1eso2399248b3a.1
        for <asahi@lists.linux.dev>; Sat, 10 May 2025 08:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746889939; x=1747494739; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t22CBONJmB65GQP7nsD4ofUIJ4+sf0vAxHh7+1UHNU4=;
        b=WyKGQjyvlTlrYs4w6N5fvDIe0mVRGp+fXsSLotfirNpa4jj3rkF8wD+D5XgLCtv90W
         f1UpEnXP4EHqEqOslUWi9snf7qjew0aWfwzpj7vJDydcoYRNLhmKNy/9uZuTrmxZH+IC
         tCKMXoJgIe74r7UDc+9gOFDWmN0lxqfzzyU+GgPvT/lY54vFx3uwEIfPIkUdH94Ghyub
         44Wt8jYAkTAhjkmRJ4jnP43HvHQ95xwjf+v8zISzP7LioM28a/PYD5/UpIzgdN7ZVZKP
         HjbO3AE5BC2YA1NcYw6v4L9YZzl6agutoIhYEfCOkNMZW28IewkEbg9lXn9m3UK7CmzD
         HOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746889939; x=1747494739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t22CBONJmB65GQP7nsD4ofUIJ4+sf0vAxHh7+1UHNU4=;
        b=oaK6J65RSep70pbHxkRptw2pRqeWn4lvHPsE2e/DlInAwCWN4CEysyLdK8AH+lMjsZ
         zJrzxoeCC8VVJMVQBlAydfQmGy5EKshd78h1zU+Lo/2icLnMk+YMARN/cRXfCCmp7TAe
         i8wsne/GHdzL9wW+iPdLIQpUGRzkgbxHKoLLeNc5u6xdxgQ+PMKpQJa3CsSztQ2wlkQx
         me2qViiGu4P+OD84gvtGRjmfLfuU/PTJLAr82FrT8BIjJOngw2h3E6feByOV4LsHM9pO
         tV21DD9xytGbGry3LT88HKxDsY+zk7OkSL8xLL7jBU13ML/1xVaMBHVCyrBwYkP1n0oK
         fzRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaBn4D5o+3om4x7rdaVmVPIBVt/umPtnvg2t2KpmKh6i8uon2TsK07i0EGAZdvUeXQYctFUQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxv9jZkKJDvZe/uxInwXt1IKoxMUaFLScR3gxeki0xl7Wv1zo3L
	PLKttOMVXkyE771kZyECLC7uyNgsJH4qNSXWPGbQGdT7mxKfJHyGoAtbiw==
X-Gm-Gg: ASbGncvLDcJP9e4hPgnL814GmEkvXiE6L0uM617DHND/4KbT7BLv2i8kCYxfStlxjtS
	cbBVLa2ncdRs1qHT+PlKF9wLYiUlNe+uPW0MnhnVh4y1P+kdTPDoVNX7P7AmclRYtHu9vVdhbGt
	I518991hcovSVyQu/4LDBsp7tclZtAt7RG4cvn4KziLSDdfX2rvNiXMx3itZaAPvq2NSPU2BMTb
	afc2Rmbuz013NZd12TiAOviGMheXXsjH6uz37PVpqIbagEKbHJF2WE2y4H1B3WyaUBgU3QpCF5w
	spA+/WySaHR3LyZV9p+L8i6F/oohZ5GZMCa+8qYGlbSS4/o0os6oXQ==
X-Google-Smtp-Source: AGHT+IHmycZ/aubcuUmT3KlKs6D0FqxvUeGQpzaAoaHzC0PGrVNsskD6TOGx5X64B6MlTwp5SLMGBQ==
X-Received: by 2002:a05:6a21:107:b0:1fd:ecfa:b6d7 with SMTP id adf61e73a8af0-215abd07500mr10502554637.28.1746889939055;
        Sat, 10 May 2025 08:12:19 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2350ddca3asm2990493a12.58.2025.05.10.08.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 08:12:18 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Sat, 10 May 2025 23:10:56 +0800
Subject: [PATCH v7 15/21] arm64: dts: apple: t7001: Add CPU PMU nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250510-apple-cpmu-v7-15-bd505cb6c520@gmail.com>
References: <20250510-apple-cpmu-v7-0-bd505cb6c520@gmail.com>
In-Reply-To: <20250510-apple-cpmu-v7-0-bd505cb6c520@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=946; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=/9xxkCL20iFcrQUCvIdlPD0ncxR9ZewCh+wmud58YcU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoH2ycPedKl6IfEwy0+uwFnPe6Ku1PChdZ5B6x+
 HcY9/bBpiyJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaB9snAAKCRABygi3psUI
 JKVmD/wIKSyDQM2B87kji0YzCYd1SgIlFwMTLc8VuSi4g6ICeDvigM3F066a6T2XA53sYqLjatM
 CKzmaHqPIrbnnXSEkjL5mGjYTYtES5SRx6k9PQBDK5c/KbJ4l5Xpeh+d6Btgee7PEXYz+E4AjyB
 c5dmTZFhuQEes/57lC5ewrpqZCyccxQ1vZr9pM0jejMfICydp+8Xl9repdUKoCZzY6jK0ab6L4Q
 aVT4ap6D8cz5oDqbDPA2UUdKm83tD/VrsqmCNZKhfvrUn5WPRKBJA/6JYQYiByEQ05EG/gbZ133
 R3g5mJ1oKEL4R64bWbDbtb5z5G19wn+UeiwHalLkwZglCDre69SyoU/IjAcEVFCNh742N8eaLz0
 mKwPvLO9eqc8Ic1GJ1Y1zezdKHzVFRpHG+YxS4ROi9USkGfy/l7ZevN7NbvHbZSRC1NVPbfZ9PB
 dg1Tdhfv02EkcgS14voAyJJXAXtA1XG1/8ze70I1zeQXW0bv8cBhyR6hF8CbZ/sDndcISZ9wI0t
 /vYRyPH8mlbqzs4FWiSt9GQDncE4194KAzifAkw136mNd/4qdXsLU0jQ8VWVNjlYugG4T4Fy2lK
 5z0i6/udd0on2ngFSqRiAJuHb+qhGK+Ua9RroG45AzA1OD6XgCYOm3QvsPJpKL+ujwwvvx1AjtI
 BFTF/KLxIuHy/sw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A8X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7001.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7001.dtsi b/arch/arm64/boot/dts/apple/t7001.dtsi
index 8e2c67e19c4167fc6639458ce79588e153336603..fca0a100dfd7b29086735d36fec0db51144da456 100644
--- a/arch/arm64/boot/dts/apple/t7001.dtsi
+++ b/arch/arm64/boot/dts/apple/t7001.dtsi
@@ -183,6 +183,15 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,typhoon-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 75 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 78 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 81 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1 &cpu2>;
+	};
 };
 
 #include "t7001-pmgr.dtsi"

-- 
2.49.0

