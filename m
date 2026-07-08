Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF6244CF44
	for <asahi@lists.linux.dev>; Wed,  8 Jul 2026 12:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515176; cv=none; b=jx0BGrswZJIniCphlSbdwNkwLuKrAfcK1/kEkzBMLsa4GHEb0hepyjJjfmqkHpPwZm89m6nyjBYLp9Q84bH7CguzKlHs4PCBoPZlba52iZU7tsfmGUo74SSU4NrHWQSQotBoy0MVaKcRFxrbi5qlfhQtMFFDSIGxonmUOXy7sI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515176; c=relaxed/simple;
	bh=vOc7TQ5vfBLJU8SHQzzz8AAZi3kNOaHPDwAxiAGdE/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oFmpmuwnbnrV96HFuT+WXlgev2DeoopGhLWI5cEEOlg0iUJUqJF4yapVt5BP++6wAoOIBUwYOrVIIiMFe06SpT9pxUO5mZXdqv+zbLowseJ/tUv+BryNO9TgITVDgJOYPmyD1A5AUcZmxeGKit6PUtJQPkMpMUfcNLcW/YDo9So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R5KGI6b3; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R5KGI6b3"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3804e42ad5fso634908a91.2
        for <asahi@lists.linux.dev>; Wed, 08 Jul 2026 05:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515175; x=1784119975; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5VEzG5HuVwarDh68lMfsN4eBrO01eCuF3pkdbDzIwbc=;
        b=R5KGI6b3cAefhBp79coP/ezZqyUFwVaV2rvp1YUZCd4+TBGsI7yKiFu4Tz8hF9z1K6
         5hj4/DV1vnkBGp70osyIru4Hb0Ab1dTrMmZ4O/pXp9SXn7A2owIh85ia8XDX+2Bxslv+
         0lv4xs6OHaruJ9rNKDV3E9VWTDzUXlsfNYVmWwnWYiwJMXsn35lnqSAy1cst0/fIK8Jq
         nXROJXRfppsaVy6lEzSLjW570kRBOABofCq73i4aZo+beF6nDzgaM1RpBSrqD8JIHttd
         CE2m2UJ8EwuKwXxdAkj2Jy//cCr35n3p6wXmpespZ17J5+6bvyXKL+/LgDgJ94I3oDNt
         4ZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515175; x=1784119975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5VEzG5HuVwarDh68lMfsN4eBrO01eCuF3pkdbDzIwbc=;
        b=CTzaazJ3VS0pI14IGQjcCmsckdEZy8JgEL2v6Py9MdeLw6qEeIUy3WiG1yRwvTm5LA
         jKZoVq/+tF2nndwQHPY5lktucKeiuRQzCqLoJHDPxuInU8BiJhvLuViItv1cbeRqFVLI
         jTsOqM+efBIegKLHpV5RWHCzvnP9xuIfmr5eN3tMk2pEIddxVJYmaCIUrk0Ee4BW1oMO
         l2m/ui5WcwM7uewgjRV2r+2v+KvVIerDIMgWfY9FLpW5Un4GEaAUMr9j5rjSEWR/DtVc
         W/BV8QhhvdGiE0Wi3GnP9GEHLOgQ3dnMpRHA603cGa8acPVxLsFkW81k+TKnWD/XAaAz
         jLzA==
X-Forwarded-Encrypted: i=1; AHgh+RrgrP5zNBruOeFWWS+tHj2+woJOh8as9fV4wviKakiKhjG7FFhJvcYXse84eGbDlk10/oncoA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzFppsA3jVK2yW6EkBBmf1/77JPqIGwX6pXztpLvgCH0cx7HhRw
	BJt6Y42leHbGYF7IlVgufuoy98ZM5JJORLUAsQRMTuvzIcD0v2HkKFic
X-Gm-Gg: AfdE7cklrbXsr1ezZcAMLr2rO9uLu6D1I3nzLNwPyG/wl/Qq+sOOrx65HBqZ0BLt9KC
	9N6XDUSy4LcFyXN+zC6VYNtaXgMPOCwjWkmVoewa0fzM6WAJzrDKwbjDDA4gFq4NRkRHw6I+lb/
	5jnKX11JhxStvoO+Xb1mrmNdZjNixAg5jqRaxUdz1rGPKcnZDOJy9j0LSknHmgRXhp0BVQ1B+zy
	NMVKm1bbKaQAy3tUqDmikI8ZADYLt0/xBT7g3VIsZxKi0bNfq2CW8/haVqabPE1QLq+e05CQjZx
	mQABs637xmHInWDLinF9Nb9sxf+/ua3XYY4l998e+h77LMnNvUJwOiDhKhGIAhUkZvjG7FWdPMp
	6NS/L5MOOabYCahSWdFlbqCVt0oALDmi/7yv0uvGoC2N9J7kxnSgaxdTs5kLi/rHtkpryqeek6S
	xi6qcRuQ3pPWkuaRbRDGh8M7rq0Kt9GdTJx764dzoQkt8FXvM=
X-Received: by 2002:a17:90b:5384:b0:387:e0db:3fa9 with SMTP id 98e67ed59e1d1-3894239bfc6mr2461097a91.34.1783515174810;
        Wed, 08 Jul 2026 05:52:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:52:54 -0700 (PDT)
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
Subject: [PATCH v4 19/24] ASoC: codecs: cs47l35: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:49:56 +0700
Message-ID: <20260708125002.202515-20-phucduc.bui@gmail.com>
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
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs47l35.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l35.c b/sound/soc/codecs/cs47l35.c
index a8fe5a99a8bb..e77ac7bc8466 100644
--- a/sound/soc/codecs/cs47l35.c
+++ b/sound/soc/codecs/cs47l35.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/init.h>
@@ -1566,9 +1567,8 @@ static int cs47l35_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -1600,9 +1600,8 @@ static void cs47l35_component_remove(struct snd_soc_component *component)
 	struct madera *madera = cs47l35->core.madera;
 	int i;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	for (i = 0; i < CS47L35_NUM_ADSP; i++)
 		wm_adsp2_component_remove(&cs47l35->core.adsp[i], component);
-- 
2.43.0

