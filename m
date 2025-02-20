Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F7C20C038
	for <asahi@lists.linux.dev>; Thu, 20 Feb 2025 15:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740066719; cv=none; b=GgeRXWRE0NIUkestfNoI4mlVfcoz/xCiparChoBrSTA064rAgCEzGsPrhzEp9w1lEcI8xhM06j6IVKJ9e4Gu/cNQ6etrSar4h+Jpf6rL/Cq8wJWKgxgfDLCRWjxRO60C7afj/K0fn+79nv6BeKPjZezJlK+N1fUuCVIseFxOEy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740066719; c=relaxed/simple;
	bh=qZhdXikI6UVY1zdlQzyoBJcvZeFaA39QMPy5jc+lJ4E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xr4qmgcFB1L2UBB6hvNRdtZvxjtrwnQLcSX0YgN6iPb04azf7i/F/rdRwEsPxA0N5QZbvsDiiacJk2+ZrM3ctleV7GS1FB8Ut18ruEkKyQr16HE5q20Qjrv+qoyTH70jTohtCisu/5OKoMxGqLFnszk0Hhdz2k98YOUlQNg42fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GL4kJ+tb; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GL4kJ+tb"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22113560c57so21789745ad.2
        for <asahi@lists.linux.dev>; Thu, 20 Feb 2025 07:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740066717; x=1740671517; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mY1ZEHmtwa1GitLrlmJuselIoFJmZMHZa/Euu9FfPU0=;
        b=GL4kJ+tblqXLn2UQDv+Yl5GE7mzdPoLrXBi6d1c3QxYON/FiWqe6bAT9RD7AO8IhOw
         nKoZ2B29R245S+R9SnljGWHp/eaZbmFkl/4+Ag50oZoidPMlNLswWd9tsq1qAClYqTXJ
         jw4eZCG3HnhFkLCCM0OWMXQ+KVyi9wNGyXAeEj74Ff2hdAZFiSRq+1eEh2cWF7KzZRe0
         iofS1KN9UdYYJFT+zXDDp48g9vEvAxaHbjISasMun65IPGLphfNxRtS+VrEBoXE6bsTf
         p6DF82zIvMy0gtKQQ/MJBD53HQseKVNIYBVAKcNi6mxqVFceNWwE3moZhM6AgcR+FIPx
         wLwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740066717; x=1740671517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mY1ZEHmtwa1GitLrlmJuselIoFJmZMHZa/Euu9FfPU0=;
        b=VuOZBte6CaELIRCmyWGRGDacVwp1erOkKGrdxTsyRT1v9xI4xcSQMxKsFHQTCSgUZy
         3gGPFEBcUYEgm6XsOUit+gu3rQ4wDSTf1clI2dKbkdrNKlpg0n1sFZitir52RLv40iKA
         /AI9aSCqe/+StTJp7pYj4oaP4Wjwhs3BLZPT5HI0cwSjDQkWh9CUsuKt29pEVE4uuezB
         DVCMp8WBFTf2p4DyupFPHNH9uHBU6ZQTKZGqlAF4rlwaoQ6vMLAqB6JLJZokHMRNaTAD
         mDfyray5CH/63pGr381hPqUMsCR9NaE+wiUKjOAjPxiEg+vzHXVAEOULqkqFVOp+XEhI
         5iXw==
X-Gm-Message-State: AOJu0YwTgxqLJwuJkUCFb7ulS6hehgXiqzfIuvRPfZBXjB+wz3RMOmhB
	LEjU7X7eJvtxYtwU/GuygiqK8PdUo7uy9QK4JXGySSqqzHKmWwG7
X-Gm-Gg: ASbGncuPUMyoUJTdl5A0UmsF1B+L5Tx/aYGGFiZPWOlGeaEM+OuDyWu4r5xA07AQd1z
	LcigZ+j0FthrAjkjrpryrDIRgLlvMwSxnolgJYM01STU0PvRpr4JpxDQiq0nQnHk/cIQbJTp2Tk
	AIlfustmT1H6T9/eoM+poukuTQaga+UMrpIuR0oUDs5RM4BIhKJ2h2wFgKpPNcEnqdDkwqvAwRV
	fcf0pH4C4tSKiN+yOd/JGeCITuxs9ef+VGFFsjzGeW/hflcTChyQNtLzuZSXykK1bJuT2hbmMRg
	HlFNGSztTmaoeOrOgQ==
X-Google-Smtp-Source: AGHT+IFZ4waWbLP6Cecv/2VqnWVBd26xIfd6Cc00GYuO0UcuzNJuDEqe9P6MhtWqvvfa4Xee+Dfqyg==
X-Received: by 2002:a17:902:ec85:b0:21f:35fd:1b6c with SMTP id d9443c01a7336-221040c0706mr332046705ad.45.1740066717220;
        Thu, 20 Feb 2025 07:51:57 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-220d5349019sm123694345ad.36.2025.02.20.07.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 07:51:56 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 20 Feb 2025 23:51:07 +0800
Subject: [PATCH 5/5] arm64: dts: apple: t8015: Add backlight nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-dwi-dt-v1-5-d742431c7373@gmail.com>
References: <20250220-dwi-dt-v1-0-d742431c7373@gmail.com>
In-Reply-To: <20250220-dwi-dt-v1-0-d742431c7373@gmail.com>
To: Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1410; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=qZhdXikI6UVY1zdlQzyoBJcvZeFaA39QMPy5jc+lJ4E=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnt0+MPQ8JTGw4F5YzGUBWmHCB+DlZx7fcvvsKk
 sDTlG6+i/OJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ7dPjAAKCRABygi3psUI
 JDl4D/400FHyrq6Eb5o2/1uOVNJxJzFt+ILrPpy3mk45/VPqv5iGiCQWyWjOzJEACVEawuTnMe4
 jX0nylQ2XiadUBbVmK2NwG9ZVV6xh7TeQ9wqcY4aaDG/nEgCMraDMuq8VwyjlHIhxCUBEN2uDMQ
 PhYrBy5HzYkGjwzZYyopVvIg99vh7RJTZNYpnIQxZGZbnnefmdhT/o5bM+6osTPjzkL4oviftFn
 fulEaLRpzYEboa2SKzGoD5+oPJG1q+65Cf5gZT9m02bgyRpZh7K+6B6ZVUAkbSNgl+gJ6XccqDJ
 FgPNEkgEVvEByBrpLhwFD+DtIBuOjypVNQbRd669Z40i06IZp8BdQ9a2uqNoo4LeKObMsLRq5ev
 6/O/GnIWT7zHP7kJASGdy8H0X86I0WeMwimQQyK/cpUT9WLmdwgShldHEcvoonhlo8g5Y86hTg1
 CyNf67bs4tpZdfOB4NPjabnuxKPzalO4sKXjQ3ivKKlq2+R7EnsADFDAHe3ZHagFrkoKUYFh/eO
 u06SkuOcTm6+OhyMy/eU/dEtJKbEZVzeekXz4cV4I5pXNPhSm1LwwOF1FGpfbkg/qdtK+RMiXwX
 jXdeMxOefrBZDG4wRbpsB4mjcsHsU0AHdyROEc0DkmmX7uqlwtLnZgfcdsw+mt8zab5cDDOuQG4
 IYk3b4ZngcQhmaQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add DWI backlight controller nodes for Apple A11 SoC, and enable it for:

- iPhone 8
- iPhone 8 Plus

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8015-8.dtsi | 4 ++++
 arch/arm64/boot/dts/apple/t8015.dtsi   | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8015-8.dtsi b/arch/arm64/boot/dts/apple/t8015-8.dtsi
index b6505b5185bdd728a7416efaa3dd53d1c6a5fab9..0300ee1a2ffb7d2bd0558f6cb6f86514f4b433a4 100644
--- a/arch/arm64/boot/dts/apple/t8015-8.dtsi
+++ b/arch/arm64/boot/dts/apple/t8015-8.dtsi
@@ -11,3 +11,7 @@
 / {
 	chassis-type = "handset";
 };
+
+&dwi_bl {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t8015.dtsi b/arch/arm64/boot/dts/apple/t8015.dtsi
index b68647bebd20782ba7a125e670b3264c184b62cd..4d54afcecd50b50ed1fd386ccfc46c373e190e6b 100644
--- a/arch/arm64/boot/dts/apple/t8015.dtsi
+++ b/arch/arm64/boot/dts/apple/t8015.dtsi
@@ -262,6 +262,13 @@ pmgr: power-management@232000000 {
 			reg = <0x2 0x32000000 0 0x8c000>;
 		};
 
+		dwi_bl: backlight@232200080 {
+			compatible = "apple,t8015-dwi-bl", "apple,dwi-bl";
+			reg = <0x2 0x32200080 0x0 0x8>;
+			power-domains = <&ps_dwi>;
+			status = "disabled";
+		};
+
 		pinctrl_ap: pinctrl@233100000 {
 			compatible = "apple,t8015-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x33100000 0x0 0x1000>;

-- 
2.48.1

