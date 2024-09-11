Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE16183CCD
	for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 08:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726044432; cv=none; b=d3vNRKNYZsbqZisY1ScMBoCvTvAHqYleXDW5ss55VrbJ8ue26EWgZsDqoyLEvWV/Cj/jvP/zx+4SE9k5ObuJsn6BvhW9ZHmK2Rn+JYL9vXjQXju194NBNVO6iOS3Am44162CLef80MI9yCbDEE2VCa4Usn3pRcl2OVYZFjh7NP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726044432; c=relaxed/simple;
	bh=F+fvD8tj9Q89DXXtcIua1ke1r+dlwF7u6BI3SFUU4HM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XY6h2dwteuOzmWY2+/sOVIU/Uu61adrMD0U9qF+zYzFA3YDccJ4jap4HZS0lm+53mksNbuPjstoGGdX7TG8JE8vgUhtw7kiLq/AN1UOJzrWCiRUxEMFtFIxWjfM3wwREynuF1YPYsiDex6re5CqF40E32DefPUPTfIPUQDDCa3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/oPCAYZ; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/oPCAYZ"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7cf5e179b68so544210a12.1
        for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 01:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726044431; x=1726649231; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g//YBvaXm4NDbD/O/tpcG0z+ryfJ+nqPnLFYEOt6ung=;
        b=A/oPCAYZAMVzkaxoNClX3qYqe/RI9YKtLdDpIbjufSNGo6h3hSrrdErRfqsogmmQu7
         QINTmJ4Q68ipia4ihq4HwBXIeahyUxETwXKZxR5QdQ3ekc7kFXnRlcRtchBbQSeeG9J7
         LC9ToH7kfkHTbMxunQSl4vIAfjyPa3izg1VaDfYGdnOci972H+J4lzozUVLCdG7mBumk
         hLQSynWKootI4abkVTD3wf4tJWiLoYo21LVPfrrDVWk8OcGoSSVT6OUFohyTlybVRUHT
         b7yBSD5ticWAarAQPvAkwPKyVRpPAZBnED9FS80mq0Mva7Sj6N2JHoMzqStt6BImGDdj
         1mRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726044431; x=1726649231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g//YBvaXm4NDbD/O/tpcG0z+ryfJ+nqPnLFYEOt6ung=;
        b=nmoAXQtERLqyBehsFO3kOQRxrVa3VOiWtxBziy3c8oDLeF2IjihCVcGR0r2+yvDEC8
         TXj/0XtbN2D3UJcCCrpMPm4eBXQsJZ8F0Lj1T6Fm6OIioTTQRraYlT5Rx+PU7VmK/7TY
         oM3VQRK5nbs29MWVlwZRsIaZ76/M4zHkz5cIYxAyWdWqQehbtFzc6NOaud8JI8AzPARI
         BqcphzvJ8sa586IXv9i/XrDZ4TrRevLjr9bAkzVzogyibAekxrRuJLW1F/Uap0QTtJ0a
         ZZRtmVDY3/cFxRREB2QGPX2URhvo04QjhopGJHO0PW6cex9uLf2Xzzk4gseU7bDofdY6
         v1Vg==
X-Forwarded-Encrypted: i=1; AJvYcCWGqnZgacagIMd0UTx01U6ifQj+J7HZbLUSj3Yl5w859Lfi3olzL10YY8ybyMgjLgTe2f7idg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzc3zM330U0eJWq1afeFzMg+fduAyL+1ovJFwdyZst1KrW5ByMo
	OBfngctDcLWMI8VkL+JYMR54PmpaArHqlrTQpuj2IHoWFS0iMT7PrUcOVM8Avro=
X-Google-Smtp-Source: AGHT+IH8/nRyylYUAFxI6agtFOCCglAgDxiqi0BoCGB0dcL7Mo+8ZsRc1G6ANoc5BEGZLhb8Gx5qxA==
X-Received: by 2002:a05:6a21:3a85:b0:1c0:f114:100c with SMTP id adf61e73a8af0-1cf5e4ae0f6mr5116868637.17.1726044430786;
        Wed, 11 Sep 2024 01:47:10 -0700 (PDT)
Received: from nick-mbp.ust.hk (wf121-022.ust.hk. [175.159.121.22])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71909095177sm2530125b3a.112.2024.09.11.01.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 01:47:10 -0700 (PDT)
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
Subject: [PATCH 04/22] dt-bindings: pinctrl: apple,pinctrl: Add A7-A11 compatibles
Date: Wed, 11 Sep 2024 16:40:54 +0800
Message-ID: <20240911084353.28888-6-towinchenmi@gmail.com>
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

