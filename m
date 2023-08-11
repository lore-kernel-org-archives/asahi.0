Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EAE1C11;
	Fri, 11 Aug 2023 07:15:07 +0000 (UTC)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.53])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RMZlg3SJBz1L9VR;
	Fri, 11 Aug 2023 15:13:51 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 11 Aug
 2023 15:15:04 +0800
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
Subject: [PATCH -next 2/5] ASoC: atmel: tse850-pcm5142: Remove redundant of_match_ptr()
Date: Fri, 11 Aug 2023 15:14:23 +0800
Message-ID: <20230811071426.2343133-3-ruanjinjie@huawei.com>
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
 sound/soc/atmel/tse850-pcm5142.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/atmel/tse850-pcm5142.c b/sound/soc/atmel/tse850-pcm5142.c
index efead272d92b..c809b121037f 100644
--- a/sound/soc/atmel/tse850-pcm5142.c
+++ b/sound/soc/atmel/tse850-pcm5142.c
@@ -430,7 +430,7 @@ MODULE_DEVICE_TABLE(of, tse850_dt_ids);
 static struct platform_driver tse850_driver = {
 	.driver = {
 		.name = "axentia-tse850-pcm5142",
-		.of_match_table = of_match_ptr(tse850_dt_ids),
+		.of_match_table = tse850_dt_ids,
 	},
 	.probe = tse850_probe,
 	.remove_new = tse850_remove,
-- 
2.34.1

