Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792898565;
	b=vpimo+Uffa9Eto4RXpM/CcFkqR+pc2vrI1sb0K+HDw9x8cA3iNNxp5MVJ/eN+Z7a6WAg
	 Q1XZTgdkDssoXjBtK9gJ/0EZa2zYhXXNExOIg1kYa8NSlMvntwUDaHmFnMI+C0Yy38lZ+
	 b/C0iGAgo3pL1a7DPhlpHzTXoAUNh25aIxf44lJXU5//Ect79/ypXvxTg2uMfQPdVstos
	 PATHoaqiE9kfPS0UUGOLEyu0Fq8hYdtuD0Btyn3dhD4XWjeFkRJuFhVKGmeZEdbPilzr3
	 g6rFC/XWWZ3p4xMZqsq6KENdcGbG1x/ApkO5yz5DTxQf6pGKRc1L55JW4zJmPOpXIUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792898565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=AGASU0krO4dcW1R4gKRMwQopKJJbDchm1ha/pJWZAsA=;
	b=i5jOnXo8GCKhu/TUDF5GWrpDUhIjmAEFnmPLBHRchy1fc8eRCN5dFPRoiVsmutGHbfMC
	 a5BN8esunrcctuOQ0Uev75JgiClcShqhGU2OPNtQJEBtOZTuMVyGIt4AsI/Hc8NefjKPr
	 XfO5n4h5H3o/A3jWwvXu01jZbkrDVlit66s6hdCCy3MVmsbX1fR3HmO+mBihwV20ngip4
	 vz/zdplV56B94TveUwRaqP/EbleVuKJ+S+GrE9wC35BHhZEEP2gn9LoQkg2nvI9t4LkgL
	 bY74dBB4xyetGG60dL6WGdeVddBHexbKQl4J4zeAog88AEi+gKHdscJehGXOQaKnGXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="E//Jrbrv";
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6E6606A31A
	for <asahi@lists.linux.dev>; Sun, 25 Oct 2026 03:22:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F6E6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E//Jrbrv
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so3300938eec.0
        for <asahi@lists.linux.dev>; Sat, 24 Oct 2026 20:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792898564; x=1793503364; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AGASU0krO4dcW1R4gKRMwQopKJJbDchm1ha/pJWZAsA=;
        b=E//JrbrvH6+KIdaEZj0A95yBsiPoaJalgvTSQN6zgHz7mopSLzTBjo4uAbObHRo023
         BFKtvDQbMjSTqPR8+qtMONw4UYOvu8hh8iqRKpMNPyekMG4nF4rTfB9EuFt6qU4jvVM1
         OAzTkHf9omfZGjvUDVoP9z8y7pCd4erVPzxJbT1EL231EgtgtxqquUnEjuJU7hDZnoNL
         c4ldaR7DkD4I6HMqVEh0PRqkxFGzXNYJ47ThKuMNHwe8Le1W3EjCaNXXPzp26hVC+NY5
         TZzGWTtEIGK0d/cCPTAzYiAFUrIWM3LHC9NIatlgRvVAe70WwOJVg9/+oDRW0aac1KuW
         95aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792898564; x=1793503364;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AGASU0krO4dcW1R4gKRMwQopKJJbDchm1ha/pJWZAsA=;
        b=x2Qb8lUA9YQf2VolWfkUxG86GCYXWH5hgXhrcXvAXBKiTDFz+GuRQU9ibbZAjl7uHp
         xzoyr+6wK6xXgG5ti6LG3DMhrBIBQLlVQXXKQDu4wRSOb9IFZg1hnSyugbUWPexr/sF4
         Jd19+kMVRTPBJOQX58zcbLZHYOGruK/17aVEV/tZl5OaHUZ4+mzxZo/QwBaeFI6fixPq
         tOUQJXhnXv/TYXPECxNRbtKNWubJQulHY619KUZos15QpccKYWuLH47vZsKJS5VBFV/w
         dSFZ/HEBqDCJ0nkugPA1ZI+Tl71UdHd8DME4NLJpfcWpKcXJh+HN+2rxMQ2Y48M3x3xe
         pi3w==
X-Forwarded-Encrypted: i=1; AKwUvByZeVi9WN46AqEIY7coy2f43NxA9NpP/5zynKluEOg319nhX13erahlyuCaTb/V4P39IEq8tg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJPUl2+jDuh3Mz8E30o7nJAY07hSWuphQOFRH1PrgqBnXWKxd30
	LaTJeJzRhRYVnpZ2m6cOtbllPABVFP/r8ow8sat83G7B75oxzKGg0bJy04/lYQ==
X-Gm-Gg: AYBFou1QBti0L/HbPkve1K+TGxSHmcWOfuJ5e90t2BKNwlYsz84JsqpvWIw1UbeXu1t
	okevEFdZ2b1fowzZK1xq12tKtUC+iYlbCWG4rv1rbmlJt4d2IdI0tdljdQuxSytkKJ/yMqxtjH2
	+mj8sk3RNrgeMVGxD+D3ofWir9qfH66/nCvWgcx8djVYsZHhwoZwNaLLbXCvZ3ItGCacGL0D4B7
	54ZmfN78GxbY8TnGy2adSB3m4dCNETPHeFGsp+y/SNPAmvEqO6mOmoOcItYNTJnASj4uH8vTvhf
	R06WpYTHosaZkCFby4Tb60I/kCMFgy50N5kJLnJT6YJuzcKEFoe5M9FjmnkKZhfNOCUd7eTr/9v
	kU7jhAX/RPNCAb9sVM+PajvGPZmd8kYDo5pQgPd9RlR5o8erNS50lTNlAtUuFUcFoLBqeVRKipT
	tY66bj+5xVMC+eWcoM0+wv623C1qvsInXlz33QDP/6W04l0wlZRQ+mIvm51m6Qcc99inCwGm7rl
	FUFyBuGjq7uEEYb9PpNkdplGDihcSw09WWSXlu3zGnL952puZ5puBFwB0LNuFxDj+AfRAuFFa29
	VxkmqQTfHNjkKBn8h6m2QMPQ1fGP52o6Jf2/Hr2MPqkPmPylszb3XxS3IWAHLYS6dgClpR3e3d8
	LQP0k1rHJkVaJvd25J0QyZExI7pqE
X-Received: by 2002:a05:7301:2293:b0:353:5908:36fc with SMTP id 5a478bee46e88-369e8483d0dmr5753055eec.17.1792898563532;
        Sat, 24 Oct 2026 20:22:43 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d93663sm13602486eec.13.2026.10.24.20.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:22:43 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 25 Oct 2026 13:22:18 +1000
Subject: [PATCH v2] ASoC: tas2770: Fix error detection in
 tas2770_set_dai_tdm_idle
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261025-tas2770-idle-fix-v2-1-6c8096a87f44@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NzQ6CMBCEX4Xs2ZrtBqh68j0Mh1JWWMOPaZFoC
 O9ui3eP32TmmxUCe+EAl2wFz4sEmcYIdMjAdXZsWUkTGQip1Ei5mm0gYzDGPau7vFWNGnMuzro
 wJ4izp+cY78pb9ePwqh/s5uRJjU7CPPnP/rno1PujX7TSCk2N1OQlO+JrO1jpj24aoNq27QsrL
 QzewgAAAA==
X-Change-ID: 20261024-tas2770-idle-fix-b0104e591578
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, stable@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3066;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=+JeNkcg7xxI+ILpKkc9D2dhooDxOFAaRNmDxxxAetxE=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFl3S/9PC2C6sMlpjWb5kqiQAxK+y/QFU7w49D/mz5PUL
 bx6ZuWljoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFSvk2b4Z/jZrKwqzDrcjN225MTJ+ibNTeFn9/eeXh3wr6hbZO7qnwz/XZ/mrv/
 ctLmwZ3Zd2rrmFSv+F9fMWTR5deCbaa9X1Isf5AQA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

snd_soc_component_update_bits returns 1 on a successful update, and
we were returning from tas2770_set_dai_tdm_idle early on any nonzero
return code. Change this so that only negative return codes are
treated as errors.

Fixes: af176d0787d2 ("ASoC: tas2770: expose SDOUT bus keeper via set_tdm_idle")
Cc: stable@vger.kernel.org
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
Changes in v2:
- Make commit header more concise
- CC stable
- Link to v1: https://patch.msgid.link/20261024-tas2770-idle-fix-v1-1-07b02d46ec2e@gmail.com

To: Shenghao Ding <shenghao-ding@ti.com>
To: Kevin Lu <kevin-lu@ti.com>
To: Baojun Xu <baojun.xu@ti.com>
To: Sen Wang <sen@ti.com>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 sound/soc/codecs/tas2770.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 882e19857697..6b9ec8f630fe 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -513,7 +513,7 @@ static int tas2770_set_dai_tdm_idle(struct snd_soc_dai *dai,
 		ret = snd_soc_component_update_bits(component, TAS2770_DIN_PD,
 						    TAS2770_DIN_PD_SDOUT,
 						    TAS2770_DIN_PD_SDOUT);
-		if (ret)
+		if (ret < 0)
 			return ret;
 
 		break;
@@ -521,12 +521,12 @@ static int tas2770_set_dai_tdm_idle(struct snd_soc_dai *dai,
 		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
 						    TAS2770_TDM_CFG_REG4_TX_KEEPER,
 						    TAS2770_TDM_CFG_REG4_TX_KEEPER);
-		if (ret)
+		if (ret < 0)
 			return ret;
 
 		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
 						    TAS2770_TDM_CFG_REG4_TX_FILL, 0);
-		if (ret)
+		if (ret < 0)
 			return ret;
 
 		break;
@@ -534,25 +534,25 @@ static int tas2770_set_dai_tdm_idle(struct snd_soc_dai *dai,
 		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
 						    TAS2770_TDM_CFG_REG4_TX_KEEPER,
 						    TAS2770_TDM_CFG_REG4_TX_KEEPER);
-		if (ret)
+		if (ret < 0)
 			return ret;
 
 		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
 						    TAS2770_TDM_CFG_REG4_TX_FILL,
 						    TAS2770_TDM_CFG_REG4_TX_FILL);
-		if (ret)
+		if (ret < 0)
 			return ret;
 
 		break;
 	case SND_SOC_DAI_TDM_IDLE_OFF:
 		ret = snd_soc_component_update_bits(component, TAS2770_DIN_PD,
 						    TAS2770_DIN_PD_SDOUT, 0);
-		if (ret)
+		if (ret < 0)
 			return ret;
 
 		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
 						    TAS2770_TDM_CFG_REG4_TX_KEEPER, 0);
-		if (ret)
+		if (ret < 0)
 			return ret;
 
 		break;

---
base-commit: cc3fc99f1bce93c3ae3771ef98cb91a566da857e
change-id: 20261024-tas2770-idle-fix-b0104e591578

Best regards,
--  
James Calligeros <jcalligeros99@gmail.com>

