Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DB4A5F
	for <asahi@lists.linux.dev>; Thu, 30 Jun 2022 08:01:39 +0000 (UTC)
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1656575508; bh=YlXFx0zlqrnvjrP9hA3MXWg06tFvtQmgApZDlwHB8iU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=tHJ3vlEIy057XjeSJuhaHCxq4EZ9UofyFB9CmXYzGhR/cZKebU5Ky5tpOJvdOJU23
	 NTJLbXLBwf1y9MRxdHbS8b6fxyv19s0G1wZyHf42KdVCICs7F//lzXcaaRjrB9a3VK
	 rvVuNAATM6caBIQkzFsQtbTyMxLSC5vtZaL17ZmU=
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Hector Martin <marcan@marcan.st>,
	Stephen Kitt <steve@sk2.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Dan Murphy <dmurphy@ti.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	=?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: [PATCH 3/4] ASoC: tas2764: Correct playback volume range
Date: Thu, 30 Jun 2022 09:51:34 +0200
Message-Id: <20220630075135.2221-3-povik+lin@cutebit.org>
In-Reply-To: <20220630075135.2221-1-povik+lin@cutebit.org>
References: <20220630075135.2221-1-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Hector Martin <marcan@marcan.st>

DVC value 0xc8 is -100dB and 0xc9 is mute; this needs to map to
-100.5dB as far as the dB scale is concerned. Fix that and enable
the mute flag, so alsamixer correctly shows the control as
<0 dB .. -100 dB, mute>.

Signed-off-by: Hector Martin <marcan@marcan.st>
Fixes: 827ed8a0fa50 ("ASoC: tas2764: Add the driver for the TAS2764")
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 sound/soc/codecs/tas2764.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 0143a55cd33c..55da1b3440e1 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -536,7 +536,7 @@ static int tas2764_codec_probe(struct snd_soc_component *component)
 }
 
 static DECLARE_TLV_DB_SCALE(tas2764_digital_tlv, 1100, 50, 0);
-static DECLARE_TLV_DB_SCALE(tas2764_playback_volume, -10000, 50, 0);
+static DECLARE_TLV_DB_SCALE(tas2764_playback_volume, -10050, 50, 1);
 
 static const struct snd_kcontrol_new tas2764_snd_controls[] = {
 	SOC_SINGLE_TLV("Speaker Volume", TAS2764_DVC, 0,
-- 
2.33.0

