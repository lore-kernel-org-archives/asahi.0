Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD1A1581E1
	for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 07:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727248844; cv=none; b=mFwrTD78Gi43zm0s/odYtn858MbJot4CR8vzr7JAkPkBn5pFCYqyoVr40XKajkPMAHi6h1led03OD+6M3ay0pL4C2QS/TUJuj1tBKhUiyuGc+EypYRF/kg1scM6EHOA9R0q7ok8PmADuoyyzuTnvsx4guV4Ol7RCJWNU35SLl9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727248844; c=relaxed/simple;
	bh=TUET25mong/+XAx+SBHI2uP1U0asBB6//jzC1DiO2dY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rglLUwedhpsY2mQtmjVL0KfjoqvqtMXDqvfIEYiOFekchAfU9dX/EMYw0jwvlP0cEZsab+g1oySKn8oeTA1hxS6iI1sUvqxSO8mwqkM6KiZUWVjsQCA7YQNbVjQSEfql3fkTIHGi5ccLF/Y+3f1EtkDOKhZBo4qROe0qC+TAdgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DLWmANpK; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DLWmANpK"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7193010d386so5178321b3a.1
        for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 00:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727248842; x=1727853642; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5HVIJX3pW2E00fbuHP3pdXD9AoULDjYazv0lzUVjHz0=;
        b=DLWmANpKfmja7ccvIjsH6svTrbJ9EZLNRGPzxfZl0DACaoCSXsQwageUWOAuUT5ySl
         43SyLDP0oQbTy8oPMPLG1hNeNCyHaYXy/VB/PDGOxOou4MikQNPmOIvDqhmPvE0URQGt
         RdC2JWDX2JEfTcY7u62fj4AnrdNhJdtO9HolCsaCXHJXGVyXFScM+mJsBypWQIEDYPXg
         IjSA9n8m4gwjdn4IWOzR3olcUIrMM1MRzgnbndZPZK/ndo0M2FgoZBG8Q5aWQZU2gEkA
         Wsvga0K4Xa+3njU3naCRy/+WyIz0KX2YlwmGy29HspX5a6q8fdbZc181OuvDkkDj5LY+
         bjcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727248842; x=1727853642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5HVIJX3pW2E00fbuHP3pdXD9AoULDjYazv0lzUVjHz0=;
        b=e+nldBI0/9zko1Bmens0Ph6/Gg1LjfeKVFph9urwwv6rNC1uRUkuH2y9BuAtP6AMZJ
         SvmtPV4ZnvQyQUOe2vmI365L7QhYox9UoC/Twf1p5JqMvbuvzEGF7IwHwqnqTe8paLcx
         WiiDatXwV7ktiUhZ80TmKRWVACWOW2dnQJtIIm3OKb1zpyqsMEY5xza/uTMbrP1XjRc2
         /wtzimrNnadqHAuW6yoaWpkr7Jb1JXDwgcDkZjtS/MVZ6ZMFpeAg/pXUcP6jQac1ydE2
         GjGUWJ/EQ94sIOoOMxSukxRhL+v96QHRIVYMDUiIAN3UDkgVO7z00hrboyQ1DPSmKgh5
         nq5A==
X-Forwarded-Encrypted: i=1; AJvYcCWXCtUfdh62Ng0mwPQ9w4DoOK/l81e6Hkism5+ODL5a97ohFAPBs/eeKanf/b8b3nxGmr/zvw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzjlgKjTZwNxTNWKhvm7pQkmOCCN456lpJSgoKZU1tmyt/JlDYA
	B8ycKK1qUFvsYOOWNXe+Cwhlh5zgIpsggNw+eiuMVGH1/9OZxVFb
X-Google-Smtp-Source: AGHT+IEZWtc+tDHEffwL3HGWNtEm0itHoQwT8jLsVdZQ8UR0xy2F0qH64eUPjjjoQkAQI1j8kG+RBA==
X-Received: by 2002:a05:6a20:ce4d:b0:1cf:21c7:2aff with SMTP id adf61e73a8af0-1d4d4ac5c81mr2888800637.23.1727248842256;
        Wed, 25 Sep 2024 00:20:42 -0700 (PDT)
Received: from localhost.localdomain ([49.130.52.78])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7e6b7c732bdsm2155662a12.63.2024.09.25.00.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 00:20:41 -0700 (PDT)
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
Subject: [PATCH v5 03/20] dt-bindings: pinctrl: apple,pinctrl: Add A7-A11 compatibles
Date: Wed, 25 Sep 2024 15:18:01 +0800
Message-ID: <20240925071939.6107-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240925071939.6107-1-towinchenmi@gmail.com>
References: <20240925071939.6107-1-towinchenmi@gmail.com>
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
2.46.0

