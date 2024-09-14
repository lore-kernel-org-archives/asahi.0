Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392F019BA6
	for <asahi@lists.linux.dev>; Sat, 14 Sep 2024 05:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726291509; cv=none; b=H9Wo+gw9qOci+Qoo2xMz5nUXbqZuKqnIuNRlWiJSPj5/NODY8YiPZRL8gVDLX3V5ucqiMwWT0oKyyclKjk0K/GoH6ip47vtOXaKBHll08Pvw3/yFI9Pozsk03qSOcFPZmdnZL+qBM7AYgxz52m8L1EmpyaoGPvLu2jXPcmU5PB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726291509; c=relaxed/simple;
	bh=wjv7S2defJHb4w2LIijyyI7ICLEtDGHr6+Y7Ed98jvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ELa4hY23GWtaF9sF9CUwTCdFG1xQM47TZDG43Hc0c64XLfcrwrWQuJfkdEQ9BYakdvJ2IOXzP0ngrZeWzxxhU5JtJ7xupuVaOQOH/UkA9K5u5csx8dEg931smwA8bpQCvjAlkFTA5VR9MWiXp0PyswIQh2JsKpQhsyMDJgXN8dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=afDRWsmQ; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="afDRWsmQ"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-717934728adso2178894b3a.2
        for <asahi@lists.linux.dev>; Fri, 13 Sep 2024 22:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726291507; x=1726896307; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=drlfe7ijxNosG2VKP6kf49hdRW10I7zx+SACXHP4QNc=;
        b=afDRWsmQYTKT5bLUaUQkTUBNWpMZX0A8s4wiA01RNG2XQE47yhN6DDgNlxZ58T1PXT
         MaxjeQukwquLXbY7zUTc/x0gGxaCfYNp+Q5wqFGydT84U9mfIJ/s2Yh4zK2sqi4vhRmj
         hz6DkPDkKvXkdsyqO34tQmrhzmgbOHckRZES5RmhJiX/WcdgixLm97aqPnSLJ+BakDzP
         TC+5oUQtnsHIe0tDS1Wq1d3yMZbcsmt6imnYKh9qI4cqaJzE9hMweRdawNsM9DF4/7Ql
         WEs2Gypzee9L9CcYPJwJu5PbtJUSs66Tt2Ui9Oe+ovR4WjpNh8c5ECXE9p/2hmNa+hzx
         iACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726291507; x=1726896307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=drlfe7ijxNosG2VKP6kf49hdRW10I7zx+SACXHP4QNc=;
        b=k7sf5mcXpcQyx3d2uL/oW7KAkP5eivDgKmJxATaGt4/sbRKi5sPt8zByaPI5qFr+cI
         ofs219ivVm6H2AxlBfIFcNm1yplIgj67dQo65aHc0obMd2o2pVHt5Gz/mGc9zyvioY8k
         9EkjZeqtC0vYCO3fhBXRrf/nSnFWskNaK+EHIty43ESUXviTfdjVG4GPXDsqffHPxAnl
         UZbZsPL4Irny2KKY2OcT7RbFHo6nEAMsYLOKRRX99rj+GIkKekGFSV+55Bsp4Mil8by2
         DNIaVLuyScba9b7wwtp6OXJQ/pav3PNkelRKn4owhyJRsWyaqAO6tMDCmbFth9i7a2Kp
         i8Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUCUfu55QNGgrjQjPeT8cQZwcrrqEnBtpggla33TAparf5foFOQUvvYe3IOvq6+04C5W8DpJQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3H/rn8hey4ILIGZZr3Yr8EKrXbgSM83GaWXgYB+dvEoAL/OIO
	E8fYfaHF/k6ZOF8D2jM2YLhXrMdE43xEEdF4x7tIvdlawEeh8VJ1
X-Google-Smtp-Source: AGHT+IHkKmn2lhDEjah/IlC7WZ3jWd76fP6Gw2PZutOZX4q0PpkGixHypso1ex28/diQ2yFIXgMejA==
X-Received: by 2002:a05:6a00:1906:b0:705:c0a1:61c9 with SMTP id d2e1a72fcca58-719260826aamr11109442b3a.9.1726291507338;
        Fri, 13 Sep 2024 22:25:07 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71944b7b749sm391223b3a.113.2024.09.13.22.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 22:25:07 -0700 (PDT)
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
Subject: [PATCH v2 02/22] dt-bindings: watchdog: apple,wdt: Add A7-A11 compatibles
Date: Sat, 14 Sep 2024 13:17:09 +0800
Message-ID: <20240914052413.68177-4-towinchenmi@gmail.com>
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

