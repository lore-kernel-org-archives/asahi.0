Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85ED715852E
	for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 07:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727248856; cv=none; b=mTNHKggPw1jLWoVIaJvemh9d99+wKpCUgJlrAT7nxYoc6LvM8XrSQVovcjk8HLPN9m7ehidwf/qnr4QTbPNa4QIF2Qtzc5hDTTIfidTJLJx29yY/KvE1FDlsBA2G3b/1CLgL4eANDkaq39PFFlyM4wtQFH0kODr9cVsj1yIE9Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727248856; c=relaxed/simple;
	bh=i8976LxUokzRrIAum4bKP4FHZqyTqb3EoP03KvW0FYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hvjRVsmcs5+67HFcs/7hSA+cl2hALHoS15ueoX75kuvw9/j8UOv4NDwJ7KSlZawpSipzEzdPEpUE/mlZmYR+1LaKDb3X1qmPTsw1Dhze5XgxaZcaisToBKh5sraUlpJkSwcEOfhEEEZ80dvBNXgIOD++7qGOwUErG7Zk2TgnKRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e9ooJst6; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e9ooJst6"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-710fe5c3b44so3667399a34.0
        for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 00:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727248853; x=1727853653; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0BGeqoOyiBBfxko0YQeQCNLaxzumXXb88iTx4M2L8Ds=;
        b=e9ooJst6/YpLDAmK8CrOKQjHM9NP0XhxATG2e5GXkrO65bFaYoq8xLUdvTwR/8TN/q
         syHN/iVsYoKuS8c3nLBKPC+9SIan2dDwAhdtzlP3+zDuLfw0pqtRidGBK+UnK8pgMvA0
         xB0ns7TuAqExqxRIexkKdQs7xvxZnwGns1C5FFBVWep8QlEYQmfCtkxF669zJqtcwExV
         yFYcQPxMznONmfvw9qa7gvKkOKdxBTGHpF3hFeiffLgdyeoFkuLiyKee0H8Vvs8Zg9WD
         gbg2BpqmomGccD6RsrKXy33SY46C9cIHevDC8HK3PAjGZEPba5JZyqDwjiF5hkNIzhAY
         prfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727248853; x=1727853653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0BGeqoOyiBBfxko0YQeQCNLaxzumXXb88iTx4M2L8Ds=;
        b=au5w9cKR/kyHmOcS5t552TiARGmsK+g48nCMju4cU3dp9uS8OCcRWhQtYJvdPpL6sB
         QyuhIpreITI3eID7pc5spYR+V6qiMbaiAwIz6fxHV0lj3c3on+U2pfe8TnGZVs1TlzYT
         rx7uwIDd4HUO+izmk2AMY16eYX63AzqiCKMRAvWNKxs/MdFCyOMAJRkwqp5V7Iskt4Kr
         0HlRyrzCUCjLy08u2RzT1lzOhz9oQ/GGUJRYgWWHy+pNWRzcO/KTQg+muNnoxhAHYmbH
         OEH5KDbHSujw7biT2N42p/WdqCSk0vBYEuiQgHahTE2mva4FLl6t7XjRwc16T6MdtcKa
         YElg==
X-Forwarded-Encrypted: i=1; AJvYcCVhnvrfDRj6Q6lDoiHTUxaJwWEiBpCMSRkxzuQe4tgL94PwGigjYAiLVpk3glojwyxgVSiV3w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzorTR8S5s2qyQeA0j1B+I20LDE0tToQZPpae4aL6gN0mnMryWz
	wb82HFP/aJ9uyj5XhoJaDelLgQsVnITe6miO7sVPxvTrkqSd0Uid
X-Google-Smtp-Source: AGHT+IHcWwEBIz9J+4OSED5kctf4FrX3jmlo6xLutYP49XS+9Gh0oLHvhiC7/iOTW/EKSGXH2gKnug==
X-Received: by 2002:a05:6830:6b07:b0:710:eaf2:9f0c with SMTP id 46e09a7af769-713c7f3484fmr1214023a34.32.1727248853464;
        Wed, 25 Sep 2024 00:20:53 -0700 (PDT)
Received: from localhost.localdomain ([49.130.52.78])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7e6b7c732bdsm2155662a12.63.2024.09.25.00.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 00:20:53 -0700 (PDT)
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
Subject: [PATCH v5 05/20] dt-bindings: arm: apple: Add A8 devices
Date: Wed, 25 Sep 2024 15:18:03 +0800
Message-ID: <20240925071939.6107-6-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240925071939.6107-1-towinchenmi@gmail.com>
References: <20240925071939.6107-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds the following apple,t7000 based platforms:

 - iPhone 6
 - iPhone 6 Plus
 - iPad mini 4
 - iPod touch 6
 - Apple TV HD

The remaining HomePod is not supported as part of this patch.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml        | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 89c1e35e404b..c05a4414c8b6 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -19,6 +19,14 @@ description: |
   - iPad mini 2
   - iPad mini 3
 
+  Devices based on the "A8" SoC:
+
+  - iPhone 6
+  - iPhone 6 Plus
+  - iPad mini 4
+  - iPod touch 6
+  - Apple TV HD
+
   Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
@@ -89,6 +97,18 @@ properties:
           - const: apple,s5l8960x
           - const: apple,arm-platform
 
+      - description: Apple A8 SoC based platforms
+        items:
+          - enum:
+              - apple,j42d # Apple TV HD
+              - apple,j96  # iPad mini 4 (Wi-Fi)
+              - apple,j97  # iPad mini 4 (Cellular)
+              - apple,n56  # iPhone 6 Plus
+              - apple,n61  # iPhone 6
+              - apple,n102 # iPod touch 6
+          - const: apple,t7000
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.46.0

