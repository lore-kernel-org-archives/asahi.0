Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133A143D50C
	for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 10:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692760; cv=none; b=LG4RTle9bLpCOq+WgnOOCsf8kbMJfJaV5d1x+dqtebdLLx0OSBLw4cH1++xw8qgQXp3ZbRvg9w7h7/YkfSuXkX7+8GnwNkkwYJUQ8YwIYV8j+bGa0vgOR1jbDIwJw4Mvui+QNCgNeqoBSs21zPd2b/go7tsDMpBrZkktvrHKgYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692760; c=relaxed/simple;
	bh=jWPckIT7yObRKkib/4Fk7XwIGevaSZ223c7tQ+YT1gc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VrtWNPSQAmaZTGwDZ0aJ4bJwKOitKR8Q3rIlhBJc/1+XCgAzQFvgRoywRUsLsGnTBiSGzoCer4OAkNfEZBEpCr+M+PD50V9orLe7RbN36ryIOw20wrRBm1pJkQf5MkienOg4g0QtIuXDDG2HcgXNhDMZ8FLea/Axk/22oeaF96c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pqn+02SE; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pqn+02SE"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3042a388168so431420eec.1
        for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 03:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692757; x=1782297557; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VsmBJqYRQESRitBdQqnrMXS0bILtgBW4brP7nxaBGqg=;
        b=pqn+02SEz1Poj7wj9PI2rMzRCPwupAKfNFyefH65CFheE1+JmtQqBzEsKPeEeIaKY0
         rkvwq4tPTYizSZgZWm+1cNtXHhtbG6el2ozB/40b800xKZ7Ol/I04mgJFgfk5oiVYXyB
         wWx159zkdtnHOnds9tQO9/NnK82oaeY63UNxvVE+a/ssZ8zHsWvfstimEuoprYNeDY1k
         hoWGO93ORkOK4BzSUBmvgI+91pB1SRLwa2kXdbLR1vLtYacnjbVWLIGJ20vpQBr3D0Iw
         Wb5m5DjQdnukg8KSTQH7QO9f/5on3If+rB2p8EsLPJtzgc27sr35FZtxyD3glkDnuNnx
         xf/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692757; x=1782297557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VsmBJqYRQESRitBdQqnrMXS0bILtgBW4brP7nxaBGqg=;
        b=pOP2yfDE1BcYXP68VI/etlyFwY6Q7TIfU0byqSJjk8zITqTV3nDoe7ovknszBFdfaC
         1Bl4v+MRhm9sEBHnguiCfFN9bBKNzZEuNf0AZL96V63/mHmvU247AoIclUhvHu8zxI1o
         7qUg7YbxrBkSHI/wLmRbOCJkGZ56VGWmdTTV7j62mbdtSJgPctYebgr2XtM32aXoU+Fb
         3E0EHVN4MWcpp7m38cDbuQfOTj4fVnD/6gorRoCI1Aox1TgEx+kUbrJ0prTluXMc9qw9
         9ebS1FhMr9SRsUcyrrMNnxL+Cj/RwUqojMkx4bV77bIpOEPAuV8OHs7s+h1bxgcdz/+u
         5OBQ==
X-Forwarded-Encrypted: i=1; AFNElJ+m6IW5jFgPLJObr6LBJAc4CRY0vmiOC48jlHpgZQCySxNAQirkW0Ija5ENlAdw2zONCj9y2Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwaqZUFZ6zllhcx8jbTVye/cP9xsRymtY/Xir7aZ7RIK31LnZzx
	RthKvWg6v3QSn0jYT0+Uc0l9kB8sgFIfz9HDtwT5z37JTxdw+56MnPKB
X-Gm-Gg: AfdE7cl/LhoSb5mHDiBlRQFKtsYC/4D1uxeTeXpVL6pa7/MVWowOm5LwnprUSHNxDI3
	I0scbv9gStc5NETnsqFAmd/HoCaGWl/muEbPc2PQAGCruPa07KkgESrTae8qq1Pfpl+S6NKgHDl
	830zhxtWxFVtEVfyYx++eHVkxA6tmvT07p7tU2wFiFaM4OWZO4siEuY3QomdXMVufl/4YeOhH5f
	mvS/ELzLcCPhP7k5h9nyXTz9CsMO4NFcePUzZ7DL+qUsn2pslDi2Liuhz2wxyjLg1afDTm9NiNV
	GU4/kRR+h4BxNkThG+O0GlzwTQ5G++NgkT6JNTzCJ4fiSsYwpa6ol54po1vMBZpfukUiw04f/kT
	TsCTF++l2ne9AYPxYlBSuRWEx8nTEerqOadfD+X/0RtpOFMqel84vgOtdylAwlX8MoZyj9PgA2/
	DVtUJar/PYBLCGR2T5Zded0COHdTRPUg/pCqdeJBN0er1sr3o=
X-Received: by 2002:a05:7300:50fa:b0:30b:bf84:18f8 with SMTP id 5a478bee46e88-30bcf08d54emr885755eec.8.1781692757235;
        Wed, 17 Jun 2026 03:39:17 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:39:16 -0700 (PDT)
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
Subject: [PATCH 40/78] ASoC: codecs: peb2466: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:57 +0700
Message-ID: <20260617103235.449609-41-phucduc.bui@gmail.com>
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
 sound/soc/codecs/peb2466.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/peb2466.c b/sound/soc/codecs/peb2466.c
index 2d71d204d8fa..ddbc5f34b08a 100644
--- a/sound/soc/codecs/peb2466.c
+++ b/sound/soc/codecs/peb2466.c
@@ -1704,13 +1704,11 @@ static int peb2466_chip_gpio_update_bits(struct peb2466 *peb2466, unsigned int x
 	 * So, a specific cache value is used.
 	 */
 
-	mutex_lock(&peb2466->gpio.lock);
+	guard(mutex)(&peb2466->gpio.lock);
 
 	cache = peb2466_chip_gpio_get_cache(peb2466, xr_reg);
-	if (!cache) {
-		ret = -EINVAL;
-		goto end;
-	}
+	if (!cache)
+		return -EINVAL;
 
 	tmp = *cache;
 	tmp &= ~mask;
@@ -1718,14 +1716,11 @@ static int peb2466_chip_gpio_update_bits(struct peb2466 *peb2466, unsigned int x
 
 	ret = regmap_write(peb2466->regmap, xr_reg, tmp);
 	if (ret)
-		goto end;
+		return ret;
 
 	*cache = tmp;
-	ret = 0;
 
-end:
-	mutex_unlock(&peb2466->gpio.lock);
-	return ret;
+	return 0;
 }
 
 static int peb2466_chip_gpio_set(struct gpio_chip *c, unsigned int offset,
-- 
2.43.0

