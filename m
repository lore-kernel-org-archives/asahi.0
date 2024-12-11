Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4147323690E
	for <asahi@lists.linux.dev>; Wed, 11 Dec 2024 11:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733916201; cv=none; b=d+grm/15ltZSY8VzALW6SkphvK1zFhGaV3u4F0NkuYyu1O41Gvkz+ekdMeIYOd/F6Bmul35YTALSW9Rp4EU9WMBB4ctaU7hS1ecMMZuLLFkiY0K/EHwFZy8CUtYd7GLCSR8ZYPaEGd9rUjbJp9713jEaILiUQJb17HaTdAJxgdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733916201; c=relaxed/simple;
	bh=lSmc5lpStkRdh6T2UaHkJlaMrEahYyD8GNIRGOk35wk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SBtWG0n6AJwm2cCgXeB0eYdojg4QNg3TU0LlsqUo3Po05jQK/fUVQUwvBWXs3athHp0etnq2mhqrOKZ56DDrqs+BLugk2b4j3YaHD5kyCYGB3+g5zaaSGB3KyTQL4MnMaHHGd+G8j1LOYmuth/HVMgjAi8hL8LxwwIKbfMMPjP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EYry0H0p; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EYry0H0p"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2161eb95317so47527045ad.1
        for <asahi@lists.linux.dev>; Wed, 11 Dec 2024 03:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733916199; x=1734520999; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11W4ToO5h1HZTorB4p+IfX/arkj3h4R3MbzsYg+yGqg=;
        b=EYry0H0p5oqvT+VvidMU4MAxjouyh5dWt/n4wg+aSNfs9jw++HJIRePekc8mtlsnzj
         jWf4hKWvaIYyYByj5pJp3CzNL2vGjX7Cn1oWAQ2FgGVNspCbV2swE+dbtHQxdfYhGNXM
         tdns60OsExuIHLw1GhJCwZeCp3Uu0Vhdk08akWqCpGnWSCoPJBHUrnxY7wQmOWIfUHz9
         sg5KnmsA1pYpSTdl5u7Cgd0va9Qh5tpyvq9vohDP9bi3Zp6d46OG5Jp5Ixq6M+kguTET
         XKcjda/EO1msd+1wG7bIVhx6DbJDvFCtSL3z48kEVVlMGCx3tLDMly7vzjkP6EpMmOAE
         xSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733916199; x=1734520999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=11W4ToO5h1HZTorB4p+IfX/arkj3h4R3MbzsYg+yGqg=;
        b=h6Tpehuux0hX7spcN8InZptUNRn2OvAxBL9aG0Tsyb3zoJhmABTOMbOL89yC6XFCSG
         robsr9J27Gs5wPor4IG+8lNixhqyK1ZTP8BQq13Sv+6Ii+2or+LtJP9GPD3FryJUoSRA
         EPaZp16txM2obvsyghO92cUG+wZBV/vlW+StdLfDRNZiTeD9rhMws5gFYhRYHhHRuM6f
         geafE4E8WdeiINLFuqRZDPVACMbZVVVnuawKm1UaQqdgDw4AE54jQXMMz8058LvKAa4V
         YJFv4J88MBaYLV7boc2iuEe3+Eeop6I0XHr1274+FPtzW4+XNlmY4ArDZXBdHovwA5Fx
         bqww==
X-Forwarded-Encrypted: i=1; AJvYcCVtyItDZdCWJwMDPqtMX8lZNehDM/TvZJtYFt8ed6OkhW0+FHUIOI93WdND4v3BmYNmEnCcYw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8kPBBQPk5pW/N75eBKaPHCZmn62kDiXaInfCz6dGBrwrOKQsI
	85PjrYiR7GqlKTC5wFB9kkxs+ytjp5hvBOeZ6C971+hm1txcm6Du
X-Gm-Gg: ASbGncu0SeNluqYqYAg/xlut6zmqYtFXg2fbDADkPjvSUUCTl4/KC+f0QYP38U3y0v+
	D50F8niD8ILIpDEYkwVCq6Tt5n5F8NK4vpjh8QMbX79zUsANhh1LH719MaGdk48SR27o1xP20Gg
	zx5WzwJlemuYY5mQAxsuIkqOllOpTBTwjDzg3v76PCNHM2HR61osAfj07BR/Y2PPkCTreF4S+Gg
	ZUjsOkBKkk5hU9CluCdLz4xoenxBwIjGRjLICJ7IpSYmk701d2eFWU1iuetyzl4zw/rnQ==
X-Google-Smtp-Source: AGHT+IHo+Kzzu1G9jRKGQEFBse9aRUgQJuEW2pdF7vw9TKlIsPyr1dSWpP9Ey4Q+GR2YFuS1mJUrIg==
X-Received: by 2002:a17:902:c946:b0:215:3849:9275 with SMTP id d9443c01a7336-21778562d49mr36068865ad.49.1733916199490;
        Wed, 11 Dec 2024 03:23:19 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21650ccdc7esm48956615ad.133.2024.12.11.03.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 03:23:19 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 5/7] cpufreq: apple-soc: Increase cluster switch timeout to 400us
Date: Wed, 11 Dec 2024 19:19:32 +0800
Message-ID: <20241211112244.18393-6-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241211112244.18393-1-towinchenmi@gmail.com>
References: <20241211112244.18393-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apple A11 SoC takes a long time to switch. Maximum switch time
observed is 345us, so increase the cluster switch timeout to 400us
to be safe.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/cpufreq/apple-soc-cpufreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
index b27d261fe5a6..94e57f055a5f 100644
--- a/drivers/cpufreq/apple-soc-cpufreq.c
+++ b/drivers/cpufreq/apple-soc-cpufreq.c
@@ -53,7 +53,7 @@
 #define APPLE_DVFS_PLL_FACTOR_MULT	GENMASK(31, 16)
 #define APPLE_DVFS_PLL_FACTOR_DIV	GENMASK(15, 0)
 
-#define APPLE_DVFS_TRANSITION_TIMEOUT 100
+#define APPLE_DVFS_TRANSITION_TIMEOUT 400
 
 struct apple_soc_cpufreq_info {
 	bool has_ps2;
-- 
2.47.1

