Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BC61BC064
	for <asahi@lists.linux.dev>; Fri, 28 Feb 2025 04:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740717169; cv=none; b=BjNVT1UdXAFLd6Hj1XpqzLqpXQcgnzoN+CWjpKrbnqwk+YhS+9Q0rX20p4KPJ/YxM3vco1vbctwFXOzCKL7OiAd/EtPx9hOcYZ46FfA7YtDBGRVpb6EDSFGoJZMeNioWLCgWtgaeO5r0zoHx5njJPcABLdqtuVs3Gc8N0Tn4j2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740717169; c=relaxed/simple;
	bh=vmNWEgr3rWQ5P/ADNnC/vtVzmlsIMI6tVOmt2QheHbo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nYNh0Th1hkPCmRZsoeVP6QS7a5UDxqAUpVB7CZv+yPuLigVzCeUTfe61Sb5XmeQ95TjzMNUxqIv7FDSv7FPn7ruMHYU/FA3GtCLpIJbUisKRYSXVRw1Q+5BWd+pNyZRMfUj+XoYIhSdJVeTXr0NdlJbyV58z34jrpmeQo6zenFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BZrYAP0H; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZrYAP0H"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22185cddbffso49302755ad.1
        for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 20:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740717167; x=1741321967; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TGQwHVv9o7q6RnxPf9GZuF8RZdvh224WMDjiUjFtGtQ=;
        b=BZrYAP0HVvoJaSlTjJcZbm58t6R7YXXSZD1R/RnyPDV7rRkcqTmh91Rp9/XFV+NxCk
         hFqfWm7X8Vqd1nYTIJrkQv/E0P4BYpdfasaScORrsQVBg7frpCIi5lcf94F5UpB9G4r7
         r90+iDnwgJoqd/UKyrNexcM/h2yUlZSwWbQ6Q5H+nXzef318zth9WqHULOjVfCku2nSG
         8k+vT4brlrPdgB1sEkqlffgJc3AffdgZYNAVcnigIkEkkVtCV1teDy0XiVyvvzhYObB5
         F5BHC1kk3qSEwk5cUDjGp2IS2z2zLlfhvagw3aprX8QRbMupF5fbUSqLe6Jo/1tpuNwp
         PkZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740717167; x=1741321967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TGQwHVv9o7q6RnxPf9GZuF8RZdvh224WMDjiUjFtGtQ=;
        b=SoXvrpbvTfaVYar9UOWz7zRt9ARamfybHIjDpJyK+R6N9C04vG3TMjtAtuEEBWQbUT
         z1a0McQZeQQP08Eb67vyrhToZGEplAaDYQUixCkyXwoIJzr4FvvWDV9FDuO9jCp9jqzb
         cjvYpUe7TCzKTmOCWcY/xdifMQWBCTnLQfeHFCCj+UOBC/YPv6Iu4wx1RutUjNRa4NEd
         M6rAPi9u1dBM4RWSv+VyH1UdXUDcKO7AXgbc9m1zZT2rRgP9g/gIsEWbp7MxDX0rc9ty
         DGDZ8abQrBosm+STOxN0OjZ15iuKQMXR3rhoW0BLIYv68Yq8fkulVr2fWJo5aaMaVlnj
         q9ng==
X-Gm-Message-State: AOJu0YxkS9JztsnMksFBH53BTI4Ly5eN20tFyctxImr1wfbPUeiNlkdM
	QfRN+WNAZH1EquLR61HdhVLu2++c94vxpRP19eInK2MFIZvatn2l
X-Gm-Gg: ASbGnctIaoJqinrX18z9rNudG/iBLQ18+83AWOXnlv35YDDWBreOWXIRnXlbEdTuOiW
	6YnPxasmg8lRP8Guq5jOnKtLoB3Me7B9jojfeh9x0rqlDurHb1KG+R1eOi940QndCoUcHFWoyr9
	ZrjYZ/0kiPFQx8l+j+f1CTRuG5ONpLaPuGoCY3jsYa4ML8Ve/7+Lj+xs/4Nh8GhElVHqhtEligs
	cdRvymZJy62FTVhlO7GFyJe4vecBz0bjTTWbChD3sDvDvW2ANkRQ+/Q39uFIWhQR7ls0e/Tp/ep
	9wxUHcUerhvzaSVMNHq37U5gERHbcAVJzMVggdmINd70V/c=
X-Google-Smtp-Source: AGHT+IGdqGiYiPdIerWjEeRPZaQx290tWlUUMzSZCFp3qxHZqw7PvtgopI0dx2KaRwGhPRKQ58mphA==
X-Received: by 2002:a05:6a00:3e25:b0:732:6276:b46c with SMTP id d2e1a72fcca58-734abf1957bmr3901217b3a.0.1740717167163;
        Thu, 27 Feb 2025 20:32:47 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-734a003dcafsm2738204b3a.132.2025.02.27.20.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:32:46 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 28 Feb 2025 12:32:15 +0800
Subject: [PATCH RESEND v2 4/5] arm64: dts: apple: t8010: Add backlight
 nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-dwi-dt-v2-4-69e450bc4bfb@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1505; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=vmNWEgr3rWQ5P/ADNnC/vtVzmlsIMI6tVOmt2QheHbo=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnwTxhPCXsUBLNKB1jlR0unOqoSgScjctNiJtRy
 eumJJoBB0+JAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ8E8YQAKCRABygi3psUI
 JJojD/9vMZhhE3z+GKHF8IjFsnsejUXINwfdWlWe/TAyS59eXAicjPkDXVdP052aQFCYxTRJCVe
 TuViwg/UBc7j9aTOnDTP+Olel2diEOFx37jsPI1/mn9xlld5c4mZ/gq7CFQG2MvYNALS9IP+jZX
 aHRcAwSLSpYWCO3ep32nonIjQ+zKrBsAnyDrCkS5BNo4NkkxkEXmdmcJhpdojFTXGex+6dDD1yD
 WqbnHQteGHty4jDQSkZ3f+I7dwG20kqlobY3PEfUzLBiiBYpqh7+t2RH1tYUjr6Felmt98kvhUu
 DDrjPg2qOANdF9McxbnNQpoGawLlgtzeEUB9RIbqUHCcPk3wycTuOHln65LEzZ/AOnTnOIYoFSc
 YKo6Om5l/YldQNJLOkjucNjNw/H89gMznY3NNzXD8F/aQ+enqhrb21o/AJ8aUn5KhRLgCxPcFgF
 B1r5rumVz3hih+SHeeUq+x2WkyhIikAy08RjVQXhUZXSH5RxdxpU5ebiW7bpckDhzJTpnhMDbwz
 faaefGNQgFpO1ZRx9MhI+3bq/ZGO38QG6U87cTKL1QbNNSojPibYozNXDv87GTXAxk2aHtccDrD
 5wFfjWUks63EdPYxpAHb0MAfDhe1evD6Bn4HP6ZT/E/zA9OsD51iNydcd9mWZDj+NLn6BaDTcqH
 g9dj7ovSNny9Frg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add DWI backlight controller nodes for Apple A10 SoC, and enable it for:

- iPhone 7
- iPhone 7 Plus
- iPod touch 7
- iPad 6
- iPad 7

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8010-common.dtsi | 4 ++++
 arch/arm64/boot/dts/apple/t8010.dtsi        | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8010-common.dtsi b/arch/arm64/boot/dts/apple/t8010-common.dtsi
index 6613fb57c92fffd41c34a61a78e7bb6b1888a5ea..44dc968638b13814baf94e782f2267191ce267f9 100644
--- a/arch/arm64/boot/dts/apple/t8010-common.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010-common.dtsi
@@ -43,6 +43,10 @@ reserved-memory {
 	};
 };
 
+&dwi_bl {
+	status = "okay";
+};
+
 &serial0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/apple/t8010.dtsi b/arch/arm64/boot/dts/apple/t8010.dtsi
index b355d443ee476e7c98b352470e3b1b5d0fae7652..17e294bd7c44c7961cc3ba0ec5f4178840d5b9c6 100644
--- a/arch/arm64/boot/dts/apple/t8010.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010.dtsi
@@ -167,6 +167,13 @@ aic: interrupt-controller@20e100000 {
 			power-domains = <&ps_aic>;
 		};
 
+		dwi_bl: backlight@20e200080 {
+			compatible = "apple,t8010-dwi-bl", "apple,dwi-bl";
+			reg = <0x2 0x0e200080 0x0 0x8>;
+			power-domains = <&ps_dwi>;
+			status = "disabled";
+		};
+
 		pinctrl_ap: pinctrl@20f100000 {
 			compatible = "apple,t8010-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x0f100000 0x0 0x100000>;

-- 
2.48.1

