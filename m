Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46263EE1DB
	for <asahi@lists.linux.dev>; Thu, 18 Jun 2026 11:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781780943; cv=none; b=Kd1iL83Gq2lLdvV0XqTQWjiV7Rfhpyapl3DyFKZ+1id69WPmfTVNJMy0dRDSOAgjAx1Oa1dVdqnfjKquS9xnXpe3NE1ym7JIATjYidtF1ZrEmaVJzGKLXJlYz6mV7r9ic/Ia1BgrUyzOPfZJa4zt0IZYx5ezZUIFnY0uCbrRlSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781780943; c=relaxed/simple;
	bh=3k5ocHDAte/5Y9dBudXlQ2zklcKkxOUMN9JvPLnupMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SF5+wtTEAWNfQ0g5y7eFET6lzaWy9pNnzZb6JsO6MqG/f7Xzs749dAAHtcufMp+ASdTATiwCfIlFLk+w3Sx8lhq9KolHWGd1c590WyivAYhcXP+SdkyK4dXj1/F62BVfQxz35TlGl+AzSVoAe+UKUD6v3hwYaS6v9H7YHbJ0vLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jnSa5PSe; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jnSa5PSe"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c6b67d5fa1so7305095ad.2
        for <asahi@lists.linux.dev>; Thu, 18 Jun 2026 04:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781780942; x=1782385742; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qgwBmSSCggFVLUhXUYpfKHZun58CwgxvexKdy5tq5OA=;
        b=jnSa5PSe1TI+du1g1Z67jp328FLr9sUMpx6L5amXJQCJU1/izl3TvNcS+wCh+Tf3Zo
         GmjiV8zhyJxpmKk48tqVyQ3U2GQIULHeqz5JEDf8Gpyn2eDJ0CgRBBHOx6dKc2d/ruI7
         vVWM9JRAuON4VOWgPF87/APC48Q8zCGHwXZlA5jTM53x30wUw261RtpbFVPSku46wRzb
         ukNWCj2rVt8d3qyJukgJTcBZvyobvX1C0y1rXG2VYQF1Dmr8eKPedaJOCCPJSWJxF07s
         s9fvv++H4TVTPkpRepeNNiAj8jjeN+oD/Z5+yz8l84Bipd/mZauIngdu84BJZJoOB9BV
         jPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781780942; x=1782385742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qgwBmSSCggFVLUhXUYpfKHZun58CwgxvexKdy5tq5OA=;
        b=rJos/q/Bn3+P1f3ThOSnAz11q2/P2qar6gg+p4xj8FIZkxdWBLukNTYtssYRNtZLAt
         7nn6cfsXuCorHxN1fiGj7TmcBY/TsgT/pgyuAMt6CXhJOT0lwazGzLPoi2G5AaK+2tfy
         SCdcmI0VX8WRLADvkcU25bEn4629s59dZvFsjyQny50NZrJ/70081DnOVaeusnryKvun
         AUt0MY/xXj+5DKWL043jo6UNkRIZhU0rKZauIOeI34QJdyKkuQXCTTyOOplo/pfmhDiP
         l6kDBkSsgIlqccXSufwpgLTQwNu1kKExSC85T3X2wNAURcbKHo5dBOGg/b/uwSK15v4C
         FLMQ==
X-Forwarded-Encrypted: i=1; AFNElJ/VOWdCeQ+N9SIHqimxUb01bhcxe7f0+J3G5vVugSnG+8FtatdszQ6ucc+jmxCz/nv6oZiBZg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzKOPO0w7Tg/Gy578AzXrRvGPyNpFjdfGJXJrfI8XvQIP/P9ZlF
	OFjsZVH/HgCUkGgVwe04Bl6b4mAdLc/T05qQzLtg4HTzUvj1DF8lAC0y
X-Gm-Gg: AfdE7cnTEy4H6/Z23ysijSGmQ16VIsPN3KFi/dlmCKfRz1nt9BtYwK2hcNdYm3z59Qn
	blfbFPvo3XVCJhAYQGQz+OfepiYmpsOyBE0T0u3JtayPvve6oBxV9Zmh7OtUCdhpy+Y7ZnT/LcU
	N9cKcNChkd6BrR/tsyr9OBdadW43xcexMFo6u0IjYvSiE+6NqvQriUmIj2rSLvwfhm9hINh/KI5
	4vEixmnlR8en32lEMSZQifsojVMgaz8o96CNIiy81AjGIq8YCmxJ2IMO8oOvjlrdbgolsexupo1
	cv9sC/Lo1+qqE5cj+s1X/EXzI0sif+Qp3fmbt53bCcX2B2NcEm1K9Ztk012TwcfCPJa026Aida0
	mNYk3FSg0wAFh4xCKfgd48hFW+s7nrZttrN/4IBeoMmjpXcq82B3FZ9gXmVa+HGx3jWIe40LsgU
	wwrcxaAo17VEG7aYtE02sx5Ep0tgn5Ap36EE+MW+CV/CrhGnc=
X-Received: by 2002:a17:903:2a83:b0:2c6:ab74:985e with SMTP id d9443c01a7336-2c6bc24997bmr85186495ad.25.1781780942104;
        Thu, 18 Jun 2026 04:09:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:09:01 -0700 (PDT)
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
Subject: [PATCH 58/78] ASoC: codecs: tas675x: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:07 +0700
Message-ID: <20260618110827.232983-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/tas675x.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/tas675x.c b/sound/soc/codecs/tas675x.c
index 6f89a422f3c6..c44bf9144e44 100644
--- a/sound/soc/codecs/tas675x.c
+++ b/sound/soc/codecs/tas675x.c
@@ -162,7 +162,7 @@ static int tas675x_dsp_mem_write(struct tas675x_priv *tas, u8 page, u8 reg, u32
 	 * DSP regs in a different book, therefore block
 	 * regmap access before completion.
 	 */
-	mutex_lock(&tas->io_lock);
+	guard(mutex)(&tas->io_lock);
 
 	ret = __tas675x_select_book(tas, TAS675X_BOOK_DSP);
 	if (ret)
@@ -176,7 +176,6 @@ static int tas675x_dsp_mem_write(struct tas675x_priv *tas, u8 page, u8 reg, u32
 
 out:
 	__tas675x_select_book(tas, TAS675X_BOOK_DEFAULT);
-	mutex_unlock(&tas->io_lock);
 
 	return ret;
 }
@@ -191,7 +190,7 @@ static int tas675x_dsp_mem_read(struct tas675x_priv *tas, u8 page, u8 reg, u32 *
 	 * DSP regs in a different book, therefore block
 	 * regmap access before completion.
 	 */
-	mutex_lock(&tas->io_lock);
+	guard(mutex)(&tas->io_lock);
 
 	ret = __tas675x_select_book(tas, TAS675X_BOOK_DSP);
 	if (ret)
@@ -211,7 +210,6 @@ static int tas675x_dsp_mem_read(struct tas675x_priv *tas, u8 page, u8 reg, u32 *
 
 out:
 	__tas675x_select_book(tas, TAS675X_BOOK_DEFAULT);
-	mutex_unlock(&tas->io_lock);
 
 	return ret;
 }
-- 
2.43.0

