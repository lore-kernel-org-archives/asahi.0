Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3790C1116
	for <asahi@lists.linux.dev>; Thu,  1 Dec 2022 10:37:05 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id w37so1312203pga.5
        for <asahi@lists.linux.dev>; Thu, 01 Dec 2022 02:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+WRkgKEIfnbIC3sboGx7at523Tajis/IinNKBu0g+f0=;
        b=4aJjSaljnbWvmCdxfv2Tw8eNcPRlLQgtjkc95h7EWk4LbVtnRfG9yZ9085y/tbN/U+
         uLYVvkAC3maD/srRId4iYVVZxanKsYrHI7De9MyJxn3JUkxTuRBnhuVBjtmYip+79p9F
         Ea7P9w6ygdO6c1U5+imSJM2ONyKGZLfOeVeg0eiIpx65LYcNTarhKGvpr5hYydm2U4hi
         dTjhtEh9F6txeCwAldKilSPo2brXCeRJufeELa0/WjcGjYMWwez6mejy8eIyOrhxWG7o
         lRIfo84Taw3mifwHYsuzrM/Jg+gQrA2Y+jcUgGH6H/LHx2O6BLCbT8BR/Az3+R+9nUqa
         QKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+WRkgKEIfnbIC3sboGx7at523Tajis/IinNKBu0g+f0=;
        b=acIuoi3zuIUV1x6tScN66LpEWMlgvDDuh+UgPN2r79ktlqZ1uDTGrYNfU1WoYlu23X
         DW77UPrmHmUmvxdN1WoglG4s7U8Ei6Oc3Bwtk4BP3iHpb095khwbMbBoPrxPRwyAYwFm
         BnUrE14zYNKrS6rj/rTTGLadSGDbgtQLqMoq3fNSp0BcXsPrIE1of+5ZQf7/qT9+T8g2
         5xLZEtyUgHiCdI/ydvu8JFfOwHfIqlwbtbl5zCgFKBGpsoqCVUvkNvZYttYnHswcZ8aq
         yvtWVR0GMTc5OKXc3NpP3nvn2oFRBsY5LwRMIcKpUhYPiVxI85+VJ9mHfWxWvqQIQdmx
         gL+g==
X-Gm-Message-State: ANoB5pk6ViNxg+GCs78uZnoXqDPDdJ8P6/oTNIMuGwvOPtCo9FvcgcGt
	xuHDQ5acZsMnMFKu0pBav4OSGg==
X-Google-Smtp-Source: AA0mqf43IR8AhUgxd1fohVg0/7ky938ImQTjBbMoTgnM3ajiZwSIxVkoEgYa1CSaTh7TSSmpgJi1iA==
X-Received: by 2002:a05:6a00:216e:b0:56e:7b62:bba with SMTP id r14-20020a056a00216e00b0056e7b620bbamr46739385pff.55.1669891024654;
        Thu, 01 Dec 2022 02:37:04 -0800 (PST)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
        by smtp.gmail.com with ESMTPSA id jx24-20020a17090b46d800b00213202d77d9sm2709877pjb.43.2022.12.01.02.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 02:37:04 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	asahi@lists.linux.dev,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Sven Peter <sven@svenpeter.dev>,
	Hector Martin <marcan@marcan.st>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH] arch: arm64: dts: apple: Remove stdout-path
Date: Thu,  1 Dec 2022 19:36:51 +0900
Message-Id: <20221201103651.27807-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

u-boot overrides stdout-path so that it points to /chosen/framebuffer
with some condition.
> arm: apple: Point stdout-path to framebuffer when keyboard present
>
> Unless you have a spare Apple Silicon machine, getting access to
> the serial port on Apple Silicon machines requires special
> hardware. Given that most machines come with a built-in screen
> the framebuffer is likely to be the most convenient output device
> for most users. While U-Boot will output to both serial and
> framebuffer, OSes might not. Therefore set stdout-path to point
> at /chosen/framebuffer when a keyboard is connected to the machine.
https://github.com/AsahiLinux/u-boot/commit/a609353e82fd757b7635d18ed6a0828fff657d59

Perhaps it made sense to specify serial0 as stdout-path when the
framebuffer and keyboard support was inmature, but today it is
preferrable to use /chosen/framebuffer instead of serial0 for the
console in the most cases as the u-boot change states.

Remove stdout-path to allow the kernel to choose the appropriate
console. For Linux, it will be VT, which will be eventually backed by
the framebuffer, if it is enabled. Otherwise, it will fall back to the
serial.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi | 2 --
 arch/arm64/boot/dts/apple/t600x-j375.dtsi      | 2 --
 arch/arm64/boot/dts/apple/t8103-jxxx.dtsi      | 2 --
 arch/arm64/boot/dts/apple/t8112-jxxx.dtsi      | 2 --
 4 files changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
index 5547f5e7ac5a..14b6bf234f82 100644
--- a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
@@ -30,8 +30,6 @@ chosen {
 		#size-cells = <2>;
 		ranges;
 
-		stdout-path = "serial0";
-
 		framebuffer0: framebuffer@0 {
 			compatible = "apple,simple-framebuffer", "simple-framebuffer";
 			reg = <0 0 0 0>; /* To be filled by loader */
diff --git a/arch/arm64/boot/dts/apple/t600x-j375.dtsi b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
index 7c207b1df949..22e96b436bf2 100644
--- a/arch/arm64/boot/dts/apple/t600x-j375.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
@@ -28,8 +28,6 @@ chosen {
 		#size-cells = <2>;
 		ranges;
 
-		stdout-path = "serial0";
-
 		framebuffer0: framebuffer@0 {
 			compatible = "apple,simple-framebuffer", "simple-framebuffer";
 			reg = <0 0 0 0>; /* To be filled by loader */
diff --git a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
index 3c5da0e5a41d..d2483f618d44 100644
--- a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
@@ -27,8 +27,6 @@ chosen {
 		#size-cells = <2>;
 		ranges;
 
-		stdout-path = "serial0";
-
 		framebuffer0: framebuffer@0 {
 			compatible = "apple,simple-framebuffer", "simple-framebuffer";
 			reg = <0 0 0 0>; /* To be filled by loader */
diff --git a/arch/arm64/boot/dts/apple/t8112-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8112-jxxx.dtsi
index b6b815d93c3e..af4153dcb55d 100644
--- a/arch/arm64/boot/dts/apple/t8112-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112-jxxx.dtsi
@@ -22,8 +22,6 @@ chosen {
 		#size-cells = <2>;
 		ranges;
 
-		stdout-path = "serial0";
-
 		framebuffer0: framebuffer@0 {
 			compatible = "apple,simple-framebuffer", "simple-framebuffer";
 			reg = <0 0 0 0>; /* To be filled by loader */
-- 
2.38.1

