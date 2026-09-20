Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E36E3CF204
	for <asahi@lists.linux.dev>; Sun, 20 Sep 2026 04:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880158; cv=none; b=J/UHmFqj9LtjckHUKDh7IUINKaZlf7rmZ+uPbTo0/I4dwfzDf2IEW+WYu0k/oMaNLPbxAw5gxNKgf2ayxzJKA4aVXsEZYK1Zsaz0luikqp/wz2ph/4hGyLbQMVkxKg3fRarKP46y9q/DbMyJWMXnHaRyZB+mId7v3NG+ZsYsUBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880158; c=relaxed/simple;
	bh=kx5kKJMfW173nOCJWUzv3mwvx0YJN3LDcuLBMFQLo60=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EUhWKzgE5ef4gks/0DNuHajWaNjXgoV7JeRHrYyQKZzPIFX4AWQZHjCM0Ra6mz3v4oD2VH64a4I+5Xjl0mkNyUHbWsrzBtaHWPozdUkwDaLqsc9Mchvzj7p5XiC+FnGpsDSJl+StcJuhNQOfYfalEGV7ufOjeU1ZEL6Rym+9tZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TLEYxIYo; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TLEYxIYo"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f066d8so6962515ad.1
        for <asahi@lists.linux.dev>; Sat, 19 Sep 2026 21:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880155; x=1790484955; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xzyP2lP6mDo2Tguvti7VeQ501kHVG6IAx4yYOdJMaeY=;
        b=TLEYxIYohQvnBjz7eaFe3NJbQbU7Cs0KnkhFn3Doo1z7Dtvw3bF6yvVcD4WkdG+M/x
         nx8Hb0h7LTlQLaAOugqhpVqpUwTDBbhIjR4y6nb9qEOCfi7cyiXaA57nb3q9BHhvg4jP
         F5Sw2AIJsucEuLwxUQgXJmFutJI6bEtg716xtqnoyneV3wkSQZasKTMx4bwOs3IWz1Ln
         examHMQ8J7fNKr158LGqyuyVogM6sDWV0sYheSJ62lyNMQIA5BDJr2e1QkVAm0n1YFGD
         2qGT3j/UypuzvO42REoaoP8P9IY9D8jOYi2jW8/idVxHK1K4/W6uRZLIZN9SQu7eyI3Q
         ZPCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880155; x=1790484955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xzyP2lP6mDo2Tguvti7VeQ501kHVG6IAx4yYOdJMaeY=;
        b=VnEv5JhZdsGH3H6Td2XsmZKEDVxBQ4Q1hOh8HjF5hn631FpaiQa+/XFpVmVKhAEIzB
         S3jeF0Uij62qb1v1TDwu9SuDaukGwSW2gsDzpPe+y7I1TBKISA0XkW5eufEokFnGVlWK
         hPi4qAVwPHU286Af4x2B87skN3WtY3REydp4W9YBJYCIhuxaaJzwcjV7MaHSmS+sg6HM
         fULBl7kZmliU4L9EMy0HPrThYzQ0ZUOj3tdGiPLh05NMXDOCwYz7gBpi0dGEVS13BV6b
         7cDehhPyOUFe2SbY9Z5+pmu7A0rAoXbnekrGa+KJZ/9azZ5R+OCN/CMWhYJP3mYigbFx
         lgPQ==
X-Gm-Message-State: AFuF++kSUoYc52g8ER+vLQHfJTAq9Y2d9kJnY4/5Cxjj+kIrpKl4GWuL
	BzBT25dRIUxpPDQvqGny+6CcFxNDInjYFtxWdAfUiA/8WVV3MUyIsOd0
X-Gm-Gg: AYBFou2ms0ZSq6+4b2Hv78d6zlRvljn039RMxrjuhJHy5xtoqgMowkivVszvSG6FYT5
	Xrp0sZ4I6rWpGMiN4u2rlC9ovOadLpskJPVNcg678YDOwZbLTSVqlrei7j/l5Gaa0z4fZfg6uOk
	Tl/e0C3KaFqoKAn+BqZDYpN0B90xqX7+LlPSrs0uSU1+jYY7mdZ2wvXpWDyw7Eqmlge0J1QKCQV
	RnvUKNJ1ZM0eoJD15MCJE/2G1kGXYDJOKpPD0zWiOXeHFNZDulgHoWavmoQKtuFCEIJ/D1nQL+c
	3Z17UXoZIkqq2LKDYzngB7s9YxH58OlofwkJi5gNd8nRNWfXMacyA5BYpw/uI5LHCktkLOKGw5E
	mRyVJSS2lZkz+0njciWdFAlRH2N19JdULO2+ND2Vt/fcD97PsXrqDF8Ay1Jsm9eTspDmaJqJhA/
	irRV2cpgISjnZWIeOT+RSUU0XZ8k2+v5hjM4jMxTgGH0Lv4E3jIAX+F713ljyiTcrPFfIg75TCb
	epE68g0IlFBl8awFqso7Vb701bx59ft4F+3zbW8TVU0SQd30zsG7phit3tALeRQ4xDe5RAZCNGs
	0InLEcGdJlen+778+/USWdVr/4XxG1ybocFphW4o+o5ly0E=
X-Received: by 2002:a17:902:d2d2:b0:2dd:ad73:5b5a with SMTP id d9443c01a7336-2ddb224f33bmr80978895ad.21.1789880155541;
        Sat, 19 Sep 2026 21:55:55 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:55:55 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:44 +1000
Subject: [PATCH 05/28] alsa: pcm: Remove the qos request only if active
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-5-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1854;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=sB9amKGCujymCV5dzhnXLQgtXCZDFSeONKc8RiAMJk8=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0+UN5p3NCRDcX2rwtCeY+U1o1BqxOV9aeCT2Pg2+s
 cW76L9px0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKojPRn+adW6m8+Zu2WmcdojE37fL2mVgR13MvV2nf3JeWLWmeYpRxj+mShcjNp
 sw+Q7MyPW1PitzbHnSd8+notYbJv1bMt81fmGPAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

Fixes warning:

[    8.502802] ------------[ cut here ]------------
[    8.503445] cpu_latency_qos_remove_request called for unknown object
[    8.504269] WARNING: CPU: 5 PID: 2790 at kernel/power/qos.c:322 cpu_latency_qos_remove_request+0x48/0x98
[    8.505499] CPU: 5 PID: 2790 Comm: wireplumber Tainted: G        W          6.5.0-asahi-00708-gb9b88240f7ae #2291
[    8.506777] Hardware name: Apple MacBook Air (13-inch, M2, 2022) (DT)
<snip regs>
[    8.519099] Call trace:
[    8.519402]  cpu_latency_qos_remove_request+0x48/0x98
[    8.520027]  snd_pcm_ioctl+0x86c/0x182c
[    8.520519]  __arm64_sys_ioctl+0xf8/0xbd0
[    8.521020]  invoke_syscall.constprop.0+0x78/0xc8
[    8.521604]  do_el0_svc+0x58/0x154
[    8.522026]  el0_svc+0x34/0xe4
[    8.522409]  el0t_64_sync_handler+0x120/0x12c
[    8.522951]  el0t_64_sync+0x190/0x194
[    8.523408] ---[ end trace 0000000000000000 ]---

Fixes: 5371a79be97c ("sound: Call cpu_latency_qos_*() instead of pm_qos_*()")
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/core/pcm_native.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 6d32c12fb79b..88c83e5fd6cf 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -971,8 +971,9 @@ static int snd_pcm_hw_free(struct snd_pcm_substream *substream)
 		goto unlock;
 	result = do_hw_free(substream);
 	snd_pcm_set_state(substream, SNDRV_PCM_STATE_OPEN);
-	cpu_latency_qos_remove_request(&substream->latency_pm_qos_req);
- unlock:
+	if (cpu_latency_qos_request_active(&substream->latency_pm_qos_req))
+		cpu_latency_qos_remove_request(&substream->latency_pm_qos_req);
+unlock:
 	snd_pcm_buffer_access_unlock(runtime);
 	return result;
 }

-- 
2.55.0

