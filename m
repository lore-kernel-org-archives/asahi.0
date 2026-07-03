Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27A823BD02
	for <asahi@lists.linux.dev>; Fri,  3 Jul 2026 05:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058212; cv=none; b=UDqW8rv8ZzidmfHYqKg+sMl4XMIJyq0NmzYGTlegszOQOMiAx+ttHVZtsUehdOewlljkIs7ZPYmNC1qm1TMYDnrm4hKej6cbf1rJBgTy23SEBdt2zvzkkRsM+Ss0Q3cSnkCro6UFWE8MqOyWqeMY4+k7dFKm/GnFgfhjn9TEm+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058212; c=relaxed/simple;
	bh=HbOHFEkVn9KxWh1SGhBz476YCbiYB7ab9omeOvLq0YU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VY0n2TIvvQJuzvSgnrcLx7wyO5KyKBFdVTHPGlS5zEhRAfG1ViwDK71MSzmaz3UVEehC/jqbQzAMq2fHoMxZk19JIpesOiH3heI3DjfiGgucX7geVNgJzyhHt8bfLm2kqhMeMjsSLBQW8RJgCDByPaT1yK0xxbYIztd1CwoJe44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bPWlYZcp; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bPWlYZcp"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-847d1e9db22so215159b3a.2
        for <asahi@lists.linux.dev>; Thu, 02 Jul 2026 22:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058211; x=1783663011; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WXPhXcgFqmptPuS82JbIjuwkPdAg3FkVMAuXoE8l6vs=;
        b=bPWlYZcpWGjpHfc53tg01KF69I0+5UZJ0YktMNqaQEnZV1ahskxeWlbq2+RjcbOH4s
         x4ct/x4tWnDDGgoius/wBw7jzeXTVxfgWlgGYMkBlq7nhk1dPzmVUokoi7VSRqJrPjuS
         0DJZNhvgUwNFqNY5Ntz7T359V1Ho63OFbBW+zt5v9BSS3Lyv5/ekwXoSD3s33IIiU0JW
         XnFWhfJYMALe9A4g+y69sm2W1cLfuGe71e0wyY30+vmTs3oAQyismMWkz4sDecgjhH1j
         sl0TC0dPKyhYTbQVgApwMyhodNQw7s9DsDUfKuYOQZI81QxQvqSeQzNM6pwyJdfz0ajq
         R3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058211; x=1783663011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WXPhXcgFqmptPuS82JbIjuwkPdAg3FkVMAuXoE8l6vs=;
        b=W4EYto2vFu3NadlG8gSu2syhIw2BkraeFT1y/FLBSce6QwaiJVgjmEXrl7atn9diV/
         pBTd+1ECBiHrMEdtRFf3lbRh7fYdyCXN6Q4ILrQUAXT9WQ6yHHJOSVHCkGaFWQGiR8rU
         2RJ6hyGawH1Nqj7ae4fnU6gW9YvU97S5iknekuEkyo/82qU5Xc7/Y8Uy1jkjbkgzGfvB
         CE+6BGArPNdeMCfJ8sWtxWCzFHYLAtEYXL9S+tmsu3Qa6kVpB9ULYtB5aZFAjmUEbO/b
         /dOURDw9VFHz3LJAiOKs6cuiZMYaBlivWyyH+4hMZtUQr/UAxhQNbqEfu6d6H0dtXUIm
         qa8w==
X-Forwarded-Encrypted: i=1; AFNElJ/D51y169hHUqerYV8nTuMWHCyrgF98L+Sq9Mt3p3Re6YRVCDHpnIebhCzX1bFv2u7LmVHjAQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzWV9CjJ8KerIK0SOJBr4CBMpjPZM/Xs5LK5ZaDYaGXmDetiY+2
	zwZr7PwPSY5nLQYuLPGX62K7dmtNz9O8SSU6FqC4DRsY8xLV4seQ9GBb
X-Gm-Gg: AfdE7ckHNAKUG0In7e94ZPyFLzF4/55SCVjVpMkZaUOwFvDv/1umBVAzBaocXU04BbW
	sNmT7/baAbqrM5UxgYpx35fWetzesp9UHfN0XivQTg4vf+3Fokb13US/BTckrKyzE4504quDsT5
	dvNeFn2LPNd+w+NpFaHpAhEHx7DP/WxYCwdHINKH/4gTWUR995Q9d3NMsChcYzufrec8miRJybV
	W21+zvyX8W7fViutqZjw/IS4VnHwCnoAPa+AD1pheWRDjY5sMrpzFeJT7hUrK8eQlf2F+KLvcW5
	EPK9mG90n/cKZVkEgwT/41zA9JJfpT8ECN082/XGwW5cQrGx9lv5Cd6eOx3QBbgpE5ju+enrSrl
	3MBUx43yzeStk/hKdNTKwmBFvy2NEfQ1j+EzN1oi9qYUonE7Sj2Lnx22SuE+W1JVqBIe26OrRj+
	xehrsUNT850X4vcO/v97ug0NEEJ60wel0FbJxahif46dx8NQc=
X-Received: by 2002:a05:6a00:c93:b0:847:9bdb:2cd1 with SMTP id d2e1a72fcca58-847c0aab1b8mr8629441b3a.54.1783058210821;
        Thu, 02 Jul 2026 22:56:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:56:50 -0700 (PDT)
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
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 16/24] ASoC: codecs: cs42l84: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:47 +0700
Message-ID: <20260703055355.244898-17-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703055355.244898-1-phucduc.bui@gmail.com>
References: <20260703055355.244898-1-phucduc.bui@gmail.com>
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

