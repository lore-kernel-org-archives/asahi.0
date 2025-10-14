Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA9629C321
	for <asahi@lists.linux.dev>; Tue, 14 Oct 2025 15:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760454265; cv=none; b=QsXECAKZTaox0dV2Z+HRVjLMt8V7F9FkMwTxyCSyVKB/2auB+diD1BNgraVjzSyimB9orGkZ5vvS5wveHa68qfotbVon8GOvGhkqP102Fd+i3eIdErkJCaiwqbL/EA0QlXCg5Q49riPegw4w2saaQGa2LJSvHMCMLLeI9J6NVFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760454265; c=relaxed/simple;
	bh=octx4ZTnNO/R4DCoPqgavGVNNjwOBSkdB0RJJeuCRxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LOeVNIQJteMHrlGbRRW42I6lyO0AQsudTGU8HBtDwABB9kr6maSoa1FC+OOnET5vPjKH/MzC06bmmW5/+Iq+eXnoUt2Eyh5NNcz8nAjstGQic/voAloHlewwhvgkPUK/82VbDLsPX8aQM1GcyoyXVc1705xwASjDZfguhkaKjUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gsv6D7Qg; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gsv6D7Qg"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-789fb76b466so4965758b3a.0
        for <asahi@lists.linux.dev>; Tue, 14 Oct 2025 08:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760454263; x=1761059063; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v7IroGFfuMHil+70rPWoixnASrFWM1LVOm0U4Tub+go=;
        b=gsv6D7QgxCnLwH5pOlzJbeY2+UivlQRWS+bwyghqQi8Y21gqyrNif5smxVXG5sjMSm
         j1Qp8t9lmUvamov+EMGf76CjcN/6oLBDC5KkuRWaZCUD3N5BpQVzc5LjAAvzLNR/QuAr
         XQ0Q4Qg539DKiDL0pNYcCL0ODxkhHZuloZBWlI+Bo96U4t/9OxsXJQzzCT5Foj03UHvi
         yek3sd9Qvf2+OwevFIDXF5fw6Z0OMtAEJg1vZckrNHion02Bpevhl3C7UKz/V/CWorWp
         Sn+OslZ/lVWulQOmWeq0Z3bU0JQoUmCnRe/rJw38GQlaSaWeEuksA0ArW+luKPi4Y8bb
         mHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454263; x=1761059063;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v7IroGFfuMHil+70rPWoixnASrFWM1LVOm0U4Tub+go=;
        b=bxGMGnpAKSsW607SzX8i7RXtGAc+2PW8IvOXZFTGP3nvhl+F8jIqJ6RRxw1sUNxg2u
         fXV3FkMKQMwd7iMNngqxR/yQ/hlSmZOqQUR7VeK0jzOTPBy/TQXhAE2yijb8UNcw/g6L
         0fRfGbOxXErTbf52N3I4dCB2yFN084lcbI6Sws46kDHLDNFe+xg1rZiHI6NkndjL3sGM
         JnJwKwllkN6Q2Jw1hgMZ/Omd8FhqmjXRoOeQuLJxmehdHgIyCV+i3szNiMigx3WGRw0X
         QhUV3pnvSODIe7D9jTCb4p1jXYGhMWrcN97jhSGy23qE/kEyWrh++IENWiDnwfMf3sWq
         E1FQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGlMD306LhHtur5V2y7RLvzLYzE9k5T1WsDhGhug8F3kCjtwMSPtQkii9VUMsAXcRLn74D7g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyGNl2C1ZlJUyanf1yaOOOilOwRGbHEN5tjwd4AuU8xT9TVHegJ
	eNWs32flEZHtUXS6hZvZWGwf2Do/fGfUctginF09nihqXsFpyueBYOfV
X-Gm-Gg: ASbGnct+ESGThm2hgArEvngIXlOVZQ5LwhoGq5v7WQQeL7NbxmucYK9C62WpgxoZP5N
	eV4/8tYRLnUnE/w1i+WCe6r9HUBJ5LXSP4lrzNFTFka2lmDvXtSHpBjDdbtD3sPbygHkmUdRj5o
	Z0dBVFh9V4hMwOgunR0J4A8azX4Ly0chWpN2naQsZCRQxDZvo/bBOCg7mSVAqb9iNo0C7JZ/0Y/
	xzNUPC9VTAa1ffVUU0/KEntjurW0hgGwnS42wP51q66SDF89/NhPuwP8xOHxM2VDkIOv3AhjBWE
	OgN8Ob1UripI6bw9P3QguNqzC2eTkahlACbFYGOGeohhu2o6uUUz0rKQC0/qBeTi4MGk73ic9vj
	bgQ5NnvQBvXIuRNISevuaJaHEwarjUwBN0zMc4vDpqVw=
X-Google-Smtp-Source: AGHT+IH1Ue4p5OCLX4CRfhF+JPw8oqTqN7O/BSJ9WA0RvFwdGeAb81e776hbse5RQcmrAj2fPtdD1Q==
X-Received: by 2002:a05:6a20:72a2:b0:262:9461:2e59 with SMTP id adf61e73a8af0-32da83df936mr30917032637.39.1760454262600;
        Tue, 14 Oct 2025 08:04:22 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-33b61a1d3cfsm16258161a91.2.2025.10.14.08.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:04:22 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 14 Oct 2025 23:02:34 +0800
Subject: [PATCH RESEND v8 01/21] dt-bindings: arm: pmu: Add Apple A7-A11
 SoC CPU PMU compatibles
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-apple-cpmu-v8-1-3f94d4a2a285@gmail.com>
References: <20251014-apple-cpmu-v8-0-3f94d4a2a285@gmail.com>
In-Reply-To: <20251014-apple-cpmu-v8-0-3f94d4a2a285@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=octx4ZTnNO/R4DCoPqgavGVNNjwOBSkdB0RJJeuCRxU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBo7mZsiLQHOHuDXQKieC7EAHvU1ZyAcFv2c7NnB
 u8sNmO0kKuJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaO5mbAAKCRABygi3psUI
 JERND/9BESP2xLUOegwP5HtDf4olDrM+n/Nf+ieBcAXuVPuWct0DXG5/WilKWfA/ucbdraT0ZRA
 gOUSCkdD3PQZhOkfiqLuI3yNYdJuwSBep9h9IaoibF6w+vX9nfD3RXq0J9HUhNwkBuLQUKiHvL5
 1XxrLqauIaAKgo0IHvcsfxJ0R9yk5fg0i5X6pZ23LgUxQsKuou04zkS6NQWVNa3XZLyerev5D15
 7V886q19ojxV/AahWKOAG+uJQlK/SIq4V7uU4vGicAiOVQEyObgrHJ+75rqRZXltRC1kmXI1Eje
 qAVdMu9HHQtHNfx+RTVLfZy+8mQowXCD4mS9uI2RSanf3NH1NXoc9xC0HJZ5JkWwwkznuB4180a
 mSvILhVUtdx5ga1P1wDIfsqE/qEof8LuICuv5dgVyTgyrfDhyKtAkcRubxx4Lel1KaxR78REw2U
 W2jKUc+cnwoK3KUUFXD/3HlMYZKeSjcQe66yYTkObNJh+6Gy2XAhRbK1A9o1NEygIU9ut3Gve6K
 Pw8moaYQpAY3niul4GMPotz8eiLK7zPkJ7dmpvdjfFhf3CkJknFlr3R4njVOwJsYB2L8pRBckMs
 0OaU1t835QMSvdx7T9iSt08WbuqRsE6DPyGeDJpz+qljG4VeDTUXjt0ogUMZunmHAnS71rwACto
 xYZpCZlxPxOXcsg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Document the compatibles for Apple A7-A11 SoC CPU PMU.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/pmu.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/pmu.yaml b/Documentation/devicetree/bindings/arm/pmu.yaml
index 295963a3cae799a54560557137dd6b3cf4bd00f9..3726e1b78c42f150cf1dc68a6b3aa3541517c311 100644
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
2.51.0

