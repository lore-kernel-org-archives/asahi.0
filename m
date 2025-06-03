Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56B322CBFE
	for <asahi@lists.linux.dev>; Tue,  3 Jun 2025 11:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748951851; cv=none; b=B2MsPMaLYlS4CmriRkI+8g0vZ5IBuWwnUE6Kg0TPkz3P25/skWBZWqSQhn1KkjhZXDwH6mpnqSeK0VZWwkMqaopXh5HvAAU7ndIvURqqJsyHR3Vs5zUbJnvY9y4m0Z9gXgLXQp8vPDwiuFvql1x5Em9xP3d52CvPHX/DieENU+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748951851; c=relaxed/simple;
	bh=ar5+pdd2TFr1JcFtgPO5JaiU/Jpg3+NCQIURcO8Mub4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gp3vtIgSH7osXCus5GDxaTNWzpGGU+FErjq3qf8Eab/b2zhJGSt1exNqsj9No2VqRGDWV+Ipk02DhzX13Ox30jYwstzzd8Km2NgtYaWZqtTCawPeI96rctY0lAo+pH9Dfq4AIs5g51UzVOJcnsjCDdTo8bMti+hvMNavtZrbUvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jMgFytF8; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jMgFytF8"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-451d41e19d0so2664585e9.2
        for <asahi@lists.linux.dev>; Tue, 03 Jun 2025 04:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748951847; x=1749556647; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ekpXsFXiBQlOEYcI0oMkBbtivVJ9v85D39Ocv5s98/g=;
        b=jMgFytF8/HD58n6w4iElDb21x14UGcwpN4cn0fsl02/v9XAVE3ACF9Sezx5rWCKn9E
         w1jlbPYFz7tVwlOpwMWePcf1xMl8aP3PXN9HrsmnH0BDil2hZb5L8Y5inI0eIfqmE2eX
         ghuT3AXrbkwjFE8kdIXMNqsvQ/uJrI6MdORPpLQBQE6eE+ppiTUFQamIfZPal0QpWZgP
         P/CYredzLF3kQ0JiG/WagPG3ocML5xPo2i11bFQZqR6AifnDSV+g1HHnBXYFobJccnQe
         tQpKR7BPwyfoTjIf24g4nblo4JdKGNN+xsnySYW3rVQFHpXJYlW4NvcrOsBDS3/gOnFL
         lD7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748951847; x=1749556647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ekpXsFXiBQlOEYcI0oMkBbtivVJ9v85D39Ocv5s98/g=;
        b=fyM7Ya6bv3tCNLXzlzPx+wGwezCAsqsdklTLO2lQlIL3A3l8tpL/06Jt56fcTxkjkH
         QCEdzfzmZ08gHqZFDYEvtGt+zgsTugA0fQgPIubXWEvm6k16mtor6tGzdJLPScmkMsOJ
         Bs4EANbxEq19QG77SEmkRfkZr8TNl5D5EeqNmLB+g6xYM8s5LHjwNPH/0sP7JR3H5ieo
         K/mDBx5tNxNbRrRdlb0FRzvGsrOzROd6WZSRoLeHExV0MLfSHIxpCf4FD/wuu5KTVW52
         rvoMvWJmEN3C1xiVMECnIESEL+PjfcbRw39biNOGDSsO17vxPSYm20GNZH9uTlNlMzOf
         8Fbw==
X-Forwarded-Encrypted: i=1; AJvYcCUFWoHGryL5bY850QaGa9Nz/NpaY8Skcu9h3Ln1I0Pkyqfh6S+2eOFk3+KemBvKvg74/pk/7Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6l9TKEpfqrESJbmy9riwTdUsS9kgC2F3jBR2zifULvYumhXMp
	bel4X0SOPYlnmEXEKDcK0ydmKLIRNG0tTWihICeGTMXVfivmD2XKBxi+BWtTujAII1A=
X-Gm-Gg: ASbGncvoYmAannozRnadRgUY1cWz7U2wAmjKJpdFWcmTVdqkmACtPb+ApYamSlOBoH8
	tZxeK8BFRPUcOA4nH6RT1O8pSigOhrHRUTboSTbaPELLAJmq+EWabUIe0qL9EHFPD1SFJoxnHYK
	xF5eAbCIW85ZalHlYc5K+e9qfcyQYBvyWEupl+ooLRI+uF2/RJDQM4RnIuoriNVoN4p3jf64lue
	2GoOJu5tQd9TYv4sZ5pNPhwmb2sr3vybeZ/wJguWTWS65TCPQfsYKQdisYa+HbW+NLLMhO3MIEl
	cvFzPP9HNZeJJ+CurV4n6390ERlCKIdqXnTiBVGGpsA3S9IBQJYOztXnEanOUpcRYRdMoKVlGPb
	dE/WptBrcA5gp+CYcJHgNqA==
X-Google-Smtp-Source: AGHT+IHBMSZmFHh0iBBqbg6iYgmvQuQtkRQ7ni42guJxRJHi8RXPAyYfJYKwxYJrmX9gnms5o+3FMw==
X-Received: by 2002:a05:6000:230c:b0:3a4:dc42:a0c2 with SMTP id ffacd0b85a97d-3a512c032ccmr984242f8f.1.1748951847021;
        Tue, 03 Jun 2025 04:57:27 -0700 (PDT)
Received: from [172.16.23.13] (adsl-84-227-104-5.adslplus.ch. [84.227.104.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c7adsm17671666f8f.26.2025.06.03.04.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 04:57:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 03 Jun 2025 13:57:08 +0200
Subject: [PATCH 1/5] dt-bindings: mailbox: amlogic,meson-gxbb-mhu: Add
 missing interrupts maxItems
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-dt-bindings-mailbox-cleanup-v1-1-724407563997@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1020;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ar5+pdd2TFr1JcFtgPO5JaiU/Jpg3+NCQIURcO8Mub4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoPuMafbts+SQHLrCKWoSXydLXFpBuxk4+UMd/K
 nu5qIc0ykGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaD7jGgAKCRDBN2bmhouD
 1ybCD/9RNGsVwuWaYUnIhMCF6XOqANSxF4pvD+oiEd/nFdvuoXKyHPDhNDJkzr5JI+eCG+Ub/MQ
 IFPA1Eq4zim5rKSJGghjZ4QRpCKGP/BiC0e3S+lzj0PcZ47Upq2cpIw5uEGa84l7HVOKXzobLHS
 4dtbpNI66GnxgZ1/hAQyG7cQ+b/JVVCKbo1XzHQdPkwO/sBtnEFmUp36ZDI/u9u2hJTCNd9xwDh
 z8DyRDvM8YT02OvK2sUVR4UoJIaFA43uNXyC0U+o2mZ/XAHLxkOL6t9aY9JhZ1KZ+heKhYVtVDq
 jq6Zz6go76ikVf85UUQkieagE/lk1hxHLb8tPkYIOVn2IR9e9sjHN/DFFOa4m725Ke7rxh2Q4FT
 3xEYfP/AU+h/cHPAK8he55zMq5tzMMHeNybBTtDKzJP6gXsE3UrINKmF/MYJBWgtu9wx5yWcFY1
 VYfpQ7cJNEoGpu/gPhFNVgrNwEs9yeRon6WMn3H12OTKdniyzdgIpnJ7JIqajxRgkZkKb7n/zxM
 zAzeos1xnYnl4qwTwwQHYBwmfVZYlkcYcXUthGxU188ahk3mMCNE5DE2eEzBmKlVUVfoGpETAFD
 xe8BwA6xrgnmksHotq8VKWpDAzKd0sqUmepz4DJDrs9GYrxZuqqnQzCCE7b34Hj7GArCuhFFaYq
 RxgIODOMV9Ib71w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Lists should have fixed constraint, so add missing maxItems to the
"interrupts" property.  Since minItems=maxItems, the minItems is implied
by dtschema so can be dropped.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml b/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
index 385809ed1569206a7304b777ea42743321c899ad..0849799ee0c5caaeb27fe1e3e3714a630a7c2b09 100644
--- a/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
+++ b/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
@@ -27,7 +27,7 @@ properties:
     maxItems: 1
 
   interrupts:
-    minItems: 3
+    maxItems: 3
     description:
       Contains the interrupt information corresponding to each of the 3 links
       of MHU.

-- 
2.45.2

