Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC983E0255
	for <asahi@lists.linux.dev>; Tue, 14 Jul 2026 06:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784010541; cv=none; b=VnAhZEcynbENuWQcAQ/+aDl31K1RwSwB7CNfHZkPWhIjeNEiPDWH9RN3Ch3rP6DjBFJWcAnqZPh2sGSztuz/Cv7W0fb6BwPEDb58O07k/aFXYxuwFOsgAyo1pxor5HI9cb6bpc2tq0ndiQvtvvQpnFkaM+cWv9a5mMSKSJ3ATfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784010541; c=relaxed/simple;
	bh=IymUvUUOlIyUk7vYIWm4si7rSp3+FNzQ5/l7gdZ5Phw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=igpurfgtDEAGskzLi2NitgIi3ns2U60HrVckG4QVhE4CSfT7hHiOHo4AjrBi0wXPk9xcPGtaed9jer4dvrsAUIC8DCe3W4Wvki+fZkMkepzoGVN/CI+PWCdzV6V9xNDpndQU726CDOhSy2giRZZfwl5n//8+wz68EZ3XUhRgcbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VqNWeC2Z; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VqNWeC2Z"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c7c61b5292so8514885ad.0
        for <asahi@lists.linux.dev>; Mon, 13 Jul 2026 23:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784010540; x=1784615340; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oaLKWhSSM63KZpE/iwvlyOdiJ0F5jeAA8qCl6yAcCfI=;
        b=VqNWeC2ZZklU1eN91gy6p3koBnE6wWOcd/BVci6CqMSM+As1DBuM4WqZlliyaSBKHg
         8L2s+yYlbaS+1UBmulC/bVpSSO/MNKCJiQF4gFgBt9pO0KHw5L1F0R0ZnxZ7Vvi/IAHp
         UdMJsZ4l1jdSfSEiA82keYYhN4pKeJ6k7cDb180ikGkEODnwV4Wspmjp15bxPnycirEo
         D1Tzy3ts8sxtkT1dEcCzAdXMfgt5J/3+0qV8iR1rNNaTbN32kXYu72/xA9v51Gqvl7Qf
         8DAR3Z3RuUtFQmwXGYfJcfOddbqa1IBAUXrmqs/R0h5e4EfHMDBaT9h+AmntBueWd3nb
         35dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010540; x=1784615340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oaLKWhSSM63KZpE/iwvlyOdiJ0F5jeAA8qCl6yAcCfI=;
        b=dKwEzJtVcp0ox4nfB1TO2GyLN7aOLGLLUzNLbovBfiXvJeP4jylO3RgJIOCAB91iCL
         BYXMWenSrzDJ0i/vrmeqfUui8wERTJ8iCf55XCAKAVvTGf9arkdge+I4rlcvKIQ1atPa
         WfKTgxo9cq9ic+6o2mLZ2d25RFfb1LKbu+qHBpEFrsD6pYeC1fNt90Ev7Lh3erXBvHQm
         5Eai6XBtm3Mnr/HlT5MGHk8VGXlv5iqy3pbROZC/rWWY154QblFlImc1YfosAzAGA6iJ
         hQUfik2xWHN0W0cOqFKnKsyMIXPNwnyZq6lsbHr8+xyQxTa+h+rifJZDopdDzrPK01Pk
         bAuw==
X-Gm-Message-State: AOJu0YziTJZfMcbC1QwPghudFeStEcDYbo+U/ehc6Npnt/vDvWgri+Jr
	zXxe3B0A7ofKPN6vbMGgeN5mKq+Up+DR8GjZO0zGNf4WvX5fB5oQM9PC
X-Gm-Gg: AfdE7cm8voBygplfaVkDoHBtZfyyuGGG2WlXFIi+4IknsxsQxFUKhcdPdncAN2NfOhD
	bEmKoh9alWphqMdLgdxZzGXZtwwSXSHQ8cFKM0r4vQfhPROZwx5qbmJuYuGtuJKc2Gb0bKy/Lpy
	Obf5typz1oMKU8itNDos+uQ1+WesRmIryGUOa3JTnkyZAelLho6vW5SSlfwbCrXOHOLy2j6z9oP
	mb072ABs3gykwa8GIuiP5Yyw9gddASGWM/fBorRh1EIS6XjBM6tJQyM7IGitrerWwjlcUOEHxeo
	ahkwRDEQsv/XTtmGAYg0h+CUbB06gE4d0LSECHLnNMKALG1VU9BuudPQtduZ4GDK/lxF+RF/uFq
	QUtPVr0O+Z289oZ/ECAq/8OGjfKFWoLoSIe4nqYC4KAarriv5+ZIlw1Epv66lvo8ycRGjgS+mmx
	NFZZqcJgygxwtoD3RQ9IBvqmt2daqFifOE7/I2eF5XsgPPG+1/x/GEoqnVGglNKyLtyeCc38b7T
	jmHMfN7k2LgnU3kxgfe++R8SWvsSKxZhSboqQcZdtWGt6Hxx+Txv0tTd7d+OEyT
X-Received: by 2002:a17:903:4b2d:b0:2c9:ceb9:865b with SMTP id d9443c01a7336-2ce9eab3aeemr104195135ad.21.1784010540252;
        Mon, 13 Jul 2026 23:29:00 -0700 (PDT)
Received: from [10.160.5.76] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc99cc5aasm110915985ad.0.2026.07.13.23.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 23:29:00 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 14 Jul 2026 16:28:16 +1000
Subject: [PATCH v2 09/12] arm64: dts: apple: t602x: Add common SMC hwmon
 sensors
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-smc-subdev-dt-v2-9-13fa78873121@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=966;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=IymUvUUOlIyUk7vYIWm4si7rSp3+FNzQ5/l7gdZ5Phw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmh1xnvaiyaG9S2R1lJb4a1+uHH4be1GJ53PQ68NWXil
 /sZDFe6OyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFN9zI+R4U2df62balzCnA0azfndWv4Tj9zITVqTUmwcKnM3SeTbE4b/ObItDyy
 Pb92Vn5ze9/74olf93pqh0o3ms7OOLdy5ov4IEwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the SMC hwmon sensors common to all SoCs

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t6021.dtsi | 2 ++
 arch/arm64/boot/dts/apple/t6022.dtsi | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6021.dtsi b/arch/arm64/boot/dts/apple/t6021.dtsi
index 62907ad6a546..5175797baf62 100644
--- a/arch/arm64/boot/dts/apple/t6021.dtsi
+++ b/arch/arm64/boot/dts/apple/t6021.dtsi
@@ -67,3 +67,5 @@ p-core-pmu-affinity {
 &gpu {
 	compatible = "apple,agx-g14c", "apple,agx-g14s";
 };
+
+#include "hwmon-common.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6022.dtsi b/arch/arm64/boot/dts/apple/t6022.dtsi
index e73bf2f7510a..7585fd609d34 100644
--- a/arch/arm64/boot/dts/apple/t6022.dtsi
+++ b/arch/arm64/boot/dts/apple/t6022.dtsi
@@ -347,3 +347,5 @@ &ps_gfx {
 &gpu {
 	compatible = "apple,agx-g14d", "apple,agx-g14s";
 };
+
+#include "hwmon-common.dtsi"

-- 
2.55.0

