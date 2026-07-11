Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCBF23ABBF
	for <asahi@lists.linux.dev>; Sat, 11 Jul 2026 01:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783732333; cv=none; b=eg7oTcnzc/UqyqbSKuPh4uoQgtHJ+1Zl57FbZrt4EHED+BQh1R0KQXvDuQIqUEfT8MULy1priyP9ugx2zL4Mp3X2pFFX7zOc+78E3RXbMIUq1RAGcavvjg9b9qE3UxAJjJRLtWONZV1DZiiIeCh9weh2RswaIdcbWoRCm6/Mu/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783732333; c=relaxed/simple;
	bh=u3feU+XxbkxG//8hCT8B0WoV0SQtpDUBimXlIjrgWBA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qSeNFQzkIs463Q6x3gGOCpFyXL8lywPK2OtgXAGC2zVyoQr7N5LGqp3GabM1coEKKE4oKI+pAnmMbscvfloVurrzXH/O2BjR8GviLMVfLEKopG+ZIAcTkExWrdgr/LQsZKp04katOevDJsJ1y132QxDkKGlSN5hNXamT1Nv1bCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=drlsU3Xi; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="drlsU3Xi"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84861fc51f5so1328944b3a.1
        for <asahi@lists.linux.dev>; Fri, 10 Jul 2026 18:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783732331; x=1784337131; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mN+pJBIMoW7rE9Ren2+zTaJ8YB+31uYcQku98tORliE=;
        b=drlsU3XiWWyHhMZKObLcKIKjlBRVS6Tv3//PAA8jWUClwNn9yC5B81Tz4jnmhit/30
         F311LyvbpB9jg3I74+ZCr2QgOMOWyi6TILQEsdHVZ+LO0UjPNVNUwrL/Xk2M16NiODCY
         625Q1i3Z5IT7Gb4/RKKndooZnNrOpgEhjuzIrPTG4gYrX/zA6lGT07oG9K3wSPjuzgct
         7m0tnsIqydUUFjwJraehC0bUR66Iw7tb4lnI9AmVFevKgP3Qpw0wPUM+bBxPc2PfkY94
         gxcpuzgMPAXC8x1is18sZO/4oJMsEH10d0PI8L1lJgC2jGZDDjfUZr4/pRC1lfGnOkWH
         kUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783732331; x=1784337131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mN+pJBIMoW7rE9Ren2+zTaJ8YB+31uYcQku98tORliE=;
        b=UuWyGq0PNc1arlCrQkbSNYFjd6y5Idfd+0Ht4QhsdkzAw8EUYOEMCGTp/u2tRAH93G
         03E2NXNVh9lF5U1DUqGixzP5mQbM453NwrM+N7GGfZwB2PPAKem/6t7+0wkhBXo207af
         WXAW/0urNpQPJdsP2G0yzesoq+KMgJWN1pjHzer8we90DYAW1ZSUlvFeuFgTj2WxzpOf
         jR+YQ8tCCkBdan/zsYn3Ee0wz2H5imyclMJXlLCkyh6SWmj17T4x+PL9AO2uKuFTof0R
         bKQNNRCEWJjWsec/ykY+d8yu/rryyaVUHLpKTCXfquXDfYkrGpG5/15tehO9HVRZDLN4
         hToA==
X-Gm-Message-State: AOJu0YwLG61TkNJ7mdq3D4IPgK/rNVGWFi0dwKtMXHTpi4dXZ1Mh7UM1
	gGQgbyyk3A4OEx7a/KSHjGHkjlr2hH58dhLVuuD3HTMVQB1ihZqU+1wD
X-Gm-Gg: AfdE7cmsL29MBTzEfig/QBqkjq0+xs4r8XZmcKGLMMYJSJWknzYTMkd26Jm0iF3C/lN
	E/Nu9IJHrrfoMKsw578ZGqubbT9hhl1KYnmLzh6ZXWyKhQtoJ/MPA3axqcNdMdvPAELkoBQLFGa
	4WNaRedLhJocVzuPdWZ5XcyVx8WpZUvTrPzTduCHNn5iOPK+zq+I6WKUJYGmYerB7F1V6yY1HTl
	9nEyhaxBh/jN3qmSlx8sIxUN+7CD5MY4JabGuekdsiMO7kIGPY3oIQKOhYBAGRRYQfme9Yb4GFt
	3/+znluLQ7/UVQVEY+pAOgLcA5dJRQVIQEsIDZerVCs7rk2NK/jRiLJbBkgPXMUCLP0P+yF+27G
	zw403/R4VWQKEZdgE149KpXv+9D+HUyjiso14wNadXbevbOnAtiXLWoYzD4geHent856qplVwI8
	IFBG9WmMp3DY4cMbZOfum23ntiul4f7E7BSU8Fm4ZDrIv4DmJXSwoWqloCIamg3MrRAJm4nWU0o
	DLjJpJmn0qogbBha93tg6T7MaBhMLdvUw36cp5U2kJ3lF6IoIjV5fBZqIPuI1c3t3DJAEtZ3w96
X-Received: by 2002:a05:6a00:a212:b0:848:79af:8b2a with SMTP id d2e1a72fcca58-848896863bcmr1132948b3a.27.1783732331483;
        Fri, 10 Jul 2026 18:12:11 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-848530c5a12sm3751929b3a.5.2026.07.10.18.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 18:12:11 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 11 Jul 2026 11:11:24 +1000
Subject: [PATCH v4 6/7] ASoC: apple: mca: Do not mark clocks in use for
 non-providers
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-apple-audio-redux-v4-6-2994d87c2f24@gmail.com>
References: <20260711-apple-audio-redux-v4-0-2994d87c2f24@gmail.com>
In-Reply-To: <20260711-apple-audio-redux-v4-0-2994d87c2f24@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3278;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=oPUxYsS4dAnn3g0MJvrYuVUHiPTpgN/zgb3R1tQjvLc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmBM7xXue//3q0hrTxHXs639vb0HfFLIiYeeZ4eufNMm
 PPldTv/dUxkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKbao5iRoctnzxqRyJhp3ySWlkW26sUpP3Pd2/DNO/qFashOK+F+L4bfrPJpkY/
 8J7GnHjw8a5pE/M6AJekSn8wKVN+ISgr9LO9jBgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

On the speakers PCM, this sequence:

1. Open playback
2. Open sense
3. Close playback
4. Close sense

would result in the sense FE being marked as clocks in use at (2), since
there is a clock provider (playback FE). Then at (4) this would WARN since
there is no driver any more when closing the in use clocks.

If (1) and (2) are reversed this does not happen, since the sense PCM is
not marked as using the clocks when there is no provider yet. So, check
explicitly whether the substream FE is a clock provider in be_prepare,
and skip everything if it isn't.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/apple/mca.c | 67 ++++++++++++++-----------
 1 file changed, 37 insertions(+), 30 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index d8973e5611dd..322dd8771111 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -346,36 +346,6 @@ static bool mca_fe_clocks_in_use(struct mca_cluster *cl)
 	return false;
 }
 
-static int mca_be_prepare(struct snd_pcm_substream *substream,
-			  struct snd_soc_dai *dai)
-{
-	struct mca_cluster *cl = mca_dai_to_cluster(dai);
-	struct mca_data *mca = cl->host;
-	struct mca_cluster *fe_cl;
-	int ret;
-
-	if (cl->port_clk_driver < 0)
-		return 0;
-
-	fe_cl = &mca->clusters[cl->port_clk_driver];
-
-	/*
-	 * Typically the CODECs we are paired with will require clocks
-	 * to be present at time of unmute with the 'mute_stream' op
-	 * or at time of DAPM widget power-up. We need to enable clocks
-	 * here at the latest (frontend prepare would be too late).
-	 */
-	if (!mca_fe_clocks_in_use(fe_cl)) {
-		ret = mca_fe_enable_clocks(fe_cl);
-		if (ret < 0)
-			return ret;
-	}
-
-	cl->clocks_in_use[substream->stream] = true;
-
-	return 0;
-}
-
 static int mca_be_hw_free(struct snd_pcm_substream *substream,
 			  struct snd_soc_dai *dai)
 {
@@ -805,6 +775,43 @@ static struct snd_soc_pcm_runtime *mca_be_get_fe(struct snd_soc_pcm_runtime *be,
 	return fe;
 }
 
+static int mca_be_prepare(struct snd_pcm_substream *substream,
+			  struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *be = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *fe = mca_be_get_fe(be, substream->stream);
+	struct mca_cluster *cl = mca_dai_to_cluster(dai);
+	struct mca_data *mca = cl->host;
+	struct mca_cluster *fe_cl, *fe_clk_cl;
+	int ret;
+
+	fe_cl = mca_dai_to_cluster(snd_soc_rtd_to_cpu(fe, 0));
+
+	if (!fe_cl->clk_provider)
+		return 0;
+
+	if (cl->port_clk_driver < 0)
+		return 0;
+
+	fe_clk_cl = &mca->clusters[cl->port_clk_driver];
+
+	/*
+	 * Typically the CODECs we are paired with will require clocks
+	 * to be present at time of unmute with the 'mute_stream' op
+	 * or at time of DAPM widget power-up. We need to enable clocks
+	 * here at the latest (frontend prepare would be too late).
+	 */
+	if (!mca_fe_clocks_in_use(fe_clk_cl)) {
+		ret = mca_fe_enable_clocks(fe_clk_cl);
+		if (ret < 0)
+			return ret;
+	}
+
+	cl->clocks_in_use[substream->stream] = true;
+
+	return 0;
+}
+
 static int mca_be_startup(struct snd_pcm_substream *substream,
 			  struct snd_soc_dai *dai)
 {

-- 
2.55.0

