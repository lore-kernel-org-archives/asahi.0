Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03603266592
	for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 14:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739543434; cv=none; b=jPd0WGOZ9ruEYfVr1oZwJgxPJXSvp+hbDAEi3ZA0Qib0mG9LtFYqLnX9sjaAe7hYGH7exPSRharhL346OxdTuSJibl13QRVOTAIcejyo4WdCKZUXYuX/jwS+6gTRF0/CtTZ4JMcozXACKAiw7qaOch3o6lteO4R2tgzn36YKzxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739543434; c=relaxed/simple;
	bh=IvblILNfK65nRmNXFfVq27lzQtZVkqPdlXpIO65Xo5E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KG6HuEwsPYgmrjkJLiq+KDYdAF84tmxE374sdJELanqA7WgeF+R3NSKebgSlwPvJsx5nTQK7jpTBOLQ0G9PgTi2dSxg0m4Q1KWWJaDU6pvxJPPWX/TD84IvJ569+iDd7PmZINJCy9RblS1rvn7SiI4Fkunvpid8pVf+rDuLCNmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JdNxpm1N; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JdNxpm1N"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21f7f1e1194so53416225ad.2
        for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 06:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739543432; x=1740148232; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9vprohxk3JreCnU/aMQ3Cwcsm8vUQGIhxwt5YLfMxZE=;
        b=JdNxpm1NhHF3bZyDAsUaEwVNvXoQ1vUjft5vo1VImCHSj64Yke1vV7FPtn35pJg38d
         Nc9Qjl5LDzoXXqFTuFc2Ya3vluFhaS7YGCg5+l6PJu8QztuhgpIgS3g9kN0JF8yDlURr
         AnqNaU4Dp5jXg9xjTEN1BiVCz0a4ctGOqZuj1zTOp02KBmIG9xruuSqogC4Gw3IxwQq2
         JoTBlI422DI6Xpx6DjHz5FF7b3/V4LffsXa3sDR2g2YkQSTSNmFuieUEBxQ8klAJASOJ
         IGPxWJcSazdiuHgXXxkksQdsd6xDPOx/7KU9LQxJZaSC6bk26Jx2j9yH/QNT6DfT+8C5
         26hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739543432; x=1740148232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9vprohxk3JreCnU/aMQ3Cwcsm8vUQGIhxwt5YLfMxZE=;
        b=RuelyDwYD769ShwHP+dgBDshdS8AhBxBh8wWAG40weZ4y++xI+0XpZOYqQ1Tu/eaTO
         bY4pXfaDaxwAFr75IiovqTqTINy+YljrT/6Qu9sljVjq3y/0qQXkdR2w3FE1jqHQgo22
         KfE6wf7A969wu7u9yQURy3D9oftbZf+5NOUhr+QeU/srNgOnrE9WPjLTrPOmW0FuT+TG
         oaxCaa9UI3pEjl9btPz16Z6zSMRMxeWjng5dMuGXB9CSRZmpLFv8Zaa72bEaEZaCZZ1U
         +jntDwr8WdKkyPTfgofS+KSBOjA5q2XkhNRO92yXBRXer9GM0hWsai3XTg6VPgmQiK+B
         2gEA==
X-Forwarded-Encrypted: i=1; AJvYcCWoDinC0RpyWVYtIHPouzg+4r3M6mWHwWTQhc+iCVnmh46Wf1sfg9cWPMxMOLX6QTMLiJl5bg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxBX/Wrcnz4o9FVWQ2M41mPcYHRJeA+dHEvu5WD+GcXQvcclTuX
	AcGLuqAFa4HK8y/IU5PcMDtJv4fpZ1V1jW6EhTSpBdKN4GsEl0k8TmDZSw==
X-Gm-Gg: ASbGncsmtbCcknRmILpWpfeQGzQLep3BnPNpUdQUCD3KQbhJxYzytva395Y6jhBJoEZ
	aAPKNJN6E4lKR7FbKXR2n/7fDu6YQaXEYdW8NjZvuBDnaXldaY6X6V2kc2/vQJkZzyHYisiyz/4
	l1VnzMYKuswHh0nigo2wrUtZI4gSfjQFU7X11QzYQ7UCYE9IqZUnRvUqjRxjFV0pnifalWZaFet
	uFuOIVdJZU2Vuw1KvzGbKMKFXyChZOBRDPBUUZIzI4rZgUlxRyenHGf7SQQ76z3IcYnH+MWsJPQ
	fW1BnHgOOWSP7GAMGA==
X-Google-Smtp-Source: AGHT+IEu2Hb5pPBgql0J5zrtyu/OArrfmnQCdrNZAsm5tiDRfDCnaHp3/5nPXiG8C9X00s8G8YzcCg==
X-Received: by 2002:a17:902:f68b:b0:21f:1096:7d5 with SMTP id d9443c01a7336-220bbb209camr182567835ad.17.1739543431767;
        Fri, 14 Feb 2025 06:30:31 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-220d545c8d1sm29490315ad.113.2025.02.14.06.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 06:30:31 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 14 Feb 2025 22:28:27 +0800
Subject: [PATCH v4 01/11] dt-bindings: arm: pmu: Add Apple A7-A11 SoC CPU
 PMU compatibles
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-apple-cpmu-v4-1-ffca0e45147e@gmail.com>
References: <20250214-apple-cpmu-v4-0-ffca0e45147e@gmail.com>
In-Reply-To: <20250214-apple-cpmu-v4-0-ffca0e45147e@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=IvblILNfK65nRmNXFfVq27lzQtZVkqPdlXpIO65Xo5E=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnr1N/3AiQ60M/18EKguryDnvFSc8EpDOxgVFQn
 WnGb5RK8MaJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ69TfwAKCRABygi3psUI
 JN7YD/4zOhnKwP/8gjH/iYxy8EzNHBKW4M0lhDY1BbC3KPoAx+9ZuPGLOH70VB7T6F7r8IawTxc
 HCns5b69zzvzgRD80Kzn+qDqbm9EmaD1acIdmdF4s+jdKSWu/ldoW0yBhtfajoqg9tsk+vVUfXU
 2Pg8j9go5VIaACP+7mt9S4PQzambMtsJ9/hA6heFk93g68xUXBlxEbMb5c9SaVz/+7zahh8usyB
 7bwp/2wJvgYLN4uiHdBpxZRYjG0T3G6nV9l1B6gdlSCmnhqQ5uqinPmdPNWsx4jD1UIY6U6eNsL
 xmHkfQa9Ad/DQ3G6qk299EQTPTMMIlGp6LYS8MJ667rwBN5/1gTU/lPniRqO/XHPIbtRoWguK21
 /CLbTPqbUCyiTkFU5o8m5imLiaGTzDJJ23pnvvI+nnrcdKBKb372bOf0miqwtIOeNptuq5RcJF7
 smY9NiKRS7lVHDY0bnYq5kL+0fAzhXnT8h4QkWYqzmAEOY7JamxjYLxnuPzBG9HryytxUJkvYbi
 Vl4mpqp0PUpjD/kIWJsJdtlnqN0ez1YmHYYdqgDdw0jV7bvFG/Yl0y8/6tjRdgFM8HApJzQHPj2
 fiRZ+EBgLkMjCMfv6UqJURbbW0M+PW4eEIaD7cD735Zqk8UZ8DUoEzYZcjWqOMQ0biFiqNu7CIM
 apcGbdemuPN4+JQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Document the compatibles for Apple A7-A11 SoC CPU PMU.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

