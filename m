Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E10D27FB1E
	for <asahi@lists.linux.dev>; Sun, 21 Dec 2025 09:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766309804; cv=none; b=TibGI8E5KzrrPxGAHd08mYewxIfJiq4nXDj13sO5sgGbPPeifV6Ie847kQ8puCapYGG9hXqUD/BzvfFyofvmAxVTxc5nHuYCaHZwcpVixvHXdStuWN0FIRw3SOJoTgNinCF9sYUwD5X3yX4FgTK1XVQIPeb4q56mV7Lc12on760=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766309804; c=relaxed/simple;
	bh=J/JGbSI46p8HTL2RHYE+qUnCr5BQESuhvOilzbTTq48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=he82RYzHgnOKAYn/zNIkGcCVfgPcxddMNbHlyVkcQYDv4ZzmQR8jzoN+2c0Qn7mWbf0muyCT0GlOdTyL4IIHZ6WHCfqmph1X83n2Pshc0tFsarn2y4oX6mG7u/OdgL5lzr0ULZKYU0rHijWPU+1a/ofNydnDIKvPjeFUsdXzKJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Khc0NpDB; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Khc0NpDB"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a0fe77d141so33257795ad.1
        for <asahi@lists.linux.dev>; Sun, 21 Dec 2025 01:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766309802; x=1766914602; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FeZmpsDdG1RUrBzKUX3sBiMLnau+8z4mBhxLnyXrfgM=;
        b=Khc0NpDBGjy/v6bz+6nBWkIE+MzDOkiZpq4CnpAf9NGboSIolC4rCYSLm74rXBuKUJ
         HzCFKEHVbb8pmX7rs5u5b4HphFWgrQWxzjoce+zErCQcmM+0ydPZPtLWe7OoSt2UvZx/
         hGuAut/3dVr//0lLKG3Kaec9tbkst9J9tBZGjiojo7rSxywfYYfqDxKZxpXmuyvusBU9
         zFHRc2BYKEgh35ejt6e4gghlXgGZxVgORJ+wVegc0V1QyWLuDvPGaG0+8w2M1a0Xh7WZ
         VsAbApdqkPufGcUVUVSgsb/J46EXf/g+dvYj7CWv2eayZIBdV3bYW1bwoD/S+teK21h2
         0guQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766309802; x=1766914602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FeZmpsDdG1RUrBzKUX3sBiMLnau+8z4mBhxLnyXrfgM=;
        b=mf1f7irzrPsFgVn0LOOvieInqOv6vVYdkUgFepIqYVPg/wbJy98+ndtiAuBRblxma2
         twiW/WjElS/gK0KrN2bbYtKVxkq5J//hqGqreiA1nVgKfXfhdMaotB5q4uiNtpUsb1X5
         oMQqCUaRaQ4LNcvRvhF9VdnlKb3VK6BM+w/dMQH7HhnWQC6r8aqJj3sq9qZcZXl8S0oR
         BNstZ3GBCO3Cdtpf9g94XMaPNC2r4HdXG/aj1xfrvHIAa4LOWIQQ8yhCEzP1dRuRBLCm
         nEWcEQalUgsiKYioaByF8gjGTL/+0zkoG8gWrY0wlwoCXJyb7GgMYtOBcWNouVsugk5W
         dOkw==
X-Forwarded-Encrypted: i=1; AJvYcCXcB26QLCVDUxzhJHxhcB2KFsK7cpHJQZVsOPunSOIyvubnGxclAAqXVEod82St7BFpd0ZVkQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyldgRVGaR5IMS4e4lj8LL7mfehj2p7yLQhD4EItv0GXwS577KB
	alFwmIryB+5NqZEvrkLqgrZ8w8GrRZhw1VDOE4T7SAlxJY5U2UrF9pAP
X-Gm-Gg: AY/fxX4BWZacQO/zdoRkFSXzIeHeePX4JerSoT7enG1Cb10CbiX0wuwkuxx6X3VUAmo
	ryS1GFcMy5ryy5HIs1wcfujERO9LlWjywXUjs8ByymtYlOctV3srsJ0v2PVH37jHUT8nu0LftCF
	MOPEF7cCme7lcfSOw3l01M0l/7UVOBcafjzr/i18qQrLfecy75qfRFzntYRJEBnmsqxwReCuHYs
	ROg5lMhW9BXJ2gS+TKNOwILiY5ilYEruMXTRt4tg/O9r7FzS4PiSCMh3kq97Ts3uy/B73HTsP6a
	kNwNTkIpBIoW6xgi7TfXGIB+MunIjsvy+aRJQhQM6lKxogqxI7XvoXW43WQndaKNQFGSlD2iTyC
	kVDNrjuhY6qTugbDvQfTZOIES9sYL2OkCa1+ne8FIAA6/weqAqtSYRknpp1fV+cViyYd8bpijlF
	NeSw54ieZ5QKd2hcdTZUJ6tSIiD5bRVNreu9I6gOG5eKtGvyHFOdUmWcB5qxO/kylfuFTqPHAIh
	xxwn7uWaSHI/6V9WB4MKvi3JXixKr6zryzLd93x8htJoo+UdKQh/jzGAG9vT7j/URyqns9Ii9IJ
	7wXUn3jtQ9yvXbkppavkHDC9LFtCNhDaU6svmt6rwjBdEtv+CrNGXFVjZKeczA==
X-Google-Smtp-Source: AGHT+IGmGZRoabrxlFiBda/1xG97X0TAK54HY5FazNa28CSCbtrIjPg0PALs67RO4ic8ZL4omZOAvQ==
X-Received: by 2002:a17:903:4b0c:b0:2a2:dc1f:78d8 with SMTP id d9443c01a7336-2a2f293d04cmr67609985ad.42.1766309802436;
        Sun, 21 Dec 2025 01:36:42 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4d363sm67629495ad.62.2025.12.21.01.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 01:36:42 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 21 Dec 2025 19:35:58 +1000
Subject: [PATCH v2 2/7] ASoC: dt-bindings: update tdm-slot.txt references
 to tdm-slot.yaml
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251221-tdm-idle-slots-v2-2-ed4d96413aec@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2794;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=J/JGbSI46p8HTL2RHYE+qUnCr5BQESuhvOilzbTTq48=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnu+yfNENmnr37sueAd3tzaNTZ3sqsW8Jh0uRewa79W3
 JQxpSG0YyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 hjrGOkYMXJwCMNWvexj+6XktOBa64faCSAYXoROlpwQKz4VnvXmq/fORfa2E2mnVGoZ/2jEv/Bt
 3CZ3bYaGv51FbZajFc+0Y/6Ez7lb3yl9FvvvOAgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Ensure that all references to tdm-slot.txt have been updated to
tdm-slot.yaml, and are schema-compliant.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/imx-audio-card.yaml   | 14 ++++++--------
 .../bindings/sound/simple-card.yaml      | 14 ++------------
 2 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
index 3c75c8c78987..eb702f48d694 100644
--- a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
+++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
@@ -31,6 +31,12 @@ patternProperties:
         $ref: /schemas/types.yaml#/definitions/string
         maxItems: 1
 
+      dai-tdm-slot-num:
+        $ref: tdm-slot.yaml#/$defs/dai-tdm-slot-num
+
+      dai-tdm-slot-width:
+        $ref: tdm-slot.yaml#/$defs/dai-tdm-slot-width
+
       format:
         description: audio format.
         items:
@@ -38,14 +44,6 @@ patternProperties:
             - i2s
             - dsp_b
 
-      dai-tdm-slot-num:
-        description: see tdm-slot.txt.
-        $ref: /schemas/types.yaml#/definitions/uint32
-
-      dai-tdm-slot-width:
-        description: see tdm-slot.txt.
-        $ref: /schemas/types.yaml#/definitions/uint32
-
       playback-only:
         description: link is used only for playback
         $ref: /schemas/types.yaml#/definitions/flag
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
2.52.0

