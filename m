Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C223C3FF1AC
	for <asahi@lists.linux.dev>; Sun, 18 Oct 2026 05:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792302941; cv=none; b=boaCsoYCBb6EgNfbnicb9xeXeTs4l73jpvWLLDDNAsL4kQuyUootH0D4M5cBHGJdetjmonBtsp0iDTXS60a3utvfBTTLSOBEHvS3Epoqvh56mvtL8sm4I9Lv000EeED7LdFZTf8fICzi3F9qO3/KEGBDWLqVdZB1IsB0/geS46c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792302941; c=relaxed/simple;
	bh=9blMBWr7YSyHeQmUBs/7VgENlyvjO/n7aari+GuU1zA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rFCcCFuaY4MXWqVkcCp/MzlqoO8B3cqdM4dkV/SWw68EOzyONPg0qFEJCD8eSTh7Cfh+szGGg9Pud08kGhqTdPa0CAiPtzf9HGiZZNICHEVgqsDYATgZOnfLGK586dCcQb0QVdN0HVioilsAyduuEZtilxQ8W+5XXgqlmkbN+EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WwNJ7AFL; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WwNJ7AFL"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ab98332238so888953a91.3
        for <asahi@lists.linux.dev>; Sat, 17 Oct 2026 22:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302940; x=1792907740; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oG7xpTf+2B5oFo7T4YVD/UfNfM1JDvvTcYxZXQ4liDI=;
        b=WwNJ7AFLOBhK8DelPNsoP0T4739MZBkV20aoDRa0AviZYB8IValr4yBk1R5O8AgbIU
         4BVllOBBb5xxso6d/snegimicGqbizTCwk7lWwsxtD/VrIJRxTjJhp4Lp8ncNb41d3zL
         dbSXwmti0fHaOQySjPtvtCkQecnB09fchguVTJrnbDcm/gOZi90M9vVKrRtUd5VdMCXF
         Y3zMrf7R4AG6Db4xVMlJtelKqmASB4Qn8kUJ+Zi6Bt+DzEOoE1dzWv3SiR4ihMpAntCT
         pB5XR0jEXJTUUHd+XYzAb6FfV+8msE3TPEC5HWVbu/Qw6TyUFUtGFgeY95MpWhOneitc
         +RuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302940; x=1792907740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oG7xpTf+2B5oFo7T4YVD/UfNfM1JDvvTcYxZXQ4liDI=;
        b=Y4YarvAY4eFmll2IigNWJIIGjFMiEt6cIGmhuXahjVdwy39tyBSANyZfSprjKqFw+C
         uXBS66PWOTjcE0Zv7Ia1qM+rWDNBiyOJKNufu9olkp9C5c2muSU9vV4dmkwjUu5w2hF/
         F0XyZ5sJmW3zPVrmnsJ7TlOWhDw+lzg/rtYp3KW4/y6AosHg2EjXqeAshUDu8o1y7hUs
         31RwMH8uNKdkUaqe7qVsSVqknKzCtMdY4sEay7tV5BJcDZBf29ci5F5ZA/hbtFjbpF/Z
         dEzjQSsZmBxwpP5rpGRAlwJMyBJ/jbmoFG7SRx1P8+3b+gM9KqhD6gTySyehU/FIfR7x
         T3gg==
X-Gm-Message-State: AFq9FYJiyQ2QK5Gx4wgLLPDs3LlCtRQv2JQLMf5HRHUZzdldNII00nmJ
	gJ3u58tHuP2GIlvy91nZQ189s//DotLgI6jv9QfxCtRJV3Xzc6/BfcFS
X-Gm-Gg: AYBFou2GTWq5JFHbpwlaKlvT+ATRa4inKddPSxm2bz4D6ZqFesu8yCcsV45dnHRgYvC
	zM5B0XKEtwEkEcWNZngp1rrC0627MPuMX7gRzPRDhsvV4i0kPozMzV2SVCPIH3pMxc59REWlrDI
	X62Zbsb31YUVMX6mW+3dn7GG4COAHgrqTITXuIolbWjbpUQxWTC8ecUxJMAWYHSteSyzVB3cOXh
	g1OkcEIsUVikKTK7tFdH+K5RNqZDsK3zInwN5JZY8wtXmZEE/bCwmi4HFkU1Ias0p+KL8HgRmQX
	q6o7fYtnvslmoTehA0niZ1KubiGvP8aT/3JlJAX/qINuAocqOeRkPqG+GJDS9Y2FSQ0UmRV+aoL
	0I1mXBP1rfH3ZphrNuM6ySz6yGtYxKvYSpTxyZwz51HUhSjAjfjxETWw8lkAbQLz+QoK/hWcodM
	lPWk4jq3PKZ886wRXQ8VpRHav+w0bozzTCqOBw3JUiQL0GhVzb+42QhUdwvktxfrDbozdnbuazV
	s+D56JULo8hY/ssCTdhp+hi1uXH/+m0341uWaYGqxQEqaepzH9OjO/5MngdJSUui18CI9Mgqeor
	+WNX7BCdy+egltgNsAsxUtWKCzuWI+82v2wCfa1RuHfSJIQ=
X-Received: by 2002:a17:90a:d446:b0:3a4:e735:b39d with SMTP id 98e67ed59e1d1-3acef603b1dmr3522678a91.64.1792302940213;
        Sat, 17 Oct 2026 22:55:40 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:55:39 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:01 +1000
Subject: [PATCH v3 07/21] ASoC: tas2770: Add compatible for TAS5770L
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-7-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
In-Reply-To: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=758;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=9blMBWr7YSyHeQmUBs/7VgENlyvjO/n7aari+GuU1zA=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4nnc7m2aKqH0TDBh9iuOyj/7pF3478Srb3rG07en6
 mJ/VbJQx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKrzzjL8s6yU1a66u2PRM+OLheZhW/a1Hub/Fv5y14fNKn+KvT4+5mFkODrn2ZI
 8QaFFRdVFE67HGHSc7Zm03eRM7jZDTdv23ua7nAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

TAS5770L is an Apple-specific variant of TAS2770 found in a number
of first-generation Apple Silicon Macs. Add a compatible for it.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 882e19857697..5dfddd3bd049 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -978,6 +978,7 @@ MODULE_DEVICE_TABLE(i2c, tas2770_i2c_id);
 #if defined(CONFIG_OF)
 static const struct of_device_id tas2770_of_match[] = {
 	{ .compatible = "ti,tas2770" },
+	{ .compatible = "ti,tas5770l" }, /* Apple variant */
 	{},
 };
 MODULE_DEVICE_TABLE(of, tas2770_of_match);

-- 
2.56.0

