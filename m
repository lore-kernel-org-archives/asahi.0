Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C32318BC31
	for <asahi@lists.linux.dev>; Mon,  7 Oct 2024 07:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728284950; cv=none; b=ULvjiiJGndqqBVYk2iQx+az4l488Iaw5aO9ROr+Ds4zDxN9pGuFCUDdIFjH31hnQvf4zOs0vCiPJ/tqrYQ10nIeNYLIz+b9FyuCTz/5T3Igb7ooT3RuG+KwZ8cXcIe+jpbMqoaLWJai3Pg0QQPao8Sn+u6+5UIMy+S4vnVQAXZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728284950; c=relaxed/simple;
	bh=eOPWxost3/Q/Ct6nJTvUfPY+tUjDPPoFiOm+DWy2974=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=awfjj10HgCBdMVFIF1KxRk90r8kWMZle4nxPeBqALwliktEqM+ykjgkPkTU40qs+NMO5JzOXl/5fIvczHS07ZYOy23uJYBB5hnKVdbGtmqKuB3bfps3KsDIGlPlj8JcnMVBprBXntmUXs8N2iZtONw94mpnX+ko/SgFn1DzJX1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A8eHuZog; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A8eHuZog"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-71e0cd1f3b6so58818b3a.0
        for <asahi@lists.linux.dev>; Mon, 07 Oct 2024 00:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728284949; x=1728889749; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t2GO0bDPlkWtBLbc/b6xzMR0wH9aMrQdYT9FKZAjN+Y=;
        b=A8eHuZogXobMbA4PHY2Dkt2HZTPJ/hG/yjlUCVz/xY5cuctPLKEYnQc6JXbuuMU9bB
         Z0VBNCmHQrjPs+cboZExfDRZ7Kctjgd3PTYDF4uN9CO/gD9xiAOmJeMfwoib5VoDviUN
         83fhlPHCHaKeI83qJunTbeo8Y9I1NkMoWH3BFqMuIX4vZxvD4BQ1R1O5+IG+JUNBnuZw
         WPe+x+n7naTgEHGZVwBfNILINp/su7mdKdgZXLdqznp/QKw8SMfIYzZPxoO9Ysbq/RmK
         KCC+3M124prE2At9epy3/JnHIePj4OBg1xZNxLgx570NttqAOzUsmjDETwGlkrVsbl2b
         FKSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728284949; x=1728889749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t2GO0bDPlkWtBLbc/b6xzMR0wH9aMrQdYT9FKZAjN+Y=;
        b=X/8WytOJgeZpfhwdF0dNfcaHb/GPpCjclSU128MnzIcpN7zZDiYsZFRvOWQXqQzbuO
         dL8fuXyVXhdkmCHjdKti+J3wvCQ3cIIV4LHbNCZt6SS14QT9ZodZCtPhIFV1KkFVMM/X
         b0T8RQGxU9XbiEF201pDAElHRRiL9du2vVuP9c9m5it3JYfMCh0VmKknEIuAAoma+xUl
         HjNvS7aqL5RcYTH4w47Myo77hKTvGaOMF/056CxHF6RiQXd4PcunIQQZ/m+mR47RbXJ6
         8IZ2GGVIqidAqDuuxWuX4xhPLIP9HhNmoWLrRJE+mkGiy/GHuAFoa9bvRvQ3vQ0gKCz6
         nymw==
X-Forwarded-Encrypted: i=1; AJvYcCVh1LA9g73YDp0pbQ4DJfVpyZitbGo3fsEGLtr99CFMOs1+hKDVnRpvTS/F7lFvsot5K3TzoA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxlYA3m3Y2rJ7N7ResqwU94g88VuZnJ/qZFjUSBQqPlzrbiNC/p
	F4fooTizjNZLUYF+yZMqtPHsPChc/4LkI3Bna95Vvqv0bx8QQIdB
X-Google-Smtp-Source: AGHT+IFXaLJs+l/9floukTKIL11mw1cfwaNwUaCQr6k1PcQeQ4IXxFNbobywjuKW1EGZNB+R9nXhEw==
X-Received: by 2002:a05:6a21:1707:b0:1cf:499c:f918 with SMTP id adf61e73a8af0-1d6dfa36895mr15730204637.18.1728284948866;
        Mon, 07 Oct 2024 00:09:08 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71df0ccd1a3sm3764147b3a.66.2024.10.07.00.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 00:09:08 -0700 (PDT)
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
Subject: [PATCH v6 08/20] dt-bindings: arm: apple: Add A9X devices
Date: Mon,  7 Oct 2024 15:05:33 +0800
Message-ID: <20241007070758.9961-9-towinchenmi@gmail.com>
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

Adds the following apple,s8001 based platforms:

- iPad Pro (9.7 Inch)
- iPad Pro (12.9 Inch) (1st generation)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
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
2.46.2

