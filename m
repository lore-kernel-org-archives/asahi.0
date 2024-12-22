Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDD419149E
	for <asahi@lists.linux.dev>; Sun, 22 Dec 2024 17:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734889094; cv=none; b=XaZGu3OkTcsX2r1CE8IrusBiOuKpiZbahnl259ApBComCaG7gNS/BBpA4ewaaG8rRZQK2ZybFk+teG+zKFUf1Pt20emVGt7G29G3G+FT30H3i4f1Z0tzWSTawqGqxa3NLXzL5ATI1Xl0S59N3Ro38qDD6nwpwmEN6k2H1ZydzP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734889094; c=relaxed/simple;
	bh=99+pLF1VvDcoovFOPcNeSVJ7IG/4gdQK3UKOnT6V4Zc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s+D3edE899mo4cmmsLaNyf/HabjSwKSTkQHt/TMbWTyIurNFKeA2u+sRvDFXCkC75tQisdlOeGLGQWjM52/EmMr12/QiWx7aUj5WKd3G8td7DyjMaubEw2qQGHT0OqmNVwBd2Z+YtpdGemsisRts9ZyfgS0qzSijntQfX4/8Htk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fdnN8Lwj; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fdnN8Lwj"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2163b0c09afso31044725ad.0
        for <asahi@lists.linux.dev>; Sun, 22 Dec 2024 09:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734889092; x=1735493892; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eyr6yNUD2cI7FDLN2P5orlGmGipVdT5OT8foTnjmml8=;
        b=fdnN8Lwj8Vp2BmVMklDMZIjPtIhRTbg8NRH+0SXcQWsVqDBPRX7Q/eIy871IqPvX7+
         BAVMRvM1xDeyNewr7PrKhjin44128r2Uy/kL+lhgRuaHu1kGKMnZ+1+xz2IMj7Mauutu
         fazk5iGpyOUPxsGzeAhzWja4P1z27Ic5kalxooMF3pKxTqwpoOv9eE6/yVx/ercF+eFp
         /pnq3CEwmjhqbn4Y4BhH6/Fz/GJfGkoywwUqRZWKQNec1dMi/wQyAqn2E9MY6uT5ysud
         0YCSUjRABBoxDD6vh55cvsRFszhYvAEe9x8GL+QxALiauNF1EMKk+4Bw5pBckFEAfKjC
         yBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734889092; x=1735493892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eyr6yNUD2cI7FDLN2P5orlGmGipVdT5OT8foTnjmml8=;
        b=jvQ3vcsuGjO3upv1jNQ1Logv0GW75eG/8lzeejBoro8o1cujLQDZXmYyn6A5FU+YNj
         IrHkqjgMbYqhDT+vxIfh1p2uiLAdmtSLdpJe5NWKlJqGTc6TUyR4VvLHFDSnkS5b0pxS
         FIZ0CCGSsArALuAf2oqtBVFaiOyJUnKtH0ZDLlqFWUtK+PrZUHkgiN4/X+jpW1ty5qH+
         6cD3dnbeF8Re3/SVaadrgbEhCMOrX4NBfkXWvOHWe7mUp47N5jY3BIj1EdwG/fzgyyVy
         bq3GuafxxKNVvpiORzTJdzrcyr6AeN43rAdo16TwNecLnpA9hYGvjyBCiB5diyNbwVJD
         hxrQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4ySQdlVONQhRlN6mbAfIdyfZA3M/06GenKbaq4wQZo4Xq/biytR74MfogFeiYYzGYIyB5Dg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzi1bVb33rzvOOrQXeysEe268jO4DhLilcfjYYETVsJpM9mQMIw
	dZv5eXcWsM+5M4/BrCsSpqnOQn/QPHE5kI9jgwpAdU2akceKQrUf
X-Gm-Gg: ASbGncu4Xf+Ot9oiXQFNcK1AjdM7DF5+8D9zfdVePjpDC0wwpsQMpv3PP2B4fsxNJpX
	382TdoimtuOD0CABw7sznXwIN+iVlnbYO3LljE2jJm7LcgrIAtdOc4hn2XaTRNBMs9PKSJecn7T
	j6w4hmTu+ZDLru5yP9xOCIE7kReYTjiZmNe/9LfZ6Cax5fCK1aluLXuCNTtUj7KXO0HMtUivy2h
	rUrc8TzlifFHXxh4ovvlCNLVQT3/z8RSWb/SmE6Qh4CU6zCd9s15HCUaA==
X-Google-Smtp-Source: AGHT+IGg3A9VtGHmKoL3I6uc1+KXYnk62Tn0Sq2QNU+0LcqVq2zEWgfuaUVJiejhoF41amkKc4KnEA==
X-Received: by 2002:a17:902:d582:b0:216:282d:c68c with SMTP id d9443c01a7336-219e6e9dff9mr154141555ad.23.1734889092510;
        Sun, 22 Dec 2024 09:38:12 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dc964a73sm59328175ad.45.2024.12.22.09.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:38:12 -0800 (PST)
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
Subject: [PATCH v6 01/11] dt-bindings: arm: apple: apple,pmgr: Add A7-A11, T2 compatibles
Date: Mon, 23 Dec 2024 01:34:51 +0800
Message-ID: <20241222173750.148071-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241222173750.148071-1-towinchenmi@gmail.com>
References: <20241222173750.148071-1-towinchenmi@gmail.com>
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

