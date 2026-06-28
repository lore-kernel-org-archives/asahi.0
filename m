Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33493A4510
	for <asahi@lists.linux.dev>; Sun, 28 Jun 2026 11:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782646999; cv=none; b=DLFAKXUXSwvfmm/6MXlw2Co6muRKH5ujCpB0adv/ZVNl1rxIYjbVEwd4tiTkzRYgBBoC2GfUlpRhC072SElA09KjULgYxqExf5HgGIoOQCgeNngOz1xQlGXtK3/NM4wbLa2mtEeUdKzN3O/NWdbUQxf47Snv7Dbruig546kWhpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782646999; c=relaxed/simple;
	bh=6yPSM/VgNRAH4/WwLBy9Yvbp5fRe3sCf6xfugsqpADw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DR56y40N/bvJ6F4kLrj9hPjYwQeRNuYE/YIUTXtuFkrV6dYseXNB6EoTdnODoNeR1Tvp/qRvX8WGsDSQbYN8Sw+M+iJKsDHjcx/BMj/yKFOI3I56JCTX0sm8LHO/EUDCFkfVnnsvBYJpyvD0iUfncfU8Dp3ehCyPOJSb5EcepV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V0er5nsJ; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V0er5nsJ"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30b6dad2382so4690023eec.0
        for <asahi@lists.linux.dev>; Sun, 28 Jun 2026 04:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782646997; x=1783251797; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WntUa2KSx3EiVOvdFHO7cj3UxkGlKr5CoGbYmRg9LgQ=;
        b=V0er5nsJVtZa1AOXlT27AffCZLJi85h0DoWg3F5z3+cHjfC6XynG16w0IfZs+QrILt
         GXHxXmY3CCmTpFSCGGcHdGH8gzwmygdoK6K0uTS3psRP5pYVa7RqALDp1fqcg2G3L8RO
         qXRmz/a78v+IyaWygkdwPtfSvoAjm50vOOvk/wAdmj7pJIz5KSFniK0pN+e8yOaqfyou
         kXCrziOMJ98pwGA9x08+LsbZUV27+xPSrdoTWPauD+pwrthfWIe2jYQv4d+DHFI8w5Vn
         A6rHTy9/jP7r1xn1KYTnzN4z8puKLWVEej5PESa/Mzq/WBxpHjwM6gFzhcUpvfyE2aHx
         MujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782646997; x=1783251797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WntUa2KSx3EiVOvdFHO7cj3UxkGlKr5CoGbYmRg9LgQ=;
        b=mfTQYjMbZU1TaB4kD55hBmCnwbKt/09wYfpm3p46I2b2tkE+WxLxQq5RCCps8QsE8w
         tG82wwr0XuR1MvJk3J+TqBwfASGwjYTs1btOINKBuB1+kbiBe7tU18MIzKX8BI2zJq4z
         bDTASM0dLQJZNnpLXKV5ya+F/+mhpqPTPbE1HGgLKsLk9nCbu9XVYR00zrRIz6g++ejQ
         su3L85qNOe6k2JmoVU8Nh8Szz+oPRreu0OslMCLBWZ0QkvukzagAg7gCCFixdc+0wIK+
         9vaMFZltnxIv2KZrXxL7WLkq2wIy2hjML/oZlLNEa2rtE/+hG181gOHP0gUPNK2/tEdV
         p7Lg==
X-Gm-Message-State: AOJu0YyJ1fpWvLgD62xmKnlGMkLh+eV9QTnn2C3bP1X9lfu7DzusA9d3
	jddKATyxElXNVNHINrrNMuJsrrUTPOLtzKPE20rSMSqUWNdxnFIiCBmW
X-Gm-Gg: AfdE7clYF00ZWmQgydNtjrSGx316Q7N8ircx43xDSjrInwVZy1AQf6V6wLC+aEM+BB0
	no3Di4ydE61leUeHibL5LGHWu3BhnbWzf51dWm16+KufM9cwnIAOpPIhhi5NULtslG1UWWREKqo
	gq24NH6IvPOrFgO0Laue15YhpmRe75XEiXUm/uzDPG/i4D9PleIbm+VUL9f+cOxmsAuLJA5rp8s
	UZ8yMlRjq2EkWqTw2v9D2MO2G110RmZx3VPVIlRxGD4kocV3CLoAggngxAyaNms/RvNjaOuKEHv
	cSQ4n4nwWGIb9ssXW20svr5vpTcW8V5UX/iISGzkOyJUcXA5E/YcFLSRysFlFh2QnC687LJIcvT
	yAXXRqO36g++2kbvZcG4uLEnR8YxTCSHVAcUOT3Ozk28500Jo1d+33QUTXPeyFYjHwfxBqFPAvi
	wO2s0OWqldPmLmwhsM5MuWcl2dgQ5BxRc3cyi5xHaO1bOK/4i+C33Sj5rArCj6voUbD14cUoxUF
	bGwMgxMXRzEvXdOTYYqPiMMyodBq6/B+Sx61aXl4pn1jBHPhOIgsRRdCtj2H7GRkfwpo6mf6Hh1
X-Received: by 2002:a05:7300:7647:b0:2ed:e12:3769 with SMTP id 5a478bee46e88-30c84d70176mr13024530eec.31.1782646996848;
        Sun, 28 Jun 2026 04:43:16 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1a80sm34520756eec.18.2026.06.28.04.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 04:43:16 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 28 Jun 2026 21:42:03 +1000
Subject: [PATCH v2 5/7] ASoC: apple: mca: Support capture on multiples BEs
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260628-apple-audio-redux-v2-5-6328269c9652@gmail.com>
References: <20260628-apple-audio-redux-v2-0-6328269c9652@gmail.com>
In-Reply-To: <20260628-apple-audio-redux-v2-0-6328269c9652@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3506;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=00/4fnEAaP523XAEVZpGbMLaRMSW4pkzw3Oz/tUixjU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmOHLt/nFXT8U5tTxdw9RT7evdyh+DrNl/fjH+vK1lye
 4XcRA06JrIwiHExWIopsmxoEvKYbcR2s1+kci/MHFYmkCHSIg0MQMDCwJebmFdqpGOkZ6ptqGdo
 pGOsY8TAxSkAUx11mJFh/f4XcT15MpI3ZqdXWWVXdb9Jd+L8GGn93fS3+SlWdrsqhn8WoXaP1jE
 +1GjZJVbssyPpUeJ2jVDF2y998+bt0t/+Po0NAA==
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
index 0c1fc8242907..5b5f2f27b152 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -261,22 +261,19 @@ static int mca_fe_trigger(struct snd_pcm_substream *substream, int cmd,
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
@@ -417,7 +414,7 @@ static int mca_fe_prepare(struct snd_pcm_substream *substream,
 
 	/* Turn on the cluster power domain if not already in use */
 	if (!cl->syncgen_in_use) {
-		int port = mca_fe_get_port(substream);
+		int port = ffs(mca_fe_get_portmask(substream)) - 1;
 
 		cl->pd_link = device_link_add(mca->dev, cl->pd_dev,
 					      DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
@@ -467,7 +464,7 @@ static unsigned int mca_crop_mask(unsigned int mask, int nchans)
 
 static int mca_configure_serdes(struct mca_cluster *cl, int serdes_unit,
 				unsigned int mask, int slots, int nchans,
-				int slot_width, bool is_tx, int port)
+				int slot_width, bool is_tx, int portmask)
 {
 	__iomem void *serdes_base = cl->base + serdes_unit;
 	u32 serdes_conf, serdes_conf_mask;
@@ -526,7 +523,7 @@ static int mca_configure_serdes(struct mca_cluster *cl, int serdes_unit,
 			       serdes_base + REG_RX_SERDES_SLOTMASK);
 		writel_relaxed(~((u32)mca_crop_mask(mask, nchans)),
 			       serdes_base + REG_RX_SERDES_SLOTMASK + 0x4);
-		writel_relaxed(1 << port,
+		writel_relaxed(portmask,
 			       serdes_base + REG_RX_SERDES_PORT);
 	}
 
@@ -663,7 +660,7 @@ static int mca_fe_hw_params(struct snd_pcm_substream *substream,
 	unsigned long bclk_ratio;
 	unsigned int tdm_slots, tdm_slot_width, tdm_mask;
 	u32 regval, pad;
-	int ret, port, nchans_ceiled;
+	int ret, portmask, nchans_ceiled;
 
 	if (!cl->tdm_slot_width) {
 		/*
@@ -712,13 +709,13 @@ static int mca_fe_hw_params(struct snd_pcm_substream *substream,
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
2.54.0

