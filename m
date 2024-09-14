Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A6622071
	for <asahi@lists.linux.dev>; Sat, 14 Sep 2024 05:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726291493; cv=none; b=awyLrejOnY8TiOJXgIzmoIbnyZ3XZro0FdqIRKapF0Q+4diR1HUNwbsLOD/RYUEWR9pUk30w9d14P0PPqs9XifiEypYx5YzKVAEiaF2wOuuttrL/M7JJeGOr3Hh4KiiYK465YvciXOoblImU3jYDTVo38BTyIgZVM6RxfsdsJbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726291493; c=relaxed/simple;
	bh=D9QNipp2Cu8jdxZF2ATT6QNQY1AaJfGlXa9a8v3AUeI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nCvF2UGCUZRzWn9bR+sARS1CNZgkeJ2rK3fFMTqaLIMdIcAKb+rkAxDYtHmHryCMTXaOHbkR5vMv0ju6HwMn8EMLMLjXsS+R1IJNeNZo06xJjhfDwh3U5kcZoZjVcaZ8Fx/THdVrVYAvMLUzKvYdT3gR5QiPQ/svS2pLqsKELLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NGTIl0LH; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NGTIl0LH"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7d4f9e39c55so2058188a12.2
        for <asahi@lists.linux.dev>; Fri, 13 Sep 2024 22:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726291491; x=1726896291; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMfm635R2ZedUv0K9CBomURZ5/GwgVeWzLysAHmmerM=;
        b=NGTIl0LH/yzxFoYW6FgP26sNU6BYTQ6b2faWDXJO8vdfHPo2CjTSjrE/2ccKIBCsZF
         yVzPWMiiCOleMWfRcKu+/9OInz+IopmsuHFRfuy8GkFMei7izr3evx27j7Lx4a7RnoMe
         yE87tP0EHhqjFqbpgnE1m4QNd8A4gHHb1sEnv9mwACIFcetxjursKzE67UrUqgDIKMw0
         jeZn1HTHFwgGq1kc8Ynrcpw5cSjN0inQF55amCwj9zzsXktklDIUhVqnylanlZXRfakH
         GFB66mlxSEIF1w3rgXqxZNGxsd57otLHL5nFsw9S+qCUAiPW2tVvVrk/hzmRaW4I42oZ
         o9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726291491; x=1726896291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yMfm635R2ZedUv0K9CBomURZ5/GwgVeWzLysAHmmerM=;
        b=K0/V2Kq/FrFOUIMEKOi6vuiNg7hKRFYmrQ65MbAfhqfH9fSMRZK/kAp6uV/pTeSDsC
         Jtx3To7kuHh0WCGJ0KvXM43yuoc0c2aIHNEhXhF2CnPjOnNOWipXqvaXSCBhgNE3qLN2
         uGlyzp3hIrT4ZfNdv9hkbFYKqkUxAB0ndAen7MPlQ8VqrNOYwyKVaPNLk9Sv9c22ZhkU
         VzZKsmOYUcOWGrbMxKhV2F/vrO77Y/VmWfov8yGFzgOyKOT/gJyItYyQbw/n3yMIP2pk
         mVkgi3sGJwaOCTb7tYVrU5t4DMsQq+DAS9+nhk/7lwqgPGyQGpXpc1w4Sc2eebQvEOOn
         EMRw==
X-Forwarded-Encrypted: i=1; AJvYcCWne4yWMkIGBTxd5er7BErIXH+6GIH8cOS7FkDDmChVOdvfJ+/9dqU/qQZ2Q8n2AlPxAcaD1w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwxR8WVjeO7n6A935d/AFn7QRUUUp6vmcQV+mfvuwdUTQ1uP3Z3
	CiFOlNEyj3pm+WNuiN69avgM+lo0RJV9yF6jmF/KupvGcpAP2jKn
X-Google-Smtp-Source: AGHT+IF+p2N/v7D/f9QhDmmsA4T7yTXEkaxEH1zZGQX6ejyxliq9F/Sh3KYea+gDrN6bVgpFOAQffQ==
X-Received: by 2002:a05:6a21:58b:b0:1cc:e9bc:2559 with SMTP id adf61e73a8af0-1cf75f0f12emr11241110637.28.1726291491181;
        Fri, 13 Sep 2024 22:24:51 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71944b7b749sm391223b3a.113.2024.09.13.22.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 22:24:50 -0700 (PDT)
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
Cc: Nick Chan <towinchenmi@gmail.com>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v2 01/22] dt-bindings: arm: cpus: Add Apple A7-A11 CPU cores
Date: Sat, 14 Sep 2024 13:17:07 +0800
Message-ID: <20240914052413.68177-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240914052413.68177-1-towinchenmi@gmail.com>
References: <20240914052413.68177-1-towinchenmi@gmail.com>
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

This follows the existing newest-first order.

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

