Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485C016F824
	for <asahi@lists.linux.dev>; Mon,  7 Oct 2024 07:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728284923; cv=none; b=MkmT+J3Lo2D0GiaX9bZO5SF/6JGO8e0tcNw2B2Y4c8hlWPBYI+MfJoMYBEfFGT3k09ZkX7AvP9RdDmp24tOy6RvDkLBnnSIhTbNnGfVv0dLmCGOioAJQqUSEDUL8q3otJJovtbfTNqwSU0vzdu3wLWw6AmzKvZckS5w3IJIq2V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728284923; c=relaxed/simple;
	bh=9Tg3Bkt19fijmprbRN5ab7iuTDQrl1bvi51xLf2XZGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GCwuf0jgREKhriikpmyrP3e94N86IlZc7LgWxA2+IO3XPqbPiPTqj6iS9Qkd/pfl7M/055Jh9+dCjxEEuBHqOiRf3eEPnMQnJqfEOefSdgVivin6yYo7F+KMmAWnGiBfXJMR7POpuq4A2bEvW/myyKuzATSs5B09vDCxDcBavmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nm8G+X0d; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nm8G+X0d"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-71dfc78d6ddso1107102b3a.0
        for <asahi@lists.linux.dev>; Mon, 07 Oct 2024 00:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728284921; x=1728889721; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uIm2zrJ4mPm8LcDwJ8/Lhrxl8OYUMqqT6Rs6EnJw4s4=;
        b=Nm8G+X0dgb4VpcI1bnmOqZgrgseyC75Z9zHO5Hgo9FTAEtosx/szM9Wvh7ViCaxHip
         7YoS7h4HBQ//4fKyVUl8TTzy/6bYWZyWXnokVkJ69msHpzmWnefmAjGUdM7z228+Ufvm
         6qbRcH1bHFzxobxIshk1Fw4k1kLpVrcuFKeyt39KgFRVHvFzAUUK7vQZE+D77LEMr9sK
         TdEzoznt0HXGQ7x3yxXNITUy2WLTDh1bBUs0+M5PEkC4+1V7skmC4KfHuRwrg+uktgV8
         rY6+/TSILk+xRf5/OQMsygfOZu6Px6VqhmO+lw96zt8B2t+KxLRajQDII0P/t1s9UTzm
         QDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728284921; x=1728889721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uIm2zrJ4mPm8LcDwJ8/Lhrxl8OYUMqqT6Rs6EnJw4s4=;
        b=MOtZunzQdZSH/NE5XDmro30MJVR1Mn2J7WkiNkYDwRFipE07/rRlbPvGhr8po0DYAQ
         hdP1IRmZO61sMBeJjUbkPp/tD5qIrAtXcB7m+JdS0pQjIE5LzVxlOwTlGEPTIt2hPpMl
         MsXZZevm4r73HhjJnWZ0T2r0svbzn7Uoc2euqXzSsL4OEtpCBfliSwjKaQ+ZTkdMTXS2
         +2BTeOfhgEWopww3w6iB9JvC/tBgTCruLRRIWSNYwxgRxVpwayGg4Jp9PB1fBBaLDrEc
         gA8T8ut7vFPiQXYL5Ay4Ufwhm3cujS/yugZ2oKrU0xu3F7VragO3ztCwp2ipQ3saqtKh
         xQbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqV48ZUbASM+zWs5li1sXKdwnlscHuyTCpiH9dQQZLu7VeoCbKcXdy795E5QuAA7L8P2V8rA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzhiM2YjF30kk89hBaC+NqU4jyazrzBt0Vprk5Ycfnpi3Yu+yUx
	8FKETfcNb0zVmeIy4k51VB6P4MMdfd/w3ehgY+Nunmy2VdHpfjkw
X-Google-Smtp-Source: AGHT+IHB47DfkPIG6EABi7c3A4sZkbbs5h6c9kgYfhjhgGCwt12i673zqIXuCwiVGpye+ETlK7eIXQ==
X-Received: by 2002:a05:6a00:3e0f:b0:71d:f012:6de7 with SMTP id d2e1a72fcca58-71df0127189mr10460413b3a.27.1728284921533;
        Mon, 07 Oct 2024 00:08:41 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71df0ccd1a3sm3764147b3a.66.2024.10.07.00.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 00:08:41 -0700 (PDT)
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
Subject: [PATCH v6 01/20] dt-bindings: arm: cpus: Add Apple A7-A11 CPU cores
Date: Mon,  7 Oct 2024 15:05:26 +0800
Message-ID: <20241007070758.9961-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241007070758.9961-1-towinchenmi@gmail.com>
References: <20241007070758.9961-1-towinchenmi@gmail.com>
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
index e41a8aec6066..3035985f275e 100644
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
2.46.2

