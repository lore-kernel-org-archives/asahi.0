Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980E73CB544
	for <asahi@lists.linux.dev>; Sun, 20 Sep 2026 04:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880166; cv=none; b=Nf0awN+Q2hMwUnwx7JcvNLs4bSenUYjqgsOSfLRVo6amwWzehSqNbdXkO2EgB119lryMFml4X+ynsyfGc1QkvQnpDSdJZsztXWrv2qXF0tC8564fh1uq6yEHWPTUON9vEzf+R2bb/PV1DF3Po0jES6CzK/1WDaxKVsVIMcsdhPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880166; c=relaxed/simple;
	bh=o6Mmzyd7BRwU9H5C74qoe+G2Tq+aI/IRIDM1u7th/B4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hByhLTHM/KjbqArPLkCVZVYL9xND0eqi3lb55sfYHJy5e/xBPTCFdI/DMqQrWa/rPds5Otke+6Zha4OoRNhcwli2C4YKfvg5C4FugoY2gkxZzgUnGZOJVAwlehqAQ9y/m+Q0pTBGTIbD9U/NA4xWzu37SYfEY9DWcle0BUd3Jjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SisglCQu; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SisglCQu"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747eb79f7so13408695ad.1
        for <asahi@lists.linux.dev>; Sat, 19 Sep 2026 21:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880165; x=1790484965; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2MoZTcxnKczPWM7o1mzqY2ipongGCpZ7IBnK4RjYvUM=;
        b=SisglCQulTHVOmQzVBbBM9IaEUotIZDXo9X8JzUIUrokGyhOPmASEpwCNKCSQ1sUjs
         s1j076FWvtHROSDrFQ2VnCf+P8x4gSIYUrztJh42CEvkTfNKdAPTrj/P1KOT1mjZy/4K
         wyE4DBj17uDPahHs010YeUIE2H3PLRCWG8FRjXeruOuD44YhxjbH1QfbN0K5l7AsMCUY
         w0bmOCS/OqXtWPIJb2k9peyFQGg/tNCOgMdkmj01KCJmRrT/vkzswI+c6Sc7k7slVi1v
         i5MeSQdY9lsXzKNbndm25EZ3MOg488ZSSOaHgzUw97AigW5znFVIfnPMpvuGyLwVOe8T
         kRRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880165; x=1790484965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2MoZTcxnKczPWM7o1mzqY2ipongGCpZ7IBnK4RjYvUM=;
        b=MlAdCi3M3i0ZRwKSuFW2N7Ku3f3yvwmiCAkzx8YwY2MQrTLcxHCFR+8Y/xWyinsEEd
         epsxY861gvVkKQQEe6x93G8M4MLeXv0k5KhdqAmDMUzMkpi5u2E1yPA9VHc9cGI7eGbG
         gCbDRt9l/OjMm4m4OwRRdAdOtQTwp4tn8yC8QlmUw9rnrmdD+UNGEnjlfqd5T7vSpsfn
         LI10O3B9Jdfa0Dlaareh4C/wekhcnU2emRctSXHViYKFMPcJTIj8pkTJXYDIZ92R79VL
         Gh+x8GRvEI0FCWKk40WLDPGutbFwcl2lrQUcktd7R8pgmNNJdTlDt/t5thuGY8xkP7yV
         bx0g==
X-Gm-Message-State: AFuF++kvrUJ7tQhLzE+cUgB6J31YbMjBDKFGC4Fz59nKRxn+J/r3p7oL
	bzj4pcF8IGsRiISeCzN4XPbKdFIKrTzsDSuoR/DMj/3fRAsNozLupLZn
X-Gm-Gg: AYBFou2QADZOOP7xakFwO/LOiULIoR6eQeawgjcC6v2zM1ajAH9dOwKWZ0mfZdrcUvl
	vz+gVh2+17XJm8avDKad/4TBR8MS+001PteO9kcBgLt97OFsB6xnGcjHAkO17CDXb/Gg+ctvOCD
	41vz0tODZKcSWumo/ng1nlmv6j90LQQ7bkj7a7b1PtVN9RETF+FX6OSdJseTx/sAItSgrWzpMVE
	wytqJb+RO3727svP+g3en+X3cFYVFPDg/Jov+OCV0ITY63APZv0gCdiSna9o2skUwW+QCRQNvg6
	pBkLqTlevNHbD94r6WUGyIvTBDoZPf2llMMt5NTqa7uPrSifAhiONVMXgsexkpBb21d3cg0ilU9
	AwD1uGAbV0yMphl5SqVQNAniu+QjhY69dR/9n113p6mP9cSGmNHwPVAof2/twDv7f2jl75m9kHL
	NRnxGpXraDV5fRhQVqCqFb7HssAjvU5Q3HgT3OMFbcfMgCwkoeH9igWdVbzt8V2+vZOX3HZWF6g
	oMWyl1v8nhCKdNykFHzGkuvU+pC2RTKnuxkIJYdyWT09TJM5eh0C+6GxkjOrC7sKzWb/AzHWO+t
	1kGyTjO+KlkSieYYPWe6LV5+D+s8kZhAyMfA1UdNlLsu7Z0=
X-Received: by 2002:a17:903:fa5:b0:2dd:c053:82f1 with SMTP id d9443c01a7336-2ddc053841bmr56459515ad.40.1789880164957;
        Sat, 19 Sep 2026 21:56:04 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:56:04 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:45 +1000
Subject: [PATCH 06/28] ALSA: dmaengine: Always terminate DMA when a PCM is
 closed
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-6-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1367;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=zGb+++j8iUZe/cn0Z0nFJK8T6VZ7UceNkKMJL+0HzLM=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0+UNCs+tnF8jm/Fr9rnD+qaz/5/MlJvafvnEpdXpu
 SeWZM6J65jIwiDGxWAppsiyoUnIY7YR281+kcq9MHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEz1kxJGhmuLz9eF5142Xp283+/t0Rc/gw80iqvZZe94zfXn23/Xh9UM/2yWb2j
 yPuE6S9JqBqt0gZDlkrU7xeS3e7Hc+lrDvndKKxsA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

When a PCM is suspended, we pause the DMA. If the PCM is then closed
while in this state, it does not receive the STOP trigger (as it is not
running). In this case, we fail to properly terminate the DMA, calling
dmaengine_synchronize() nonetheless, which is undefined behavior.

Make sure we always call dmaengine_terminate_async() on PCM close,
regardless of whether it has been called previously or not in the
trigger callbacks.

Fixes: bc0e7345168c ("ALSA: pcm_dmaengine: Properly synchronize DMA on shutdown")
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/core/pcm_dmaengine.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
index 1306b04be171..e59b561b849d 100644
--- a/sound/core/pcm_dmaengine.c
+++ b/sound/core/pcm_dmaengine.c
@@ -355,6 +355,11 @@ static void __snd_dmaengine_pcm_close(struct snd_pcm_substream *substream,
 	if (status == DMA_PAUSED)
 		dmaengine_terminate_async(prtd->dma_chan);
 
+	/*
+	 * The PCM might have been closed while suspended, which would
+	 * skip the STOP trigger. Make sure we terminate.
+	 */
+	dmaengine_terminate_async(prtd->dma_chan);
 	dmaengine_synchronize(prtd->dma_chan);
 	if (release_channel)
 		dma_release_channel(prtd->dma_chan);

-- 
2.55.0

