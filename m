Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FD22C3770
	for <asahi@lists.linux.dev>; Fri, 29 Aug 2025 08:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756457311; cv=none; b=DUlrWVFp22rx+G+rrBo15iVB5wGG4hfEjOI1qwRDFd3oA70wYMvBPNsZ5ZzWRiOrSko4p4gRhpqlmJ8i4kRqDr2cBCG8sEIS6K/hIpMxcDek7a9Hx3hd9Fv7S7zBKdWIR4id5J7ayVbXC7LzhFa4vCshDNrVFwDFIu+SiQOiKP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756457311; c=relaxed/simple;
	bh=WTcRU3ek4vi18/6+bn2AZBisc3HsqCJ8Oa5khMxDoNs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P38uVVE/2mzm5efNn3EyoJYbCpjG6GB5Vx9EiX3jHgiRHCEd7L8LyCkd4soK1PWuT1E2HLyU3LElhC8LOqvn9h6TbsW5igT667PzovKeheI5aa11Rgshn1H/YdbWOfvfLB5lQhyMnlwM9362Pm2Jily1jKA6zN5b36ZIHS5N1HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BxqOc/UA; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BxqOc/UA"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2445806df50so15316875ad.1
        for <asahi@lists.linux.dev>; Fri, 29 Aug 2025 01:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756457309; x=1757062109; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J3Np6RSUufpFZ+G05WkQGnHAm+bGRWCensQMqZVsmAo=;
        b=BxqOc/UAmVTwJtYI76EPW7epOsfGt7WkNhwQF9ha4YSqgbGCrSkrW6NxLVlCjADuSg
         Ibr5/td8yoecPqJQtqoyf/x+xwcniRlj2xA7BIUwgHJFy8rJ92lTdzZnlWQY14WU79Hx
         xki85fTOht0UrEJPeA/gF7oc4WAGQGFXJbykYkDSyfAvD3LDVRupBFvoWYqKrDBWMRmW
         oiWZU0El9kb+2zRdVOJlPd5eUhJ/TMnZftSfwtF2YW7ie2nTsY0dmqUZZJeUcFlfYELO
         m26C7U8FuBCxajUapo85KXg59sWhpqCUb6Cp/cb5xerwBx740KVdh75bjhm3/XdzaKlw
         x6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756457309; x=1757062109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J3Np6RSUufpFZ+G05WkQGnHAm+bGRWCensQMqZVsmAo=;
        b=mxUhpDLfpftwOUp6+K2T17p6fUjwRrm3/et+YXNjGBA+LlOmh0xH4po/HH3pQZipSK
         5JbDBm+1cracPjiT1vuxSgPjABAPMsaZHq5pllAD7NjviAejfgSpvY7bUhleDOth0S9s
         nF3lJk+9l+1jUada5fpdTrxSibFz9K9AWT3gfDOZw95wsTE5EolvHdzaGyIVMkGxpang
         wzzpNAzOBiW33MjK0BCko2WNyZBKHue9AQxf26zlnY55OPpjFGJ8/yg0B3KV3QuC+xFZ
         Rix5kFBhPW/y4CM0trlNLobWfrk3hSBwBQFaWM0qrfGz4OCdNlNCeseiJcWnyHrRESOH
         L8Vg==
X-Gm-Message-State: AOJu0YzBCDMq3W6MX9cqyyg7CLiaAd1eKOgp2aqyt7SeMau7koWun5OU
	iPHXpDNozgaMbURCBO8nkzggU9i5A0FpYlrgLT++6KyB3bftNhnAjJ0/
X-Gm-Gg: ASbGncv9AZXnjznmGIMg7lgzap0/68PciwhknxvjTyuidzH0H1LTqDuQvv1uHxYgamm
	O2Q5ORajmy23NFbpbFCHCinA2HT9DgequSEy0dPyF2PRLTQNHIUlBuomcNchVODmpE0oVXlAUG0
	TqRViFYrOv4WyUW/LejNwW5XqDBv4tZEzV+uh9g033hTcIIzVqJQr7mG/pgvg2At8czQTyz3JXV
	lXEvVBqIgezh8CZUBsBaGpSzOpt1kImJa+9/Hro5OEq/7YmQM6qDQUXPgIbXEHnEZuLD9puetZA
	pulDWGs154di1B4BqNJ/wuFLCuXRF8snAigaSJZDdyTVC3fKPO8e8HJjUeKmXMf6bkTiWdmJgYF
	qknD7no5d8nYAKnjkfk9yf5nb9JCOY/8idNm7wRYK2hQRBpXa
X-Google-Smtp-Source: AGHT+IGr6dfrRRQuVok1ow5zCKd2/gxu4vBTmvpxzkkEulS7SF4Yl3RRi4c9dTaQzlJzsA5mQVlzxQ==
X-Received: by 2002:a17:903:1207:b0:240:5549:708e with SMTP id d9443c01a7336-2462ef942bdmr327011365ad.46.1756457309160;
        Fri, 29 Aug 2025 01:48:29 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-249066e042asm18162565ad.146.2025.08.29.01.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 01:48:28 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 29 Aug 2025 16:47:00 +0800
Subject: [PATCH v3 1/3] dt-bindings: spmi: Add Apple A11 and T2 compatible
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-t8015-spmi-v3-1-58b15ee2c825@gmail.com>
References: <20250829-t8015-spmi-v3-0-58b15ee2c825@gmail.com>
In-Reply-To: <20250829-t8015-spmi-v3-0-58b15ee2c825@gmail.com>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1240; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=WTcRU3ek4vi18/6+bn2AZBisc3HsqCJ8Oa5khMxDoNs=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBosWlU+ZIQ+k3EFIaELJ3w1MmrvGHBvq3g2+23D
 s6WkgTaLJeJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaLFpVAAKCRABygi3psUI
 JDEDD/4xS06N6hYF6BFqyUS932VY299g48zcagOnmAqRFAmzva9MtJ5fPzMXgIPXeGGDOV9GYWC
 vkXl3U2H+2crxZanliHx+XuTGcYuDU8Rocz9wwIByWWEQym+PiiZk9umQyzjwfs77oM/5xkqARC
 RTMxzhcB7m9xyRxXhGIgavgPVdBsX2lkL8uJwk1smD494nva3kpNj73zoirxlmAc/0qIS+KDhmn
 z11D2eokz1GHghS5I3o0x2nC4PrTEWsH92uFlWYLC6Dk4RHENjA1f0b1W37Qt4S9x6c/UYv5hCH
 GZRLSpaHsUzdy588M3wDxqIIP3fHqPiAsbtH+UfxGez9tc00zDpKB4EBZspKdPmYTunH8D2RKIm
 poBnhwm7OV0zI8HIMe0+u8MH4RsUUp5j20qG0X4lFnsda9Y4gRNtO2DrYjtZjW1+SaMGpp4BFfZ
 6ZbqPhKzPaAxk0BBNpECAuJglxSJRcEV9Ryv684at4ES0ZDxuRCa182UIknUXoRnYF68AslwSKT
 JnALU17lOi94vDHewcKwOgTd0LNw4dNE2biEZVbopcUrvh2v9mmRXkCd7De1tlE0IHmacgUDTux
 ARQtdTq8bS89FK/MkUsuH4dvt5tLS3DvYqJIQT2l9tEDu70wZUFZSMwdz//TTbI8XHq7Vs0/zID
 a0eTKWm/hVZsgYw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

The SPMI bus found on Apple A11 and T2 SoCs are compatible with the
existing driver for t8103's spmi so add their compatibles.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Sven Peter <sven@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
index dbf09ad0ecdecab82074344aa6a840a820bc448a..ba0ec92a55d4fe14671ea71b5c6d530d1ac0b11a 100644
--- a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
+++ b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
@@ -18,7 +18,10 @@ properties:
   compatible:
     oneOf:
       - items:
-          - const: apple,t6020-spmi
+          - enum:
+              - apple,t6020-spmi
+              - apple,t8012-spmi
+              - apple,t8015-spmi
           - const: apple,t8103-spmi
       - items:
           - enum:
@@ -27,7 +30,6 @@ properties:
               - apple,t6000-spmi
               - apple,t8112-spmi
           - const: apple,spmi
-
   reg:
     maxItems: 1
 

-- 
2.51.0

