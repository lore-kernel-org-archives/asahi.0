Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E001D144304
	for <asahi@lists.linux.dev>; Wed, 23 Oct 2024 04:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729658716; cv=none; b=e0UKnneP/L//H3HW4O8jUedfMz0BcMC4lnNBULpGOXWHIlFYi2npxczG4bT7MuZtaom6GhLBstLT7cKvGSmeWztMlsUZmJzycSfsBhQ6ikc/tWnq1MUPAD4xIbVSbBQU1QVQrnXjaGgmwtOl3O8+zzG6/CixJjOfvyz415tD7bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729658716; c=relaxed/simple;
	bh=QyRVCV7k0IMsHEFlNwqwOXLJhq0As8matIK1rrm+8R0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f5RMUhvozatCWQNGhjnEC+E1LPzV4wGiCd9KQQoZz4S51AA0DjzRrrawcKjj/SZ+vCc3oxmFLVsN5ha03DCQ7EHnRwi9I/ECgB7kqD02BbTxLSFT4begiGL+Z1uWdJk26TV7j5pcHlHi1iXQ+FXpRIB0pCVjFGr1CRgidxm59CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MkYSBBCb; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MkYSBBCb"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20caccadbeeso69527555ad.2
        for <asahi@lists.linux.dev>; Tue, 22 Oct 2024 21:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729658714; x=1730263514; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VRRyn6DkpWMz0v2kqaN2e7vs9rb3yVIRaf7RcLqYaMw=;
        b=MkYSBBCb8QYN2PmN+E9tFr0nfeDG12QlkzP4Q+dsgRzmY1Py43FSTGag8rBNerp0VE
         aLjUegSOegQJeo3bMSVMMy03patTnQt6ADvUe1EG6jzJspE+WphqSWmw6r4EwJfOLo/x
         1/Dtw9lPl1gpBiyn1km2JmsNNVOpLU3NgntPLnDwp9pURcO5hLg9IrG+c62F4CRwF89V
         1S2Cm7zS49xCHjfu8eJ1PkgISMi1TlYvcwew/wdAAoAWMaNVbyMqHRvPoRbTn9E+t4ro
         98TMUsZ89eSWJAubxca1ItxDEFchpWuTdS3Z6GBGi69PqlkDpLFUhkky7lflii5xc61l
         1dUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729658714; x=1730263514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VRRyn6DkpWMz0v2kqaN2e7vs9rb3yVIRaf7RcLqYaMw=;
        b=isq4PDV+Ki7TMXPA4EAA5yA49bjHErW+rQx5Ed7dsPOgwEIavgUmbjGrQKXnRRJGvm
         DE0Hb8LLFyzG1TqP0Sk0Irasx8UU1Dq4Fuy1616lDvjFOxHmJ1fzyeQgmm9LA77WAM/M
         MKApYmu7josj+4kY8pS7H8XLe/07nIFE63vvhKlQQg8ewrh5L+YxJsQ0+zqSRCB5y7Z6
         /+BZ5I4nSDXzMeXjxxuMovcOr4rVYfyQ1xu9+uEaakfBLts78iuPJhPInP/GrkeFEtTd
         zQx+aGX2ij/YaBUCrHgQ7F5u2i7p9J2d+uCBZeZcpGPkr4BXgZDrmjOcS0MRyz5BriYE
         QJ3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUYzUyMo6UEYDdAEyAm7dTHN8gLjf/1OWCEpNnsWlaUtpacFKIolIr8rt4YtpdgY+zhzyswaA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxEpSQFrXD/offb50JWGGV/16ARqfMSlqbXh/uIlgj2IMzFdPPl
	3cGc+P457YB1xKiZD6iP/nOJYxjeYuHHREEk3x2fgIftfDG4nPIr
X-Google-Smtp-Source: AGHT+IEVxY6WS0+t4ZS0RRhzjZgRl3Kk/p4MYisUMVUnP7LVq42/iEODevokAF0quLoBPBwiWFtO+A==
X-Received: by 2002:a17:902:d481:b0:20c:ecd8:d0af with SMTP id d9443c01a7336-20fa9de9252mr17066275ad.9.1729658714157;
        Tue, 22 Oct 2024 21:45:14 -0700 (PDT)
Received: from nick-mbp.ust.hk ([182.153.135.7])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20e7f0de3c3sm49983125ad.207.2024.10.22.21.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 21:45:13 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v6 RESEND 06/20] dt-bindings: arm: apple: Add A8X devices
Date: Wed, 23 Oct 2024 12:40:41 +0800
Message-ID: <20241023044423.18294-7-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241023044423.18294-1-towinchenmi@gmail.com>
References: <20241023044423.18294-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the only platform based on apple,t7001, the iPad Air 2.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/apple.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index c05a4414c8b6..fecc4953df33 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -27,6 +27,10 @@ description: |
   - iPod touch 6
   - Apple TV HD
 
+  Device based on the "A8X" SoC:
+
+  - iPad Air 2
+
   Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
@@ -109,6 +113,14 @@ properties:
           - const: apple,t7000
           - const: apple,arm-platform
 
+      - description: Apple A8X SoC based platforms
+        items:
+          - enum:
+              - apple,j81 # iPad Air 2 (Wi-Fi)
+              - apple,j82 # iPad Air 2 (Cellular)
+          - const: apple,t7001
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.47.0

