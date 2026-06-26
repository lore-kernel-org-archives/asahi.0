Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DFC3B14D0
	for <asahi@lists.linux.dev>; Fri, 26 Jun 2026 06:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454593; cv=none; b=XsNMGt5qrquw28qyJGkLiLwHe3VonBK6uUDfrBQQInBAuK3y/aFvbCqy9K4G9L1dHkXWPT2H5cMLLyUS3haG+DC59Q9toKP0lorABJWXh7N4Mtv9glRdrAYaJptymGmB5Q1o0VxiMC+GnuYgdqqtsgo74KrUqj3R24zUvZSVVz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454593; c=relaxed/simple;
	bh=maiamEYW/VmulEyBtMYwj0uqdV8jgFn/WOixNWVxsn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=faQx4GajFmPeFsN9/+MgdYWazFlyb1/kvLqoB3P9Ld7pWir9RNWbq31SzZRwF3mTztFpvO87oPeB2y9LLP82rYz41yHSOjkW60MuvlU3SA3wOfvT80xo/ZElhOrknEn+sawBkvUV+L39gRQ2EcShcxkVOp7Y86K147jUacjtv3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LmvSCPmC; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LmvSCPmC"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-37deb2d3a82so397924a91.1
        for <asahi@lists.linux.dev>; Thu, 25 Jun 2026 23:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454591; x=1783059391; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SX8XmTSnrku861xf5UWM+H3QucQPdKfApxb7WoywOqQ=;
        b=LmvSCPmCaVP1Hx8YvqNblUgtEks0xB0oYyN16rAj3tGn6DAdU5dmiwGbaT/B5ELYuu
         ld5HEdZvloE3ni4Jg7FpXw1VmSjrKwcam31we2tc5+TIfrlzbyNjDCLlAySzry1BMDjf
         P0DgwkJtxNHsyAzgnqIsF0IN1GyaHfTKJzLQO4Jv9B+J4jMvxEYuqHgTf5PSwF4PsTKh
         GkzGKC9OR7lRKUT8N0gRUlwNp5qp5u2xqbCODePo5apCYaESqLl47fANqdSYZXcluHRe
         q+Ih91B5dDxtRL55JlEX1AaZdS4jH9WqaeNcMeR6cfwKvMZag/4G886sZn+xOwaEk/mq
         4cjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454591; x=1783059391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SX8XmTSnrku861xf5UWM+H3QucQPdKfApxb7WoywOqQ=;
        b=swZ0SDq8EnvaYu68lxGwsIXRBPpJlOY2S2eiBTfnP9Rka51rwuqMTKgbt0732Scc21
         5F2W1jTvvjkEVvtJO4ThUH8bTJsSIN27m9Qg3wMGyOJfAW1awUSTXkPoL7BBPXmNL7Us
         qIW6Kw8D2KWvTcse0XIuLOgX0fafir+4upuC3IwwSn3OqGFzKQ0kTXOQznplV8C89W3Q
         BotrxKLSqJwBektWjUPZTf3rPpsdA2/gZqdKw69NaNzDa2NzofJSFgkSrX6UY9iaztCo
         5KXPJDThQGEHyNDQvrujIsyrfXdD661oLA2IaxziSDA4BytuIdfZCbBglosPwe/kNn50
         C2yg==
X-Forwarded-Encrypted: i=1; AHgh+Rq/qbzeEXTNSEaUVLwds25knr1Wcwi2cwiz7Iu/fyL0y5ivFtVCMZzFqXffxurOMv4uzT3qjg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5Sa41n0Lf24GgiGXrvUUfBKCRepDHfnqYCYlyjN/ChRsVo76Z
	vEa9S18NCZZjYeCFsyqMvs/FbEgJFjmcvcUoxcwSk91YTtFHApOEXCOR
X-Gm-Gg: AfdE7cl0hKtM+zAkvzrLpvXjmf5N2lBe4iIFPGiVVvDhlpM2iOCJ6ZGL0GAcA3tG8MW
	eszmIFrCO0v4SFh7KE8Mdh9fx6EU1QwmXubQRgTkuRpRdHV31uvjABrk60fxnw7zsnKcV39S7QU
	7FjnxztPwpuUImc67GeNhCPCjLmW517PwlUqrAUHMVYI6qLzMu4t80jxgbdvDWtpN1xNEtMyzvR
	0/TBQHEs/Kc4VkIsyuaqeYgCNmG7tqNVZNZvFGe6dg6STHB/03ULK4GoMgaMfRTQXwpqXFNZeOo
	z84SXC9k1E1jEeG0mdzMb6FczsPcwV2jkAsbjH1DBqb1fGfKde012teNvp+pCGFMEkG2xCFjzl0
	gUY2BUaxJVLa0Bq/albyx2PILybDjKQQW78j3CmuKPtGAMlqJaCxDxzEPmwEi/bv2KPWKDhvSSD
	5jBr+E9j+ERByj6VC2bveNjo/ycnOtWWT4ucRHWmlvwSp/xrk=
X-Received: by 2002:a17:90a:d444:b0:37e:2a6:8cbb with SMTP id 98e67ed59e1d1-37e02a68d34mr3887125a91.19.1782454590646;
        Thu, 25 Jun 2026 23:16:30 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:16:30 -0700 (PDT)
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
Subject: [PATCH 24/24] ASoC: codecs: cs2072x: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:29 +0700
Message-ID: <20260626061329.23264-25-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cx2072x.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cx2072x.c b/sound/soc/codecs/cx2072x.c
index 83c6cbd40804..908344ee5892 100644
--- a/sound/soc/codecs/cx2072x.c
+++ b/sound/soc/codecs/cx2072x.c
@@ -9,6 +9,7 @@
 //
 
 #include <linux/acpi.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/gpio.h>
@@ -1408,7 +1409,7 @@ static int cx2072x_jack_status_check(void *data)
 	unsigned int type = 0;
 	int state = 0;
 
-	mutex_lock(&cx2072x->lock);
+	guard(mutex)(&cx2072x->lock);
 
 	regmap_read(cx2072x->regmap, CX2072X_PORTA_PIN_SENSE, &jack);
 	jack = jack >> 24;
@@ -1434,8 +1435,6 @@ static int cx2072x_jack_status_check(void *data)
 	/* clear interrupt */
 	regmap_write(cx2072x->regmap, CX2072X_UM_INTERRUPT_CRTL_E, 0x12 << 24);
 
-	mutex_unlock(&cx2072x->lock);
-
 	dev_dbg(codec->dev, "CX2072X_HSDETECT type=0x%X,Jack state = %x\n",
 		type, state);
 	return state;
-- 
2.43.0

