Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482C81D799C
	for <asahi@lists.linux.dev>; Sun,  1 Dec 2024 16:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733068849; cv=none; b=gRDPdnV6OZ7JrdUit2+Tv+0WN+WuanaiyWAJkTMBIlCejzxBzE6uZez+S2rahwbAiMrykR4GPA2K+F7n6akf5F+XLSbtdnPjnaYzLDP0AlEDPmGvtZMCf1rfzWl5UaLBKbK87RUIfj5G5DJ7UBgdCbCFTSBx89JGOs0mrjh+zK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733068849; c=relaxed/simple;
	bh=JMWpSydVPFwLIP7hwqHVLy9mm0uOzzCuwbbtgb+K8o4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kuphyJcHsxR0DH353FuIDS2Bl3lsADKlyuXMjRuSlUMe39kOh4mYTsPF8IeuAgD0UsSe79gxhiu/ydvlHF4cjucTHklnzPBf5rhik4IexT2dIF56oHj2y5+rdL36d5KWu1IbV6rXi7RgLwj37wMY8PoRwLtq6Q/IRlAakjIRwW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OR2bj1hc; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OR2bj1hc"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2e56750bb0dso2421638a91.0
        for <asahi@lists.linux.dev>; Sun, 01 Dec 2024 08:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733068847; x=1733673647; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5TDeoespPvIrlTOx8hDFrx88LNZsHxk3XgRr9sFcF/k=;
        b=OR2bj1hc9N4AKyRyRyouW4raPuirBJpdV5P7CGfvDhdbxbCNyxoU3d4JS5wmcuSirS
         YFJXRgQbqqgVaHJnjcQcl1ryUkMy70unOxq6iUCjRmRSg8wz7lZcj3wyTvkg81U+FWjw
         r9UFchXY92USwOA/DUVXu/smkYIxj4aIiTze5ZoMuaTcVbpkGFdgk0ooFsbUs3Cg1ml2
         f1jcWf+xllQDmhpN7x0phLRlg1pmkV+F84BHmDoUi6N3nBZn++aiXHmpxSYyGBb0j8vp
         ngf6vau51uYXfTUf5/IwKEx9b48kxb620S5k4v0mz81HNjXhwhzyKsdq5AOjjM1wVS9E
         /dGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733068847; x=1733673647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5TDeoespPvIrlTOx8hDFrx88LNZsHxk3XgRr9sFcF/k=;
        b=NeXwUwj08Tu6hf4JNh0fJdyQvqO0ugQkuudJx2+pfITlVje90W7g8iO1aeA7Acy31R
         4ckzkHEMAvISH1Wzsw7d2rh6v5LFQvRpIKkLHs14SDj3iW0PK/Mh97EihF89xZVS632I
         l0GEwN88JfUj5wcIbiA9c/YhYYuzsgz5VByuyQL873XfBg9NklEepyYufI47asSP5FCM
         Q98OKxGypGbhWCRVx14uDEzCRQ/I6nHZa8g1ODvpFYWf/8jAOSmVmWDJZMF4ZSuyAMQU
         rVx6D8oJOfdfa4GP1toHc6blAo/jHxOiwpTEwevAGDWo5/ie4MIwFEmgbEFOzqhIUvbh
         dZ9A==
X-Forwarded-Encrypted: i=1; AJvYcCXrgqdww5UFje9mPNA/yIUYMxpHKVsNbvp5jj2gxilSSfCoqIFVppGPrN8NiqX6k1j8npOOPQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxCPt7OE+4pl7NLPKuPfL5Hh05/0m9a7fOLrrQbkufNTUeGcGOY
	bFSN6x8Yh92UQgy30WLn+3vMS9/5DvjVcUuPRpUGn1XABdoptdnX
X-Gm-Gg: ASbGnctqZLuy+qgTNAv1YmnZhCHOuaHtCSxZlRn5ABGIBfEXcCs7ScypmoHe3PfJUH7
	Ap2xLW2Q1FEEQlzrKhHlnOLlaQEI1VRZev4ib8Hxx8s2o7TKaAXhK2My8DPP4mMgyPBnr2KjfxE
	o1GDMWQgDLSuXiNb4NQheKaGyf8LrzEqc7Yf1iq4CtQwBJjkNKR0rWy/ei3brLutSkHbbgqIfB9
	zURk/JH6wA1DL/GTfmXgTVeprIMfbj7ao43qtNnfuu19f7qgXkPrwudo+Px/MK4PQ==
X-Google-Smtp-Source: AGHT+IGrv3hVqmAY6jnCNt/owtSORP/V6bWy622k5imkOMd+IKJHnRO+Fqx1Qyrr4NmirwD+yWdaMA==
X-Received: by 2002:a17:90b:2252:b0:2ea:8b06:ffcb with SMTP id 98e67ed59e1d1-2ee08eb2b91mr24578454a91.14.1733068847505;
        Sun, 01 Dec 2024 08:00:47 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2ee6ebc4a73sm2395173a91.0.2024.12.01.08.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 08:00:46 -0800 (PST)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 02/10] dt-bindings: arm: apple: apple,pmgr-pwrstate: Add A7-A11 compatibles
Date: Sun,  1 Dec 2024 23:56:39 +0800
Message-ID: <20241201155820.29259-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241201155820.29259-1-towinchenmi@gmail.com>
References: <20241201155820.29259-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The blocks found on Apple A7-A11 SoCs are compatible with the existing
driver so add their per-SoC compatible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/power/apple,pmgr-pwrstate.yaml       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
index 59a6af735a21..6e9a670eaf56 100644
--- a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
+++ b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
@@ -31,6 +31,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-pmgr-pwrstate
+          - apple,t7000-pmgr-pwrstate
+          - apple,s8000-pmgr-pwrstate
+          - apple,t8010-pmgr-pwrstate
+          - apple,t8015-pmgr-pwrstate
           - apple,t8103-pmgr-pwrstate
           - apple,t8112-pmgr-pwrstate
           - apple,t6000-pmgr-pwrstate
-- 
2.47.1

