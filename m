Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B23F217F31
	for <asahi@lists.linux.dev>; Mon, 11 Aug 2025 13:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754920584; cv=none; b=FV7ZqLLcNgDF2XSePdthAy2JJkwADUT8mEOKE69xWo4xrJgYzIP5TqqO7KqAoR4+KDVMMx73fJJ6+BN6YDh2rSVeUTefliwobZX0wiWforCfxDOrx/twqQnXus/0ZdS+JrCP+CA1c9dbGLwX4FLPzo0XSWD+ALfoZDh5oEH/Ly8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754920584; c=relaxed/simple;
	bh=EpruOfD/q+EFiyB6qpD7d0v6HBQIo5PobeNa2WsPEsU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ae3K/+w10w2IRwJs2+ZO0q+GI0O7YMPL+MmPYDelHmurjfNmnzIiwXE7enFx98fHGLV7bB8R8Z/aZ61/xabhvG3clrGmK+tQovRzrCV/z7EKyQIpyukh647mzZIePSPxNqhFmwCzULBUpoH1pgq5g3KtAXxu8nhVMt7Zq0dsy/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WIUl4Qk8; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WIUl4Qk8"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-76bfabdbef5so3602587b3a.1
        for <asahi@lists.linux.dev>; Mon, 11 Aug 2025 06:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754920582; x=1755525382; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=avIBeR8rEnAqVNBXeOJ8wqd6+seOLFJ0KWtILvJpIqE=;
        b=WIUl4Qk8sNxsnj+Zo1c0tt0DE6Sbrx5ZX6pkac5R3fyXmt5Anq963l/JhBOniRYVig
         6wukQBW+j6u4T1ToUO8BrvMb6KOz/++VnL1pM83hMelmxMOooUXUZvkWxDBjxjn6EIrk
         U/sgZl69N7RpP7URnYvh97zMqjL+vOEpwIXXlNzMbGNfREvGWKjwBf/UTZSoeubW/4Fz
         TRhn6YdLL/tFwKAaPHCkvO933rKz7dYaI+PI5TyFgHg7DumMo9HH3Ro0+uVFUa6NwGO/
         ppmqQdveM0BX2xCfezbNzAgzojfKNRYKu40M/WzzO84olYJaQFa/Um0osxr4o4HUekcw
         3JPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920582; x=1755525382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=avIBeR8rEnAqVNBXeOJ8wqd6+seOLFJ0KWtILvJpIqE=;
        b=diXVUom7/rtPQ0y6q/ljY13p9LefJ3c6vgVMF5dSe7vTGPRfMmapZNQU9TkjHuIqvu
         c3Rugkh97mip5GydCMX3kctCO9iJ5QKrXtSq2q31cEIK7+huFfh+sH3sndtB4XviM+m7
         ZREa/nwpMqV8bwxbe/OrkzAuZdFh/x9nKLfO3o9YhH2G4cMAlf6SCz6paC546uH0Hk1K
         XJWOAA8SqnwrivvvuFe4Lx/1N/xFoE3wX1jAfhMQQ0WMsh4NoxmZR1MZ5vGWNFPYSXYB
         5IeHB6A5Bq03/oxjsxAj2iys2yh7KMvslT1TljRGEvTWi8Ajl7qUschsP2wat7laVMA2
         fMmg==
X-Forwarded-Encrypted: i=1; AJvYcCV0IddVAf6cjmFd9GJLadKRIBLp5udS2/XZ/iKLlhS2VoWq9tPco4nhvAkUT0wbHD09TOqKfA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxQR0WWfk5ollP4Cx0N5L6r2BDkaxEw5ZtKPKMl4P2x40IsMI+7
	GRwMlIoaoqii+QX7aDaIoQYhVUijtPUDeo0VoH/R7Z2gMkx9FHT8FXpM
X-Gm-Gg: ASbGncv7j76F5R6mR2pENnX9dq5QjNxF1dqV++pD67AiAEaT+uh0aXAIxqZs3fmjTi7
	cFYsZX9r5+EokIDqIfVYEJe5ixRwAzGFX76S3Br63cHjLP7g3CxILL27xfGFy3CjexNf75psfLm
	5I1faAAXFeu5cccmzhKfPVjTr7M2POiuFb2Ax6/5diFcBUdtSzmfxpC8nSPvD7nNdLxppch2kB/
	MDn0oUn3foCf605XQzP1V8SYVDd7iOI3bcYPFvYVXtgc9jJXc1XQYtO/mGYYL70EUdM0Ron1RV8
	naWHwvCgZBcTDXTA78KuA4MKlloKyvUs5i+XlCAG4OFJlyGKzjIBMPPSN8nG+jmbG59wee9affv
	PGSM2klWrCXgDl07XxvDedUT9VhoZP9jU2Mdvu7sVKYzzwFA=
X-Google-Smtp-Source: AGHT+IE3ROZ02+joJ2/XZJxRG29EJhUFoJrI7FNVppCcYvvwFIRKg068dmR6hVYWvx4Z2peyKUSMyw==
X-Received: by 2002:a05:6a21:9990:b0:23f:fc18:77b0 with SMTP id adf61e73a8af0-2405503b99amr21712828637.17.1754920582044;
        Mon, 11 Aug 2025 06:56:22 -0700 (PDT)
Received: from [127.0.1.1] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b422bb1133fsm23585496a12.56.2025.08.11.06.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:56:21 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 11 Aug 2025 21:54:45 +0800
Subject: [PATCH v8 13/21] arm64: dts: apple: s5l8960x: Add CPU PMU nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-apple-cpmu-v8-13-c560ebd9ca46@gmail.com>
References: <20250811-apple-cpmu-v8-0-c560ebd9ca46@gmail.com>
In-Reply-To: <20250811-apple-cpmu-v8-0-c560ebd9ca46@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=914; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=EpruOfD/q+EFiyB6qpD7d0v6HBQIo5PobeNa2WsPEsU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBomfZCtrzCmJINFsXMQXuzK2KVaLhmiAmEiX6pC
 KGvAhErDLeJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaJn2QgAKCRABygi3psUI
 JGc/D/kBKhTM/DhwnhpwrT5dD9zmHbMRDZ/2Gctppczw581p304TYK8ymzYJzSShDs/csnIxEdX
 wXCIgVZ4WPGpHsmGKztkwdiV0bwTVYUxHvH7i2sONq2GPdsXnfIgC/74gcyaAYCaCA6UpMKawuD
 uSOOATu5GxQqnlDj1iyeSrXCvrs39uwo4B69Xb9I6EBBm93UPXoOBB15C9t0xszzyKp3CymnroM
 1s/2aj8bWzwrvylETXxxQuycD6N0kZMa6z2XS+fKINgL8eDmDWa8Te5nuU6dDcsHwsQhbwIjeUk
 rE3lIgPv8hfvtH5NE8kXB2KpEogwnYwJBBwKRPW9bIcpc5EheKUCO3zzr46y7gtNr2uEHtRCn3q
 gih+zlEDkYsAvde2+CpJ4a7taJQ1nx2IjJsQtkXuoUoUYT2e37rtOxbZrjwLzQnJBk8tt6TLB3H
 zae5WXMNods5BriqOB5em+/G7DZW4RHiNZhQWyLLR/kwsYaHuNRoL1S7TzPlMgW4xaUjfcpwfvx
 Nwmo7eCk+g9+iG7qbbFZJUZk+PoboVP854bxxWW8Q0k1+u1myiatSfOHQg0YUFrcSaxEjviCAej
 RZ9CftokBd7yIlrDMJQkuOZEZ7SSjIEZInj1sTul6sOGUtibs2ldDbuq3cPphV9bXHd/MVKA+Xn
 k1qn64enML+Lbng==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A7 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s5l8960x.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s5l8960x.dtsi b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
index 5b5175d6978c45052ded495fc0d18ee3a8fbfdcb..1a3a90f7b9ded42e371ef0b41057fd3081579615 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
@@ -151,6 +151,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,cyclone-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 178 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 181 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "s5l8960x-pmgr.dtsi"

-- 
2.50.1

