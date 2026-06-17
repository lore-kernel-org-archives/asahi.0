Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B81943CEFE
	for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 10:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692780; cv=none; b=eo/AFR2JYUfhmZkl2MNt9OcNkIdfKhbtFgGUQNhMjK7jPmg5O/vgYDvy+0kr6PoEHM1J6/UsY0MrrYVDj1Hm7lIAJ/5Dcir2b3ldrX5ifVEfkXFBoyZPU/+e79MJDbPuXLJwOdIkbD1jMXhuuto9uRDqnZsg087JaiPouPihh8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692780; c=relaxed/simple;
	bh=aKhcyI2WDSo96TltHAbwkDoRWNtxc6VdjCx9GbZVAX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LToWMNWgzKejNarbe6CNHas8thlO35i1eBIGorR/y5+DHYft9xttR7F0EWEzkd5KeXbCkx71ZgUHzKJ8iaLBHmeCkS50LEykxnGVuDI8dNl8/aBZiir8QxrnJRYfeINKjP6o2plN/dCjWaqnV7c3Os651s+ToX4DXAZPUAoeh/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cZn/Y8gg; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cZn/Y8gg"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-30759632453so8917415eec.1
        for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 03:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692779; x=1782297579; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8SpJk+YV05owTMk/l4yBZn7d6rPDuNymeMNQ+5MR+ME=;
        b=cZn/Y8ggPBW+VkaUFPc8qGfiDfXwGa8JPEdVV1JkiKiSxc4la2ESwMyLh3MpGlgURT
         Q2uMtwktKZpEOOMPWg9CEL2waddANTg3cM7QeJQtxWkNpKuoKycgV2DTp4nAC4uOSmJ+
         NGKXeW5HeURYLIPmuN1LhRQFO5JeMOxD8iwL16Su9njam14yA59cBtBoGLrIcybnLPnD
         hCrfj9KJPt8TXcfr3GFtG9umn+Xr2tYTocBO7e6Uz7h3cue/XxHBtJRs9K1VVxNa5qfz
         MMhxuJVuhLJnt3My//VwZ7Iy0sh528D+I2OjO+XUq/ieTVMv+Tt3I9bAFDDzAvaXS0kE
         vt/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692779; x=1782297579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8SpJk+YV05owTMk/l4yBZn7d6rPDuNymeMNQ+5MR+ME=;
        b=lTQkQFWktdtaf5AOuNRAjKM544KwosSFv0CIoit0FDWNuCrQ8BvkdZmJ3ptoUO6CrF
         4rZKjkgYsBcPomwQ5rOxDtAHwdRKYoB/dv+cWKLKsbp0wVE84fFIXVlYUzLW2/O93GJu
         JjCDAU7rEkL4NnA2I9sZNHnxkkj7UaigEU4Vm+su550VyMrUMNfe37FdaftsZujSSjrZ
         UHlL3A9NKalFBC6OLYM7ADOA5JjD6BZm5d92hS7tIEbFTKaQRt/SjfcdMwJoaAEA7zYJ
         rBVqYsOicB8N0a7F0COcTegip7xOmhriKCXySQ1IeSyqAu1EyuHZuppJhrup13IdtrhU
         SH1A==
X-Forwarded-Encrypted: i=1; AFNElJ8APA2NLYoEGDniR4dTa6XVzJ6Jz8lR2NALQGsU4U76LEytMxKxURVQyFMZQ2VaoKE5mxkLJA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxPko9vMiR0V0IehfF3vfSYbpQ1VHNB3Xjz9n4sWvvBY0sfghIO
	x5+n0yAVAuzyOi6WFuPQPitJBxVmFX+U1ecPPAG+axn+PWzm8uduY7fi
X-Gm-Gg: AfdE7clnau5ibY5KfUIUvs1F9VCQj9z9dEYNdGW3xfPmJ1gvsYl1iAaKLpgmRm1g+6X
	zV6GxLMk91/DgbE/e7sV7RjrmzVladDqczbid17uV+vSdt//wIdHVjGS2MEhctWUJ5JL+Gk1kml
	KNqc89WeBCOUIYqbvRKZ3DqgazIXv8+czF0BIZ/AK1Qv6XUnkhRxogrIuazX6oq0T8mPuSbHhQ6
	2WpZ0vr2zpCIgoaoP9g3EzeJypEndkvoAG4hLbucotNhLYzuKehahJNtKaICYSD+Af4RoPbWAwI
	v97kKx+33YEWCUOilacTXylIIIDlQrebxll5mNssKclqnQydLTManZLJV9S2HA8MArCMtOuSV+4
	k1Pj+n+E2Ug2baZu2YTTOgmw2t9i2k4OUpoYRw/pHBIBUcJ2gcdauDRT2qB6fc71975rZ4fm9RO
	ZVi4CqBJG+B/x3pfqjePxSSaRjdvni5bAWW42Q5g0loed0b3c=
X-Received: by 2002:a05:7300:a497:b0:2c5:50fe:c795 with SMTP id 5a478bee46e88-30bca0ed5a2mr1720604eec.29.1781692778532;
        Wed, 17 Jun 2026 03:39:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:39:38 -0700 (PDT)
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
Subject: [PATCH 42/78] ASoC: codecs: rt5645: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:59 +0700
Message-ID: <20260617103235.449609-43-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt5645.c | 161 +++++++++++++++++++-------------------
 1 file changed, 80 insertions(+), 81 deletions(-)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 8a9af260e5f7..4a74b90bd3f6 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3325,93 +3325,92 @@ static void rt5645_jack_detect_work(struct work_struct *work)
 	if (!rt5645->component)
 		return;
 
-	mutex_lock(&rt5645->jd_mutex);
-
-	switch (rt5645->pdata.jd_mode) {
-	case 0: /* Not using rt5645 JD */
-		if (rt5645->gpiod_hp_det) {
-			gpio_state = gpiod_get_value(rt5645->gpiod_hp_det);
-			if (rt5645->pdata.inv_hp_pol)
-				gpio_state ^= 1;
-			dev_dbg(rt5645->component->dev, "gpio_state = %d\n",
-				gpio_state);
-			report = rt5645_jack_detect(rt5645->component, gpio_state);
-		}
-		snd_soc_jack_report(rt5645->hp_jack,
-				    report, SND_JACK_HEADPHONE);
-		snd_soc_jack_report(rt5645->mic_jack,
-				    report, SND_JACK_MICROPHONE);
-		mutex_unlock(&rt5645->jd_mutex);
-		return;
-	case 4:
-		val = snd_soc_component_read(rt5645->component, RT5645_A_JD_CTRL1) & 0x0020;
-		break;
-	default: /* read rt5645 jd1_1 status */
-		val = snd_soc_component_read(rt5645->component, RT5645_INT_IRQ_ST) & 0x1000;
-		break;
+	scoped_guard(mutex, &rt5645->jd_mutex) {
+		switch (rt5645->pdata.jd_mode) {
+		case 0: /* Not using rt5645 JD */
+			if (rt5645->gpiod_hp_det) {
+				gpio_state = gpiod_get_value(rt5645->gpiod_hp_det);
+				if (rt5645->pdata.inv_hp_pol)
+					gpio_state ^= 1;
+				dev_dbg(rt5645->component->dev, "gpio_state = %d\n",
+					gpio_state);
+				report = rt5645_jack_detect(rt5645->component, gpio_state);
+			}
+			snd_soc_jack_report(rt5645->hp_jack,
+					    report, SND_JACK_HEADPHONE);
+			snd_soc_jack_report(rt5645->mic_jack,
+					    report, SND_JACK_MICROPHONE);
+			return;
+		case 4:
+			val = snd_soc_component_read(rt5645->component, RT5645_A_JD_CTRL1) & 0x0020;
+			break;
+		default: /* read rt5645 jd1_1 status */
+			val = snd_soc_component_read(rt5645->component, RT5645_INT_IRQ_ST) & 0x1000;
+			break;
 
-	}
+		}
 
-	if (!val && (rt5645->jack_type == 0)) { /* jack in */
-		report = rt5645_jack_detect(rt5645->component, 1);
-	} else if (!val && rt5645->jack_type == SND_JACK_HEADSET) {
-		/* for push button and jack out */
-		btn_type = 0;
-		if (snd_soc_component_read(rt5645->component, RT5645_INT_IRQ_ST) & 0x4) {
-			/* button pressed */
-			report = SND_JACK_HEADSET;
-			btn_type = rt5645_button_detect(rt5645->component);
-			/* rt5650 can report three kinds of button behavior,
-			   one click, double click and hold. However,
-			   currently we will report button pressed/released
-			   event. So all the three button behaviors are
-			   treated as button pressed. */
-			switch (btn_type) {
-			case 0x8000:
-			case 0x4000:
-			case 0x2000:
-				report |= SND_JACK_BTN_0;
-				break;
-			case 0x1000:
-			case 0x0800:
-			case 0x0400:
-				report |= SND_JACK_BTN_1;
-				break;
-			case 0x0200:
-			case 0x0100:
-			case 0x0080:
-				report |= SND_JACK_BTN_2;
-				break;
-			case 0x0040:
-			case 0x0020:
-			case 0x0010:
-				report |= SND_JACK_BTN_3;
-				break;
-			case 0x0000: /* unpressed */
-				break;
-			default:
-				dev_err(rt5645->component->dev,
-					"Unexpected button code 0x%04x\n",
-					btn_type);
-				break;
+		if (!val && (rt5645->jack_type == 0)) { /* jack in */
+			report = rt5645_jack_detect(rt5645->component, 1);
+		} else if (!val && rt5645->jack_type == SND_JACK_HEADSET) {
+			/* for push button and jack out */
+			btn_type = 0;
+			if (snd_soc_component_read(rt5645->component, RT5645_INT_IRQ_ST) & 0x4) {
+				/* button pressed */
+				report = SND_JACK_HEADSET;
+				btn_type = rt5645_button_detect(rt5645->component);
+				/*
+				 * rt5650 can report three kinds of button behavior,
+				 * one click, double click and hold. However,
+				 * currently we will report button pressed/released
+				 * event. So all the three button behaviors are
+				 * treated as button pressed.
+				 */
+				switch (btn_type) {
+				case 0x8000:
+				case 0x4000:
+				case 0x2000:
+					report |= SND_JACK_BTN_0;
+					break;
+				case 0x1000:
+				case 0x0800:
+				case 0x0400:
+					report |= SND_JACK_BTN_1;
+					break;
+				case 0x0200:
+				case 0x0100:
+				case 0x0080:
+					report |= SND_JACK_BTN_2;
+					break;
+				case 0x0040:
+				case 0x0020:
+				case 0x0010:
+					report |= SND_JACK_BTN_3;
+					break;
+				case 0x0000: /* unpressed */
+					break;
+				default:
+					dev_err(rt5645->component->dev,
+						"Unexpected button code 0x%04x\n",
+						btn_type);
+					break;
+				}
 			}
+			if (btn_type == 0)/* button release */
+				report =  rt5645->jack_type;
+			else {
+				mod_timer(&rt5645->btn_check_timer,
+					msecs_to_jiffies(100));
+			}
+		} else {
+			/* jack out */
+			report = 0;
+			snd_soc_component_update_bits(rt5645->component,
+					    RT5645_INT_IRQ_ST, 0x1, 0x0);
+			rt5645_jack_detect(rt5645->component, 0);
 		}
-		if (btn_type == 0)/* button release */
-			report =  rt5645->jack_type;
-		else {
-			mod_timer(&rt5645->btn_check_timer,
-				msecs_to_jiffies(100));
-		}
-	} else {
-		/* jack out */
-		report = 0;
-		snd_soc_component_update_bits(rt5645->component,
-				    RT5645_INT_IRQ_ST, 0x1, 0x0);
-		rt5645_jack_detect(rt5645->component, 0);
 	}
 
-	mutex_unlock(&rt5645->jd_mutex);
-
 	snd_soc_jack_report(rt5645->hp_jack, report, SND_JACK_HEADPHONE);
 	snd_soc_jack_report(rt5645->mic_jack, report, SND_JACK_MICROPHONE);
 	if (rt5645->en_button_func)
-- 
2.43.0

