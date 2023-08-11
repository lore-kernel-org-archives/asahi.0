Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D567C1FC4;
	Fri, 11 Aug 2023 07:15:15 +0000 (UTC)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RMZj505M3zCrkj;
	Fri, 11 Aug 2023 15:11:36 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 11 Aug
 2023 15:15:05 +0800
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
Subject: [PATCH -next 3/5] ASoC: sunxi: sun4i-spdif: Remove redundant of_match_ptr()
Date: Fri, 11 Aug 2023 15:14:24 +0800
Message-ID: <20230811071426.2343133-4-ruanjinjie@huawei.com>
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
 sound/soc/sunxi/sun4i-spdif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index ff18d4113aac..c2b55d2e5fe1 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -718,7 +718,7 @@ static const struct dev_pm_ops sun4i_spdif_pm = {
 static struct platform_driver sun4i_spdif_driver = {
 	.driver		= {
 		.name	= "sun4i-spdif",
-		.of_match_table = of_match_ptr(sun4i_spdif_of_match),
+		.of_match_table = sun4i_spdif_of_match,
 		.pm	= &sun4i_spdif_pm,
 	},
 	.probe		= sun4i_spdif_probe,
-- 
2.34.1

