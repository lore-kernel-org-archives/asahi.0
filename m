Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2148D18754F
	for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 08:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726044466; cv=none; b=n83iYeOsEvaXeQ6z73mnATyWqabEEssNV+z8/hfjC8tN2rnztq3NreTDuXkJayzLrLW0tAe6s1gsFbcVKkS/hPTBLUrFG3Juh1piyTdgi9MEcECoVw63BgVsBZZkEVeLWAXdSSb2YxCU/DaSvn3ZH9JZ3Azry1/0EofVd6MpvMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726044466; c=relaxed/simple;
	bh=e+RwqZ0KKDj0FMI96kxmn78KGmId4jrdpNHTTf1PFeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jFVtV2c8cCEtjTKk41a12xTcEXyzRFFfmRMU8ofRY5E9r9SUsHUtocpWVtUsEUhvvDCObioiGh3r+N+o1GcsrnJR+GRHucY4w1bblgRfgWkTclFJ7bVRoIzbqwboPm73YJvhp0+elFdO/PJUuhQynBvUY75So0zVum3K4Duy1tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V55W/Sgi; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V55W/Sgi"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-718e11e4186so1637961b3a.2
        for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 01:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726044464; x=1726649264; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AmXdf6OWZ+6DgSIhVYS2VQN3ZnSKQAowmzyE0LCVjPI=;
        b=V55W/Sgirwqk3CkDhmqjvW+qg9a00+HDdN0EgEqNr/xnMaNT2zpxs07lSIOwaKlkJ3
         uAC5MOMQIDyWXbedkN3v/uQuhjs0kxpE6EAS95A6+dZhD5nnq/NDHpCHEo9p4lwtOoKX
         c9TicPyGoVd1hibQDd3qy1vFmD6QbeowujP77KutiQGi6k7oh9kRVkcVnGLN5IuL7nYV
         dxz7tygZ+Gp1ryQ8mZldSbQZP4Am4qp64lwxC52ZjXh1m+l2cTuf1W2yKk5cOc8Uh1zb
         PPBL4LfCBf/rArRjipWlRFaqAp2+zjE/kbbi01yMH48EpDP9RfDZ4Zan1Re4NGdHX0C4
         yO+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726044464; x=1726649264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AmXdf6OWZ+6DgSIhVYS2VQN3ZnSKQAowmzyE0LCVjPI=;
        b=rQf6zuD3L0FOfz/QDJb1e6iwW39GNX04F1h2czjUbfnMh5cV+eFtX+BGK+47zG5U7J
         2tRzCJenDkvPBwHRTkWg4qee9PybzWiqPmlHmpCMsSaUKVAwXj73lbzPFz6nyxeqj5eG
         xFJaNLGKMi0F4vMAGDDsnnnSzE+FX/ie2o0cL6KN30iH8AgcIEE+BPTglCZcuxOWR4oL
         SQmXNm5TdiGzje/SLL9fyZxKx1BffnvX5zJEUVFZD6d+mGZte4LBSj1vC+sKB8h6veuD
         md3wuBAkukiJj1tnEj3tU/uXBHqoRlB8c8OFtYQ0MozVNp2FMRYo/sUTKYwH0CW7bIPF
         mRQw==
X-Forwarded-Encrypted: i=1; AJvYcCUMnD4zGSjlWk5YDUk008ChdXp7wIilmtiC//sZceakHWd4t7d1zUyS1WY9oVR9clw9BHVR4g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxYb+OEmLU8i306XLqWjoFggPBeOEOQs1fVWoESjjsPkMvAALiZ
	uIr8k3qa7hZkQ2nU7FojpiZyZZbw9++uPs/+j2htrCEPpLK1uXAz
X-Google-Smtp-Source: AGHT+IE5ml0se5Ym/mHN+1lct8Gh6o22KIxJaN+WlMCEv67cVuSqhlXchJvBOtUM8B5UPM4aL6o2kA==
X-Received: by 2002:a05:6a00:945a:b0:714:15ff:a2a4 with SMTP id d2e1a72fcca58-71916df43f7mr3070313b3a.13.1726044464385;
        Wed, 11 Sep 2024 01:47:44 -0700 (PDT)
Received: from nick-mbp.ust.hk (wf121-022.ust.hk. [175.159.121.22])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71909095177sm2530125b3a.112.2024.09.11.01.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 01:47:43 -0700 (PDT)
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
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 11/22] dt-bindings: arm: apple: Add A10X devices
Date: Wed, 11 Sep 2024 16:41:01 +0800
Message-ID: <20240911084353.28888-13-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240911084353.28888-2-towinchenmi@gmail.com>
References: <20240911084353.28888-2-towinchenmi@gmail.com>
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
index 873b62035bc4..2831a662f5d5 100644
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

