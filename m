Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085021A3ABA
	for <asahi@lists.linux.dev>; Thu, 19 Sep 2024 16:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726762576; cv=none; b=Gs20TxtLlOnnOrC5I0SVsVEbRIqcCF9E90NnioXFsuR65gs6b8W6ZmzG21/vjENGdBym/oUlhVPOnCryWkM3nuO6GNIoLPaJqkloBn7BOYmR0utLfg9Ivxvw+zu3MBFLLlEY7Vtafl6ksMv8uK0tpJZhmkjn+ormpmiEJT01y0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726762576; c=relaxed/simple;
	bh=3LdvS5KGovWfSeQULeKu1Eh61BWUO6KIHw9jqYb/UhA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ISninGf27d+is70eDCpWR+DpuQoRQLPKH8n+kTWP7PuOWxQbMaUi/GexZtE5NmpWa/RElbsyNgBAcEn1fLhY5Vub3y+bsA+nntiZHeHJVCZs+gGelf6PgSvDskUfnAMOID2FA97N5owiWTvgvSXjACw+d4sUEpODCmF2AWdPPiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VZurP4iQ; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZurP4iQ"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2d87f34a650so778685a91.1
        for <asahi@lists.linux.dev>; Thu, 19 Sep 2024 09:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726762574; x=1727367374; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NfQDIayDgRSXuWv63W1u5ddzHt/doIYQe5CKmJXlfPM=;
        b=VZurP4iQwtRRlfZtW8ywLwethNqSc3X+OqE02Aiey2wf0uk+ZYdMlFN3I+tHFyi8hk
         mOVcM9urUerCnVnUV86SyAZUyK1t2fnA3MM1uNwBghSeUtPX9dQ0/k73/aFSzKvtXEx3
         4qtMWkAL3xSH3IgRwJZtwI6Vsho1vDsp9LtOKaFc3StYKDyVWTJfwRNytSdJtxd21nZV
         f3e/FseUbEsBnknWvqVSOK6wDJl85aeyd3DGWqU+03pe+WRQRaP3ESbc0/asJJSoh9yc
         /4wzxENhGrotZt7IiNdDM4ND2bfvYnhHtbdwfGQxM79Lh+Ty+US7M3zb+17ztD0CREVp
         fSrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726762574; x=1727367374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NfQDIayDgRSXuWv63W1u5ddzHt/doIYQe5CKmJXlfPM=;
        b=bT8E9xMGtLqrBFieLw4rJD9aso9fJfZfl6004ziGuw/Yz1l71tcnxt+ItBG+EdhfA+
         IAg3N1EFfvQ5UTrx9Ci+jWboI0MFls5bDUhPgj5n1rchF3r64xaemVPw3xaN0wJckOrl
         mjnlhSd1dUK4C8O7rVsdjjg7JGLjzta0b/GE+cimWBvE1S2C1or49zUAQQF3fd+pOaa6
         PHP2vcGH8pWtkmwsmKHzBukQi2V3wMvepaFr1N4FsMwo4M1qjt+SvntAkxsM7d/uC+Mn
         bDjGW1j3fd/tMU9pUesE0/WlFIyOAoHGP4TeMtz+uMpJqdUOhf8PJxs3KF+wIipoistf
         NEOg==
X-Forwarded-Encrypted: i=1; AJvYcCX/i9FsDbk3G7k8MoFskTMzUtmB3blJRNOmL9m0Ob4yGVur56S+VnBltSjD3TjY0LIwZNayMw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxREqVb4pPHYOmTa170WuyQbGIjh3x99TWbaM4FyKF6f/f7yqxp
	4sgsTC/XqAAmKJgDbhhiwiwhWTl2TJBh+1cOGH7JRd44mn8ky8KbhETmBr2R
X-Google-Smtp-Source: AGHT+IEm78lhtu1oe/4ttv0zXcuaPk3cuEmFrku9D6ErlS3RiO3KgmmXuegqQYUL7VNkObDz+jd5iA==
X-Received: by 2002:a17:90a:b012:b0:2d8:719d:98a2 with SMTP id 98e67ed59e1d1-2dd7ecfe713mr199392a91.7.1726762574228;
        Thu, 19 Sep 2024 09:16:14 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2dd6eed1865sm2084674a91.34.2024.09.19.09.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 09:16:13 -0700 (PDT)
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
Cc: konradybcio@kernel.org,
	ivo.ivanov.ivanov1@gmail.com,
	towinchenmi@gmail.com
Subject: [PATCH v4 08/20] dt-bindings: arm: apple: Add A9X devices
Date: Fri, 20 Sep 2024 00:05:57 +0800
Message-ID: <20240919161443.10340-9-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240919161443.10340-1-towinchenmi@gmail.com>
References: <20240919161443.10340-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds the following apple,s8001 based platforms:

- iPad Pro (9.7 Inch)
- iPad Pro (12.9 Inch) (1st generation)

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/apple.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 01965890b4ef..253dae759f10 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -38,6 +38,11 @@ description: |
   - iPhone SE (2016)
   - iPad 5
 
+  Devices based on the "A9X" SoC:
+
+  - iPad Pro (9.7-inch)
+  - iPad Pro (12.9-inch)
+
   Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
@@ -150,6 +155,16 @@ properties:
           - const: apple,s8003
           - const: apple,arm-platform
 
+      - description: Apple A9X SoC based platforms
+        items:
+          - enum:
+              - apple,j127 # iPad Pro (9.7-inch) (Wi-Fi)
+              - apple,j128 # iPad Pro (9.7-inch) (Cellular)
+              - apple,j98a # iPad Pro (12.9-inch) (Wi-Fi)
+              - apple,j99a # iPad Pro (12.9-inch) (Cellular)
+          - const: apple,s8001
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.46.0

