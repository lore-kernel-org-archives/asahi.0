Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918CC176FCE
	for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 08:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726044419; cv=none; b=GGl0qFu72JhbcJKwjMtUfL328pjyL3P6XayrrIkWLswAAvejvfy8TX30onz0Jv8AEUgTuQlTNvLkj6ki4xZtDezxUNstVuFEBkNvJfMQvgVI8g6r99Nc2d3Tkf5NDFTFel1qFR8GNnDiiIu6sLEuzRW3dFoPsEFJzJTilu8/T5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726044419; c=relaxed/simple;
	bh=ynppOf1zjT5jg8yIuCyBCo3upiHCSvmiR/+jWcV/oII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SM/Qh+I91leM/M+ZBErn0wR34cG9KI1metFPGUCuHelEfTHsXiqGXLhd9ccifNtpIIWVtZwkmJ3sDnkzDUqhiwk6y+tk96ugmr4OS+uu6cz9e+/8NY2Ld8zmA02JEzYBdKFDkKyojhozRzIzyVKiB1XMxGziKB6cNfkJzxAupmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WdyoKED8; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WdyoKED8"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71788bfe60eso1249086b3a.1
        for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 01:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726044417; x=1726649217; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhM6nn3shddOfQsAbEdajAgYbEDY5o4hk9hxIHLCtR8=;
        b=WdyoKED8+lmNlzII8LU86T0FFWwxBFHbWZHMuioE280BPj/E8rql/GhY9ig/zc6DT0
         sOPfOXDNQvS+3QgasCPF8Et521i3TD/pfZSRiQnSf61HoU4pcXowPQ901bTXHSk34Wpv
         P5s+aP7xdEKfG8wy/NQfbW3cnmaPNfMoYYsuSV0KcSZnRb7YDXYYSrAKbp7uqV4tkb8A
         YpuU7PlFSvIcQBkleg09UVhDhH1PjJcrZRPZXGH1uBfyK014qbfE23A78hcKqsKNcZIl
         3TDP5Me6T/t+7QO27WZ0Cdf2GW8sCleStgvgshuYG1JC73eReFkegrYdbAKCsVNe6M4z
         jnyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726044417; x=1726649217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hhM6nn3shddOfQsAbEdajAgYbEDY5o4hk9hxIHLCtR8=;
        b=ggbwiGF2iGKI5rRzPSgaxjeevvUhaNvLmCmycmPWokCcJKZ6ZDVS0yPrBvKGAUUwbm
         bzLr02Ux3sIpeBMOQZ3Q4bsMiFU6peID4B6+AY7C2qoVNyPKxrkOle77UQFK/6JWVkuu
         qloXF/acurZUgGjID1Yp38il8A6Ydl/uQ4V344PI+Qwnq8F2qIsx/JqdZhuuEXoPhRTF
         guDKMU6+QdoNh6aTf/WtxxFGcC3aEd2kXnzo1Z9c2RXHbOOSNI5qORmDa1kjSYYN81PP
         /VnX22LAKDVK+30P2dFWO8SISoXlCmDvKRO0JZ/g4T01GWLwSMR43uaGFIaeQyn37Zyb
         lF+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVBZu9fkcout6CBExksASc5YfVDP0saPij5oeX4nr1+T2mSFLky9ryNLNZzZLm4NZKQsrFFiA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0J8EfVIeKR1S2l8R0qAOk7f55YfK/ayVhgQ/fb+0UB2bzqcFm
	6HSWFfyzmcZtn3pqYS5NEE+XLwCyMuySQeVKQz0tc5JGTViZJDdJ
X-Google-Smtp-Source: AGHT+IFywTc+fEKIENWI2Af6Pl92YCnGr+JPtEAffWFuyESOnmaN6fcvn//eL2oTrduP+cJqvFFuqA==
X-Received: by 2002:a05:6a00:4fcd:b0:70d:34aa:6d51 with SMTP id d2e1a72fcca58-71916e16cdamr3995606b3a.6.1726044416677;
        Wed, 11 Sep 2024 01:46:56 -0700 (PDT)
Received: from nick-mbp.ust.hk (wf121-022.ust.hk. [175.159.121.22])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71909095177sm2530125b3a.112.2024.09.11.01.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 01:46:56 -0700 (PDT)
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
Subject: [PATCH 01/22] dt-bindings: arm: cpus: Add Apple A7-A11 CPU cores
Date: Wed, 11 Sep 2024 16:40:51 +0800
Message-ID: <20240911084353.28888-3-towinchenmi@gmail.com>
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

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index f308ff6c3532..3959e022079f 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -89,6 +89,12 @@ properties:
       - apple,blizzard
       - apple,icestorm
       - apple,firestorm
+      - apple,mistral
+      - apple,monsoon
+      - apple,hurricane-zephyr
+      - apple,twister
+      - apple,typhoon
+      - apple,cyclone
       - arm,arm710t
       - arm,arm720t
       - arm,arm740t
-- 
2.46.0

