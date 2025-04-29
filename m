Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545E627056F
	for <asahi@lists.linux.dev>; Tue, 29 Apr 2025 03:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745898223; cv=none; b=FxFRmjh8oqRK37cCPkXJWgF/3xCXBzaVoGI4XZyp0cMm53UflD1JiVbLduurFMQxvJ/cHZbslKDKX+czvQaLP5Gfzromy5HPKfb8Vcvgdx8PHlKoIK1HNeAEVhmUVzv496WeOXd58qq5oUgB9J4KXvvfU9C2JYx2RBIazcrxBIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745898223; c=relaxed/simple;
	bh=nvc6B3SNJrX+OFSnYkWwiXKVem6neRj112hzdXP5HLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U9xVBlf8ydrGLHsCcj4g59LrmZrIYBl36wR30u3MDgzDxjqUM0clwt/J9aOlcIUfG54xcZFTqhcYMLzIXOCsm8jWiKXlargiUObbJxqIibSVqz6K9nhAGb6Hx/fW2HQp//MposNt51q7dFz9xk7KfU1F6S3MVJOS/omKn9pFY7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kX3dD6nq; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kX3dD6nq"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3081f72c271so5182942a91.0
        for <asahi@lists.linux.dev>; Mon, 28 Apr 2025 20:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745898221; x=1746503021; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1WhR61nr7Ljl2PHcEGBKT0kq+BKIGjpo8813I6tRUqE=;
        b=kX3dD6nqZLINa+JbxuW3fMN4gnoXocTb4Hrien+gtsrMsrTag8Ja7XupE2oyyAVrIg
         xNRnLiaBfmqvMkCH2hf9M64x5pMhYd/OTAczb7Xkdq2NWvVYUIVENtaZjEjB5gEZ4If1
         kuXy5cvqwVY0Uh2T3QlVNvTC1n4BJQQ0S1vcn9+ukxYtIzu1VqeOv5FoYtTUhbrO5sMs
         f6F6upU10rrxof50ao8kIcDE1uNdW7v8/TVymJIzYv7LHMzz9GdfhpkFOIy7vjuFgShj
         VH7cwjkaXaw9uFqRSiDycWKQ7mKYpJbD1b44Fn6vkKlZA3nOuAON/Al9EnLcu2txFdlm
         XGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745898221; x=1746503021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1WhR61nr7Ljl2PHcEGBKT0kq+BKIGjpo8813I6tRUqE=;
        b=CsxnRRgPww26pUiH1Ahx5ShnX5hRoLXYuGQtDhck6kR+YAIv0iCWkPzMwbeiXyJhKj
         V/vl/hT58l+8D+62OyYrgC/lCx22QGdd0iPcypMRiYbHkAX1LHKPTho8VU6PU1xYAdx4
         gcCeajQWGkbDg0vuPfFE3CnafGhcy0Pm5Me1wlysoHYLUL5QIVwCQ1gV9xVCGhpvRfug
         8OcsqGt8++/nN4bo5vNnesIIJGi34YBQfRU+VGLT0xccywiz1ND8RgQLTixuF/YZVYKX
         /OJKTtS++1HbQgO++xXJPVsSsynPo5uPZWWKjjhQ7+27jvyVcTXFxx0RBxsjy0pkZNf5
         NEIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUANIJMQvzWL11dYN+VcTTRFMzkGdDuTSUw/oKb4TYKTZzmkqTNEVXTpXQKkGssKQUnz2TxA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8xO2a/QKGdiTvMP33L0P+aSgcxj9Cxkmh6s8vzXkPl8DjxXrX
	+5YC9NuochC8fG+EQC2LOmc0TONOY7m4jrxH93tX2arZVJtmZ5N8
X-Gm-Gg: ASbGncvjgFfKjRBBnSn3pS/eOJxcGCYH4s7xVsMAwsOJaRS32aEdCyphqJWpDQNJAub
	2Crz9ytVWdbLpK3ISPqZ+lW9/p5C/iIrF+8K4dFg66ROtCVnHZgdQsuBoJb8ophx+G5uw4hBs/d
	gfWT1Kh+J8HWTl+NAt3IktJ+yaB17wy+QZepcyrA7aO0AWsAsiDQ7f3Ak2aXgMXCCJjC4WOJpwy
	X7NOI0RJpTKsNPUKH9UcSe+fGchtLc+GNiudIQo2xywKE3mJ9ukDvicif6767CMecDBfFp9IoNE
	NC6BIc26oMXF0fdsYpx8iyE66NzZ1hcdmzNvDL6+u+0sspKynSXMEPC0CA==
X-Google-Smtp-Source: AGHT+IHxJGmiZrM+UP4fV1uraj7Ls/Dnl+1bFIYjcIjwPE9ECbSPIYWETr8srWkn7rAXa0xGoiF0UQ==
X-Received: by 2002:a17:90b:2dd2:b0:2fe:9581:fbea with SMTP id 98e67ed59e1d1-30a013bcc03mr14960690a91.29.1745898221389;
        Mon, 28 Apr 2025 20:43:41 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb7fsm9953249a91.9.2025.04.28.20.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 20:43:41 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 29 Apr 2025 11:42:25 +0800
Subject: [PATCH RESEND v6 01/21] dt-bindings: arm: pmu: Add Apple A7-A11
 SoC CPU PMU compatibles
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-apple-cpmu-v6-1-ed21815f0c3f@gmail.com>
References: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
In-Reply-To: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=nvc6B3SNJrX+OFSnYkWwiXKVem6neRj112hzdXP5HLQ=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoEErjd3c1yTBwKCGhxeXkedW/lfSOfnH23+dzW
 l2135x2zHGJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaBBK4wAKCRABygi3psUI
 JLgGEACdUJeDNRMtqm3nhxyhEQAtsOix+3CT7D/67Vr7UWwXPJP2Oh+1DwSLzbn/zFkT9cugxIm
 GnSmZ4m2NYOn2WoAUS8F7cwsdDNGku8hnOj9A7YESw3yavZ6LVysiB63Iv4cSXfSxG3nB2YAq6K
 AgKxNOrluLF+fR+2zdUEkbhiV6pyZKtNCyQZPhUeRmDQXbEiBXgJ2UKA/N4pZc7c3YMbky2BSej
 +0eDrhVaQKHqmz5s+9Uh//vS8JStXzwFfiWjuD+mNFrdlf8ZKy9dZYvKJccDRO4/JIm6VLxIdtL
 t0CdhX8lL3BLVxOJ104+qC2OlUGI2K0XruyV67ivUtr915c4YfnTxYa1dY6DcpzGGGLQn3RZSxJ
 1rL09HBeggJZWWKpANaz2AHyoLthHE86+KhruR1m3MMu5+EkEgh6+rSXO6dbMnGpPVvLbFqhAQO
 //uuyVAsRC2uHgRUzt8rS0tXfx61BZDj1yK3UF7AjiVBDYZIpsPbhdD8/xO+Dn6Jj5AYISVg1y6
 yUz4EbfU4tjfQGuc40RCBXX91X8TLxf3h+pY7p9qU5NQjuNSX0IS9+JCAQPJgJdQpEkOhHFH7vg
 Kxcqt8aLrBEv1oph/C+FeG1tPYwGHeEkseunNKO83OpZRsuw6iO0sfFheenVmHndUjkp+juqRFG
 kSxUqdmoqhoaJkA==
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
2.49.0

