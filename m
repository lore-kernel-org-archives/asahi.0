Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A1F46AF17
	for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 10:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692581; cv=none; b=iplNUoixFZH9g6gfCr76e2qP8GonE+rwFZgiZQS5HMPcoribZAbO9LrMdMoqxx6InMQew4exQAmGu5FI93HugIxa+A5hjb/8BsJzUEw0lbSh0dZCDc+Nt1G85dAy9kysBetKpZ8a/+AU7iSMH6dafniCthFakdi+Amk+arkA/08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692581; c=relaxed/simple;
	bh=y8ow6yxkPBd9p6g+ra0bZiCZf15W/mXoZiP9ucube1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GJQ1n63YjlBQ27h73uMQpv1tLgpTn8J9Ra5BFgw/UNc/zjqpnuw3ydXXUKeycgRYoab2/ooH5Pq2U7Tuf9qbCzhZ+s7+VxbRux5ckz7k+QvVwkWK5VnVaWIsXcdIr2cqT+9COrRB0/cH29GNvsbZBQzct4Df1rHcmIiyr3iE2Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZoBJg5Cu; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZoBJg5Cu"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-304d8362a58so601782eec.1
        for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 03:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692574; x=1782297374; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VnmSujrFqWboTKWLL+/g0m67QqjzB6NJpQ6VirC6qJo=;
        b=ZoBJg5Cujg+Zub4oKc/SJWw8dHLELXqY9qylX+0rREMlglyjS1G7D53U62BLsczlx9
         ojcsoAni4arVNx8+4jjGWn7fH0YCVKjUX8k8I6h31pw5B1NnE+2tDvTSswfm2GbLqYMo
         tZWvDdXhxlqtOzJAw4zFM56+ZO2IFJrrpiSVuVxpnZ62AZ2sP8EJWAPIdw8gYphKNWOV
         nc4IY9KbAyvTT1kVfb6CBEkY5bOBCsWT3GVbEG9GfuMWpEO4wtKHTXwNqaoZsnopseMq
         9miCIK8VtxfJT+HEFgwohjFRY3+X7TULhm2ktbeAEKGF/qWvRlwSQp5Nbr/duiTbulW/
         OcDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692574; x=1782297374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VnmSujrFqWboTKWLL+/g0m67QqjzB6NJpQ6VirC6qJo=;
        b=E6zb2S3NsCexIEdY2xVncPvk8na/dJEX2zzeWL5u8dM6UBcPosadG6W+aZxPJYsZFA
         TikMHBMrNFuX3O0XiApBn/EDVCnvQpBmHDxl5M/5CUa59diHiaon/TH2uBx5Ymno47SU
         VyVjpjMIJN8IEF1+GQNNMnTEa5E6zc5zKvY+HE/VvvVPMI6hH0d2x0qRBSRZcvEBlt9x
         Ohc1YHgoDY3XdzdNukk2MyEXAKWs3oDpxHgQ8+8qxP2fgTOTmfQUaymUr7jyHVAO49NK
         QvyT3+q91lJIrCU9pSjvR82QO8U67LigjHgcPA9Nc1qTaVNR9Fou0GAKNTCVPNxpZdRg
         kyGg==
X-Forwarded-Encrypted: i=1; AFNElJ9dMOLRQL0Et7DudU3YcQkCfi+Gimmo60CtI4bF88uzNmvavz5Sn/MFwDZA6+PZrLH6WJO8Xg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwoaIvz/UduCZtpMP0SGtq3shLRf2uW07OElQ3l25ofyOf3Dke5
	kexUZboDfSOnPZKyC5HxS2cz0Iv4RnnoS5ALGzosuQHyFlLidMElzN83
X-Gm-Gg: AfdE7clYM5i+cJtIp3vO/j+ec2UA570jlpCM95v6naCPhywQUS3XruAmRd6CSRIDSzB
	vUxMJJpgmimA3GolpP2a7Q4ceM4NBCaIFR15Nwz79Kb5RnVJnfEQ3LUIiTQlYAMPBnNvcSlIrU1
	bDBG4HxSFbLdmHl8bwHmvrM+zrY0emG5494tE662USKMCdVLLEz8NKrV/9xv2du11rlKr7J6Smx
	7GfPYOvDlpRUCuNyxlNTlA51p1vLNA98KYKxNTJ/rAX7W+q6ZMf4OUSCDvgLxyoBZfjB73V+oz1
	eznhGADbvZoY9NnPZJsfarKZmWf560AKUDKY59On+hAi+av5miTwC3gBFLWKJqZ4XGejFglBYDW
	vSzUcMEQ4mQuhT8+pJRzCQXc0yPoxRPYERZ8xAvpaiE9Kf+ej2QaELJYPGlNJEnQgWQ+oZwrBI3
	Qa0/+/hGZi5nktt/q3qcia9UT47q4trDvihB5vueJNmNVhYJA=
X-Received: by 2002:a05:7301:7308:b0:30b:e524:77aa with SMTP id 5a478bee46e88-30be5247ae7mr89541eec.14.1781692574470;
        Wed, 17 Jun 2026 03:36:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:36:14 -0700 (PDT)
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
Subject: [PATCH 21/78] ASoC: codecs: cs47l90: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:38 +0700
Message-ID: <20260617103235.449609-22-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs47l90.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l90.c b/sound/soc/codecs/cs47l90.c
index 77e8aabb241a..978149245079 100644
--- a/sound/soc/codecs/cs47l90.c
+++ b/sound/soc/codecs/cs47l90.c
@@ -2423,9 +2423,8 @@ static int cs47l90_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -2456,9 +2455,8 @@ static void cs47l90_component_remove(struct snd_soc_component *component)
 	struct madera *madera = cs47l90->core.madera;
 	int i;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	for (i = 0; i < CS47L90_NUM_ADSP; i++)
 		wm_adsp2_component_remove(&cs47l90->core.adsp[i], component);
-- 
2.43.0

