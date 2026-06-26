Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBC479CD
	for <asahi@lists.linux.dev>; Fri, 26 Jun 2026 06:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454437; cv=none; b=Nv7RJ6Ti15/LSCAx08S+ouMffz1gkApoQHQVrS/9yoPXDmZry76Cg13q09juMGSln19kpg5v8WwEVmoRAyRBKA8K9QuG8OXZGGfUUt44ZcmxWhESyi86n9CMAEHYD6fhQNJ+IKS7ACSO0gNZFSQx0T+5Qvm+Wioo/cSAJzDQL+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454437; c=relaxed/simple;
	bh=aeZjPmGhDWlaPCT1RRDfgeSEVWLZ95Hfqxv0L4cptwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EuChbiEN169A71J4Ec0mgZXSqXN9tp1WsIF1D/bCukOLHW6j1QblnQN/pkqtMvJkwhxrHqioI6QuyWPA1LkEXfDxKEu7EFLZfugS3N9/nWrdgCutj8I6208WkqvJdZJx7AW63ybZG6kNORj0420w/Rj5wDG1DaAwv+2KRgToSiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VsDAzJH/; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VsDAzJH/"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-37cbcf49deaso332734a91.1
        for <asahi@lists.linux.dev>; Thu, 25 Jun 2026 23:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454434; x=1783059234; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wH3PeQGMbk7TOW2LRX9VqMPl97RF/TvWYaO8+1NfNuc=;
        b=VsDAzJH//6TlRd5W2dQcqb5OjhG38NI1y2/4W05ui9tluAXQ4mahmHYoQe19zj+e8Q
         ndGCGrmt2m588dv2Xo24A33OP89mfHU+xxJKzmWfyb4sET4Vz/i3MGUkliEZtCBAYsCU
         9cxwyuQ/cbJKeit85/vuZQhE1gbq6oyE+3f5ItTlV58t4gQTsyMxtztnpiWyXW6JoaQB
         tGfO6dWfnY4TxGonN1t2T5+vcULIX2GgaEQeTLglRstprM0yFBXIUKLisMqtqUwlHBTh
         GoLmF5lwwELTtE+gt95J4IIL8swk3WL+Lscl85oTjJdmsc1gGHo8hKDRiAvytqonbcl5
         GLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454434; x=1783059234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wH3PeQGMbk7TOW2LRX9VqMPl97RF/TvWYaO8+1NfNuc=;
        b=OOjC9Y8Z0dPCzkRvOtceWp5tgkRRBdQT+LsVaNXCW/hGqCoN89DjJqqNsSA2j5RDWD
         t/3SKuscd43wfbTXgOsiROKF8e74hoK1yYjGlAnhZzZPXM+CeuftCH8IfRynjmCGBOu0
         g358vySaWPPkg7TWqAKs5Y42Bjbrh91zi9+Tj3lFIuEa7BQAjs4JofRjyNmEfxgyE332
         RZuHsr0TYTrhV8c3SU7TBSpxLLg888RE+QFkct9xPBDE62NMTksZbvf+yFa4+1hdeEKl
         OMbh/2BOGCdPDBXi3nhaSoPYEEJIYaXNX5mYreTs5J5yFEQ70MnweK2+qvSoLxXsvGOJ
         4IrA==
X-Forwarded-Encrypted: i=1; AHgh+RqUXvqOTzJ0nkTwhxWyJcTzlVDBB+Z/oQ6pbFeTYJuex5w1MBrNXNuScy0XFRjVFcdY1PrUbw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyIjSgush9UCVaGETBNQKyOHE83Wsk5+ObmrenxLzmNiydGwH1m
	Ca1wk2VuhFVJGtduSUYo2Ok2XzvjyOJ0nj1P7wqSWwFa9ugOWwQbuqq2
X-Gm-Gg: AfdE7cnRtxHLgoY4zyJO2HAsaGgLpDNMlCDgmge/SgAr25W8pTE4c5Dc2mPfCpHnVcU
	59hzCKPEzVuVtjl0ufSq169185hCrFmUz2xkpe1ZrYV1BPEIpykEKpvJ6oaQyqLTmKvpXOmt5lb
	NlqIzNPM4diNAKKN6kyXLp+wMGn2YgdtNzag00BArGJX3rMAiW8txVhrJo35w8+UWNOO2EIHxoS
	cGQSLqz+/XRR+umhKbyIehSuBqsOgVhN1KJnFSiwC08fPp4OQiD0NT2BWBdjxgPGjmyz8YxonxA
	ncPHTEh8EmXL2w4tKGMHgFZHWgMRgTjhb5EV0hhLDxwnd+wlNMIr82LNyFJ3c2vtJ3HAyXvnB+Z
	BDXmy94n2GFSJm7/wGDL7eOLdbQZLA2Bw88qLknKvO34kxfD8M7+xOIk873EXVNVa1fkGOViVue
	zRU64ZJPSyq0chp7y0jeHGqNVSMarHNcDGFUOJqna4T6lw5sM=
X-Received: by 2002:a17:90b:2707:b0:37d:f5e2:dff4 with SMTP id 98e67ed59e1d1-37dfa1ded31mr5302285a91.11.1782454434182;
        Thu, 25 Jun 2026 23:13:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:13:53 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 01/24] ASoC: codecs: ab8500: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:06 +0700
Message-ID: <20260626061329.23264-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626061329.23264-1-phucduc.bui@gmail.com>
References: <20260626061329.23264-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/ab8500-codec.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/ab8500-codec.c b/sound/soc/codecs/ab8500-codec.c
index 6e8ef9cd1b31..2cf96cbdd294 100644
--- a/sound/soc/codecs/ab8500-codec.c
+++ b/sound/soc/codecs/ab8500-codec.c
@@ -14,6 +14,7 @@
  *         for ST-Ericsson.
  */
 
+#include <linux/cleanup.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/device.h>
@@ -989,9 +990,8 @@ static int sid_status_control_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct ab8500_codec_drvdata *drvdata = dev_get_drvdata(component->dev);
 
-	mutex_lock(&drvdata->ctrl_lock);
+	guard(mutex)(&drvdata->ctrl_lock);
 	ucontrol->value.enumerated.item[0] = drvdata->sid_status;
-	mutex_unlock(&drvdata->ctrl_lock);
 
 	return 0;
 }
@@ -1014,7 +1014,7 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 		return -EIO;
 	}
 
-	mutex_lock(&drvdata->ctrl_lock);
+	guard(mutex)(&drvdata->ctrl_lock);
 
 	sidconf = snd_soc_component_read(component, AB8500_SIDFIRCONF);
 	if (((sidconf & BIT(AB8500_SIDFIRCONF_FIRSIDBUSY)) != 0)) {
@@ -1025,7 +1025,8 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 		} else {
 			status = -EBUSY;
 		}
-		goto out;
+		dev_dbg(component->dev, "%s: Exit\n", __func__);
+		return status;
 	}
 
 	snd_soc_component_write(component, AB8500_SIDFIRADR, 0);
@@ -1043,9 +1044,6 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 
 	drvdata->sid_status = SID_FIR_CONFIGURED;
 
-out:
-	mutex_unlock(&drvdata->ctrl_lock);
-
 	dev_dbg(component->dev, "%s: Exit\n", __func__);
 
 	return status;
-- 
2.43.0

