Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1EF1865FC
	for <asahi@lists.linux.dev>; Mon,  7 Oct 2024 07:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728284931; cv=none; b=cNiQ+TeQ+vujqbU0YzQqzhXC1JBKOLXzJ/4FjGzP9M1EMgUC7WojG4lHy4B1EK0wFzeA3ZeeC4zM6hxlQgLZ7CWGulOhm6MtHov2nDX3jx/4G+WLV7CyzZmFF81q6R7izZnr88ArkJLI3V1MEzRCoWs38+bSF/AZfbKyFQr1me4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728284931; c=relaxed/simple;
	bh=GQSksQ96S7zlcAvNDUY1NnWPyZSqqBA79BGkHM/xhx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AeQyQqajOjMtsXGWdwyoTxXudPCYfapBaalxJtiTgIeL9ZgXdSBrvbl3C6rXpVnQgn0SR94rE/XvcU6ety+nFwfSMB+DJTsoePryJqL1tCowUoRZmJ47g7KAHEZmIylyq8aRxhlB/PFV74DuJLZn//hvkIaH4AhBXbHnhWn4gM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L21Wngko; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L21Wngko"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-71e038f3835so492956b3a.0
        for <asahi@lists.linux.dev>; Mon, 07 Oct 2024 00:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728284929; x=1728889729; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4gV2Y6X/a2+9Wxewo4YqIzOHCrZcI/yvqqITYkikdI=;
        b=L21WngkoRXaeOSDvdys/A0hO7KXbQb+S8E2Oojmr+W0GVzasT1NoRnx1ZAnfs3tJMH
         Ue7xJJYZVYNaA0aROiJbvxHDUxTaeZElhNewLsPMdRTZAXrdkImHH6HPt9NTch18Y9W2
         T8748/eYX3Yv6G3+vM4cHScfdj5P+JgFQj9eysZjt7KX74C1cRR8o+C0Q8S1B8ZTxRd0
         rR1+chcziTW+JXWR/hr5+W7ViS3f+qGuR/XN1HJNS/4KqzJ8o65Ec7tY0Nv++3zCzYZi
         z9bWZIEcEvWWc8e5H4T/yJNh5btA7CNyGwGfcC/T3oHivM2VkOsTe6oG2YoCDrozBWTH
         VOrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728284929; x=1728889729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P4gV2Y6X/a2+9Wxewo4YqIzOHCrZcI/yvqqITYkikdI=;
        b=DDJecdR8k+0MfrDeyIBC5VV+dyO8d4g63th3OuSsF4djm9riVPpTloPnTC4SwKCOCw
         6TNUzWhwN/LnNx3DYNPt2UCUMG2V0QQaWIVPHOMdAUIv4iq6R//kZB7zBNWvON1ygKl9
         b3iZjROHLETH6sol9ULYPlxbRNeity5mX+L8kLq+lhiuALbFhIaEY65vjeelO9ESGBgJ
         Yp5HvT5KGubML7HFOkPYqgZ2oE6h9cWzX+5GjXfLhHFf36fa0RiMyMt8Z/w2LVDe1Tze
         v5ZDTEPwawZGUQE90BlBsM0+FsEmW+1pXhpSbjOsYyVPFkrB7fsYIuVP4wac+4a7+c8v
         3xcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkNCS0xBoscvdrtgfgC6zKfqgAV4MaZghMUPHG1oR/IKi9v6MX5gctHSfaGZqHEOaBku05fA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8Yy3m9v4WRmnH3WpdJFFjO8tIOiZrQj+0xu/Ietu7wBDfe/xR
	1kMPE4GM2yUstFRwE1sB6w15c4ZOWj9JIRXO8cmwebDBXcF34tWa
X-Google-Smtp-Source: AGHT+IHIEWrYvgGHZlS6oVwwmLwGg2XSistN8iW5sd/6BIcTu2UH8xaCU0Leii+mUwM1dCd7PcYm+g==
X-Received: by 2002:a05:6a00:2d15:b0:71e:209:512a with SMTP id d2e1a72fcca58-71e02095209mr4635060b3a.18.1728284929318;
        Mon, 07 Oct 2024 00:08:49 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71df0ccd1a3sm3764147b3a.66.2024.10.07.00.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 00:08:48 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
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
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v6 03/20] dt-bindings: pinctrl: apple,pinctrl: Add A7-A11 compatibles
Date: Mon,  7 Oct 2024 15:05:28 +0800
Message-ID: <20241007070758.9961-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241007070758.9961-1-towinchenmi@gmail.com>
References: <20241007070758.9961-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The block found on Apple's A7-A11 SoCs are compatible with the
existing driver so add their per-SoC compatibles.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
index 9c07935919ea..63737d858944 100644
--- a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
@@ -18,6 +18,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-pinctrl
+          - apple,t7000-pinctrl
+          - apple,s8000-pinctrl
+          - apple,t8010-pinctrl
+          - apple,t8015-pinctrl
           - apple,t8103-pinctrl
           - apple,t8112-pinctrl
           - apple,t6000-pinctrl
-- 
2.46.2

