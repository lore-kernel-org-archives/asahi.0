Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744E418A93F
	for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 07:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727248890; cv=none; b=eZDqVMH+Ho2pffMSjYB3SEQdghLn8zjz2LJ6iWiwjIgFE7o4C8QeC7Mm9LrFu0J5y9azOtEvqxeU7EyyBR9S/Ja/hqppc6TEye4JFdBeBtjNqaENQk01f2iICvR+SJHBYFvZHDV0c+k3G5qLYf2FmxPvi524h6I7gSuB8ueaOGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727248890; c=relaxed/simple;
	bh=Gqs1ahfB9mr3TeunJDfEiuHnPwB3lCyorA2M4bZqYjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yr0XXl2M/Ar66cBOLAuwUpmyW69Yn+veN/gYIuj8PhnZqp5Q2w47l66IegtMtn+avibosf2z2Xn+/WmZOxv098N98nQXVGgB8VEO41m2bL6nrOLvl1Tc89e0EzY6kumA98wyXNQ1aBcf4S+JIP1MQAXqFY4q8qycGkO/NYD0b+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QC6gaH03; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QC6gaH03"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-82521c46feaso357580739f.2
        for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 00:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727248888; x=1727853688; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LRS99LqtKKHwle8nUek6BghPGrFF+lICOD/F9U0T8Ic=;
        b=QC6gaH03Xi4CHeoAjhlCddoIoxmh3kwnqD8HYjFTNEpg9mMHDogpo+UOSZg0pCqAs9
         BBMOwQ4v3eK9KMzmH5ROzhrzz6+8eheXIBLWxAgwbmQoWiezrP/1NyvkF9dXA0lmFrYQ
         mL+ZvND+83wZpf+la+71kJd4SKtlXj60DMQg9oeOepozM47TucvWiR4GTC5KmhjoZWSv
         H415T+I1j41vWmRx0I6A4T1ZdcaPRWBrxg44C32wYbTimlKrh/fXuEMk/qLzQ92l1HA3
         +pxD7MP3VlzNZneY6bXmIKOhMyOJ3r8cerY5k3JRhlETWv5AzhVoXnU9RMuiDlTY3UUC
         2LZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727248888; x=1727853688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LRS99LqtKKHwle8nUek6BghPGrFF+lICOD/F9U0T8Ic=;
        b=oLlnTZ6kU/kAFf/3Mzxslnaw2gnwDt/cWnr9cIDo6LlzOcRGbDv27IoRWizOFnn8hc
         MduBuw8Xs3QbZ8Nn/xpmKwtyMQtMPpzFvhNIJH40cRKE5n9UzFI2Z+g/HnxpbkqeRm4S
         0b/jMOfM/6WRM8V5s5yz0DoNHW7mphCLSY+SJzecz1fPoT+72T99meeqj5tA/WFtYAkU
         rfJJMQVLOaFmjHsZH6mcrMkIYWowBLepwEmJV2dc3QaIw3sLAxbbVf1BvQN3dVri5abj
         XX2NM2fb2BFBN+P59jl6ujs9gxBrwMb0Qad0P5EALGEid5TpsfXfs/KglBKT+Fg5tuAR
         Pgag==
X-Forwarded-Encrypted: i=1; AJvYcCWyOezO3DcuLdhuSkaTGskUa2QCZXzQ62G7UWxTnLFrad3FASlmOvFu9F/mNM/xP2SLtufnCg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwvxKSZJKOXWMSffxyQTefa1v/qx6mzWaLD2tNerWFCP/VcR1GU
	7m+gdpK2J1XPRp5i8C0iNCuhpp3A4/ocd2xPMM4PB9T2AN++VPFm
X-Google-Smtp-Source: AGHT+IFvpJTqUs5gJ8SSQJcfciyhjfNIffVpvedL4cAQ58ETxwhJEW1uKD70Mfulzgk67MLgTsYtPA==
X-Received: by 2002:a05:6e02:1848:b0:3a0:98b2:8f3b with SMTP id e9e14a558f8ab-3a26d7149e3mr19848075ab.7.1727248888368;
        Wed, 25 Sep 2024 00:21:28 -0700 (PDT)
Received: from localhost.localdomain ([49.130.52.78])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7e6b7c732bdsm2155662a12.63.2024.09.25.00.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 00:21:28 -0700 (PDT)
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
Subject: [PATCH v5 11/20] dt-bindings: arm: apple: Add A11 devices
Date: Wed, 25 Sep 2024 15:18:09 +0800
Message-ID: <20240925071939.6107-12-towinchenmi@gmail.com>
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

Add the follow apple,t8015 based platforms:

- iPhone 8
- iPhone 8 Plus
- iPhone X

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml         | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 96efadad15a6..dc9aab19ff11 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -57,6 +57,12 @@ description: |
   - iPad Pro (2nd Generation) (10.5 Inch)
   - iPad Pro (2nd Generation) (12.9 Inch)
 
+  Devices based on the "A11" SoC:
+
+  - iPhone 8
+  - iPhone 8 Plus
+  - iPhone X
+
   Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
@@ -205,6 +211,18 @@ properties:
           - const: apple,t8011
           - const: apple,arm-platform
 
+      - description: Apple A11 SoC based platforms
+        items:
+          - enum:
+              - apple,d20  # iPhone 8 (Global)
+              - apple,d21  # iPhone 8 Plus (Global)
+              - apple,d22  # iPhone X (Global)
+              - apple,d201 # iPhone 8 (GSM)
+              - apple,d211 # iPhone 8 Plus (GSM)
+              - apple,d221 # iPhone X (GSM)
+          - const: apple,t8015
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.46.0

