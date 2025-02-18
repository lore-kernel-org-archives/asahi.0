Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16251230268
	for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 08:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739867936; cv=none; b=WgUCW5aczqo1hihiFcxB+wu5kL6kbQGo+cdDnpfsX1RmyjB5aAaZbBOOhjxb7TcyxkgcYDFfmwQyukoMwCSG2ZfieqwuwoUONHQeshIid+slR6a0vdFSeP+CnCKHQ5eoLBSjeVImvciV6c2DgezKtourGS7qfIbbeSZqwyqVX5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739867936; c=relaxed/simple;
	bh=ItwvcapWnX4No37sK5tr0C0YgHDBe9aBgKZAVcfytA0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T20Pe1DDaNPYT+/a7woN7spAanD95+OPqNe55XvIGsSwBx+Oy8hOerBjfPuLl+l2OZdrUq6RhrVgYSEqcjqOZEtAgmOkwovgzH13p7Y5Zum2KDUNLbrbfwackix7rTy37njgL38vPX91esPlHx+wvblO//+oN8RcCqdjZ7c09Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VqiYr6wB; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VqiYr6wB"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22114b800f7so39842285ad.2
        for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 00:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739867934; x=1740472734; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hBccVGgKneSXfzYBkD4Jpd1sZnDdntYCilZFqeP7S/g=;
        b=VqiYr6wBTJ2UvIgVYsIYJ2wiGRKB7WlO9hspMIRUMOZbx7Lw4x7D+pCb7xPU8qgjtw
         xODBBn3pOaDtzydprwNfxsBflFtSXEw6ev4rnXoznbHU0Yq/Ewcr2sFl1YRJTaAAW28V
         TODxwHLfOXcMi0wAWPQsSYTgqe+pPt5rftkRrhtdgPisqt69J5uRJSTJGwTr5MH2HCiZ
         0EqMpVYfSHhxKF3EZHwvwmTprBFkfEnXtTIxOI7Eet+ZQu7R8HRKmeKZJ45ZgvD5u9j8
         d5ngxMcWa+OXeoaJqfF8/2390Hy4ddxUIl07FFPChCWtaLU/hqf+2KXv9t4IoBoj3g5b
         qSXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739867934; x=1740472734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hBccVGgKneSXfzYBkD4Jpd1sZnDdntYCilZFqeP7S/g=;
        b=A5F/PG7jQgEqTSdxerg1m0s4ymOuoIVStEtoLbm8JPE2ZBi85XMe2x52OXTh8IWaj1
         EeXDkeIN8A1cP2SRRS/jSLX9KjLSrDYsvEskmDA/EQnyDRTzKwoQooqN6khONLYJBLBS
         HV5WtyR61vsE8Z7DY9ofwNjKbAem3x/16+KxX8vCBEA3WyZK47caVbPgdzsaOVI5676o
         fKkQuH4R6aT03MmX+au782God6LYAW727NJMhAWVk1XAHl6IT/IPBe3bkbdhvzjO49Ls
         VR+np/GaO3FDd1knmb+jyBFNBNBzNXZPtA6ucmJLYcs6gTzXsMHjh4298MY0CL0HjERU
         zk0w==
X-Forwarded-Encrypted: i=1; AJvYcCWmUvBGfKqrlFwFZ/NW+W4sG5HyGG3MgNAhLc2MsWIZXw2G5CHl8T79N6F8F0CtupZO63dAhQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzOo15LbCqkHaFFSPEaDrYv0hg+Mpzw/QsQynNY2sFXQLDVu7KK
	ryqLz6N2sN8TH3IGUENyG9O7S4B3eBMgKTDAnNstfJ2vCrJIGuqc
X-Gm-Gg: ASbGnctRHXLvAnfImd/cHXuETdo8QFxpj6LLC8PT8Kfcd474um4D74pvsFQftPgE9fQ
	RbP7EmIrTLnXyXwecN4Dr69lU6jTPDVaRnJYsbwORr9k0nBx1CkVUSAR2z96EgM8JPJ+UWP+V7O
	i3vGMEZmOlimPRSYHL4Rd5imGW2kNDwjdSrRgcyBqDCAAsHxoc+DqWZFUopqBrulSyfhguxfaeX
	tEImcP21PT//2JpLcV9OpfIhnXI24aU9j2cYq5U7HUbGzmfHpoGswUHr535Nxjy+znaIWLtu9zj
	UN4dh3+H1vji8i6rid1txn7VKhLoMRJgKsjGGZmfyEsBq9Z7MEZpxxSRz0yuiFx8XMG1lk7kkXf
	l93m746xqHQ==
X-Google-Smtp-Source: AGHT+IF69YRAn5za8af2MFH/DZsCI2LxXwdYM/i7Z3apD02bSq4Txk+V6Fr0TuaTMacvAOBd9qFZJA==
X-Received: by 2002:a05:6a00:3d55:b0:732:56cb:2f83 with SMTP id d2e1a72fcca58-732618c2987mr18713163b3a.15.1739867934222;
        Tue, 18 Feb 2025 00:38:54 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ae1ee4febb2sm787325a12.51.2025.02.18.00.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 00:38:53 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 18 Feb 2025 18:35:57 +1000
Subject: [PATCH v2 23/29] ASoC: tas2764: Wait for ramp-down after shutdown
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-apple-codec-changes-v2-23-932760fd7e07@gmail.com>
References: <20250218-apple-codec-changes-v2-0-932760fd7e07@gmail.com>
In-Reply-To: <20250218-apple-codec-changes-v2-0-932760fd7e07@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1530;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=5/z1Q+2cE2bo3ZW7z9/rxpTJXWPoJfee+5Zu6oCiyVQ=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOlb3JIErwqa11UlFG5t5lOLy3x2SvhxLK/nbob43Akd3
 TfuSTB3lLIwiHExyIopsmxoEvKYbcR2s1+kci/MHFYmkCEMXJwCMJHeLIb/nqqWv5fMTt2h+OP5
 CXdWiwtn2HexyS2r6l+nGbhwRWGRGiNDL3P3B9PKlDX6248vddVZdmZrUV0N+7JtrHKHWu5nH9R
 jAwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

When we shut down the amp, we need to wait for the built-in ramp-down
before we can remove the TDM clocks. There is no documented status
regiter to poll, so the best we can do is a delay. Datasheet says 5.9ms
for ramp-down and 1.5ms between shutdown and next startup, so let's do
6ms after mute and 2ms after shutdown. That gives us a cumulative 8ms
for ramp-down and guaratees the required minimum shutdown time.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 3c21810358881b6935a50807cf7c745291dee3e6..7d6cb29a749e234b325e253985eb0feac6f44934 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -160,6 +160,8 @@ static int tas2764_codec_suspend(struct snd_soc_component *component)
 	regcache_cache_only(tas2764->regmap, true);
 	regcache_mark_dirty(tas2764->regmap);
 
+	usleep_range(6000, 7000);
+
 	return 0;
 }
 
@@ -253,10 +255,16 @@ static int tas2764_mute(struct snd_soc_dai *dai, int mute, int direction)
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

