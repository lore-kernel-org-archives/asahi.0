Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808AD1DDC3E
	for <asahi@lists.linux.dev>; Mon,  6 Jan 2025 12:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736166510; cv=none; b=CmOxOl5SI6hjXiOV6bIqfpo2nuNELywrBq97jaF49osOkoUs7L9ar/tmz8l30L/YSughaYV43gxPbb5r2SCK+s0uLGZ5uzoupisR4JnmFaVEZXsxrPL9y13ldOEewgChhGyANcUIF2XZGj2xWxAVjeJlfLHe8n97QvlgoyNZE1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736166510; c=relaxed/simple;
	bh=99+pLF1VvDcoovFOPcNeSVJ7IG/4gdQK3UKOnT6V4Zc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZYAqOvN2R++fYGkGtoB/5vkSH2Ly84GEhI+k1QBKkEN3MTs5ei1Pf0Il+5HVxOOBoDqrOk5GriNPrcHbrsJN5idctQixYeoovCPEkYmcCFzOvyth654RlXmUjsZGE/Q+er/b232JIOcsio1L70+pGWzpQqmxw9XtRRdIx4p9T/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ze2n6e1i; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ze2n6e1i"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2166651f752so4168625ad.3
        for <asahi@lists.linux.dev>; Mon, 06 Jan 2025 04:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736166506; x=1736771306; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eyr6yNUD2cI7FDLN2P5orlGmGipVdT5OT8foTnjmml8=;
        b=Ze2n6e1iEgo0SDU2GJrPVfp/6V7kKK5RIimofGdsSjAKH59z42ZjSe5jZLMUP1BfAY
         DPerG0DCAkY4c5f/5ycBhkYLLzkhKZSjR3U3EqfZCX2u2DQYpM7OHMwQbbddJy+1WMRb
         Kx84oHpzy+Bd3FkITs+F/6E9XLIDa0VA7uLBlbN+K1vsY3Z8iTYakMmttM2D0ZUMy7SH
         RqKKlZHfbGLTXxaXdikdE7bOrSSSevT7H7FNEGyfb1YF+fivDtd4geq2O8+quypF9X3m
         TgxQksZnSrP82thlvuBZcWscgmDtQ8Vh8/9LWnegJmM1XWcHxqtMdi3eWIK65RZul8oZ
         mOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736166506; x=1736771306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eyr6yNUD2cI7FDLN2P5orlGmGipVdT5OT8foTnjmml8=;
        b=AfLQcSsmlbG5X/BmFTrcebfqAlsHne89pkr1cO8fvtyARW/1c3Vt0M261p85qYcayT
         6jYnDd1pO7MwZsglIg6i3kYrQQAbva5obnayWusbNreeCHmionekKnJEcFEpx9QVVrJe
         5hEh4pZK7yqVPX11ihCCDB+kqgtAPHChjfTDWK75YHJMSRLr5EuVTaK17QDtXEDJQmlT
         Dsy0uwUQZB8aN/dIazBpkdNJmLhXRR6QYm+2qP74Ads/bVq+BCapIavfqmSIO1iqcSAZ
         prLMgqZUNleCRNBZYJBJsj+ttMdJrfkSgFxmxtLrYkLYMtbKV5hCDdjjFaXxp1UwHzfR
         jkcw==
X-Forwarded-Encrypted: i=1; AJvYcCXidb7uvd36RS2XtVre/Q6p0Kkw3MORaOLbKhtnWwOvXroFqdaznvfwO+WudtAFi9z/Z2qVKQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5uwTEIArvlmbZTo7fAMslm0K4FsHWbTrIMVGzU33AjJUqf7RH
	ygdDT4NdRWYoq/NvVTW7fcmI60IVWvk4wl1G8Kjr6m20eH8pdd4A
X-Gm-Gg: ASbGncv8ZIDy2h0GAFp2jMjndFbp1ycjMW7PZxeCMMMCNvUOai3Uk1tgCWpXRmyszmR
	5BuxmkEVFHOsahDef1Lk54PKp2niv6+gSy/9LUVhQNx/Y6SDAET5dGMRwUb2dJP3guBH0NZQ5Kh
	pEnQgqYB3N06+gP79N7MhPt0rKQiZiyfWQFG35TnuN1x35IE94mkKofgmSfcPe2r2JbtDIMPnDg
	P8Kl2kYUQNikWJYsTTWaosB3lpIxqJs9mQn6fHMzfWF8NaKPHDQbIaOtw==
X-Google-Smtp-Source: AGHT+IFf+AEJ7fqHxRfEDQ5692eQG5nVRbgR+HyTlqQ9ay8KL4zXj99jnd9/Z0cp+LSzenKZljEDLQ==
X-Received: by 2002:a17:902:da81:b0:216:61d2:46b8 with SMTP id d9443c01a7336-219e6ea1c0cmr855329215ad.23.1736166505667;
        Mon, 06 Jan 2025 04:28:25 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dc9650bcsm292678655ad.39.2025.01.06.04.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 04:28:25 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neal Gompa <neal@gompa.dev>
Subject: [PATCH v7 01/11] dt-bindings: arm: apple: apple,pmgr: Add A7-A11, T2 compatibles
Date: Mon,  6 Jan 2025 20:26:18 +0800
Message-ID: <20250106122805.31688-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106122805.31688-1-towinchenmi@gmail.com>
References: <20250106122805.31688-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The blocks found on Apple A7-A11 SoCs are compatible with the existing
driver so add their per-SoC compatibles.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Hector Martin <marcan@marcan.st>
Acked-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
index 673277a7a224..5001f4d5a0dc 100644
--- a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
+++ b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
@@ -22,6 +22,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-pmgr
+          - apple,t7000-pmgr
+          - apple,s8000-pmgr
+          - apple,t8010-pmgr
+          - apple,t8015-pmgr
           - apple,t8103-pmgr
           - apple,t8112-pmgr
           - apple,t6000-pmgr
-- 
2.47.1

