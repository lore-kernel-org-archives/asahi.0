Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48872071E0
	for <asahi@lists.linux.dev>; Wed, 16 Oct 2024 10:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729075333; cv=none; b=TnxNE7dOPcGc+PfAXN7STWbrGuaSaiGnQF2T62oGgthMAO2EbHqy6P2b8ebc/9daQf4JQIRWh9n+aBmrMA4TJHRS1mO0PM8WwAXlTRYDRlMoyWFCLgjZStP0O/RK/z+Ln+2A0LABCtfaTP5HtJ9q7mztHE9wvw34ILxvz82IFs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729075333; c=relaxed/simple;
	bh=WfdQdE555lvYkoLc9BccgWDGN9ZdZ5pdAw6H/bDgewI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=udRnt5QFsecE3EGjxzss8TQPjFUSyc+lQMe8iQrcNseP0hDeiABRk2NeS+sKaqnMue4nxSMkRh24n/jyz/WfCsdMCyOKbvTLg9TjSAMTTkHTBqzXScPQvhkIKa9WvRlNV6atWjt30QK9d0EgBL/d6mU9eS9O3wlTQ44kGEFVvAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TzenFC5E; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TzenFC5E"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20ca388d242so35676235ad.2
        for <asahi@lists.linux.dev>; Wed, 16 Oct 2024 03:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729075331; x=1729680131; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k508/q7r9Xmap/s2FAN/xIftwMTAgTxS8yX0bzw466Y=;
        b=TzenFC5ET8uGdF0HYr5G5lonloUms7JlUxFlj1TvNaQ8So2CyECQqvGPGOcSkKkz5/
         tw88uwL2xZMCjJgSpCJBYrhNKFQ4fLdWIlqIr9R3l7Vtq/2Zku12zfG3Qu/+xcSWhK6R
         cSbtYSbZQoMIOMDEMdyQrUOCST8IGupJPM8SlnpqWSve3QLwJFi5pHWmrzHrqgu4w4lE
         yMEe9df1zTlbDJL/rxnEBgJ1m7MobMIJH2oOCqHfEy9tMBgl73wWM4gpxdj8Z810s0zH
         BZ5ffBSmaaVRt4JPBXC83wAcaSoXVAEOwiVqLBR10WSGV0GuCVY/ixL8zwP4O/Iyql0V
         KXpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729075331; x=1729680131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k508/q7r9Xmap/s2FAN/xIftwMTAgTxS8yX0bzw466Y=;
        b=AsheVY0X8fp8G9PiFVAIkxo8v6qIXQa4ks3E+GWFspkGeO/uMNipNXG2gkLPt+aIBF
         JF2xAu99UO+r9C4G09ydof+2Rlac4Nr9aOADw44lt/mW5L9xgvD7XB/Lxtwj4320FUvY
         CpV4L+mPyNrs//BYOm7WcBBMUINdUm2yQ6aHNO1fAYkm2tI5Z5r8nyIE5HVOy+EyMK+G
         Zp1ggCdDthUDLfXM0u9h8pdZdzqeqDEK+sveEPAW4e8kid6n9NfSHis+2Ujb3NRxploR
         mVsGrj1l8ajFWIt+Q1JWp5i7EUthSVxW+2V0pEcxE6yFRI6vGd89io/7q/gL1Pqqa73g
         nZ8A==
X-Gm-Message-State: AOJu0Yz1GVgde217d5F/7iJB9SAdX5IZft8pkxUGZy3rCcn6Se/b2m19
	bj2Bj84Q7kL/CTMsfsQqpV/hMWtieVhHGxtEk6k9oaO12rU2tMug
X-Google-Smtp-Source: AGHT+IHV1QjAhkHaZMC2MlpFEwK/9q0QOJH8CZm7u6scVRC0Jr1r79GdYyTvOMpomjciV5quEKWJ8Q==
X-Received: by 2002:a17:902:ecc9:b0:20b:b75d:e8c1 with SMTP id d9443c01a7336-20cbb17d002mr261501975ad.4.1729075330947;
        Wed, 16 Oct 2024 03:42:10 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d1804b2e4sm26319645ad.182.2024.10.16.03.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 03:42:10 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 16 Oct 2024 20:41:00 +1000
Subject: [PATCH 1/3] dt-bindings: sound: Add CS42L84 codec
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241016-cs42l84-v1-1-8d7e9d437d2d@gmail.com>
References: <20241016-cs42l84-v1-0-8d7e9d437d2d@gmail.com>
In-Reply-To: <20241016-cs42l84-v1-0-8d7e9d437d2d@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3030;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=JkQ/4zpAYjuUTa+FzkoroKSF3ka6mM4DeIsa/iLWu70=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOn8M8rYe28kbym9PnNJ8d6eE3yp2b+up0nbrTaa4brDM
 7pqRrVcRykLgxgXg6yYIsuGJiGP2UZsN/tFKvfCzGFlAhnCwMUpABOJqWb4X2mpPpkp32a2R9oi
 udSVZmXhd37Jla8qkP/BG3ZyzhEZbkaGZ3cjknYfmH3ZPkz8x4NTV2JLj09+LnHnMl83z6dwy2c
 lbAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

CS42L84 is a headphone jack codec made by Cirrus Logic and seen in Apple
computer models starting with 2021 Macbook Pros. It is not a publicly
documented part. To a degree the part is similar to the public CS42L42.
(The L84 superseded L83 seen in earlier Apple models, and the L83 was
pretty much the same as L42.)

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml | 60 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                                                 |  1 +
 2 files changed, 61 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..12bc6dbeeddfaccf9dd00deb2676deac25f28c9e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cirrus Logic CS42L84 audio CODEC
+
+maintainers:
+  - povik+lin@cutebit.org
+
+description:
+  The CS42L84 is a headphone jack codec made by Cirrus Logic and embedded
+  in personal computers sold by Apple. It was first seen in 2021 Macbook Pro
+  models.
+
+  It has stereo DAC for playback, mono ADC for capture, and is somewhat
+  similar to CS42L42 but with a different regmap.
+
+properties:
+  compatible:
+    enum:
+      - cirrus,cs42l84
+
+  reg:
+    description:
+      I2C address of the device
+    maxItems: 1
+
+  reset-gpios:
+    description:
+      Reset pin, asserted to reset the device, deasserted to bring
+      the device online
+    maxItems: 1
+
+  interrupts:
+    description:
+      Interrupt for the IRQ output line of the device
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      jack_codec: codec@4b {
+          compatible = "cirrus,cs42l84";
+          reg = <0x4b>;
+          reset-gpios = <&pinctrl_nub 4 GPIO_ACTIVE_LOW>;
+          interrupts-extended = <&pinctrl_ap 180 IRQ_TYPE_LEVEL_LOW>;
+          #sound-dai-cells = <0>;
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index c1a2c296446c0724a0c6e70c845e5e5e1e693fd5..f5f85714dc4e8ca9c60b3f6963b2cec1ea33fdd0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2132,6 +2132,7 @@ L:	asahi@lists.linux.dev
 L:	linux-sound@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/sound/adi,ssm3515.yaml
+F:	Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
 F:	Documentation/devicetree/bindings/sound/apple,*
 F:	sound/soc/apple/*
 F:	sound/soc/codecs/cs42l83-i2c.c

-- 
2.47.0

