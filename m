Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF8A22D7B4
	for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 08:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739867897; cv=none; b=lztaFAnp31a20z7WovUSITX6FBCVe1gwOdIdaPRPLoyhpoPZOo1cVA9QsYIEssjGmajmwiNE8xSDduVKAPeEfKRcRspMBKA9QQi4vjYI2NqMZLZ6a36rhhCGUbU55a2o0EMKCDgSGWcS1M6OG+hYX6IVA+Q15BsEvjLArDhESFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739867897; c=relaxed/simple;
	bh=kn1APRcCA/v8AjoA1R9fU9HzEdKU9YfUWCYBmEG2UzA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sV5cngB53RxAPvcFXJ1ktm+Sx4sZz3HRZPSEz4jvv33mdtWYEco043U2QaWvJ6hhi7MCJox51RH0svYyI7+LccHT/ZrN8F2F7Xuxuo+wjLq4MOGBVoo/E1j3yCSBMwjRj6JpnUTAsjJr41RlTfYllIIeyCbcQVIamfEKB+WPVBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mVSTzTAc; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mVSTzTAc"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-220f4dd756eso64616475ad.3
        for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 00:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739867894; x=1740472694; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+vIiixkZLusvVLSOkYQ4pzXKIcBetiV0WHv/MyWa9HI=;
        b=mVSTzTAci5kQEL2YgFqyorFv8qyZkxQmKnwnTdSbWO9lr+DRonyOj0ZENLC4+jLZBS
         buPwCUaOq71v28e8H63RfJt4PA4ZAGCH6hrXobgPrkuVuFDWieukFJMaS+Zzukdsgbzt
         O0ee8+lmkNjrDgB9dbT4NriikQDON64aq8/pbDKmwp5SJQMXAhDOAZ0hjMOEUtsoi/eX
         44jsaD7Tw4RFcGu8vpr+BZ+FmpuqRdZQoLURamYli4uhU3XOG7zMSZlJ3/KNINMCaROw
         G4ggawe6ilmAxfcImbn4dToCThQTuJSd1+wSyo2SD3rnib4AL/Aa8sP55Hs5CVVpoXCD
         06sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739867894; x=1740472694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+vIiixkZLusvVLSOkYQ4pzXKIcBetiV0WHv/MyWa9HI=;
        b=aE6o8/xzTgBn5bek4XOLuxJpk6LHosKS6BG3PfMQTAuOqrdwRJFDBFmeEibCTiEXB1
         WEXlF7hVRaOV9UzM0OpTWCpncp7L0rwfB3xL/4GN9cKwmprFQ8q5QgtEE5Ok45jfwYbk
         db4xcnAH1CKylyhSM3wn5irp+3CaHAEq4bN7A0iMxYbs/WYpXU2DrHFSlGX4NuT12rMF
         IdJkpMhS3pwiLXNHwKOwig/IIq7aZcetoBtxBTTQOMa9Bw/QR5KvXtuvM9rjV/oJn9X3
         ZZNJK9oxDo1HBKKfi1yBViTi3hRIi+2OCVVcb9n6cHXYjLH1SKxbtI/h2qSabAOeJ2Vr
         sSdg==
X-Forwarded-Encrypted: i=1; AJvYcCV7krZOImPpKFcxzx058O/hZlG1iT1Um6mW5RygCOPVXHXghIcTq78AVaxAMCcSq8EJy+M4pw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5fAqWe0Qw9aDoP7JOKS74XtwulrJ9FiYHwaJTPf/EPArSsihF
	ddGJBIqsu76iECFHrNI3wyOprxPzjRf8LobTV/qFVwOSgrrBgkts
X-Gm-Gg: ASbGncuCIfOUhHCKuD2D6ZOPZ7f5fFRJBWvhSVEKIBrwDiQhiqXv1Q5h03PZfxlezc8
	zDYwGKPHklSBO83byaXYgMTDCayuHEaihIL/QBt1j/tw2QIVsgWmw51alw2GRhf/pi/x2vO3hLn
	s3z9rndUvrmffviF/kO3Do7imyVhrY9S2zT4KVIGk+6utWNXCt/WgBpRzfVZQldJM5V3V9nSKWt
	hi0yggRpBuou9Us/N94PUCqZeGOXoznVBsMXmbIy6vDAlMnuHFeEaZnhrxo5QbaYMdQKMSVgswB
	xbneYw6TD69eJGTbZAiyxO2LbJQziSkwXHjfNPdTW1KYvrW8z/YXd/DNT/zyzqhNZFCxv+UA4Ko
	bZrIbsUoNrw==
X-Google-Smtp-Source: AGHT+IE9l5ZWDLZ4Snb5g8buV7sgmajvA4jmUg5Vk/mBb8OxfNgwoLh3SgWN+mfYVulRQJ7/jQm3XA==
X-Received: by 2002:a05:6a20:2591:b0:1ee:69db:b0b7 with SMTP id adf61e73a8af0-1ee8cbf9ce8mr26100366637.32.1739867894577;
        Tue, 18 Feb 2025 00:38:14 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ae1ee4febb2sm787325a12.51.2025.02.18.00.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 00:38:14 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 18 Feb 2025 18:35:52 +1000
Subject: [PATCH v2 18/29] ASoC: tas2764: Enable main IRQs
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-apple-codec-changes-v2-18-932760fd7e07@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=865;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=nGf66/Eflq8MFfFqSEUJwOcDBRVpqoelx/A3yfhUSUo=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOlb3BJlWO/riC+cb5nJmq4er8uSPmXn9V3ex+6aFS30n
 Vp/+2xYRykLgxgXg6yYIsuGJiGP2UZsN/tFKvfCzGFlAhnCwMUpABNxm87I0D4p+c0lef/m/VLs
 ktGSf0PfTWi7rvtD1Wim5DadWLtkO0aG77v9BafJvMh79Fk7bS7zk7jkJOF/+w8IhsTafHm5cFo
 BNwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 39dc466bfbca35d50a5a93507260d59d30affab6..16df453190961b8ea6809cf4e6a9c588f41b5a82 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -716,7 +716,7 @@ static int tas2764_codec_probe(struct snd_soc_component *component)
 	regmap_reinit_cache(tas2764->regmap, &tas2764_i2c_regmap);
 
 	if (tas2764->irq) {
-		ret = snd_soc_component_write(tas2764->component, TAS2764_INT_MASK0, 0xff);
+		ret = snd_soc_component_write(tas2764->component, TAS2764_INT_MASK0, 0x00);
 		if (ret < 0)
 			return ret;
 

-- 
2.48.1

