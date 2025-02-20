Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F93F1F0E33
	for <asahi@lists.linux.dev>; Thu, 20 Feb 2025 12:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740054149; cv=none; b=iLAGgc6qENpZylh+y2OGDpNbZzFF5mZj9vDN81gd1QgMzC83Ypl2u4uRdXO9NAybxRq7Rjk4DynDi3rXnLbnsD+4kghM3kq0IXBZ+VQO8Az40Dui9a3jKt/9bVyAi/feLRltJg8qQyNwRdKvHyX4tKCtphOrV2JICbAdV6GJzEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740054149; c=relaxed/simple;
	bh=x8vUs23nLD376IRPtFWOy/bkius73HrUEIt6auOclws=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kpAmbAd25uwho/AvcDeWVnjcW8mTqRmECmtD+hU3YieVyu6Mm0uz17OX/iOOGpQg6kWpCCsjg8SVPQN06aRJy4jL1G/mCdMxMyMkOj4bSSftts7NDJaXc0bW76rFPu3pjcoKV1qzjyQ3ghJgN5TIgQXq1Sp8/wCF7uJdhXcNYDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F+cFVStW; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+cFVStW"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-220f4dd756eso15068515ad.3
        for <asahi@lists.linux.dev>; Thu, 20 Feb 2025 04:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740054147; x=1740658947; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PxoHLUi1TIyVjtHTj1O4KVcJUPyjk0t7xM63xGaqPFA=;
        b=F+cFVStW13GTQpOwYxLxC1xjeUNuh/XHnQlP3Pr+o1ToVdCgGtGghLh0cNjv2XBOuP
         Jhe045n7NbhN+21SUU7LGzaYiDPGgImRsTH0+G/KA2K34mef4QRXLT28UI7yA1qf3Rvo
         kuwpJ6QXO4xVHOtHM5GX42GpNSKUjmHCHPa8wIwhI7MWzzkK3WuMTG8Xkryr82JnKnT+
         JXsAAiutMJBVU2lWWpkpwkP5jY37RYJDS8dDRxU31jjwx2Vzyj3iYKdu7pdKEOp5rRNc
         vgUzPrwqBhhFA6TnmU09HtJXjfBVtmaC8KClADPm0UJMsIMHI4dEiydHxf6UwNzhkE4k
         Q85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740054147; x=1740658947;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PxoHLUi1TIyVjtHTj1O4KVcJUPyjk0t7xM63xGaqPFA=;
        b=MoZ/Cxv2sna/6IYQoVBxB2yeQqxJXdVFNr+S0ia29DEQlE1dgjEzU/4kf1a67JvStG
         Rysx6iDVq7HYs6UyblhtHQWvNAaWnd8X1dWzCGXs2PgEWwN9ehtNnC9iI56tl38ppHWI
         RIzuUC0keznR8hKcF+1aoChjaYx2nw8vx6FlpzCyg4VorgfN4IBdcj5Pp/aUQxTQiztV
         jfXIOoFca6Cykgo488LHqfMFKEWmmbjaYxf8jFJjrF0+hPE3DBn2v/t0mFyR1ZL+CPN1
         1JD7kAwWK2osW7US4ZuSMNl9sh8kjV7px0fQdTCOSHmibFtV7mII7r0TDl0c4htIVWFf
         6W7Q==
X-Gm-Message-State: AOJu0Yx45y7imxIwu3vUT/Z4qsp7Gs+JX0Fcy2F9pI1QcVDytk+vVQKm
	ROS6ta2ZLkDF1ZykmPAtT0GTyQvfvH9xjuLezg+2uCt4mqjztG2o
X-Gm-Gg: ASbGncuzrJFC0vpK0V+P/qAOHShBY0+PNsu/+63doT//ZSdaveR5uRfG/lFA2fOBnXP
	IxOkstMBBtNSi/fdO52lLai7fHqMDF9GUnS7SxheU1VdrqwfXMJcqMfUh9sJtJ30t2NivVtTCxG
	Zj0dEvSjJ6JM+QFHSdTMO7vZl/FLF/7eaP3a4DMZPOQW22LLl3cRXQyrpSpLVTIHH9O6x1alhTX
	M4zzBZfqtsjf5xTdHzY1Em901v5Mcg6Ed0TcCW1KYiiY5gnB5UcuO8geXBZ/obMtZ4Oz2cRuCQ2
	ZFDPfnHi3cLlVAYjVA==
X-Google-Smtp-Source: AGHT+IFPQJbD8Y0DfSGbKnFh8OFeQduLpjR2nCX2HZ+uxq5kUCQXB763DW1dJpfmXDKj/IsrLgKhzA==
X-Received: by 2002:a05:6a00:1903:b0:730:888a:252a with SMTP id d2e1a72fcca58-732618c1eb9mr32642016b3a.15.1740054146231;
        Thu, 20 Feb 2025 04:22:26 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73242568146sm13653149b3a.47.2025.02.20.04.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 04:22:25 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 0/9] arm64: dts: apple: Add CPU cache information for Apple
 A7-A11, T2 SoCs
Date: Thu, 20 Feb 2025 20:21:41 +0800
Message-Id: <20250220-caches-v1-0-2c7011097768@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFUet2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyMD3eTE5IzUYt2k1ETTFGOjNEvDtCQloOKCotS0zAqwQdGxtbUAg5z
 SUFgAAAA=
X-Change-ID: 20250220-caches-bea5d32f91fb
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1554; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=x8vUs23nLD376IRPtFWOy/bkius73HrUEIt6auOclws=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBntx568W0BJpT5y33IzqtpAl5xiNefECBeocdaA
 G3h6DdBr9iJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ7ceegAKCRABygi3psUI
 JJ2mEACU7xnn3GkLol4g6uNkJmYfTXbvOFRtGSPksAHFzpaPYHeF6tCJ+QOL2JxMqXjJ2z58uM6
 eI97d1zgxWGEcPbGOh5jVJGjXzZxqJm8KPNtF3DMfRKMYUmjZ0Lmih1ghU7l+BAwKMcW37B3s0q
 0eKbwQVfrWHt7AGSumZXWnYZ/PeNLbvW1f+q5zk/EnVCRjEXp9hbYfLbvYk2Au+d1t0XD/79gp0
 teTwCARVArcj33NMB360pVAJW+NaiLBdJWRwJVqr0hEpeHSq7DSgaQQm7Jp4JbabpsaevpM/PnD
 lKjUJO5Gql8AQBeqt2CtoLJiereJ1RBpn8LW6c/jWoxh4+HqR69liJxkknq4jL/TmSKvOdNzG8q
 lNhxXt/Cmf8Gow5qtPdR2tLfaIHMgiwLupckugNj5cxisnrWMhyIqaNdbmq8XLGC9sxP2cUYvT1
 aFFry5dp3kAwof5raujuJSGOPvhyQiUOUWOoEUHaoAOmZSzh6Fe4N3iLQhLuYQc3sXWXHqFtlpx
 jBQCLj+IgeaMeGb5eqDr4jJsIcRA7+eAiBnBHyRsVMGeZbkNJL6kP8iDYy8RzCNF27FSHKtfFPL
 GfFLtCHP8kdqAW8ObzUIwJ7Vt+ZxZv8Rrigm4kQ2O0dcqx6o+p0Uc553mjCQQolg9Wt896+vm2z
 imvAjodSIWFfQxA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU cache information for Apple A7-A11, T2 SoCs. On Apple
A10 (T8010), A10X (T8011), T2 (T8012), only the caches in one of the
CPU clusters can be used due to the "Apple Fusion Architecture"
big.LITTLE switcher. The values for the P-cluster is used in this
case.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Nick Chan (9):
      arm64: dts: apple: s5l8960x: Add CPU caches
      arm64: dts: apple: t7000: Add CPU caches
      arm64: dts: apple: t7001: Add CPU caches
      arm64: dts: apple: s800-0-3: Add CPU caches
      arm64: dts: apple: s8001: Add CPU caches
      arm64: dts: apple: t8010: Add CPU caches
      arm64: dts: apple: t8011: Add CPU caches
      arm64: dts: apple: t8012: Add CPU caches
      arm64: dts: apple: t8015: Add CPU caches

 arch/arm64/boot/dts/apple/s5l8960x.dtsi | 13 +++++++++++++
 arch/arm64/boot/dts/apple/s800-0-3.dtsi | 13 +++++++++++++
 arch/arm64/boot/dts/apple/s8001.dtsi    | 13 +++++++++++++
 arch/arm64/boot/dts/apple/t7000.dtsi    | 13 +++++++++++++
 arch/arm64/boot/dts/apple/t7001.dtsi    | 16 ++++++++++++++++
 arch/arm64/boot/dts/apple/t8010.dtsi    | 13 +++++++++++++
 arch/arm64/boot/dts/apple/t8011.dtsi    | 16 ++++++++++++++++
 arch/arm64/boot/dts/apple/t8012.dtsi    | 13 +++++++++++++
 arch/arm64/boot/dts/apple/t8015.dtsi    | 32 ++++++++++++++++++++++++++++++++
 9 files changed, 142 insertions(+)
---
base-commit: 3febe9de5ca5267618675650871a626d0901f8cb
change-id: 20250220-caches-bea5d32f91fb

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>

