Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0289528314B
	for <asahi@lists.linux.dev>; Thu,  1 Jan 2026 09:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767258162; cv=none; b=OUTKaK33lm5FyWbp/PTCGwcDqpzMK+KFZqNtL2qabrOQHgdWZGX2cHMuXvDoSMRlTe5c85DZURHFSVjQ6hE6EnoyoZI0o/eyP1ryhZwGkdjlW3vgEL0Bo/Qf7cXU6xPv7UgDNXpyjCtrnLA5evNmNeWqTBV0zMNNLaGIYdv9lEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767258162; c=relaxed/simple;
	bh=07n0zpGM1mcRCjmEoORnP+p4Tv6Nx9ryjVOY1OMyuiY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kP9bjm9GFpPAJRu5w/ypU+dofcc8ZHKDR+1DqFhhNx0QdbNre+L0y1NiigkqGq03p3i2xOXa+Lst529/Cbb+nkErbrIJI/W07OV/eJr8Tf1HvHtDAMUZdJMeZPVhWiIKjThsvCJg5NhOC9foI9GyLGp2SP+fRTJhzJcxWuQBndc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kSx6fOwe; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kSx6fOwe"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7e1651ae0d5so8778873b3a.1
        for <asahi@lists.linux.dev>; Thu, 01 Jan 2026 01:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767258160; x=1767862960; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CBsTBcVtZ52Xc7+liwX/QWMHum7rwn6gjjvyLUqjbLE=;
        b=kSx6fOwecN7P77WJwLfAAKoRaeK9SnDv+iympFFtUzBfn+oVvRmtn1eDCUPynzP/78
         pzVgfolZJxrwKJ58wb2uumRVyDFmG45LazyIBx1AaYSd4bg27DIM/Tj+UsUJQu8OxMPS
         78HUwpEsabXP3BW7pOEMkkUzyrP0NkwlWGMxyB8/X7L8zmYN6esHJ7L4RmDUmtqQLEkH
         +A0Si27+/bEOztvCNjlhrvuVZw/5bF+sVt/XcEPpJop8cJmYYFg1IQtsk9baFdLJP1lC
         Gn2AZ3Ix7uUAMV9YHF364M9OdozGFP58OLMv8IO7esLc36IRGT6hzxOHkINCtzbx/zqO
         uZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767258160; x=1767862960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CBsTBcVtZ52Xc7+liwX/QWMHum7rwn6gjjvyLUqjbLE=;
        b=ndR7n3nrwnnaXWnOeANrA4sRSHhV8hrDPWbAcUi2iamRRvIyCJunbuJoepLxcULTsW
         AC6Hn8PTA5lp+CdiTCDICkNLVv2IOM0VBZw8YnAeIiS9uEezgWncJ0FcMM8pXEbTDshF
         GkLCiyglSv7QudznSEAeK7ZYt9XaAoLBEEyFvWnlvKxbNQB8R7ujU+tINuY7fO8n7s8F
         zsBivcw/ftmrw7mPhDDuxtqOQ76/BF0jyBFRXafLAThjk4gUL0ubllb0ewdRSwndloHA
         94Yol+f0+jpTnMktaGo8ad+NMZDxN6DReydO8lLTNNfUdjxLSjwX3Sh1DmfrtYQfJNg/
         vlbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvSRpNwcKHaUKUxp2lRt6h1SpojDJrUdOM0eD+CIID8jtgGFev7MjIqD1fBPi73vAlI5b7DA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzsCIF6pqLqQUIVAi3j95s9YoaaVB0aGjhIZTyrhpREqYhVBf6V
	sKGR7A3kff6+4JfkCzl6/PJQnpaXtz2IvHd54M2DZM3Tz0HXa0U27bTZ
X-Gm-Gg: AY/fxX4hIhV53yywKx+Q4mHg2iSzyChf7tJYaUqP45YkCrFKtDa6D0n4k6nks3nBCAz
	LS9JZGsR9Ufcv970PG7PH4AyHv61ldwTBbOzipZhGVgLlYwStTsOfx9rXLRP+Gfw1nYN6ARcU4y
	q3dPZu2ZJngXWDo8bNiuFiH3QMHm3e3CwcwTTiv47ttg0Nw0D4HAx4zin/3VjK8/AobVTDbCT7Q
	9D5/JMzZoda6MKnAXB7zod21xoxFXLU02agoQEuAn0FSyMZ+Sf9L4nnr5mp8q7E+PnnulBmvnIZ
	Q6E39YeQqH6DKbfNLoWGMzk/2Dvq+qpj+YGhUCHlHTrcXMWnE9Yyqs/TIB4/LqOoJxZlxwm5Uwx
	h4ZnoumnJBq3cg8VMDglEdFHAy+zMXQy1lSmcvA6zD0w910lfloiUPklZFGFmXJ9A2/BpD1qGdU
	LEFVC4pPg1fjMs
X-Google-Smtp-Source: AGHT+IFtoil+3P7aWnRMIiq8mqybLoG4UdYuQs6Y3uQb/Jyici2QQ+OBrSKeKnNpXmAnFflhht0LDQ==
X-Received: by 2002:a05:6a00:f99:b0:7e8:4587:e8ce with SMTP id d2e1a72fcca58-7ff66a6cd8cmr29772792b3a.65.1767258160250;
        Thu, 01 Jan 2026 01:02:40 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm37182957b3a.39.2026.01.01.01.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 01:02:39 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 01 Jan 2026 17:01:37 +0800
Subject: [PATCH v10 01/21] dt-bindings: arm: pmu: Add Apple A7-A11 SoC CPU
 PMU compatibles
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-apple-cpmu-v10-1-48812c529ffc@gmail.com>
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
 Nick Chan <towinchenmi@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=07n0zpGM1mcRCjmEoORnP+p4Tv6Nx9ryjVOY1OMyuiY=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpVjgmRsRBPdL9/utiE0nqPtsVdLeRRqetK9YcJ
 ZMgjrSR3kqJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaVY4JgAKCRABygi3psUI
 JF4xD/0QoWqxkZH1Wn5QnoPV87CkMp55ChVhudxMJB4SC5V7Dt+HrAc4pSd7nFd+K4pPeP1qwbG
 0onYYZ1veiVkIAFlQsUpB3a8jGT90Vru0U2MYyIrv6kUYWohWOAABi2aNG5omb2G5Nk3MibHtpd
 rnmNJb97uGnUepEd95Fm20xBETKdOWHmsQ4061B9YKi9SIt4gXHPDlHMNUhIy19RNz4veCpzW/V
 +FyYucydUfvbOrmRFIkosShp5AHD1RXszDYIAEl1zJmLRHZymEXUavxBarEYUKdajJ/3+nvFvEK
 tlgApSDE6OHx88cvWjkIG+w+a5IuDUT+lTBb+X89PQP1h4cc1PM2a9HSPDoLN1dTrDA/UPNs6AZ
 /tjGneYg4Kgu76qanoKeZQTDwuG8iq5SyrT2mMHMjM9uAlnPwRm9KxiI/AtMQ2rYvlVqqXazAgP
 sHf7GgNlZjaE4SIQgkXm4EZN8wrvOBrAPOMUmeOoWzDXYuvBThwlZXAbCJFJROUTLsKEOUWQt6+
 WsDdb1MllmQlEl7jgopcMuD0dxR/s8Xee0I7UC4/KAtBWwrKZEZvQLknULROfmmCPyCNEvVfNZ3
 poA70X2OklbJrD+UFtMMUxVVft0gzk21SwEibpkyOc18DW6AyXoBFwusC9FpWoym7sAZcHHVNOC
 hygUle0lWVEoscw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Document the compatibles for Apple A7-A11 SoC CPU PMU.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/pmu.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/pmu.yaml b/Documentation/devicetree/bindings/arm/pmu.yaml
index f47baaefcdacfd37472926ec6994c33603163a44..97800a991f208448aa4bc8dd59b45df2ff35b400 100644
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
2.52.0

