Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792839509;
	b=rwze1pD8sA3yiqsqUBlAeVPwPk9QzE+eKys+qKhWc1eBk/xpemZsV1Kfr4kEZr10Dv57
	 61h5ZLOtnhxPOcQRkD2vxssRkJgPfnNEpLN4qunP6SM/ZQ35ZDDtdD6mbSjqFTLBQO4LN
	 xWyCXHCaZgV28MdeT6uuonO110NLy84W1t1XazGBuJOrZUpq+kyB7Opv1WL+dDs/qKzH9
	 UjCC7eIVizhy+EtqtyhfbGvuZnTcwxDC5FBxMYSbwnGLynB8B6R/dF5HZnu8/hnocSTmD
	 nxsb1IyVqhwe4/adxqAxL5QhEl/FliD06iMVY43HaPpQYLAx/kwJZkP4VlNlNbgJgaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792839509;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=qeLr98hwx2Npmt/8cCki7syhUFRf60PkxR+oBPVC0E4=;
	b=YkUlooYiLGaHiqKd6w500+ABsikRsUvyNI8rmessFJrs2tvk0I6HAQgiTUX0CXL75qRb
	 HF2Yal2JkIsaGR9W332295v2pRkDSi81+3igyJW8D/ZSxghpGeQI9pLLXHWHAD4PLnbkH
	 FI1N7NA5BGowwYSpS8qaY2iTm2vfoEZ1KBxvvev9aH20HW3tKSGv98XdGur8WQNBaRPUM
	 opCziKI1c+4psiK0KXH3qb3j+HFpqkXCQcgftFnMkbWmvcTW5/i9DhEYxKfTgGFfakSeF
	 Rb2w60VzGIFHAlAn3K3k2aM2yTgVoKxOBBQdKTFuBzppkNo6cxrqVU6Oh+ctcCITeKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="SbRH/QVp";
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AEB606A31D
	for <asahi@lists.linux.dev>; Sat, 24 Oct 2026 10:58:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73AEB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SbRH/QVp
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-14fc585291cso614754c88.1
        for <asahi@lists.linux.dev>; Sat, 24 Oct 2026 03:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792839508; x=1793444308; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qeLr98hwx2Npmt/8cCki7syhUFRf60PkxR+oBPVC0E4=;
        b=SbRH/QVpSyMAR7uFaK33rZPxdBpOfL6s+mLzEtBqQ89Sg97X+wxkU2SVroSfjfUTZC
         9tpMPYbD0NVqPSxbPgzZhz0JR0OJQogGH7wo9KyloYJfLNedtPJLk/BTv8Rb1bcmsQ38
         Qseh7pU909plwok6P6BTVizooLd7UPE50VZeG+zQOpU90/n2l9Aveg5aWt6I9+EJYMSC
         0QNBWibRgYdVbzHtz1DOQOGQuCZ+0sK26jW1S4LAch9xZeEBY8yCo3B0EfvGyzKS6+aI
         RMXZlDqaYYTnpWyPpoocDRIvgiNOHlveZAa+PGvgq32I0XZIrUVcveoekqK+//XqnNjp
         5vqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792839508; x=1793444308;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qeLr98hwx2Npmt/8cCki7syhUFRf60PkxR+oBPVC0E4=;
        b=AvloSXNXX9Df3EPSphxpdW5ePhwKVtWf/FU2EioniCs3FSCmiVhf10mfBF0j5aWX1J
         TWpBmlwwYd2guPyOZihF2qcZyeFMljc8bsBsmqr+Kqgf88h+mtF5OkjNVikgWeo6i7x8
         3JglgpOOKjr3By9yPHl4tmz9J48gne65zakB2zxr06kZM2AwqYnRp6YKz+gdQv4sYGFf
         rPqoSPq7mimObepS/1F41pjzTvldrq4tmNJQVaze27oBE+nGP5FmN6f7CE6WJKcIVA1I
         AnMD1rDdEllFG6wT2z4xsIoziqdM4fwSvxdN8xcOsJPh+R6N8gsVMxrfPIZqHr6tHXh0
         /jzw==
X-Forwarded-Encrypted: i=1; AKwUvByfmOl8ogtbIZ6sxw/V8ciwLzZNxiSTp8MMmY87tmgUdQRbj94k/zfOZJ7TvYeXt8UJqgZ1GQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYLv+7vR6WmVDv2a8V67bRmmUCFBDLJx6cbwFJWbEMtrq054q+z1
	gf5gKabh5yRFGzGW+pQgsxrH1ms9Tz8MEqzG8D1qVmU0EIXBrUnJ0rTp
X-Gm-Gg: AYBFou3Qw5y473PzXLfD/mrYrMUgRR+vY3tYBKpGSO7ZIY03/tR9RXIcNKJdbU9lO2N
	ZhUoG3cseK8M221/KDemBzS6oQJSdtoo7UXpuu6yvbWR9L6lUWYGtvffktr0Hblu7Jdgqy7YLE9
	uROalrmw0DPOG71bTWeQmvSxEM7rjZGM0WWkrKGWWOlLnJMejZiXBge0jjgPUeDROiyS/vNExMv
	eXYHd5Tu8rLmfudbZg9cc7sIc+be5pgdOLi01uyaabsC/FDG0n9C9Yhnx6X2H02AjDWMAy/NMCY
	PWZNEl1sAQJiGQgST34k05iAj4PQLuPC46rk7a4StudRbAfPzp7M7ouxEIbIyEPfyCrtxGcV1oj
	5362E7cLC8nwJ6DG45SEKrzcT03F3ySLOW6tuNBnAO+e4oD0On/6OUqfpDB/w03+krFqoO48eNR
	IzmOHhRlkGsUhNISQVWr7jT4N97DN9v+Cq2Ga60jAVtpiKBjwFt6lc5AjVEg2IQnCAWP8tW+Q6M
	nb9iXHz2C1IYlEdvPveOEwUqbIQ1/ie8qY+41qy3YK97Mhegz9GsexK5I4fVN5ZU11tQiLnFdCW
	pLCG1+QLCvDaObBG+abcYxfmoyBzXUjCVFHBLNEZA15tArJOTK1BgibY8nUMVyH3JnfwUY8BtCN
	+Wd84MtXLMfJibnOC07wyZ1HOFNWg
X-Received: by 2002:a05:7022:2229:b0:149:1feb:6dae with SMTP id a92af1059eb24-19937abcc34mr3812247c88.39.1792839508391;
        Sat, 24 Oct 2026 03:58:28 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ea25sm5947281c88.5.2026.10.24.03.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 03:58:28 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 24 Oct 2026 20:58:15 +1000
Subject: [PATCH] ASoC: tas2770: Only treat negative return codes as errors
 set_tdm_idle
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
Message-Id: <20261024-tas2770-idle-fix-v1-1-07b02d46ec2e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQqDMBAAvyJ7NrAJxli/Ih6M3dYtxUpWRRD/3
 lWPMzCzg1BiEqizHRKtLPwbFWyeQT9045sMP5XBoSstusLMnbgQUPWXzIs3E9FiQf5hfahAsym
 R6mvZtDfLEj/Uz+cHjuMPgM70X3QAAAA=
X-Change-ID: 20261024-tas2770-idle-fix-b0104e591578
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2472;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=e/a/ezVcu2OnK+OjA/cnrkqCbVak9sPahUCnQku5REo=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFl3+gNU41WnyMX9Wz+5bEIs08Su98KnkjcpyJj8Sb1eW
 KTm3FbTMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmOr/nowMB/dGLKmZ6O6s//Hhfi2xCpU75Ws/sR05Fql4gv36+7N2dxj+Z6i2TBG
 Zc27Phzf7HomUPWbo5K3qmznL/WTrAb5HM8JOMAAA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

snd_soc_component_update_bits returns 1 on a successful update, and
we were returning from tas2770_set_dai_tdm_idle early on any nonzero
return code. Change this so that only negative return codes are
treated as errors.

Fixes: af176d0787d2 ("ASoC: tas2770: expose SDOUT bus keeper via set_tdm_idle")
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
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

