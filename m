Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F89C406287
	for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 10:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692506; cv=none; b=ZIAZ+z8ryHymY4pwRVqrvEBwhhUHm1L/FShWnsu0QIyDo243KGRgwKHBpFcSA4b2DBN1uMYbi1fMoKHZ5TW3SlbWQ3Mr+5OpvfTPowUrEExz/87ZU4Ab/ZjNeTflczairnHm++kS629uhum6Ng0E1Qrni8CYBFXeLFMX9RN0BfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692506; c=relaxed/simple;
	bh=bnnbXh/V2n2+AtFO4atogpAp71aVpB96YqCdXUYXKh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JRuIkjYhLs89obonI8mpwgrf8y0uiR66kGHvM0dF7KTFt1PizY0X3KR+nte3q61+4rXu77FR7h9NANI5hnjJBaDDoqb9Sk3THsmtT8wUlqMZjh519wTBb6YFmSGOapIH9Cw/uMtsk2BFMa/ODkJ3hKHc8jIGMfwXbo0N0df0Dyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ix87eyBd; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ix87eyBd"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-30bd7f4fdffso367949eec.1
        for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 03:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692500; x=1782297300; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U1QeGLnTyUL0/QJF0HVH9R665IeUBRSb9Jie1YUIXrk=;
        b=Ix87eyBdNclcxAfU+lNe2PQ8nWxWxuLrK01x0GFXvieg6Tf0Py1EVPuPEY3M4N2R7k
         lKihve/FYhCZ2ujtdXDDx7EFzrl0QS1YS3DtGn4Aqfcgb96epwQIh2ADTnT2dC/n6TtF
         FdoFhtIbxqCs5QckB+f5VpKWzFOKI7p1CqfOU1lL44n3Wk/O41BD9OTM+sW3yGq+Bt66
         8L1bncTR6XnQhlaJsSda24FcDvwBSHoCFgKcdlIm3J8aldp8mphKW5p0Rm1uF0JHZTYF
         4W952Vh8YfwpUOdvE5nKq+kdAELkHn0+SusS/jHAG1Z/ErZapwzQiDGAS6cBZtgbMhf3
         NKRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692500; x=1782297300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U1QeGLnTyUL0/QJF0HVH9R665IeUBRSb9Jie1YUIXrk=;
        b=NZP8DjfRNAMlk+K8cVDSoA77vQIjNncalOY08tuTpyxLXFZVOSt3sD5whof01v1OUw
         p7VNUyBdqpn75oWzGGYvaAU2hMn2QJI3PZAJQpnY+MUc0VK8/9WPyC7qxhMoK/3BGvfg
         uttHgIeuJGHXTRjnDgO9k+pwJaMVgtwTeY+1A3oh9gJNrUdulcqSgCdY2Ps38e3QsT5Q
         DfA6/9GNzCUXaqEnw/q/az52CvJyx7D+k5pe6dHUmdfdmXSOggscHQm+vxQuVLwebgYu
         D55z4dZt+nZ/CBwS2XOORD/Qw6C2ezLr14fuNvXGHJjZUvEMSydkgvJxFmCcL4IVjeIO
         +ziw==
X-Forwarded-Encrypted: i=1; AFNElJ+6STo24AszCz4X9cImsyND8L4LLe8UMdEK2M1HhktgwRgJZPwEGRNNMndK3jWZ3bB3Y2k+qA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZ74njAyq8hd02J7pxko2h4uw4DdkRUQeO/xOftcheimHSeqF/
	taWa3boGJoRI0KaMoXYaFMxAr/5SBMun3aPI+HConQJ5pX4l9tXPnXpd
X-Gm-Gg: AfdE7cmuj+mJt6hfvVg8vIT9Olnm1eiud+pUOwPCZlvwHAr04o4L3QgHu9x6iQnTmoX
	tg/Rop/9uiWjemQg16LJxlQLvty5EIBEvTrxNnep3SHgqAGDPc2lV3XcWzPWtSMSVFS7wV5rSsS
	pAjtzkZlNhwlSwQx7xye7uzw/iL/u+AVt73vm8kbzqk+2DTMmGIF/uxWdIjjlLlLTOlHQdJqJYQ
	QMfCbPb0iZDa9YxR8CuOd+VbGDml2lYPX5/Gd+gkVT8Tz8a7AwCDy9ZDIc/y7rZHnr5RYhakvHw
	UnqWlLHZJhn6X0CkmreiW8vXN4bII/mNMXNieXzXtYdslJO7IYwS/UqyEI4DnMRco2srgaTnWVl
	hCaHRp/qE6HRvkyOf7EqYcWpIpfpX2CSiVP8aGC8ucq59IfHhChdBK2WHEchfNdwkxC0B//gz3S
	Ikx4RMt0g9dYNS7F8rB93kqSBHsuq1jJayiaSYcUqAZltLiHo=
X-Received: by 2002:a05:7301:7c0e:b0:303:f295:4db2 with SMTP id 5a478bee46e88-30bc91d96d0mr1569188eec.0.1781692499885;
        Wed, 17 Jun 2026 03:34:59 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:34:59 -0700 (PDT)
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
Subject: [PATCH 13/78] ASoC: codecs: cs35l56: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:30 +0700
Message-ID: <20260617103235.449609-14-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs35l56-shared.c |  6 ++--
 sound/soc/codecs/cs35l56.c        | 56 +++++++++++++++----------------
 2 files changed, 29 insertions(+), 33 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index f14e2eaaa4ee..6cb835a5aaac 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -645,12 +645,12 @@ irqreturn_t cs35l56_irq(int irq, void *data)
 	if (!cs35l56_base->init_done)
 		return IRQ_NONE;
 
-	mutex_lock(&cs35l56_base->irq_lock);
+	guard(mutex)(&cs35l56_base->irq_lock);
 
 	rv = pm_runtime_resume_and_get(cs35l56_base->dev);
 	if (rv < 0) {
 		dev_err(cs35l56_base->dev, "irq: failed to get pm_runtime: %d\n", rv);
-		goto err_unlock;
+		return ret;
 	}
 
 	regmap_read(cs35l56_base->regmap, CS35L56_IRQ1_STATUS, &val);
@@ -692,8 +692,6 @@ irqreturn_t cs35l56_irq(int irq, void *data)
 
 err:
 	pm_runtime_put(cs35l56_base->dev);
-err_unlock:
-	mutex_unlock(&cs35l56_base->irq_lock);
 
 	return ret;
 }
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 570a68829ccd..98ebf38c9bb7 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -848,42 +848,40 @@ static void cs35l56_patch(struct cs35l56_private *cs35l56, bool firmware_missing
 	if (ret)
 		goto err;
 
-	mutex_lock(&cs35l56->base.irq_lock);
+	scoped_guard(mutex, &cs35l56->base.irq_lock) {
+		reinit_completion(&cs35l56->init_completion);
 
-	reinit_completion(&cs35l56->init_completion);
-
-	cs35l56->soft_resetting = true;
-	cs35l56_system_reset(&cs35l56->base, !!cs35l56->sdw_peripheral);
+		cs35l56->soft_resetting = true;
+		cs35l56_system_reset(&cs35l56->base, !!cs35l56->sdw_peripheral);
 
-	if (cs35l56->sdw_peripheral) {
-		/*
-		 * The system-reset causes the CS35L56 to detach from the bus.
-		 * Wait for the manager to re-enumerate the CS35L56 and
-		 * cs35l56_init() to run again.
-		 */
-		if (!wait_for_completion_timeout(&cs35l56->init_completion,
-						 msecs_to_jiffies(5000))) {
-			dev_err(cs35l56->base.dev, "%s: init_completion timed out (SDW)\n",
-				__func__);
-			goto err_unlock;
+		if (cs35l56->sdw_peripheral) {
+			/*
+			 * The system-reset causes the CS35L56 to detach from the bus.
+			 * Wait for the manager to re-enumerate the CS35L56 and
+			 * cs35l56_init() to run again.
+			 */
+			if (!wait_for_completion_timeout(&cs35l56->init_completion,
+							 msecs_to_jiffies(5000))) {
+				dev_err(cs35l56->base.dev, "%s: init_completion timed out (SDW)\n",
+					__func__);
+				goto err;
+			}
+		} else if (cs35l56_init(cs35l56)) {
+			goto err;
 		}
-	} else if (cs35l56_init(cs35l56)) {
-		goto err_unlock;
-	}
 
-	/* Check if the firmware is still reported missing */
-	cs35l56_warn_if_firmware_missing(&cs35l56->base);
+		/* Check if the firmware is still reported missing */
+		cs35l56_warn_if_firmware_missing(&cs35l56->base);
 
-	regmap_clear_bits(cs35l56->base.regmap,
-			  cs35l56->base.fw_reg->prot_sts,
-			  CS35L56_FIRMWARE_MISSING);
-	cs35l56->base.fw_patched = true;
+		regmap_clear_bits(cs35l56->base.regmap,
+				  cs35l56->base.fw_reg->prot_sts,
+				  CS35L56_FIRMWARE_MISSING);
+		cs35l56->base.fw_patched = true;
 
-	if (cs35l56_write_cal(cs35l56) == 0)
-		cs35l56_mbox_send(&cs35l56->base, CS35L56_MBOX_CMD_AUDIO_REINIT);
+		if (cs35l56_write_cal(cs35l56) == 0)
+			cs35l56_mbox_send(&cs35l56->base, CS35L56_MBOX_CMD_AUDIO_REINIT);
+	}
 
-err_unlock:
-	mutex_unlock(&cs35l56->base.irq_lock);
 err:
 	cs35l56_enable_sdw_interrupts(cs35l56);
 }
-- 
2.43.0

