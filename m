Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E14117548
	for <asahi@lists.linux.dev>; Sat, 15 Feb 2025 00:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739577933; cv=none; b=BYYxoIYMwiwXpnzsfEV7mhhcu9XHBzWk+btHW0FZWgMUgR5eCOrRcyg2ra8CVEp2FV7fyjFnQ0Mk3CZKrV0FLkLeO4EmIApUG2kMLrbgeQkNaW7rXpfF4rMtr6o6biBjftWoqLtJeA1WOvDQxSsL/9HfpFsSNVLTGtdT/ufctoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739577933; c=relaxed/simple;
	bh=mhjYn8hCW2F2c4h2yo8pS7w11bq/v5wUZPBY7cvt+H0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=drpcysEFy6785+so5mkzgjEC9HkhoMGV1dDG6AE7oyQNhlWZRZOQWw/2PaB6q6YZJNbNKlyLkvBGkw+q882xYtfdT/JP24M2pZcuJCjYRY67MsYGcEsMDN8RJd4NymQ4oNv5WwsTYOt+bz9h+StH29ot47ACvodYB0cHsE0L7hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NOa+yPOz; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NOa+yPOz"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21f2339dcfdso40795445ad.1
        for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 16:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739577931; x=1740182731; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JRvw5w+5NxuvIevv4OWKoiATV4ce1E+DcjU2wneQoIk=;
        b=NOa+yPOzfUq3gbDvw1YLQTovrpBQtAxBbjavwU2xg/hSmy4/j8AQwikHTD8B16hjnl
         nCjJ1dD7SeUWbzze5oODgDbi6LQ/DR5XnA1cPN20aWyvpuz/RKcj0lo0ugUSyeu2cnBP
         hxlqz1glIgz9gvtj4ps5tHRMW17Ij9K7ittW4ic3VJtSA7NxG6KvDlfZZAkehoo+LFC3
         fSZ/xs/ixK/1LH4z+NTWnesarztG6LE6cNaZfQgCkwOicfCT6cWnPM4vRFQ4P0ORXPux
         AlmjpvMBOZgLnPuoruaUOzrV+q09OBOr/8jtntx7Gsv+WRvb6+R3Ofig3/wH1kb6dabZ
         Vwbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739577931; x=1740182731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRvw5w+5NxuvIevv4OWKoiATV4ce1E+DcjU2wneQoIk=;
        b=mCW2OmvAPyMnXmDEMRVMGzD7MB8G0pUhWyHBZqJNfhyg0YSbxNmInJ0UnwTW96z8bI
         yuhEFe96GvQPQQhkSpfpwcQPnRGURlaK9TAbZ8KiioOC695UEmf9pjEF6Chc6vl+lVZj
         e4MXqb9HC+CcbOl38h5mqhdjAz7D/OWHKAdarAe91TDCOLHRmhyIwvJBmnkIQh4XAouG
         IZbYDC3S4a5+NompOVoOzyMXbS+NIKPQBGooPxMGGoKJee3NYbUM1DvUBdFzR8peI4Na
         /Dzn9+U+ELHvO4YCHAtOoRdSyLOOKozRTxi+Nqd3hskqPGaeJHhikJL37e9rdNMD5Xts
         JZNA==
X-Forwarded-Encrypted: i=1; AJvYcCUFXP0hE3v93oQfIeAh5dLuV4qYPZoFdQnKaJbS7zj/mAxaq9aGHMbM4r936y2rAXRNHPDFmA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyMCciwusWrwMG/H5veE+BhODPEr5ESzDXUKN0s9hWuCeQlJcHp
	QCiqu4JH6gh6N9xNKw4Tcg335hKmc0At6NWgqJ/8JT/21Sl3R0Im
X-Gm-Gg: ASbGnctewhBLEV7jW2Dj/GByhux1xaxPk74WTobeoEOOMjPYLMpMCWeO/FEdGmry4OX
	VfiqXpxSsPiS4MU7VBGhBc7z9r0kDlaKTEVS4pMzfBS+Gj5+BK8wM1nz4844OFD1iUZr3XLMbFU
	9CPsgIE1wZdz5WuMle+B1Pu/PXFgyyBDhfAj6f6dn2vXFRqNRCsslSeYUqAs7T7GPd9KydngZX+
	lJ8S/9Mqfcvz8u60IVs2Q/FmXXz+j8ezwfrpwKonsrrn5PylD/47Vmj0dtPKZXzvOmqBGqiG5Ss
	YDD9aA4J5FLO8LuoYNl/kjTxQX55rCrVLEPsBg9swd79+Kk4MOedV+13ZsEs7abSaVWIuY/x9BG
	Mceb8K8Qzrw==
X-Google-Smtp-Source: AGHT+IFAlt37KrLp3aaCLabAYdTxN0gQLkRnHn3SeV4YCP7JDSRDr0QDjrDCqOwzEb4fOtQ9UuqhVA==
X-Received: by 2002:a17:902:ccd1:b0:21f:97c3:f885 with SMTP id d9443c01a7336-220d357a8d2mr155643235ad.18.1739577930896;
        Fri, 14 Feb 2025 16:05:30 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220f26ea127sm15071155ad.96.2025.02.14.16.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 16:05:30 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 15 Feb 2025 10:02:53 +1000
Subject: [PATCH 20/27] ASoC: tas2764: Wait for ramp-down after shutdown
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250215-apple-codec-changes-v1-20-723569b21b19@gmail.com>
References: <20250215-apple-codec-changes-v1-0-723569b21b19@gmail.com>
In-Reply-To: <20250215-apple-codec-changes-v1-0-723569b21b19@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Dan Murphy <dmurphy@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shi Fu <shifu0704@thundersoft.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Hector Martin <marcan@marcan.st>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1488;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=7QEQPTza50FPvZwaOcwfVBkqbL5W80ScXX3sqRtjBJw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOnrb26vdXX9/4Zh5cdt/XWz+fy1pSa/nbFPTk138aWMK
 5eMtn992lHKwiDGxSArpsiyoUnIY7YR281+kcq9MHNYmUCGMHBxCsBEnuYw/E/J197F+mq9bHkt
 4979U69ZKwQzdi2bqWcpvXk9Z4DMf1+Gf+avdIX+Vj0IkpE4dmfGhE+LGPr77vLafnRf3bps5pr
 Dm9gB
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

When we shut down the amp, we need to wait for the built-in ramp-down
before we can remove the TDM clocks. There is no documented status
regiter to poll, so the best we can do is a delay. Datasheet says 5.9ms
for ramp-down and 1.5ms between shutdown and next startup, so let's do
6ms after mute and 2ms after shutdown. That gives us a cumulative 8ms
for ramp-down and guaratees the required minimum shutdown time.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 409c54b41dda41d33e8501fff9de421c98f2541f..bdbc210ea8306ecebf704fe33fbe41083867e1ca 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -159,6 +159,8 @@ static int tas2764_codec_suspend(struct snd_soc_component *component)
 	regcache_cache_only(tas2764->regmap, true);
 	regcache_mark_dirty(tas2764->regmap);
 
+	usleep_range(6000, 7000);
+
 	return 0;
 }
 
@@ -252,10 +254,16 @@ static int tas2764_mute(struct snd_soc_dai *dai, int mute, int direction)
 		return ret;
 
 	if (mute) {
+		/* Wait for ramp-down */
+		usleep_range(6000, 7000);
+
 		tas2764->dac_powered = false;
 		ret = tas2764_update_pwr_ctrl(tas2764);
 		if (ret)
 			return ret;
+
+		/* Wait a bit after shutdown */
+		usleep_range(2000, 3000);
 	}
 
 	return 0;

-- 
2.48.1

