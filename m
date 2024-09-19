Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39FD1A08B8
	for <asahi@lists.linux.dev>; Thu, 19 Sep 2024 16:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726762568; cv=none; b=H2QmBDicrfl7fpKzegPtEPy/Dsz+e+8VFy8xtp6Fc7yIIS6bc6ihI+DZrlXALKqIRDmYyKPqZd2MQaV8qTcaxoIlN05emquMXpD+aJ5f1WH7ks2ZDPCEa7xW5kRQE9Heyk7SvrrhVAS3Aw+vVCguQ4pGfAqrYTl4Z2H3AI+pghc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726762568; c=relaxed/simple;
	bh=LX1yUMUMzroiivpLzHUeZsbW1eLhhAD8n6ENcpLvjXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cGeNfS0WZij+xs/HgSvTOmgBKUznp66ONFHDXAqjBmf0TZy/QaU9PLuj9jc9S6eDTlsDA0EdOJnYV/q/UzEIkgbr4vhDo0ZUufd/dbiMvfNu9XPBJbu5fh5U6m5AKZCtlDgdRPSwmkCA96OwMMCJ75/TOKiLQ2+LkILsQgKsDuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nDSoPhaW; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nDSoPhaW"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7db174f9050so257298a12.3
        for <asahi@lists.linux.dev>; Thu, 19 Sep 2024 09:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726762566; x=1727367366; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oTTMQHgBeG1zBvPSvQGqnSu3NR/w6NwoxxaOUs8e9IA=;
        b=nDSoPhaW/ISIfcb7DGYzIPBNrnBPnX28ZFqE4Zg3QK0ciFxSVxYZPx6Cc2H9YKACKh
         aJWwP14HsKNNtXNTQUmx7/R4eMd4kkS6f/XgsO6BCHFa2RYbdF6NkZil6jX4jeNk3WFs
         110QpIYyx98KuNeEan6prPuzK55RHtdCB6DfNFe6a4Zd1IXpP6vYwuBMemuyjR5V5Mnk
         JOTFHXtaaPgxc/w1irnSrilADL+29QmGqpUwLfKK0qf1F/i6Eh+Mc+M/PuHedwTWHk+G
         eA1kde6tK4lZGYgMKb+tE90Jdc5XuuBVuUjuZev+NT2Oa6kd+Dkm3BI24zg7k4S2rhCL
         c2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726762566; x=1727367366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oTTMQHgBeG1zBvPSvQGqnSu3NR/w6NwoxxaOUs8e9IA=;
        b=plauz3SaS+26msDz8TJqYztE1kSdoJhbO53nRXWrefT6PUJbKgV1HXemFvsWt0ikfo
         YrL2fltOGRnyJ2rLJaWHOh8Xlpvd+VJR/KAc6ZikBgVyT5mzh9oextixOYYZRKChFlwG
         0RqTJMUdrJtBRJkg6vwCYUFYQ3mD+yIG9frVY2JhYelrm/g4n+fP3xFqZUCEBwCZWwrC
         WJFjWIu6P8P1WYNxsuzj1TO+84ILqeUh0F+YNbk+Xw6nXBOY5cpcazBcNLyIJKeiTwYd
         gVQyWV/AmeFSzsM2acxe+jn5rFA2feegsbAosYDFl79rvBNBCuAJGS/Y2f5fJAT8yziR
         0+xA==
X-Forwarded-Encrypted: i=1; AJvYcCXuItXm3skxv5HOg1RrlJARYtptXXAa2spYXkczQeSs0YGyTW9Tsgd0sPIrRSdVDv4N8LhBeQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyeQQvpLt1U8oAfgQkwwY2uPpNGXX/svblpu1U0a5/KFLgZZQPh
	BF1vUgCih/sEkNvHXHWy2mup8o19ud2Pptr6x6jmjnXIg+jmCeRZ
X-Google-Smtp-Source: AGHT+IEiSVKlXxNK3uwVkL7x+UIr/daqEjKahMew9XtrzFQnO5jFF9+vDJZDxsj7cdICqH2dDElMpQ==
X-Received: by 2002:a17:90b:1c81:b0:2d8:7307:3f74 with SMTP id 98e67ed59e1d1-2dbb9f31cf2mr24957491a91.27.1726762566066;
        Thu, 19 Sep 2024 09:16:06 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2dd6eed1865sm2084674a91.34.2024.09.19.09.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 09:16:05 -0700 (PDT)
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
Cc: konradybcio@kernel.org,
	ivo.ivanov.ivanov1@gmail.com,
	towinchenmi@gmail.com
Subject: [PATCH v4 06/20] dt-bindings: arm: apple: Add A8X devices
Date: Fri, 20 Sep 2024 00:05:55 +0800
Message-ID: <20240919161443.10340-7-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240919161443.10340-1-towinchenmi@gmail.com>
References: <20240919161443.10340-1-towinchenmi@gmail.com>
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
index c05a4414c8b6..fecc4953df33 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -27,6 +27,10 @@ description: |
   - iPod touch 6
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

