Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B26317DFF7
	for <asahi@lists.linux.dev>; Mon,  7 Oct 2024 07:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728284954; cv=none; b=UxB4OQcMFQTR/04PfXFRNTC4/xg23yoXSZ0nlCygN4kHuot4NkLDcWyujA0hTtC5Nsx6IBZottAwGkPf6DQeNTXdZLd2La8WTAwHLWDCDiF8PqTv++E8JPoK9MZc+sNU95OepRfMypS+Eq3GWO+awvSzavLwGyluzRlX7GtroH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728284954; c=relaxed/simple;
	bh=WwfVEUe+ddkgzvmSOxy8bQR87mvlYQHTdjEPT1Lt/kY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b6DG93lshA8SEvKuvUfCtcnEiuF2fLVABlw7WBuMOvP4jafKOihanxWKAclpzk/gq9nAGtAYbudIG5dN/a3n0kF6WtmPmow/M6aU/RaBu4vCEAicKMlvc6ov4akqJNDhvQRe4HRTEeOkNXPbpZA2yrqhA60TQB/AwvKpUhwCwDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hrHHy1ya; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hrHHy1ya"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71dff3b3c66so490550b3a.0
        for <asahi@lists.linux.dev>; Mon, 07 Oct 2024 00:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728284953; x=1728889753; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YqN0RL0b12JN3WDoM+1XebJa+SPPD2yoa7rkpfSsQL8=;
        b=hrHHy1ya4VrGI6+pOOfETRfUOWrRuCPiSt7c0GFnwVRypTWO0/BeYAGL1D415MhCFA
         TPjyd25PmJCDyiaVMBbyeYO4A98eaukpLrSbD4GTg6YHf5aV9jYUE37j3dnlgGVJPYwM
         02SOT2efgk54FTb+7ES9tqRQ0uQHeubIQM4LtitKOdB8c/517Nl/kKYP5jHmCiuWcHXk
         tyHU6pZtxDSix8IFhWq8EUr6381p/DiOgdhsHiw2ArReAmRoAJDTUxCWyk9ReyQo2Ky1
         ZbXFJBxkoloeT1o9JgcVxzKUvWaezNBvuPtd/iz7Wtaj6fbBze48iYhsWvkW2nRFopOB
         5pFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728284953; x=1728889753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YqN0RL0b12JN3WDoM+1XebJa+SPPD2yoa7rkpfSsQL8=;
        b=LhqnvkLchXCh1OWvP4JiaAR5hFvPSomU1ETN5tMwIgVw6lNWv4X0d0nuyM8Do9FcBM
         GzvmKgBAaRKj10iv7baK3UxxQJcyiyNQXX8HsYMpqsK3SVHppXTEu2rOGe5VtJZayu5E
         os/xBobXuoEInMCQVD0B31MDih4EGxBsygw5cPkzLbFNUBugAvPj6bBxltoxJFFULYHO
         cJTYRD9crH9j8moYFIUtxlGkgnHAdMlrn8TuPwMros/MxyuAnp0skTZStlaHoX6ZxCnR
         BnMKbt0M1kr5g7b6o0GwWlTAJdezFfvb2VW6wXph19apjq6K33QJ7zMMc125truXdHkL
         toNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUh5KC97wVpkl7l/VV4XFyUfW7isJ/11H0w9Do4fD5bJmJ9uqYx9dn36ydj5RcSbHJTM/i6/A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyZs9VZBoFBR6hBPmenysrrAinQzXxBUPzVJEpNskQPidnG46pV
	jpmYNZicrAeRH8377lsRJzZtoRmd3V5vdnTq9+q8Es8jHvBVMvaT
X-Google-Smtp-Source: AGHT+IFs01PmzAmflTxkkA6BNd1Ko2b/rLBAuL/FOOHtUNtO/VrCOB2lFtFvR+OdawXueOZoGpG/ig==
X-Received: by 2002:a05:6a00:2b54:b0:71d:eac5:f081 with SMTP id d2e1a72fcca58-71deac5f585mr10733939b3a.20.1728284952740;
        Mon, 07 Oct 2024 00:09:12 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71df0ccd1a3sm3764147b3a.66.2024.10.07.00.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 00:09:12 -0700 (PDT)
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
Subject: [PATCH v6 09/20] dt-bindings: arm: apple: Add A10 devices
Date: Mon,  7 Oct 2024 15:05:34 +0800
Message-ID: <20241007070758.9961-10-towinchenmi@gmail.com>
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

Adds the following apple,t8010 based platforms:

 - iPhone 7
 - iPhone 7 Plus
 - iPod touch 7
 - iPad 6
 - iPad 7

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml        | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 253dae759f10..b6a2916fb0f6 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -43,6 +43,14 @@ description: |
   - iPad Pro (9.7-inch)
   - iPad Pro (12.9-inch)
 
+  Devices based on the "A10" SoC:
+
+  - iPhone 7
+  - iPhone 7 Plus
+  - iPod touch 7
+  - iPad 6
+  - iPad 7
+
   Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
@@ -165,6 +173,21 @@ properties:
           - const: apple,s8001
           - const: apple,arm-platform
 
+      - description: Apple A10 SoC based platforms
+        items:
+          - enum:
+              - apple,d10  # iPhone 7 (Qualcomm)
+              - apple,d11  # iPhone 7 (Intel)
+              - apple,d101 # iPhone 7 Plus (Qualcomm)
+              - apple,d111 # iPhone 7 Plus (Intel)
+              - apple,j71b # iPad 6 (Wi-Fi)
+              - apple,j72b # iPad 6 (Cellular)
+              - apple,j171 # iPad 7 (Wi-Fi)
+              - apple,j172 # iPad 7 (Cellular)
+              - apple,n112 # iPod touch 7
+          - const: apple,t8010
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.46.2

