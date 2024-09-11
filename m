Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F191815445B
	for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 08:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726044447; cv=none; b=DxaRkX29iGz0O+Ou+OE3nv/twlbVfeW0JVFczYO5yRy7z11zEBGppv5UTSlzjnOPmfNE5fX7EEjrPd9dvtevkazUpadUUQhEDoGi0P0H5CSt1JQP9Iueq9wpMOukijYW0XmiNW7WoMkpEfPIe4GPupOOnORFv2b16b6vCEp+Crs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726044447; c=relaxed/simple;
	bh=P9Pk9/2emirw+58JE8VBpSpv2YhF1/SPfHlNxzzMWCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b27dAp4l/5yooG1CaeZbqUS23kV6FaQIlkcSODOitcojqOZMvy2/t7q8u7b1tBtNDzmiDcDqJs87fL5eI2NDEFj8oX2ovRdyorIKOH7kJqxmLAHMvvQNp5buRV12FjKI4rHjZKjYTmX1Msq1w+5KZe1UGVDQK61wnC7i1REkyiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b0ZXl5tq; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b0ZXl5tq"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7d4f8a1626cso5113729a12.3
        for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 01:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726044445; x=1726649245; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjvlfmxw0wmD05gyjgPqQBjumudhjLKhpNjbMgXc0gg=;
        b=b0ZXl5tqH7nx4NvVzjUtujs5B+H77HxPRiKBijT2tWxh4L+xuJvtMR9AGVgECyy/rA
         1SnlcKLMqkn1MyK4wcZEAx1lPdi4AXqAYCUa/5I6/dM7uI2rdYzFZgNWqGb6WfPmaQE2
         zlD56Dpp7/Le2b8A3yFPEXB+2purhE1UcvQI0iWc3a40RdxJmVj7AJQxtk9Jex+Zh5Rc
         xA0D34OQ9BPrKopczp9rYdXwuj726UPcwwhqO8YuXzl7TDZe4SVogALoVfI9nHaBo2ck
         IPSUCGaTuAaXj1VHKsmAhUCObk8V96Uzu25TwAWv2EnLmXQsdJuo6JfK97gW578f9jKW
         7G8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726044445; x=1726649245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tjvlfmxw0wmD05gyjgPqQBjumudhjLKhpNjbMgXc0gg=;
        b=vdZrbhvjcfMkMnjqLUS6qHyg/cPMwfKAdznUyHztJGKRhjaS93pzRuZyeJ1Xh2+Ttv
         1xNjR7FLRS17q0G07LJhLUTPNBb9mJkKi5x85qA2Ux6LxlOF01NGLJhRRw+xLX9S7w3y
         E4dSylBEVcef19J41DDww0MDnYei5R7FN+jiAIf87QZk+3otIB/Z3UPAG3vNz4eLhslk
         GkvwafdABiz/lZ1TqVZzDbbzoP6w39rgAaAyJVbhAml+qRxlbzU8PdMLjSwSKDrc1oVV
         5HhVv9PNoJGE6nmWdBfsXlgFb85cTScTNQ53JAVRjL41/Knc443ncFZFZK7eO1LRWW1c
         /1cQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsnlVUIt/6TXAFqCpi+DchCg7/hprBHXS6zNqA0NncmhoHEA/sXtE1ay6RtWM1q8eUo/sC0g==@lists.linux.dev
X-Gm-Message-State: AOJu0YztCawEZCkFcA4OU+ym9JWUbA5/tYFs629YRALMZbwOs10993g0
	2kHJ3qHNuux3EB0Ws5Ua8c1CzlKTz2U47bFnyveKQ6456YFEPd69
X-Google-Smtp-Source: AGHT+IGmsJr6r+oK8+NWZ2Lm9pjTz6VxGYA2MokykqymrLP97fXtIw63Lcg8YccJp/K+uK85FctN/w==
X-Received: by 2002:a05:6a20:b40a:b0:1cf:53ea:7fb6 with SMTP id adf61e73a8af0-1cf5e09835bmr4841877637.8.1726044445299;
        Wed, 11 Sep 2024 01:47:25 -0700 (PDT)
Received: from nick-mbp.ust.hk (wf121-022.ust.hk. [175.159.121.22])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71909095177sm2530125b3a.112.2024.09.11.01.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 01:47:24 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 07/22] dt-bindings: arm: apple: Add A8X devices
Date: Wed, 11 Sep 2024 16:40:57 +0800
Message-ID: <20240911084353.28888-9-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240911084353.28888-2-towinchenmi@gmail.com>
References: <20240911084353.28888-2-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the only platform based on apple,t7001, the iPad Air 2.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/apple.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index cf4f5d6db1d3..dd5f0f6eb52b 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -27,6 +27,10 @@ description: |
   - iPod Touch 6
   - Apple TV HD
 
+  Device based on the "A8X" SoC:
+
+  - iPad Air 2
+
   Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
@@ -109,6 +113,14 @@ properties:
           - const: apple,t7000
           - const: apple,arm-platform
 
+      - description: Apple A8X SoC based platforms
+        items:
+          - enum:
+              - apple,j81 # iPad Air 2 (Wi-Fi)
+              - apple,j82 # iPad Air 2 (Cellular)
+          - const: apple,t7001
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.46.0

