Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D377AA35
	for <asahi@lists.linux.dev>; Thu, 30 Jun 2022 08:01:39 +0000 (UTC)
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1656575507; bh=uyft5wSF8/2zPEvgaZvZXua1HJQ9Mfv5d4VvVbMyKZ8=;
	h=From:To:Cc:Subject:Date;
	b=kTFfxyGhRrnO3jW3fq0bizKGuJPGSQeN7XTGZX12aoxi6C+yQL0I5x0h+sflCb0wk
	 N5OokTkPep6YFWjlxryOKsAaPbNdlEFZkB1/dueCbS8WXyYRbTXUTBD2ou9yqpaRdD
	 bwmDOqPIjHXY8JlRUtvtkXryXLSrEIjQeLc+vCLY=
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
Subject: [PATCH 1/4] ASoC: tas2764: Add post reset delays
Date: Thu, 30 Jun 2022 09:51:32 +0200
Message-Id: <20220630075135.2221-1-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Make sure there is at least 1 ms delay from reset to first command as
is specified in the datasheet. This is a fix similar to commit
307f31452078 ("ASoC: tas2770: Insert post reset delay").

Fixes: 827ed8a0fa50 ("ASoC: tas2764: Add the driver for the TAS2764")
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 sound/soc/codecs/tas2764.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 42f0c1e449ba..039bf1900880 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -42,10 +42,12 @@ static void tas2764_reset(struct tas2764_priv *tas2764)
 		gpiod_set_value_cansleep(tas2764->reset_gpio, 0);
 		msleep(20);
 		gpiod_set_value_cansleep(tas2764->reset_gpio, 1);
+		usleep_range(1000, 2000);
 	}
 
 	snd_soc_component_write(tas2764->component, TAS2764_SW_RST,
 				TAS2764_RST);
+	usleep_range(1000, 2000);
 }
 
 static int tas2764_set_bias_level(struct snd_soc_component *component,
@@ -107,8 +109,10 @@ static int tas2764_codec_resume(struct snd_soc_component *component)
 	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
 	int ret;
 
-	if (tas2764->sdz_gpio)
+	if (tas2764->sdz_gpio) {
 		gpiod_set_value_cansleep(tas2764->sdz_gpio, 1);
+		usleep_range(1000, 2000);
+	}
 
 	ret = snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
 					    TAS2764_PWR_CTRL_MASK,
@@ -501,8 +505,10 @@ static int tas2764_codec_probe(struct snd_soc_component *component)
 
 	tas2764->component = component;
 
-	if (tas2764->sdz_gpio)
+	if (tas2764->sdz_gpio) {
 		gpiod_set_value_cansleep(tas2764->sdz_gpio, 1);
+		usleep_range(1000, 2000);
+	}
 
 	tas2764_reset(tas2764);
 
-- 
2.33.0

