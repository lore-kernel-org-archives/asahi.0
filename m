Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149C52DCC01
	for <asahi@lists.linux.dev>; Tue,  9 Dec 2025 09:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765272717; cv=none; b=EXjECtlRqlc5CuHGLAMblEjlP9o4bnWrcCcMzzU+dH1hIwDRTSoVVlBY95+7Seer/OqmkzyuyKHI4D47AC71LNwMwnGhXzNVvILnAMgLUFTZkVq5usE918tGtP/5mfiG/adBf2n3aMj+6Em+cNXqOOe7iuvGOmOe2nLyXT7I7C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765272717; c=relaxed/simple;
	bh=7Jl02U1GOnxsVCRYbpxJ0xeuR6SSn1DPWvASGvNoLSk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AZy898hKq10kZK1XYfj+HA2T/B2/xL7iQT4KR0MYufKhgyJliIH8fKljGMsDvMiQQ/QYWH24ihDubWp7/LQWKZbI2YlwtOZORpinIL6npRRufssuIrQ8h+m8iAqmd486EsvJFBkfQ7hHjw88pkMSxRKSsiradfIhbi3jhPgmMO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VnENAGIE; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VnENAGIE"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3437ea05540so4329103a91.0
        for <asahi@lists.linux.dev>; Tue, 09 Dec 2025 01:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765272714; x=1765877514; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S6Kh/S4AuBYubzHpa9fGV98tRXc6USzdHeQlW2hl8J8=;
        b=VnENAGIE5wd/yGYwfxadkGYIy3iWGYbqO0rHKTW0gKw1kEBxjuyNbP27T3/3oJTgda
         3NuA1uQjPKNM2AluJSpK6A7YIDsK7SCknAM/soEyLhiPqDCv74XrnFIC8/AF2p2UVUsn
         rfRI1oiFA/ozhaLQC7Ig5TYRLdveaj0ORzlrVaUlT8ozVg94St+ugbIairBBV7eAQm7S
         iGDtzfPllczY00gVVnzCSkO/PNMRCU6c3BmkY3lSUg/j/HGf5NG/zJ26UGk0fIVq5dBH
         VmcQL8kTIr3xzXdmmnHSPNy66PRtU2YPxmUFicgwg5721gyIiOn+2sPlPeQXJ/9VFu2/
         f7xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765272714; x=1765877514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S6Kh/S4AuBYubzHpa9fGV98tRXc6USzdHeQlW2hl8J8=;
        b=CiyDZiCgfLEkJBY4njBmsddCvS14XhIYu6tOcNa43IaRywDO5jGzpoWXBfuHp9h/x9
         WgeLsuBvFe61XCJukHpq8NE2+Vn6wV0qk3vNfXgrG+JW3zZdzj6M48/xEA9+ee1nYgLo
         IOpiBIdNS1LMzu7jVk+RSvokVzEkQyGsVJcxQxg3x4D8PIQ0Jn4PKuq0pAv/gggvPI3b
         bxWd+qg8V4RrswYeIOaDzBA3vfST3Y5Xna9v1uWYWOyK0sgqSJ1aKYdXZpvUZ+fpJkDO
         gkd/ALCAbJ8XN7AmTS2pYbdDxk4KmwTI5zmMIjYnlWxqDI5j4l/s4OzhdWwpEpUGwySW
         4w2g==
X-Forwarded-Encrypted: i=1; AJvYcCWJyLBWWpScceV2cgULjHXSvfm5BoS9OaOldkbFPAz2OXsIeOQvqaNpOVFzxPhRVf0RXf5zyA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyeUWKozjyuXXHfemfMjlTC3WDm2aFjDfgx9lom3cvaOIfSyUaO
	Zb+tcKDnPYUCWoD4gbGLjw+2t1OHO7hw1Up9SCW0Tv+htQBz4OcAhuht
X-Gm-Gg: ASbGncvpRtwtnWaoxir0kA3ZKM/yx1AMOkavc5jHlWtZY+VryCfiYE8U3ZtJ0G+YwiU
	8RtPMfssrKxwDrqKizIDgVX8WztbyVA7TfKJq3VhxySwwu5fyNVtGkzKsGP5/FZrnnuOFLM8nFl
	6on+Sewug/iMHCagZqGNJOb4ZrTUqOaxyzOhIXsPFNdhcovMS+Gr+oU38MuprJHWnZz5US/Mjfb
	UmHL1RAGC71wNEiNtDvZTLKmDHUOC0Oe+rB4k8zKal3dWfD/HQamj2krUoSWTSvaKNXi7OfMNT8
	d8RzZ2kZfoZkBDzrEwd7J4K6hdHyerAP14j7DRZhsiQmtq1gIoG0+2H5y65bJRwcwuZQVIXddOm
	opksXjOFs0qQsNMA7n0wOSRWHaxjUjwkrC+sZDcoU9HBmW2PwwzGJv8GiZ4fPuCCMIM9b0+1Fuw
	b+EWsYmmJe7SgHT/JQUQBer41FGPPrMfNs6GYUy2RPrW+g2U5Yu6LwFdeJ2qngWkCnXDdOktT3i
	Z/DFhfNS7VBgDjcxkWWrAZUWiztXv0R3ZslJ1SveOu5J+/x2MOYk6KbcW/PDt/iosyF+TbRdTWR
	BIVxjgn7DYfYytskxlbCabbSpzm72uTtsxFak7cncd4BnICXQXY=
X-Google-Smtp-Source: AGHT+IHjkhG5ILuMnz9u+P9xFQUrtxtM7YAmHub3kulzNeg1dJ/92cTnLqbWYakB7BqZN9JLGA4WKQ==
X-Received: by 2002:a17:90b:38d0:b0:349:8116:a2e1 with SMTP id 98e67ed59e1d1-349a25fe29fmr9166033a91.20.1765272714091;
        Tue, 09 Dec 2025 01:31:54 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a49658704sm1800408a91.6.2025.12.09.01.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 01:31:53 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 09 Dec 2025 19:31:16 +1000
Subject: [PATCH 3/7] ASoC: dt-bindings: add TDM slot idle mode properties
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-tdm-idle-slots-v1-3-38dabf6bc01e@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1930;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=7Jl02U1GOnxsVCRYbpxJ0xeuR6SSn1DPWvASGvNoLSk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnmb7ITGfs3K75KfJAWs1t16sON9i82Vgrez5qqKhy6M
 OTWwe/8HRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNQx1jFi4OIUgKleu46RoXeHgN9hvsPSjVOkY//fejuX6+yjePlisc/6klmqz57MVmZk6D/3No9
 j5pItzfNllOe8PL6pPuGw7t/mXsHPnMdlOsztmAE=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add properties to describe TDM slot idle behaviour.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/tdm-slot.yaml         | 32 +++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/tdm-slot.yaml b/Documentation/devicetree/bindings/sound/tdm-slot.yaml
index b67844e1dfd5..b247b315d7f4 100644
--- a/Documentation/devicetree/bindings/sound/tdm-slot.yaml
+++ b/Documentation/devicetree/bindings/sound/tdm-slot.yaml
@@ -11,6 +11,16 @@ maintainers:
 
 select: false
 
+$defs:
+  dai-tdm-idle-mode:
+    $ref: /schemas/types.yaml#/definitions/string
+    enum:
+      - none
+      - off
+      - zero
+      - pulldown
+      - hiz
+
 definitions:
   dai-tdm-slot-num:
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -32,3 +42,25 @@ definitions:
   dai-tdm-slot-rx-mask:
     $ref: /schemas/types.yaml#/definitions/uint32-array
     description: Receive direction slot mask. Optional. Identical to TX mask.
+
+  dai-tdm-slot-tx-idle-mode:
+    $ref: "#/$defs/dai-tdm-idle-mode"
+    description: Transmit direction idle slot mode. Optional. For hardware
+      that can configure its behaviour during idle TDM slots via
+      .set_tdm_idle(). "None" represents UB/unspecified behaviour and is the
+      same as not setting this property.
+
+  dai-tdm-slot-rx-idle-mode:
+    $ref: "#/$defs/dai-tdm-idle-mode"
+    description: Receive direction idle slot mode. Optional. Identical to TX
+      idle slot mode.
+
+  dai-tdm-slot-tx-idle-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Transmit direction idle slot mask. Optional. 1 represents
+      an idle slot.
+
+  dai-tdm-slot-rx-idle-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Receive direction idle slot mask. Optional. Identical to
+      TX mask.

-- 
2.52.0

