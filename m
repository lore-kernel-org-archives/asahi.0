Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D402285406
	for <asahi@lists.linux.dev>; Sat,  7 Mar 2026 00:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772844305; cv=none; b=MbhliFbxdvKFNCR3hrK/1Y2Px72bMsJHRshSQAEAauTNRUtLOGLJ0CLWBxLKnTZjzjRx1RfSY0ppCN59LEqsLDp9+3EaXVXesLEzjPfgBM8blDBIMn97Dpz61ypbyk4ZL1OUx0YPgmtjLAzmExxrEX9PrkODafseAYICpmZt/UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772844305; c=relaxed/simple;
	bh=3CihOmU9NGTH+pHKFRKG0zcs63q8aCSm+5wlrpjoVus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PmL4DZloBQvzXwrPrA2Vbvvh1cArZeFq6v67yFkE4ApvRP4TCwG2zhD5a73dhetYQvmNkA9GvdCJk09G6i7m7ssEFoBskodP538M0w+zAbiOEasJtBfAJsR7NG4ht5YCtCZBM5zgatSbzyOJ/u3FUnJRMEss7nAR8WuEqvbU+0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GNs+qiSz; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GNs+qiSz"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3597b474cbdso3837965a91.1
        for <asahi@lists.linux.dev>; Fri, 06 Mar 2026 16:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772844303; x=1773449103; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BQK6TpOgxro8/DFxKJSKFYs9g8FfHGY7pR33jfs/nsw=;
        b=GNs+qiSzznZ3iLQlR/JsYGL7EFm7L8qN+Nivnke1qe8px1MQXoeLym3qBs5HiN6PQA
         8jb0R8yhJU0YZAWOHLhfxepAusC34AAtd9qZ1c0++Quo1PT0/qwLGQjp90e9FJHVwg1T
         +7g4ZQjORspKY1HeLKLyQbvzh0vod4y/lQhEI4U/PNdTaionJydF0wuTVhfp/Hi5+BXy
         PYfjvEv9Gve2YxrPJ7u3upaVdwWYjLfiojATq3RLFNraij1uOTTJg4+KCqmerNWFWhEH
         NqyhV++UG4+zyukQQQixCaRgaEXMbi2vymclrL7m/ioWKdCCaq8Tp609Ns3/2ClgmlqR
         iAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772844303; x=1773449103;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQK6TpOgxro8/DFxKJSKFYs9g8FfHGY7pR33jfs/nsw=;
        b=mu3xEG7mK++73Noko9SlXsY+qpBpXmnAe+v/z6DwW2yV5W1PrkjQz1dlZwS5bg0mVJ
         I/HQz6ZsN5YicxcqlWVdLIpMISXtNlB9Qn1IvKzDlj81rQjmbr0/ioh9FjgeAAVSMYc7
         Opbx1aQY5GjkpOWQCpbBWUIAuCdL4WbTXSf2C7CZ/VjX4HsvQ5IHZ9IcN5642KNjWyy2
         b9Ij0lV1twkKYZsFUBqofa4v7pkBCi21fOCMIHpsoSrrwo0X6GvYYcJA9dGTyZoU5VRO
         iaV9Xkfh2a2Pqoh5tHlQGfC1FbhnN/SJ9drrxFg0JypCI66c5nxgjtt9xc9RAsTRh4JD
         ZqJw==
X-Gm-Message-State: AOJu0Yz6kPgrrGRwK2mgWc0DZfAYV3hcw2bb9kZrbByyiw7gD/h2qYVI
	+2QfUVa75qf5MRBMVbfhN4CF6l80JnnnxGX/Mzw/bxwtXhekQKmAAi0L
X-Gm-Gg: ATEYQzx1KIN9nYACJGd3pfvJIb8R8mgbknqYacxHIe+1lpgbJzVU3uCW2+i3kEfg7hI
	IIEBBlPU9I6mc23RmR+bucG8Go1CSgWfAMMcZRYVfMDKCG9PVbnMWruIlCsr7gqYzZJi4X35jsg
	GV0mlT+aINnhJW+Bdrm+exeNs065Q4aqgPCRY0lgIiVidodFFTrJEMHYC1WK/HnNtJKP2rxO7EH
	WEOseZjtO6yC0fagkSJykiQ9jUhcMqHHmUbyVzrZNMmWiCDqq/f40JO1bx/58dmcqU9z8A4cjwQ
	spxlPKcNei1TqI89QI77uMdklgi0oBBcXE+p6bv1IQH6q6vVdrbPbclUaKjVb+aJrlL0J1olOTL
	WLf+XkexM73HiG7fshJepObd2FEwnrw+h02XRXiV0hNyWYO9QhU5D2Fau/aVjCT6B9Ue/sDvp7j
	vnhgalxf9R1xNOUJRRqSZ6qnuQz3HeMGmX8jGdx6oEHyAtNQWVbiOdsRYrCDqfzRiFiQS7FSN27
	gIbO0pSAAJRIbr105HOPBs/W/OWPcU+crt79k8PcQBJjbw/ap0MQyBLvuAawvK17KxApi5619U=
X-Received: by 2002:a17:90b:3c90:b0:32e:1b1c:f8b8 with SMTP id 98e67ed59e1d1-359be375c6dmr3587963a91.26.1772844302605;
        Fri, 06 Mar 2026 16:45:02 -0800 (PST)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359c4eb8c48sm2402907a91.10.2026.03.06.16.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 16:45:02 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 07 Mar 2026 10:44:18 +1000
Subject: [PATCH] ASoC: codecs: cs42l84: set up PLL for more sample rates
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-cs42l84-rates-v1-1-1c55a5673031@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOF0q2kC/x2MQQqAIBAAvxJ7TjCVyr4SHUS3WggLNyIQ/550H
 IaZDIyJkGFqMiR8iOmMFbq2Ab+7uKGgUBmUVL3UchCejTpGI5K7kYW3qDRWKW2A2lwJV3r/37y
 U8gHhtsfWXwAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2501;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=3CihOmU9NGTH+pHKFRKG0zcs63q8aCSm+5wlrpjoVus=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJmrS7lW2i8tNap/eq3206XX7yw/ySxqFNjbc6z3Zmvep
 O3cZYmmHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKm+ncTIMH+f9c/7winaFx6ncZmVGq0wrbjf923qEaXbSs1t1f+79BgZfnb/v9y
 W97DKTFp7tc/OtMyrAWUHLDr1Pva8mvj9zME0XgA=
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
 sound/soc/codecs/cs42l84.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs42l84.c b/sound/soc/codecs/cs42l84.c
index 1e1307a16f81..eba2c900b8e4 100644
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
@@ -670,14 +673,18 @@ static struct snd_soc_dai_driver cs42l84_dai = {
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

