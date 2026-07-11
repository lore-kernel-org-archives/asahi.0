Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8CC23ABBF
	for <asahi@lists.linux.dev>; Sat, 11 Jul 2026 01:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783732320; cv=none; b=O0wGS82BhyqxSSDUix6eMnOGeeupLw7bXjdvA76+e3kYykuPoDurD226xY6zEPK4BWNoql/50UfwEuZbVzJysXpTzoyaLhR7WZHlhDgYYKG+Tihh0dINtAHbL/8MBn2C0JckHDz+rr8JTqtMo/ZSBLlhiJeB7iAMXDldDCVddDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783732320; c=relaxed/simple;
	bh=GHpRJg9oxVD6GKahUW6+PTUDA5kAW0ptFe5dE4sEofw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D5wEl36klQgHSzYMeyg+kOu0gPfEG1ixrzi2jggOfHjfHST5S4slT0Gbp+sOqQT/mlqX4QAytQY7jv0EerH+88AjAdOQzwgo/kRr2FD60RQzKWIk+/keZ41zZDM3XkRJmqEZRIRqWEmyUFHhgGl/2NLMFkTV5m2qUyTuB7DL8pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kfQr445o; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kfQr445o"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8423f236418so1129076b3a.1
        for <asahi@lists.linux.dev>; Fri, 10 Jul 2026 18:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783732318; x=1784337118; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ns9UFkQuF2E3pwYAgWuXOFZxiBt3YnXgvvVMaDlLWEk=;
        b=kfQr445oZ8SxZWLStZ4PJ+ty2L7HJZjcX8CYuiau/be824V5yMKMJjKfZFq1DFt54s
         P8dA2nPUomJuZAemvxBHlbOvX6vx7O6j8iltNc5n9HhzEflwW7ydHFucBhl5kBSNnxlR
         13qkkX5CRu67TOhDnba3NmiaXEtmX46R1d5PFfSSCUjPS+vT4a1x5qEZzOSgg2HMt9ec
         nYT3mMCEVZibRovR7Nf/psGlNLcjpAj5YQzZquirV5SFQ4SzGxRKMI6d3C6YttGW60SZ
         EivGGTtp8N4MtoFPqco81L76TyNKfoa2j6JQEUZ6XSHpRJkHOrLoGt2jHIUwh9JmyCJP
         t7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783732318; x=1784337118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ns9UFkQuF2E3pwYAgWuXOFZxiBt3YnXgvvVMaDlLWEk=;
        b=gHz9GmLe6Jke1S9qTAVpw6eTG6nclUVINi54yYYAwkQrBEBxcyoccfvycrLCjp6V0a
         7DiRxn+xi75PtCSraOoSiIjFxil6x0Cx8Qt98hdZkppyD2LFJdoU8BkTPd4NgL8riWG5
         PkwydeAX6lLfT6+lhgtanvFLm62oXb04cU/iADNnSpo0srF2UoLbK2xYqH8QOlfFCo78
         K1Zr+den27Q5AI56hNOl53Xp4xrRGlpRWFvI8eIqocaSXNwPMr4mnhSHy8UdFGyvnTxe
         RDFhrcLmbPmNCt54vRWSYrKvLZyoLCUbeewBVqB7LioSMrzbnOXt09MzaW5w/O27MKF6
         1mzw==
X-Gm-Message-State: AOJu0YwP9xW7S/XVPhPOHw8p5A38/5UhJU/VzW8CE/WLGS5NDf15sAdO
	wEu0uGtFdD9uZExJdqKD8d0DrkEe/WsN6Ydar9pvk/pbbOOvY+Ve8SNv
X-Gm-Gg: AfdE7ckmp9GNUqVCb+7TH8FRm9HCXk3PCSuTYogi+JpPY0lMDdY522IK5Vv/8C+sJPZ
	lpzBf6/It+4/5cCa/wdbUjFn53MwmGTVFC++76tI0gLdAsu1+JNputbs3f02CzsWeXtQRXzfR8s
	NbZE8MMP5oXm9t82pWql0oKBN4Rf4yxHLsLmit9NClCw3PYVw8f09V8Q90M2ymN02v+3HWX+Stx
	fEn01ugFq+ri3i3/eAkMFCpKDryaHRhMAAtOl3fTK7Bhzy2yXonB4LiQA2u8HXjv85BQbRWv2xF
	HWspULjOCaqeEAxyEHHljF+Igrv+TyBPhBaGe1a0bFJ0Kx24u75Tv2j7m+Zd+8jqpLDHwblA6QP
	8jbrMc8NCfNBIAQz8XIZgREpA9kfb+ABhKjQAMetTK60VdmdJZq6kFBeVHpBcyCpN0YWcIJFUKP
	hUaAonUGpF//X0r+1Z5fi4mMZRpZcDjmRV6CxGaVLa6uU+3g+i28NQ2jatGeI0iTb4fUr9QTfVP
	AZvFKYqHsXWv6RAk3O2ToBtRN23im3V6BcFvEfkkNXTO/z3qBfhW6IXWWW1uoIdGw==
X-Received: by 2002:a05:6a00:448a:b0:848:2f74:1d5e with SMTP id d2e1a72fcca58-8488972ebb9mr1061334b3a.68.1783732318176;
        Fri, 10 Jul 2026 18:11:58 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-848530c5a12sm3751929b3a.5.2026.07.10.18.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 18:11:57 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 11 Jul 2026 11:11:21 +1000
Subject: [PATCH v4 3/7] ASoC: apple: mca: Factor out mca_be_get_fe
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260711-apple-audio-redux-v4-3-2994d87c2f24@gmail.com>
References: <20260711-apple-audio-redux-v4-0-2994d87c2f24@gmail.com>
In-Reply-To: <20260711-apple-audio-redux-v4-0-2994d87c2f24@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1985;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=gZo+qAecjsjEu2IDUW/qEj1Tcf3OnB55qMCIoJb2Flk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmBM7yVJ9Zo2iWUT+6+N/80++qjtZbxSdZshU57U+umq
 akEtgV2TGRhEONisBRTZNnQJOQx24jtZr9I5V6YOaxMIEOkRRoYgICFgS83Ma/USMdIz1TbUM/Q
 SMdYx4iBi1MApvpQJiPDhsXiuzZGKS176hOaczYz4oVlp/b8vSsSXxdscaw6EOM0i5Hh0PeNawI
 Wn5bt1+eX2SQUXLPMaFHy162KuY/7bTJnbX7CCAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

This is a function that we also want to use from within mca_be_shutdown,
so factor it out.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/apple/mca.c | 31 ++++++++++++++-----------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 55cdb4e0f0b4..1e9a5c9cfc54 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -721,30 +721,35 @@ static bool mca_be_clk_started(struct mca_cluster *cl)
 	return false;
 }
 
-static int mca_be_startup(struct snd_pcm_substream *substream,
-			  struct snd_soc_dai *dai)
+static struct snd_soc_pcm_runtime *mca_be_get_fe(struct snd_soc_pcm_runtime *be,
+						 int stream)
 {
-	struct snd_soc_pcm_runtime *be = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_pcm_runtime *fe;
-	struct mca_cluster *cl = mca_dai_to_cluster(dai);
-	struct mca_cluster *fe_cl;
-	struct mca_data *mca = cl->host;
+	struct snd_soc_pcm_runtime *fe = NULL;
 	struct snd_soc_dpcm *dpcm;
 
-	fe = NULL;
-
-	for_each_dpcm_fe(be, substream->stream, dpcm) {
+	for_each_dpcm_fe(be, stream, dpcm) {
 		if (fe && dpcm->fe != fe) {
-			dev_err(mca->dev, "many FE per one BE unsupported\n");
-			return -EINVAL;
+			dev_err(be->dev, "many FE per one BE unsupported\n");
+			return NULL;
 		}
 
 		fe = dpcm->fe;
 	}
 
+	return fe;
+}
+
+static int mca_be_startup(struct snd_pcm_substream *substream,
+			  struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *be = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *fe = mca_be_get_fe(be, substream->stream);
+	struct mca_cluster *cl = mca_dai_to_cluster(dai);
+	struct mca_cluster *fe_cl;
+	struct mca_data *mca = cl->host;
+
 	if (!fe)
 		return -EINVAL;
-
 	fe_cl = mca_dai_to_cluster(snd_soc_rtd_to_cpu(fe, 0));
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {

-- 
2.55.0

