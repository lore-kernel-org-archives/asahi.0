Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD6213CFB6
	for <asahi@lists.linux.dev>; Wed, 23 Oct 2024 04:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729658696; cv=none; b=lLhPXgxoCfEyWkUPuqXuDuCxVbrkfIoUyY97AO/bTmUQFmpka4ITH/mH8M2H+nlJytEBekdAXVZxFSiZfZMQ1rmiStqvisIhhTq+jI3hFnwMql2DgOo5JMCrDIlrp8ChXu41Hc1uHrMKNXiy6dj0DFiiDrkDHLxU+y3ne48v2JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729658696; c=relaxed/simple;
	bh=oEG6p+vWkAWs7zrYdXJAcLsli3rmOydvcpIRQN95zb8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f7fCxixgnpq1T/S0fE1BY2GpgUTqERQyGg3XtgM/EVkHv4pSlGtujCmUB62WrIvHaicwWrYts1n43MLEVIpO/oLYgU2l0Cwd/UTxrWpN/cPR8K8WRU2o5pYg0j3gRxyQGfeCh8tNUQ2W1bfGdchhW26mg2Ngat0hgw/SI1ZaQyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iOJ06Cd3; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iOJ06Cd3"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-20c70abba48so53271015ad.0
        for <asahi@lists.linux.dev>; Tue, 22 Oct 2024 21:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729658694; x=1730263494; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAdYfBN+Mf10zH0eoCFYz9vxHGOsv0094bye20ACE5Q=;
        b=iOJ06Cd30tqcmcrTmRRJxJaUxrIAR2Ol8EWGHGN+EGQ5/eI6p/U84Zgova+5/zJD1u
         CRcfyPthayl5lNaPe6SpkBVyTbPMROnkVE1UrMvY1aLOexPZ+m53/fH6T4TjIOyQgbqB
         bqXcoe0i0TAoSgWJ1SLfRtNABa5Hdcb+kDEW9lu0Rrg29g/nAwOIAVpAe+3m4cD7Wokh
         EU/KEKlAzyUyBeEP38TmPwAzkqV1m7aAQ/tzWUq1Wh3XL2bmW0vIV3JTeon2P8u1bMS3
         7UXbMV9q23CRyZBgWgHUTpMxV5MNszxCRppGAtY8RL0CSUCIbjvYbGsOOD+EYbHpJadJ
         aFmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729658694; x=1730263494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yAdYfBN+Mf10zH0eoCFYz9vxHGOsv0094bye20ACE5Q=;
        b=SG0vzG83K+jI5pU9J59P95HHvubVYaRiNbOJIkaQLyTiUOPCU/6i2FehFp9gn1tY4x
         GPMvr9sopePGe4HPJghjDZyx0iiLT0mMGESOQqvhxBzKVs59N5RMzBupk15SWj39ofhR
         UVNmK0dVfXyu9kdNn+V0hRplB8+6P23qtBCMbZO4y/PjCj4LPShRzJQUBNExwZZvljl5
         TXmJWXEz5M/Xd5wofmlcLNPzHeR5HtkNN2u3+m+yALuOErBG41s6lNAXWZ/5Fz0Gbg/k
         bBD9UWldHoH8Gs2h51tezeI3EVCk/JSCSO+BOboRuD3KgvdE/mTzkKr8pXYKzWtIF0un
         1pYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfNqpKL+QqxlSsvfhpOHWQGxC8n4qErz/KEUQcGWszoiWgioY8NFmGgSCnIVW2of8IpD058A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxbDbMdiC6eyWsm2Ur/JQ4OKdDUpjOArW8AbPXVEYW0bNwWsKsK
	WZd4j9TgsdxrVLjVAK28BevlKm9UJQQvHxPDazknsVdlB6YMOPBF
X-Google-Smtp-Source: AGHT+IFR5NkdGICd7s9c2//F6zkeu11cFy3HP0c2fdOAiP6AGF9wRnepLtOrmAX5Q8qGU1rxNE+5JQ==
X-Received: by 2002:a17:902:d4c3:b0:20b:8bd0:7387 with SMTP id d9443c01a7336-20fab307224mr19637715ad.52.1729658694457;
        Tue, 22 Oct 2024 21:44:54 -0700 (PDT)
Received: from nick-mbp.ust.hk ([182.153.135.7])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20e7f0de3c3sm49983125ad.207.2024.10.22.21.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 21:44:54 -0700 (PDT)
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
Subject: [PATCH v6 RESEND 02/20] dt-bindings: watchdog: apple,wdt: Add A7-A11 compatibles
Date: Wed, 23 Oct 2024 12:40:37 +0800
Message-ID: <20241023044423.18294-3-towinchenmi@gmail.com>
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

The blocks on A7-A11 SoCs are compatible with the existing driver so
add their per-SoC compatibles.

Acked-by: Guenter Roeck <linux@roeck-us.net>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
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
2.47.0

