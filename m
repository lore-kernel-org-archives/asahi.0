Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73F813AA35
	for <asahi@lists.linux.dev>; Sun, 15 Sep 2024 08:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726387725; cv=none; b=nxpsl0pRo9NB1ETCP/MbxNRCkyiJyh0QtLtBCsGpED65+w16+9QxrafYqJS08hPc+Jo6e3RTbBR6RUMYLKfEerryF7Fttl92c8Xqmukgi/Iiw6vsFzoqa/0eB7vvddnrebITHimDRJTAHgD/gtHoegu/mcdTrJldOF+FQ1aKzaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726387725; c=relaxed/simple;
	bh=LX1yUMUMzroiivpLzHUeZsbW1eLhhAD8n6ENcpLvjXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nmidxAGxbMAUlnF0mzJhWdRUf5Kc4KO78vawE1qsb7WIyxEtATjAg3TdG8T2U2XHiZJUHoGSaVizrF+7pEyDtXKVq5ao0Egvfk9WrQfFsF3KnVQFu/F+wuGFVYPAF1zFvE8WtKsBaqXf6P6aP//l3Z4GV8OdqCQXOVE8Gjgkzic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XpAg6Y7z; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XpAg6Y7z"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-207397d1000so33830315ad.0
        for <asahi@lists.linux.dev>; Sun, 15 Sep 2024 01:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726387723; x=1726992523; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oTTMQHgBeG1zBvPSvQGqnSu3NR/w6NwoxxaOUs8e9IA=;
        b=XpAg6Y7zs7e8DE/fNR1yaastaqWI95G5uA4a6iWXg5VZeN2UJqp1GZJSBsPJTPNNHq
         x8iG2ez41M3gU/3SUP8EUk3SRgPvldEYgzKlwo38P3NFt/1o9CptnN/aw9Y6R/Ev3cEH
         m4ZZ4J3gvajAYA8EMFuCGzxlQdIc4h9pwaZsrjzLDm7Qxz5ce6jBn0MZrdE+akY388AF
         wVQvux3hVSZgnKW2pV9HAoWUANIzcPvOeNwUgC2NsyfFksU3A+h41d4s7HKTmDXHKCuX
         kXn5IP7u24YIKw6ajgPNHfYSwqISO3OxXYWbTFO7/eu/0Q/N42RJFDS6hqxJ/Z+VzUxj
         oPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726387723; x=1726992523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oTTMQHgBeG1zBvPSvQGqnSu3NR/w6NwoxxaOUs8e9IA=;
        b=dugzwYjCHnZMCxbeh5ec5l2jW7JTs0itrW2f7rdKWVXE1IiSvAXXnhFjCOaip5SuYh
         8M3MWP7VMERRy8f6SmhX6w7B6r4m2Rz4HvRRKu+G3e5Ha1XJNhmDKc55EtBfYDDafjed
         7Ja8Co1Pisjg5D666qGSQNs3voCLVLx1kj65M19fW6oR/y7lsrBdwAZ8NGcGmXs4QV3t
         T6DnPYZsHL5p+iCNXqwwHYF8b/B4niPRFf4AEO5gzPmI6hkaxwGPnOH/utKolSwYLDAz
         NmgEgllHCcKvoIAqHkJmQyAXgeimDGCqm+bwbeWgnEHQTmfw7uAW0KurkIgu1g28JfjU
         zkWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJLyxOTS5uNdDvNaqswzx3Toz/GiXQA5xWTXaPAp+ir6JB1ZV9TNEs8gX5rFrUwLjcZKXkfw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwrDe65qP+q0dRB9wLiEInti48oOb9UPOWZ1PYmGQo0faZ6WRnU
	hLjLw6mEXcQn/9tzPWekEDXgQ7XtO8ZXXSjfiP0ayz6BIHvNsV59
X-Google-Smtp-Source: AGHT+IEm6DFnxbNtUyFclJfhGbDR4WVSXdUPm+ukl9wfMKJXk1gIa2zQAZdfkRenc7+t6qHYmvPFoQ==
X-Received: by 2002:a17:902:e54b:b0:207:794c:ef24 with SMTP id d9443c01a7336-207794cf0c6mr153102655ad.4.1726387722967;
        Sun, 15 Sep 2024 01:08:42 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-207945db012sm18248865ad.19.2024.09.15.01.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 01:08:42 -0700 (PDT)
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
Subject: [PATCH v3 06/20] dt-bindings: arm: apple: Add A8X devices
Date: Sun, 15 Sep 2024 15:58:51 +0800
Message-ID: <20240915080733.3565-7-towinchenmi@gmail.com>
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

