Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2C4285CB3
	for <asahi@lists.linux.dev>; Fri,  3 Jul 2026 05:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058067; cv=none; b=UlqNaArwisQwpFfKqbcmI3nC2OWkhmzKmRMXdL4zk8bfjaDLZcIdoXKxm4a1hm/5gFIWxP46musLyF45I3j2nr55+LYl65WMBgPSUGbzL2Czqs0cqzPMxQrRZDs+S3jLce02yHJ7h7HREB6nc+v6ooWmDaiFsrBkgDcsD3Bf9Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058067; c=relaxed/simple;
	bh=aeZjPmGhDWlaPCT1RRDfgeSEVWLZ95Hfqxv0L4cptwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CL8v7jVu1Swb1jSdy2GuhhFR7OAqLS8GWd8DIHZG5n1Ee1pCfzfFZKahZqeK/6uZzQ+L79lqdHtcIlH2Q9wQ8ok8VzRNOIxYGfKxhcI+EIQxDdkMTtRZyR2wVmoTsYXrql+9pOysGFCeAEw2bLcvqYKEsB9uxt0gdMxKv7Qm+74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CDBvVIm4; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CDBvVIm4"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8478fe07f65so200321b3a.0
        for <asahi@lists.linux.dev>; Thu, 02 Jul 2026 22:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058065; x=1783662865; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wH3PeQGMbk7TOW2LRX9VqMPl97RF/TvWYaO8+1NfNuc=;
        b=CDBvVIm4a5yXYMkPgLhMWBGwoEsGRJwtJsYRBaa6du6POgZIUfj81S/vPVYZnWg4bM
         sMyG1kpzIPN5Z8HPaUtT3BclUHm1mkHhfNGQU4zhoAIu1SsqLxpe3nEEezRedz/f0tuJ
         lAPi1gIqqBEKaTGgH4bo531+L58YFGbzbHi5rKKx0oNdKGG8ca4iHEbszFL77TjYZmWQ
         fzS0CLTMICKdnufla6UcFB54S9zML8CU4YPnTf1Agzyhkz8iViK6knerWiUB8LF2x2cB
         FIssQNJ4pP55u1e+2/gd9AL6RM4cHCjmTbc8wFxqqhiBAJRAZLvYbVwQo4CElW4J8o3/
         gzbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058065; x=1783662865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wH3PeQGMbk7TOW2LRX9VqMPl97RF/TvWYaO8+1NfNuc=;
        b=BZGHPqqJkVQQ15G0N0SVfISMJbu1O98CgUwY448RY6c311u3fw+6q8eFFSWIvdWLev
         N+0CT/CA8t6BjiXbp87tmDyJiIFUudS011QFttzjz/lfMnFP3NGfE3WJEKUfSjcSCzMN
         WvfwCsaaKe3k3+fRhEFN3JlNSdt0ZnPruFptz4inJLMi0IxX34wP9Ef5jdh6Oi64emoX
         Y61zNLohsh5o8mZhYJNW+chbYEH2egYv8zIdLJ/Y21srf4vo4tGIfjPn6hQMX5NbDhHD
         jVB4Oh8tnW/GDHRu7/z+MCf9ttema2HKKfEd2WDxk2LF1IbSqXFkYm4MDEatFy0VV483
         k18Q==
X-Forwarded-Encrypted: i=1; AFNElJ8yC/hclZWA3YPBCPWrlDRimPveFhSWUBU41ba2JvQ5437oBPoiP8GyXKKQjFnKn9EKr1Nasw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxOPQH5TDWRSez6HTz7Z08Fu0Zk38y2EiRFXRVCZr6y1HFPw/Rg
	RWVpPo2hb50f7UWIyS0Y/Zgupm5gkW1cakd/VMyAsZVP4WcDCQPyPgps
X-Gm-Gg: AfdE7cnuC4B7nd3kDrKQyCFLYV5L8gUIQWuue5Oi3Vpe9iJvv1H6uTVv+hsG1QGQBLC
	c0UeIWXvXx+Ds3zdI8hT3sJe2Wi/i54Ci7RGtDVGvJ2GZ4kDSw9NP0EOR3kC+IMiFDFlnm5yvr/
	m2iCAhaHfDs8MFjzUjI5dL3nuINq2Lr9dS2QwrRK1vPyGtForTQnBB1PIfvg4RD2FcDhjDopNc6
	3PIlJhzOjXCJahfjrnpyoB2ciWaA+u3iDkuLqIHQCLX1BKgmGfDBWxsnrulJWx7C4PrKuS5Jna+
	QhCNuuxc+iseatye1QHBC12gniaUsPlx6X/P2uoiZDzJsQcERM51AvzXfAAxdeS0H5EpKUEFV40
	zHr2sricJulE9yCYM7vb5+CzUxU5vLEHMpNVE1AXEGHxenuOxEU6zBEJOj9gke4KbajAXit6HPV
	IT24ku9Y6UXcnQi1MnP2Ain/c7hdkvpNyGWU74v2reB0yvALU=
X-Received: by 2002:a05:6a00:992:b0:835:405a:7e72 with SMTP id d2e1a72fcca58-847c0690f7dmr9119828b3a.11.1783058064965;
        Thu, 02 Jul 2026 22:54:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:54:24 -0700 (PDT)
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
	u.kleine-koenig@baylibre.com,
	kuninori.morimoto.gx@renesas.com,
	christian.ehrhardt@codasip.com,
	Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Chris Morgan <macromorgan@hotmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Rosen Penev <rosenp@gmail.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Teguh Sobirin <teguh@sobir.in>,
	Val Packett <val@packett.cool>,
	Luca Weiss <luca.weiss@fairphone.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 01/24] ASoC: codecs: ab8500: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:32 +0700
Message-ID: <20260703055355.244898-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703055355.244898-1-phucduc.bui@gmail.com>
References: <20260703055355.244898-1-phucduc.bui@gmail.com>
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

