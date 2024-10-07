Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343A418787D
	for <asahi@lists.linux.dev>; Mon,  7 Oct 2024 07:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728284936; cv=none; b=n13GjhcnqMZ9NxiaxxmocN8cJZ4U70WiMr1sC7r5uMf/Ev3RgUh8rs8ksx+DhjdK5vYOxKL8Jlzu/OWf9gACqbez1SHUq+iB8sLvn0SJhhX38a6hxtjCJ8AoaN4ONexYqK372rMjcI+GXkBoG504Al0yU5fbgi+BJuYhc0d/2/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728284936; c=relaxed/simple;
	bh=wPBuEzygUbrx/t62Ag29JfuC3CiSgmOrXkdS4/uqaLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uiSAUDCmoppwVVJfvbLRLXE99alOFdaOx5fAOEPqvbUMlhsq6ESsBK+fuSP0cpeKr+Z0rWA6hHtFWRceMp7G6i5b5oVEIyRJR7Xwwcz+WJZBuBu6wPFwd1KdzDgVj/If+Mso+5indmvPenTUTIUtDRk+YWQRV5IcYcUS3sXpnyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JOIlbRS4; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JOIlbRS4"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7e6d04f74faso3286991a12.1
        for <asahi@lists.linux.dev>; Mon, 07 Oct 2024 00:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728284933; x=1728889733; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DltuEaUBaiw3tycBdjnR62le+ZratQI7UqJxxkPzMVg=;
        b=JOIlbRS4/pdwmvQuJa/7brgLhyuGIdKQ6ngEdKHMvWltErSl52OfQBUaP2XkGAQCMk
         WnrJzlLJxSCiwzCOLt89q4ASG1fg4Xx/O6LjUxnOs2J0AtioC24229gMy6+pBvqcOGLd
         ZcsUlP67bMUAjopOr2Tz6Y6Bg6PbR82yUOPEYCuQc8aoXHWzD/PgaCZgw8V+DVdLWsyI
         tWsLvenhvQxRo59CNxWPNp9IZ3/aof+tklcAjdAnU42qpeFuZGXd70hHlbEfCq/Vb7qP
         lp4t2sUl6IXFkFJhY0E8mlyh8Z5KELj+jI4NpA/wgbYn5de0DZ/pH5eFkqTQxFNXmd8L
         dAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728284933; x=1728889733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DltuEaUBaiw3tycBdjnR62le+ZratQI7UqJxxkPzMVg=;
        b=ieNHO+P07/AxVYRarnDGnXONQXTDOOEeOzN7rl4RpE3AuBPVnXerx4wRcQ1s0XcQwy
         gobaj/wv7FIUp4Jbkk5KFV/S1i/SgROa636AApK/OS7nJ7OyxmzOU6eVkf5nxkZeJG3g
         0botxwFrSQUNRqexcl8Vlj35rlT9QtnWNVNSyXsYhAiT9ZqfeiVCdVCD447k6k1fTFVP
         frbFeuF8GF2JEDpK9qGlu3rpJxZNDc0Z6WgFaq0s6VniBlh4iQQfNYAFh6++zmoiMpRo
         RD2hcxKsbYHydfOHdVSuQDENQuAOeFQIlP5T6N0wu4dPp6EDR6P6xWey0UMsdLgFEs61
         MPRA==
X-Forwarded-Encrypted: i=1; AJvYcCW+uLAUwUV/C2ptKToQQjmRrzcq4Tu9S8A87zprCdlkYOcyK3l/BlJjp6c/m6RIaJ/MgXzBRA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyuyDWlI8/wIhLbfcPeRD1yGu0q4Y9L5Ks+XmEh9zoQ9oSNUwpj
	aQa6wZOY69eQVB8ICXcupPEWZCb6Go0Pl9Uu5rFOFeFnAibBQ0Yc
X-Google-Smtp-Source: AGHT+IH8fcU/zLugtd1pifrYht6xlQMm5dTtZxQSNJh5udWYh1E4dvQRN0jc4L4JIEBZc8L3zYlfGA==
X-Received: by 2002:a05:6a21:1796:b0:1d7:3d:6000 with SMTP id adf61e73a8af0-1d7003d617fmr1192438637.24.1728284933366;
        Mon, 07 Oct 2024 00:08:53 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71df0ccd1a3sm3764147b3a.66.2024.10.07.00.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 00:08:53 -0700 (PDT)
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
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 04/20] dt-bindings: arm: apple: Add A7 devices
Date: Mon,  7 Oct 2024 15:05:29 +0800
Message-ID: <20241007070758.9961-5-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241007070758.9961-1-towinchenmi@gmail.com>
References: <20241007070758.9961-1-towinchenmi@gmail.com>
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

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml        | 26 ++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 883fd67e3752..89c1e35e404b 100644
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
+  - iPad mini 2
+  - iPad mini 3
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
+              - apple,j87  # iPad mini 2 (Cellular, China)
+              - apple,j87m # iPad mini 3 (Cellular, China)
+              - apple,n51  # iPhone 5s (GSM)
+              - apple,n53  # iPhone 5s (LTE)
+          - const: apple,s5l8960x
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.46.2

