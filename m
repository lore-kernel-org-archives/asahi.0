Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09961A2863
	for <asahi@lists.linux.dev>; Thu, 19 Sep 2024 16:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726762564; cv=none; b=JURHncDDEmpHx62ra4SBkVhsrXnV/v7C8j7WFuJkNe6Aml6prGq3hvOw0dBVX2nc62qK5HnmzQt1yWsEN+Kt5GdN32dZtPq9qHgIRsDKWDxaGV67LqfvyVzLC1NJcGlqt7buqVxFHk3zevvGf9/fxBAx11sXGc4vItlA8m9+wmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726762564; c=relaxed/simple;
	bh=1/0kBarxJdeH0ODjM886OO6FOOEXyxF3Df2gBqXy/CE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n3QWLVPRPaeFMP0dORkO6r35I6EQ9PiHwE6sGvz/JQjuiB/pk/ke/kZO7vdFeBoDeuwvTR4RVUnWhSqwnOVpndPewEdbkvF1VYhgrj2jrJoHhwALYamGUy0n2GNUv/+m6XXDJRtIAkOcS8GFonyqWEOJ/lNbJ7u4nCKy5tbg8gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jObGDsDT; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jObGDsDT"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7d4fa972cbeso763270a12.2
        for <asahi@lists.linux.dev>; Thu, 19 Sep 2024 09:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726762562; x=1727367362; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YCeCV/1xwkdl5BzxyfA7coBD1+lL/3DpL3W4/CdUMdE=;
        b=jObGDsDT+ZLv74wicD3i96xyepBTQ/xAZuqlhburXmYFk1PeFk28nuhfoPUErnThPR
         SaACZJDKbZI7CxTUCVpRpMMEuPuzcjFvxdhL9qCB0AhTYKBytLYIMbErOwhFkMKcQvXJ
         vNWl2phsoSut5QjhXPl6B52hFO5YTLx+g3VapG5U2LwAcijKWfs6KWwXuneXyaJsWgiY
         +Cq/Ip3YPqteS8jjCMZy5LPI7gZOilg7Xzy4TBFANYv4mLhvJosSTPkjeCeuJVjlpgj9
         T+VxIBxKISNJ9hbGDOZim/47CJvXlbISAV7gj1YJqGZltlSCj0OMX7+2ekZgRzxbz84I
         DaOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726762562; x=1727367362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YCeCV/1xwkdl5BzxyfA7coBD1+lL/3DpL3W4/CdUMdE=;
        b=KEuVHWmo8jhmIt92j/AB45kitJ58vYro+gzLE3iFQggycUmsguElNw6ODSB1/CrM4G
         rDMBb4UyCmDsPjX/Zlxj+HHyPLgtcGa5zrM7VAvc8jdnx4CurOFq0t3xD5IVsDC3kBDX
         /t9fkQScVST9RqTPiMBYlihgkHE+KPRVGpcC0oUXMfzEx1IigzgIN29Clv4iiK1rMtdJ
         dRNoirV/6cV/J/KI8wCgnehYd5QZgXcoTVu4vqkoCDzeESew02t3GreP9IeQPoir61hw
         6QNFcUponGDpgdiQIhAE2JX+pfpefIykFbjtadkIWQF6yDkYBBX+FnAYdA3K6B5urcVF
         5vXg==
X-Forwarded-Encrypted: i=1; AJvYcCX6WA7yZ2OzQezChUjlqftoHuOrCNhNjhiv+hKk1EzoY8ClDI5L1mFJX4PgAWfx80Aif9tqAg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwGg2bNR0xujCUpCmkNXQBu69JgtvTzGh26dp8Xik0tCj1pp1uD
	rPAQNgQXkmGaA8erF4QRICqNgd8w/DD3SNRqrhATUyHyph+V/7No
X-Google-Smtp-Source: AGHT+IE9yW+76fGrCiFJozu3sPmdSmq74J8gEdc7pxwJ2WUOKX4v7BaxAiOvV/FoYvgBT7lu5u1Bdw==
X-Received: by 2002:a17:90a:e20a:b0:2dd:66a8:8ab6 with SMTP id 98e67ed59e1d1-2dd66a89a1dmr5473300a91.13.1726762562019;
        Thu, 19 Sep 2024 09:16:02 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2dd6eed1865sm2084674a91.34.2024.09.19.09.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 09:16:01 -0700 (PDT)
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
Subject: [PATCH v4 05/20] dt-bindings: arm: apple: Add A8 devices
Date: Fri, 20 Sep 2024 00:05:54 +0800
Message-ID: <20240919161443.10340-6-towinchenmi@gmail.com>
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

This adds the following apple,t7000 based platforms:

 - iPhone 6
 - iPhone 6 Plus
 - iPad mini 4
 - iPod touch 6
 - Apple TV HD

The remaining HomePod is not supported as part of this patch.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml        | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 89c1e35e404b..c05a4414c8b6 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -19,6 +19,14 @@ description: |
   - iPad mini 2
   - iPad mini 3
 
+  Devices based on the "A8" SoC:
+
+  - iPhone 6
+  - iPhone 6 Plus
+  - iPad mini 4
+  - iPod touch 6
+  - Apple TV HD
+
   Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
@@ -89,6 +97,18 @@ properties:
           - const: apple,s5l8960x
           - const: apple,arm-platform
 
+      - description: Apple A8 SoC based platforms
+        items:
+          - enum:
+              - apple,j42d # Apple TV HD
+              - apple,j96  # iPad mini 4 (Wi-Fi)
+              - apple,j97  # iPad mini 4 (Cellular)
+              - apple,n56  # iPhone 6 Plus
+              - apple,n61  # iPhone 6
+              - apple,n102 # iPod touch 6
+          - const: apple,t7000
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.46.0

