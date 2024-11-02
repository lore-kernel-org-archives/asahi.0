Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CE774040
	for <asahi@lists.linux.dev>; Sat,  2 Nov 2024 01:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730509844; cv=none; b=RXZRbaLHAF4cwY32eMcHWuuIl6lmPn3vTkydmcI2hpzDxFf8KUnTE+33FPG+PS6CNftS6aaLa3jXR9bXN9x23TOKPbTK6N/tsLIZAX3hdC+j7CaLK6Iq4A0IXYfXv78v351yk7dyqcsKPzRI4zc5IWjYgJTTfdHxX0RUPgiypv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730509844; c=relaxed/simple;
	bh=hDRg0YaHnMb/3mj2Hdxk7ZixHZuwBUovjfJTVCdFUAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CORL9HcQaDOTIffXwLsymbXvfPg4LHyIRvsm8LA7uzQQlsykpZVQkLLrkZyzaflVp8WYj9wP78AlXYt6aW/G7kq3bb0+OanOO0wAvllHO+yW6GLW2/FyzXkq3tVw12dLHqxya4ih2y6KAtH4Vb5kmRYFbFHbn4fDl2RAMO4aHK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JB4dpc/J; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JB4dpc/J"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-71e983487a1so2112195b3a.2
        for <asahi@lists.linux.dev>; Fri, 01 Nov 2024 18:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730509842; x=1731114642; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cAhPP1Ue2Iis5GJtsj6WYVFqMLGyqRg1DOrYPcB4peg=;
        b=JB4dpc/J+FjZ+0MenJIZTgWofw6Rzl9yxXOis2l08lcXH6NCRS8qgwp1/2tgjl46qO
         Y4oBraQztqbarjAFlj4sDn2pcI0AcXtrw3jkrZelix+fNA2mUCtmV9r5s7VXghlg1AXU
         lprvL1lrJRZhCGbHc6Z/Q1LYq9AuM9lNNxbkla+zmif4m/Q5jo/5O+tuUYYbG8U4bRbw
         QqlwIRgfhbau1AFexSkwVa49uFIHkWf0Bwb3WDhMG3m+RoCktMbzbRHxVXEhgJ7PGz9C
         Pf82hESe1Qdi8Vj5ICMawZieAlaFlXhGddY8zXJWqSZ3xVwTxCmDccxiSPqM1e4BjKkJ
         Mb7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730509842; x=1731114642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cAhPP1Ue2Iis5GJtsj6WYVFqMLGyqRg1DOrYPcB4peg=;
        b=nMgREqkyJ4N/6COttB+vWWAVSx6OcPqQa6ERyDyTfllGZ9FVJS1FLJb0CNzg9r+E7f
         Y9KMiahzchMgWO5enI1ZN7eXyvb9tsoWYxUeAcJU8/rxXHPH2lqe16fPhKcG9iwIToap
         K3GlRwm8mGcAmBsH5ONt/So35QpQXpM+ZoOvQSK09+Lyz9RS98cpiyACIDpikR1XCxda
         5iXuNDgRvTL+5vqExn+jveCTXBX0YmwQ84zJNfgsVh5HuGXdJ3RvnTzzNvWf9W66G4CU
         6QdZFqeWo50PBQJW4NCdC0lcIRW1P6QXRtWaJKO2FZFXzYASimG3v54I2owY9A8Hz9qi
         xQSA==
X-Forwarded-Encrypted: i=1; AJvYcCVQExdtmTmL+oMbFfZ41OEdGNJUvErLewdrz8otjm9tXSUve7ewgMFZEJyUMhmvkqhO5haQIA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxDYkbn5QCWsJdN2AAriy44wsIMAm7/RL5bRahq4O3dt5/1tjss
	ERtBtSxlevH7+b5khI8KV4ijbAnujdKbgVR7Govnuhma8NVXHXQq
X-Google-Smtp-Source: AGHT+IHglVfwgkkjP7njhQl+3LEzj6gkB4V5uSI54EF36HyRqGCWy+P/+5iuFidHPUysoa6ehfZecw==
X-Received: by 2002:a05:6a00:1817:b0:71e:5b92:b036 with SMTP id d2e1a72fcca58-720b9db47b8mr12441036b3a.22.1730509842363;
        Fri, 01 Nov 2024 18:10:42 -0700 (PDT)
Received: from localhost.localdomain ([49.130.42.137])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-720bc2c38adsm3287708b3a.133.2024.11.01.18.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 18:10:41 -0700 (PDT)
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
Subject: [PATCH v2 02/10] dt-bindings: arm: apple: apple,pmgr-pwrstate: Add A7-A11 compatibles
Date: Sat,  2 Nov 2024 09:08:24 +0800
Message-ID: <20241102011004.59339-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241102011004.59339-1-towinchenmi@gmail.com>
References: <20241102011004.59339-1-towinchenmi@gmail.com>
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

