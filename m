Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0073334719
	for <asahi@lists.linux.dev>; Tue, 19 Aug 2025 11:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755604132; cv=none; b=Jke/FcMzhKlLaiqV8tKBpzankI/hWKQQYnpwFfkagC//w7o6TKwF5tCwVefs5DRgivz5xTXdfUi8ocBlpnlT38kxcZn2BVjA+ywfEGpBpdm8DtZjbDLAO/3o+5c6SiSYV7bfACxTrA5v5Ua/ti+v4tCN1VRFu7GBuyxmcJBAtyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755604132; c=relaxed/simple;
	bh=age/ppvC8S2VtISNKcoiQ4BjiQxWW/W33qt1sPYP8U8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lBlDTrGrT6Co5lpeSiRggCvU5t6wSEt0dHMbDzHqXnAFqos+G1XQLb6sh7GWyXj2vnkT4s/LPQGZIMHv7hGvYSr38J/nM61M0ZOJ0xITqOJCerV/zg2N3Y3fr5o9fr3mabYBQIq+aUTTeK9TWFSM320uPrJZkN+KTrUce33d27g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j/NPAjsL; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j/NPAjsL"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-76e6cbb991aso1565763b3a.1
        for <asahi@lists.linux.dev>; Tue, 19 Aug 2025 04:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755604130; x=1756208930; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fbXPkuhA9BfPbnhdmw51sj156sf1M0M3soMqtM7sghU=;
        b=j/NPAjsLWTcYCywtMowFXQrg0+EUrpWm/iedJPQRe1xr193N8ctTSRaUUJFpUlal1W
         LJnAgRA6vP09IQ2jGKcDHnMzey9AYz6vGsQws7S7QBke0CY7a9eharXYKMCOWb+Qhlo8
         RZ9AdHwMucNbWRsG43aqlnBRqlQIEFqIR2U2bY1io2PE+Za5x3jiewrLkrOFJAiGI+Bf
         KlwtWkDvE3fdsfYNIyMMJR1mnvg9IuUfVBEz2CNPC58q6VMY4XsjIMdYlcw6MSAbOmF+
         yMXimppcSS8xROiWVuBLJo6am7A3n/rb8grdk7t4ceVLOqSTTAqw1fxJOq+DIKvvKrAr
         24lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755604130; x=1756208930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fbXPkuhA9BfPbnhdmw51sj156sf1M0M3soMqtM7sghU=;
        b=fYzqJJ4Cz+QDGU7WZmGSld4mZgUxJ/ATF39mY+4nctDw3EbVKnh090W+6dWCmi9Yem
         DiZ1RJQQ6plUCgFB2c9OlqXXag3cZGYfQwCNw8N3zYzAV//RDxWXFg0Um1TUH9wswOO1
         Yu5olXBZNUWjC4NENFunBLPTKZ94Kz3jwC5nH0AusbwAD0r2gEDAYFyXBJySdYe5V/pu
         0d4UWDjJkEJ4BSDUYEPvzv039PPp5mUMIPJvYCBKs9FO3ImMZW64PbCQEhrQhLqA9x65
         LfHiUshogMpRuQ4mirkFvIE+2wR6ViQaa2ur9OYysaTGummhWcpTSlApYLSROcqIu2Mn
         UX7A==
X-Gm-Message-State: AOJu0YyCxlJNOLfjhQWI0WKPIwkgOQP5VcnMi2SnyBdCrnryxY5uYWSY
	+dK8Leaw5v+e/7gXZt8DpNzjChZnqSZJFcmllK99GTfh1+tLm8CX2G3I
X-Gm-Gg: ASbGnctp69YdColYGRf5NVqUYUqeEcWcOes7pDu1TDynQPRyv1hCj3L0k0RIP0UT4Xh
	WwWq8Pu5h40ruCF2rp4HVj6MRiPOcJF8dq4wzuByrq4zYXLePvxfmtD+/JhiQ3iWiiRz4A9LYJ3
	pnwT7r0CIVQBDGGATJBVjUDV8Oo/p2yvW70rJvcqNUMCryx0lY/dsDXL1o2kn7MV+lxC51WiuGN
	i9Uh8rNocPZglZoeR89sUiPIFL2u2DNg1fhXNM79maG4eMa602cQflj/D3EI6gV062xMWsBkyA5
	hqk7iRBncp2VV89gC9EDYQlzjh/2fHCBONcM/3JTc5xCme29+tHig45Y2RueADWwKp/lN2HsaPq
	1tZPzrJUggXzJvqJas3EkRdcceWcLcYt8ahEWdpBZnjtk6y3tPzBZAXa9L3gezXLS6U1vjcCze8
	ueldV5WmcZTRmzieYUelQ9ex4dnQ==
X-Google-Smtp-Source: AGHT+IFQNdCrZjHseP8SjURS8RzkWDQljSWopIJBsCZNBWk9P/4UAE6BKrcOCRHnIvQBOQaytEz7Kg==
X-Received: by 2002:a05:6a21:6da5:b0:21f:5aa1:3124 with SMTP id adf61e73a8af0-2430d36f5f3mr3185360637.13.1755604129897;
        Tue, 19 Aug 2025 04:48:49 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d76a430sm10286316a12.43.2025.08.19.04.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:48:49 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 19 Aug 2025 21:47:58 +1000
Subject: [PATCH 6/8] arm64: dts: apple: t8103,t600x,t8112: Add SMC RTC node
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-macsmc-subdevs-v1-6-57df6c3e5f19@gmail.com>
References: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
In-Reply-To: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2246;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=t1iXcsQQKpcvwP43mtFXoSktvnFhTteQzSXrmNnJ3bo=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlLUvL3rGR+/Crup/Hxy3uNklbMV1z7xmOFF5duxUpzH
 +7d7BotHaUsDGJcDLJiiiwbmoQ8Zhux3ewXqdwLM4eVCWQIAxenAEzk0TyG/5FfJxbnH5z95bbm
 PS2F8nP/G+oOyu1+0rrsr7mOe1eavh7DX4Hw7YGiK+Ju3fir9Wqa7Y3O5HSBG4c6RQt/hz5d7/p
 anxUA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Sven Peter <sven@kernel.org>

The System Manager Controller of all M1/M2 SoCs supports the RTC
sub-device.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sven Peter <sven@kernel.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t600x-die0.dtsi | 6 ++++++
 arch/arm64/boot/dts/apple/t8103.dtsi     | 6 ++++++
 arch/arm64/boot/dts/apple/t8112.dtsi     | 6 ++++++
 3 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
index 3603b276a2abcfa6a730f58d5c6b9914f22f00b0..f715b19efd1679e5cd384a967d6e2a7c261ee679 100644
--- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
@@ -44,6 +44,12 @@ smc_reboot: reboot {
 			nvmem-cell-names = "shutdown_flag", "boot_stage",
 				"boot_error_count", "panic_count";
 		};
+
+		rtc {
+			compatible = "apple,smc-rtc";
+			nvmem-cells = <&rtc_offset>;
+			nvmem-cell-names = "rtc_offset";
+		};
 	};
 
 	smc_mbox: mbox@290408000 {
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 8b7b27887968741b745651e5133dffa7d8d20f6d..59f2678639cf47f469dc699c0ecb5b9e50a45ab1 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -916,6 +916,12 @@ smc_reboot: reboot {
 				nvmem-cell-names = "shutdown_flag", "boot_stage",
 					"boot_error_count", "panic_count";
 			};
+
+			rtc {
+				compatible = "apple,smc-rtc";
+				nvmem-cells = <&rtc_offset>;
+				nvmem-cell-names = "rtc_offset";
+			};
 		};
 
 		smc_mbox: mbox@23e408000 {
diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index 3f79878b25af1f7760088aa552589494d67347fb..6bc3f58b06f703ed79578e89a030929a18d57796 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -919,6 +919,12 @@ smc_reboot: reboot {
 				nvmem-cell-names = "shutdown_flag", "boot_stage",
 					"boot_error_count", "panic_count";
 			};
+
+			rtc {
+				compatible = "apple,smc-rtc";
+				nvmem-cells = <&rtc_offset>;
+				nvmem-cell-names = "rtc_offset";
+			};
 		};
 
 		smc_mbox: mbox@23e408000 {

-- 
2.50.1

