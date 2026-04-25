Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189A21AA1D2
	for <asahi@lists.linux.dev>; Sat, 25 Apr 2026 00:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777077883; cv=none; b=QOvRs1Inzcha+MQl2oH6K/rhG+zzZhUiNqFM+LrbClm4exwtS4Nz9H41YL96sgU0RW57tD+SNX/kMAmQ1Y1CyjYVdIFDQrh/usnZrKVcLrFDhxjmiaxeFq+Hq7zABcI2l1YK0CsDtuv//B//0zo8bG4kTDlkkDjPt3cOxPJyiug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777077883; c=relaxed/simple;
	bh=GZIFJWy+12t4tHAc+/EGv6IOtnm4zthnhcUZSfsEkEU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p4z3fCsUmnpRrLBC1XhYgN8P+RHzPDooIJZMY8Uq3cGZwYEriBGtlFvY+lnQI0XYHkWvNv63/ht8/2z9FqHl1qUMIHo1SayMbCqBiIz9On00YM3tfJAhVRUiw1xbRnOEoLF/xP6RZjHI0GeyIONtzf9ij62ytGE9L0mjShUWbIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XITMHpzg; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XITMHpzg"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82f1bfc9b8fso3873114b3a.1
        for <asahi@lists.linux.dev>; Fri, 24 Apr 2026 17:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777077881; x=1777682681; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LhnWMqX0OboRHjbC1C9jxSbtj2tKGC5mQL6hqh/ROpo=;
        b=XITMHpzgVTHSj0GP2MWqdnfZtfNTtpY68eJ1nc5lZKpSGI5f7OWYoQu9d/4d84vDTj
         hhHmbGlpXd48ET47q5C4l0H/dOUmjXtkxHa88pLY6OoJhmP/SoFaTlTy63s75zWoLsyn
         C3KqH+KLeYIHSBxJG9GrJDGfjJXg7ZWNCzoJHBIy16cgSGwC8amZGurw9crKnZJgWdy8
         MU9kl76juXmIk35V8cdx8eH5E3z8X607Dys7CmJ+A1FVHsDl6iqB1Q0fOJJh1FWXVdsG
         oIKfQJjs7EtlyPLIyUnkW4CzCMGEHsoVQuVHW9zzgfZqg7h7+RpY1kXhTn2HuzWv5/8m
         obBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777077881; x=1777682681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LhnWMqX0OboRHjbC1C9jxSbtj2tKGC5mQL6hqh/ROpo=;
        b=J/ld1YJhzTgWmU/KHBzTlL3a9FVYdnbafO7FxejeRQmKSxNgk1FzOTug+EKlZymyQA
         62ExXDm28SmvL79ws9mCOzSItW7Sok1ALMQShXcZHeWT5p+SU3rg1KeAwAd49Amw5fZm
         G+6+mEpXQ0FgNhcpiiPgNrejiwu1CVDijgYIlnvoGqJh2aaKGL0Dze7CD05JFxhz93Bb
         i8R/DYdKRcEiY3ddl++rhLeeZJdGk4MXGkjtdMQIq3QxSWcG6gFc6VQ0V2ZsHCIu66B2
         CjNk1IV94m1AbOFkQ0wD94fAW8RCOwJGyONOCk3iFFqbqduwAhXcjqFtqjI8hRPKg9+W
         su4w==
X-Forwarded-Encrypted: i=1; AFNElJ/jkb/LfFGS7Kc21Wu4Kgo4KI9s37dci3c2sUYw7Uxf81aby7+YOBaCodRbGVustpRcn/nKSQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3Onkat+1544W/cnp3Vu2tA2P/+GNX8825qjykzMBXzU8azTaB
	20oniOtcjgga09x0tZP+qFdWLk0fJU8h28Z8ik7I1929cNkXlHU8Inl/
X-Gm-Gg: AeBDievYTINT/s9waFrEj6jUjR6EO+FbLxLMKVcA/kJPxdN/i3mbZWGdM1lVEgsfTlV
	YfZ/Zc04JrWneH/JWHGnFnh6zZjKHQeMBf22hl3t0vIdLNkkp7UtSR2iW4mB+FI1VANvZAtQXxf
	jGaWbFme/2ZD1fM6b3TtXC5x8KT2c+JdMLOavB25eWLi0v1EYj8686bLNLtGSLn9ZVBsNXStXVd
	+ZYq4UR0QDeIDGp56DpZ+NkmL/JLkm8OyQtztCLAI9GAvSY1vYow8anHkCsczsEeQoB2EXP/KvI
	lYzjfZEnDchyBUFC/mJMcD3M9UyMEyzp3wsvJ9KaHjCgw4ct9mu6q72TlzMXHX2leQCbqELZ9L+
	A6KlWoR+8UMokJ139yM+tXjM8iQ8o0MRV0K4A5nNqfyPoVCFGifzefVhipEBPyOZ23mHV4KLLe/
	k/CUBq8oHxRRAiAetRtxD/g7tObg8TrK+ortwy1obeB8Cy0yy9+o+kgvmrMa25pbWYLBGtWho73
	s28UHnM2l5MWH19k+raUP/PM8VaqyLuIg25j5XLNTdl6ws6YSsjmY1vJeC3H/sjSSniVqTaqUU6
	OHjGa9vgqw==
X-Received: by 2002:a05:6a00:1749:b0:82c:d7c4:4c6b with SMTP id d2e1a72fcca58-82f8c81dd75mr34959022b3a.11.1777077881389;
        Fri, 24 Apr 2026 17:44:41 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec0566dsm24948385b3a.57.2026.04.24.17.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 17:44:41 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 25 Apr 2026 10:44:05 +1000
Subject: [PATCH 3/4] ASoC: tas2770: Fix order of operations for temperature
 calculation
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260425-tas27xx-hwmon-fixes-v1-3-83c13b8e8f54@gmail.com>
References: <20260425-tas27xx-hwmon-fixes-v1-0-83c13b8e8f54@gmail.com>
In-Reply-To: <20260425-tas27xx-hwmon-fixes-v1-0-83c13b8e8f54@gmail.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1698;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=GZIFJWy+12t4tHAc+/EGv6IOtnm4zthnhcUZSfsEkEU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJlv+FIOWK64Xa8ne6mbjW/P/okXW126NVIK/FU+Gbst1
 JAWE/vXMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmGrnzwy/2Y84r6772Boh/KBWcDPv24S77gvutnhMamc+yBL24aPIKkaGHvPl5jf
 nzWo5fNL5fVKC1L+qz3oOtZs6BNSOfC8K/H2JBwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The order of operations to derive the temperature from the temp
register values was wrong, since 1000 / 16 is not an integer. This
resulted in the calculated temperature value deviating from the
value represented by the registers slightly, which was most obvious
when the registers were zeroed (-92.265 *C vs the expected -93.000 *C).

Scale the reading before dividing the whole thing by 16 to correct
this.

Fixes: ff73e2780169 ("ASoC: tas2770: expose die temp to hwmon")
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index d4d7d056141b..50501bcbe916 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -624,7 +624,7 @@ static int tas2770_read_die_temp(struct tas2770_priv *tas2770, long *result)
 	/*
 	 * As per datasheet: divide register by 16 and subtract 93 to get
 	 * degrees Celsius. hwmon requires millidegrees. Let's avoid rounding
-	 * errors by subtracting 93 * 16 then multiplying by 1000 / 16.
+	 * errors by subtracting 93 * 16 and scaling before dividing.
 	 *
 	 * NOTE: The ADC registers are initialised to 0 on reset. This means
 	 * that the temperature will read -93 *C until the chip is brought out
@@ -633,7 +633,7 @@ static int tas2770_read_die_temp(struct tas2770_priv *tas2770, long *result)
 	 * value read back from its registers will be the last value sampled
 	 * before entering software shutdown.
 	 */
-	*result = (reading - (93 * 16)) * (1000 / 16);
+	*result = (reading - (93 * 16)) * 1000 / 16;
 	return 0;
 }
 

-- 
2.54.0

