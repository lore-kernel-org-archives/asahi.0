Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471FC347537
	for <asahi@lists.linux.dev>; Tue,  7 Jul 2026 05:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401197; cv=none; b=ldrqNfKA8bjHLfpfLhfJ72EorQDlrsoxO4a4nRMyp+2H/qo9PxkQNVGtW/7lrj+TY/RT+6+l+erwoOtWe/qAJJxkqaaNyeKqqzFZIt1DRwiw8nyuIUlOs1R6Qj0L3PGra5Q1KmGgHNIvtkJTLAsnhT9zSOxfXIpIG3Asfnb+M+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401197; c=relaxed/simple;
	bh=t0c54/72hct8lbrFEg8NJtCjqHP1Kp8F2lBkIgrtZPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=scaJ8P6ps17JAfykuF7RLzZwP7dDGYdjL86DEDglqFBtbzwr9itVrrH9OQ3jD3N0kW4VpUueIZvK2vk5RKqh222QzsyoL07MhRUB44xHp6xJVApi0mDTYQuC3IoZG1XTtqWMn72MIz2BIcOsAgP/J/qfkilvZ36AxD/QLa9REz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bLQv1IH9; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bLQv1IH9"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84783bce476so2716421b3a.0
        for <asahi@lists.linux.dev>; Mon, 06 Jul 2026 22:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401196; x=1784005996; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rMOhkYiBFQ4A6LLL8zx28PZmR8rjf52ku2Lvlz5rAJo=;
        b=bLQv1IH9VnZCRerieahExPJ263xqH7RUT3+c27adKZbISL7gR3eAtHyxSKwm/sU2rU
         BupIC3uKrBqv0wl4F/ueE2i+9onwNVg6sM+OctCFc/AcGFGCQHRSXzrBZxG24eA1KXgK
         q2j2ByiEiyJ+qOuSc+IgDrd9xFpYkukrLnuxzmOKcChoERjfIJkaQGgHFGNsIDqVkE+h
         UudQaFCM0FZTJmaYJv4dOX55KT2Noa2JofjbVChA/G9/Gq2zA2L6MzpvSk6ujAAmIPYQ
         nbsDHkDPVpqaz3pV2ljnjrVnGK0imnuHE/crfuXeJzdJ4s6XPUltE4zyww09u/h1Kj00
         2dnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401196; x=1784005996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rMOhkYiBFQ4A6LLL8zx28PZmR8rjf52ku2Lvlz5rAJo=;
        b=pe1YkNdhTjdlBdWapLCRyj0oD/2iN3xgMo0npi5oRXHE/sVrxLfW7nPZ1XCYsWwSPH
         AvRGD2dQFZPAIn35t2x8kyX+nVnwZnlLBV7oJUVTBT4LVbgMGUlU7BXXtseBLTRjS/qe
         XL/4E0geAwmDkqOd2QmUZX2f/ziB5aa0Qx79ClXg6L3tLvRBDX+Xfp5PLn4oEnAk4Vwt
         co+LrOz7ZTw6RH030LAX8ySGuvvWBMb+kA+UGmAJm0es+1i6yJhw3HI20gYZpgN1eiiy
         QW1++iHsJldkIhtdNkXnPG124c9oSRyg4bvt6A/uSq5e2aOyxWOtvpjaHkTDwYSuyP2y
         DnzQ==
X-Forwarded-Encrypted: i=1; AHgh+RrA/QLoFuQoFcnlx/PcRP+HNakvpCO2oJFQEdQG0NSZYq+PRbfWMqWHCRaas1KEe11IMf3apA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzqyi2JsTUjscFkxOL0YVJcXK+ABD8yaggvTqawzxv7WkxzMhW+
	XaKFDAd/XQqsTzEfR3wUKKV1REp7Didbh6j1JHJ/TXUYZTkqFFQLfOil
X-Gm-Gg: AfdE7cm/5L5ouSqpUzNVEUCTWNzQjErVpQFmByu3IUAg/hG/6qE/ejootkJEqdBrBeL
	HdNTjMcRpuD2Oqc9YhV/Qxk/vfwSr46MX0AKn58+3larHgU6Vqe+cWVekDLa3iEYPgrHlFLLwuQ
	dbjVu6f0SFHdHzpSjbkmeisMMSEK1qr4G4/0z4lnqdk2icVPIfIffes2onW98M2gQC9oNFu94Up
	Qh0BHnw9kqLgTjTHezrBtHbdVttCAN+Q3b6NF925bHyNGLrBqN/irdxlNkAaX5y+UdNSS5ixde6
	kshFl5sDMKF0cjGROhOTFM8/0eyHA62uEdi1aZHwIMyZflsirzks2G4h6EMwu9ogX2/s1yMZKsp
	YeWT7wHk2///b0jdfrIr9dipBjoPSFYIzZpp03nq6OGPXZzleKs3TTH8jPcjoNzwUvwsuRDZgHJ
	k0+7ono+zqduJz0K1Z/B7K3E9Y1F3b+wzxTDLkVdM7B5gcLvs=
X-Received: by 2002:a05:6a00:6c82:b0:846:c7f4:74d with SMTP id d2e1a72fcca58-84826ecc0acmr3396135b3a.41.1783401195584;
        Mon, 06 Jul 2026 22:13:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:13:15 -0700 (PDT)
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
Subject: [PATCH v3 16/24] ASoC: codecs: cs42l84: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:09:58 +0700
Message-ID: <20260707051006.20058-17-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707051006.20058-1-phucduc.bui@gmail.com>
References: <20260707051006.20058-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs42l84.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/cs42l84.c b/sound/soc/codecs/cs42l84.c
index f2a58163de0e..36533a13319d 100644
--- a/sound/soc/codecs/cs42l84.c
+++ b/sound/soc/codecs/cs42l84.c
@@ -10,6 +10,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -281,10 +282,9 @@ static int cs42l84_set_jack(struct snd_soc_component *component, struct snd_soc_
 	struct cs42l84_private *cs42l84 = snd_soc_component_get_drvdata(component);
 
 	/* Prevent race with interrupt handler */
-	mutex_lock(&cs42l84->irq_lock);
+	guard(mutex)(&cs42l84->irq_lock);
 	cs42l84->jack = jk;
 	snd_soc_jack_report(jk, cs42l84->hs_type, SND_JACK_HEADSET);
-	mutex_unlock(&cs42l84->irq_lock);
 
 	return 0;
 }
@@ -831,7 +831,7 @@ static irqreturn_t cs42l84_irq_thread(int irq, void *data)
 	u8 current_ring_state;
 	int i;
 
-	mutex_lock(&cs42l84->irq_lock);
+	guard(mutex)(&cs42l84->irq_lock);
 	/* Read sticky registers to clear interrupt */
 	for (i = 0; i < ARRAY_SIZE(stickies); i++) {
 		regmap_read(cs42l84->regmap, irq_params_table[i].status_addr,
@@ -902,8 +902,6 @@ static irqreturn_t cs42l84_irq_thread(int irq, void *data)
 				break;
 			}
 
-			mutex_unlock(&cs42l84->irq_lock);
-
 			return IRQ_HANDLED;
 		}
 
@@ -919,8 +917,6 @@ static irqreturn_t cs42l84_irq_thread(int irq, void *data)
 		}
 	}
 
-	mutex_unlock(&cs42l84->irq_lock);
-
 	return IRQ_HANDLED;
 }
 
-- 
2.43.0

