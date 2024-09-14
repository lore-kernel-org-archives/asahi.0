Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE97022071
	for <asahi@lists.linux.dev>; Sat, 14 Sep 2024 05:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726291533; cv=none; b=vCz3ZK7SJbicxVNpI4LdcbcrMM7hcmrc1DAT51+0y22U0PuHBiKufRSR9KR+wEhabyXrV9GNenZpgjtuUGtCYLBynno9rPSQddu7yvrsRIwZB9N6+8fB+tbUuCWYtai/fWcWtyZXywqSXDuyNgkMV1SLM82AZqolLc5bHbNPWok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726291533; c=relaxed/simple;
	bh=F+fvD8tj9Q89DXXtcIua1ke1r+dlwF7u6BI3SFUU4HM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qgmddjgNpDFBwc8bW7r7Ql2U9zKbltPTqFIGnhxUQNTCvo9/66nh6WoP4ptTO6izjOGnfKOxe7vNrCnwU5KzFm5b5jkmvQLlBemInh0cAATAYAnDDX6aWEYZmE0FfLfW+I5Yl0DyZ1k3k60wZn4sDNvNRco6EkuBnZzaUfb6xFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PpBrqOc+; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PpBrqOc+"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-718d8d6af8fso1997363b3a.3
        for <asahi@lists.linux.dev>; Fri, 13 Sep 2024 22:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726291531; x=1726896331; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g//YBvaXm4NDbD/O/tpcG0z+ryfJ+nqPnLFYEOt6ung=;
        b=PpBrqOc+E0dWGfvUs856xMO62joBxn3d3moEbxZuJb2ZWPQvGIcH+pdjzej9OWh3i/
         ITlReeI8A8O2GA4FOsQOUZWedjgM6SK4lbaJVpSjw0tr8hAIfLz/PHLiqmL/WIarMroI
         SWgSXgu0HHiTvXud6CHMj4KDl9p8wTR3EI9RZrsCDWrwzynnaWzIMS9yHFWV87ZSme6Y
         vwPlOtHmto3hhONsn+/lwhgmEPedkaSqBbbz5uujnrn5Gwi0bmzPa8XI0/hYcM+SuAZF
         Gu49bYYOguIGZf6FMWgJDNkjvrvFRcgKivoiai7vTW0vepG7yFPcgikiSPAJnhq9/yPY
         SSBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726291531; x=1726896331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g//YBvaXm4NDbD/O/tpcG0z+ryfJ+nqPnLFYEOt6ung=;
        b=XzULj8H0CsFPpDBTCWjADciYnoJB2LSEnBfSc89fCoo+g2aHifHPEM6B9dsDBDT5I9
         A4BIG10gQ4m2GvP2zg7mimTE5tkQlaT81QbWvRxCSO1Iq9QXdz2Ub2aEJ/3gobyYW8nD
         pHR000DcvX98kZKnbXVTfmdiKpOBCsDbAGwuk3smABWh/G5F/pks8kZtQU1W81Rxx0Ci
         8OLlzPNtBCw19qCMnUocSD2PlyraiSXVe6l4OGbkopGbT4Dm+1v6ReqN6jGZ3te406Ah
         qXZdnfU4FjWkm04MZWy3qR+VcAJizj5nH1iTOYoiOhxzXHXfhwXWvf2qrTGtv8PA/sDo
         ej1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVielylhoGQXw7oxoprHoFOM22p6VYWsJtUcAEnT7lrmSsyJAK6ekYezME+2CFk72oXBykmfA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxSPcvrWZ6MVZP/nYf4GSFZBqnLSbGbfKPLpmJ7GDOY5RGML57/
	lewzRgHFWwI/Vrvu5S63kP3xNvVE8SeJVOmZ6oDYjxOarGdk7kWx
X-Google-Smtp-Source: AGHT+IGQSFu6QY66e69mAhTPIHg3eNOkel13pASKa6+pvmxCzW50S4DffsbQlwvOy6w9642wKkbLuA==
X-Received: by 2002:aa7:8895:0:b0:718:da06:a4bf with SMTP id d2e1a72fcca58-71926067e21mr11597097b3a.2.1726291530977;
        Fri, 13 Sep 2024 22:25:30 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71944b7b749sm391223b3a.113.2024.09.13.22.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 22:25:30 -0700 (PDT)
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
Subject: [PATCH v2 04/22] dt-bindings: pinctrl: apple,pinctrl: Add A7-A11 compatibles
Date: Sat, 14 Sep 2024 13:17:13 +0800
Message-ID: <20240914052413.68177-8-towinchenmi@gmail.com>
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

The block found on Apple's A7-A11 SoCs are compatible with the
existing driver so add their per-SoC compatibles.

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

