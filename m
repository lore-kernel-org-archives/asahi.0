Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6C12F90D3
	for <asahi@lists.linux.dev>; Mon,  8 Sep 2025 10:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757325706; cv=none; b=AwxnXCafbjT/GQRmBFnSk+Jq5eiqbA6uP5anzG9ZovOvmf6RykXbiWBHbdGxDq5G+J2Z3wOzFyERtU9D9iJSu1h3O6d3sJtQUhtSk/lATmuJ9Hb6//TkwjGC3eSK3D1ymmDozto9X7USIFMtlnE24F/5jzszFBXxfZIrgnm8AG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757325706; c=relaxed/simple;
	bh=XiGGX/gYUODKcUIpICueRO0ZWhSBnplWOTrgw4sJMTI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TQGsQvCIBkphznY+XSU1arYf0WB1d3ssaGhmySFQNThIV5Y5mMBORdalLti7tsHmBgN4fcUYSfcDQJxGCNlRvNVRHS2RvjT964KuK88yG982pU1z6iZLmqwuwp/6GXBgVYlJLWb6HJzLjEAA9UGVNiOl/z6cZCSLNALwfGgZO0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kcyL2/0d; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kcyL2/0d"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-244582738b5so34079115ad.3
        for <asahi@lists.linux.dev>; Mon, 08 Sep 2025 03:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757325704; x=1757930504; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gsMRt6a+0MtEqKde4YWuihoSzMbsHghVTF7OAbgmvz8=;
        b=kcyL2/0dyDrV57DhfbNiscGAe8jSaAUO31z1vt0vqDATUzsI8WiHN94DI9YsvyN/4c
         wh8lbegmY+FqscuXkYF6lT7S27ojaVZO1qrIxXkoOsJQD2STg0eqiUAGuBzD5mOzqAq/
         gh8cp3MVG7vNWeKfciKw3VvfIRVbgl5kTuCeYwTQMVA1y8mBEXwAFXwu/zst0GuY/ANW
         knK0JiZFDj41vMbGIDn6GDf6r3G3Uz/0YoJSZMGF/1qkGQ4OZPOkRGhJW1UQU9ddOxwH
         ODXRmZtF0j/xc1JoBdqAWLiokvcDh3ehrUam0H8YuTbZr3miwAm5RpV+rGhP4da8to1j
         eAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757325704; x=1757930504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsMRt6a+0MtEqKde4YWuihoSzMbsHghVTF7OAbgmvz8=;
        b=GqoAxKJoCdEfgKKoVv+RQp0xsiL/RJYUHgo6VW2PgcIJKEGD86+9+VxxY3E0S9ZkAu
         kP4RkjN58f+fdBAvM7ZRM9xXRPC9XWBcNtUbYsFvCG9VoVP3LisIr75W0ichbp9hPzwS
         Gns5GjhAcbX8T9PNhA5k/3yRwWGQ9DnkVrqLmMI3l9dlve3Z1IJXPrcw09UtcMQZsPX5
         XMBKLFKCppoga8+rRC4WBnvRee1ONqnnc15Qi+Wa2ZDRtLVG/fhuOnJMm3VpiWj38ODl
         zzuSAXwQcWRa0PYxY6tr4Eb3UtjW0HSVeLVWx0FHwrVolnd5kjsoe88h3u3qqt3d+omS
         5yRw==
X-Forwarded-Encrypted: i=1; AJvYcCU+2cDMmrjxBJsrYc18/g/2uwxykLjLBVQlqYwXqdn9qY7JtGv4Gh/sfa7pQOTvwGZsiL8hAg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxVDTDxsqXfGV1XPyUZaPC8dXNDzNssTcDYR2HjtcG2XRbBuQto
	ahxVT6E3VXD5rIYZcl5eE4vQs+LorYT9Q0lxIp+EJiItZtrC4tXRYcXn
X-Gm-Gg: ASbGnctI2vCor783HhaDUaVKiFQxewsi8OKPq9s8V2lWVj66T48uD5QIEoqjuyi3d54
	Bq2bnzCSirbildjmiybo0obIxYgiFhiWW5bURx1qUQ5tGaSaIaE/+/dfKkwTYifypFJIlcvE4rN
	CWKTa6zD9jWUhW69I+e+77xboHl+W6L0cF7CdiyoNNKOCy/LqSLpJXl22Dno6KIxN7w5yD0rfZ4
	cJHQXGqiGl2WqsVN2FBkk5iWg2aW4kV4sB4vdXW7bK6f6m/8SDKy0MBIOI52aFZOgH4ckg9DdVf
	e3Gmj/JrOIZyF1veFTt3meqqlqjG2USOQn8Xi/GB1+cAXmb2dkgz9e0HwRqD/BY5dXdsLIdDDaY
	WKAvswt8fl+LCNXEFT3VtFwFPIrDB28Pzu5G53g==
X-Google-Smtp-Source: AGHT+IGWrFFeN5OuYsc2+jqffuPG2Hr5NStgaizfvWwDUNYrjOwOl9gETEIxQibCu9QxuhZoPFAr1w==
X-Received: by 2002:a17:902:ccd2:b0:249:f73:bb9a with SMTP id d9443c01a7336-251759a7cebmr75603215ad.51.1757325704077;
        Mon, 08 Sep 2025 03:01:44 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-24ccfc7f993sm107826545ad.63.2025.09.08.03.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 03:01:43 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 08 Sep 2025 17:58:37 +0800
Subject: [PATCH RESEND v8 13/21] arm64: dts: apple: s5l8960x: Add CPU PMU
 nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-apple-cpmu-v8-13-d83b4544dc14@gmail.com>
References: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
In-Reply-To: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
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
 h=from:subject:message-id; bh=XiGGX/gYUODKcUIpICueRO0ZWhSBnplWOTrgw4sJMTI=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBovqlEOIKfaiGjiWT5qhlwzLyEPVCQY/VJwPgay
 fLx6J5fMyWJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaL6pRAAKCRABygi3psUI
 JCK7D/47hGQ7EEbYb3RiVEfPUWL5oGTUJJuyrEfYATok2diZbfaO8vsmGKTDnEmqtKb8gqU+2n7
 Lp6zjhh9oEjKyRrzDCkkkklAINjLnHxx7H26yAlasJddrqlaH7kCy8plaLF2XJ6M6QSaN8QTqOn
 lzyI1mnllthTYxE/9HN9qXHReNQDyfU2DBTuI2W8eGaOZ55tqbCkrqUJ9eDRzcDs/teI6Mog8tF
 uFUki4yo1nji2ZfM5tYEPEWsq/cwKfp2HLbHO9HGORcl++fa0ulK1l2lFsCHGXMhFpsItUoATlz
 /yel0bcv+HY7DXJ6S8fG1IHJPp+x6HSki6RiwuyHZDON21iabzcb1AuMF2jeYGPASvBBDSxyFW4
 J2KgywRdiPunrkLovWNtePU5yquVzgqW1TaTA+B/mtDJYmbgGfucHP5QF6DsJJVXOgMS+ZqbEPr
 zaF01qsBjk/QutseSkV90pKuIUOGYFJ0zFwPF1tXd30QXJ/+4ZJhq46HfG4/+1POdsdX1VAMhz5
 aiOFVzqmdR3Q2StZuFBqPGJN7fVpDeEZ3UFlyBzKkXEOS1edsss5HO+qklSxis7yDADLnr5A6Bf
 YQ93e8rBpV7P/nz4rlR9VEV04XXOdzT20JF9LIYVYiMdOlZbu/iTrBqGWOP9TwzY0MCU8j12Sz5
 dOTPL8I5jJybKiQ==
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
2.51.0

