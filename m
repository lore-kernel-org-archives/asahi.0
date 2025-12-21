Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE5F27FB2D
	for <asahi@lists.linux.dev>; Sun, 21 Dec 2025 09:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766309797; cv=none; b=R2up54TsIlaL74a/mjKQErL/7L/L2EYKwstiDmbK6OXhppwzCsV8PpOZ7j8dgr1wkFPP0fCoIfgH3zlNkS6ZQJw2UkF6LiwRCdwuOzy4i3fAe0/6l1W+tIip+20OafXYw1l/YatTmIIZBcjB7eDKv+Der7a7Id8+zHBt7EQidIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766309797; c=relaxed/simple;
	bh=wLNKDK1Ksa8IvBF9PuBpNgl2cqbJ5Zaav5WKCmNUHgQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VxDtWADPwTsPny/HhGSFl1qYAex32V1L87V8aXSzqQFcRKbqpjDwuJNkr4ZMPfjNi8yDDvYqW1l+KFzzzKu8i3ibFgVNNZByxDH4G9oRJVBADRmLaNczRl1B6tjFkQWu4EFfBDP544P7hTB10EIjU4b0Q3umR7k7Dh4nzwpo3yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FUd/WgnU; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FUd/WgnU"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a081c163b0so28938965ad.0
        for <asahi@lists.linux.dev>; Sun, 21 Dec 2025 01:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766309795; x=1766914595; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iFOikY9o36gvsPAMhtc9DtXREspO4Xxm21xH4vlh1IU=;
        b=FUd/WgnUiIisjoC/KSVTMh4eYGwn2zUckezV9HbkWyQUvwRX06MaODx4KC6AGsakwe
         861VhtbfpiZXo2Jrxy68LMLRJXJ8C71gaHofCnunIgC1iG4kvzsQ/0J9xzdtZ2ybp+Zz
         XEGU6W4TD/g5MOhiWI2m0Mixr6XaLfJJ6K1aLMBMyolZFCiOpyMD1W4Zli65EWcJx0Og
         lwYRjE2ZlBt5I/tLpCe7Up48xu8YFqXBVV/wye2aVKygpllglCKdYCxu+Gs6MfgLUNAy
         y3NrTbvi8GGuygLYIUwJRCMbFX1JQAQdSPcMX+SSnr6WqJbtMNhrNToFDZssT1fBclav
         NU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766309795; x=1766914595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iFOikY9o36gvsPAMhtc9DtXREspO4Xxm21xH4vlh1IU=;
        b=gUG9f6cEXmL6aoZl67anlbf0g+iU5MEpSAQHyMon0/OjmAIUu6fIaGPj+LGq9xhvOJ
         7fxJLMahjFTqygdqQgmFC0xMa79dpvtS62EGkoBHfWon+Mc0mX27D8aSIQ7JEiZSSP68
         zT/pSrBqdBqE6Uzn+x9Yr3tsLU3IZDVnvDeqY0lXw0V57sGzPEPLmC7i0O62P6vOuJJY
         KtTcfaYdoWKiUAiVfp87eLMgOVeeK1Hqp2NQJ1I8XjNqRzy7mAhCzPo2ukzZ0UMYlSLU
         aojagyy8601AzMY6E4qxvhJJsHoyKjaGjovfbHvORHBnmruhR7oV0VKkGEqH3XcHx1Or
         SQ7g==
X-Forwarded-Encrypted: i=1; AJvYcCV3Ur2uI3Xs3yR6cpjmBH4mHXBXbh7YQBTQYGc7UMBWtlCLXf11GHq2fSmXCt2Oxx/e6wUnZw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwUZUrpfXZH1o7gnwSPyzLfGYNF50x4YUID8oezNvpxmzLvj1hc
	42NP73rKwXlULt3vkHsszUtFYubmSaCqpt8+408Iqc/EQHkRfFQzLrok
X-Gm-Gg: AY/fxX6ehKVs6Bigm0z3Jp6FOmf8PhQloCLd6WocKkw9FbHtos58dlY5VNW5p2jXJX+
	N/33il08YOz7h6tHa8NCw/0fbvr2e3qTo/Ijp/yDLJcW9fQYR+KkTajebNl7hA6pGQ4Kzu3eZao
	z8OaEqmpfNXMSJSnqU9GjiQURaR+tFueOwZgOajRebOSFIHO5FbJe8p76fwKmUTZ3SqYX3qxi4U
	U8BycHmnUEnMm5MmzL6DSF01JkzKNz3tWkwcA4nXGq35CxE3I3Qotd1tp39bA31icIvwKDsO9V6
	LQXTJgaN3KMhSeYnARx+whrK7J9tLwat6UlhM98egkxGLOaI5a65+s3YJXeqJtD4nAWefbJ4u+t
	01doasdAvJb6b3+5i/Vp87nhEZ8GvAQoLAGJCJ0QRxRzOJK9sU9PCRzDmT12/ZE49YtjQ3IHWM8
	PMLdQ5CV7ueK0BM2d78uDWM0/rDiTeqwgWpDAULbvw0ikoe4gGc1jIL3RHCRuxiJ/53nTZdRPJC
	s+6sgkhKDW+MuFKaAVO50aLOzUEap/ka/H5b34SNDIytsIJOCuilSi6Ap2aq907p/1TQkJnWu7o
	d3U8T5ufGOoFv+dOwcA6Z8Qzm/O8UbD17de8dyxnt4JswkL9lyo=
X-Google-Smtp-Source: AGHT+IFs8ZLMfIE3d3XHgVfBBRp9N/Xz/7Q3Yciu4Zx1KzdlptYhBCkrmMcDSDnGkifXqXR+tynCEQ==
X-Received: by 2002:a17:902:d2c4:b0:2a0:d662:7285 with SMTP id d9443c01a7336-2a2f1f789ffmr84830365ad.0.1766309794882;
        Sun, 21 Dec 2025 01:36:34 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4d363sm67629495ad.62.2025.12.21.01.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 01:36:34 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 21 Dec 2025 19:35:57 +1000
Subject: [PATCH v2 1/7] ASoC: dt-bindings: convert tdm-slot to YAML
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251221-tdm-idle-slots-v2-1-ed4d96413aec@gmail.com>
References: <20251221-tdm-idle-slots-v2-0-ed4d96413aec@gmail.com>
In-Reply-To: <20251221-tdm-idle-slots-v2-0-ed4d96413aec@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3628;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=wLNKDK1Ksa8IvBF9PuBpNgl2cqbJ5Zaav5WKCmNUHgQ=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnu+ycZpng++NQindbr/C9KSs30ZOAJX/aXPs5dTfV8S
 bnH2e91TGRhEONisBRTZNnQJOQx24jtZr9I5V6YOaxMIEOkRRoYgICFgS83Ma/USMdIz1TbUM/Q
 UMdYx4iBi1MApjqiieEn4xTv9YWv4p0dmxtFL/Bt7eC45cV1atOedhmG6OuVur9jGBlO7/aRtj8
 5tYbbamVp7TlGR8O5y6pl6xu5+yY5LPznK8MHAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

This schema was still in plaintext form. Convert to YAML format.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/tdm-slot.txt          | 29 ---------------
 .../bindings/sound/tdm-slot.yaml         | 49 +++++++++++++++++++++++++
 2 files changed, 49 insertions(+), 29 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/tdm-slot.txt b/Documentation/devicetree/bindings/sound/tdm-slot.txt
deleted file mode 100644
index 4bb513ae62fc..000000000000
--- a/Documentation/devicetree/bindings/sound/tdm-slot.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-TDM slot:
-
-This specifies audio DAI's TDM slot.
-
-TDM slot properties:
-dai-tdm-slot-num : Number of slots in use.
-dai-tdm-slot-width : Width in bits for each slot.
-dai-tdm-slot-tx-mask : Transmit direction slot mask, optional
-dai-tdm-slot-rx-mask : Receive direction slot mask, optional
-
-For instance:
-	dai-tdm-slot-num = <2>;
-	dai-tdm-slot-width = <8>;
-	dai-tdm-slot-tx-mask = <0 1>;
-	dai-tdm-slot-rx-mask = <1 0>;
-
-And for each specified driver, there could be one .of_xlate_tdm_slot_mask()
-to specify an explicit mapping of the channels and the slots. If it's absent
-the default snd_soc_of_xlate_tdm_slot_mask() will be used to generating the
-tx and rx masks.
-
-For snd_soc_of_xlate_tdm_slot_mask(), the tx and rx masks will use a 1 bit
-for an active slot as default, and the default active bits are at the LSB of
-the masks.
-
-The explicit masks are given as array of integers, where the first
-number presents bit-0 (LSB), second presents bit-1, etc. Any non zero
-number is considered 1 and 0 is 0. snd_soc_of_xlate_tdm_slot_mask()
-does not do anything, if either mask is set non zero value.
diff --git a/Documentation/devicetree/bindings/sound/tdm-slot.yaml b/Documentation/devicetree/bindings/sound/tdm-slot.yaml
new file mode 100644
index 000000000000..5bc46048d689
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/tdm-slot.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/tdm-slot.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Time Division Multiplexing (TDM) Slot Parameters
+
+maintainers:
+  - Liam Girdwood <lgirdwood@gmail.com>
+
+select: false
+
+$defs:
+  dai-tdm-slot-num:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Number of slots in use
+
+  dai-tdm-slot-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Width, in bits, of each slot
+
+  dai-tdm-slot-tx-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: Transmit direction slot mask. Optional. Drivers may specify an
+      .xlate_tdm_slot_mask() to generate a slot mask dynamically. If neither
+      this property nor a driver-specific function are specified, the default
+      snd_soc_xlate_tdm_slot_mask() function will be used to generate a mask.
+      The first element of the array is slot 0 (LSB). Any nonzero value will be
+      treated as 1.
+
+  dai-tdm-slot-rx-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: Receive direction slot mask. Optional. Identical to TX mask.
+
+properties:
+  dai-tdm-slot-num:
+    $ref: "#/$defs/dai-tdm-slot-num"
+
+  dai-tdm-slot-width:
+    $ref: "#/$defs/dai-tdm-slot-width"
+
+  dai-tdm-slot-tx-mask:
+    $ref: "#/$defs/dai-tdm-slot-tx-mask"
+
+  dai-tdm-slot-rx-mask:
+    $ref: "#/$defs/dai-tdm-slot-rx-mask"
+
+additionalProperties: true

-- 
2.52.0

