Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C2B1CDFD5
	for <asahi@lists.linux.dev>; Sat, 25 Oct 2025 00:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761351972; cv=none; b=nWpQ0GroCtiM2jaJHPsWGNsTbFP4SfnuI5Wmy6F63nYj602byKqT18TUP0kiMakZRKCB9OKCPCVWQaThrSpClkBS0E7Q7KdwhLpixYKf8tRE/kPAFLtusCJ+cwheBHCwP1aZcdeQqvrcisTFuuOm1BBPXy4Kzv7Ugrv8K+6GQr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761351972; c=relaxed/simple;
	bh=aj4aVwNnkYZP/VgOnJhsAwtvL4XTAa/u4ZaKgBAEh3Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bEULTv8hU8ubW+VvNL1yXioE1imumogShHzEQnjaYV5DTCiXr+CP/M4to8SjFDtbaS7lF+gGs11Q012b8fkqnQOvfRqLP2dMAmNOUbBq7CkU+6ClrVKI/w1B+bfdhQ6F/KFQ0JSc5ehLZVtFLMvk0O1t6xaMGu/ZuFLG4Qdq1Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KOQhOJ91; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KOQhOJ91"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-290ac2ef203so25042145ad.1
        for <asahi@lists.linux.dev>; Fri, 24 Oct 2025 17:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761351970; x=1761956770; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U5nftmpeMNxILQOhfvmkuo3ny/kYcoPK9w/ov0DMU2I=;
        b=KOQhOJ91I017ADGxKaeiwz3NqtdRMVb4tkyFKmWn5U8k0AWuaE8atueYlpR44qjQvL
         a5AcPha8ImcO9aTqnUNSKREvdT4VAClNFh0LjkHAj7F4+AgSJj1PZkhFJR9Kd9OnFU3Z
         c3tHkUPFfTYnpztz5AIgn/3QDx1mfX1cDLkAK+uWNxo/SHeCFsWCvKC5JTtWISo9tsvh
         H2VuKnGUrZXrUO9Y+ugwinKudLGWi3/igcPUvxigHE/qbqbIshIvgl2QVDGEkQMfW3vR
         i2KThFQNMlq0N0wrg0LHpK9PlYBRNSRtpD6Q1jVEGSvr0rMd+XhLtYg52Vw/LsjxX6QK
         /xIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761351970; x=1761956770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U5nftmpeMNxILQOhfvmkuo3ny/kYcoPK9w/ov0DMU2I=;
        b=dLRqQUO6uxlAhAFWZzKIQDt5/JBYhk8RVvflopgXcKUP9HR5kjdSHR08iu054bNQU5
         KFB1yRileTo/OO3GsYcFcyOaxB7NMq8wnCqLXIIzsoHFbBhx17BAWx14wcLUKP8IY9u1
         zydCwphAAL8Wpbz5T++OVGzeJWXdbgnlgliqa3UakmCfTlYJW+RloQDsthNJjvJVkkK3
         Nmomi2Fb++IdOxEPHuOZwly6S2RihVJzEY5ZZqRIAusH0JEve+bRaca4lc/1wg21UmwC
         JZaym3E0N5Dram+IGONIDd5XrxBEDIdWMSzukwnyPkd2axoyYYzU1AC3H0+AZ5lIEgEU
         jH/A==
X-Gm-Message-State: AOJu0Ywoo2S9eQb9s6AN4y4kFINoQA6VZ5H+ewacUnVHo5c6Y9kG/53t
	ulhm6j2Oj5b5lapuZRDG2oDFv8CVihxTbA+PcrUPdJL9Rnmi7fenrxpu
X-Gm-Gg: ASbGnctTaUBNs1k7rv70K445at/dCIL0XNyxHWBx9HifYUptoYHFWA5ucTi/YqyOoGH
	YuN+cPBiDZKyjEmEvUr8iJbGUXjvXfvP8FDpHO5feozstCigLKEhhHB2FuZ1Dj6v0Ef2YS/DY29
	vXRext8m7JN6iDkRQ6TeeZ+W0T7f2hVMwGeRbj9/zPOVosC9mir/f6OzqO/balPf6vR/Pra5lfM
	BKKyCOmj6wVogISLrLi5vXu0Y1JON/ZsdZNaqVn8EmnmB4+Y3AQ7M+y/cgZtFkhh3O8VqJX35+k
	bXEqcAAOPvyP/yahl6GCV+TTvzhr9ou6J/+cTZeEHWOGq2kmdV/rtWIKxMvg1R+5Le8D64SGNiI
	LJwSimRFK+nxr6tsOC+uiiDuULHA/RDNgUaJFlbFsuDNS+bvZ5qdsT1sOUCmI8xKFGAY6XQGZGS
	zcS38sgpx7wfUK3DKhKI0Adk6BCq6YZ51Sxk4TzlotL29pOBy3C0LNDo8A+HaHXaCWE5/lVMp8w
	aSdrCbUZ4X9fFFVdwE6NC+Y2LMDmvrKdivn85ZRhsROiE6/6YiE5w==
X-Google-Smtp-Source: AGHT+IE8KakcB5GHMGG8ECARmltmRt3k8h0a0+JIbETOJrnh8ND1oGT/dCjWnKYo35ORe4+xL9/X1A==
X-Received: by 2002:a17:902:db05:b0:269:8f0c:4d86 with SMTP id d9443c01a7336-2948ba5b73cmr48845065ad.53.1761351970277;
        Fri, 24 Oct 2025 17:26:10 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3f4asm4728885ad.11.2025.10.24.17.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 17:26:10 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 25 Oct 2025 10:24:41 +1000
Subject: [PATCH v4 10/11] arm64: dts: apple: t8103,t60xx,t8112: Add SMC RTC
 node
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251025-macsmc-subdevs-v4-10-374d5c9eba0e@gmail.com>
References: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
In-Reply-To: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2689;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=2GQnZlbwDgkFgLSJTTlkgGVtMUC2q8Y46wlmJNb88ZA=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBl/JM59fOHE8XGD1q5TTvfe1J0p3i1UNPndGn9/d7OLU
 d1ZTR9rOyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKhjrGPEwMUpAFNteIiRYdmlmbkMnxU871/kSnOszjRcPnf5/0tbq3w+nJg8l2vSeQ1Ghlvlif/
 yF+yz+2l6ZbLx3N8bhLcfEPusO+nlav2A3Ss3neQHAA==
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
 .../arm64/boot/dts/apple/t602x-die0.dtsi | 6 ++++++
 arch/arm64/boot/dts/apple/t8103.dtsi     | 6 ++++++
 arch/arm64/boot/dts/apple/t8112.dtsi     | 6 ++++++
 4 files changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
index 3603b276a2ab..f715b19efd16 100644
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
diff --git a/arch/arm64/boot/dts/apple/t602x-die0.dtsi b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
index 2e7d2bf08ddc..8622ddea7b44 100644
--- a/arch/arm64/boot/dts/apple/t602x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
@@ -121,6 +121,12 @@ smc_reboot: reboot {
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
 
 	pinctrl_smc: pinctrl@2a2820000 {
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 8b7b27887968..59f2678639cf 100644
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
index 3f79878b25af..6bc3f58b06f7 100644
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
2.51.0

