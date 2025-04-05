Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568C31DF724
	for <asahi@lists.linux.dev>; Sat,  5 Apr 2025 23:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743894956; cv=none; b=L7TXjTHlT42C1U8tIhTi8m3LVcMnZeSPIabk9g4QZCZVki53ZhWx+FdXE2JMJrN5H63sTdOBq0Kj3A17qIL4n3GvKE1brUwr8eTDLjTvgnYP10jXODulYQ9L/N8iosI5bnVF6vXfsy9jPK99yM6YOfePxqZ3Wgk8NlU4CEQXdT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743894956; c=relaxed/simple;
	bh=TCm6ICnn4hWfWQL4sbSAXGwOU0wyVtdYiBPxab6jEBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KDvfp2ggHomoEV2s0awUv1xdoKWEQm7p+L+ohRyzjSoTqTEfSYi0VMXkXVTkzSNPrInJFMScYg+zk3K8A8iABZK8/NIXABWIu69yDc87bC6jubHFOq+MWrx+cHKBi4oENmX+B/XD0v9nxNLir0UttifSbobDn+FJWkmt6iZNCZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f/+YUyH8; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/+YUyH8"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22403cbb47fso32888255ad.0
        for <asahi@lists.linux.dev>; Sat, 05 Apr 2025 16:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743894953; x=1744499753; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oK2/ZeW8ANllKk46FkJuUv+WaiUUGbjs5ATKiMs/AJs=;
        b=f/+YUyH880/6SZ0MTRJW5chHXsHpenq7GMTqGMRRAQuR8WpxEldLvmoiLojHaego7V
         4LsaqNp0MhUK/aVoJpqbur9XLBYaa6ggioTwY7z56b8iI7fJB5w4Z3bQb6nXUtmk+e/O
         rdYJ0mcFPUIjZgNraT6cOXlcWc4K17kxRfL1O2e8s0hg/s0Vgd2kkUhuwZnjhizvYkN2
         h7nZ6ecDjzN0cKfMFsL2cqoSsW4xyuRe2+PAW9LggyjJC1bkMvK/RDOjCWpDyDjlE6Vc
         GnmhqIB1OWavradvEtK20OuoV/xsH5v24GhLPD3zjmZbzACSuDObYab6kJBHIHRFyq2y
         2ACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743894953; x=1744499753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oK2/ZeW8ANllKk46FkJuUv+WaiUUGbjs5ATKiMs/AJs=;
        b=ouRmEFHC9DuLxQV3hMsnAQp7KZ4WL6Yd+qLi1tvGiRUoBIyGvXpWGF7Zo9LOsm+MiT
         L2Qjh95LUCi6VM6ehIawaGwfYp2ZgwxNabG+bod4MMwr/JWIeeb+BYjRftT+ZCnCwKIg
         9d2rHlAhhXxpq5OuQS542Kdu9hb6IBTvpw+wJGuJSWoeWh4sbwf4CSNlONERaLVpbyis
         h7sOb7GNRKN4l6iGV5MBQ6l6rgEnyJ3d/HZHge4wjsKJBD9ItCc1y+mZaYYnAnMTqic0
         PFmOKlm8rkic5ucFsF1sfmpZOHt/Gszl3M2s2SvEhMoI6NDd/nxl/JmevqnRYDaHWPiN
         fCuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgOr2aLRg0sHJg96ZV1H4l4670rOrmkLixkCcRiQr2OfSyFmU/tGxu+s4I1j/6I5iHuOe4zw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzGdeuaRu6nDZpe3MO93IVhhbxhkRvsDwubbX1h5LNwTpBz5UC+
	kTpOxq+yX6dq1baxGVakuCkpjj8+m+TjI0RO5OTs0V17VSSHP7Uxlf9T+x/5
X-Gm-Gg: ASbGncv4aXm+BwHgBXJA5vKI7aZNPWUeDo8NKCUGE3T6YMWTuHyGEpVBfD8el8y96wc
	uccm+KsmW6AKksok8VeD4sBDG7RfSPwxoTzvyUTuzxcv/Givjrak7KwKMxlEREUBb7gYYjZo4Fk
	pHL5lD3HSJffhVsZGTuHzQjagBzYxgWkTCEeMSei0CG9nOR+rMlZlU2sfUvmi1n0Vmkn8aSFLxG
	solYaSksRZxHAxSwrgR0Qrm4KQOvfCjcKx75Nb8elT1fM9JGfHMSrFgSxIHGj5CvxukQ4aLaA31
	2QlTLHVN+lsxqgtG3iySLfwpJ9BSCeNH1ItgON41674B51WN3f3oWx+g+L6sBh7UPIXKRYVgPmM
	shbnCxZVlIAVy2XWQ0o49HJbPIKmiZ3IB3Au6x44=
X-Google-Smtp-Source: AGHT+IGRLt/UgytCUZ6RX0b6+stfUBPUHZ9HiQpm2F23F9DZ8bIT2TMqzECkL+Le43z/TyHUlcvc4Q==
X-Received: by 2002:a17:902:d591:b0:227:ac2a:1dd6 with SMTP id d9443c01a7336-22a8a87a6c3mr128550555ad.24.1743894953445;
        Sat, 05 Apr 2025 16:15:53 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c994esm55048345ad.102.2025.04.05.16.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 16:15:53 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 06 Apr 2025 09:15:07 +1000
Subject: [PATCH v5 3/8] ASoC: tas2764: Reinit cache on part reset
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250406-apple-codec-changes-v5-3-50a00ec850a3@gmail.com>
References: <20250406-apple-codec-changes-v5-0-50a00ec850a3@gmail.com>
In-Reply-To: <20250406-apple-codec-changes-v5-0-50a00ec850a3@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Dan Murphy <dmurphy@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shi Fu <shifu0704@thundersoft.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Hector Martin <marcan@marcan.st>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-hwmon@vger.kernel.org, 
 Neal Gompa <neal@gompa.dev>, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1447;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=9m3wSRyoGMFtfeJA0LTHIxypfZ4C2ZJU7xKp8v385vM=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkfd3ZGaMRzKhobM5hK2/K/OhG9R4XnhOwW3x17nTqT1
 F6mxDt1lLIwiHExyIopsmxoEvKYbcR2s1+kci/MHFYmkCEMXJwCMJHfDYwM7163amy8WcL7vaZ/
 4QFb2/3vI37NYr33/dyZsGhL2YTCXYwMs6VtfI/fvqHIZnlaRLOm6ojuoXDtS3Ghss9nTg0sfab
 AAwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

When the part is reset in component_probe, do not forget to reinit the
regcache, otherwise the cache can get out of sync with the part's
actual state. This fix is similar to commit 0a0342ede303
("ASoC: tas2770: Reinit regcache on reset") which concerned the
tas2770 driver.

Fixes: 827ed8a0fa50 ("ASoC: tas2764: Add the driver for the TAS2764")
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 08aa7ee34256896915f3ed6438b8b8827ce240c7..49b73b74b2d9dd6d09747cabc2b00519c549775d 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -546,6 +546,8 @@ static uint8_t sn012776_bop_presets[] = {
 	0x06, 0x3e, 0x37, 0x30, 0xff, 0xe6
 };
 
+static const struct regmap_config tas2764_i2c_regmap;
+
 static int tas2764_codec_probe(struct snd_soc_component *component)
 {
 	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
@@ -559,6 +561,7 @@ static int tas2764_codec_probe(struct snd_soc_component *component)
 	}
 
 	tas2764_reset(tas2764);
+	regmap_reinit_cache(tas2764->regmap, &tas2764_i2c_regmap);
 
 	if (tas2764->irq) {
 		ret = snd_soc_component_write(tas2764->component, TAS2764_INT_MASK0, 0xff);

-- 
2.49.0

