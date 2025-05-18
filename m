Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE518218E92
	for <asahi@lists.linux.dev>; Sun, 18 May 2025 10:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747565497; cv=none; b=ZCG9gZ39UhVjl4a6nBxfkT3OC4D998cJmDdktYx7fHaQWRmTh4t9SO8Yo79JflQh7DLzMl7kjZltPQWhHaf+Lcspyj+7zCMP6XImQCmHuHE6NwiKZg0ORlhDFHsH1abfoa40dzHhXb02ed1Rd/vzLf65j1O/vv1lbV0quN11asA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747565497; c=relaxed/simple;
	bh=PIZEaBz87MJdSw7eO9zCitJI2ND1grAk1GZ/kO5+Be8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iXRXa1jkp/+q47Yn1Y1LBy+a3boXf98dfn9FI04X/iQ8jEwDdB+JPo5hJbZyxo0bLabSeMRuO5drFIuER+xOpQuP475Ua7iH1Q5JzjNfSgAbdfoB76LBCT5mz7Cf1iFRQSl1IZPp3S7NI970eSeLAXQIlyOY+FEpHZGk/oR+kLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P8DYrYkt; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P8DYrYkt"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b061a06f127so2340676a12.2
        for <asahi@lists.linux.dev>; Sun, 18 May 2025 03:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747565495; x=1748170295; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ldh01POWj6tZC0Ymrmq06kriivz8DVjOcTeZNDTdnk8=;
        b=P8DYrYktDgaITrfoIqDRRNamMWvXc8lWhs6ktCo/CR9C3JZWyUDueACl3iBysXBPBM
         n64EOc0BAmMJ8yUm5Li5qyDzuRPNgT8dXrSZ3X3kLe4XntAKfPkXysPwwXvIco1xqPbW
         K4rrPBCcbx+CiKDwiR2RuqaVF/r3k4HI81GheN1MY1ZrwGJTBnGbZHryYvmNDX7X4Iwg
         VwmHZ1Idod9+Eo9RLz8qxu9CcvCKMMzL9XRyJb+Mf4TkUUsW2yirkZ+vTz/IReDp1rAm
         l6V4Y2hf7s85JrO6AqAXd9yLNJHhTqjP/R15hibehI7F1EY5ZOmC+jGni47yqtOzn07F
         KnLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747565495; x=1748170295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ldh01POWj6tZC0Ymrmq06kriivz8DVjOcTeZNDTdnk8=;
        b=eAOHM6mu/qpJGXSGVGExf8eNGeYJxXCKGObe7utGO1lNGuhpvAajDQ+YlBsBuvKAvG
         N+YHlejdYAiwpz4tGgLjzD+Y3uj1VbqzhEHadOUYWDNb1uWKZZbxAimdEj9Sm1r3Zh5h
         Ys+nra+wTl3daf65GFpR5nggXAIDp605FbttsSP8/8E5JN4UURFizA1U1fU32EfdMynD
         lyBQuPhuo3UbOfMBLyRxIp18Xw5amfQh+xEcFOZA7mrM1EB3dnVAXNZuF/NGqX1wJdfW
         U5X/ftkFLt7gBhKyi7QhD5W7SPyKQfXV/On7a0Euz3JCvVzNfHcqNXq2TyjuWIyL9+KG
         PqZQ==
X-Gm-Message-State: AOJu0YyNwDnh5bc3hCggqNHX8+N+WEuooERFYOUF2hAtbE7zNuUl4isR
	AoBfnciZQRjAM/4BfLO4aE4oJzjgwpvXZsAawyZms5BWuQY097J0q/xx
X-Gm-Gg: ASbGncs+0KgUYWgKMlDBX/QkdEFVeaNu+i3UeMGF1dSwg50fbUehEh4B5K4McpK1eXe
	j1kGhwcnOBWbEiTlaVqeK9r5HN3xaVxFr3x1SGLmwLHnqC+XHWvK6BczO2neqx3Jk1RA09wo/+i
	M1BL5ljN3LCjqZQIwxq/a5ctNgIxya6YnB67h3OLBnn29ldxgScuWPRMltflfCFzO53hGwHNmj2
	9QI6CDmzpjLhvmNunccV1MyWK2asL2/u0E0KHkp6i9A6x2SMPATHS8f4kXY4NiTlLl/xU3Ia/em
	8FTY/AkQTkTZP1Q0HekhfnzMCuF4gJOGXvmIFCnftjDRa5PgP1nSlAW85jILYv+dwxq/lvaEABp
	aQtr3aJr3fHs9aOPVlW3RkYiKwpHG5dxUq2gSr3F9VSs7z2xOSYFUlWc4
X-Google-Smtp-Source: AGHT+IFpn58gHw15Sq4sK88eTlsGZvNrZWJkEc3EHSOcZtUAiuMgcXKlRSwxIx/J9egajfGRIdbHmg==
X-Received: by 2002:a17:902:dad0:b0:22e:4b74:5f66 with SMTP id d9443c01a7336-231d45a9ae9mr103931835ad.42.1747565495172;
        Sun, 18 May 2025 03:51:35 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4edd259sm41956115ad.256.2025.05.18.03.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 03:51:34 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 May 2025 20:50:52 +1000
Subject: [PATCH 7/9] ASoC: apple: mca: Support capture on multiples BEs
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250518-mca-fixes-v1-7-ee1015a695f6@gmail.com>
References: <20250518-mca-fixes-v1-0-ee1015a695f6@gmail.com>
In-Reply-To: <20250518-mca-fixes-v1-0-ee1015a695f6@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3562;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=jssRvxpVtihkyIdNcxkCIk90/+e5Xkywb1sJNStLl1I=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBmau2fMPn3uofa6CKvfO73q5TkF9NVLShd/elgmN2H1z
 Yv7nJUaOkpZGMS4GGTFFFk2NAl5zDZiu9kvUrkXZg4rE8gQBi5OAZhIjhcjw+s52/fc0Ht+7LgV
 Z9Rvr5fNyU8ezdU5qv55S6pY7JNUwRKGf/qmSlP+vWJjSb7JuWzR5GOZIVO+P0l2WO3ZXFTNvcD
 ShxUA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

When multiple BEs are linked to a FE, the former behavior was to source
the data line from the DIN pin of the first BE only. Change this to
ORing the DIN inputs of all linked BEs.

As long as the unused slots on each BE's line are zeroed out and the
slots on the BEs don't overlap, this will work out well.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/apple/mca.c | 31 +++++++++++--------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index be6ff55203121808463846bebda682cdd97fc42d..441da5ef3de1c0be1dc607ff2490046206660e59 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -267,22 +267,19 @@ static int mca_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 	return 0;
 }
 
-static int mca_fe_get_port(struct snd_pcm_substream *substream)
+static int mca_fe_get_portmask(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_pcm_runtime *be;
 	struct snd_soc_dpcm *dpcm;
+	int mask = 0;
 
-	be = NULL;
 	for_each_dpcm_be(fe, substream->stream, dpcm) {
-		be = dpcm->be;
-		break;
-	}
+		int no = mca_dai_to_cluster(snd_soc_rtd_to_cpu(dpcm->be, 0))->no;
 
-	if (!be)
-		return -EINVAL;
+		mask |= 1 << no;
+	}
 
-	return mca_dai_to_cluster(snd_soc_rtd_to_cpu(be, 0))->no;
+	return mask;
 }
 
 static int mca_fe_enable_clocks(struct mca_cluster *cl)
@@ -398,7 +395,7 @@ static int mca_fe_prepare(struct snd_pcm_substream *substream,
 
 	/* Turn on the cluster power domain if not already in use */
 	if (!cl->syncgen_in_use) {
-		int port = mca_fe_get_port(substream);
+		int port = ffs(mca_fe_get_portmask(substream)) - 1;
 
 		cl->pd_link = device_link_add(mca->dev, cl->pd_dev,
 					      DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
@@ -448,7 +445,7 @@ static unsigned int mca_crop_mask(unsigned int mask, int nchans)
 
 static int mca_configure_serdes(struct mca_cluster *cl, int serdes_unit,
 				unsigned int mask, int slots, int nchans,
-				int slot_width, bool is_tx, int port)
+				int slot_width, bool is_tx, int portmask)
 {
 	__iomem void *serdes_base = cl->base + serdes_unit;
 	u32 serdes_conf, serdes_conf_mask;
@@ -507,7 +504,7 @@ static int mca_configure_serdes(struct mca_cluster *cl, int serdes_unit,
 			       serdes_base + REG_RX_SERDES_SLOTMASK);
 		writel_relaxed(~((u32)mca_crop_mask(mask, nchans)),
 			       serdes_base + REG_RX_SERDES_SLOTMASK + 0x4);
-		writel_relaxed(1 << port,
+		writel_relaxed(portmask,
 			       serdes_base + REG_RX_SERDES_PORT);
 	}
 
@@ -644,7 +641,7 @@ static int mca_fe_hw_params(struct snd_pcm_substream *substream,
 	unsigned long bclk_ratio;
 	unsigned int tdm_slots, tdm_slot_width, tdm_mask;
 	u32 regval, pad;
-	int ret, port, nchans_ceiled;
+	int ret, portmask, nchans_ceiled;
 
 	if (!cl->tdm_slot_width) {
 		/*
@@ -693,13 +690,13 @@ static int mca_fe_hw_params(struct snd_pcm_substream *substream,
 		tdm_mask = (1 << tdm_slots) - 1;
 	}
 
-	port = mca_fe_get_port(substream);
-	if (port < 0)
-		return port;
+	portmask = mca_fe_get_portmask(substream);
+	if (!portmask)
+		return -EINVAL;
 
 	ret = mca_configure_serdes(cl, is_tx ? CLUSTER_TX_OFF : CLUSTER_RX_OFF,
 				   tdm_mask, tdm_slots, params_channels(params),
-				   tdm_slot_width, is_tx, port);
+				   tdm_slot_width, is_tx, portmask);
 	if (ret)
 		return ret;
 

-- 
2.49.0

