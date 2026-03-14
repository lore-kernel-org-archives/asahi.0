Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0426F21C9EA
	for <asahi@lists.linux.dev>; Sat, 14 Mar 2026 00:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773448043; cv=none; b=jQRuIqwZZmrwCtpMlZyUgHlE835rpmkiI9En3HeTx+1ks0vhzkwdCtCAEZkXFL4Mtu3ofTzhTjRcfb2Ryj1tHBG27Gvv+p/rzmsjItMrAVidnfvF3imcVgEdKr70h7X8eqXAVcAI4iqaZAfoLRwfKzm0fF6KAgXAAjVVX3vxG9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773448043; c=relaxed/simple;
	bh=Sqx3SXPJXXnhV+A3P+IhV85mWKhQbsDPRWBYpEMIubE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PiKLuplPTVYc4vUAwrfCuPs2oJ2e2arQlo6YZY963ZiUBet2Bb2lp7pOsa8oX2M1TRqqsWzQ8rjedTt7Njh4oMeEK6NBLbjL+iz14AiSK+zBIgOZ4Q8oNzZ91SvV9K7HsQeY/RNBtm1nXeD+SlCUIiFL76kEKeFIywEPIsSgxoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HgMi0s2I; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HgMi0s2I"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-35a132767c3so1168238a91.1
        for <asahi@lists.linux.dev>; Fri, 13 Mar 2026 17:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773448041; x=1774052841; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MEcjecI/5dgQBjsSrAQH+cGhELB2YBKO6wW+gUuNwdI=;
        b=HgMi0s2I/dlRKBVpYTJQHufoE11lYnEEH6uW4YxChPZL+DxjvRL6NCVTqx2fWcgMOM
         Lif6vUJzDLWLZMdOLYNgszJ+UymAeZGKH9GDmaOSMukENUCW9Lx8UvI6P51dU6rjHKwb
         iL0gS68nuqCQ6AtXmmiuTerKHZQkRx41Lq81s0oph7zh85f4rPdmWA4AzHgpE9srq8Q0
         fV+Vh6jaRBylFaP6vDHPqhy0kMpNHRZvZjD3Y7qLlIIib6CW2e1NMKacLGplFFVDYN40
         hUBnPP4UPauAZzCzjIwX4DQqZDqFiUeylmu7gp3COoqe7uAOSA6Zb+goq3/n0R9SQfGu
         aiMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773448041; x=1774052841;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MEcjecI/5dgQBjsSrAQH+cGhELB2YBKO6wW+gUuNwdI=;
        b=mErVrCJFiWSgyRmOBJOLa8cC4oXuiXtaOdPgEVc4nKRntvrbRDCRsBnKfxoVyTN0Rz
         ZqjvuFELCYDBX02XCS5HjOrhQXdDZ39gqdRVsYmqRZX4vNBQon98u0Mt69lkrepZPqnY
         S1PHC/ZydVrvMG6ZxsO3/L5K2Y3Y258AMVYMs/e7c87M1SXW6yX2yLc9ZGysfj5o2SJN
         nvKvAFL24dHZBIcTXCKFWR4OdqRg1dqHnSJG+wTmd1jixQ9HYryknxwMLg/fiN/tnnpy
         UZrIEsuzwhr3G2DbVyztQ3KdMsv3pfc2lpJcucpYRqa61wvaAEvLEb5UmBXjxr/Gtgv3
         jIzA==
X-Gm-Message-State: AOJu0YzKpSNrN7hHWKghPNS/3ly0lfyv+orpCW3kPkrUYRlx+yMBxNJ9
	0ZYuojIHgAh85+gf1DZ12TQiAkRgioAEhbXf06PZWJ8ul3nA+cWWDMju
X-Gm-Gg: ATEYQzxB0/6mWQaeFVCQ0v8zjFs74WE9mLkTgcHRao9ZsGsZDcTR6SjD4/xQLis8IIn
	GS0jkk3b7h5gUEla6X5Doc/saQUTHl62n2wFAuRAF5oqis7+aXuOImi3tA28ChpzGL1dnhyNQeZ
	G6VxwFUOtS3Cw9Dqy3pQgbLyxqLErz7TChHYw1+zUq3aDU10ThbfUJP3MlQSveOXpKPJzyzQqBn
	JVQ5cJwZ325dDgwrpNoOlnFYPLNU7s85E/CGQs8ktgkKXW4YHM7Sis/du9FiYKSH2PLzP5xpljE
	N0u8VCeKVyMSbvVP9GMvOxbvOqVgnMN/rP+1W2WRGpoAJxy2O2UjtoNV1wirKL+rCYvqe5eik7/
	0hlk7bsi8sBzJ79tYEMOfJym3Kw+2Zkw4ZJZGusy5GuZScyAoqCLBEddzQ7iDvjqCJBK3d8UIrc
	QOzvu24eHjUlGKkVSS4b/rysPo1Vs3I84fphXgbMPEskg55mbnf2NgX8rmDee+oYIiecLISNIPA
	Pwomvkh19/sM9CzGDVUy4XTy+ytBRZM79HGC3MWhYBQoqvjuxOCso19QscJYoxfVgjkmWfSwhvO
X-Received: by 2002:a17:90b:574f:b0:356:24f0:aef5 with SMTP id 98e67ed59e1d1-35a21fd71f2mr4196895a91.22.1773448041331;
        Fri, 13 Mar 2026 17:27:21 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02ba23adsm9409521a91.0.2026.03.13.17.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 17:27:20 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 14 Mar 2026 10:27:11 +1000
Subject: [PATCH v2] ASoC: codecs: cs42l84: set up PLL for more sample rates
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-cs42l84-rates-v2-1-ea8a5af52542@gmail.com>
X-B4-Tracking: v=1; b=H4sIAF6rtGkC/3WMzQqDMBCEX0X23JT8GK099T2KhxC3uqBGshJaJ
 O/e1HuZ0zfDfAcwRkKGe3VAxERMYS2gLxX4ya0jChoKg5a6kUa2wnOt51stotuRhe9QGyyj7AY
 ony3ii96n79kXnoj3ED+nPqlf+8+UlCjx1jrbtEYa9RgXR/PVhwX6nPMXCa2Ft6oAAAA=
X-Change-ID: 20260307-cs42l84-rates-c9e23e20209d
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3538;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Sqx3SXPJXXnhV+A3P+IhV85mWKhQbsDPRWBYpEMIubE=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJlbVqdMfPT4rqoTr8vCmf9uujN5Kt3/+VLs3ey88zq+N
 8I3Hm2I7pjIwiDGxWAppsiyoUnIY7YR281+kcq9MHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEy11wlGhme8M1OfVjmtmWp3daeHWcCy3fMlSjVreK5WCqZV5t86bMXIsGVOsg4
 T79rdTfefr9ynzCnwlmW2x12G9525rPVLO97tZgAA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Previously, this driver only advertised support for 48 kHz and
96 kHz sample rates, as there was no PLL configuration data
specified for any other sample rate/BCLK.

The CS42L84 is an Apple-specific variant of CS42L42. The PLL
configuration parameters for a variety of common BCLKs are
available in the latter's datasheet. What happens if we just
use those? As it turns out, they work just fine.

Fill out more PLL config parameters in the PLL config lookup
table, and advertise the corresponding sample rates to userspace.
This enables 44.1, 88.2, 176.4 and 192 kHz output and input.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
Changes in v2:
- Added explicit handling of new MCLK values to MCLK_F config
- Added comment explaining the MCLK_F config process
- Link to v1: https://lore.kernel.org/r/20260307-cs42l84-rates-v1-1-1c55a5673031@gmail.com
---
 sound/soc/codecs/cs42l84.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs42l84.c b/sound/soc/codecs/cs42l84.c
index 1e1307a16f81..e590a43559e4 100644
--- a/sound/soc/codecs/cs42l84.c
+++ b/sound/soc/codecs/cs42l84.c
@@ -357,8 +357,11 @@ struct cs42l84_pll_params {
  * Common PLL Settings for given BCLK
  */
 static const struct cs42l84_pll_params pll_ratio_table[] = {
+	{  2822400, 1, 0, 0x40, 0x000000, 0x03, 0x10, 11289600},
 	{  3072000, 1, 0, 0x40, 0x000000, 0x03, 0x10, 12288000},
+	{  5644800, 1, 0, 0x40, 0x000000, 0x03, 0x10, 11289600},
 	{  6144000, 1, 1, 0x40, 0x000000, 0x03, 0x10, 12288000},
+	{ 11289600, 0, 0, 0, 0, 0, 0,                 11289600},
 	{ 12288000, 0, 0, 0, 0, 0, 0,                 12288000},
 	{ 24576000, 1, 3, 0x40, 0x000000, 0x03, 0x10, 12288000},
 };
@@ -408,11 +411,18 @@ static int cs42l84_pll_config(struct snd_soc_component *component)
 		CS42L84_ASP_FSYNC_CTL3_BCLK_PERIOD_HI,
 		FIELD_PREP(CS42L84_ASP_FSYNC_CTL3_BCLK_PERIOD_HI, fsync >> 7));
 
-	/* Save what the MCLK will be */
+	/*
+	 * MCLK values are binned into 12 or 24 MHz regions. If MCLK is exactly
+	 * 12 or 24 MHz, the high bit of CCM_CTL1_MCLK_F is set. If MCLK
+	 * is in the region of 24 MHz, the low bit is set. This seemingly
+	 * corresponds to CS42L42's documented INTERNAL_FS and MCLKDIV
+	 * behaviour respectively.
+	 */
 	switch (pll_ratio_table[i].mclk_int) {
 	case 12000000:
 		cs42l84->pll_mclk_f = CS42L84_CCM_CTL1_MCLK_F_12MHZ;
 		break;
+	case 11289600:
 	case 12288000:
 		cs42l84->pll_mclk_f = CS42L84_CCM_CTL1_MCLK_F_12_288KHZ;
 		break;
@@ -670,14 +680,18 @@ static struct snd_soc_dai_driver cs42l84_dai = {
 			.stream_name = "Playback",
 			.channels_min = 1,
 			.channels_max = 2,
-			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000,
+			.rates = SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000 |
+				SNDRV_PCM_RATE_88200 | SNDRV_PCM_RATE_96000 |
+				SNDRV_PCM_RATE_176400 | SNDRV_PCM_RATE_192000,
 			.formats = CS42L84_FORMATS,
 		},
 		.capture = {
 			.stream_name = "Capture",
 			.channels_min = 1,
 			.channels_max = 1,
-			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000,
+			.rates = SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000 |
+				SNDRV_PCM_RATE_88200 | SNDRV_PCM_RATE_96000 |
+				SNDRV_PCM_RATE_176400 | SNDRV_PCM_RATE_192000,
 			.formats = CS42L84_FORMATS,
 		},
 		.symmetric_rate = 1,

---
base-commit: c40816209b5768d45aabb81f9c6ff8296ec58c32
change-id: 20260307-cs42l84-rates-c9e23e20209d

Best regards,
-- 
James Calligeros <jcalligeros99@gmail.com>

