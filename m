Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38FC69D31
	for <asahi@lists.linux.dev>; Tue, 29 Oct 2024 01:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730163984; cv=none; b=g3zzbqCZeNWz4D40KUFKzKIC8iu7RuMlHr6T2Yx9ptVh0Gext+fbtSzope/0IpSv18by2nZPM++iQ4Gvw7wD/x5Y8AENJ0Zj9e0iiq/33nmrkmVdZw972zCGMyqywPOGLWCPg/xrnvOVJ9thr0Z5wyJo1dg3U1rwyIv1YETvbq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730163984; c=relaxed/simple;
	bh=BtS5sZwERe0fvOyFzUSqVS+BDMGGGQIidKnRLUXm0kE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nGZWahTr3svrfrSRN3w7QD7q9Qu5Yn5kZOYsqK3QIFPk08BMictXQFF6pcPtdSoXK9DpuAcETNbvNiVAmV3qF6phLbdjqfAspil9rQsd2/DRwbAT7nnxWFo0KHHlJMf6JkJUhFR0hw0eBWbXWaetAacMajb8OQZWWzkz0oSNaSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e/zcbmqb; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e/zcbmqb"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-210e5369b7dso10764385ad.3
        for <asahi@lists.linux.dev>; Mon, 28 Oct 2024 18:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730163982; x=1730768782; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pOQqsdvD2kJ7hOf0gc7nGs2u4WOLnq6mE1rYCDpzVcA=;
        b=e/zcbmqbJ0jYhitKmlf9tvACv7EoZ8JZ8hGCAU9MXUqRRH20NWVARh3yJTuDFMoh4l
         +nIQGwqtq2sr679Oqbbjn/lBFnpDwROw30tcC05V3g6oz9eAKXuzyNq5+/N35kx7fq0O
         pA+QZhmj9aRSzE4BLCvKOQOxK7Pl5CjSlEULXdCkkJ7V9bhVsY5ux05RHcyMCdyLtuoc
         of9nd9WOMdlOYcdWVpgG68I7g7Po597yspw0g69+asqfdcvk9PjyTVgsObHca3t7Ab4J
         hwK+oZU2robXg+frebvC+7lt2jvE+GlP/jlLxcJ6hPP2qpPcmv27imjta20rmFgrQn8o
         d6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730163982; x=1730768782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pOQqsdvD2kJ7hOf0gc7nGs2u4WOLnq6mE1rYCDpzVcA=;
        b=jch3zFpLemtDFuLe/AXYPR8Kn79M5vrzzeM57n5bb6sQG+jA3HwxisoBkHpDHPcdWN
         kBjP6kGyd976tVmmAgux7EjNvj3TNQyYQU8yNeFfzOecsr9ta7FGZAB4occYP0lVza2I
         ou8cYBrX7R0nXpeZElcs0un2hccDCSFscDkq1MMkxTTrtnhpxRqzbqgBW7H5ZW22zmZg
         N3IIXpnCyP8xcl7ZYP2cA5m28/kmuvJjpePnQxGnRTkPbF7feEItSZX2aDBnf0Wk4+L9
         ne1hvxiT8mGfaGXxB8dVFKnsMPIiD9caKzvVeKv7fvnAGiBBBNeOzStqi7eFRTNxPZgO
         iKYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWA6Hc4dNZQ335GaysX0v4g5f1fx7G2WZotZnY/LoLsv8gyn8KW0ybAZx2seWrd+bBY0IQF9Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzj0woY9UUNz5Ao8IK/+ZA1S4Sh+d3oK4R6f6JKUyI0UMQhZBCL
	9mxWbaBMrQ1TE/lBqzofIbadnLPAxCmDWjmEjSSitU1Qvn87m6Yb
X-Google-Smtp-Source: AGHT+IGfIbiEp9AgPkAzQyYf5y8q1xHXZI40WLf5p9E21EcZOo7Qi3kg+2a0UWsBAQAR0nqjBem1Qw==
X-Received: by 2002:a17:902:e552:b0:20c:853a:52a7 with SMTP id d9443c01a7336-210c6c31d52mr143089975ad.36.1730163982006;
        Mon, 28 Oct 2024 18:06:22 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-210bc02efb1sm56306225ad.221.2024.10.28.18.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 18:06:21 -0700 (PDT)
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
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH asahi-soc/dt 02/10] dt-bindings: arm: apple: apple,pmgr-pwrstate: Add A7-A11 compatibles
Date: Tue, 29 Oct 2024 09:04:00 +0800
Message-ID: <20241029010526.42052-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241029010526.42052-1-towinchenmi@gmail.com>
References: <20241029010526.42052-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The blocks found on Apple A7-A11 SoCs are compatible with the existing
driver so add their per-SoC compatible.

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
2.47.0

