Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F44F2DC78C
	for <asahi@lists.linux.dev>; Tue,  7 Oct 2025 11:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759835917; cv=none; b=WSecoXeP1mgzLgzNMGyPIABGyi2kxhkbdKgT/iygkyy4mixKAGw6lsiKHqSIf8f8Yva6rflD6FARUPToCbDiFM4THbCPI8K77qAYq6/uyZ0byKi7/YGOzud7AUN0m0NXN8idnNJ/90BOlg47oz6zokixOFQQUiNE2mlqg0EoVPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759835917; c=relaxed/simple;
	bh=aj4aVwNnkYZP/VgOnJhsAwtvL4XTAa/u4ZaKgBAEh3Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JHHsSZ1EhxNir+QfQXr8ASVQbVrJc1IDjqJsxP6nMDR3aqNffdR9v6Ihm2qGhL5zJ1ppooFW1OFw/iEdy1Z2OcEdFWgOhjdyURnX5PAotagn6oagENSbP38iaTw1Wi79a2lBMW8xmeMQ0OfhRikcT5QlBN+QL8CDoc5ldAd5e4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=csZ9d2hN; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="csZ9d2hN"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-26c209802c0so59721675ad.0
        for <asahi@lists.linux.dev>; Tue, 07 Oct 2025 04:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759835914; x=1760440714; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U5nftmpeMNxILQOhfvmkuo3ny/kYcoPK9w/ov0DMU2I=;
        b=csZ9d2hNOqwY1/Nlb2NQjjnDC0Pvu0eyYqmDNrdkSE2oJwhxObJfvqT3B89oqlyta6
         zPWhv+or+kRec+EXmhfGNt+NyXh8WG+JnpscUPNiG1sns73zRdggTq+AO8Tg9a40yJLt
         HSfqqrPSnVYYu4ZCVdDsyepV7JFqdJ+0GJnIq5GEoOSEnOixnfVXMIMDCtJQxpU5TYRB
         qTK7g63EpjV0WQ5TuaM5KiZtpO1Nx6O0AIavB1C45gZh/+9Mok09hCpuEv9CLCxx6LvH
         9czclXtmwJrlLYmD5/cp+JpebE46FIoPk+Rm5WX8g4L5wiTASoQCKZ2xBIjgiwT+NjXt
         VsPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759835914; x=1760440714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U5nftmpeMNxILQOhfvmkuo3ny/kYcoPK9w/ov0DMU2I=;
        b=g4XBdA/KyapM2rC2GEdQXRUjgzW2yTbTneeMi4TCEsQNvNfIoCk/PHnLExobzhoaIm
         PREaLs7Q8rA0QWJi/aZH+zL6NRh8HMmaQYAOicbyIZxOQDcMhWpGzwru4gG//VRWjREE
         WeAud2KaRvGnK7UwX+oO0lJbQ7OjYxZh0L8x7REbPqN2IvmDuKrfyoPY+RYBQomSe4le
         /oyEb7Vr1tETg4yoLVKHaH/st9IqnSNkFSOCvwr7KR1tvPWpMQ8Lwm15Y1ry67xHdi48
         etF1HUfX9TK4lCKVGv2uVuEC1F3h4MViSDdultJktYPZxU20zfSO523ENpTyC/NRzNkj
         CNkA==
X-Gm-Message-State: AOJu0Yycaf0P3x4oZh3Zif9ZqBWthcUFbFTSrXCIT7o/IjRZyZ9H0gzd
	lD9ab3lXAUV0HeVR0AZjXdAAdJFjfRldnVNHHHNxNCgH6ku+wwjio3G2
X-Gm-Gg: ASbGnctykSPy6m2POzBZHRdaygyjw209CDSu/n2P1RLR0FfrRb85Rb2X8BDbalsb38k
	M1Qx9jr3iHOyeUah5+uG/wMCV+VA9jRO2LQKFZdFDvBVH3QEJ66QyOJSEtsnTexvA2q7tL2bHqc
	IMQp6MP/VV7QY1m3UDMlBsPZE0LgPcwuO4KIjaGNcZQKNxz+q83CooX/gHBGxjRGUKadfvOxEWi
	ison5IO0WGJAsoGItj1XgrNxGP4RHTegY6bxBmSUk7LJUTdHsFXo+m/w87MbXlzg0p85m8nw4xT
	MkqWA12idw/nRx0jSNZRPC0sxEkDoBd7OnNTfswD70SPLzxvkuPD+MJ6I96CnvXMsZY74yXL94I
	5S1RnqTyN9YUei6Qy7gQK88XnKFD8qA6XOYtAgl2ioV8tpKYs9pG1LH/f3K0oQVKJa4xf1BirFK
	I0cI/hLH/NE1Do+AgNNABai0Anc7H7prG5JIz6DZs0A5127EtixRSR
X-Google-Smtp-Source: AGHT+IHuJHgjXCw9R80/D5o7z6w5Ge8vVPTT5vKpu+uAH8PzOw9lXkX16l4ogNuFgD8KvHrVNOpLCw==
X-Received: by 2002:a17:902:f60b:b0:269:ed31:6c50 with SMTP id d9443c01a7336-28e9a54efd7mr198564635ad.10.1759835914522;
        Tue, 07 Oct 2025 04:18:34 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d31bdsm162509045ad.94.2025.10.07.04.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:18:34 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 07 Oct 2025 21:16:51 +1000
Subject: [PATCH v3 10/13] arm64: dts: apple: t8103,t60xx,t8112: Add SMC RTC
 node
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-macsmc-subdevs-v3-10-d7d3bfd7ae02@gmail.com>
References: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
In-Reply-To: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
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
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlPvm3z/bogMmDmvGmNrrUnyxbdOaX5PtCls+l3jMPhz
 6cmtr+Z3lHKwiDGxSArpsiyoUnIY7YR281+kcq9MHNYmUCGMHBxCsBEym8zMsxcaGsZebPXWOLh
 Jk2m5un3M9certhx625ak2LGK/uJp9UYGbZ/4zg+d7f2xsAVRRMqPC6XTBVXf9Vx57Yo4/bqpe0
 89gwA
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

