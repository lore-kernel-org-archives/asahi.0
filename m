Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729F04657E0
	for <asahi@lists.linux.dev>; Wed,  8 Jul 2026 12:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515128; cv=none; b=VGjazTXH/0tM8SwxvcQv/YpK2hWGVS6IeAKDQdtHpI2uw2e5bF5YX+qx9GM5hgzRkE2UOVHrIAso7ORjc9WxfbfiEARecfhcunZl/mquWnA9cbKxX38UqMlDuriWM9vII5k9dMOmtKchYEtZlqpkpvCDyQfRWOBdflxsmfoMhCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515128; c=relaxed/simple;
	bh=/r6IWp2lq/IqX/xitXazGqvOEQK7A7aRycIG7RzU7kM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RBL182OIIpjRZsaVlcngM4QX5l0PZu9OX1rSU3MFxFUBYxQSShNZX1hKUOualbCYsZ+2lZwTGjoFRCBcVhclGxBwbQyBmS0m1Q7RM4q+ZT+eQuQuRj5NYjAmxLCYpzMv0d4PGKc8aENPt6vn5rr+iW4LJtCHtQ8l6w5lffPy/wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nr8gnD5O; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nr8gnD5O"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-382a3fe0d28so654673a91.0
        for <asahi@lists.linux.dev>; Wed, 08 Jul 2026 05:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515124; x=1784119924; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mtl1X3tKc/n7QmmaBl4vTl93wYDxMzIpl5/tn8Gmn8k=;
        b=Nr8gnD5OH9VUZJ6ObpWzn6wVxvdWMRHDGSSrosOOumdZsbwAI+gDjBWbBtLQUNEio/
         z+sU+IRdcb6mxYAsR7Hx40QSpc3QQ1DNnxvEsMQhLiUNmTNyUnwgA1RakLBmbmoKa4rY
         k0G74ui0rC5ixOEd69x8zOLoUB/yv52ByUHy/b+XWjfz8XW9Y4QIEwSXK9cNb8jOTpx8
         falwb9EE92U9+kTo5pB+JOtoL6MOYigQwfQNUr3dT0DR3Epi5r//nz+0KyBddsW+O4oh
         2aqdmRcy81ar69HSGLV+sUzgyar+aCpRpFWzoWt9YwWrAM//Egb8a1Hl59/ZpVUffoeS
         CDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515124; x=1784119924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mtl1X3tKc/n7QmmaBl4vTl93wYDxMzIpl5/tn8Gmn8k=;
        b=XXUfAHy2JiUT5/+iis6OKUg/5Rj3FM7/9ENP+owepQENGg6881Z+UjIdr4VxgXb1l4
         khrSnifBHmk7vg5K9L0IVWUhPsGxz2mQVNJFjkNS0E5HnpAT0BRujCym1798lrmtDD2K
         FheYGpwuksRF0ktE/byZpzj20Xbk9LUltZIIkHsy1dqUASYQqq56hXS9db/Kq8064dBZ
         G237KMTeecXTjsWDfT0dqC+OXINg8Oe/hpR1PG4kcYIlOK7v/AXGltynCMV9r0xtCFpO
         JnfB0275y+GQHTlh3tWAQ6VXvLwdiYkqNyBdQpN/WqMJIhUwqWP6S7JiASDp6Uqu9geL
         gk7Q==
X-Forwarded-Encrypted: i=1; AHgh+RqW47ZQwuslD3sTzXNJBQ1XyrcmplhVpedwQ+QTxDPaKkpYyb8iTZ200H+ieDLMVRj99IU12Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzrFrTT9LLtRau3+URS/jqefiviYC/kYB5DMSdpSnJtaWyvp6Od
	dDNSVAyq4XsPn8YHExF4QKRofsaPICRave4AYE7ZNfdidPQOLEAvLpF0
X-Gm-Gg: AfdE7ckYu2zq0c1qW6lMl55Lu9d4wr+gEPUF+KwO9wxriRNH/0vnvQ1yBNWQdcnJ6m0
	MUBH+OH4MYnvIzdgcDebxgXXCGA25g7Cgeht+weqUN+ENlGp04VP78N0AzYDIX7PXpk14c+B/BS
	2Yjw2bUoxSY0nT+BycQPPqlfo6O1UmoYAyCIhT3evqqqcAeouz3asv/rpENLjr2wTMTKMetcD5N
	PyAhegr5yToGIWb/RhRuq0sw98E1ezB0OnNR89WGhd2MUB35Ae9t8ib34NhorJeyS37aQZEuVQR
	+P8tlNoUG98FkRmRSK3rnqjKIW3YuCc9GPX5khQVAxcjGGBq2Xe+hEF17RBICXu+AuT54OaH9iP
	PYxs4JxHBGJjhsDX4aLmFNcaREgILBtjoxKdBHmjiOcyfuyGGZcnRUv0wVzeJ57NSHY3rhCzd1f
	Wr7Api5dzl8MUE+stKrnNzK8wQ1a8ixshzr55I4xTqk+GNKimhxnxFABrMXw==
X-Received: by 2002:a17:90b:2705:b0:387:872:7b87 with SMTP id 98e67ed59e1d1-3893fc69416mr2611311a91.13.1783515124243;
        Wed, 08 Jul 2026 05:52:04 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:52:04 -0700 (PDT)
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
Subject: [PATCH v4 12/24] ASoC: codecs: cs-amp-lib: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:49:49 +0700
Message-ID: <20260708125002.202515-13-phucduc.bui@gmail.com>
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
Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs-amp-lib.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs-amp-lib.c b/sound/soc/codecs/cs-amp-lib.c
index 371e99205b58..41a9a5b005c6 100644
--- a/sound/soc/codecs/cs-amp-lib.c
+++ b/sound/soc/codecs/cs-amp-lib.c
@@ -7,6 +7,7 @@
 
 #include <asm/byteorder.h>
 #include <kunit/static_stub.h>
+#include <linux/cleanup.h>
 #include <linux/debugfs.h>
 #include <linux/dev_printk.h>
 #include <linux/efi.h>
@@ -83,10 +84,12 @@ static int cs_amp_write_cal_coeff(struct cs_dsp *dsp,
 	KUNIT_STATIC_STUB_REDIRECT(cs_amp_write_cal_coeff, dsp, controls, ctl_name, val);
 
 	if (IS_REACHABLE(CONFIG_FW_CS_DSP)) {
-		mutex_lock(&dsp->pwr_lock);
-		cs_ctl = cs_dsp_get_ctl(dsp, ctl_name, controls->mem_region, controls->alg_id);
-		ret = cs_dsp_coeff_write_ctrl(cs_ctl, 0, &beval, sizeof(beval));
-		mutex_unlock(&dsp->pwr_lock);
+		scoped_guard(mutex, &dsp->pwr_lock) {
+			cs_ctl = cs_dsp_get_ctl(dsp, ctl_name,
+						controls->mem_region,
+						controls->alg_id);
+			ret = cs_dsp_coeff_write_ctrl(cs_ctl, 0, &beval, sizeof(beval));
+		}
 
 		if (ret < 0) {
 			dev_err(dsp->dev, "Failed to write to '%s': %d\n", ctl_name, ret);
-- 
2.43.0

