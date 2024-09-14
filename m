Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8409616F831
	for <asahi@lists.linux.dev>; Sat, 14 Sep 2024 05:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726291565; cv=none; b=MAkrBoLK/vB/zzYjlJTAgymswUQ+FbjsUqtbgy8hvfNgZUFkNI1zepaqLsUImoL4u3/tYC7VQvqKlymspKYP94w3eq7xoBUhVX3co3khlhqV7yYPOvwALgVGY2G0JUqoSKmZp8xDAKyzGY3I9T9jVvN5e7c6Q6rq+VYUC10LgPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726291565; c=relaxed/simple;
	bh=FeY5rH2Qiz+FAfwmm6AVDJ21Mv5JbNCvSdeGNgfNLX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bwFSXy8Ki8h0Up4YHFMwc0t84LVvc29PPmdcdX1PcOzGgh28PiH8+QMkyW3mMGFG51kaLNw6Yq/9ujD9L/XsWtzb91EdwTTMx9nBgz7AvZWafHK29eTB4wNxcMJUO++XC4wwkwSywjEX6XfcQ4PHlqEiCnN2SXFI/ysjSJP2608=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ihSTSZK7; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ihSTSZK7"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7179069d029so1292727b3a.2
        for <asahi@lists.linux.dev>; Fri, 13 Sep 2024 22:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726291564; x=1726896364; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVu1SjDRNaTLjEcb9gqcIIxYP7YMiACMFhnku4atreU=;
        b=ihSTSZK7q0mboGD4MvI9Fjxwgv9WAcMeZgWb2qSE71cqjV+D/5xkRkBvpUYUzOC2sX
         imHf+IxIlTkNOBhPecg5y9inTWRjTQ1drh4KrBvWyl91XDC5JbMixO1mFPlkS9wU9Pvi
         WvFW3uUpqfkZurzxrSa8Fkep5ssGTwh8G1O19n44ZVSsTbq7WMFXmezBtmXx4F1UmiTN
         pJWI7oCMgUZrEug2rCXfX+nAy5h63ekxjAJEwchcj2WRQVgYzzP0WO85Rcettcp5/nmK
         4XDDYgy3N1FSwlLtnQlfYJqC5R6SacDpwkhXl1L1T0/x9jDpME/dlDYksGYoIymo7Dn2
         qIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726291564; x=1726896364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yVu1SjDRNaTLjEcb9gqcIIxYP7YMiACMFhnku4atreU=;
        b=cGG9mXc8YPS2ZIkcD+whwXd1+7QxoEHVBCdJ7Q80cOrUMTlD5L4gPwrY6AKlJjzLlY
         n4EhndmmCuUhvV6jaDgWqq8PW3+OzZ9JjbI7BraZU3hRAWvXeHdoVQxcXmMWMVIiAVAJ
         wpxaQLhvhHlfgSxmKHmREW6Q1HQmx4k3UbeSIQS0DiFwit/axRHMZZDl+wtEMpGIlTy+
         GLW3rfS7jj28llR6qoh5U2utljdHnaXF2ahybG9OBNkitvndxNVzcHeMW7cuButBDZhs
         RWhFNwZ/bIHdECr1jZzWIq19cfRxzA4gYiltGNAdqQnNkAdM+aWonnU9NQdNDZ9RGXNa
         V78g==
X-Forwarded-Encrypted: i=1; AJvYcCW/IczWz3Xv4K6Pb0twPZ4OqLsDkHCrGHNovTgz2rpKkxZEK7+KEmqhWPDRpRkFyVdcrt+pqA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwUAsOOdSUJ5eKG7Z6FMJ0S6TKjJj8MbK7FQ9nOvSLmyizj83jA
	q7L+i/c/ryIcN1sYvBM7pwzJshjbld+9U5889G0nr5eDKwiXDqj3
X-Google-Smtp-Source: AGHT+IFcuKsB4caXjpEXM2wDj1LEyR4AEu2lgTGmde7vP+Ph0/AD48c7IH53OChI2N4UCrHaoB+JJA==
X-Received: by 2002:a05:6a00:13a9:b0:714:173f:7e6b with SMTP id d2e1a72fcca58-71936a3abdemr7922571b3a.2.1726291563917;
        Fri, 13 Sep 2024 22:26:03 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71944b7b749sm391223b3a.113.2024.09.13.22.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 22:26:03 -0700 (PDT)
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
Cc: Nick Chan <towinchenmi@gmail.com>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v2 11/22] dt-bindings: arm: apple: Add A10X devices
Date: Sat, 14 Sep 2024 13:17:20 +0800
Message-ID: <20240914052413.68177-15-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240914052413.68177-1-towinchenmi@gmail.com>
References: <20240914052413.68177-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the following apple,t8011 based platforms:

- Apple TV 4K
- iPad Pro (2nd Generation) (10.5 Inch)
- iPad Pro (2nd Generation) (12.9 Inch)

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml          | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index cb33bd1e7a2c..92fb48aafc39 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -51,6 +51,12 @@ description: |
   - iPad 6
   - iPad 7
 
+  Devices based on the "A10X" SoC:
+
+  - Apple TV 4K (1st generation)
+  - iPad Pro (2nd Generation) (10.5 Inch)
+  - iPad Pro (2nd Generation) (12.9 Inch)
+
   Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
@@ -188,6 +194,17 @@ properties:
           - const: apple,t8010
           - const: apple,arm-platform
 
+      - description: Apple A10X SoC based platforms
+        items:
+          - enum:
+              - apple,j105a # Apple TV 4K (1st Generation)
+              - apple,j120  # Apple iPad Pro 2 (12.9-inch) (Wi-Fi)
+              - apple,j121  # Apple iPad Pro 2 (12.9-inch) (Cellular)
+              - apple,j207  # Apple iPad Pro 2 (10.5-inch) (Wi-Fi)
+              - apple,j208  # Apple iPad Pro 2 (10.5-inch) (Cellular)
+          - const: apple,t8011
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.46.0

