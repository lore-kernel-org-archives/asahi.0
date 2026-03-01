Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD40B32E138
	for <asahi@lists.linux.dev>; Sun,  1 Mar 2026 08:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772352393; cv=none; b=mq69lztyCsutfl7qyhF0+UYkH+RwfriCy0n0pSg97figxuEBNM+MUv1yn6YzZkD5Pe74Zf4zt3mBpUB2U8cg0u+BcnzxkhY5rKiQ0pbdJ183atcCZw7hS6yvHdE0GyA2GHn+ppEyDyp4g3owmlwmvNR6RJd9N/pPK1C1AczwQoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772352393; c=relaxed/simple;
	bh=115g/WH2mtui7fHuZcwchXsAefVgpriJAftdKhU/VY4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pnM3vzrjWKv+Cc6YPzSb68ljOelRo0Zym6KxT+S6MAlMo7PHtBlHDxDxrrmi2geuy6vShUaWMv5ls+4GRFPJXE6key7rkK94m1h554jvp40sAo0ZfRVvYKSaXN7xaCdwrRVhg8ED4y46mmrHQN5lBpdKgDbilOAx939JpXPV1NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kfdJbame; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kfdJbame"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c70f5d6a6a4so2052370a12.1
        for <asahi@lists.linux.dev>; Sun, 01 Mar 2026 00:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772352392; x=1772957192; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fGlR6YzXE5keZeD5R4R4wdzj80ZRJofyKqhSLLbK2aA=;
        b=kfdJbameUfqfOjMPhygU9OusuYpuBtB5WKcOIWLeeBmD88cOEUAXvbcVgoPyvsC8mm
         0XIkpPsqZxs3eu5lwxo3ZEYekP0NdRhGX6WAYYwcNRzEf+fDNrSHAJrXNBQxGzw+YyYF
         wyHmigjw5H92E2jgBZg8YhrqliRGSCkf8qz6LvaV4npkiuTiRfsHF54+4ERqxDk63XWE
         XcmD61UlhljF3IbTBBgn/dKSPeEvsL+NUj/yYH2vBv7jYrOHsUCbQlvhw3r9XADFpU3A
         5f9niHi/gixnvcNtvqBQtY2IbxlKHlm4L6PX0E0x8aGUBOda9qum4lX7/CV24npPc0Q2
         8Ueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772352392; x=1772957192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fGlR6YzXE5keZeD5R4R4wdzj80ZRJofyKqhSLLbK2aA=;
        b=PhZgEsk6qfdIJ1w8V/Rgs7lvLHdXwVauQ+YxhlWGzw/3AgfWj/z/Q5hI9BgHX9OcG7
         cIXGowFmoNbqd3Gk/RTzvO2LDINn49W6gWbDgD203j543HW/io9nSRHc92ywGz9+aTyE
         4OpiTUVAPVoW3VjFmy7P9HBwOm146T31WmlDy01ir3TK9vX8yvuGvw30xHIA1zDXRhA4
         JTt69J5O8nRPtv3osrjzMoGnpYDGCdikm30jbdbW6/zhJSEwCv09xzKQn9+pzF/xpedY
         pXgRHXFqTLatGY+/BvxtLHL7/v0UJeP4rE5lqNOYBI9OzIQUNENBzrbDlX7KXHi585ff
         91og==
X-Forwarded-Encrypted: i=1; AJvYcCUbGyLZZGbAo+zW72RE558PKQvk5Yo8+FhMucaL65K43eKKOlELNGNSR0VoqGbI9W2YZMn0lg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6MP0MWxktlCi9yigKhHLUdWienQbk135yy0acTtJYjSn021ap
	qgm1f5IqHQ4nuAWdBhAKrrBqORSgIY2U1njzg3wlqg/t6IVyeUBVnCpi
X-Gm-Gg: ATEYQzzWjiMte00eEx4myhYlHQERwW6k/6jBxxWdylhCxWehGFfMxRHPKKPeQ1JoD89
	qm7CW5vxdGs1LNHEfrd3yT1ZwTIsZe1hSuOIV4PsEbYPCP4N7ifnW5u1yDzz4SjBQo/Z1Ti2icH
	8+GCMObWiMum7UmhBZDZ7cI5CF7WlgRuudFg/Y+fo6A2oPXwBT0gUltJKsMvTDMbUYeeALmqK2K
	yldBwtGB5csroTBda7Fx+hmKlQBEvBPNQ58lVDrqfrQadcNAZivwg8TNvS/r+cyDpeqS7iJ5srC
	d2QTbpYDQKFGwZj56q1cimdspuBzRIuM3nJvBynSqemz5KZuhd/nxrYxh1ZdUotArRkmsSxoPPX
	xsbzhffogVv7CH7NXTYA28UuUS+veIdno/GfAunt7fBt9DLgMuU38Rk+PzKRhuR/zHwEplLx03R
	6xcM2JQKHTPQmHeSSizCvrA8nOHvscL5QbK5S3GEAjRiYfMGRr8VnPGJp/rms5rp4UE1CAXvU2v
	I4R/bkFgy6BJzUiCGP2zGzTqSk1U/FDUbLt0TBPfXiIyUm7UqDxLjgEkLkNeqL2tysIx4t0AMLJ
X-Received: by 2002:a17:90b:578e:b0:34c:2db6:578f with SMTP id 98e67ed59e1d1-35965cccb83mr6714723a91.19.1772352392000;
        Sun, 01 Mar 2026 00:06:32 -0800 (PST)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359135ef1d7sm8885384a91.5.2026.03.01.00.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 00:06:31 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 01 Mar 2026 18:05:22 +1000
Subject: [PATCH v3 3/7] ASoC: dt-bindings: add TDM slot idle mode
 properties
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-tdm-idle-slots-v3-3-c6ac5351489a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2001;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=115g/WH2mtui7fHuZcwchXsAefVgpriJAftdKhU/VY4=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJmLP6fH1CYvWfDi6+VdS/ptHsxy/zZ9/q/rWu7bdB9du
 c1wrz6BrWMiC4MYF4OlmCLLhiYhj9lGbDf7RSr3wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6xjpGDFycAjDV96cxMvRPZA5hNnB6kNker/euf6nWnZJG5XMz9l95IXBFaqHH4QUM/13ivlz
 XP+vO+XRlp0D1vO8fDn37U1wXWD5Z6kr+pOTQSCYA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add properties to describe TDM slot idle behaviour. These properties can
be used to describe how a DAI is supposed to behave when not active.

For example, Apple Silicon laptops split a single I2S bus between two
physical lines which are combined at an OR gate in front of the
receiving port. One codec on each line is expected to transmit zeroes
during the active TDM slots of the opposite line, or we will have corrupted
data at the receiver.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/tdm-slot.yaml         | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/tdm-slot.yaml b/Documentation/devicetree/bindings/sound/tdm-slot.yaml
index ca71e3660f62..457a899e8872 100644
--- a/Documentation/devicetree/bindings/sound/tdm-slot.yaml
+++ b/Documentation/devicetree/bindings/sound/tdm-slot.yaml
@@ -20,6 +20,20 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: Width, in bits, of each slot
 
+  dai-tdm-idle-mode:
+    $ref: /schemas/types.yaml#/definitions/string
+    enum:
+      - none
+      - off
+      - zero
+      - pulldown
+      - hiz
+      - pullup
+      - drivehigh
+    description: Drive mode for inactive/idle TDM slots. For hardware that
+      implements .set_tdm_idle(). Optional. "None" represents undefined
+      behaviour and is the same as not setting this property.
+
 patternProperties:
   '^dai-tdm-slot-[rt]x-mask$':
     $ref: /schemas/types.yaml#/definitions/uint32-array
@@ -30,4 +44,9 @@ patternProperties:
       a mask. The first element of the array is slot 0 (LSB). Any nonzero
       value will be treated as 1.
 
+  '^dai-tdm-slot-[rt]x-idle-mask$':
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Idle slot mask. Optional. A bit being set to 1 indicates
+      that the corresponding TDM slot is inactive/idle.
+
 additionalProperties: true

-- 
2.53.0

