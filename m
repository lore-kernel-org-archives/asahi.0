Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49AC183063
	for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 08:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726044428; cv=none; b=GuljmFXjFW25gBnRF2YJr4PQP5bTAtbDLFv/cRJC6cD2bmS5rTREUgm4jnkqxdJbFFUsu07yFd3iACxZrDmf6krMHKCaKygLwy6SeRo9xk9eYbtkI6jK5GgpFafA7GZqfz7uowOIpIn2EjEXStk20oUwxQ8YrDqbYGmr3Wvumcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726044428; c=relaxed/simple;
	bh=/TZwa1P5GOi0weNisvEEpeoua8fx09BY++vgJdF9ecA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bq6aW35lGcg6bEuP2EDkEtz5GsAi1eQrG3N3sysZP5yKRMnK0W88BDyTIgCIDAD1IypNDdl0dy0O8dThBLiLi0CBYo7Ks/mij8c3zdPck1QRe1oiXzLej09VWIYHoj/i+arbjJ/AB0/z8jmbEjNWR/RUbF9nR4T+utyI0EqCi9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=He70o8r7; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="He70o8r7"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2053a0bd0a6so17881615ad.3
        for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 01:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726044426; x=1726649226; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IeDHamkVCqUamIh6SnSmGPyPT7GfV2/5V36/vymSx7s=;
        b=He70o8r7ZN81K3mHfn2NRiqXK3fmgjKv66MAPfeQkIsG6i2z2nuEiwaYDJAyuseScW
         4mC+6sBzeS/isHH9oT5u5X9xDMabH25fx8qJ3qbeSl5MIYW7pzoTR5gQZh4/7938IyOn
         Q93lJCHvkyRzQqPjN/n/lru9+KhF9QYmeFEL+kyL/5NeVM/T+uIOO727bPFOp1it62qz
         ujDluN54DdK4LEU6ETjagPh/FwxhensEm8RRje8I28XwUbku0CFKc2a0W3VJOy/DV8xD
         Hi7VFCdOr6Zblvz9TXGdMZcKzaIWptFrsVCYX0XCD37igcrsZcYi+gsVT177Rz73Rmar
         4j3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726044426; x=1726649226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IeDHamkVCqUamIh6SnSmGPyPT7GfV2/5V36/vymSx7s=;
        b=oyZEJd7uc5h22+chQ+Y4NL/UOoh6f1V0nAyFImnT/CLEjdxLCtjQbieOzQ+hn90xZ1
         A1KBtzjm+HmlKKhhxfArFjJjsb2xbQuV6UjawSP2UOiXBpnFwjN9tJLcAX1N0nFBqLzH
         sF+/SI2BfQRSXV8zX5BXcfUYl6feCUk13+0MgdIH3Ys+u8an74KPGM1MdbeIAL/X2zo3
         gD0GE1ldAWm5oWMpkBfG+HACpZPENgjQVOE2sWEUFcQkWONqceBeBi5GOMiMNQIXvN70
         DimB/kjlcc82UQrS7FP54dlFklSiQEfSFTE2DHePtAjSi2OHN27LuCKZysVJv4gzFxdT
         In0g==
X-Forwarded-Encrypted: i=1; AJvYcCUHMCIt0YL2/g3TbW8TWC+AlQO/YHCGO+CtnybpnNP2XJILXRRuWd8+bY90tqxzsm/1fKp3fg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyhPdDIDpc+R1iXNgATwnYXXjyEKY/Zw0tw/EnqzRgcwNBArbNH
	kSMuqR9Hsni4sAQG74FIamA1EvJboV3YrBt8n8Mqie0XGm9nrhoF
X-Google-Smtp-Source: AGHT+IHMTwHhuGM1xzJNE2TMTpnQCgKvCX0aXtXz2sZckro6H0s3Lmt7OmVQ/AFM6EQ0mVB19l2HUQ==
X-Received: by 2002:a05:6a21:460c:b0:1cf:2a99:91ec with SMTP id adf61e73a8af0-1cf62cdecbdmr3891676637.28.1726044426062;
        Wed, 11 Sep 2024 01:47:06 -0700 (PDT)
Received: from nick-mbp.ust.hk (wf121-022.ust.hk. [175.159.121.22])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71909095177sm2530125b3a.112.2024.09.11.01.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 01:47:05 -0700 (PDT)
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
Subject: [PATCH 03/22] dt-bindings: cpufreq: apple,cluster-cpufreq: Add A10 compatible
Date: Wed, 11 Sep 2024 16:40:53 +0800
Message-ID: <20240911084353.28888-5-towinchenmi@gmail.com>
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

The block found on the Apple A10 SoC is compatible with the
existing driver so just add its per-SoC compatible.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml    | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml b/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
index 76cb9726660e..e0d1a9813696 100644
--- a/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
@@ -24,7 +24,9 @@ properties:
               - apple,t8112-cluster-cpufreq
           - const: apple,cluster-cpufreq
       - items:
-          - const: apple,t6000-cluster-cpufreq
+          - enum:
+              - apple,t8010-cluster-cpufreq
+              - apple,t6000-cluster-cpufreq
           - const: apple,t8103-cluster-cpufreq
           - const: apple,cluster-cpufreq
 
-- 
2.46.0

