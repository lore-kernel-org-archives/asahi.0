Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACC51FA167
	for <asahi@lists.linux.dev>; Mon,  2 Dec 2024 11:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733139420; cv=none; b=C2HrrPYwI/XnfFmzDfwMEPuAP8TyvHCe10+PcjUApNpTv7dWrZC4CpVyXgvLaTO9v2EtEQfpU5ZI8UgakTZ6QAnKf6E3w8kVt1O3gq232OO+W6s7J7d8+SEUQE6/eYiD50+k+aSPLErujKrKZkth4u5AxozQ7YL1E6d5uFVoqxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733139420; c=relaxed/simple;
	bh=Bswv2ShtZ15EuEQneXOzrttn0rUwfA/DlAUnJf4MQAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=F1ckjHNMKIQDj5dRqE08GkxoNTP6bLGH1t7L1H6bXoNRDhT6+jCXMkoIZGnqI+xLw2RsaePiZLTMAUUUiehGmV1PuEduccgMHvhJw7oKlfcAtGlDvX2rtwKeCUAr66kgW5XUHvfEHsqXbaZGaDYofMAv1HU7AFqVnMNHpoXcbZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=zNF+7EPC; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="zNF+7EPC"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-434ab938e37so25709735e9.0
        for <asahi@lists.linux.dev>; Mon, 02 Dec 2024 03:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733139415; x=1733744215; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L6QzxVLWRzRH/qOa9cOwOHFOV2Etnv6DT+rOyPz2/6k=;
        b=zNF+7EPC7eY0760D7FY3rNXtOFrwVQsISglKc78kSdRkyi/LdWeWjJ+EyKgVEyvxNU
         3ySNzTTE4O526JU6HTgDGPPID6b9pRPEQk9nhwls45ME1FJAJfpqSO6ZT3wh6vNG/xBx
         AZ3A6aiJfl2yp8GAOdpolsTtqD0EXkl/d/lTqtvF+pf1wtQJSHSgjAxMqq3Wu9ZEqz7J
         ppk6w2RPRa1AfZK1L66Q4EfdabTKlqdWo+AAfDcwbq1h6plaEYIrQblZYZ74RvuVIQm4
         OXBzl9JJRs0B8BprNgI0EFl/iiH6sHNMQkwkXhBPibAtq7uPLcjZTrA7kTGzd5ToELPu
         GQNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733139415; x=1733744215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L6QzxVLWRzRH/qOa9cOwOHFOV2Etnv6DT+rOyPz2/6k=;
        b=shi1IQrm92QAyQD2DA5cz6LLzucI1OMS0T7t8GfJy7wQjMmXGnGcady+jmcPPjqb/q
         7KexxXaPgbClJ62WGOoUW4TTEuPNJRknWDIlgI20sYD9tj+tCQEjPzuUANIkfKy3xZBK
         Zo733Y49fuWqm3+W/tyVwyKUeave53FscW7IeGXj/ekLfEa2moZCbOlZtrmDIwin62kc
         VWm/Jn7OPZeFsHnamkorMx1aOtv9M96V5kzxpylz3kIvkXYJUhnW6Arzr25gSIrpEp95
         85z4e92hXdGtRbQDT4zD0uBf33pTz7R8uOvXlXbgqXol8ys/1Gi0TBwIdQZiYAJL/Saw
         Hh8g==
X-Forwarded-Encrypted: i=1; AJvYcCXd9Qx+Ju8TP2Tc94Z9RyqNWXtHE56wHQ2KHuwz9z+YMf35gvZqFLf1ui7Zw2veRBzRYIMqJA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxmvhqKzvY98C7L+iZuRepaEQeDyTl1vUrVeC5izB/4EG6tIFcW
	rgd2FGfk9uBMic78LulNvACfi09Sh+R/GJHk3t/neJSuMDwOyMQ5yi+qgJEyDkc=
X-Gm-Gg: ASbGncuoa3mSVvMRzJT9BMQ52fz+ACRRFA/ygXxLiZQqSLkGxFpIMCXNhTg6+A5TYmr
	m205Zq0mcqe0dyGaAnvSCWLL4WhFYedzP9zaMJYqFDjFK848AlSqd1F1lxIv1FYSSG9wJK3FeCz
	OnS+g+wodbttujKEPcq1dRn3qCEC3f63zHbUaF7U0mq/T/U003pH3Rmuv342E80gyIkXePwslsN
	1tuuubKxZ4+2Oa3tOl7V4UVjnKsFn0VrrfgLY9m+VwuTmiajGpgjJGlBUerUONWqlingot8tUEt
	zh6u
X-Google-Smtp-Source: AGHT+IHDatiBRoIWwmUQ8rVBdMNdL4Mcz8nzQA/dLpj0wUKVfFU1d2TbucDXr8tjCjv/lds2UQqKAg==
X-Received: by 2002:a05:600c:3546:b0:431:5044:e388 with SMTP id 5b1f17b1804b1-434a9de78d0mr187356325e9.22.1733139415315;
        Mon, 02 Dec 2024 03:36:55 -0800 (PST)
Received: from localhost (p5dc6838f.dip0.t-ipconnect.de. [93.198.131.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dd99504csm10275406f8f.85.2024.12.02.03.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 03:36:54 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	=?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kiseok Jo <kiseok.jo@irondevice.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Tang Bin <tangbin@cmss.chinamobile.com>,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
	Yang Li <yang.lee@linux.alibaba.com>,
	Igor Prusov <ivprusov@salutedevices.com>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: Drop explicit initialization of struct i2c_device_id::driver_data to 0
Date: Mon,  2 Dec 2024 12:36:41 +0100
Message-ID: <20241202113641.1003836-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3641; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=Bswv2ShtZ15EuEQneXOzrttn0rUwfA/DlAUnJf4MQAQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnTZvJNx/F0I5Qb9qkzsGuYkyoo72y5wqfySfJ5 7IJSHQeUR2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ02byQAKCRCPgPtYfRL+ TnClB/9XFZJTTFfAaG9fQkpSBU9HElltsdBYGA7AOiTCGNvpZR1ZwTeF+imbmJ4GKZqQl9xq6qg 4Q/rfLb8DPw7o95P6hG9TxWRJ36Cgr2xR2Ox8kKe+M/Bu8AxVTOQTYeiWURC91JCJKmpSVY4fK9 7XBPHeQJJKHyHQ0DgqDV5QdVTwncw5l0nhDcWicsGKQdwcpfaDHlICCpDbaK+zjWohRTpcCb0jY bf16wDBqXGRwOJFDEbi91nCfEL4YV1WbjX54pA9u78NuU+zjvAGKcyaGjfe4Wzxe0tT2LYoUTUS GeRPMD7CtJ0R4t4QvZ1zVID44/6vQywEuTf2RY8AYFeWR5nD
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

These drivers don't use the driver_data member of struct i2c_device_id,
so don't explicitly initialize this member.

This prepares putting driver_data in an anonymous union which requires
either no initialization or named designators. But it's also a nice
cleanup on its own.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

this is the third iteration of this patch (after

ba2a2c378ada ("ASoC: codecs: Drop explicit initialization of struct i2c_device_id::driver_data to 0")
6f9faf1410fe ("ASoC: codecs: Drop explicit initialization of struct i2c_device_id::driver_data to 0")

these unused zeros seem to repopup even though in the mean time most
templates should be fine.

Best regards
Uwe

 sound/soc/codecs/cs42l84.c | 2 +-
 sound/soc/codecs/es8323.c  | 2 +-
 sound/soc/codecs/ntp8835.c | 2 +-
 sound/soc/codecs/ntp8918.c | 2 +-
 sound/soc/codecs/sma1307.c | 4 ++--
 sound/soc/codecs/uda1342.c | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/cs42l84.c b/sound/soc/codecs/cs42l84.c
index 17d5c96e334d..88cf3c03986e 100644
--- a/sound/soc/codecs/cs42l84.c
+++ b/sound/soc/codecs/cs42l84.c
@@ -1087,7 +1087,7 @@ static const struct of_device_id cs42l84_of_match[] = {
 MODULE_DEVICE_TABLE(of, cs42l84_of_match);
 
 static const struct i2c_device_id cs42l84_id[] = {
-	{"cs42l84", 0},
+	{ "cs42l84" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, cs42l84_id);
diff --git a/sound/soc/codecs/es8323.c b/sound/soc/codecs/es8323.c
index 6f4fa36ea34d..a9822998199f 100644
--- a/sound/soc/codecs/es8323.c
+++ b/sound/soc/codecs/es8323.c
@@ -758,7 +758,7 @@ static int es8323_i2c_probe(struct i2c_client *i2c_client)
 }
 
 static const struct i2c_device_id es8323_i2c_id[] = {
-	{ "es8323", 0 },
+	{ "es8323" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, es8323_i2c_id);
diff --git a/sound/soc/codecs/ntp8835.c b/sound/soc/codecs/ntp8835.c
index 796e1410496f..2cc4c6395f55 100644
--- a/sound/soc/codecs/ntp8835.c
+++ b/sound/soc/codecs/ntp8835.c
@@ -454,7 +454,7 @@ static int ntp8835_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id ntp8835_i2c_id[] = {
-	{ "ntp8835", 0 },
+	{ "ntp8835" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, ntp8835_i2c_id);
diff --git a/sound/soc/codecs/ntp8918.c b/sound/soc/codecs/ntp8918.c
index 0493ab6acbe4..a332893fc51d 100644
--- a/sound/soc/codecs/ntp8918.c
+++ b/sound/soc/codecs/ntp8918.c
@@ -371,7 +371,7 @@ static int ntp8918_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id ntp8918_i2c_id[] = {
-	{ "ntp8918", 0 },
+	{ "ntp8918" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, ntp8918_i2c_id);
diff --git a/sound/soc/codecs/sma1307.c b/sound/soc/codecs/sma1307.c
index f2cea6186d98..480bcea48541 100644
--- a/sound/soc/codecs/sma1307.c
+++ b/sound/soc/codecs/sma1307.c
@@ -2011,8 +2011,8 @@ static void sma1307_i2c_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id sma1307_i2c_id[] = {
-	{ "sma1307a", 0 },
-	{ "sma1307aq", 0 },
+	{ "sma1307a" },
+	{ "sma1307aq" },
 	{ }
 };
 
diff --git a/sound/soc/codecs/uda1342.c b/sound/soc/codecs/uda1342.c
index 3d49a7869948..b0b29012842d 100644
--- a/sound/soc/codecs/uda1342.c
+++ b/sound/soc/codecs/uda1342.c
@@ -319,7 +319,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(uda1342_pm_ops,
 				 uda1342_suspend, uda1342_resume, NULL);
 
 static const struct i2c_device_id uda1342_i2c_id[] = {
-	 { "uda1342", 0 },
+	 { "uda1342" },
 	 { }
 };
 MODULE_DEVICE_TABLE(i2c, uda1342_i2c_id);

base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02
-- 
2.45.2

