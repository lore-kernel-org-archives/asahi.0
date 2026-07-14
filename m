Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725823DB322
	for <asahi@lists.linux.dev>; Tue, 14 Jul 2026 06:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784010550; cv=none; b=XLQYVTE/cgD9WlYM1rmvh8jWFT0melNTfZqZ6TW9uC9Q75ZP0XXy6/L9Ysvnl0TA0701h4pRJJpS0Z/K50sONEvPjHR00zUccPA5buoYCE56OjKihIH8ytqv3pPrAwwzt8c6ZICC7u1Nf6RtZUstKP3oXY8f3GFPJxw0eesn3V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784010550; c=relaxed/simple;
	bh=b5cJQbI2rPQBqmyd+tyRrl79csKGqBEcw6hZJ4ZNy20=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jK3ldKpGzo8T7CgdXyIgETBnRN3pYptSgOwHNqtf2bROnhNBfEs/+jciM7zSMeRpfKX/ZqPKnV8bCldYltcys7uABAYmChdhc8uhEZiEeSwv1mUBqe6UIFvbEyQiwxufI7q/N4DVIYDZE/R46N4XR3m/kPsa1UxIsHRaNBhDLY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=reTrJzSb; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="reTrJzSb"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ceae1ed204so7010075ad.0
        for <asahi@lists.linux.dev>; Mon, 13 Jul 2026 23:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784010549; x=1784615349; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8XZtIIseDB8jd5vi9+iZWbpGqG/Pge6b+zJURkaj8iQ=;
        b=reTrJzSbGzXJh0WLVrVpPjNGcncv/RD5IaK+exqJ8IqmHw+UlUov171I/wJnBnh3/d
         97J9BdXSFhfowEd2uK0X6HZwamOBb1KM/b8FbAOIMhYsOFWZI0r8GQceF27ONYXhMQtq
         eP4nMjuZRB//0JdUCPy9BiIgOmb4QlPMNHOt60GQ+c/VFjLZfDOUXSaVqVCYrDL/HurJ
         l74PNyo2tHV5+VMcHZJtPNuQbLsC2nnyTbIMxwpURUh7AiYfoiO0Rv8uyA1pa02y0bsL
         Sbize5ZeHAeRQLw6XX1rEll8qGwG/dWaRn8xX9u760tto7RY5rFk/GUqx98fS6HQ4bAK
         i9sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010549; x=1784615349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8XZtIIseDB8jd5vi9+iZWbpGqG/Pge6b+zJURkaj8iQ=;
        b=M9piStxk7jXKu4EX83yaY7cY6Ui0gLfn3eWXXreLtFY1RMMI4o7aoYrzZgpBJQwo0U
         E914iQDp8l2l8SrFxTZm9jndJfBGvP1EPlBlKo/1udJBhZ0BMXBhcX9PQ1HUPmE1PTom
         eThxls1+ae8DGht+0hG1KMkWGQItqsEVmtEqyGtzmYdMn1IQ5IFe3MNwcXq57NlI1cRD
         ZAfW4Af5vp028Y8QM3qjSWTndhb3W7Csp3HeF1YN7ccYKr2vJbNZ5xm7nlcCHpTqFMfQ
         KvQIoGXMO1g5HuoMo+2rYwAvzyXT7t97izRbhw/1BRFH6dj2eBkPMLVLqSjgxluN79RB
         d55A==
X-Gm-Message-State: AOJu0Yxcl9RV5IsZ+tj6UE1uBKr4ENQrtbG4cJFQ5HdndN23yPsZSFDM
	HVNGYE4pjnBQkaEBdpxrYYE7Xmq/m3jugsTVBJd0A1Tu8fGAlKfdytRC
X-Gm-Gg: AfdE7cmAwF07+akAY6WMYcs+q0oUaB9OpJ1L1N7byM++rLV5/tcgIXSKJ4N9ojwS6FI
	s32Jn3eda95oEzGnd220b3+CIZcalvBn5Zxly5Rh3tgQcRM1c9QHSyVTLSmpKR5qrn475qlClEX
	wkwlWtmvPVVDzGkMoY+0+zKP2RGzTBnE+FlY7lGKqVnn63QyYLvzcjiZOTXkiiQ2lagtvWmRK7g
	6+YsUfxm85cPD1gPx3xlxf5IoMBElCpZIos6n1gpQNvtdTzGUQot0/H6AnlfUqV/6yHWHMrFq47
	mTs+3if1AtyU1ZO3owv669ax3IFz8Ead9xDKBBHPNMgNY9EbmY68+G9BfoHUrHpeP/A4MDTiT9e
	VTJUiVko1VHdxlQjXs0jIpAc8e2wTAmoobz8btIZi9xv1YKqPOprG/RunC/+0V5NUrOuyfajqJa
	KQDdY2NOSlNHg6jP03wSwYe72zLThNcAiLsv3MBv+sXXkZijX/bjlH2ElVi7U76AqkPxkeHlpai
	qV/iWbTQUZj0u8DN3kREAXq2GUAiyFYr96YF6l1r71Nrj6Jaa1Kt5bhwAyu9RC2
X-Received: by 2002:a17:902:e743:b0:2c2:62ee:5a0d with SMTP id d9443c01a7336-2ce9e99c383mr117865695ad.14.1784010548658;
        Mon, 13 Jul 2026 23:29:08 -0700 (PDT)
Received: from [10.160.5.76] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc99cc5aasm110915985ad.0.2026.07.13.23.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 23:29:08 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 14 Jul 2026 16:28:18 +1000
Subject: [PATCH v2 11/12] arm64: dts: apple: t8112: jxxx: Add
 device-specific SMC hwmon sensors
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-smc-subdev-dt-v2-11-13fa78873121@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1778;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=b5cJQbI2rPQBqmyd+tyRrl79csKGqBEcw6hZJ4ZNy20=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmh1xkjXfecdvyid23BZS7LGF3Wp2uLg6W7yj79/efnf
 FFxrUBQx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKojvBn+5+QzTDB5PLFblzHyzVrh59q/RKIE3yXJHZSu2rJo/xXfHIb/HuX75cx
 32d/lnrpzX/9Sp2Nul9Y98z9zJMohefu261c38AMA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the device-specific hwmon sensors for select T8112-based devices

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j413.dts | 2 ++
 arch/arm64/boot/dts/apple/t8112-j415.dts | 2 ++
 arch/arm64/boot/dts/apple/t8112-j473.dts | 2 ++
 arch/arm64/boot/dts/apple/t8112-j493.dts | 3 +++
 4 files changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j413.dts b/arch/arm64/boot/dts/apple/t8112-j413.dts
index 1a08a41f369b..7ccfceb08093 100644
--- a/arch/arm64/boot/dts/apple/t8112-j413.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j413.dts
@@ -91,3 +91,5 @@ &i2c4 {
 &fpwm1 {
 	status = "okay";
 };
+
+#include "hwmon-laptop.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112-j415.dts b/arch/arm64/boot/dts/apple/t8112-j415.dts
index e37c56d9fb4d..fdc3409d2e07 100644
--- a/arch/arm64/boot/dts/apple/t8112-j415.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j415.dts
@@ -91,3 +91,5 @@ &i2c4 {
 &fpwm1 {
 	status = "okay";
 };
+
+#include "hwmon-laptop.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112-j473.dts b/arch/arm64/boot/dts/apple/t8112-j473.dts
index 438f972546b8..105a9d118980 100644
--- a/arch/arm64/boot/dts/apple/t8112-j473.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j473.dts
@@ -84,3 +84,5 @@ &typec0 {
 &typec1 {
 	label = "USB-C Back-right";
 };
+
+#include "hwmon-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index ec116da3e4dd..7cea5c594810 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -146,3 +146,6 @@ touchbar0: touchbar@0 {
 		touchscreen-inverted-y;
 	};
 };
+
+#include "hwmon-laptop.dtsi"
+#include "hwmon-fan.dtsi"

-- 
2.55.0

