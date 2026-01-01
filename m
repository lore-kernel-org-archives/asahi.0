Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D61286889
	for <asahi@lists.linux.dev>; Thu,  1 Jan 2026 09:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767258201; cv=none; b=Hd2HDQhshpEE27qiWFI0l07cidjojVX3m9hE6FlmB83WF60ieN609osxyw+gJ/tS7IMi+bXhbA7zOnmZA31RuKmuGKN7h4NclL/Tb7tSZ/zSO3lIvnQM6Zk7qEOh87MC/FbhiWHbFhKzOXQ0WCzvJJt8yBP0pbjJ6jHb8mQCdfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767258201; c=relaxed/simple;
	bh=6LjbldlF3OoWMCnhY7fHqRvAfCOGSBQ1ExvFhoCzNxY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P507GsTupoxan54uVpbn/CeyucLFYksmlBiUCDIPywqkp4mkyek8cU7AwCYqVmr7ZBdYj6+ywHrjOdVAtwdKIp9df6UjW/Pk2JlUrt8rLN2HBkMqpOulNFlCjWtXRtmlpTtBhy6c53OUL7KFHVKXd8y6u8+NY6rwMlNQ6A8/+00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kOZDvBNL; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kOZDvBNL"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7f121c00dedso15148837b3a.0
        for <asahi@lists.linux.dev>; Thu, 01 Jan 2026 01:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767258199; x=1767862999; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yx92mpsjRydjbKNezVplOe9ZgSTsezLCchII9GIIrGo=;
        b=kOZDvBNLyq3nzeYI+t+fqIIWdePcbJk+jUdgelXobaW1y+7LjApJMYlktojaVGz1ZR
         PY0iZcV/gMVxKE/AG4gA2cTYvV169JaM5TQOXGgELFp8nWU/zihzpj0gF1P1CPA9Dh5P
         2PZyDsBFZ8NQ77qEXVxjGAZZCIaLXdA/+mM+X2eFDq/Bc75/4VK0MzB3s3HFoSWJE+Rn
         nN0AaIY7Ci+7qoFbwOkp/alZNYVuU6KPZi1sE+RxB8VjrFL6pLBZOe4QA2HisIqkmNOK
         CdllMK2kBCnCOP+F4kWHnlfJEcpcoWszb0pGHYM00D2/Y2bPtXTAnt2K+u2VIX2Gb1Ha
         vxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767258199; x=1767862999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yx92mpsjRydjbKNezVplOe9ZgSTsezLCchII9GIIrGo=;
        b=uQ7eyHVluUPe0gQXWy7tMvwOoIHZZBaqKrW8BSGXkotPTyzsiao/ymiPKmVHezDAuJ
         UgM3biuwQ6syYdZLU52ZO8ysb8SDH+M1ZoLRCsrr7c/ZK5QfuuFwb/eOcLn1OjGt5yBl
         WeJ++filIo5QfJiej4XkmmE+NvtWWcnJTEO2HBdw+I4Xqe5c7cu7csMS0GIlpWoq/8wT
         5e0mVcZsuV9fv0+WMO+0Zi3qMoF0lF/v/bpKMYfKfXJ9i03zgzyy27+gRMKmw2B6yohm
         6GlqIhFdh2ZWYogr1sfnQDVB4LoyaR2AORIRyA5EQH3Zd3/AzFaAgiSMNbXlOCEpxXKB
         gfOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHJAFUAE4A467Mgo92iVhaDMhbvcRl0NhDIlfS1rGg8yW97MRhPSkrgQmYldgKQ0auNFTPpA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzUTtpS9sjvwfx2mySDyDUOlP6iGz2EfeTjqIFvKypbUjNDk5G1
	Dr58Cfp9gQLAPskLYYQQ+LAwuyNJti7j8bI0S9xSgw6v3xqnhG29KUja
X-Gm-Gg: AY/fxX4k7EklEOZvfNjlXcV9xyWOhVoqm7IMoC7KIQ79NE1SgtK89+5UYswRkg1FB+2
	ul2hRVfMiZt0e/T1R7Bb+sORqbsfJrQrnbyWJZs3YarfZ/a7mGVn/SC8RReOrFna8JIw7dQVKv8
	c3i4Gu/OWcxAfyXhJblwkNVeVopC8bXPfnXQl4SkWrUGNz7vimSTNmGjrs+6zLOiCH69m0xqVlp
	pe8s5dYEi7C8VYNWH4ihl/eQ4VvOac9+RaAT8o1l/mXukrnzIkze/hSR/zmhEMloqD+rLElEDWV
	InR12J9iKqlDildKbmWSZYsSOclEHLjG/OElJf0XuSZG3FykJ+DEZde1eb6zF3g/22vL4ftKx5U
	gUx0+Pu2j35TFWNXlri2l8tALBN4nQYFxIYDR3t4x/DhNAyKmjoz6STkx8/1+woasN34LUTcDWM
	gBJCFKDz8k3dbR
X-Google-Smtp-Source: AGHT+IHXyupRiKKKb/4zoV1JNUxwD3K40/cUxyX9Y3ajY/gxIhNiwbzT7FWVFkk23aFojsc3KZwObw==
X-Received: by 2002:a05:6a00:3016:b0:7af:19bc:ca71 with SMTP id d2e1a72fcca58-7ff64dcdacfmr33662579b3a.19.1767258199200;
        Thu, 01 Jan 2026 01:03:19 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm37182957b3a.39.2026.01.01.01.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 01:03:18 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 01 Jan 2026 17:01:49 +0800
Subject: [PATCH v10 13/21] arm64: dts: apple: s5l8960x: Add CPU PMU nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-apple-cpmu-v10-13-48812c529ffc@gmail.com>
References: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
In-Reply-To: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=914; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=6LjbldlF3OoWMCnhY7fHqRvAfCOGSBQ1ExvFhoCzNxY=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpVjgoYJSa3RInwv5nD+sjZTycFbc7veNNrVV2u
 Q9bgE3qS4uJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaVY4KAAKCRABygi3psUI
 JDV1D/4qSa+sm02aX09GOAHOuuJpgNky+qBCXNLWI1+AcOBN9LiZpYQ+Fr90I8D97ZQblOanbo4
 Bm5YkCE191yV0uwSprrmzRCbfOCtbF+/YQWJaANV5VvkXpQ4CNiC5svCuQOWUDd1h5AjoE9vp2R
 +RDzd852r7hJf2NDv75NIU1oLo987J3afoAJ6l/jhq4vO3CUsOKFUrPUXA0Kq9MF0uRZSwj34WV
 8LI4nH41oOLLGiGP5hEJlHJZmum8gKhRRs0N4OH66OhdsWjdDqfV+zOk1/E0kBCWmCuZNQ0KBcr
 dw68Y5w3EWMaIuDZj7dBeJQdDqojMLrQnBMe/9mT9ITUjwYb/2DheKcn7EnzWZDC8nSHtDEIviq
 kQbuSGcKst3sOXRYpUr0W5KpfgJqTVQk1XLbjwpzHg1mNM6U+EsWXmB9+nDFmVAQ2dj6KmGMeXw
 dRQIGucMqE9rV1rB40KBG+ieJF9X5lA1TkyF45Qlzn67TRGBr64Jd0fzbnqDtBtuvxGiY/MUdMb
 WO+Rd2rbV9XmSgoC+xUz0krZSKIx0FCehBMT5nZLLf9m5bc0ni/m090vXq4ZTjZc6LImlcQty7C
 SjnuDbsMj0gt9FooHtsPHqClPaixtwRkrEhQpm5aXqjOdN35zG092nyc4k19xGPHjn2DftgrEhH
 SPQGCU9hqN5jfXQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A7 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s5l8960x.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s5l8960x.dtsi b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
index 462ffdd348fc893d8e1d597b11d063dc5f88bdf3..d7a9cf1bb4911805a946d64e5892c1fe4b832186 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
@@ -227,6 +227,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,cyclone-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 178 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 181 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "s5l8960x-pmgr.dtsi"

-- 
2.52.0

