Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3ED16D9DF
	for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 08:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726044423; cv=none; b=ErJZiSMZa5MinwOrpXD5K7KBN8FhEy10DHIWlHRLb1nL2FQZuzARgXdzVecDlE8Q0F9tlOu2+d7KT7O4UgKr49zUsDsPgaoG7uxTynki/SN5uGQcRnhB7vQJ8lIK90YkVRZ+2zU+ro5xtJwN2Wh0MeMXuTRv972DxuHcSEFzorM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726044423; c=relaxed/simple;
	bh=wjv7S2defJHb4w2LIijyyI7ICLEtDGHr6+Y7Ed98jvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f5aQYIK8VO29X/4UsqZHleds7d7p5YFOGHpr3c7tvHjPo9fh/U1QfZ7KlQBWUZcUjtH1NQPo9N1l8S9IGMQZKWiXDjpxXRKvB+IRrYi5TYcMhIgbyPIgfoib86TcQtkKcaATYdTCXIvRkSfN2yq+1ZxfTM/rITwVYDawFk5ITik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KTpFOkLb; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KTpFOkLb"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-717914d6c95so4249564b3a.0
        for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 01:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726044421; x=1726649221; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=drlfe7ijxNosG2VKP6kf49hdRW10I7zx+SACXHP4QNc=;
        b=KTpFOkLb258zWN0SVAiT4aJcs7ZKBm7zgQVX58jxWlzOTknVWOVA9vXZBDRAbEl/pm
         nfnMiAX6SiyMAoitedz6WIdiiCFV8rzImttg9uRgC+YX6n657i7n+uhkcEsKeMnV/di6
         bMR4dQl/vaiQcV1+JWhF0V7rqxW40qupFbApfsS3MuMGk+ZFxOv5c9qz6gkpXC2oZZwP
         FtmKyJyfbsusyTEo7gRf/688F5LIJWCjya9Xb/6easUoQHwa2e9VgITWYP+GW8tYOjmT
         02KFcjk9y6OMrPIyxqr0ac2xdQ0yPXpmC5nB5UYmM5GhRb+7f+gF+mh4ih9JZPJIB386
         kUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726044421; x=1726649221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=drlfe7ijxNosG2VKP6kf49hdRW10I7zx+SACXHP4QNc=;
        b=JDavwEqWF7GvbzGnltGrMt4dvvfSIRXavOiLRtEHbMUlf1R7O2I7zqICazhIeTzBrK
         LtquFA4Su1m4FrI0TTF7Q1iCelAbnwtNbZs2cBsdk7Fszu2qJ5hffoZI0vWyzN5uYnAi
         KwiLRPerNdPl22CevISw+gzl+1otPdBOatqrMlVOCKRIQpAP1APKAsPWhacA76Ksu9l1
         fWFCSMTk+Oz0ggPZ6jF4t5JiJ25FRfMcDP/K2p2LvDPsBm86WL8KYo8llkNpFfWtMQJz
         DvRar9oXrVrtM3Sy7U2PL/9l4IlC/tb/xPruSltokTB6m2FxTLtG5OzCsa7dhMhOzPup
         LKQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbTiWZqTxJuXtmAW9+xGLV40vRqsFhTA4jTxtnFpHJclmxxs4v4+MQYM4F1QJIC+AKZkRD0A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8LoI7DbkqYlzHAwDuKz7MmfXRCDARna3tCnmY1klxnjTrJ3FK
	ml0N1zyJuCfBeodR5VGQhqpghZQWnrg7izvHRoxWI5JKCZzezMZI
X-Google-Smtp-Source: AGHT+IEdAb8iPla587CMNYLHmoCGdjQJEE1KnhntFK9s8SAt+VoAwMchj1XQxQ5sg7+JKpi3Zu0qJw==
X-Received: by 2002:a05:6a21:2d8a:b0:1cf:5c1d:83dd with SMTP id adf61e73a8af0-1cf5e03238fmr5427708637.2.1726044421370;
        Wed, 11 Sep 2024 01:47:01 -0700 (PDT)
Received: from nick-mbp.ust.hk (wf121-022.ust.hk. [175.159.121.22])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71909095177sm2530125b3a.112.2024.09.11.01.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 01:47:01 -0700 (PDT)
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
Subject: [PATCH 02/22] dt-bindings: watchdog: apple,wdt: Add A7-A11 compatibles
Date: Wed, 11 Sep 2024 16:40:52 +0800
Message-ID: <20240911084353.28888-4-towinchenmi@gmail.com>
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

The blocks on A7-A11 SoCs are compatible with the existing driver so
add their per-SoC compatibles.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/watchdog/apple,wdt.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
index 21872e15916c..310832fa8c28 100644
--- a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
@@ -16,6 +16,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-wdt
+          - apple,t7000-wdt
+          - apple,s8000-wdt
+          - apple,t8010-wdt
+          - apple,t8015-wdt
           - apple,t8103-wdt
           - apple,t8112-wdt
           - apple,t6000-wdt
-- 
2.46.0

