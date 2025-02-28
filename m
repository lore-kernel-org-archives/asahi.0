Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13E51B2190
	for <asahi@lists.linux.dev>; Fri, 28 Feb 2025 04:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740717161; cv=none; b=d+TupWMehOLY3bbBQ/0BbRceZO/JnhQbn8q5rXCdwoPc8dfUE6jL+7aYWlRxl6i4ZEyidqPApS2PlWqBvJa5Yf4j34QrRvXosxmYkpDwF0ukCHgh4m2Wkq8MumSYvx/2IX+KT+xBQ9X+I/VmMm3Og1KdagHk+K/CD1ZaW4ofygU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740717161; c=relaxed/simple;
	bh=BydltNMBU6F6QLU63AOuc0xk1HyAvUD4tBSVKN7rc/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D1tf4Py7W0r0go4F8370vt1NMfVnlF6esRfuSD0if0iow69okQK2JnCy7yg1NAd2RRKtFcd0tqzOyn2sRcgpt8Rw4hYfjJBFLoUFqNHh4eiSolTOgbVnoMcj2S+j2Yrl89FJun2qUm++ULEomC54dht9bFy27olG4FQJhyrJEc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ezcugu5g; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ezcugu5g"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-220d132f16dso24290025ad.0
        for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 20:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740717159; x=1741321959; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fMVlCD7xq/rs92dyB+px8zy2TgvRUJqxcNz228drEoM=;
        b=Ezcugu5gl8vdUzMsNntVNaMQudE7kJ8V1Wj9+T5sqO6gUsoQug8U+RUUR0CZMUhe2+
         HdBVKC8W49cf1WWT4pxnq7oCnpUxjooOlvcsfpsb66hmWf7H4YA3YQm0BWSUoN/LErtw
         VplJ3n2D77vZy5+0m2WgTpjBZkb5uFzSHqJROCrkY3/pkWf8mGANFlWRg+CO762D/tOY
         aHD7+QDV+yRz8+nl0T5/BuMWBBnyhpFKMa9GoT356P7HzTci3YwBbqz2xO/q3TuPFipU
         DZaTp9EuFwpsE0JETZg6GESo2vjdFVvuDP+B8ONIkiSAk/SXaJO+TLHOpd3BN6c+sMcO
         DUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740717159; x=1741321959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fMVlCD7xq/rs92dyB+px8zy2TgvRUJqxcNz228drEoM=;
        b=uY1gZZwXuab/fw4zwEA8T74gM36gUAKWtpxbgWC8JECtLHjcbzVzZ9S9LxkoTTS6T+
         vtVrLP+03VXH1Uwk3yB1Tb0RF4lfzYpvpiQuMwhznHHCyZowjdVuxQvTiWG2noNaSxUt
         De5wMRDy9IzOmG24anHtU5IAdlbOF/+FDEjK8Wq0QwMDyPzWINjZSvrdBsHxIP1a6x+H
         7V/PGW+UFEfEiBwCOd77vC+IZagmcwy4wMfKg0hWyvIQDMIduMMoEbF/GN6O+CV71Pkk
         Kxbfq2fGQEXa8OjAaVZBqU5DqJMm5TWubAcLOl1JkXyfbC4tiTUtVCmEkYp43QUFPDkg
         XZpg==
X-Gm-Message-State: AOJu0YzR0nCkdozGoVGQY9h/yhVaHFLKuM6lWMn5dKWjMBCKYOqekiVY
	srPLzqeQajCl43COchJKRdxeMAtXwtuwFG6LeEo0pa09RonpnIqD
X-Gm-Gg: ASbGncvn53M89vWi78Mpuly90OViJpMVcDEvJ88VPx2tzIsjaxZ/Fcio/4NXpisUQxJ
	wtCg40ILolhqhZVJqJ3tNwj/v8Hu27OcHUAaZ3hWbai6Anu11tT0nixurnEzMZcG6uQzL6LjAjX
	AcsDq1wgXvJYmnd1GbRBsw48Y+BpKWeXPZT37aUpYnfsILtG5EL8oqTjE0PBORKsBK3UdTa8T8P
	Kjqh04pK1RZPyShiBkXZGufc1nFirqR6brrSMRs4TyQIpHNpmvRlOSjo1Ohx2FJKwww0B+4cN3f
	Hi4FWdpBqRVEleDYSAXxU58LZApe
X-Google-Smtp-Source: AGHT+IHE0slnoj1dLL31W5pNwR3MT6F6XW45z1UHlyHXxfZwkoScSUmF1CY7KEGntHtKZdVlTDIAFA==
X-Received: by 2002:a05:6a00:3d0c:b0:732:1d12:ded4 with SMTP id d2e1a72fcca58-734ac351c0bmr3387428b3a.7.1740717159101;
        Thu, 27 Feb 2025 20:32:39 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-734a003dcafsm2738204b3a.132.2025.02.27.20.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:32:38 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 28 Feb 2025 12:32:12 +0800
Subject: [PATCH RESEND v2 1/5] arm64: dts: apple: s5l8960x: Add backlight
 nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-dwi-dt-v2-1-69e450bc4bfb@gmail.com>
References: <20250228-dwi-dt-v2-0-69e450bc4bfb@gmail.com>
In-Reply-To: <20250228-dwi-dt-v2-0-69e450bc4bfb@gmail.com>
To: Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1483; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=BydltNMBU6F6QLU63AOuc0xk1HyAvUD4tBSVKN7rc/0=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnwTxgSjorsYapWG/OMe21bzD4rgcuzKN59JmE2
 75tJQKHpzqJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ8E8YAAKCRABygi3psUI
 JJ7BD/9+XOvBJhJh3yhB31rFrSWknM4j1ymksznUPbOzne2b7fqk/ZGcdC1RrFaAx8fjuuLPtZp
 LUdUjBEGjY8LqLHaY65VjyMHUgufgBGtUx7qX5r/UagWkIbIkaMrDy2JcuPBCfzuh9fKkS+8Ukg
 s3Cmup+YltkNCOf496+KFezkmNhuhTGMp5bRFEf5elpWzw7BgHegt4NTj/oncRbGqV601wPNHhF
 iXlAWq2LbBwPVj7aFoV0rcB0p/FHNrdeqPcF2xzbE0A9OjdWev7fsVFXRgHMPZfZKtxltM9tp95
 yDyTmeLnKIQucBkP5H7+71OKD0mV5NC9/R4qLwEdQhNxEIDyfjUapQLNdeKh7OVoZkGqJUvFZfP
 iSsqYKRhIfkmc39tU8cpLxFIOJdRMw0cU34ko+fGKKLdMvGPorfJQnHsI51o7tFDEB+udyzhXtN
 vwrda2VbodwK+dTf+XShcJLtVMb7fiJlVsHwzmgasqrbZKlaQN+GYTbcRa4SSp9neIso64UeNiY
 SfoQabxVFpR+3x47nG5te3KaAJyupUsE25lhaloJQvbF7vDQ5h4rbvx2asXfTX+I3+kadmkyCNQ
 9N4xdkHyp5Um6EUin9rowOYdflZCtCrHgOOjmcLe/HULvST32LMARjHeotK3nVI00130uJc9slY
 ckOZ7dDn77pZS6w==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add DWI backlight controller nodes for Apple A7 SoC, and enable it for
iPhone 5s.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi | 4 ++++
 arch/arm64/boot/dts/apple/s5l8960x.dtsi    | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi b/arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi
index bfbd2629e206736822a157431ec959e1aa70f41b..8868df1538d68595cfe92c80b1fcecee42d348df 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi
@@ -51,6 +51,10 @@ switch-mute {
 	};
 };
 
+&dwi_bl {
+	status = "okay";
+};
+
 &framebuffer0 {
 	power-domains = <&ps_disp0 &ps_mipi_dsi>;
 };
diff --git a/arch/arm64/boot/dts/apple/s5l8960x.dtsi b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
index 64dbae5c73515bb6a1651b9b26d349d0cfd0408a..d820b0e430507f681a5f2aa13a498be98080e1db 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
@@ -100,6 +100,13 @@ aic: interrupt-controller@20e100000 {
 			power-domains = <&ps_aic>;
 		};
 
+		dwi_bl: backlight@20e200010 {
+			compatible = "apple,s5l8960x-dwi-bl", "apple,dwi-bl";
+			reg = <0x2 0x0e200010 0x0 0x8>;
+			power-domains = <&ps_dwi>;
+			status = "disabled";
+		};
+
 		pinctrl: pinctrl@20e300000 {
 			compatible = "apple,s5l8960x-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x0e300000 0x0 0x100000>;

-- 
2.48.1

