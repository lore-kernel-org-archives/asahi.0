Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCF6175D39
	for <asahi@lists.linux.dev>; Tue,  3 Dec 2024 05:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733202441; cv=none; b=tAlHFKNM1hh+cvgrMGNxZU516EkYxLkGF/pp+A8/fXpIuW9lulvaPaF7MarsnmCB+k4qCkg2Slo/GmbEr7HWMcRaiYaUjFxXM4KP3LBxezXOtAhNhIyDCctS+mq+y3ZqDscJDPegnf1qEzauW/7SDMwUG1IlGy2vpH1k945cphA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733202441; c=relaxed/simple;
	bh=99+pLF1VvDcoovFOPcNeSVJ7IG/4gdQK3UKOnT6V4Zc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SBqwNNGSzHTuUyJT8S+nN4YIZJ2f6LAXLnj3YlDpb8dzbUOYAD1jORJykA7SFkar9LZ6E6X5yA7Eex+Kpcx+HyMB//LKrS74j3ZdB9MKb7/nRK1gn6r2hUmuHGvy3xHFnHo3nDfb9mrKWSWVYBHaVkYL2+X3jheCAlxBSXV89K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NfV84veJ; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NfV84veJ"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-724f383c5bfso3883795b3a.1
        for <asahi@lists.linux.dev>; Mon, 02 Dec 2024 21:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733202438; x=1733807238; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eyr6yNUD2cI7FDLN2P5orlGmGipVdT5OT8foTnjmml8=;
        b=NfV84veJArPKdhl0nhCTsf0YLIHIbZ+R0u45JvHEr7q7BQVwAohiCYdJbio6JFH4aK
         i1yCxZ7hFthGx2OV+GPVT4JtKRTVm9euFFAEZ83dVhAKhrmODXNYWubCSY+ej7YKAr3y
         sr3vLQBUAs2q2hPmnx93NQCzIpnFSw1XMhSkZNMHdkCYETMrAaB0niIJaCAE4hfSvv5C
         UTTkFI7OAH+YbbQMjVrFKmOY1+xa1OYP5dlhgX4xB5kvQq51SjesjZG+5LBMk5CsTG1N
         0ANmemVxYCGCjJENGgB6zeKe2Jajl/o8HPilbDpSuozN+3Jm+ERtK4Uq+0r5vLvV+4qP
         Qb3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733202438; x=1733807238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eyr6yNUD2cI7FDLN2P5orlGmGipVdT5OT8foTnjmml8=;
        b=sDO8UXtJmx/JEDqNMrhYoLqQIhD3jpwn7djWRvwQXdHSK65fjtJsihKVq/4Kedj3hf
         /5LBQkCPnndA9eO55CSdUgKOTAzLTvqxt0JCRo2V40C9dCkpvBKwTsmVdSI3yw+aFSLT
         hl+qbHjXr82ElE2I1y7uFMgVQv+Mn+BPbL9efTNO1dbw7iM69xUhXYi5L0Hc1UYBK9q/
         sdyLKcRgX3PKXsRXGln7mcspL+vvWhaBCsqh7oK/ZqBBkydBiH1gp4m4fA51VREh5YEI
         ybKITrGy8i+EjVnoZIGYPtlPegZ0usYs3wzxbKXMFwsJVxkaJnWdEe4YYmiePn3OioMZ
         Ke0w==
X-Forwarded-Encrypted: i=1; AJvYcCWyx9ghlQWNFhjIbqDbEi23pG070TJp9VOuGkJvIi8S8Ir9Rh3BDffYhXZCkcSdGZ2oyqFEPQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9CIXBj52r1aelyVZxv76rcTtYDslgkAOFL91/thknIBhYfnf0
	pmR+bqI/nFkTfrx+PN1CLH4UFyhtUNexZxAuZNrSBpKZlAJXrn/m
X-Gm-Gg: ASbGncttK8PaJGIZ+ZvxjKhjXd/Apot5nIgVwkGJUIBw8siWRmFJ2Cu1HX/y/xwfByc
	dmMNPAUYAabAQbQ2Vhuj9YP2o15W+Px5BC1GV5Q8WEG0wn0ygp4fTu8YCekWWUDrk+1iXFqqCJg
	fuoriTKSa2EnUzpMx9zZ9neGIFnKl4A6g5evDyJo8q+4gu8EWE/M/CR/9OjsJ5Gm1X8GedMg43f
	oAIZpPQGAIzhFKnQCVLNnbLOK/+d6Sz1t5UnzcD03wReSCEopA2tI82vDX33yZLBQ==
X-Google-Smtp-Source: AGHT+IElMVKx4Nxypl81WAMWqHN+sikDERzQLkt8r2zBkiZ8BQoWhKpWu6v4bc6zILe9UH8q6vfqsw==
X-Received: by 2002:a17:902:e548:b0:215:b9a7:526c with SMTP id d9443c01a7336-215bcfbc21cmr19308075ad.25.1733202437604;
        Mon, 02 Dec 2024 21:07:17 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21586d40afasm33242385ad.270.2024.12.02.21.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 21:07:17 -0800 (PST)
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
Subject: [PATCH v5 01/10] dt-bindings: arm: apple: apple,pmgr: Add A7-A11 compatibles
Date: Tue,  3 Dec 2024 13:05:31 +0800
Message-ID: <20241203050640.109378-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241203050640.109378-1-towinchenmi@gmail.com>
References: <20241203050640.109378-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The blocks found on Apple A7-A11 SoCs are compatible with the existing
driver so add their per-SoC compatibles.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Hector Martin <marcan@marcan.st>
Acked-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
index 673277a7a224..5001f4d5a0dc 100644
--- a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
+++ b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
@@ -22,6 +22,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-pmgr
+          - apple,t7000-pmgr
+          - apple,s8000-pmgr
+          - apple,t8010-pmgr
+          - apple,t8015-pmgr
           - apple,t8103-pmgr
           - apple,t8112-pmgr
           - apple,t6000-pmgr
-- 
2.47.1

