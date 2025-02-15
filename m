Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B089F2907
	for <asahi@lists.linux.dev>; Sat, 15 Feb 2025 00:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739577808; cv=none; b=Dzb4EMCE/WFYc8FWorWvDuuMzGRYqdY5yIdYLbhTzCQNLVwlge8ZezoiiL4ltxeqxCHx7CRg59ocramung6D32o89zJqLlLD9rMTfwivMToPKVYEmjcq9MskSPMLMk4hrQRDJ06QFVfoKLCTrOWcb3obAY6WSoC9xfhp9Qz8Gz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739577808; c=relaxed/simple;
	bh=FjWbE1IyJWiBoXxC1LiNt46y4bEDaFe1rHhJ8Z+mnXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OU95a1dqnEMSWRrZvDMo4RYiAaEhhSrR+dXcFMMn4xNCurx+CvM1QeHJpnaQ+iCVxxnLiblVhvv6gcBtGvfgRLdvHAFjrqiJiw8MEuPUwYV0Z5Wpt+NMGjuOLklUTfphP1eN2dCK1wjRpDn+xNKBgVWQCPETohKnxIkNXUxQEUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q0WrclAk; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q0WrclAk"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-220f048c038so21026255ad.2
        for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 16:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739577806; x=1740182606; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xn/Q2lqhDKgzbaB/ZxoHF8BZNbugJdXImWKll5J9PmI=;
        b=Q0WrclAkIK/wo+l6cfoWkmzPljYP20q5rchnHf5OPJayLk5NCVhkvOwCa9VgiqPDey
         3/Mr+vvkYBLGFwtTMWlcHRpJRUNkybo4BjYP1JmUoT0MbkKxJJ/40L3IJiEUrrsYEVuT
         kPy7qn5LNyIKD+Kwn49GWnQcJ5DBgPYyxssdxIvLKRYZV/HnZ1yHCjl6hE84LK8Lm6+M
         x9IU6uxp0BzFHvQrRpt7JxuBTp9/6aWUhpyU16uKTROW1Oc/CR61X7RMfzUVTFTmrXzX
         lMYGVk4gv6xMEDyhJwY1SEL9CkLVKmadquTTSt7+vGF+GKAYpLVgtN28FfEnThVP/ju4
         fLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739577806; x=1740182606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xn/Q2lqhDKgzbaB/ZxoHF8BZNbugJdXImWKll5J9PmI=;
        b=JjRgwwTA9+zaydA0pUjJFOusc/3UFl6Q8K/tf0UlVghqye5cJY6uwqE95lu8icf/nM
         WpRy3wnXuKBnoddARo5xelKBMR5+3rTy6NM7k5XDAFnDcIVbOX8YDxO0JP2j3X+XcP/k
         CPPtEug2l7u0Y4kAu1osC9xaoBZR1LtCCM8PHCGY0zNHitG7aVjbPP/4lFoOvWBZQrF9
         9zaQ/2SpBPoYa8EAP+cgEV/Lho1s8HkPOVb8ggj98+PhQ/jt3aN6V9B/yvMFjKBgPjVY
         v0KxDhkiZxKSjCNxstbQAHZJntw76HbDQVPZu53a7yJkHKWjq4A4bAFVhEusUFYRomHj
         Z7kg==
X-Forwarded-Encrypted: i=1; AJvYcCW5mgz8NsFfVZTx6pE7wyrzDfj8YOLusBdTZUCmrTmIl11bBBS6Vu2Ux62UBHeya8lv65cOWA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxoTDDYf5S4+uoGuP8Wtz+LqM/ZXxPFVfSwJDQiLeiiOqm0q3Wy
	FSiIxgKp99zEbC88UJFqDTL0rSTjI8vQs5YnLqhL6xyGSGqFtrAj
X-Gm-Gg: ASbGncuRpR/dhyPty4TZh/7OAXI8RmhfqZ+G2v+XKyAN8ilUxkzQfzjd/Bre3+7ESLU
	PNA0gOVBVQOCV2tzW3su5NNL4PF6qNy192YmRZqCu4mlvWRe2ZrvV8AE8uNPa2nOminn566wTwG
	PThFgw9TVonP7uZ010m1wUncFfRQiz1gxSBd77OiP9G8uIom+iVldBmrrBhySfSDnZlJggT8eEt
	TxPENxMnY9+RQc3R/rIn3HoC3EwVEAsNe/3ClLVrCpAu7qbkk8S8h8GVVXvQKtlhxsExxMm9odm
	a4FWRXay1qHmOqLK2o94+R3QmUnx5Tur5CCXFilvxXYsg8e1coKjVV0XaVNlKKxOYljIPWIqpkX
	vTrp6WICyEA==
X-Google-Smtp-Source: AGHT+IEkI7hAIl1/LT5bR+p2wRPhjrdUdQ9wBURhs9JdkCPWqEzufYRgQeE+ueEqyVaIvunbeiOQJA==
X-Received: by 2002:a17:903:2f8c:b0:216:2bd7:1c4a with SMTP id d9443c01a7336-22104062be3mr18807575ad.26.1739577806066;
        Fri, 14 Feb 2025 16:03:26 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220f26ea127sm15071155ad.96.2025.02.14.16.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 16:03:25 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 15 Feb 2025 10:02:35 +1000
Subject: [PATCH 02/27] ASoC: dt-bindings: tas2770: add compatible for
 TAS5770L
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250215-apple-codec-changes-v1-2-723569b21b19@gmail.com>
References: <20250215-apple-codec-changes-v1-0-723569b21b19@gmail.com>
In-Reply-To: <20250215-apple-codec-changes-v1-0-723569b21b19@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Dan Murphy <dmurphy@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shi Fu <shifu0704@thundersoft.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Hector Martin <marcan@marcan.st>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=736;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=FjWbE1IyJWiBoXxC1LiNt46y4bEDaFe1rHhJ8Z+mnXQ=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOnrb25p4rOT1lxXpLQqq//RgdLpdU8Ml0XvlFmu0lJ4s
 09l6vOdHaUsDGJcDLJiiiwbmoQ8Zhux3ewXqdwLM4eVCWQIAxenAEykchnD/7S0NUcdaoLr50V9
 q7o2gf9clPc/98Vmaq7cvdtmVBRy+jEydOtMcH3SEF90ttXP9MKb89n3xfXTji09It+bwP3bVJu
 LDwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

A variant of TAS2770 known as TAS5770L is found in Apple Silicon Macs.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/ti,tas2770.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/ti,tas2770.yaml b/Documentation/devicetree/bindings/sound/ti,tas2770.yaml
index 5e7aea43acedc0f7d8c22e36debfe805c7ebe74f..8eab98a0f7a25a9c87d2c56fd0635ff8ecee17d0 100644
--- a/Documentation/devicetree/bindings/sound/ti,tas2770.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tas2770.yaml
@@ -23,6 +23,7 @@ properties:
   compatible:
     enum:
       - ti,tas2770
+      - ti,tas5770l # Apple variant
 
   reg:
     maxItems: 1

-- 
2.48.1

