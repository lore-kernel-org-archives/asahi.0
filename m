Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F342D22F74F
	for <asahi@lists.linux.dev>; Tue,  3 Jun 2025 11:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748951852; cv=none; b=XX1GlTJf+ghpf+XHOdrh1T4UE1zBuRjTuOvmjo8yGQq+fhutvKZf2CcTUOpq7/8y566PwgmNckEM8El8fMHGvEvteaDTgK/oTm3qgR9jSmwUFqzsqzlBfyHlsiAomnvwz0SnhC3xVy4Ku+3kXf8xacvTlaIfmbwKScGnL2QB0uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748951852; c=relaxed/simple;
	bh=PmQVq4hQS35gwAsgZYe0MBq9ErqtT+mom2oZuUDxvi4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CndNA64RlK9tp86gb3Adin/T7iVe4grgS/EQsOICj9cch7J+oGI6DxT960RBCYaRtdmdGzPqBZ8eG1rcSUGvhpRB8uSTSPbn/lvbU29Y5O+1SCC/1W57AThw2n5pDFe/g7g/2icKyrPS824KNgivlB/HlHsPduOhiY3BWVKdKW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HZTxrgYq; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HZTxrgYq"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4ef892ab2so740392f8f.3
        for <asahi@lists.linux.dev>; Tue, 03 Jun 2025 04:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748951849; x=1749556649; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P9iOMNCqnm556i6iWSK9mE2UkHu3B2asZSKy8c1kTbA=;
        b=HZTxrgYq7AkdUfNP1RWy9nzZhnBQeB0GdK+2/gW1GsYc54VSUcgfX5ePAYcFkIfH3D
         0j8fe4nQP+is8eCEm/a75qmSC+kmjxbEctIAamB+5IyCHDy8RdacdHSc1V013q3gY27E
         OhiGJWeuHD68kJMiJ2okSgFX0puKIFW2dLobD9Jcn0pLHg4Sng31fQv5G4cV5wD27vrC
         0mIbpq6ffqWGF2cPuy/7vIOJ8SbFA0+iD/DJZxfBoaSJi6yYM6UMKfQHWDyhS9/pGHP8
         CG773v0GFJJSTECzGqNURS/6Sdm7fjej95FwqY1p2lm0u1MUyiEOSrc4AddUY7GWk+IX
         x7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748951849; x=1749556649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P9iOMNCqnm556i6iWSK9mE2UkHu3B2asZSKy8c1kTbA=;
        b=uV75FZKt7ULJnTgsy3aA5AarKMicBabWnttb55nTzV+yqdVe17v9zP7RBk5sApGpas
         9jk7fHMQODiWA/hR4e0NvxqFT86OoA6XfB+iaWBAQjTPcMFyC3S3Q6SbYcGr6rzvdWkx
         /bzCWoy6I8RrFQw2vFaAHWDMJppM1h/xAZlxdf3QJsEFuVYjacQiAtG3BwOB7rhSAap4
         TxtN3XV0vXhcNZxeVZoiReertfxRkMN5yMoz2Ysm8dIFb98/HUi52IiaU9IfdqnbC8ex
         powQ0eUhKxP9f5ijGcjJ6HkZwqRCrlME4gOPHGu0bTYKawBzrzfPF6ZRIls24dW6XCJP
         YaCg==
X-Forwarded-Encrypted: i=1; AJvYcCUST+8ByQuDQBKaXtFRaQ8lmG64xAUAydYD8sFzbGzpnXql9ewgIBtjvMHevv33UPh3yCEK2g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6sXwHFHgIY1pjirG7GGLJoJ/YYbTkKS4NKV1Nha8TQidqy01S
	bE4V9jrEZzSbGbxoYpC0aFLlcrc1zmTjNHWR1sQDqGTRwwTV67fi7iNv0q+kcCW6/s8=
X-Gm-Gg: ASbGncvk7M0v5B9ZWUS/s/xab0XLYL952PqUseqo0BwXCGuz8Xe8dSf2XlVXpghXDuO
	2qCCnVDY464n36uz5aQEoKHeE3Ce8iMbUgShRntN9yyz6rXnYj2kZD2sOLtlv7l/7ZYLTtCi4GL
	tv6PBg9yXK26OE9jPKfcA/gJx4eBKIktpmuCZJHUKd+qfUNFXSCUBK4QoRBYO30CJ90FuW+Ra97
	dVSmF5gFHZ10XWDkXTEYaiKDjBdl2rbTXVxdWbSjLMv4KmGoBWrhJgKSwt1eKMuIwBzQOKYLPDw
	WZPEaQ0lF/y6b+ElX1gjPSOd59gF4ZWIscIx6Dtj+ez9U3CQfS1/UVIke4eqtBCUCLYAyhBsFiG
	gQzptrEolY/ayrFsnVxLTMA==
X-Google-Smtp-Source: AGHT+IG6CmWM3RslzVJ9Zs6x2OnxvGd9okADIrUTxvkVwVY0rJS07w9DnVo5m/6fQdGbvnL2BjUAIg==
X-Received: by 2002:a05:6000:2886:b0:3a3:7049:f947 with SMTP id ffacd0b85a97d-3a4f897bc88mr4781768f8f.10.1748951849223;
        Tue, 03 Jun 2025 04:57:29 -0700 (PDT)
Received: from [172.16.23.13] (adsl-84-227-104-5.adslplus.ch. [84.227.104.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c7adsm17671666f8f.26.2025.06.03.04.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 04:57:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 03 Jun 2025 13:57:09 +0200
Subject: [PATCH 2/5] dt-bindings: mailbox: ti,secure-proxy: Add missing reg
 maxItems
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-dt-bindings-mailbox-cleanup-v1-2-724407563997@linaro.org>
References: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
In-Reply-To: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Nishanth Menon <nm@ti.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Suman Anna <s-anna@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, asahi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=902;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=PmQVq4hQS35gwAsgZYe0MBq9ErqtT+mom2oZuUDxvi4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoPuMb6qbPyHvmIRIrN/4NfNvZ2r6JN2VnhQ/rt
 P/6fx1bFIiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaD7jGwAKCRDBN2bmhouD
 11okD/9H8uQVKm6Fba6vs1oJEhpW2E6WDVf76MJKju/FQ59Kihwd3IlRjqvGcI3JVd0sghwfs5E
 dVHRZW7lejfKzozTRGlzYKm8jWya/bma153cjRkvzpDQ4dCBvIRrkIYg1uIO2KFYZbF+V1iRT3b
 g7UmqkWQqU2Xb3Vf2CVYNjeCKU7YQMZfAM2zsm2XqrHunsByEHhmiuPvSN4lljzOe//vWePZRWG
 oO8322aArQSfeBI4C52Yg3eKV9fHdvXpB6DijXi8YYx1Wb7SNfaj4LhVu8ODa/+DU8SGRNlxNP1
 Z9PDMuPCdkOOHza9p/Gzg96ZEX6jiKXZKNLNsZ+MjGfjP+789AdQqGGgMgnuGAk8XzT9GFl8lwQ
 fiu3PECrJ9h2dK0zIrh7fps9SVMjmuxVr4ap/yatDj2cnoKj1Ecc3/++X50tuN4BcbhEcrwOBNX
 KhkMPb8L/I7QgZ5Au5q7TpxMhDVfJXNqe+Iy+pY/JEE4GthRQjtzicDApK+RT8f+pceNlH4Ic/c
 Z1yMhvvNcKbEQkmwRPFyFCJHuv4iX9VNx0nZOxzJnR5Lc+ILPanys9dW3fr6NbwJo5ZlEyyJujQ
 JAyTMfMPK7r9ETJN711C9Myj4NJ76EYYBkR/8yBzgRKUIZmx+mA4WHhJApZvSUkhlTtOCzwMCuu
 LpLpbn5wLmTgrQA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Lists should have fixed constraint, so add missing maxItems to the "reg"
property.  Since minItems=maxItems, the minItems is implied by dtschema
so can be dropped.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml b/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
index eea822861804c259068aa8c4598188db28895518..682ccd76f5c25fc13bb3375007d39e6208cdddc0 100644
--- a/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
+++ b/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
@@ -36,7 +36,7 @@ properties:
       - const: scfg
 
   reg:
-    minItems: 3
+    maxItems: 3
 
   interrupt-names:
     minItems: 1

-- 
2.45.2

