Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18FE81AD2
	for <asahi@lists.linux.dev>; Sun, 15 Sep 2024 08:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726387707; cv=none; b=XmrwFIdyn4TBbcX2fxuUiklVCDB2I9XnRJIUvgBUuHF2UGBv2Hflyoh1Doo8sI4DFIbCY7b6KoOx6+mxTkMVpW9BrzahX3aCTl9YmGXJ++v6XKZU5hKUhi4fTRW2YsRzklZyPxToTXekFkgOaz1V8hrC9kbMJCzAmMeinKYrEi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726387707; c=relaxed/simple;
	bh=F+fvD8tj9Q89DXXtcIua1ke1r+dlwF7u6BI3SFUU4HM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dq1xOHFUSot59J6XKrEbwKQAz5Pvrrpz48Np6XTlN+krBtQhPHILrUMzGGHILe3Bkps18vfLysPTbftWY7PRH94UUp/5CoYWKXiir3cs1i9mAEelS/bgXeuW2w2lO7G1uBYbw+CxEg1NpydBITMh0qmVl2mZ30xDXTlKZsINW8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AQ6oOIrj; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AQ6oOIrj"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2053616fa36so41230425ad.0
        for <asahi@lists.linux.dev>; Sun, 15 Sep 2024 01:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726387705; x=1726992505; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g//YBvaXm4NDbD/O/tpcG0z+ryfJ+nqPnLFYEOt6ung=;
        b=AQ6oOIrjwQugYp7M6syk+fepybcEI59LlHvWYSkQ3LMWjGONea/blsMReeeq0OAsW8
         BWa8GrRWIQHf+sEP5nfgkx+bPe7yBbhcqKpcMO0eufUtauaqlDpFpeyHlJmSLCbDEkZK
         vHtRoL9gZyf8coq3Pj9J8iYiXXbz0qmu0FfM7djOoOqH35hYMmoXJeC8PIh48DlJBMbJ
         JgvJpPbqBoaa9k46EJq8Y+a3SrN43hq7cnV9hBucGvBnhh3i+hmOUL8xjnFi9KzEfECj
         DickSROoS94J9VOyP2jjRBkTWCNcRJ3M56ItGYE7SGsBUuC79IXknh/VUM7QPxhablDw
         AOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726387705; x=1726992505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g//YBvaXm4NDbD/O/tpcG0z+ryfJ+nqPnLFYEOt6ung=;
        b=FBaaSvF3y3D5SH612PthvXGJ35c2tRzzet0JcOXocsdHjNMDwoZSA/aXc1p9W0Kyxk
         LlYxbfeQ4jo2jRCiKicMN7+nG7vWITH/4q0wc2WON4NHOjeRCUm4AZDonrx2pT7KFcRz
         dGH4Oe9B4qWj7Ci2MS37P9QnzjT+9y6T6zS8kj13Elr2X+bzqs47G0qAQm+256CyFAVL
         LuphP2gAQC1ur6FmJfFBPPtP66EExbFvuuEd/1vWHlGM3usyFtQMzVL7TNv5KogvYU7L
         ZwKynPy+2w881ahwmFtf7QMD+mDiUKeYKLmKuHmHObnNTJormsajjXZAhzBT+K6JBN47
         434g==
X-Forwarded-Encrypted: i=1; AJvYcCUvc9XfdJyi6RSgeSOO0d1m6mz4FDTEdL5a+JAL4XRT9Kg/R3rK6y/+cgBN0ySjWNEAbPsZaA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzFUMg+agCMS5bKDQ5uCn51YEOYOE6Cp4pzaJTCleVytjz1NwCy
	yKhb7BEnCWbRhj09Cthh0JpvS5D4BSadks38OG5QZ9NNKYgRVX+q
X-Google-Smtp-Source: AGHT+IHdX7eWd+p3aBlKuZ6bSnf/MvFuZFPzc6/zjqFg1OTMtKAyvfO6LP8P/6z288oIM+Pt4B1/Yg==
X-Received: by 2002:a17:902:e5c3:b0:205:709e:1949 with SMTP id d9443c01a7336-2076e421fd0mr191259825ad.57.1726387705031;
        Sun, 15 Sep 2024 01:08:25 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-207945db012sm18248865ad.19.2024.09.15.01.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 01:08:23 -0700 (PDT)
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
Subject: [PATCH v3 03/20] dt-bindings: pinctrl: apple,pinctrl: Add A7-A11 compatibles
Date: Sun, 15 Sep 2024 15:58:48 +0800
Message-ID: <20240915080733.3565-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240915080733.3565-1-towinchenmi@gmail.com>
References: <20240915080733.3565-1-towinchenmi@gmail.com>
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

