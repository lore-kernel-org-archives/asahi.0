Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C222157E61
	for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 07:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727248850; cv=none; b=gbhrEjB6Xhyu1OK7kFG0cNH50rJwAm50CJ7tF5sB/vQbBNGW/v+l+nbWuZ7xk+qD32IQzUR0qQYAhcX3j6Z1kLbzzdVvqO5jHDdQ/UpDN34ahT3MxrpzQvasjEHYieiybJWe4ciceV5HhOice5TtCys/GlJz86Qu9MJQTRzGJX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727248850; c=relaxed/simple;
	bh=RQmYiPdslbIR5WscGyWKOAVQAC1T8nRhDcoGKPyyZtE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W6LnIzdS7FwEVFLbTjoQTyb/S4O+FJo55GF2e0Sx8mypd8Eya8prf29deaULEM2bsGA51Mekj1PaAODoOHJmsWpTpsCx3jD7lEbH1aMZoWle2NKmlW7eYbn3nCz01R3W+fHW/xo/1STtju7F7axvaWCkCeJavDue5siKIxUSybE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PAYRQjys; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PAYRQjys"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3a043496fdeso20612435ab.3
        for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 00:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727248848; x=1727853648; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1gzlAb6tAbaYqxXPRjbN4tCFBYWmIDA5QUr0hx9IZZE=;
        b=PAYRQjysoYV3LUujzhDFm02P/EksrBCywcoI7waOcqCnNeHZubzzCPDpX4AQmfGLUq
         Y+4XOLXBcRgWkEHx4aK+sKqFpVLDCxYG73TkmR7IGf+IRXSLgFshNs4Hen2ofIJ4jzci
         V0nzAN56HoAtGvx+VGFRG3sUNaUWaRWxDV6FVq3YvLJmY21RK51AxFFI+67JAQLqtQu0
         fnUZHQbAbTjFOJcsMOkRtxCfP8LVZAjAdRpCivDVNZLxDQQMFVzKO0NpjyU6n1MC35l/
         4TDwEl5F0fZ0r0vFWoHulknOWKieHtb1pI77Oe70EVxIQtMgOT+e9+tYAbK65kYIiWZv
         lkag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727248848; x=1727853648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1gzlAb6tAbaYqxXPRjbN4tCFBYWmIDA5QUr0hx9IZZE=;
        b=rnNSdHKa2ucRqKx09X/UtC4BIlr6D/kRmnD6bGxIeqxF6Jnpjpp7XUKKdZ/2YR8Odl
         HOjt5oU1odIHGa8xmXlAaFRefnnKXU/5U/86qJBRWeXH/6w4AlUdO9RDZGXiyzEiw/Hp
         XckEFpp8JDyMMPjL0njzKP8tJv99wqa7rkRnMx5d1rNBi4xTokcXW1Tq+CZ4SksB1G4H
         RmQHLPVQNwZFmmIMY4bEexleiPvcmTuXZr26q5MLjm5xHt/+xhZ+n4w8l/FMekuueavH
         Ee1ftbrCUxBbb3SCQhHTQhCaiWMSC1s6pzMNTc2C5qxpJl2OIMC8tqY+P84jCzwz5ZOK
         bIug==
X-Forwarded-Encrypted: i=1; AJvYcCUdpJ1lho+RpPXkLn1yahcHy/CVxtfsfZ45bBK15ZmXUd/NfnAXNBIDC3bXEXUHODOHWycTyg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzUi31jc+MbIWsij4eO4XKmeFaI/kbVzgjzCATEbOLuR9vz/SHw
	3idjGrT45Kvz6/Srkl5qgsOGMnxQbcj20W8gZXUk5yRVFZHuIVX6
X-Google-Smtp-Source: AGHT+IHHRXHmkDoV6cYjtUdS6It/5KruAyPCBuIpMtTf3yOkX3h4v/vIxT0bKREhjmU8Nf1G+8aXwA==
X-Received: by 2002:a05:6e02:1d97:b0:3a0:9244:1916 with SMTP id e9e14a558f8ab-3a26d78af3fmr17300025ab.11.1727248848032;
        Wed, 25 Sep 2024 00:20:48 -0700 (PDT)
Received: from localhost.localdomain ([49.130.52.78])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7e6b7c732bdsm2155662a12.63.2024.09.25.00.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 00:20:47 -0700 (PDT)
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
Subject: [PATCH v5 04/20] dt-bindings: arm: apple: Add A7 devices
Date: Wed, 25 Sep 2024 15:18:02 +0800
Message-ID: <20240925071939.6107-5-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240925071939.6107-1-towinchenmi@gmail.com>
References: <20240925071939.6107-1-towinchenmi@gmail.com>
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
2.46.0

