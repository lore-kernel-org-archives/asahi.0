Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8BC2AE84
	for <asahi@lists.linux.dev>; Sun,  3 Nov 2024 07:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730619229; cv=none; b=vGexbGArhzyQvFR4biPauAE+hre/jcWf1nH2jAD45xM5fmDmJS5O4UQoynW60zIIkypiL8RI2tc32A2tQknGeYYeyfxoq1eYWcjKzvV+oO0ZUWxHbt0q9P9veFnjX1NKzqQ/uOm4Zwlc5RMEilpMBjmDdMTVUQxhppYHOHirC2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730619229; c=relaxed/simple;
	bh=hDRg0YaHnMb/3mj2Hdxk7ZixHZuwBUovjfJTVCdFUAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XU2y0z/jmaEQXd+pVJv50j/Du2JAYpa1M7PPL894Pam59X6A06K8YSF2hvWY8ZL6mXdJC2jfFegCDbFo++wCHyi20F41DZIpult7sDqJC38qVoXXWaVqeev1+w0orD0zwF5M5bz/b0PXce1fq7YN+g5ZpScxJc25H6tSt+X8eIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CeE0zWBl; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CeE0zWBl"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-210e5369b7dso31833195ad.3
        for <asahi@lists.linux.dev>; Sun, 03 Nov 2024 00:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730619227; x=1731224027; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cAhPP1Ue2Iis5GJtsj6WYVFqMLGyqRg1DOrYPcB4peg=;
        b=CeE0zWBlQJz90FU7sdKF0i+34xmedrQ4+0nAv0c8QOpvwBQ/HVmf1WRxNdF+0k0oze
         aw6NEI7CoPHJorXqgbT9r0614/PGGw1fbKyhnRQxbTsq0jBrmkZZyHzF3P+LFK/rx/m+
         ih8OU2kfY/r9p6t+hr2hS8AEMAoXQiCHfT5JN1+BXBTKjp6Miv58Jrm6DN7rZR0FNuer
         4UyIPA/uo1iQm0HfC6iJb+oF4fA1wUQ/t/SsbvODjIHKhsO+5x/cf0tnFWwjo0bsavYK
         I+szP/PA0ce4CFGwBAXcFRiQOQLTJgbeytO0am5U0Vc6O/07hKOSKIQblzb9MqDsZyd5
         4A2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730619227; x=1731224027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cAhPP1Ue2Iis5GJtsj6WYVFqMLGyqRg1DOrYPcB4peg=;
        b=LA58ib6MCJnEQPWfwGg45L+qmEuar2FSV8o+Yj5a2acuxprFGNhwOGjeueBJRnth0w
         Y/M4LpdrosrEehJyS93b+bXQDRFDzVdklliQ2sLZHfFYZAXwmzLaggoF16T8TbGS95DM
         r39EnOfmK+yxu0nD6hw2LWnHR/Vu0GZA/Bf/izy+1ctpuAi21RHNajhO73KwHyq6/1gX
         oUWvRE30dC9Enn3W8YBo6WtXx5fpu/RPbvh/lI9gGzzV8MnTXjB/3KLOs2kGgKayhX03
         +95yiETke6a+tGtJ7h3IlTUQOsdXc38TZG838iqXtfvVOuhHx7+V4AJuWMvSq2+MLgyi
         t3XQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuOZkWZpzbprN5lcW9UN8nESS9xW90Eura92VCSJxPi1KJsRIHfU9AcvHnDOjQe5Vro0oVLA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzeci5YQPoLRyFqAk1IIjpKuLl9N0GVUX7kR8JGJVxEWFcXB/TN
	Hwt2tSN4wVzeIg7dDBa0ZQWRfWKr0yJe5aCChbIxcxLiKN0JJ54y
X-Google-Smtp-Source: AGHT+IGImwWeyY3Moiafe2fkJOaFyS7i3wOq6EzM2uCFlnPu6zaavprp4mJQyKnYQAczv96ouYNN6g==
X-Received: by 2002:a17:90b:4ad2:b0:2e2:d175:5f8d with SMTP id 98e67ed59e1d1-2e94c2ac593mr13732559a91.10.1730619226771;
        Sun, 03 Nov 2024 00:33:46 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2e93da983f9sm5353443a91.5.2024.11.03.00.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 00:33:45 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH asahi-soc/dt v3 02/10] dt-bindings: arm: apple: apple,pmgr-pwrstate: Add A7-A11 compatibles
Date: Sun,  3 Nov 2024 15:31:13 +0800
Message-ID: <20241103073319.30672-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241103073319.30672-1-towinchenmi@gmail.com>
References: <20241103073319.30672-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The blocks found on Apple A7-A11 SoCs are compatible with the existing
driver so add their per-SoC compatible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/power/apple,pmgr-pwrstate.yaml       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
index 59a6af735a21..6e9a670eaf56 100644
--- a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
+++ b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
@@ -31,6 +31,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-pmgr-pwrstate
+          - apple,t7000-pmgr-pwrstate
+          - apple,s8000-pmgr-pwrstate
+          - apple,t8010-pmgr-pwrstate
+          - apple,t8015-pmgr-pwrstate
           - apple,t8103-pmgr-pwrstate
           - apple,t8112-pmgr-pwrstate
           - apple,t6000-pmgr-pwrstate
-- 
2.47.0

