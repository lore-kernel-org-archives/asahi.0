Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAE418CC0D
	for <asahi@lists.linux.dev>; Tue, 20 Aug 2024 10:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724148755; cv=none; b=W/zCTBgeYkhs3x8bj3DB6wsHwFXAt6JW/03TiCm2Dk3yh0fdIHpNQeoD1w4dyxiroYRWwSrEbqw5hOZeKbCQ/hMhncFDDpWTlxqgIYp3v4yCvq633QBl75O2GcLjnhhqaYxIwbKL1SM0F9Z50T1Xyk+VBS75wDtwOcuA6oUKSwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724148755; c=relaxed/simple;
	bh=W644OxWrT67qvyKAGwS0o5Px/YgwCYVCIzFvJEpdSXo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F9VMm7xDVg4xlyaoZbkEgO5WS3pNzOxebUEaE8s9Dj58OIvP8A2slyzYRNc6DfFNkjpBPzhuL0cHM12MOUasGCVPCehZzssp0moyo8YiEyfnxlVP4Fk3QWh3D/UJnvDDtZK0qo4kL7WD/C849LqB0M5iYzfD+WYOAiHPEP8x3NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=iMFYkBBT; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="iMFYkBBT"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-70ea2f25bfaso3898814b3a.1
        for <asahi@lists.linux.dev>; Tue, 20 Aug 2024 03:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1724148752; x=1724753552; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=st/i+sGXRsN4w3kxPextDmUHrJmeWMOfYodvp9lM/R0=;
        b=iMFYkBBT0LFD+Vr/IRAu3HnQUhCs4h2nm1IMQtOIJSFvsQWAJo4vO1ydmkL102phJG
         QyhEjd1TnVLJAgqXW7Ydw+GFYHBjGqpWmNhLAxpzNG4MjUuYDg/Ft1Dh3YdFp07C34b8
         lWGyOUX/fCUVkgjUZkN7B7C8mrMawnviIsPNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724148752; x=1724753552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=st/i+sGXRsN4w3kxPextDmUHrJmeWMOfYodvp9lM/R0=;
        b=f97ya3gR0iwOPASOjY0W2eUOSyRf6C6yNw/4KW5qaMA5ujm0Y3joa8HSmQamm2Dljl
         bAgaJrkif5yuI1CeFuQlsAbXYvUn7q/uWRwi3s8EwoVxo0otiLpPw+lKyeJa6mOM5cFU
         J2PHh2FazPYc4lafAcNvkAAE0+3Tyfb87a4npmv+xA8SXxkNr4mc5uSTZBazIg+LBOS4
         cNZ5LBhlatLFo+1uK0jPgSYVvxqaSZePOFmj38NkWnAYOs4i+sR/8Di+Y9mtcmUjjB1/
         x2c62nfb+uSn0xMl0BRdkNsh5Dz4aMlHB3w42V2p+cx0VOcQLWEp4/kAqAljWC1wy/xI
         nIzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNDFZF9ZjUeg+seldxxVcdCa5d/cuSR6itRmeevbBotSBt54jpa72B5LQLivxlYunAAX+ftVUdLPWCKvE1sPBaFTpQY3s=
X-Gm-Message-State: AOJu0YwycVnnrwbTai5nLZYQ0h8yg11F1wJliBYOz/LJ2GZ4TTIiv2QO
	nmUK/mPipilUv6cKqqKEorA/xfNmWkirnKm8WzyIgXNm99jBJNl4sxi3N8D1hA==
X-Google-Smtp-Source: AGHT+IFRvQW8NsQ+qPYeONdzztKRefuQZmv777XGiLSXepx7b8zuT6dl3melnSswYK9JmHYmoWB2Ew==
X-Received: by 2002:a05:6a21:3115:b0:1c0:f1c9:6835 with SMTP id adf61e73a8af0-1c90505887amr13980615637.51.1724148752214;
        Tue, 20 Aug 2024 03:12:32 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-713f3c35cf0sm3111052b3a.173.2024.08.20.03.12.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Aug 2024 03:12:31 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Kalle Valo <kvalo@kernel.org>,
	Hector Martin <marcan@marcan.st>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	asahi@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH 2/2] arm64: boot: apple: fixup wifi device specification
Date: Tue, 20 Aug 2024 12:12:16 +0200
Message-Id: <20240820101216.355012-3-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20240820101216.355012-1-arend.vanspriel@broadcom.com>
References: <20240820101216.355012-1-arend.vanspriel@broadcom.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align with the corrected device tree bindings in brcm,bcm4329-fmac.yaml
which imposes a constraint that the compatible should have the string
"brcm,bcm4329-fmac".

Fixes: e2e37224e8b3 ("dt-bindings: net: bcm4329-fmac: Add Apple properties & chips")
Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 arch/arm64/boot/dts/apple/t8103-jxxx.dtsi | 2 +-
 arch/arm64/boot/dts/apple/t8112-j413.dts  | 2 +-
 arch/arm64/boot/dts/apple/t8112-j493.dts  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
index 5988a4eb6efa..4b021626d469 100644
--- a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
@@ -72,7 +72,7 @@ hpm1: usb-pd@3f {
 &port00 {
 	bus-range = <1 1>;
 	wifi0: network@0,0 {
-		compatible = "pci14e4,4425";
+		compatible = "pci14e4,4425", "brcm,bcm4329-fmac";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
 		/* To be filled by the loader */
 		local-mac-address = [00 00 00 00 00 00];
diff --git a/arch/arm64/boot/dts/apple/t8112-j413.dts b/arch/arm64/boot/dts/apple/t8112-j413.dts
index 6f69658623bf..df2a63d8dd5e 100644
--- a/arch/arm64/boot/dts/apple/t8112-j413.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j413.dts
@@ -43,7 +43,7 @@ led-0 {
 &port00 {
 	bus-range = <1 1>;
 	wifi0: wifi@0,0 {
-		compatible = "pci14e4,4433";
+		compatible = "pci14e4,4433", "brcm,bcm4329-fmac";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
 		/* To be filled by the loader */
 		local-mac-address = [00 10 18 00 00 10];
diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index 0ad908349f55..5f3453e109b8 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -43,7 +43,7 @@ led-0 {
 &port00 {
 	bus-range = <1 1>;
 	wifi0: wifi@0,0 {
-		compatible = "pci14e4,4425";
+		compatible = "pci14e4,4425", "brcm,bcm4329-fmac";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
 		/* To be filled by the loader */
 		local-mac-address = [00 00 00 00 00 00];
-- 
2.32.0

