Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778513D5226
	for <asahi@lists.linux.dev>; Fri, 26 Jun 2026 06:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454551; cv=none; b=NoADcQhRkGbhsHLnLpi8Afx+SKRx37vRgD4cpb4Q2I88G253ZU42rgmj3QYyi/V3+LKQHzHDhox6naPT6/hTU4QCeqtt7JGWMQfzBOpQHiBHy7MrfCAjPjvPRDfWjiQmyNH1okJmd5tsrsIfkl0Aq3bK48iJlSu2kUoUOfFJBqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454551; c=relaxed/simple;
	bh=N1C18VQ6R1+hqjD0MH354ULBt2PbTMy9FMT2BU1d2WY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lv0BulmKRch6ohaDBZlQwC/L7UoTnvko/5ytwoWcJ1BZLoibrgxc94iUz9c9TIQ1nBjpebfaFSGP1SaDt3hQmAqQz1dF0yzp1gqKFcP9aP544qGSt+XBdjkddywAQNX8X3Wi9F8wkASbtlRsLQqcOxra694J+8ex4vb3Xm84Ih8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YxCNL01e; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YxCNL01e"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-37d826e9811so270165a91.1
        for <asahi@lists.linux.dev>; Thu, 25 Jun 2026 23:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454550; x=1783059350; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M3eXIkGzz4V44GsXFfq9IipILWhP60rb5QQ2DRgZ+QY=;
        b=YxCNL01eRQcTFuwQp6Mg4WTjAcbIPAKLnMUJ80RwTVt46aw63IkwMXITHM1DSwv4Yc
         j4lhikaZL+vVnMepGH2LK+159aoTrtd/N18TMKL2s2LxdxBvEtFccPX3XJ0CEGaSaFki
         5aPBQSGKd+s9MNz8aeNKkwV98pbTiZ4L/6XO6qzPBVRqgifWAS5qoEfl6nGnXNty9ErI
         /Mo1n6NWGG3XK/kG6Q0MLT0d8JBfqnAB+XIcAuhP38r6up5P4kuLkvqJarUj4M5jpirs
         nztBOZXq3fSlyfypr9amZaP47eC16qEFlmbBDFBuFeUMzcyfhG8BvPX3U3GIW3o3aW6F
         4U5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454550; x=1783059350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M3eXIkGzz4V44GsXFfq9IipILWhP60rb5QQ2DRgZ+QY=;
        b=e+sJe0lP8AQNdVDQEy83/7/BoAek1UvJ6gwxhDamroce/NmUD6v5dSYHuW+QWaYKjy
         TwsnasfRr9UHPPPpWVlHiIdzskiFYbqkXIzZLPYFB33fAfkWU4SForvdk9mlN1qh9qWm
         xLTD8STxFEAl1BuXdmtWwTTmwoOt71XFKmX2gG5z31VY/dPWK60drh+xsUiu2+KXcWZ6
         fXVAkvh+RJgXgEE9QWVY0hkEtsiq2ALqjjmhmzD/Rzx4bJ616IlwLgtjcmAGFWPtj23C
         zLxn7QdjhbmcJWBWgcbpExmem7tGhNWJov6R/0At3byyjzg56mf12yZ0317haup+zB/x
         fpiQ==
X-Forwarded-Encrypted: i=1; AHgh+RrDD7lpYFTVgcuonyIpLtVDDAWkL/nv4GPm4ibI3g6yI6mBxPvazs0fgxWhHrG5Y/5ri9U6PQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwiiGXQcW4TkN73psEOOvJlhoaQh6Gr64t3Pahe9RlTkrIOxMUG
	/X/SB3Eltlzrg+W8AdZq8HnaiqFlt0fjONXL0OukR0JOIDm/nQILwX9A
X-Gm-Gg: AfdE7cmRVSx3jOe+0z4jXzlvuuM1Ui8luhDYCgXldgQ/RBWRogK/b+btQmJrUhWnuar
	XV8653crqG6ghbkSCg/oi74AQdw6PCWXmW0y8FmaHwRtfsPuYPWRCVxbRCzXqPEgYnDSQ226Cx0
	iXKUtefmnKrWNSP152f08OPrhm+aJXCVg/fyR37qP7Z8hvKnR+XZlNfABPVysVKxP0mvUvXl50+
	eDtA3Z1Bh7KnsvNSlNRt6hb4+Gi3OcOIoB/amZiEusuvVlaeibTRTodQsmnx85zh0GvgCIZkbSm
	o9/HSC9iOA0+7LFlhsjKpQ9AToUGmJ/Om+QJOfgOIE4ENJ8otkysBmPhpXVRPMBJ4YJwkJpBCKG
	7Ct/YgaOyRIhD7pbzkvduDnEgNXGggUDsZpnKfC4xFkqEC+xnR4sTQyhwAMsvK5IlIeJEXRAi7d
	HgDx6UTeW7/GqydW1dIWYjro8mibYKC1gr/Nmi4CURjnHJvc8=
X-Received: by 2002:a17:90a:d888:b0:36d:ae6a:22fe with SMTP id 98e67ed59e1d1-37dfa1d5614mr5298175a91.16.1782454549650;
        Thu, 25 Jun 2026 23:15:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:15:49 -0700 (PDT)
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
Subject: [PATCH 16/24] ASoC: codecs: cs42l84: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:21 +0700
Message-ID: <20260626061329.23264-17-phucduc.bui@gmail.com>
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

