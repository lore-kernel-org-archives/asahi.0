Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EB6184539
	for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 08:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726044438; cv=none; b=irEzv977Z4snAdBfCzrhqCn7wT24OLSkIJVdQUor3Am9zA8M9v70iPI2ebIjQI3bHrXgRHCktbQyjuVHVM5xF0xEVKDGCnN1Uke9zAWex+cTCvqkv1LIMAWoiRLXECHoX3yLHiuI7xaOEDcL1JQliWY5gcggF3VzNoyguFRoPEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726044438; c=relaxed/simple;
	bh=l3S98+tHOd0H1b7zLM7OaUtryDKYJ3rLNdUtyLsM+EI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gQnKMX1d330CmMqdilAcg/CNfI6g89UzvrPiN5Uv3uy3sfwpaZKaHTLUfg2QXlxMxH5ob3Hayi0kAwG6u8CkIheAN2lIGpJU2yRryF9gI4r2wKvY6qKfAToApn3sQGh334sOr4fuhF2V8uvdWmma+H/SogMST4+E/t//E2397kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KVYqpgyq; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KVYqpgyq"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7db0fb03df5so345443a12.3
        for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 01:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726044436; x=1726649236; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cn5sYAux5rTxj4pwmfhtHMdioh011tWYhtxi8uWrWtg=;
        b=KVYqpgyqzVqnSPcGP9xYc1+fET3sh9BOak8BgvvsktIfplEPD5zDZDZjCxQQiprpgm
         G3+vXVFMowzzIx1G6mi3syR1EFXMAHf3NLh8vl9hsLE1SvKqiyMR1AgWX2hkkXDLGECe
         r2sTFQ0Q/C2Mzi3eQW6C4C8kdEkvjCVBcghhctChoVzhq43HhJALAVuBzu+ZpFEGOMfK
         t3DNVNsezBwTGuewc5CkkhgDwUOfu+SBSUWKmDgPJml8v3SueyNEyOJ+vKgxDUnraj3l
         muk8Gi2XCS+aCOiM6t6dvVq2g8aA8mQTyXja+sqn2O9a9SQagMWuhWUPC7H+/RfW4Hxb
         2ZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726044436; x=1726649236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cn5sYAux5rTxj4pwmfhtHMdioh011tWYhtxi8uWrWtg=;
        b=EjOphJgXTnnxcfLeQg+Jw32gVtyYqxJDNK2kp9uLfhKsMh2m78klcE42hD0J1/cxVz
         BJIXPzmkLmVT+KaDWQ39PnvIErpfaNXEob+jKy0fnU1tkSlwfNOfBuRd23DIlyvmBL9y
         w/WNcuKvY45TYMLAMHiJVu3UZvP4K72qfu1vsskpc35q3RdXZhDDHszUOqa1cSK30gh3
         s6NSbn3FtxKwMTecj1TXyv1D3XLGlwCfL7VjpsEKoUxFdgZ+n+veDWROmsXngnYvqsXo
         t2k8d0ikELzJQMm3r2pwr/NrUNSazFASDIMyi3b4Rg7dY1EWU9i9vLPUnHMa7IdH85Yl
         Lqxw==
X-Forwarded-Encrypted: i=1; AJvYcCX6icNdhTglcmFKLBVbz5G+GLwei++2bvojFu7rPd/CMityh0JYvKhaI4rm6DjkecmR3YTKpw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywx2pfqUIKqZcxJ3Lub6FF5f0qJF80qsyms2n9CEG/EMz4S54n0
	MiasJDoeFGqPYMeljDLagISJHL0MRTVG7kHt9JHhqTumfFNj2bvsPAwmZqRpRZI=
X-Google-Smtp-Source: AGHT+IH8Ukzpm5G0XVPbr+BqKX3Ni9mTPZT1q2gvljK4KvBtB+LlCuVKaT281dm2/Fohu1/e+dVptQ==
X-Received: by 2002:a05:6a20:d80a:b0:1cf:5c1d:83e2 with SMTP id adf61e73a8af0-1cf5e19e36amr4987577637.39.1726044435788;
        Wed, 11 Sep 2024 01:47:15 -0700 (PDT)
Received: from nick-mbp.ust.hk (wf121-022.ust.hk. [175.159.121.22])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71909095177sm2530125b3a.112.2024.09.11.01.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 01:47:15 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
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
	linux-pm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 05/22] dt-bindings: arm: apple: Add A7 devices
Date: Wed, 11 Sep 2024 16:40:55 +0800
Message-ID: <20240911084353.28888-7-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240911084353.28888-2-towinchenmi@gmail.com>
References: <20240911084353.28888-2-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds the following apple,s5l8960x platforms:

- iPhone 5s
- iPad Air (1)
- iPad Mini 2
- iPad Mini 3

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml        | 26 ++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 883fd67e3752..3c81008f0e96 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -12,7 +12,14 @@ maintainers:
 description: |
   ARM platforms using SoCs designed by Apple Inc., branded "Apple Silicon".
 
-  This currently includes devices based on the "M1" SoC:
+  This currently includes devices based on the "A7" SoC:
+
+  - iPhone 5s
+  - iPad Air (1)
+  - iPad Mini 2
+  - iPad Mini 3
+
+  Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
   - MacBook Pro (13-inch, M1, 2020)
@@ -65,6 +72,23 @@ properties:
     const: "/"
   compatible:
     oneOf:
+      - description: Apple A7 SoC based platforms
+        items:
+          - enum:
+              - apple,j71  # iPad Air (Wi-Fi)
+              - apple,j72  # iPad Air (Cellular)
+              - apple,j73  # iPad Air (Cellular, China)
+              - apple,j85  # iPad mini 2 (Wi-Fi)
+              - apple,j85m # iPad mini 3 (Wi-Fi)
+              - apple,j86  # iPad mini 2 (Cellular)
+              - apple,j86m # iPad mini 3 (Cellular)
+              - apple,j87  # Apple iPad Mini 2 (Cellular, China)
+              - apple,j87m # Apple iPad Mini 3 (Cellular, China)
+              - apple,n51  # iPhone 5s (GSM)
+              - apple,n53  # iPhone 5s (LTE)
+          - const: apple,s5l8960x
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.46.0

