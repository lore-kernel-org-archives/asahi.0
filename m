Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD43254AE0
	for <asahi@lists.linux.dev>; Tue, 11 Feb 2025 16:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739290096; cv=none; b=dRetl6evnl3rvW2DNrdJ8daIq0TokM+F61Q/wRuRN5VmAcyvyQT6M3RzlOujtP82MgJ7YdJDBvkyFZ/KkOFsfBaxi+ej61lOB0wQJnQ8PqzpyJUo8EeJETsFzCMvUUIUPDqaonlX2/wfLOcv+Wb8lfJ0pku6uo4t4T4sYngO40I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739290096; c=relaxed/simple;
	bh=xKNBKHADoFe0D0/YamWRency2Eic4YhwlS1J3poCzGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RVnmLofqFVLuiqjhMB1xABCjlbofQ19RmHxM8F5ZGzgr1oU/9ZWBJRTsQrazdI6pH83+myk5JyeoOxdIIYFR3c/5EiabC6zTG7ZKdn3pje4BoAu5t33fnlVsuhxBIxTmY/xrmfnOvRRi1op+Av8DwKwEm/qFN+KbpIxXqZi9xaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D/QRVpjW; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D/QRVpjW"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2f9f5caa37cso9893007a91.0
        for <asahi@lists.linux.dev>; Tue, 11 Feb 2025 08:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739290095; x=1739894895; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CCgOaShG88KaX9ZrY+HfMI5Bon6pKtYLqZUjsI6n6g4=;
        b=D/QRVpjWA56L23nyaDd6b1TslKxz4dOOvhCdx0ktJWLwOSgyvsZM1N5H//1ltIpOv8
         NywYSzExMWcFFHhSm6Q9Kat9nCkfUrXpguxc54IfZNq9aLtk3ttVclfILJddNMSSTuXM
         U4XFnIUk+aV3cu69Ir9dcLO5Z6gD1GCXN2I13qUNyslF6Htd3Lhf831e6QNsJE+Wp2Jc
         52vwmhqxUssLnXzzaDXcJujIFvhI/bnzlGd0qFY96RL/ZJCpQMoRhdoPfo3Tjgz1k+Bh
         32Kof2rCwNfUojzC+YM249U3nzGs90spIGyf6Ika7xLdbGbFwA4eRT9hG5pOss00D4v5
         j5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739290095; x=1739894895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CCgOaShG88KaX9ZrY+HfMI5Bon6pKtYLqZUjsI6n6g4=;
        b=RZI8ZcVrCgr3o+qmqOHzzj6GxZ0s0r060L3uk6UTGZWEWgOyXToxsdOwdeCfKrzILh
         x5U0Uw9/eSD9ZAqbN5M8zk+MePys9okA9f4CbOeNXdMgrq2rupMAuKjEyfKFz6sJHAwg
         IAP/83AkcRdaMOgwgHj06aqJwBVwEjziX68esiIvndKWkn2+42Y3IBCsaibsWfBxcnW9
         5tUch8qu+CtgaEV/hH8hrqUKLUIqdNAempqfea97z0w5/yxo//19FxImS+2oaeShT84y
         20tlDu+op9qsdl4O+6rRFjTyT3HlFWFqzQt2kOqlLRIs2e7VR+VSvgPiVBy/yvNng/TH
         oNMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUesYAMNCjwwraczP/H8twHc5TgwctEgmUdtRXG7R683tb6esnhmZa4xEDqq1MZltxrMhEt8g==@lists.linux.dev
X-Gm-Message-State: AOJu0YziUC23mPB2HWb1ITyUfVmfQpdDR1N3QWyjXWMVcEewLsMSFfmR
	gChPGOZk7gsz8/F95KyMPT86KJ2FGErhUN/OUoyavgM8JFcW86J26168Kg==
X-Gm-Gg: ASbGncsjtmLSEnLjq7d0lbBM242s7V+Q5YWhPTv0xqjAEQPT/+WC1JK8Ah5n+cUl5lz
	AcvLLhW2E4yCgvsaksZCXcSD+q3aml/AtpzzjKKczosPfA59UKE7M3QyJphRlFhbC9iAG4ouPfU
	Nx6Rdl7PYc+mrKBreKZIiSNGqlELbAqu21lwdmKk5ce26xJTi+jdOHl6tiW6MPxDpepp8HSpQbD
	UNCNq020xLAjkbpPZufLdQtpMDCW4b481byUpN3zJj/SwT3YVhb7yFBoqDJ+sTN/qjz4aZEL+q8
	ojwJMb/9XT3iPHzjZw==
X-Google-Smtp-Source: AGHT+IGWiLhpcJsKWzNqi2HT6SRSgJ6VjVADK4Ws7JsDG48oB8ZOyWOashXxpxghrQJ8PTMsnPtFyg==
X-Received: by 2002:a17:90b:2dd0:b0:2fa:603e:905c with SMTP id 98e67ed59e1d1-2faa05deea4mr6190188a91.2.1739290094626;
        Tue, 11 Feb 2025 08:08:14 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2fa618e5e18sm6040478a91.41.2025.02.11.08.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 08:08:14 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Wed, 12 Feb 2025 00:07:22 +0800
Subject: [PATCH 01/10] dt-bindings: arm: pmu: Add Apple A7-A11 SoC CPU PMU
 compatibles
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-apple-cpmu-v1-1-f8c7f2ac1743@gmail.com>
References: <20250212-apple-cpmu-v1-0-f8c7f2ac1743@gmail.com>
In-Reply-To: <20250212-apple-cpmu-v1-0-f8c7f2ac1743@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1038; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=xKNBKHADoFe0D0/YamWRency2Eic4YhwlS1J3poCzGo=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnq3Xm0Xt2CbsT+7H9gathEZr4OYeo7c3d66hR5
 s1nW1F9h82JAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ6t15gAKCRABygi3psUI
 JHDFD/sFR4NMAnHjLFGq8QNGyYh5/aQCC9Enpo3Iz/tjM8EDsqgYuXbz9aZel6EhLouX0knyeQ7
 sis7l8A2O8rZx7taElUW4Boug7FV1SW/KlPQMABCELFy9GDPsv+p3eg/a0QEBEeWdcHphCGv7G7
 pApeqSKyqISAtLDWndy7nGNba+9bSWClFzH/iKyTER7LMChBOsJECU1r6ewEOZ/7tNogJYNXd5g
 OOX94RR8KqhXLiHUMS2ZMHPHnaInZDDN+6UCt4sDvpmgTKAKnb/k7X/EDMFedxdUykgr05BLJdR
 lT0FkJ6GG9gdDpaHRaxUnKAR6ZyG6ejHAA8/+KxoaYCn+4cLsKjf8gH9WpiHvDQuvstknOxEz6r
 yhgkqXxJHtmN5IAwwLXQ7i/pujEUDCTmqod40yRbpG6qVYDVIP9ilkijBHLKRMxLTY4V2f4JdFg
 om7ebmIpo+dTk9TK1j804AGY2zYZ7FTSnVimz/EjIMxujpjrGeLF6SZTyaZ6aF10mnfKQP46bvn
 Dhvn1xKiLhiVLlLWx/63ELv5LwI9/SW1LRs+yWRg1dpn6KDY/85/EpGuZdtBmvo3xZbXbav09wt
 7Ip+KjkPetmWR9RdcU59kxHz2OMOaqkqdB3cGQ+jNLfGL4mSIVrUpoPoyy+svDq93W+OocJr9rQ
 RXcs9RWNF3GaH9Q==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Document the compatibles for Apple A7-A11 SoC CPU PMU.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/pmu.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/pmu.yaml b/Documentation/devicetree/bindings/arm/pmu.yaml
index a148ff54f2b8a92fa3fcfa78c1bcc525dba1c6dd..d2e7f19cf6a2d7d2348d163d37c2787c7a36bbd4 100644
--- a/Documentation/devicetree/bindings/arm/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/pmu.yaml
@@ -22,8 +22,14 @@ properties:
           - apm,potenza-pmu
           - apple,avalanche-pmu
           - apple,blizzard-pmu
+          - apple,cyclone-pmu
           - apple,firestorm-pmu
+          - apple,fusion-pmu
           - apple,icestorm-pmu
+          - apple,monsoon-pmu
+          - apple,mistral-pmu
+          - apple,twister-pmu
+          - apple,typhoon-pmu
           - arm,armv8-pmuv3 # Only for s/w models
           - arm,arm1136-pmu
           - arm,arm1176-pmu

-- 
2.48.1

