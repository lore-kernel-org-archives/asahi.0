Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EEF2D7DEE
	for <asahi@lists.linux.dev>; Tue,  9 Dec 2025 09:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765272709; cv=none; b=rAdMvt+RCX/FJCkhW8ensG0LQFfbDDW2h58OCYHNy5xXQcAjsipOlVA3vRtsOcyhfEX9Qn2mKVDb1nAN5Uaq/vOviqVbju01dKAEH/GDC4LXt8EnTrjXP7YMz1ombkkz3aF2g9bDIOMsPvJOgzE4MW3UKVgU2BIX969UVOToKSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765272709; c=relaxed/simple;
	bh=T8nQRaJTMEOE7oGRiZt2UVDQ6WuLodWd+RVxZirYEM4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yr8z0Rq8bOt8l+QoYCbN8Lo8VEwL9PaSSyOjyepGYKjIjCcf5Wbmr7ABsyfTyuO8yKXOdRYg8ESuOosXVY+hbk6WibHoThs+8gaotyNw1EssdOp8JAOXOPu2omFgpls/EgXeOjGRhmggRwsREtuZxV+gw+fqxlnJk/YjtO4LaHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YoIZZrbZ; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YoIZZrbZ"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-34372216275so5470711a91.2
        for <asahi@lists.linux.dev>; Tue, 09 Dec 2025 01:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765272706; x=1765877506; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=loXzTpy4uaY53uDDt2VMesUwjrO1zUQ0ph7MJ5jGnW0=;
        b=YoIZZrbZluf6EoHpbaUdWQ5DhcIhrk0ybrWyHwnkzZ86K4edprzhCvCu23oAmaw7fg
         OpUn8R673ohCKPhoMfKkzjxDBe0NbktQYKUTr25pTspQr1FH3E8RGnJ5ST23QqR7+oS0
         YDVjjcBuHgz3u3CJ6maeao41BZ4Nb5/D5vvN1PZNVJsK9sHO+Xh+cjjzQEGJdp13EYPy
         h75Hli3p7IwywWLOD6L03kjnTx8LTDqAvH8dg2vGOm+EHoGu9SUfZkI59UuO/fD6tZu2
         //vTQFwerp7YrE9X4HjAf1PDY9QGYKqGs/mB1PBbSk9Jc6y+0CrroT8gRKayPO/b2Hx5
         63JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765272706; x=1765877506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=loXzTpy4uaY53uDDt2VMesUwjrO1zUQ0ph7MJ5jGnW0=;
        b=OfTWPhKRefMZ7HLMs3iSbRXBa4bTzd0rvLcRCSVJzEnkV0/oi5FkHBSyjnvCsHLuH9
         9gVgvdrl9lnYlzTquxK4RXVMS8Kx/6TtNCmMUKEtL6Kp9sd3GnimQ60fxq/HROcnKX95
         FB00bEhRGQGITOOG0aL4xvc8sw65klf7HLADFpbGpl3nUDjtWO6nnlY9DrE5QBs4B0r5
         p283w1WeDEeX0aNH9uPLrQroDZGLfbHpmIrIswAxbTODUZWGHrC6knyzkMkoyIwIXCaP
         NHbVB2Qsp9sO2qhNjxMhuSNSMyfepNMVLRwbymqLU1FmZZV9U6kIQa3lJ+Wp6C6cLXbS
         Ji/g==
X-Forwarded-Encrypted: i=1; AJvYcCUgyozmPBxSdCDCMqIHj/pmmj5w5aCQAfbH8EZTQ3zhDJYLdsweb1bZofBo523WUI7OUkye2A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyt1x294qC1dQqsbX8GC1XRG8cg4wk+ACiix66HedM6uv+DRHz8
	UdQAbOrBlwPEJvdBRLghLMsgPUBZlx/3Obkn06QTkVG/CiqT5rhIZGcS
X-Gm-Gg: ASbGncuaGfpWA1erwTAdr/ieElcs3du4dG5jzueVw8yubNviXXMQe+R6v//BrLdaDZk
	XCYSrXYUy6Gykf4NQu/qo2V7Q6WB0NNcB/4XM/aBJwxuNVVrxVUS6s14vFLV0TwQfLxfOKGAABB
	+OVjs9NEN6Gyn82wqCG5EmOB69sazSw4fFPSlSlMHdifPe9Y0bOzr12Nc1DkHFJpFGd4olrIIOX
	Z7pMgRI8T7D1YVs2rQQ1uLhxlvTKvB3iiUx124omSKMhBaVdYI78LlSF8ffSw1v6HQM/rDAyysx
	icCPbvQTP6+fpVpMtDJfUBfRrtKX5753E8mTGwm66l4Y6HjvxaLzz4smPox0gMKGGsC2FRs8ihw
	vNMlSWOlc8pvJp0Pp18Sfs7zp7K5JMAWf4TwD0twSTfhbEnPzhFjXLqDh8XD/RVK/EMasgX53JV
	VjldveNePjMg5GDXNdacYxmP3SgkkZGPdjROTtybf/bUO6YvyuRiW7ULUfhYopMTGMqU1lE8IWq
	pSG22YVkjAkBCppi8v36oX2W7YZ8aXeoeaC9mhOwe/JF5EsOpbFUTi6Xs7f51/ClxbkhKjOczks
	ZgyM4UCbei0ians2KRaMG/XkGIcBGunfbRaCd0UZfAKl2nk1qHQ=
X-Google-Smtp-Source: AGHT+IG5TjEW4C4GY4b2FxVYjWX8+gLJQmB4u4hl40+y/p7T7camtMTaOvWcdzyFLSuameifxgFCOA==
X-Received: by 2002:a17:90b:388b:b0:349:30b4:6367 with SMTP id 98e67ed59e1d1-349a25e5544mr9400724a91.30.1765272706467;
        Tue, 09 Dec 2025 01:31:46 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a49658704sm1800408a91.6.2025.12.09.01.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 01:31:46 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 09 Dec 2025 19:31:15 +1000
Subject: [PATCH 2/7] ASoC: dt-bindings: update tdm-slot.txt references to
 tdm-slot.yaml
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-tdm-idle-slots-v1-2-38dabf6bc01e@gmail.com>
References: <20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com>
In-Reply-To: <20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1929;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=T8nQRaJTMEOE7oGRiZt2UVDQ6WuLodWd+RVxZirYEM4=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnmb7KkF/kxcld/Mi+rkN61eYvaC++1gp6Kd3f2PDkmc
 6ji2/yEjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWyISAMDELAw8OUm5pUa6RjpmWob6hka
 6hjrGDFwcQrAVG+9xPA/+vQ6/Zbm4286L67/xNKmU71vGRvHo9mqE/+6CX5UYWVawvDPuH3N2nN
 P3PacjbolrHEocOXlE+EuDzMXHzh9YKHFp9kz2AE=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Ensure that all references to tdm-slot.txt have been updated to
tdm-slot.yaml.

Achieved by running "sed -i 's/tdm-slot.txt/tdm-slot.yaml/g' *"
against the bindings/sound. No other references to the file
were found in the tree.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/imx-audio-card.yaml   | 4 ++--
 .../bindings/sound/simple-card.yaml      | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
index 3c75c8c78987..1df29a556120 100644
--- a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
+++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
@@ -39,11 +39,11 @@ patternProperties:
             - dsp_b
 
       dai-tdm-slot-num:
-        description: see tdm-slot.txt.
+        description: see tdm-slot.yaml.
         $ref: /schemas/types.yaml#/definitions/uint32
 
       dai-tdm-slot-width:
-        description: see tdm-slot.txt.
+        description: see tdm-slot.yaml.
         $ref: /schemas/types.yaml#/definitions/uint32
 
       playback-only:
diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
index 533d0a1da56e..2e1a5b3216c5 100644
--- a/Documentation/devicetree/bindings/sound/simple-card.yaml
+++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
@@ -28,11 +28,11 @@ definitions:
     $ref: /schemas/types.yaml#/definitions/flag
 
   dai-tdm-slot-num:
-    description: see tdm-slot.txt.
+    description: see tdm-slot.yaml.
     $ref: /schemas/types.yaml#/definitions/uint32
 
   dai-tdm-slot-width:
-    description: see tdm-slot.txt.
+    description: see tdm-slot.yaml.
     $ref: /schemas/types.yaml#/definitions/uint32
 
   system-clock-frequency:

-- 
2.52.0

