Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899912054E4
	for <asahi@lists.linux.dev>; Thu, 12 Dec 2024 07:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733987084; cv=none; b=DXqhqC/kRxAy7d9ysRqNisl92EL7VSB0S4FffkhwgkTP0k1RByFK7ZG3oDRYrG1W63JVMvNtU3AEP8va18B54VIUMBDxj54FTg6ajhV+GIwrZMNW+e2uDxuufiWdVnzuRQEOEvfExpQwKQO7SrYIdGXwibNphNdqCGfScAHOhkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733987084; c=relaxed/simple;
	bh=Z0UJoK+JMHqXLXGpFMKhOQr6LnXF7afe9z5eb1Hv2yo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t9Vrg1EnYCyXn+lE5WdgaOISyIw8/yl0zUWGwb4pVRzfYBFHEO0J2mhov5cQEmTaltS+9TnlTIgzTW/gN1jd5LIJyaPo/ktXEqeVE33QaCCwjguYvMtBU2Zy6QL4HUfEjiqF/5biVzD396GbkKqYisMzp/C/FjqcQ37tbgMJShY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mp8bJlgu; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mp8bJlgu"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-725abf74334so219080b3a.3
        for <asahi@lists.linux.dev>; Wed, 11 Dec 2024 23:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733987083; x=1734591883; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iUHH+eJbCiMl2j2oN03m6Q26pa8Tho3uZPMyt8IDCBg=;
        b=mp8bJlgunpGcuul5g9Dqk3tjHe/MfmhW5siTWna5RhMo5mMXvPL001ISkZkWCkgLhR
         mnd7XTd6GIp5VjmskPJxsiUNjT5VCLAWntQnerZYLb1qEGLxSrdve25PvHLXki/0sOaS
         B8TpQ4FPdtUqpnuxvVTXHPHgTRpiMvFOR42tf/fYDab0yuRbDKpgDUhzmX0IvkdhiKnJ
         2Nspdce/qYmVxiEa8llqz566cN5Lp4KRAUN5R9FkQrh+XK90qyF7lu/pvwdoD2OVuDnv
         YMdwaKexCorgVp7dBfvMNz2BRNHUYHMwmMCASV+QLRWdgGWgj7oj7IR5F6SyrrWG4wxe
         UTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733987083; x=1734591883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iUHH+eJbCiMl2j2oN03m6Q26pa8Tho3uZPMyt8IDCBg=;
        b=JXBhnFm8EItm6NU7t2FuvCaoIYVyiRvgNNQVNLXaR9I/hLSyskPQSVOwwnXsGRnPYq
         opQyoCg9srL2zz90vEAcfpD4/Xig/7IJoTFHsKBpdQImvrdf/3ZfFikzTYHjLgVsRMiu
         IhUl2iWutqaytnrfHni/5rJ/0fymSGdy+paJj/KSpJ0+YTRaBEvcGjBqRHwFHxKe/Z9a
         ZmuuN3k53Q5bTFjC9JbXLOj6wV15o4iFVnUb9dDmDK7HC2yOM0c3cO4mvMJgVFom5Jkk
         4UCOZxEwmvwZ38JCAZSUcaAzVpyzbVD25E9fwfWzoHnxvnMQE+MHzK1IJ+n9q+CSHe7S
         X+Sw==
X-Forwarded-Encrypted: i=1; AJvYcCW3bo6n199ixiKKz6LFgS0nIeFxchpmS+tOr+6wLhBDpSB67ZFKeu3Ngf1Fm4hJ5iAKwxlDOA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwBFWTIus3mBZ3c2ynl2ucf6tRJjfZS7URl/2VV4YGBa6uXN+0H
	ymgWXQnmaQS3lOJgc5SXot7lSBOJ57bP+BAJYrZtp2ZnDgtLPttN
X-Gm-Gg: ASbGnctqpYpPRPQVqJZReHuJRFWIGF1aHtWCnOlLaDIS6lX6dFCYQLTytsfpMHzkbL4
	X0telDxbbDq7STqcC1Lv4DxXV5yQ2skLnMG7XPrZu5I3Dy0hdcSw2sqQgdbtavvq6P5lLjfyvrh
	jjLdvEiL3eBUgobUi47cE42ExEjaUNaTuubxFT9i4fmeTqxrg73ZRtn8wtOcV8KWTOIpWKPQANK
	bJV+XnJ/56jwjR2za+66ejSp0/0Ap5ONCPf2zfTDQfJMp6IBt/KpPFSSPFASQsCiLOYQnD0
X-Google-Smtp-Source: AGHT+IGtN/4wOi7l9DheFzbvnmhfw8j2aOU+HkhGN2Yp/3Yo0IKmhXbzVUwwdn6N9+FFWNTL8LZBlw==
X-Received: by 2002:a05:6a00:464f:b0:728:e196:b5b5 with SMTP id d2e1a72fcca58-728faad31f3mr3605642b3a.20.1733987082812;
        Wed, 11 Dec 2024 23:04:42 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-725ee10f928sm6519386b3a.32.2024.12.11.23.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 23:04:42 -0800 (PST)
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
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v2 1/7] dt-bindings: cpufreq: apple,cluster-cpufreq: Add A7-A11, T2 compatibles
Date: Thu, 12 Dec 2024 15:03:00 +0800
Message-ID: <20241212070344.3858-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241212070344.3858-1-towinchenmi@gmail.com>
References: <20241212070344.3858-1-towinchenmi@gmail.com>
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

