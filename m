Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C133A372EE3
	for <asahi@lists.linux.dev>; Wed,  8 Jul 2026 12:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515041; cv=none; b=h3vt8pnMoAj49iY5qIg4896W8ue9XoxkgmFpywsjyCTQlUXsnkjkRrTEou9X0766X40RdRzNC5yxWITyffXdg/cqGqNkkkmkKZcjR9OEC4RFSyIhMXXqCWutdUrhmKWUj6fdbkrF1Aiz3c0OcB37Zllly1ilDE7s5anQUYhc2gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515041; c=relaxed/simple;
	bh=MN7hjUlOeJc0FO8mu3UrzRrAKjy8hB3fiHLBiWptOh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SOCzrJQYm6QRZSuJss3cd8SVDMbXXp/A/DAmoC/aTOW12eU5HjV34aZLhN4R9IaXpnhx2f9yzL9yzCx45PpI3YDg4nAf75ewwswMK8b9BCVCMO+yIh7AahD2oBWxKNdzVPsRz1UxPUR5oMrd3RUeHDy39No5lblStCafzeV82W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zdb5JNYI; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zdb5JNYI"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36b9d265355so638376a91.2
        for <asahi@lists.linux.dev>; Wed, 08 Jul 2026 05:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515039; x=1784119839; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=//ABcZnuHlA1g5iBkAP8i3Vry09H6XD9kKuii/9o6as=;
        b=Zdb5JNYIwqiy+VM924D3A38UFsyQ236uwbzLmJK2OtKJ1P7uION0fKd3jYei7h6/Sm
         4vhI5yn8ntz9HmdHQVexZ1k3LLqnt1md3tM77Nfyxu1+J2CgifwSEB9h96FQeD9/UIG+
         3agrKK/uFQy/bcyb+yTsn6PtI/tUTZGzYOsJv6HWIgGZflaQvE4CIwGmW59mYSSSUCVN
         T7hr817lXm1fb21aAbV4PMElxFPAQSGfgnMGfzKJfZeSUds5CkJfMuLp3o5ZmWZc28Xp
         hmjU8+ivr36mDox3GM/t7L+eGdsw3AE8z2n1ic0YdhD1LY59NXNknPMCm7N7C5pJNpco
         /qiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515039; x=1784119839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=//ABcZnuHlA1g5iBkAP8i3Vry09H6XD9kKuii/9o6as=;
        b=RxB0z3FMdTmmJIF/oqJCO1Dqp8ww0oAh0Vo5Ks0vs7rnpf0ACjYOjCFCpyZK544igS
         rKVnSRnm6JimcxXeXwixc7FQn9rAOOde3qaWlvY2hbulGOoBXNAGiiDjo4kzqZcb3r1t
         ImvihowplAECt0MQnc+V6JFznvYLeJYUzqNYbPhkFz8FKLrxRNFY/mrfIx6NEjywN8In
         mSQ4vSdjxbDQXjluaJcDlR3D8SlOIQBIkMQD4G7UdoI1jm5kL68KlpNyExQmwz3COXgS
         yNJgf6iLeeZYB9xt+a0KKThitvPqIxqv7PuyW9EMsxxE8d2qzDj+i6VRy/p835dWg9hQ
         s0Pg==
X-Forwarded-Encrypted: i=1; AHgh+RqjLQghAshCJa0iib3JiFgCzG8LmiWPvMP5f+JX3+4c7nHJrB+wTMNSSHsK6vOIz+/TbsOazw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzkqh+7kqe3uOqEPCK27jCmt/HFYdBmoBa0j+hEDFO9TOc7q3yC
	QGGoc+MneE/vfCNMhDLfKIEJ7mAO+W5PRQlsFbzFxBhLJmW/Ju/xMIeF
X-Gm-Gg: AfdE7ckqEqdvUS7wl98CcNuYW/UFEROioQCkyXKSWLf3ydECvYYZ5V6P2ry7ECywn6A
	ci7xLmwad1Wp9YblC/a/53ZjeR4A/csWejr6pANj7/vzSddE5e94PXGmseaw/4FqiWs11a1lhcT
	kWmQ4eCGtKRWDoQNe9536sizeDbIycmcdrpVv1hwrDwyNs71pE/w5xAMzPZxnKEXuHNsRi0OixD
	wK7y9+CYELFIhxImIRxoKEugNYVL6L+DDqm2eMkz1dwVs+QtINcVV5sMAGpagDUCg/STpjye8pq
	eXqDfHB/Z3FpEn0EolhnJT1S7f1g/7OWjoOhXDzJDk99boMrFkpX2Cj39PaK56d+KwRe33eCKGL
	zduwcJ5dO761Ze3wWj9sqb5Ao4yzbNVV+WAwWOKurpqr3fHje8LaaFFAM91K+7UoTQFHsAmNh6U
	Rwun2Ejpb4u1agugqQ4O9rcVHyqW1TWVmN75Q3bYkj1RxDPQw=
X-Received: by 2002:a17:90b:562d:b0:37d:7bb4:bffb with SMTP id 98e67ed59e1d1-3893fb6ffbbmr2457209a91.2.1783515039213;
        Wed, 08 Jul 2026 05:50:39 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:50:38 -0700 (PDT)
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
	Cezary Rojewski <cezary.rojewski@intel.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 01/24] ASoC: codecs: ab8500: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:49:38 +0700
Message-ID: <20260708125002.202515-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708125002.202515-1-phucduc.bui@gmail.com>
References: <20260708125002.202515-1-phucduc.bui@gmail.com>
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

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
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

