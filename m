Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84DC1FBE86
	for <asahi@lists.linux.dev>; Wed, 18 Dec 2024 18:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734546545; cv=none; b=XJREFhB3xRBJQmIi6qz3yIa4v5MkHXWHXjUJDkj8ujqMXlTUwVAeyI99wMsSk6N1GTZ2WyUX7q3oeuhQ1XIGPuiQn5w0Hioeu0J8Y1cUMzThtqTQMb48BDTOYPC1HOXHXzCOonAPj+TtqVhEtG8tMQP+qMiDv1naI9sZ4XX3z1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734546545; c=relaxed/simple;
	bh=4pn0Hu3mbLIrRljons9IY9VcSA1vxsFdATH588GI0yc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f+aUCx2sTnKujJhs0tSBEpTTmFN/mdg1c6QQNYstF03ip0QnlUWPVzbJBxY1Y1V3c5CJi7uod9R/tMLCOjDVVhemUvrtYhAi4JjGNRk2Y+oL6AKVCwNTxa4DIG1lHeRwMoyBTAMqyg+y6aaK4PVzufbZdGG9/YwBVBGvIqSVTX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XGAzJP4A; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XGAzJP4A"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-801c081a652so905508a12.0
        for <asahi@lists.linux.dev>; Wed, 18 Dec 2024 10:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734546543; x=1735151343; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhYpasr65D04oywlSIN3QZu9V00P1KHiHgVqcAI4Gc0=;
        b=XGAzJP4AWexzBEfKZRlNflqX+d0pXj/HRgLtI5vRI/MZNvmzNPFGSpa5dVzifCUbeb
         6CTZHXuO8Kr23M5ADpm7kOZuj5PzEda8Njy1nPoYRPkfJHaydpKk31S/PdHPoGGEiWSH
         njVCMGCiT7x7JwhXTJ4I5iLwWQKECpke/1pcOxcSNKFFmlk9KJv8pVMgYPBOFQdnmdy9
         hKkwLfTJO8khBWWB2P2u6ooxIaBiLis0Nf5dJ5kSGRRepeoXG9ortGdeHjXkHN+Z9NP1
         M+RhyS/uMI2CgaNvVgfdQ2h2GJvbHmnsQqXGkj3mOldOd8uTbw42+8I61VhMxXktIdbi
         MTJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734546543; x=1735151343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JhYpasr65D04oywlSIN3QZu9V00P1KHiHgVqcAI4Gc0=;
        b=FOgq5CNn4BjZf6STRwSVpBYqW7LOBLH9gjrQm3PvDeNxvwMDlKDe80+1v6kACB1fta
         YQGJMUfCeKFE7LN4S8FxsTHKX3b1bfLwa9x07trxGY/FyX5x50A8ryrxqL8S3NniHjCJ
         jX7xR9RV8ujwZyIa1Psc5ZyUYFWwVQMZvwfDfm/wPXgCLG4bj9MKnxvd3qTtzJjNVdUm
         Mak0IUq9JN9y0YFF6gm6mQszi62isDK9Vl7e3kR3Y8VkOM7OQI7gkJRYCMr2CESeG2EK
         uyw5XIG9eV7FM3l9FLlZUOPRcI54MBStiCWg+J87Bdq3ZX3vILHBc/FCGq5wdOKSIFRA
         KCow==
X-Forwarded-Encrypted: i=1; AJvYcCUPpM/sE29AuMCm+0pnKtCzOYuZsQ1yE3zwf7KZrc7rouNGgOjBlxefTS6ClhCHulQaRvjQBg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzuh6Hh6bI59xX9N7gFBshRPTJR9ruT1CxfRuFqmCg9EzkTtrAj
	vShhWZUSrEIO3r63Eq7kzXrfkJ6/5FT5ZSk/QSfIwNXS4QUsi6mx
X-Gm-Gg: ASbGncv0a3gW7N/9hk5YabGcru3TVsqJxYEWsOyWzmH9WhhLi5T0LhHAmvpqi2kEGU+
	aNzYefGDpAsz9VoDc1l0t4bT4HdWRRY+pkwuqJONTknlK22AqwW5UD0kGAwpFtCWuecAxi4TKWt
	gBHLXZ0aENbiqYiFdABUOaKFC6Zcwv9kMb/iskUg0mMUFuUIpTIYfrAe22enJBQR9eRanppkdZL
	pB0tcWZY2bu8+K2n/mOlgjXWUf3p4AnARXj2XO5a4fodTUQJ6TU/ZE6Fw==
X-Google-Smtp-Source: AGHT+IHxbY/o3QfZaUi3hlJYtIOkRSgPETDeI9GVA24+K7rvStkNiiEjw923gS1zVQfPSU4+ivzQUA==
X-Received: by 2002:a17:90a:f945:b0:2ef:949c:6f6b with SMTP id 98e67ed59e1d1-2f4437bf688mr461691a91.13.1734546543178;
        Wed, 18 Dec 2024 10:29:03 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-218a1dcb3ffsm79202565ad.75.2024.12.18.10.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 10:29:02 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Asahi Linux <asahi@lists.linux.dev>,
	Linux ARM Kernel Architecture <linux-arm-kernel@lists.infradead.org>,
	Linux power management <linux-pm@vger.kernel.org>,
	Devicetree <devicetree@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Cc: Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/7] dt-bindings: cpufreq: apple,cluster-cpufreq: Add A7-A11, T2 compatibles
Date: Thu, 19 Dec 2024 02:25:03 +0800
Message-ID: <20241218182834.22334-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218182834.22334-1-towinchenmi@gmail.com>
References: <20241218182834.22334-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatibles for Apple A7-A11, T2 SoCs.

Apple A7, A8, A8X gets the per-SoC compatible and the A7
"apple,s5l8960x-cluster-cpufreq" compatible.

Apple A9, A9X, A10, A10X, T2, A11 gets the per-SoC compatible, M1
"apple,t8103-cluster-cpufreq" compatible, then the
"apple,cluster-cpufreq" fallback compatible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../bindings/cpufreq/apple,cluster-cpufreq.yaml        | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml b/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
index 76cb9726660e..896276b8c6bb 100644
--- a/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
@@ -24,9 +24,17 @@ properties:
               - apple,t8112-cluster-cpufreq
           - const: apple,cluster-cpufreq
       - items:
-          - const: apple,t6000-cluster-cpufreq
+          - enum:
+              - apple,s8000-cluster-cpufreq
+              - apple,t8010-cluster-cpufreq
+              - apple,t8015-cluster-cpufreq
+              - apple,t6000-cluster-cpufreq
           - const: apple,t8103-cluster-cpufreq
           - const: apple,cluster-cpufreq
+      - items:
+          - const: apple,t7000-cluster-cpufreq
+          - const: apple,s5l8960x-cluster-cpufreq
+      - const: apple,s5l8960x-cluster-cpufreq
 
   reg:
     maxItems: 1
-- 
2.47.1

