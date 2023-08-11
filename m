Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D0A187A;
	Fri, 11 Aug 2023 07:15:12 +0000 (UTC)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RMZj16s8jzCrkT;
	Fri, 11 Aug 2023 15:11:33 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 11 Aug
 2023 15:15:02 +0800
From: Ruan Jinjie <ruanjinjie@huawei.com>
To: <perex@perex.cz>, <tiwai@suse.com>, <claudiu.beznea@tuxon.dev>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <peda@axentia.se>, <lars@metafoo.de>,
	<nuno.sa@analog.com>, <povik+lin@cutebit.org>, <wens@csie.org>,
	<jernej.skrabec@gmail.com>, <samuel@sholland.org>, <robh@kernel.org>,
	<u.kleine-koenig@pengutronix.de>, <alsa-devel@alsa-project.org>,
	<linux-arm-kernel@lists.infradead.org>, <asahi@lists.linux.dev>,
	<linux-sunxi@lists.linux.dev>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next 1/5] ASoC: atmel: Remove redundant of_match_ptr()
Date: Fri, 11 Aug 2023 15:14:22 +0800
Message-ID: <20230811071426.2343133-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230811071426.2343133-1-ruanjinjie@huawei.com>
References: <20230811071426.2343133-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected

The driver depends on CONFIG_OF, it is not necessary to use
of_match_ptr() here.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 sound/soc/atmel/atmel-i2s.c    | 2 +-
 sound/soc/atmel/atmel-pdmic.c  | 2 +-
 sound/soc/atmel/mchp-i2s-mcc.c | 2 +-
 sound/soc/atmel/mchp-spdifrx.c | 2 +-
 sound/soc/atmel/mchp-spdiftx.c | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/atmel/atmel-i2s.c b/sound/soc/atmel/atmel-i2s.c
index 69a88dc65165..4febd4d3d0fa 100644
--- a/sound/soc/atmel/atmel-i2s.c
+++ b/sound/soc/atmel/atmel-i2s.c
@@ -730,7 +730,7 @@ static void atmel_i2s_remove(struct platform_device *pdev)
 static struct platform_driver atmel_i2s_driver = {
 	.driver		= {
 		.name	= "atmel_i2s",
-		.of_match_table	= of_match_ptr(atmel_i2s_dt_ids),
+		.of_match_table	= atmel_i2s_dt_ids,
 	},
 	.probe		= atmel_i2s_probe,
 	.remove_new	= atmel_i2s_remove,
diff --git a/sound/soc/atmel/atmel-pdmic.c b/sound/soc/atmel/atmel-pdmic.c
index efcbdd1a629f..0db7815d230c 100644
--- a/sound/soc/atmel/atmel-pdmic.c
+++ b/sound/soc/atmel/atmel-pdmic.c
@@ -690,7 +690,7 @@ static int atmel_pdmic_probe(struct platform_device *pdev)
 static struct platform_driver atmel_pdmic_driver = {
 	.driver	= {
 		.name		= "atmel-pdmic",
-		.of_match_table	= of_match_ptr(atmel_pdmic_of_match),
+		.of_match_table	= atmel_pdmic_of_match,
 		.pm		= &snd_soc_pm_ops,
 	},
 	.probe	= atmel_pdmic_probe,
diff --git a/sound/soc/atmel/mchp-i2s-mcc.c b/sound/soc/atmel/mchp-i2s-mcc.c
index 7c83d48ca1a0..4b8a63295f89 100644
--- a/sound/soc/atmel/mchp-i2s-mcc.c
+++ b/sound/soc/atmel/mchp-i2s-mcc.c
@@ -1098,7 +1098,7 @@ static void mchp_i2s_mcc_remove(struct platform_device *pdev)
 static struct platform_driver mchp_i2s_mcc_driver = {
 	.driver		= {
 		.name	= "mchp_i2s_mcc",
-		.of_match_table	= of_match_ptr(mchp_i2s_mcc_dt_ids),
+		.of_match_table	= mchp_i2s_mcc_dt_ids,
 	},
 	.probe		= mchp_i2s_mcc_probe,
 	.remove_new	= mchp_i2s_mcc_remove,
diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifrx.c
index ff6aba143aee..e97cd8f4a728 100644
--- a/sound/soc/atmel/mchp-spdifrx.c
+++ b/sound/soc/atmel/mchp-spdifrx.c
@@ -1197,7 +1197,7 @@ static struct platform_driver mchp_spdifrx_driver = {
 	.remove_new = mchp_spdifrx_remove,
 	.driver	= {
 		.name	= "mchp_spdifrx",
-		.of_match_table = of_match_ptr(mchp_spdifrx_dt_ids),
+		.of_match_table = mchp_spdifrx_dt_ids,
 		.pm	= pm_ptr(&mchp_spdifrx_pm_ops),
 	},
 };
diff --git a/sound/soc/atmel/mchp-spdiftx.c b/sound/soc/atmel/mchp-spdiftx.c
index 1d3e17119888..b1040576f71f 100644
--- a/sound/soc/atmel/mchp-spdiftx.c
+++ b/sound/soc/atmel/mchp-spdiftx.c
@@ -891,7 +891,7 @@ static struct platform_driver mchp_spdiftx_driver = {
 	.remove_new = mchp_spdiftx_remove,
 	.driver	= {
 		.name	= "mchp_spdiftx",
-		.of_match_table = of_match_ptr(mchp_spdiftx_dt_ids),
+		.of_match_table = mchp_spdiftx_dt_ids,
 		.pm = pm_ptr(&mchp_spdiftx_pm_ops)
 	},
 };
-- 
2.34.1

