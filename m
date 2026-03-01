Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743023148D0
	for <asahi@lists.linux.dev>; Sun,  1 Mar 2026 08:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772352385; cv=none; b=JQdKKZ4AprniPS3anJTbyONU0/cHl4C09i7JQjrfJZdq3SFlGFheL8jVfBQHaWeKZS2N1/T7PoCT45EJMdm5GqnyctSYEyfb9zUX7VhyYdL8y3bVUlQ/R/c8WO4SlC3EVtOCpZM7pg3FGSLo+lyVbf1ZFkq/Hn8GKin+h1d3TxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772352385; c=relaxed/simple;
	bh=lwN3AXla5E+hMpOvc4cTc/hS2rvMFZBUZ7ENOshqDaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BZaV4igaU1cyEvf31/qzLio1DeX3hy6oJQLq5B+NBbs538cSYAn5r/NVuegvTm5dqZoFxxY00qaHkbbBABYZQ8qPI0DDQ5yReHFyBV/KBss9+HNrxT5DhuOnDwF3QGPpzbdtbf+tnOcqA4/qSUrPsHjYdgZM+B04KhgUf4lYlLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QjMYmitq; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QjMYmitq"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35691a231a7so2101064a91.3
        for <asahi@lists.linux.dev>; Sun, 01 Mar 2026 00:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772352384; x=1772957184; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SejpEdn5w8C9URiM1Is7ely7u34ezEnpcYmkEzh4N/0=;
        b=QjMYmitqBuaCgQmtideiRl/6uYeNIOUtucNhwkklj+NPTuFtjukSSY9+CaxBWXuocY
         jjKxjiOOFdOcmVdW94z1b3n+CubJNMTaPHjGIiBwZJvbcSr/rbBGrxFRScJ5b7NWtipA
         GMnJp60z2CfQ9L7bMB8GSgApEZjdrIdRZdDnfSFuv1NB0S5q0prnOpNIqnkbmQR2HLrG
         sEdLlU4oj/zCHO6EN9N6C74mydpJA3ijfYo/ktt9VK4LBYYK5KQ9YO2IBtzvjBCCbpo6
         moU5gLzJT6HDM5GECdpleN1iJIyDx/REWCPbL0ADUdoqmAFX8sksQB7zK7Enp18KMrTz
         RwwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772352384; x=1772957184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SejpEdn5w8C9URiM1Is7ely7u34ezEnpcYmkEzh4N/0=;
        b=wcYAg6+WYxUo6UogZ8O8WudE9yqphAf6iJFJoCIjLpwMNC3g1abtxRwX1sAGFsP7jV
         6FztOuFqOMugPiHJXRuNfb7Ffq9mVy6JU8iWDB4LjD8P5qukaTqd0QEWj0zjcdgVpVbO
         DWXz1WnjFkJqknPLIuKjjsXpf4D3iDOnKbkO+QMb16qnbTvJbHuJLtrgVsBDPeD7cXiY
         ph8uYF79szbmxlUpX+FyypFpQOtUfvz3VHV+PXyle0V3X5LlYxeXA8JfCbvzLCeGmvjj
         mLnfqj7OPuOvfFHTanqThE2ZGXVRmx+7rW2lle2atBXGLMG6IX/6f6/eJCMFA5u3c26v
         4Z7g==
X-Forwarded-Encrypted: i=1; AJvYcCWOIjm9HmdpLeyTBqR1dwogLZ/6XI7U38loomBBCrE7+SIOpM2uSaUv7MTQ+A3pZFkcsCrDLQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+k8U6rSJPl+2lT6P4ySMOOqRl4ShE1h59d29PIvAYUh5+wF9s
	DiCUlHQTxyPuA6tIzVEb27/biFPnfhQ+1Lg3f3w2QfAUrvASb29f4x70
X-Gm-Gg: ATEYQzw/RjMhlZzNv6hm0/5802os89h1Wdrl2usAHmLDVJetzOuTSqoiMducQRLegmf
	Yy3vo9IzHFpdUdSI0OJHgGlThMEerbsO8/ZfsyeAVgsXBeFg56UWzYdbHluKQ97+Tu13LFuFd1U
	hyoSIL4bN4NcL+3ucMvYkl08G04L5GvaLzdmimcIO/IzCpBRVnLXnkT1//MR3LmxxTGuKK3aGYf
	zB4p8BEK8EMjtsJJJb6CZDaz80NO6ajHahO1iEbw2rkzDPxja0+Q1Zg+q4H4eKw05PcFBuh+Zm9
	m6IQvqYlrppyk6DLyrB8FnAOkZ6lcbrCPFmlvPpXWyzRJxji2/4ZkO8CLOhbzn4P390pIz3msAu
	gouofYWjKFygMO0cWCOwxsLa81NnsaYQeVHPRqVHmyGS0rDq3N63IztWd/B3CWFeCRvDGNIQeXn
	nANP7Ptj+bigAlioAHF49Pys0RQ4EaozWafbLXqadDSPwTDB2rOJAB7rGEGZFhtlmr5a9nBB7DG
	b32vo4iU9NokAWVDutc1cM1JrSWOJRgyPk4i8i04AZ5XGRDHQt46Pl4i5bjk3mgRZC1uAAAcRGI
X-Received: by 2002:a17:90b:5408:b0:341:134:a962 with SMTP id 98e67ed59e1d1-35965ccab15mr6135772a91.28.1772352383697;
        Sun, 01 Mar 2026 00:06:23 -0800 (PST)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359135ef1d7sm8885384a91.5.2026.03.01.00.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 00:06:23 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 01 Mar 2026 18:05:21 +1000
Subject: [PATCH v3 2/7] ASoC: dt-bindings: update tdm-slot.txt references
 to tdm-slot.yaml
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-tdm-idle-slots-v3-2-c6ac5351489a@gmail.com>
References: <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
In-Reply-To: <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2590;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=lwN3AXla5E+hMpOvc4cTc/hS2rvMFZBUZ7ENOshqDaA=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJmLP6cHMG3JNUtnOnhEU8P3mFxZpKZOq9r+mHi5Zf112
 n8W7lrVMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmOrtJQz/LDoPXY//4G2ZqVPwOXFFua35oXjbRTty8nIZnjV5Ltrkw/CbjWWO294
 VAcvlGK7uLd4ovun4uwWP3tfumPhD8feCpi8T2AE=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Ensure that all references to tdm-slot.txt have been updated to
tdm-slot.yaml, and are schema-compliant.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/imx-audio-card.yaml   |  9 +++------
 .../bindings/sound/simple-card.yaml      | 14 ++------------
 2 files changed, 5 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
index 3c75c8c78987..5424d4f16f52 100644
--- a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
+++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
@@ -24,6 +24,7 @@ patternProperties:
       cpu/codec dais.
 
     type: object
+    $ref: tdm-slot.yaml#
 
     properties:
       link-name:
@@ -38,13 +39,9 @@ patternProperties:
             - i2s
             - dsp_b
 
-      dai-tdm-slot-num:
-        description: see tdm-slot.txt.
-        $ref: /schemas/types.yaml#/definitions/uint32
+      dai-tdm-slot-num: true
 
-      dai-tdm-slot-width:
-        description: see tdm-slot.txt.
-        $ref: /schemas/types.yaml#/definitions/uint32
+      dai-tdm-slot-width: true
 
       playback-only:
         description: link is used only for playback
diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
index 533d0a1da56e..a14716b2732f 100644
--- a/Documentation/devicetree/bindings/sound/simple-card.yaml
+++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
@@ -27,14 +27,6 @@ definitions:
     description: dai-link uses bit clock inversion
     $ref: /schemas/types.yaml#/definitions/flag
 
-  dai-tdm-slot-num:
-    description: see tdm-slot.txt.
-    $ref: /schemas/types.yaml#/definitions/uint32
-
-  dai-tdm-slot-width:
-    description: see tdm-slot.txt.
-    $ref: /schemas/types.yaml#/definitions/uint32
-
   system-clock-frequency:
     description: |
       If a clock is specified and a multiplication factor is given with
@@ -115,6 +107,8 @@ definitions:
 
   dai:
     type: object
+    $ref: tdm-slot.yaml#
+
     properties:
       sound-dai:
         maxItems: 1
@@ -133,10 +127,6 @@ definitions:
       bitclock-master:
         $ref: /schemas/types.yaml#/definitions/flag
 
-      dai-tdm-slot-num:
-        $ref: "#/definitions/dai-tdm-slot-num"
-      dai-tdm-slot-width:
-        $ref: "#/definitions/dai-tdm-slot-width"
       clocks:
         maxItems: 1
       system-clock-frequency:

-- 
2.53.0

