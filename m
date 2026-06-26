Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3FB3D4137
	for <asahi@lists.linux.dev>; Fri, 26 Jun 2026 06:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454530; cv=none; b=B9PSMWCRsNLsSrtV1K08wDqP77h5Io4/ABmCejHgvK6K+ZVPcIbDvwerJFsOSDJMOfjUTXzOU0fgT2mDBuk744ElBu+OT4Yzvp6m4AW8uCnX8VuaDl3mcJ6HiNzHyJl1HTIXu6zqBafN4qrRcfrKylHexqgPkCUC9gJycXg0Cyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454530; c=relaxed/simple;
	bh=hFFYBp0rH2f/68QxLOjHm14ykzjK1pnK1FIOxrkKo3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fF53py3W+9Itx+UlKeJy70UZxpC6foGbMCq67+cpy8gdXe346jdpTZ6dQCFQb3zFIb6M5Sl7bdzT3cEhFNovseHzUE+nRvJ+28rze5X8vBFJGoBnb9qJoXBVie6yT/o2vCYRWlxUs8ROZHP4XWE/mKoNl2dhlt+iYc8LVGXUKrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rOmzIMqV; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rOmzIMqV"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-37df6d9ec2dso270044a91.3
        for <asahi@lists.linux.dev>; Thu, 25 Jun 2026 23:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454528; x=1783059328; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PG6vKQGWAHofKUNrPpKKi9BQXDIPvZJy9kMaVHXivck=;
        b=rOmzIMqVN0owNrcQ5fqneYxFG43vnY0MvgohcyGgUk3VuXlyTDGYLoNxEQ8WUk3nUN
         xE+9MZc2w5DxkcJpAHzq3zg2oly6gkRXeWjhf66SS75fJoucSx53AraoSQAce9nNwvCY
         u0iBSnyyNL9uZzDOInoWxA7TRC/UPIakfWh56NjavNFTl4HrD5C0auOuJ2EKhyMuZLnu
         +kKRQIHNDBh6EoLrSonKLZj9rS11YjJSIi2onLcFnBr7I5SjHx8hLTlGQKzkdc8OAiDl
         UOdbxiPudRSF51Bh4aKGlpcgaPXXynZZ17PRPIrkqjvyEOYd+/Ul2/0sNEPnKicjZkFt
         AJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454528; x=1783059328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PG6vKQGWAHofKUNrPpKKi9BQXDIPvZJy9kMaVHXivck=;
        b=eOzJjt0detjZFzq4Yxo/0ZN3tE7ldJ5pJMGt4t9HSRINyCVu22GTiNh+s2Ooc8yhez
         A7KuIZNlJnxPAJ/yaXq2yDhSYpPHz9xSDBzp2w6yR+PP3AktwqNZwetyl/y2sFrcjXxY
         enaWmmORIkRfP+ilRj5IIiLlRWeC8BLQINhF1iC0yBmnzy1GDlWHzPcbBmceJE5zITHK
         xk6lpw2d690GMFLG2JqcWxpU9BRAmy153gD3L396XD7UEPOtv2At/T8gRHSyHnoBKMa4
         SHNcCqstl6dI5aGk9R8yJMdLAacGUB/07sMHZBxSBpSv9slh2l7/QLY086eFADJ9jIBi
         zJow==
X-Forwarded-Encrypted: i=1; AHgh+Rr3R95skqVW92Fpm+MelmHx7rdJ9j7mcjaYPvF6ByDudwOwjmi8JdqWEUnM8QnXhPIVIw6qSQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzu4MKBbrKOsevwYFpZm0TItUOamfZ8bT2a8OhTGc8qccN/j3CR
	UecSEvmTjMRT3M9pK4+hzHO94BCGOB65d7BKaQQe2fmUj3XXiJwi2Wa2
X-Gm-Gg: AfdE7cndDBMNot4xFnIi5IMwAFMfB6uIRi5C1e8NL2nLnmzLRrVN2oD9Hu3eJkXp0dR
	7MRoJW5YchXxB0FxQe+epGupmUSkTAxSwn8pQLn0Nac2riF84m6f08SuoOWpgFPYf2ZHjnG32k9
	6RSYRY3VW44teCX9VUv5pBh67+J/mev02hyPwmR3KJeYD/bZu0r2srOtpQm0u8Gm9C6EWlrwKn1
	POtKr74pqWFBnLXTORKSsJrFa6C6DF5ZOjvUOHNeOan1c8oFI9mHvGryVQHzQRX78Ma84zQyPke
	ZtBUVfFx0IDVvZj8gy168CsIri92b5nRYxOBaB+TgLYlTwfdkLV1wxvT1ZlHMtcmuqOdFRanQHF
	BKeTurGhHvYwK9R02gZVPGLE5C1H47nQvhwbTDdr0Pe2NUs5oRhHq5oZdhysqhOYKusC5uIUuM2
	0N4wX551eBxMazEPcEncVEF+oqc36/Iqkkyp2FJm/rZc/eGrk=
X-Received: by 2002:a17:90b:518d:b0:37e:1c8f:3dff with SMTP id 98e67ed59e1d1-37e1c8f3ea2mr302131a91.11.1782454528393;
        Thu, 25 Jun 2026 23:15:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:15:28 -0700 (PDT)
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
Subject: [PATCH 12/24] ASoC: codecs: cs-amp-lib: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:17 +0700
Message-ID: <20260626061329.23264-13-phucduc.bui@gmail.com>
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

