Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE1E364038
	for <asahi@lists.linux.dev>; Fri,  3 Jul 2026 05:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058284; cv=none; b=keCFDt9ohKOhoiT3FgRhA1DUYxnDtPFfauE0WS9QIwjQkdUskkWAZhlEGWcvfz2XxFqrJ/vGjnWEbpepqQ+wP+NTQXh7D+eUX6ONq/sT2IQdLBUfafAjJSmYcjD0V2GI9iE9mOq7eu2cClGsSxT+OYClpqwO1H8QIAQ0aGpFP9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058284; c=relaxed/simple;
	bh=maiamEYW/VmulEyBtMYwj0uqdV8jgFn/WOixNWVxsn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gKBomE2mNRTcGE+Hht42JWaGxR5zjabUI9AnnoUeSEOqR9wfZEKRImTmf/WlbuNq9/I9cJphLol+RwKC4wUuDHWrvCTw8y7qUfmWafL6TO2aN4zq/fuBmqsjgh3ymzPDe9OlSLM+EXNV3KG10ISaMsRMLpzhgm2GUJpNmMKwT+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NXOFhIag; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NXOFhIag"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-847aa193d98so148524b3a.3
        for <asahi@lists.linux.dev>; Thu, 02 Jul 2026 22:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058281; x=1783663081; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SX8XmTSnrku861xf5UWM+H3QucQPdKfApxb7WoywOqQ=;
        b=NXOFhIag8Eh8JU8fI1FDDrlizTd5wf9wivdaiBxxVJZXKhqE82xH7eB0q11oA9uzGz
         RT9MJNLnyYAi1wdgw3ltB52l+ZDEZKNNR+gG8A1qkOJsSfgtyTw28n/jG4k4Ro2Sjc5D
         9J5GWRu4gfCFYsm6of0ctPkVvtq5gWuYHvVRnZloIM4w0VXQzGd9vnLyT6Vkin8bWCs6
         NjW28zd6DpFut6gD0FjUkOVKXovD9VAnZxkGeSAw/LYhE2+n8nhA3UGn3nfl/FvkIXf+
         /R6d2/EG+Rx8946nRjncR6sIH0hgiZtCW82384ZOJumWBlFejTINnY9kYWBN9/mcGNMP
         7tHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058281; x=1783663081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SX8XmTSnrku861xf5UWM+H3QucQPdKfApxb7WoywOqQ=;
        b=h6SMN44HYrZLmyp9qHXlFjapGV3zUX1dgEBBmSgdM27BMoKERsubR2L1ZFj7FuRqz0
         71Jby8klGGWtf8o5Xc9H0KZzwqIDO5Uw5eYxJL0DsQz+sW9Agl+f2LZqUCPxLmou9RGq
         M9YBK7C/+WqAhV4QX/V9OZW8bEeXc5dfJh0as+rcyE7qlbVxFjG5yO+ltgilIWOcmEEQ
         O7iLzXzxqQYTnYzf0FRjKpk6AbYlWn8fvmv1DCKmC9JukA/Z06veVurzkntEdri31DfN
         NvYDGeFJK7pQYMUFCcNN0oqRqqlf/Zz0lEu5fetgLYRdIfP8ljRT5nO2EfyPbAHpw/ly
         e7UQ==
X-Forwarded-Encrypted: i=1; AHgh+RrlVkad9DgiG0hRg9c/uX+qbE/F1kPvVdz0L8LoLjdxnoXlbc1hVivXSc1Dkn/ZoEaofV1rxg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxNgcCQ/cA/gj/hvCkBJARLMPvOF2dRLANrhbd4S9PJnFu9MRye
	uEIb/uYTvetSD+ivVtmCNNNb/t5Mb78Yyte3JtlSwxYMaKVZ2tbaCUH9
X-Gm-Gg: AfdE7cnarLqGsr75JXIVQ5+LcjBdWGuhhzyzzLV6G8P4XBAuJD3SRPQDgek2Uc6mz0f
	NDabkhAjyFnnNOpg9phCJXCg+YJHHvHLK+CneXjKraMPO+Ufpkj+mikb3buRTR39fBMrGjyRq4j
	xOELgnzUawfLleQqUzzCRQwJsTQQYmO+P2YJ8xsJrkRF1QWXHW9RWE24Xq48qo4Kkf47nydlzIW
	SZfsZtbgMWDZGM4RwGDus1F/oEzKuexGmolUcWUspxnBs5GqhhGNM8po/ftt6oNt1nAkpikAfhL
	9IyJ2SmkI11Ph6kPAi2KPn+BBF9sOMd/XHOjjAGjx3WliJpMUvfRSeaZrKgsTqhlUvyh4d+SRX9
	DfjqvS3uSm5D8Wt2eNJw0r9zgpXNBZ8Alabud9khhjCTGuoMUw6ESLEgsBw9ENBbJ6JHikJmx8R
	ndGpvQ9ErQ/MPCe3OqQBPPXq9pX5VvAU0v2f1+lvb9R40XwLg=
X-Received: by 2002:a05:6a00:2d18:b0:847:9015:e68c with SMTP id d2e1a72fcca58-847c0703a92mr9190336b3a.17.1783058281340;
        Thu, 02 Jul 2026 22:58:01 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:58:01 -0700 (PDT)
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
Subject: [PATCH v2 24/24] ASoC: codecs: cs2072x: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:55 +0700
Message-ID: <20260703055355.244898-25-phucduc.bui@gmail.com>
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

