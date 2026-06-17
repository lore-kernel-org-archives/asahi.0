Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD9B4218AC
	for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 10:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692789; cv=none; b=W+fWYvAORnEv4pI3zo1jDg/sVcAoRdBj0qqshumMjq+NldseRH/+6R1K4wQkFz87742WV9sDvW71qDxkBYrEDWse+R0CcsaZLGTSFtF1VQ9IakJcUIUnS5DP0k+/wTNVzT6zBOiEDvK9J8yJoThlQgjogcXl89EylA2VE/feu/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692789; c=relaxed/simple;
	bh=5JCNTsV1p32IiiWp8LevAgThvpw4U0A4EV+Xvmc/Vns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C4i6c+XkP+5sf10jHoZDlFqlQG+Cx/QKrldsBEPNAKqamy9E0B/0SXdNW/t3qioufmNZW9N+K+qHu9rOH9rT9yp7AWAMAM+gzR8uSV5Q+luA591q8reWuz77u9eWEniXkj/PzPY/PicTVUtHl6kzJubola3GfDmDyrDF23re8PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/OR22Qt; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/OR22Qt"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30bd7f4fdffso371349eec.1
        for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 03:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692787; x=1782297587; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z8UzOcdKlzqr8WU+ZxDYdCm6hGtyTeRisevBsOozeA4=;
        b=X/OR22QtX6l3sJV+0x0bSlfkF8kMVayzNJMOnO68wgfAXoa5AzPYTTi7IkgztIhkKu
         fe1AXgmNeSZdfBE+fjoc+L7zOLX9PyBcq6JGs/GbuMc0OfbHIKtioo1VVh78Fi8NCo9Q
         bJP3y3a5vFs8qFy5HB3wJdZr3TOlP+IfG0qEpNg/hgOFdj7XNyN55s+JlC6MG5z/Z++e
         0zMFWcHIWnpZgd+FjH8/wJ90j2+RB3e5O3osfJ4gZcwHVeNNCQ04N80qToj/97V0B/14
         lKnQxyX+bJJNdqKe7zfBnyUcNNWbHFL8WFhGMLWG0YOmXapMQs0zjtLdy+R6+R4yN2xt
         rGZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692787; x=1782297587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z8UzOcdKlzqr8WU+ZxDYdCm6hGtyTeRisevBsOozeA4=;
        b=Tweyhmwp9fYSfKA/8/gGZhEFxqa3bR9unD9+pmX7V3u3b7gnfuTxXsFhLxO2JTnxAC
         j6CA2Mp/upet/JBMTiANjnpD6VLEmK5j3YvK9yLkxQ93R5vtxJUXkXpGZ9jF3f8r5f6I
         d6ijvhOY6eTxqxajWAMq0rDTBtE4xjCtMwNMYbUlvHMbFO9OoFS2IiPn0bVRq6JoOazB
         9WswDQnoqnmlkE73SOVb+z4511dZIF4SHjEAXPeVIqWdHryXcntjj2RJqcN0DnRvGWpC
         V3LAeJj3UOwv5fbg3mkVxYPO2Suditr60kmGcWbcyFcTbeH+DrhotuU05XRkmmsKltc0
         iiiQ==
X-Forwarded-Encrypted: i=1; AFNElJ8UlphrxZcXNyuu0ZbxsqFdWWwXk+t8ovqCW/telJihFJsTy2bV2rB0vTTyCBfcysVngeqFtg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6ykhY3SfjTfQ21+Xn42makM76zA2b3wwfV2LZQQ9uJE8ZKVBM
	Zj+YovwcQN2N0oQPC+wmNHHLrAsUjyaJ2qKsuuUK736oQI52eOEvmMwb
X-Gm-Gg: AfdE7cl8zolnopedzFA5uCSJSw2irn9Y0xKoURdroWQ1yDwI28q43142CQejfO7mdcJ
	2TCaElC7O34YDkuxVGgQeBJ9SnzB0q1dl7GZe0jvKV24XMbWY8xaK9RY8jvLTGswZ1IMVJgcoYh
	c/lw+Iq92IsuYe9osdmp9yqSon4E2kaCxEF37p8r2Ie0G6CiZioVYEo9ewU6Dh/FouKQZ9EOdBy
	K8g1KFjKX4JcrhlJ4DsTS9zwzD1waQVPLsjw4KRoLnRupiDQWCEviVmcJnsFW5vPnNVNltJzn4s
	0Mo9iCsKRcolb5+PV1Sz4CLFk1Xl9pnQ2NWwqK2rgPcJAcoi0dS0k32BtjEajLhnfCZl6jlTHkN
	63n2lwaamAoDQFndgrYsyNKFJ3I32OoeHjH9ab/LhbHcTZPa39liK3Pt5lgILOvddxJHTCAyS8y
	GcaNcmRWaUfTy9+rXgtA4luXtKmNlDjCjwy0nAGIyyZcSoDwi042dbYCl4Lw==
X-Received: by 2002:a05:7300:6402:b0:303:f26f:df30 with SMTP id 5a478bee46e88-30bca09f522mr1864287eec.23.1781692787536;
        Wed, 17 Jun 2026 03:39:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:39:47 -0700 (PDT)
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
Subject: [PATCH 43/78] ASoC: codecs: rt5665: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:00 +0700
Message-ID: <20260617103235.449609-44-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt5665.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt5665.c b/sound/soc/codecs/rt5665.c
index 48f57cd0920d..9048632488ab 100644
--- a/sound/soc/codecs/rt5665.c
+++ b/sound/soc/codecs/rt5665.c
@@ -1208,7 +1208,7 @@ static void rt5665_jack_detect_handler(struct work_struct *work)
 		usleep_range(10000, 15000);
 	}
 
-	mutex_lock(&rt5665->calibrate_mutex);
+	guard(mutex)(&rt5665->calibrate_mutex);
 
 	val = snd_soc_component_read(rt5665->component, RT5665_AJD1_CTRL) & 0x0010;
 	if (!val) {
@@ -1274,8 +1274,6 @@ static void rt5665_jack_detect_handler(struct work_struct *work)
 		schedule_delayed_work(&rt5665->jd_check_work, 0);
 	else
 		cancel_delayed_work_sync(&rt5665->jd_check_work);
-
-	mutex_unlock(&rt5665->calibrate_mutex);
 }
 
 static const char * const rt5665_clk_sync[] = {
@@ -4564,7 +4562,7 @@ static void rt5665_calibrate(struct rt5665_priv *rt5665)
 {
 	int value, count;
 
-	mutex_lock(&rt5665->calibrate_mutex);
+	guard(mutex)(&rt5665->calibrate_mutex);
 
 	regcache_cache_bypass(rt5665->regmap, true);
 
@@ -4637,7 +4635,6 @@ static void rt5665_calibrate(struct rt5665_priv *rt5665)
 
 out_unlock:
 	rt5665->calibration_done = true;
-	mutex_unlock(&rt5665->calibrate_mutex);
 }
 
 static void rt5665_calibrate_handler(struct work_struct *work)
-- 
2.43.0

