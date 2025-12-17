Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B27434E761
	for <asahi@lists.linux.dev>; Wed, 17 Dec 2025 16:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765988725; cv=none; b=gnLvN1HavjYg9tYfHKx5lTLOU+niUXuaChZkb20ixhcso3ycuTW5kiPAtvDpxjOz05Jv+bc3GVR+K5nPQ5tGopOYRz09NXaW9h6dEqabu28jl2V8l5iOjY68WIBeKiqCE348TYBQmOQ5qPTXa7mlrJyHHBvFU9S76/K20+7qObU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765988725; c=relaxed/simple;
	bh=6LjbldlF3OoWMCnhY7fHqRvAfCOGSBQ1ExvFhoCzNxY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YZcjUTUbOBTOsgpiVNaJTAIPsYqbhJgBNopux8RiUPKDlA/mump5nNh1DzioN+xd7VjbIY7cvG82SJtxQHtT1cnRpZWDnsFcrmZRTxPWUDJ43F353B0xl1srIH0j/3x8wyFPYwyvaxCk2Pdfvd1bzaOxo9ItDsw3c+QhXuUdIWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XKRZ7pnN; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XKRZ7pnN"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a0d52768ccso45614045ad.1
        for <asahi@lists.linux.dev>; Wed, 17 Dec 2025 08:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765988721; x=1766593521; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yx92mpsjRydjbKNezVplOe9ZgSTsezLCchII9GIIrGo=;
        b=XKRZ7pnNBqvf+N76GRMYoXhxxoIWwpgpK0Cuiq0dwgX825ifM0q4Xp+EzxpAsvC048
         qwY3R6NiXPfZJJPCufbs9sCX8u6Qwux3WRcrRXfeA7vnjzNAOlYfk5ezIdR5zP/AA6ys
         O0mXHTfyjzb/PdqIQq0yVn9WMCc3qo7y0z4meX2Gw5W7C0UtN+vZ14suKgXhIWcy3LFh
         TGuyafUtOTkWZE+/HTmFYnolmSJgRPNhM094mUbPv2Tz1ztgXEHS4n8evZTEC0Fbbah/
         2MzVICe/mLFlA/e9WduTWwNCvzGJIhwafGpu7iszwGDa8XdaMi9a3IvniUgsGRJKjt5T
         qowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765988721; x=1766593521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yx92mpsjRydjbKNezVplOe9ZgSTsezLCchII9GIIrGo=;
        b=luuPbCaojysYLXU5bcoI9DvIuDO85IMXasedU8WspE2aeRciUVwOZbMGojbNdGm35M
         byKPWqDS58Fm/iozBMmY6usdXXTAhStmSSYSekSuGxkLNKt4fkBt+aesYrIRels1GhQa
         VcHhoTaK8hSZZWJo/vcYBcFofYJVfnc4bxRelAv8ddTF8a971raEhcBcl7WQiwBIbVjX
         lAuA72iXr9E7bNEdJflNncZ7jj36QxQMlMNHqsBXokbuPcfNa7YGhGduDOMYV4Q5+lzR
         wgrz0w2ozJgLqP8BBBKEyGsWuEYuFH7B8IFkw8imJqUgwZrBEJ9NJHoDIA8ynzhg4/9t
         T7Xg==
X-Forwarded-Encrypted: i=1; AJvYcCVhZ1PYzwdi3j1TLMgGIQ/fMfKtipy7tkYozy+f4DjaV1ZrmeD0mf2hKkURwv/6zJes8mZo7w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxq9ddLkVfy8qsTfzyY/si24xF9/5B6SEqONzD/zN5TNtBrybkz
	u3tRBnHEojrCc/IoP6B4siNli/nPY3GmEJvx2I1DrdPNWDgSSE4XgBN95ReXd4eo
X-Gm-Gg: AY/fxX5d/CvmW7/vypEGBm2CVQNHZbTgFxwkNxBkhInNyRLhEVLSH69PTvTv2r1uqol
	rVfWMeWFSBNCWPBk/OagYXqLo3wlp9lWTogl5sYiL7JolrSUL0/JrEPw2uiEi+LNAdUhsiAmt1H
	vvD8xV5c/3vm8XsmM6yRPZx0jLx5s+2E+i8eStCWiZN6J7hw+BA/5ceEvamH7r8Ri5yNdhiGLzw
	G2rTTq37/N6Va/+jVF2PzkSAX3KEi1CQxRLxKhYLmGU4DN1FDqySRklBdICLrgSiBWfJHTfscOG
	kky54Cxf+z6HTy2I/FmvqTRnJpbBfop7cfHi+Up4aFdQc/bJbc3rJjn7rp4U9On2SogIru8OgO6
	VQ5T+VMJ5i0RnAYce1evp5BqGlUE+RPFVUTsM/cpUVGZwX8X9qLprLHDwMoJmQFFxWH8D2LmLJ8
	TZIJfyyy0lxQYj
X-Google-Smtp-Source: AGHT+IF7B3HOGs7poX5/sJEvWU5wHnYg5DS9Wk9uSkNrADU4CHuaQXTQoglGtMoHKKgXqB8/eL9B1Q==
X-Received: by 2002:a17:902:ccc8:b0:2a0:823f:4da6 with SMTP id d9443c01a7336-2a0823f4e6bmr133717945ad.50.1765988720769;
        Wed, 17 Dec 2025 08:25:20 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a0b0687c62sm122980415ad.88.2025.12.17.08.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:25:20 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 18 Dec 2025 00:23:26 +0800
Subject: [PATCH v9 13/21] arm64: dts: apple: s5l8960x: Add CPU PMU nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-apple-cpmu-v9-13-4deadbe65d03@gmail.com>
References: <20251218-apple-cpmu-v9-0-4deadbe65d03@gmail.com>
In-Reply-To: <20251218-apple-cpmu-v9-0-4deadbe65d03@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=914; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=6LjbldlF3OoWMCnhY7fHqRvAfCOGSBQ1ExvFhoCzNxY=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpQtlBWlRtK8fFZOggW0gRKimen2m37MOO5vrnf
 Etv7BkdrRuJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaULZQQAKCRABygi3psUI
 JIT/EAC0nDegP45eFiq6zKOvzllfwjkCQO2MKS5faldtXHkXIwSRRT8b7VeKPzBD3X52sVnN9+F
 lpFKKATIVC4kmxROD/OqVnvW1nhRsdPo7NupCCpzC1d2FgmJqA9WZx+KSPYpwKL63hiEKNe+YEd
 +sMkijYl/9qzwLf0qL/K2S2rWg+xh9AgWYHpyw03Ec+76O6IcKBQQP9KJ1UVd8m9scXbweOVsgX
 s+008dpPi8RPfSbKL5ONyq0CP7uc/rOv0pwwSGBq4s1ijYa0CbDrEY9wUBr89FpNenZI9Heo9JF
 PbtFtV2DdaUxjCVeOo6JwYUzZLwV5nCBU8QDBK8CKCglDYLl+g5ezH6VjnHTxq2J38ADkfFhgao
 646jhqsLpzBUfgv0fCbqPPQr5HPYVsUHD22uidyW99begHvLY2ya7h7lUpdE8S5oGBkAU1l1PqL
 JAW0HU0xeeEmUo83Q43m3t9+khjoNvU6yG+MiPcIJcfv9pwKDoGsxp93Qh3Q5HNeos22cnHyhoX
 4csuVwEL8pG9P6ucMtRVQS3bG6QxCAUvw5knCbNaoYJdoDhycRfm1uwFRbzFLaT/l/CszXl5cwT
 20Dj8u8rVBJJJM26yxbBlRDh2vHsKbpEARB81h0FSlLwMtEEczin0405Pp0SRinzk20zCc0u1pj
 nf9XufhyGMKQxog==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A7 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s5l8960x.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s5l8960x.dtsi b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
index 462ffdd348fc893d8e1d597b11d063dc5f88bdf3..d7a9cf1bb4911805a946d64e5892c1fe4b832186 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
@@ -227,6 +227,14 @@ timer {
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
2.52.0

