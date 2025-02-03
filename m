Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBC4205E02
	for <asahi@lists.linux.dev>; Mon,  3 Feb 2025 12:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738585146; cv=none; b=EUsG/0DHNZcyMHZqvPJbNz6v0bfMdwOV1wFJ2qa9R00CQYZMVrDWssBIjE8//uJ4kv4cqDizfQVieO5zdiCHNC1kcF6L0VwSemmisQDF/hdzllRGfTznxOvKWzm9ksZCDU2MLvcz+XXUg5rXUbufVEsG+hXWL8XW/IMYOVt2C6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738585146; c=relaxed/simple;
	bh=TcKqDidlzZE30cof1ogOw1soncsTPmmEW4myoxbnDYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A7IaJF0h3RNH7ukLcrjLNRbuZOhEGBb+yy5nyICDMvvFpgg0yN5XYsMLE0IdMNNFe56Tb3OMkdNunrjKIEUK43Efj4MTBJZrjiE9JuIscEgdDqCRbMsuHig+r1kPDKOC/gHde5jP4H8+3n6FNymqMIcQwVHs+u4IUxDtRUgGxjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XlA/J+Ky; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XlA/J+Ky"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21649a7bcdcso72187345ad.1
        for <asahi@lists.linux.dev>; Mon, 03 Feb 2025 04:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738585144; x=1739189944; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lkArynpSqp3cWfJCyboVvj5WV1Udsg6X2+BBCytGm7Y=;
        b=XlA/J+KylmJ9dN3vcdg9ova0hX4apJ/wC1Bspqd9WDdJQaW9IYlqNDvizANY9VkVea
         OmB0lB7AqwvvbdmxUfLhywWSPWLZUfGUxUDx6yB14nLX/y1v/doOqRho//DOyC7dS+QN
         oPtNqO8k/PnZfOK3621nh3jkcFhUGFJjY6xffIH3tkIFXZFUmVagaat3/BgoBAnMudYE
         hEmRarPnxl9qHlw5TWrMWx3Xd4+3zbUbgms/w1T9i2+RynCQD1BAnq48FZQJP9JM8O4P
         2JxmfuPs/d7Q0XoIMZQit/lhn6iYBDNK77K5n7VWoTIcSfZNygj74mxx/u3zZ36jtMOz
         Yy8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738585144; x=1739189944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lkArynpSqp3cWfJCyboVvj5WV1Udsg6X2+BBCytGm7Y=;
        b=octxrY5slLX89VH2FHY+wshKZceE9tcSHBNtdQUYaa77BwR0N4hQhy9EtmkJDLHFBA
         uKlx+pcwX6S428v5Z8SujTImA3/3gYJWjV0xjmWI9fi4yHIpiHswEP9YziW52cekORql
         +Ln6H1QXqiLw13JNRr3B1dThLJPny30iRi1FLaPVqUh69RB59hcQ9QO5BePpUdhz3qPd
         oXBYiY+/DY/IPQUazGKHrI/+01YMVEZlav7VoKYXHZmJBdePBUMi0ikBe2DXGgsLekRE
         fuQ44L4DAiDSkUY86h+NQXAAnU2erHBF+u4PHVaXfc1b6QegAlBQCwpAOT0OSqA/NbsJ
         ezUA==
X-Forwarded-Encrypted: i=1; AJvYcCVxFs9qIl6BTM09FyQC73JrajbUDxCsolvCXYLRmUKq2ms6mif5akB0zpoOUFkZBQw0us7sog==@lists.linux.dev
X-Gm-Message-State: AOJu0YyXEOaF4AhI7KUZRQzVfn3gM3akBmFt5EZz9fs6wdK2b/EOf5Ub
	LPwNRndiranLB5q8q1cb7lM7owX/A1TOWGbmdjFNiJrnj/g+uLU6
X-Gm-Gg: ASbGncv2JWWFgJNMCx+ralN/KK33O6BKzNhFyCFDmgWE/0l32i9Jeh4BAGncWg5BZJz
	1BJPXpmZ/gGNQDeyKO5Ns6mnN1+w8Eh/ou0VFbDxxjhKMKr+v35EaZ0ts2I/VyNeSg70rqNS6fR
	uSCtUpO9cR99pA/ZuBPdwH7uHd/FxVX8skrnTWh3WxKx/sO2z/WEfyi+uRhOcl+y6cokINXcr4n
	iH0hu3gVdHo/L02IjpH3E5RZN08FvjaxFnyi9sBaeUpgptG+hm6jybsNFntT77viWmyYccsTZSA
	3xdSpfjLiPlS89f5
X-Google-Smtp-Source: AGHT+IH234xwtUPOxphuk4OU/QS0XsrqNUoO1+smVE8tewsNcYKC6gtQXb6XlCEF1IIRTZGJuOd4Wg==
X-Received: by 2002:a17:90a:d2d0:b0:2ee:5edc:4b2 with SMTP id 98e67ed59e1d1-2f83ac026b1mr31193292a91.20.1738585144502;
        Mon, 03 Feb 2025 04:19:04 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2f8489aefc4sm8789225a91.12.2025.02.03.04.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:19:04 -0800 (PST)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neal Gompa <neal@gompa.dev>
Subject: [PATCH v7 RESEND 02/11] dt-bindings: arm: apple: apple,pmgr-pwrstate: Add A7-A11, T2 compatibles
Date: Mon,  3 Feb 2025 20:15:46 +0800
Message-ID: <20250203121831.36053-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203121831.36053-1-towinchenmi@gmail.com>
References: <20250203121831.36053-1-towinchenmi@gmail.com>
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
Acked-by: Neal Gompa <neal@gompa.dev>
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
2.48.1

