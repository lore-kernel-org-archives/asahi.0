Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC525158A36
	for <asahi@lists.linux.dev>; Sun,  3 Nov 2024 07:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730619225; cv=none; b=OGGf6D6ZSJQC3Y3ot1fH163cAhgg7/al+84erwCaXrWSUkdqg4myxHEiG5HOVinLsQKGXrxjnfBACSUo0sRoESE6VtdT8XsSWwoKkTsAyNtMOgo+Tz8CU4QKCDLichsSlu95eDamOKDsv2fQ5zwTm+x8BJTdZZdY9Ro9BCDwDuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730619225; c=relaxed/simple;
	bh=XEarR1V/wSScu1ltyWhNi5l0HHJogogwRXsmiHTLBfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GN08GuGbNK0LgaMfXXaENGYDSEvoetCz3XGoC3iSVQnlSw2Hrzb564mJFtyQuxcxhcFep7tyW6G+2+MQ01c260s/x60xkgaX9iNEzdLbIwDAwOQ00ib/4Rrps6IqlkTBrLsO0aELq2ZQQyMK96HjFC1/YXuLo98QB4+affSIC6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DMbpKO6G; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DMbpKO6G"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2e2a999b287so2704915a91.0
        for <asahi@lists.linux.dev>; Sun, 03 Nov 2024 00:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730619223; x=1731224023; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f7y+F0NAVhdE2hhGdAP0Oqd3utvxnAK6BbO2jtHkbzc=;
        b=DMbpKO6GfRRaxZ//d5DYRmVQeC3rZ2eb72iVYsp7TfGqGCPguBoTpCOtqFnnO+9GO8
         th1eVWnTE3cf2Mms9rqRN02+GBbWiZJfgxz4jv42gHd6XywAk6vtl6zAPVB7e78905Km
         Mrz+JWWLq4n6E8jTq5HmKB+NFyNUMDpQrAKTFIa7sBzRjXuSr0+1gBrZAWWz9Ni+I/bw
         EfMa1YWKrM8KfBu/06wqBeWVDZFI2Cw8nTX92VPB4YltxQt0mQifUCXPHmDVfn1nVHSg
         1yL6KsEwL1M3F0YQAfA1Xhn/GsKpk8dxzO2TVW73ZDnte/uvNJABm15WtkhfrueMlYB2
         /TuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730619223; x=1731224023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f7y+F0NAVhdE2hhGdAP0Oqd3utvxnAK6BbO2jtHkbzc=;
        b=YKN/JG7C+vme0TqxwFHGgZVRiPiDKuolEb5sTzDuxkz8R0ikwkoNtLcBVUzOMQWLbi
         jSeQfzsVVlyIMwsjoPhOs+idV9AhMnEw12oA6PE2LZBFX5iqALQ7EaKZppADHBCySUjW
         tDhu5ZojQQ4zKD/dXL2u9ZoYGK6OvNSY9URgg3ypoSuHWtE/ig/tuWiK2iSI13R2BgKB
         cwl57P80vU0odSUndB3enp5Gr//v//oaMqiKNbJH+kgKY7xoaNTet1+VN0xh3Gky04Y8
         scQTi5NomRPpvGYF0Te46WfqzJI/vhafXMwcvTsdFlLlJQRhfgp/xmX6LQAbU6bUuS5v
         NWTA==
X-Forwarded-Encrypted: i=1; AJvYcCVd81aGRyQ/CNExrfq4c7ZN+W2zgqJIvMa9XCjPAXNubwO6KPDGd4zwo7WetNl4ENMaw8YbJA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxOYoU8Zz4+DNBwV4GMlWvH0Ra5mLQ0YJdJu1in3PS7g2qtYBbC
	/rwCFl2dJRXf0Gng3X4HT/x+OBkPdH78ibCubgk0giSvZavP4HdQ
X-Google-Smtp-Source: AGHT+IE6qDUt9+yFC13+4w0ALhboEGJDjMA6yvBceFpgkq25mvQ/surgMUyOnPPCDOEl/rb4VKy2Hw==
X-Received: by 2002:a17:90b:4c0b:b0:2db:2939:d9c0 with SMTP id 98e67ed59e1d1-2e93c15bf3emr17260428a91.2.1730619223097;
        Sun, 03 Nov 2024 00:33:43 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2e93da983f9sm5353443a91.5.2024.11.03.00.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 00:33:42 -0700 (PDT)
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
Subject: [PATCH asahi-soc/dt v3 01/10] dt-bindings: arm: apple: apple,pmgr: Add A7-A11 compatibles
Date: Sun,  3 Nov 2024 15:31:12 +0800
Message-ID: <20241103073319.30672-2-towinchenmi@gmail.com>
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
driver so add their per-SoC compatibles.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Hector Martin <marcan@marcan.st>
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
2.47.0

