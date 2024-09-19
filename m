Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84421A0722
	for <asahi@lists.linux.dev>; Thu, 19 Sep 2024 16:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726762560; cv=none; b=YD9ppENHuOYvl5UAHE09XAz7JLKw/Io4K3+1ag52DXdoyvBiO1L0Td2jsmai/A/4M1ZFAp5SkJkr3LnVYOZTjktgC/cbWxYcN838k7Z7nHs1luz1KW8CrlDE9kWiL8NT3RkGjoQk2a3qHKFrkzRmlQpbxW+rB2OZWGAtPvuIdGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726762560; c=relaxed/simple;
	bh=1do3oMHa+zZtMgWoYxSILBP1btrTVDMYuMavL2iJt/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mnF4Zj+s80eh9vgxRoHIuXvkncaKTzfGt4s8kiM6xrZIVaHYRn3vkGJNNBbKjisWvW/CwlOvJA4nGj0fUKo1nMMo6ocx234y4kcMYeF5saBl8SPYc7ikEfeZg0crij05A8Dv71Yqab+8sz8n8D+4Rd5EqdIJMz7lTGg7qJ/WGEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LfKttWZY; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LfKttWZY"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7d7a9200947so682803a12.3
        for <asahi@lists.linux.dev>; Thu, 19 Sep 2024 09:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726762558; x=1727367358; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cx9QUOiQgqEszXRAMdnqMOxDufFUf+ALloEhf90CVgc=;
        b=LfKttWZYYBMloYuZ/OoDdKV2x+sHjW+5FVFIBan/DQaWhAYuazCw9OMY3XZOvBGRVX
         5eICmIcNRPJkNfUcVztplfDbSBkR4LJ4r296ZnM4ll5uev7F3xkV4tCB5HX5Iy6SXAjt
         BE6eRwmKMzWeSL28Z3W6mZkffQF4LdL8gNJ6/7/U+ijTtJwStkeFiDdkSRr0rxTLAhAD
         Q349IicZ8IZFCVUS8rhwsMhG27JgxqOl6vjaukneH5z5TiCxpSfdxnVkFGWr2Wf4FxGk
         1Gc0rzmmzTT3dyeb4mVyfbU3YN3krZ638PH2TEfZ21ST0SYQeCbEAK4+7WQn2Cdor5tT
         OM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726762558; x=1727367358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cx9QUOiQgqEszXRAMdnqMOxDufFUf+ALloEhf90CVgc=;
        b=Fzna+Z6ldETjQhA/JZqm8J0+dkkD/8xS6OfMtTs1pR5t0Aiy5UfoHiqeQeaxLbrb4j
         gHf6lMGONDcy0xqKDKbG9YLy5pu7AjIY29cXnsQ/NZdIu59lBZasjbf8kiMFAbFUZsi0
         m56LZh4ENr2PvpW0/PCuG5Q9NJZjLPqMRvLrvkT9QH+xsFylkfXjInYz2dm4E5v1Nfb4
         D+VuqNj+YKs8V7jKVaQzfgGz/OTF09p0ir6iBKtkFBAFD/7noDtUyff5mOyua28f70Qj
         UR1VQ3oGMytFLoZAOUoTaRnETgOXFZAKMSUGbLI8cI5TVGqmcODyaoMk7sUDsuVbl/Un
         X9Yw==
X-Forwarded-Encrypted: i=1; AJvYcCWv6gb5Osg02QBlxuc3qzT3U2zYriUvhYP0OyMGGp67YbPI5NR5Q5+b0kQZYAaJiWhLnM70xg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzgjWsJK1U9z9EtwdVJ7BIK7Sf0Pw9ljmTMMW/qze37UY/WgHYU
	94Yfh/c9CfLObX2ZrRCAQlKdiPY3NESn5ndrpP15fIwKpxg7yDqF
X-Google-Smtp-Source: AGHT+IEgXtLkIjPRdY2PBg77XYN7b22QxEN76FgfhZTUQgMO6VvpQEnaywV6N3VeJVR46skd/N3KiA==
X-Received: by 2002:a17:902:f54f:b0:207:457f:b8a6 with SMTP id d9443c01a7336-2078262ccc1mr331463075ad.12.1726762557945;
        Thu, 19 Sep 2024 09:15:57 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2dd6eed1865sm2084674a91.34.2024.09.19.09.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 09:15:57 -0700 (PDT)
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
	towinchenmi@gmail.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 04/20] dt-bindings: arm: apple: Add A7 devices
Date: Fri, 20 Sep 2024 00:05:53 +0800
Message-ID: <20240919161443.10340-5-towinchenmi@gmail.com>
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

This adds the following apple,s5l8960x platforms:

- iPhone 5s
- iPad Air (1)
- iPad Mini 2
- iPad Mini 3

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
2.46.0

