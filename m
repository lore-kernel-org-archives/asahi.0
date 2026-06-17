Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82DC3FE357
	for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 10:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692429; cv=none; b=CJVHZePQspStoLy1qgi7P+ZK9gmqB7Lqo+jN4tCa9ueGM0oFf5RCB7vvSgkRNfUKqO1kvpQnuOqFCRHYnDYNIbJDJz9W3PNOtgxaSH3no8RGphj34bSOp0FmEK9TDvYsNXAGMFXkR1CJnP/TG5japfS8Ckrcbk7wXS/1JqrzBMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692429; c=relaxed/simple;
	bh=p7I8p1HqI0DOJoeO7F0emrTBqowdFspnMU9wBZaq0/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DqpTWVWQfOsbDlKAmwgl81PBVaGzWziJofMbPWFgzQGw/m+aOfA0MgSyJSq6UONKej88zPlQt/RXRDD8SIrA/syr84qWzxLrjLAQtZGceJmQF7MNhvYijE51sXttxCzy+XDqbvb8wYa1w8ueZnHJWhEqEHW9eREcCKdDMMmB1Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dbuhN4h3; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dbuhN4h3"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-30bc871ecdfso1193175eec.1
        for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 03:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692427; x=1782297227; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PS4w4WHNmkcPtY5yr5niis0PAYXe1Ae3qWORsuW86iM=;
        b=dbuhN4h3MjMn6wD5RiuFXkmADniN7haamEN9QnRQ1ELfy/w56Nk9Ag3tJvw3qu6geo
         atqrHZXvWq841AG/Ze+AfaoZTOT2wGdK6sqsTe6J7TwomOAS5tMjLlt4yc4u0LkYCwGd
         iTT35tBraDIzLiA5ifzY7teR6IbFxXXnWfUGnx4qNBxw/r9kUpry/npDrzdd4eooBQO6
         psD/GJmbFNUb2sFfQou2I8MnlHSNVQK6pO/uIYq2jYEOXIDrI+1jZ7XbyVIge82RjRll
         IfVXN2SkLlHY3WZV/1QCRyYEDWgI3MLFToqfsziXKzUuEJPqEyAkvuEs1ReaUsljAzaE
         tvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692427; x=1782297227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PS4w4WHNmkcPtY5yr5niis0PAYXe1Ae3qWORsuW86iM=;
        b=iMUs664HDZxYo2prt/kLwx/NMu6sGp5HbSH5WiXklWxlwi81K9A3tLu8DyLVPdGX9q
         g0T9P/2r9jM9L/v29KOb+rw20b36JcnYs6WRtIzVubh5BYHLrdOQYVTr4pu5HwA0DBTE
         FHMoYQZUlTBkxAzTdFpApoLgNbPtOVU6PxU1yDOgqxJVnB8TfWftWYHmcLA1InIvYo9P
         R39g6+p/4TdaCGIjz0Ae0/gI5aB4lHil4b2faN01dskoxa64sM9sYMNnxCyNf3J2RZHQ
         7kK8Iy9xWLSlEoeKQN9j1hVk46AOMsj/iUDLWiUJgQyiTaecj6TBmPxRoseqYWZJKiUo
         p6fg==
X-Forwarded-Encrypted: i=1; AFNElJ8bE82cdsDJlymA4lD4XveqI6TqvsrkY0DV1ghYlWV2as/z1Tk39sTEsLY2C2Bw0Ijma5u4Sg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzqCq/RNl7pDDcuWIPLWl/myVIjp1z2MiqhsE+H4hkkVg0f7mzc
	pTmjcXlPhvTfI+fWkWLMJRvwzUooRt9ShQPZgWAkFFy953NLu12d4vk8
X-Gm-Gg: AfdE7ckyZNzW0X2BW+8hXkIoCfvd66aSYIwIzncSBVg08kDEmTbNhqwlsp0xpIqOZV5
	qX9AUqLlPnfvYvsSj0MHgKp6mYJK/I00kCd326c7mSDhjZJAgl/cI7QIXKwqXJPNxXVFx2X3FG/
	BvkZW60EGIZ4Pjkmtwn2hwyjcIJY79amjCt9SJTnr8eFWG/n5XHj4TgP6S34xOi4Rqo/d8m6e4W
	Pzg86NYlCrKqq6CekERGQxtGhnWPUjZt+M68rz7YDQoIfhkTbPAlp0aq5sa6FxJt2/cfYg6YvFn
	v4Z+RWJDPDlcqJ5QM4nguUneOJKK+mkUMwH49ge3N0l/OAQjPcICeMAQCWfinrQwZjLt37NeXDn
	UI5ONagHo36Kfs5y/mQlhP/m7QOjYo3i1VrAZteYtSPwbY9pjkZuwFY82dYlAguV7gNJ6LRtQ1s
	/R1wClNBtkLbQ/NuavJEcqJPAh5BtmQT+gMuexdInVN6y2VHY=
X-Received: by 2002:a05:7301:10c1:b0:304:de94:1c2c with SMTP id 5a478bee46e88-30bca0cfa9fmr1655914eec.34.1781692426567;
        Wed, 17 Jun 2026 03:33:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:33:46 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 05/78] ASoC: codecs: aw87390: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:22 +0700
Message-ID: <20260617103235.449609-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/aw87390.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/aw87390.c b/sound/soc/codecs/aw87390.c
index 020213e0ca4b..88110e720f85 100644
--- a/sound/soc/codecs/aw87390.c
+++ b/sound/soc/codecs/aw87390.c
@@ -225,11 +225,10 @@ static int aw87390_profile_set(struct snd_kcontrol *kcontrol,
 	struct aw87390 *aw87390 = snd_soc_component_get_drvdata(codec);
 	int ret;
 
-	mutex_lock(&aw87390->lock);
+	guard(mutex)(&aw87390->lock);
 	ret = aw87390_dev_set_profile_index(aw87390->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change\n");
-		mutex_unlock(&aw87390->lock);
 		return 0;
 	}
 
@@ -238,8 +237,6 @@ static int aw87390_profile_set(struct snd_kcontrol *kcontrol,
 		aw87390_power_on(aw87390->aw_pa);
 	}
 
-	mutex_unlock(&aw87390->lock);
-
 	return 1;
 }
 
@@ -280,14 +277,12 @@ static int aw87390_request_firmware_file(struct aw87390 *aw87390)
 		return ret;
 	}
 
-	mutex_lock(&aw87390->lock);
+	guard(mutex)(&aw87390->lock);
 
 	ret = aw88395_dev_cfg_load(aw87390->aw_pa, aw87390->aw_cfg);
 	if (ret)
 		dev_err(aw87390->aw_pa->dev, "aw_dev acf parse failed\n");
 
-	mutex_unlock(&aw87390->lock);
-
 	return ret;
 }
 
-- 
2.43.0

