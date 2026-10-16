Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AD44756D7
	for <asahi@lists.linux.dev>; Fri, 16 Oct 2026 10:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146862; cv=none; b=j90fWNtqemVrd1nxmC5AnHC4FoeDNu/AnwEjWqwQmuiWmRMbOkU4Dt0Le4IswOP4x5XgjvErWGQqBh9cddlrW11ryHZWuvO7fIkbcTjlB/pTn2+5DRSv/sbl1tisbgstRAqh269KQBQ4mmbVllI9zb4Ty3Ia65tySaN9DYjbPF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146862; c=relaxed/simple;
	bh=Lsm2KbIv18HV4RCeIQXLw9roJ3XTgsVSD2Ch+2dPVdA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iaT0x2X0DYNbDQJCOZAbXlWi7CpRL+mx8jNYqH1xeAl6m13p02odd6mlt/5BtwnUg//br1G5cMw6OpDCdv0f1D6qbq2INKInmzyGRZaBfTSxr4faFMD0WJ3Q6KbfHqZqnvwvpa8SyGTDo5sfb9k5xnvi7QFx6/sNDZ2xvgLK0g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Mb0j5Djx; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Mb0j5Djx"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso422668f8f.0
        for <asahi@lists.linux.dev>; Fri, 16 Oct 2026 03:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1792146858; x=1792751658; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PuytrU8KqiyHK1tk1s97o+LClKH4kGJgltp1buUdAgk=;
        b=Mb0j5Djxj/2pxQusd5rZ66VbuFpgPJohYvmZmeq7bSxXZAgGD+nQvcUGAwtWTklcBF
         zs3xpk5CDtGugN8MqJar/9pnp8M8E84p7pmVu9UPJecCs/2OdfvymUShrmpbROGHi/JX
         PkOVjUPnjRl3zQAW0w8E3Cp+XFEcgwCBNBiRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146858; x=1792751658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PuytrU8KqiyHK1tk1s97o+LClKH4kGJgltp1buUdAgk=;
        b=jQIUuIhG3iHiNBiya8fB59H41NZ2xBU8veGk4vs/AgM1b/lZEsbjBLh7SBCtgrVB05
         l0XEOnEToPclSDX72BLokpXuEfqdIPbNMB3k/ToFzwQ2ByckDIihYFsguLGN5VAt4C0M
         bAnw4yQQAr27nqq6QAxe84pFukr0IDmHQgU1/EUqD+8nSO3FdKfgncTDVBGwT2szhxpq
         xczzO+EGBTLzLgLWobPE/nawwNByhQH4cwL09UDgTB3Te9VvgLyNGGCFNZLYcThtaF6O
         yRXqRV6dz2VRg+WgTJd4DkTcUgarzNnps9BROhOBpKN7GNBiudU73XDxL1VV13e2v8KZ
         4lnA==
X-Gm-Message-State: AFq9FYIQveuF5CyyoyP7Jg2FoM0XkKGDytfEaRi/GOJVd+zcX6ZCvoyY
	C+H8oiRzOILnVUUroEwozPca+J0RfZw2caPbgAPqfCKDet2DgKnSYlZMcJEh33xd7Wg=
X-Gm-Gg: AYBFou12RaPkpW37IHpr4D8/c1JajVl7vP+ZF9YTq3kzUchSzoMilhBAhWb7vfRENZR
	bI/SbQauTzOCLEKKF4oeNhXOR0sLBIE/PWIll5Y7gSvAntNCpImJVTz8KAqc4SJUd3/VIyK9L7E
	lEJVmzid04miq+YRpLt1ESzIjr6um9Gpx/zqE0lFFg/6iiAchJGmmWBUdq9+CJmT0gGPN1+Yo48
	7oe6i5YzfEeMkIwuYgIh4d6mQYj0aoWVgdJKshvfb7PmvgrJt2fqYFGr8nNXvGiyl1KOcTZzJdY
	aMIzzdjE7omJxuf8/2qr557K127UY1luzEaU/Eel0+MobQgmkark5xGC2HQg1pTXpsOwHbGuDrt
	ljSMdXP9C/Oa+DgspTi1Pc7DuzKJ0+P4nGIUr24LXEAHzChETvWqtV2NeRRu0FoeUfKYs7IYkT4
	dWbtfxocf85jkYeONgCvKkBQ9pncpUXNY+vbOVUzNd8tqLNyQj4lERRPhCe6LOdSc4LdMJ980gZ
	KCID3v/DjcWflT/a/7oDlSU7Whn6bhR/5P8+e4h99FS3Jel3xnUuHnU
X-Received: by 2002:a05:6000:1868:b0:487:27f9:834 with SMTP id ffacd0b85a97d-48df014fbe2mr15102029f8f.41.1792146857960;
        Fri, 16 Oct 2026 03:34:17 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-8382-0206-0000-0000-0000-0bc0.ipv6.o2.cz. [2a00:1028:8382:206::bc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd510d60sm4024272f8f.58.2026.10.16.03.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:34:17 -0700 (PDT)
From: =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
Date: Fri, 16 Oct 2026 12:33:56 +0200
Subject: [PATCH v2 3/5] ASoC: pcm179x: Add left-justified formats for
 pcm1792a
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261016-work-v2-3-9340b9555fbb@amarulasolutions.com>
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

The left-justified format is supported per the datasheet, but was
missing in the table.

Signed-off-by: Roman Smrž <roman@amarulasolutions.com>
---
 sound/soc/codecs/pcm179x.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/pcm179x.c b/sound/soc/codecs/pcm179x.c
index 61b87dab3266..fae5de318b6e 100644
--- a/sound/soc/codecs/pcm179x.c
+++ b/sound/soc/codecs/pcm179x.c
@@ -75,6 +75,8 @@ static const struct pcm179x_fmt_table pcm1792a_fmt[] = {
 	{ SND_SOC_DAIFMT_RIGHT_J, 16, 0 },
 	{ SND_SOC_DAIFMT_RIGHT_J, 24, 2 },
 	{ SND_SOC_DAIFMT_RIGHT_J, 32, 2 },
+	{ SND_SOC_DAIFMT_LEFT_J,  24, 3 },
+	{ SND_SOC_DAIFMT_LEFT_J,  32, 3 },
 	{ SND_SOC_DAIFMT_I2S,     16, 4 },
 	{ SND_SOC_DAIFMT_I2S,     24, 5 },
 	{ SND_SOC_DAIFMT_I2S,     32, 5 },
@@ -144,6 +146,7 @@ static int pcm179x_hw_params(struct snd_pcm_substream *substream,
 
 static const u64 pcm179x_selectable_formats =
 	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J  |
 	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J;
 
 static const struct snd_soc_dai_ops pcm179x_dai_ops = {

-- 
2.55.0

