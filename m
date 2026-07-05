Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F2928CF77
	for <asahi@lists.linux.dev>; Sun,  5 Jul 2026 03:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783222728; cv=none; b=ebP+sHMjHw+s7l/sWmziyDyrM54ruAah1MY/PQYJsXqPdbm5oc+VKPYk7iglAO7PXODIiW/tezS9t+NBt17yQMSv6YGlaY1a1NlMgN05QJxqdg4FLLDVthsZYa2k1k448Dxk5fOhqXBAwckCPjCfL16xt8aCs/PjhsbqwMdyRZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783222728; c=relaxed/simple;
	bh=oCymehX4PYoCnxdkU22aCLFEn0ryk08gKWiIdQAT5K8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fO5tQSBwJMtu+7T5RiFOrAe7LBY1/ktt/sPzMTGo3y/vchJnaYLPTdpEZeTz45BEIWKJCUOFllv9dLeQStdodHHEHtuiKT5hwfJGSpS/tC+QT2pBF1QsFb4e18Z1bQ0HLgT4Z2rMnHNL4c423/kmrQVkd8a3Byduc9ujsVslnXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MEIVOur9; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MEIVOur9"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cacf197759so28571825ad.2
        for <asahi@lists.linux.dev>; Sat, 04 Jul 2026 20:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783222725; x=1783827525; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zgoA2zxMWc/wzwhxSoF0G4i3461m5fE4PLusQm9o18c=;
        b=MEIVOur9CYMO5zVhI2PdBQIx9rvBp+tloiBCrsDcRIG43a7kNLk+1AwuOQwOZUEVKn
         E8QmpYc4Dh1G0FnIPXxSnedsuoeqcV2jfshfXwr3blMiDiVs0yxh3emBVO1zRnAJdtVu
         /C+A0q7/7FFQgClMwhgSJmpGb5kL3XnZplBTTydMo1aIksoQsmAL6s6NH4hacoLkBNXJ
         EgjUNrY84IDERYkiQt4fVbOnjUSQkoOXTVnR6TiCYq8qeSRKBjgRR6Bm5vB9wmFdUTSh
         HnewjHVcCaBUvl9JKE/hdon78lus1YIe8voRc0pKz0gC+sOKvtsSGP8ejwStufxq3bPD
         hG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783222725; x=1783827525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zgoA2zxMWc/wzwhxSoF0G4i3461m5fE4PLusQm9o18c=;
        b=rWjIAmsxFERUccV391nFNEWHW45ldYvYMDBxmBkdT9k6lhl9KegfDA2RYCmS8hivb9
         ZV2pvgWjCppSeA7zMTkGerPUXV01/2+FNqxJtXAv0jWgpk+cTbPudVHRN+MPcm22+HJX
         TMkBqUkCvQQzR20hyCfKZJTY6ePY6Ad7RwsHDmFD8pI83bnq1sEyGlMzqPvl4a+MWMmj
         fKXi4BtUd4s0T893RjtsF5VlgkSQhZI1ux9kJ9PVA6eW2N7FBNwkeEXkC51vs6AgOxEX
         pSR4UtKpVO7TWyd0h5zIwYwV5wJDM4cUUd0rpOzuRwCdtNyJeG5o/xlTg2tToPRytoD3
         1yaw==
X-Gm-Message-State: AOJu0YxyoFOdWIB2GblDIWOm9Z8YiGRmNn/0nIGDjGC5hkhxR06gSaoB
	bFRvq5gb8B+T9Smrwfx4JclwXPCEioKp59WlnDfAzctlRdyRrJTfPvr5
X-Gm-Gg: AfdE7clqyUm1A0SkNHsCyQme7Bv064Qk0c2cUmRdQZFFiU+Ms9XDZdrNDGi/puUvelT
	Ir2EPR69xGZ2rklQlXkWRYmA8OUvYyJcCUwo//7BGG+Z7xLCe5ZwxYFlB9cS1gcyRa5yWojSYJ9
	zpld9g4xFx7F0FqbHB6pWfTIh89o7txqgYwyGdwjpoeBD4XhXWqR2Ev4Kj5yfzG181aajWIvtaV
	CfIR/CmaZeSTZu8PaPR0FF7Q0uUrkSNuuzZKAtwl9DVB93PIoRDpcejb2DNFJZjR8cw+SJcxhjo
	Z1EAuBoqZU0G3Mo6zsRY91GHgycTK2Cva/irVerSSecThOT45ofZyKG+zqUZitxhUp/RvurJu8O
	f7lcKALEWdnGs5Yq/9ZKvlbxoXlcFBfa4rPGlKUSx2Q1PiptaIo/6ig3fC84bn5wLGAdySoWZlH
	xePfMhZtRtL5fEN1icR+uDNJgMXVmvwsKWdaE8GVYj7mFLap7KKdlXOl2gZxb6mTM2qN7YaIiML
	mysC0QINCXMRsHbPoGaauSyCrMYIeQ6EDNacxsgqtnq8ZyulmrwIDkcoaJxJoaG
X-Received: by 2002:a17:902:c40f:b0:2c9:b2c1:13ec with SMTP id d9443c01a7336-2cbb1e32638mr59387335ad.11.1783222725413;
        Sat, 04 Jul 2026 20:38:45 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b41c364d5sm35463845c88.14.2026.07.04.20.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 20:38:45 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 05 Jul 2026 13:37:52 +1000
Subject: [PATCH v3 3/7] ASoC: apple: mca: Factor out mca_be_get_fe
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260705-apple-audio-redux-v3-3-ff7a7afe2b6b@gmail.com>
References: <20260705-apple-audio-redux-v3-0-ff7a7afe2b6b@gmail.com>
In-Reply-To: <20260705-apple-audio-redux-v3-0-ff7a7afe2b6b@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1985;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=J1CccrHUSdWoBn2gfykZB3L0vQDV93VPqcrkOqBmUGc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmeF7eUP+AuZF1d+77tRYqd1P5rq+Yf+fef2+R205EdA
 Zk1Dp31HRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKle6MHIMP/bSuHpPlr3Tz7uSO77bffhxVf1n/efCex3v/ggWu/RPgdGhlcTZ+z
 Wir4f5cmcmfpss+6LI4U8/lvTUsw2zuq+Hfr2HTcA
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
index feaf60a4912f..730ffe0805e1 100644
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

