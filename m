Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393E8132114
	for <asahi@lists.linux.dev>; Sun, 15 Sep 2024 08:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726387720; cv=none; b=az522EB971qqcYkDe6l4S66GUHXmuffV48eh66vvY9D2FgGe792tbjaqNQ5GYy/dp7y2MJIL7UwnsBJh78UNCoJjh7vUnAQuhircmCywDkn03NsppGENnIu+0Zj51xOkU6cB9t2DjpPsc0oIIn2dNpN6zQPsikZJ6wMOFuiVI3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726387720; c=relaxed/simple;
	bh=1/0kBarxJdeH0ODjM886OO6FOOEXyxF3Df2gBqXy/CE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K9hhkwq5aMEwR7FaOIALuuG7AEEeAvWib+nCQDEhjij/cOsYTzhpWYHlNY5cHiAdVIileWWi7Uu3JbGF1utLBwBSC8PUO37VMtZbirefTEFHAv/i9iLHHJgNliqsXs2BfX27qog9TssOT04jtbhtITM+jG/0d1Fcj+H0t8G9zDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f6WE4dCV; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f6WE4dCV"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7cd8803fe0aso2504365a12.0
        for <asahi@lists.linux.dev>; Sun, 15 Sep 2024 01:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726387718; x=1726992518; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YCeCV/1xwkdl5BzxyfA7coBD1+lL/3DpL3W4/CdUMdE=;
        b=f6WE4dCVnL/ysFf7MubDl0yj3JRV8Q1bo7qVJ/VsOgq/e/ZyTpFYuAs/HfsBZHWIre
         MCPFxU86Rc9R6A4hSPMBXfY/MrIF6lKnCGWIej8TNQViySg0QONLrI4Awn/T3mPAjS/o
         9thmPiGRmwiZxbpRQGutzT45f2+5w2aLepkESOY/gDrZoYm+e1UOiLQtXK2Hmmkzw+3Y
         mITXMYYUSg/fOEwEsUuu6sDoa/9HvoYhJLSsOl+tP8swNcFEeA9RPAQw4kTDtCl5/clN
         04N9ftUGXx7OnVW63TmzAdw/JTdFzrb8WjsyXA+DrcsOTpRj8IucIRMlkfwL+Utl5Qc+
         puMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726387718; x=1726992518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YCeCV/1xwkdl5BzxyfA7coBD1+lL/3DpL3W4/CdUMdE=;
        b=rCaGW4kgtej7+oCqznGsuBhxfrXdivCVm9zgHFHY2KoPESyTmBE8UT+IbimudkDh/z
         5wiGhUnxKgM/ExRVl9GrWfVNkvuQjiVDSRPYmImKP4s5RXX2mmHsCrbHr5BaJ3VDzluG
         p6PtJYN4GelREpo+eky8/JNTJ2rxTVz/un6Zv6bhIUILgP8HwflKpdEcptMwYqCEB396
         ZoV9cKYvmhOetH7esMqNQoIhAGLjJv93OeCdmmFz0EhrFN692KJmX7OGkoNWb8JLHAmj
         gC0DsilffaMYU8p2mZNZS1B7g3rnAjGqc5ZpzzcHUwTbV7LYp3FaICRvWEdh7mEhrrnb
         4y6A==
X-Forwarded-Encrypted: i=1; AJvYcCW9nOug/rEdP3Twqz1JQ4Zgm1dJQzlQsojmUx1boCH6DL0aaX/CVXKLlt2UNeqg3nRj7FmLdQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7kecSnhtL7le29M3Uy5JWo1uo3np8SMQD978aq1C7nU6ddz6W
	TUaiwywIWOTJWGi3Z7ufMQP6/OsFEKJlbDfl+q2M+NRXY1jXR7iw
X-Google-Smtp-Source: AGHT+IHebPyOY1XNR/e+vdqULneCJ+RVuSOsjS3g46ZPR9rwY9JaB3S5x4I/SyYN8reGXwfPGUtoTg==
X-Received: by 2002:a17:902:d54a:b0:202:9b7:1dc with SMTP id d9443c01a7336-2076e44ba5emr155141685ad.54.1726387718546;
        Sun, 15 Sep 2024 01:08:38 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-207945db012sm18248865ad.19.2024.09.15.01.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 01:08:38 -0700 (PDT)
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
Subject: [PATCH v3 05/20] dt-bindings: arm: apple: Add A8 devices
Date: Sun, 15 Sep 2024 15:58:50 +0800
Message-ID: <20240915080733.3565-6-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240915080733.3565-1-towinchenmi@gmail.com>
References: <20240915080733.3565-1-towinchenmi@gmail.com>
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

