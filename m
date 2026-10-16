Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CB8477285
	for <asahi@lists.linux.dev>; Fri, 16 Oct 2026 10:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146862; cv=none; b=aOJPZbpe+WcmC2uN/u1EXZZuFJIolwIIplBdVnXAIU+05Z83z64YMoyrnXZyC1rJZlElImRiX/WwYOqbnWHOJCI6KU2K+xeNFXD9MMKV1hIO0jxIuzbMDU0P/9xgidFvci2NCqPPfBdSxLI8Th0/d524KjZnDWckp4kepjr5N8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146862; c=relaxed/simple;
	bh=CocjqBK1bf5KCvJSo6fMTgVPCgDyzqgdFwf2wui+jZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rqk//OB3jX9NYPyKQZ+bUeVR1gCugU4fpvQruX3q2vr9/P1Kgvv4ddlJYxNHSw2O3ipMYU28XrC/Vhj7BV3AdEKE3gLr1M2K6p8JxgH6beQHqQJ+6YYF1SLTicfv6t+E3YeWOgN+uv03tupICikUbJhhQTw7VwH6ItzS1CXAi2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=mdarqEvv; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="mdarqEvv"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48bbb06e746so1478256f8f.3
        for <asahi@lists.linux.dev>; Fri, 16 Oct 2026 03:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1792146859; x=1792751659; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2vL18oGUd8P1r7kwxwBhDb5d5aEOYYG8Ck5OmuOWVWk=;
        b=mdarqEvv64E4E7wISJvxrjSV09ybB6C54QDC8C/sM90/dXxUbPJa4pAg1YvEexvC5y
         VnDaj6J+rb0VayUY5YhJzca3X50Dk53wGIvBNHpz4KyP4O9S3E5NJzKj6i+apHMh4EJm
         oSDTTnKPaBykzj1YcILao1EaL2PgAy6uI6DgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146859; x=1792751659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2vL18oGUd8P1r7kwxwBhDb5d5aEOYYG8Ck5OmuOWVWk=;
        b=damwmjXPqel9HhguNmp5yCW/JbpKE577rCWbBIpF1vbwxQZqBTteBUT1Eg+rpzE41u
         Rm2x9qR1hkbYedsTN9OUOeJ7m+gjO+lumoGtF9uYXdigbyIH+m6ipBIFVHNqupLc15yj
         SIOLzGfP1Pnb3gJDAz1zzNH9LM6jVaqk0zH/NAU8hZ7TNksGAgQNgvsdwd5gTm2a+IzA
         5fLJFqdZ2IPbVjAjXhu7CiN+2OcR5Tr55QVRIlw4Dtmzvuh1mw/yYkHhsPWrIDP3MeBe
         jE6EmFKyrFXCCBtTB1qW8gcsS5m92MnUGhZm76r1m6JDBn3M/0v1HIE9q4QwP50gmeas
         Nb/Q==
X-Gm-Message-State: AFq9FYJG+5T/ERsCFtcZmcfcSuCaPQryw06MYJE132hjnO/Q8mEqlB0f
	zuH+eF9NhYvSjga7Iw2AqPr8GjS/i+AcwGMHqvL18723DLrp56/Py6xv8zNBda60XOw=
X-Gm-Gg: AYBFou0aB5q1iZTgkKVczIfcMYhO1q0qjAQymG6j5O7VUokvKjxj7wSbWVIaa4b+2Qd
	l4MvlmJlGM5fmn/YsYcPQDgVUcCM/S7G43+L+d5UiCoX5PY424qtuDMfX1QQjhordhhSGPLuo2T
	4SrWglamm+Fqknoke6qfv2+mIwSC4ZkhbVtEqr8UTkxn1amwmj3cYmssremBjVGzPNT66vB+k58
	sALU8jEfUwJKn3eHMacqvi/2S5qk6cbjP5uDshG/FBjqmUHph8XVv7976niql2qHzEz5rclrFdd
	7l0eLq9Zhexeo85PoXjTRT1C23RJUuwh2JfcD3977pskdmLbr0p5BcGhRAfHUoE1+T2Id6UZm+V
	yg4r0ks/7CzQNTaGz77/F46fgRm1p8TxpDVbfwVZqmPoytl/5xMFFputjlOR4/fAx9fDxyCivf0
	CPIPKKwYcRZFEKUCR1VHrnyGGcH2PLFeySKrfFSnlyizppZtuXwn2bYy5bb2BbUX0k2jFyeEy5r
	Pfx9wxz1tPi0Ef0wzJWuDkBOcjUpMStsL0eFoBaBwFSKm90xr4Vh+Y=
X-Received: by 2002:a05:6000:2583:b0:48d:ff81:5201 with SMTP id ffacd0b85a97d-48dff815434mr2832521f8f.41.1792146859019;
        Fri, 16 Oct 2026 03:34:19 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-8382-0206-0000-0000-0000-0bc0.ipv6.o2.cz. [2a00:1028:8382:206::bc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd540bc4sm4163148f8f.2.2026.10.16.03.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:34:18 -0700 (PDT)
From: =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
Date: Fri, 16 Oct 2026 12:33:57 +0200
Subject: [PATCH v2 4/5] ASoC: pcm179x: Add compatible string for pcm1796
 and spi_ids entry
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261016-work-v2-4-9340b9555fbb@amarulasolutions.com>
References: <20261016-work-v2-0-9340b9555fbb@amarulasolutions.com>
In-Reply-To: <20261016-work-v2-0-9340b9555fbb@amarulasolutions.com>
To: Peter Rosin <peda@lysator.liu.se>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Sen Wang <sen@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
 =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
X-Mailer: b4 0.16.0

The PCM1796 is fully compatible with the PCM1792A.

Signed-off-by: Roman Smrž <roman@amarulasolutions.com>

---
Changes in v2:
- Added missing entry to spi_ids.
---
 sound/soc/codecs/pcm179x-i2c.c | 1 +
 sound/soc/codecs/pcm179x-spi.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/sound/soc/codecs/pcm179x-i2c.c b/sound/soc/codecs/pcm179x-i2c.c
index 5337bcc7c62c..e81e20fadadf 100644
--- a/sound/soc/codecs/pcm179x-i2c.c
+++ b/sound/soc/codecs/pcm179x-i2c.c
@@ -32,6 +32,7 @@ static int pcm179x_i2c_probe(struct i2c_client *client)
 #ifdef CONFIG_OF
 static const struct of_device_id pcm179x_of_match[] = {
 	{ .compatible = "ti,pcm1792a", },
+	{ .compatible = "ti,pcm1796", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pcm179x_of_match);
diff --git a/sound/soc/codecs/pcm179x-spi.c b/sound/soc/codecs/pcm179x-spi.c
index 192fee90c971..4b873f2986c7 100644
--- a/sound/soc/codecs/pcm179x-spi.c
+++ b/sound/soc/codecs/pcm179x-spi.c
@@ -31,12 +31,14 @@ static int pcm179x_spi_probe(struct spi_device *spi)
 
 static const struct of_device_id pcm179x_of_match[] __maybe_unused = {
 	{ .compatible = "ti,pcm1792a", },
+	{ .compatible = "ti,pcm1796" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pcm179x_of_match);
 
 static const struct spi_device_id pcm179x_spi_ids[] = {
 	{ "pcm1792a", 0 },
+	{ "pcm1796", 0 },
 	{ "pcm179x", 0 },
 	{ },
 };

-- 
2.55.0

