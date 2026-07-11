Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40A224679C
	for <asahi@lists.linux.dev>; Sat, 11 Jul 2026 01:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783732338; cv=none; b=mlr3tuhAZz95AbC//ahzAn890txaUqwBoKLfDddLhsvSjzblgjYvcU+TqkyLFJzhn5wg7kIAp/4ATxYg7wl/PFwxSyyXCaLPslHMMNZ4qblmMZds4Vo1NpL5cYDHusgPlw+1V0B7pVQcvJmzaFXX++Pz7LN3d5hA8qrJidI6a34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783732338; c=relaxed/simple;
	bh=5F6Wpn2wEPSmmQLDtQuHy5iGCnuqtiFIo0tJtr1nPuA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SLMdybCuc++i09uRRbfERy/R6ha4GJBwpcp97xPaGWbW6uDOqETo8iPnlymSluKwYlTrIMzGptpICKyOYyoV2rT2SfF2MHYHomRKcp2ecPfC+uF+sGrAz6crz/mTEeO2jaKjSlbtQpUAUveHA0MJN5IqxDlqNnB/wEO5a/PqnjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UNLerOtU; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UNLerOtU"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84864b41100so1294283b3a.3
        for <asahi@lists.linux.dev>; Fri, 10 Jul 2026 18:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783732336; x=1784337136; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BmMcSTCtgId6XKkksH0TURh3OjzppyxEGWxNMVEqaKU=;
        b=UNLerOtUpbSjkckv5Uq2P9yZsYXOcuHUKhJXotiHK78MklJfZsubQB8bkIAJnDHI0P
         B8u4eSjq+8DlIXfso9oe0ZvsMK994rhtWUGuPORdOd/oaVM0CmCY2KrxQQ9+mDHz2QLz
         Li2AI0KNJWF1JK6f6puFudFkd75wiizH3dP6HEheyW/rMm1mQOrD9J0pAMTE88ERlNqq
         LDLHhYGPzY55kxqdsDhzZ+/Xl4hg7vEGnINPwrFMCP7l4Mv4S4qDs5L9Zg628cKfRS+h
         7mGUkyj+CZi9V1t3j/N+x3S0w0bh23x/S5lCuNXvJBCNZ72nJ28L7aiOrF7tVe2zhZYS
         Tkaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783732336; x=1784337136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BmMcSTCtgId6XKkksH0TURh3OjzppyxEGWxNMVEqaKU=;
        b=RvxMsMXSjX7HqEV/riLU1Shgyh+oLbxQXeK6/8QzvPj5LwGe9sbaQHpxrV2SLQe1Re
         MFe0zT8nRfKTHDxW9zilq/O3SSy7/OtT/nrOid5tg1MeDstVABCfIfc1hdh5KVsklCQP
         0s5ioxPXbXMoaCFjo/XNNijZR25THy8HQ1trz6G21nic4NVJLglkrY6jG68PaZW2Qwxm
         d6FYynWgJI6QRLEsdIVv0f3NCy0VHj1I/m7KteBU3keVLu6nk/Wbrq9E6k/WW9vFlTai
         V1cQWlDT+o4y6r110zAnLjL02yXjaaFPE1l0SYv8TdiSwx+mQ6NEycu8uU+dB4y0eaSD
         r8Sw==
X-Gm-Message-State: AOJu0YxVNItbbjClxt11fb4CGuP8iu5/WRgLtznSsLE1PvdYpud9V7kY
	g2I3ZsizrbznSRs0D7xyLfFyFgpG4ADAya0sp8nB1KbACMHpVC8n4q3A
X-Gm-Gg: AfdE7ckUFntUGkBEzDPgMub4jP/RwP9wIWsdvcNnhhnl1JOfzvewLz4LnuPXYlxrWox
	S2JHMGGzCpnkoJn32ikb50zzwwIxXoTNEux/tG1QLyDaksmfSNMV9EhwlLo1Xr+gEjEWKAxp1UN
	RuacG28BdHi/xeDFB6vcCNX+4j3edZhZSs/OrtBKxxS4wSAn3+8gTM5WMos9l98O+JBprdeNn/U
	ENSMBaVZIMeW3qhd5jNGfpC2vlg/wm7pJ4aGLpdWwzzwvTSeiX7T2yuqkFdHV1wqWx6U/k78gVn
	KCxQuf9immeftzNO8k5Z5RtaIzr/874jVyvfd2URGohtSUjw8Ww2PKOC9Mg3MlL+HxAapP9ku+w
	EN+BEJXEFAndECSrrayaZqBs7MVzNEhSGVWSqOxV1L9geYb9iRFVBCuIexFCBV6Q+45fNNWeQR7
	Uha+KUOOw1IxGUH0DPt5ay4tek6Hq2LQVPjGlLEyTXWMKb5bOrZyEx0EF524m9dPwnRsyiPYnSx
	ivTNXjYfxDMKHCNGBv6vJyUOQcX7bCoQMZjlUZRSjl0AXeb+mx6GDgoj/exTbNsxA==
X-Received: by 2002:a05:6a00:139c:b0:848:4c3d:659f with SMTP id d2e1a72fcca58-8488990d0b4mr1091981b3a.75.1783732336282;
        Fri, 10 Jul 2026 18:12:16 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-848530c5a12sm3751929b3a.5.2026.07.10.18.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 18:12:15 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 11 Jul 2026 11:11:25 +1000
Subject: [PATCH v4 7/7] ASoC: apple: mca: Add delay after configuring clock
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-apple-audio-redux-v4-7-2994d87c2f24@gmail.com>
References: <20260711-apple-audio-redux-v4-0-2994d87c2f24@gmail.com>
In-Reply-To: <20260711-apple-audio-redux-v4-0-2994d87c2f24@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1040;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=YuGvJxGd7rMKWAmYwBfPtKfCWVffFa0TGyJifMJaBa0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmBM7yV9qluP/feca3d3d46e3/JI5sObNq/6039+WU8t
 7nqv7CrdkxkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKbaR4Dhf9r3Z9Gn2WWEWJZHTq4yZGU9cHiKtmqAnoWgj/7bcrEZ9YwMTVL3P7F
 Ebr/It3yGMZdyxPVMzUyWbxk9D7YtDFh1MNmeAwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

Right after the early FE setup, ADMAC gets told to start the DMA. This
can end up in a weird "slip" state with the channels transposed. Waiting
a bit fixes this; presumably this allows the clock to stabilize.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/apple/mca.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 322dd8771111..afb3754a8883 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -225,6 +225,12 @@ static void mca_fe_early_trigger(struct snd_pcm_substream *substream, int cmd,
 			   FIELD_PREP(SERDES_CONF_SYNC_SEL, 0));
 		mca_modify(cl, serdes_conf, SERDES_CONF_SYNC_SEL,
 			   FIELD_PREP(SERDES_CONF_SYNC_SEL, cl->no + 1));
+		/*
+		 * ADMAC gets started right after this. This delay seems
+		 * to be needed for that to be reliable, e.g. ensure the
+		 * clock is stable?
+		 */
+		udelay(100);
 		break;
 	default:
 		break;

-- 
2.55.0

