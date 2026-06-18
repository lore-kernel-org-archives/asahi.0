Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6598435295C
	for <asahi@lists.linux.dev>; Thu, 18 Jun 2026 11:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781081; cv=none; b=DcVq10Tbw4FlNDfwK3jaXgNPX3CwtAyQQoRgJmRbuX4ry5jQffxXYGtQqos3yZ8QVeAlxdLogedo9PLBtEFXs99HBTljNqJroSd18ZM34S2eRe/fM7LqRhSGvuPNXlC2kxg1jUWxMfF0icUpjXnpsxZllNZ6kQXILB6oD7+boPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781081; c=relaxed/simple;
	bh=cWUAkEKedyEvWcXqXWHihLQEc3eXm0hRijmvJp5Fa/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QHbwlaeqBAMYjqiAJFZJuXF/ONruvRO++IKO3xJL7fTY5C8NtIaWfrc02lBjVvaCP7MzkqenxTqSzDDYojcdX/k1tfZacdYkTJ+yJUQqkFUFJ9W00PHcuXjMh9h1431yPmRFAxfuRcefxntoVBhpnkhODXwLKRLCh+z2rIVMTeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ny4aYn0d; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ny4aYn0d"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c6c57c5bcfso7467765ad.1
        for <asahi@lists.linux.dev>; Thu, 18 Jun 2026 04:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781080; x=1782385880; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajmHWU8IR5TpfwHKx/3DZ34C8KY0J7+sApJwYsPJ4Rk=;
        b=ny4aYn0dhLesW8OLfoRinBLXJpRpI83qCYuo/CYvPygj2lDYZKAJQ7e1cFd9PsEOSA
         pgegdoWGxr8BmKcBiUNfDNR0Wmg0geio1wr7SncEg0uSVG5AwniYqiaCK5lqVF8l1niM
         zjdIFpdnar5RSumm9r1y0vUsPJCjWupa11Ff4FLHMR7qZa71ZXkTyhd8bRaxkdf4fdJX
         J3fJRoBpom7p9+DE9urDfIL1Kaph9W30NmkQV/bLxP34p9p3enMiaCzNrP7Tee7DITBQ
         6uIANZBGwMt1tWzobBEnY92Ii5mvbhCb7cpDZ9NRJZHwe04gl8q0r9Z3avkmLDbtivmS
         0JDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781080; x=1782385880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ajmHWU8IR5TpfwHKx/3DZ34C8KY0J7+sApJwYsPJ4Rk=;
        b=FIf0EKU8sNPGIhhQFeZRUkoas5hoR8lqRooM/PGjNW5vjmM85uyG0ppKYX2DIwddqG
         tBeKzsuyt0tuC+rWlJ4NnQcGrxncZ83Zm2pg2iTxuESjV7yyn/hFTQrrQ0obMbh1elUe
         HYBgIaPERlVaqx/g89o1sqzwmeYex/vL1x1alRZapq+QZ87XxgiTuM7bKl8fXOiF8Vdp
         iVLL1xjBcF6MdnKaM0QGCDjwXJBAWTbWNvzV/2IAmJYsvmQTJcynPQ2Q/Y6NCshtm6e6
         zUKwd/1e+IJX0zdnjd/XE3sxbPiGDoNfeedYj7ehSLur4aq+XRy/23SyDfl4IcXdpxj3
         rIZQ==
X-Forwarded-Encrypted: i=1; AFNElJ+NloPQXWKoM34s8ynIGULf9n/aVysq6JScz6gkJYWjFxFKgbDmH1jqkaaLQQl//qGQq9llvg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7a8hCOXzN7vhS/00Y7431j596XuFXMRoPysRZfXuCIlJ5aakV
	kM9J8cUCXlBxZnLLeeWgxvXxBsudSr0EUV0Mwbkd3ksE08iMrCvgc6PB
X-Gm-Gg: AfdE7cm+hYRQBs3+IyNtuIp2hMfzYyLYeLAD1FdmKsK5+oN9EL7ndzJGrlnX2OaKHLz
	twfXxULAO/+MkJNo/IJpXNNSNnRLBv2mgpb2WEFamWoRLf0RkhA2fv7NXWQDXoIMHKf/VE7O8vg
	St6K2nUEN1m4fmWr9vRCjf4eoz2FwyZCRYYUZ3TcZ2IwG2rkWL/0rl1cvMf27MKTQNP1zllDh56
	pFsGgP5VRiUIy47WtB1PPF4+ozlu4XlDtkDA/50h+XVnv/vWqQe4C8dthf0DxGUmMY2I7u7B+I9
	Gzrw/GOYZMxolppgqpY1vFgg2sUHV0FJYcVH/Hb/affYbctAmmgOiN6EFcwNxeekViw4sA6zlCb
	HI/VmZ87LDoX1cWkfgoaRKvkhPjALcIdtkSNG7S/Q2WkfxTHqd9rHL6TCYexJtRrnZBtmYNjkNj
	npW41YzLNWI+ARoQ9xidlUx/whD8dYCRCDKUt/S0TAlUZppls=
X-Received: by 2002:a17:902:d4d1:b0:2c6:a99a:52a9 with SMTP id d9443c01a7336-2c6bbf99280mr82302315ad.7.1781781079841;
        Thu, 18 Jun 2026 04:11:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:11:19 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 74/78] ASoC: codecs: wm8962: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:23 +0700
Message-ID: <20260618110827.232983-18-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wm8962.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index de18b1f85a32..6389990944ed 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -1568,7 +1568,7 @@ static int wm8962_dsp2_ena_put(struct snd_kcontrol *kcontrol,
 	int dsp2_running = snd_soc_component_read(component, WM8962_DSP2_POWER_MANAGEMENT) &
 		WM8962_DSP2_ENA;
 
-	mutex_lock(&wm8962->dsp2_ena_lock);
+	guard(mutex)(&wm8962->dsp2_ena_lock);
 
 	if (ucontrol->value.integer.value[0])
 		wm8962->dsp2_ena |= 1 << shift;
@@ -1576,7 +1576,7 @@ static int wm8962_dsp2_ena_put(struct snd_kcontrol *kcontrol,
 		wm8962->dsp2_ena &= ~(1 << shift);
 
 	if (wm8962->dsp2_ena == old)
-		goto out;
+		return ret;
 
 	ret = 1;
 
@@ -1587,9 +1587,6 @@ static int wm8962_dsp2_ena_put(struct snd_kcontrol *kcontrol,
 			wm8962_dsp2_stop(component);
 	}
 
-out:
-	mutex_unlock(&wm8962->dsp2_ena_lock);
-
 	return ret;
 }
 
-- 
2.43.0

