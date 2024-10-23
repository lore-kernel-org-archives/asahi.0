Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2E113D53F
	for <asahi@lists.linux.dev>; Wed, 23 Oct 2024 04:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729658691; cv=none; b=FGl98CHYQC3qtL4vuBxrM+yPS+AuYfx+KjqquC/WSOe6nCj8s7Z9WUs9eV7vrL0uAiNOtciQueFyqvA4WYtAnB76kGAFcXLfKtbp+U0bq6uNCsjxOaFdbOLXF6EdEfr65OtMxhI66wQ+Jnaz9Lol3MFixzitfTOKVHMfwaXNhLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729658691; c=relaxed/simple;
	bh=Zigzrlnp/ggViYOHlizqBPJEHu5N7+T4SWqNN3pX6F0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OuVpxZIxs+PtGTBrKeocTGvG9MN+zQ0I47lC38jrdwu0f9ECp8aiFx+avot4E1PET3aN8s95p0nvtrapDXKIWLbmaJvARn1e9QekHLVq//TWa50Lv7k8sbjiwYuGKl8qhe1GFDkIFEULfFk7pMjQbhsTmJ650XCMSPaP+fsgViQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eU7aIYYY; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eU7aIYYY"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20cbb1cf324so56210725ad.0
        for <asahi@lists.linux.dev>; Tue, 22 Oct 2024 21:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729658689; x=1730263489; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/DXdjRCmhmjz3IRlGxg8kr3zWLF2w8ofwZY/NRTv2s=;
        b=eU7aIYYYy6BlC6iukEa/bxp30Q94WudKtIo6l4A1s4FVBcUZJdpooihDPhMa8gVoRs
         10+yHxon11KheAAYOOCw+o1K/ikA48/oCfL9qUTkdjAAaRMfNfx3qkmeZtumGQCaDwEQ
         auUseoBrdNoorgYBd1ptKup4RNsuVDEnG7ifX9hvuh85zXnV/UBbvhFv9Y/LgV0pOD0U
         9nToKTAXHbpcmsRmlscKVt3gbE3GfWpF/1uKnLcK4lhVh9TDO43+csdbkP9//rTf0Ma8
         TthuNf2tpfzU1WzXKPtjB1ISJ6z068VIqcveHpo2Ia4Nhq3TzgB5NhI9oXnE7tVE6oH4
         O1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729658689; x=1730263489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c/DXdjRCmhmjz3IRlGxg8kr3zWLF2w8ofwZY/NRTv2s=;
        b=mo2UDgXzrMKXJTBNpNUHQFN25mvszh1bfctkUeuXdug7/14BdpDn+3mu4FSqjLQ1fx
         UEuRSW+A59YNM67d6cYOMffa8YjN6eL7j1TZmXJncD0CIWGZMEyfU94oxVhM4XC4Ucnz
         DGUh+PCnNa5zxfdP9vO8yTsdxFRrVKbIFDDJqL1WO4KJwydgcIWe0Xz4DFHiCyEJVaFJ
         ft+80UL7CihoHeJ53MJpXaJ5BJEMtOnbcASjlL3ZklnB8vsTjS92Z+eV6rMuha/MijUu
         loT1WPBXceLgoRUImcGSKpKQMPCQXaiOEHHYhIH83dZ3Z4fS7u50iNeO5TaWGWzwNmj/
         Zsqg==
X-Forwarded-Encrypted: i=1; AJvYcCWkxuEpLa+QEgCIqGLfr4R2o7WppwtHyDNcxGRo7GK/18yqPBrzYW8jcftnkxKySzw+2CQ/xA==@lists.linux.dev
X-Gm-Message-State: AOJu0YziKR7KeJ+5mwlLD4rykAG5PRgpn3NwFc2Bvy/uhcSCebK71gjA
	3doAJ5/HS14EfwyaQfIJaLczNLTazwI79DhwQ3sOh2yx9yPpZWe4
X-Google-Smtp-Source: AGHT+IGn7UgZ9BJ/TlkQ+E2HAb0XR+rspKCuaZMeClu6zEYk8ERChl9lG0s2Nk1ILro9xGQFJ0oStg==
X-Received: by 2002:a17:902:690b:b0:20c:f3cf:50e6 with SMTP id d9443c01a7336-20fa9eb649bmr18804295ad.38.1729658689494;
        Tue, 22 Oct 2024 21:44:49 -0700 (PDT)
Received: from nick-mbp.ust.hk ([182.153.135.7])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20e7f0de3c3sm49983125ad.207.2024.10.22.21.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 21:44:49 -0700 (PDT)
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
Subject: [PATCH v6 RESEND 01/20] dt-bindings: arm: cpus: Add Apple A7-A11 CPU cores
Date: Wed, 23 Oct 2024 12:40:36 +0800
Message-ID: <20241023044423.18294-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241023044423.18294-1-towinchenmi@gmail.com>
References: <20241023044423.18294-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the following CPU cores:

- apple,cyclone: A7 cores
- apple,typhoon: A8 cores
- apple,twister: A9 cores
- apple,hurricane-zephyr: A10 logical cores
- apple,monsoon: A11 performance cores
- apple,mistral: A11 efficiency cores

In the Apple A10, there are physical performance-efficiency cores that
forms logical cores to software depending on the current p-state, and
only one type of core may be active at one time.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index c54d20dd9d7e..dc0d219ff9d5 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -87,8 +87,14 @@ properties:
     enum:
       - apple,avalanche
       - apple,blizzard
-      - apple,icestorm
+      - apple,cyclone
       - apple,firestorm
+      - apple,hurricane-zephyr
+      - apple,icestorm
+      - apple,mistral
+      - apple,monsoon
+      - apple,twister
+      - apple,typhoon
       - arm,arm710t
       - arm,arm720t
       - arm,arm740t
-- 
2.47.0

