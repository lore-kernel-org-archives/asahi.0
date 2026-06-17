Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5912944CF29
	for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 10:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692533; cv=none; b=frPORXr3ho6+vkBeF/Ukq7fb7lZZgn7xSn1iqnsHvT8Bf1sdx2itBw68/s+BybVEW38KHYct3BD/8klBE4DddR6nlgr3RFdz7LWmlt2nqqUIjjnubw/zXz1hXZ39jgqXYDzwjZfx2qEnzo9ybPTxnfPS9bKbG5hR8rIQg0Aa+es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692533; c=relaxed/simple;
	bh=ywyecjY5IPnCpFu8t60JAxjAocTPdOv2KzNz4XTlQY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iwT7y98Fcx8/7++drPwcqBP0QmI3fM8ZFjz9t4ySM0BRtjL+kQOu9JY2sfvR2dNRpyFblmJK1U3NgEuoMJ/lfpg0QKM/jJT7Ekm6HTdQ8q+68QfHJe/Ip+e1vH8ZIUUESKSSo8XbLKofslecrD/gHu5TWF+/akPn3nRmpOzN3v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yys2Owoa; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yys2Owoa"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30bc806fcf8so1067196eec.1
        for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 03:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692529; x=1782297329; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgQKBXBVqugKEAIaw6gam4xuekLuGQC8Pf1ITJyu83w=;
        b=Yys2Owoa8DAKKtqGgMHYXTkUlU7YsEDq2G/ryIxzoyE22hP6Pw7zcnx34Il/xwDMFU
         LF0MVGPP8G6K5kzab968Pvkl7FBOkAnIkCB6nI49nwwo7n8dQu4f70AlFZYcI6gliTnt
         h5Vfg646ep7xwpTM1Opz5j0Gm/MniR6QTiOsebGpsgacZGio5W07TrZECU70wGMxUUwi
         hLFvs+73qRjiIxlMn/xxVgsg5J8isq02JIzecZAAQMCbhSrI2/wwFicRr2yhdDL8PSWy
         30HXe2AnhLkU/zucSGPNoi1TtwZaoSxd9wF2yEBb8W6m8Sn4TNwL/CzhgwlauY287xcS
         hp9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692529; x=1782297329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HgQKBXBVqugKEAIaw6gam4xuekLuGQC8Pf1ITJyu83w=;
        b=btrPnMc6GvMEk1mAdH3tukgkVOfGiNT5cMvtBA3Tuo/LQagqhHGLM3YW1I7Hecqb0f
         QRxjU4PUawYOf1lKIE7UiHHAQ9VKBzXoJIbkvXOH7lSBrnpflse4Ky0a4z8qZHDfpOQZ
         pL7ck66SGfk13unf5ArsmtDpHp6ZlhjMOmgHFCoZq47vBkHNpug3zUeGTwhBAIWYXYzE
         kLCHdsHvO4MJT4Xa/TrCRuh4gltG+3eWgJJWVTPCPXEBkfN3PB9ieltcC+Zy0twsXqi7
         fp6zqYK2oOY1081SlGmOJv6NcGHBfNJQrzcPOIxB4vzhK/H5g5bDyf1VodgDJ3zCNAZw
         sUGg==
X-Forwarded-Encrypted: i=1; AFNElJ/hwAShsEFbF7SFhVETLr0ihOv6C9PePTZ7kQ1OCXEnzKKlJASpiZvzIN+uANLd340w4UlYxQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywi5u7jkIGf+N4x58sZG2tGom6xR0Noc09qcaHzo7OuS/lH+zSg
	B97t5M8R/637Df29MxNa64nbXCbSz6wZHbMzgYGD39E9+Jpg2nMoLK4+
X-Gm-Gg: AfdE7cn9H/MgAGTe0aTfdt3wQACRYM6u84cUB/fjxfPqe/axfwJNw0THIgyVJmsF+y5
	OaSQi/3+xIYfmz2p29bGqQjKj6l6y9egjZADQk8NzIFBj/7/UsFNmqDrKWUUtacLGiMiZL5k23m
	YAsLKYq1XxzTHgswiTRxZqz75EXKz0AvVqSIUrC1nEtHCvmx71sb13giBj1Yedk6CuUV3bdB9+2
	g6KckqW2SDUrm4KfRnXQpxHDoTyE65yHro7jd0eZbz0UAnaBUM0XacUlv7ahIVbOfMTfA+3KkLG
	BAncgdFKA5PYg5wsRzegQwbZpSwsFITxr/jcAiBmc2NpkhyJyun9ZrvABLZAMizEsDvSbRAyzMM
	t2jPnfz8BIu9MYY03fUeC2AK9ZnHMFzrBwhS7uYhEyMe8fjU/3td/LwSSf0v/D9W7Oni+9e9v10
	vY6D1HAsmfzhjgY1jmPqAfdUfBohyCSQTKDWYVCdQWqUrx3JE=
X-Received: by 2002:a05:7300:6dac:b0:307:91f5:92e2 with SMTP id 5a478bee46e88-30bca90bafbmr1658562eec.4.1781692528915;
        Wed, 17 Jun 2026 03:35:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:35:28 -0700 (PDT)
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
Subject: [PATCH 16/78] ASoC: codecs: cs42l84: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:33 +0700
Message-ID: <20260617103235.449609-17-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs42l84.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/cs42l84.c b/sound/soc/codecs/cs42l84.c
index f2a58163de0e..a212f6891b40 100644
--- a/sound/soc/codecs/cs42l84.c
+++ b/sound/soc/codecs/cs42l84.c
@@ -281,10 +281,9 @@ static int cs42l84_set_jack(struct snd_soc_component *component, struct snd_soc_
 	struct cs42l84_private *cs42l84 = snd_soc_component_get_drvdata(component);
 
 	/* Prevent race with interrupt handler */
-	mutex_lock(&cs42l84->irq_lock);
+	guard(mutex)(&cs42l84->irq_lock);
 	cs42l84->jack = jk;
 	snd_soc_jack_report(jk, cs42l84->hs_type, SND_JACK_HEADSET);
-	mutex_unlock(&cs42l84->irq_lock);
 
 	return 0;
 }
@@ -831,7 +830,7 @@ static irqreturn_t cs42l84_irq_thread(int irq, void *data)
 	u8 current_ring_state;
 	int i;
 
-	mutex_lock(&cs42l84->irq_lock);
+	guard(mutex)(&cs42l84->irq_lock);
 	/* Read sticky registers to clear interrupt */
 	for (i = 0; i < ARRAY_SIZE(stickies); i++) {
 		regmap_read(cs42l84->regmap, irq_params_table[i].status_addr,
@@ -902,8 +901,6 @@ static irqreturn_t cs42l84_irq_thread(int irq, void *data)
 				break;
 			}
 
-			mutex_unlock(&cs42l84->irq_lock);
-
 			return IRQ_HANDLED;
 		}
 
@@ -919,8 +916,6 @@ static irqreturn_t cs42l84_irq_thread(int irq, void *data)
 		}
 	}
 
-	mutex_unlock(&cs42l84->irq_lock);
-
 	return IRQ_HANDLED;
 }
 
-- 
2.43.0

