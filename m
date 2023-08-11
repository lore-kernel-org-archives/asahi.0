Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9176F1C3D;
	Fri, 11 Aug 2023 07:15:09 +0000 (UTC)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RMZhz5Yd9zCrk9;
	Fri, 11 Aug 2023 15:11:31 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 11 Aug
 2023 15:14:59 +0800
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
Subject: [PATCH -next 0/5] sound: Remove redundant of_match_ptr() macro
Date: Fri, 11 Aug 2023 15:14:21 +0800
Message-ID: <20230811071426.2343133-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
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

Since these sound drivers depend on CONFIG_OF, there is
no need to wrap the macro of_match_ptr() here.

Ruan Jinjie (5):
  ASoC: atmel: Remove redundant of_match_ptr()
  ASoC: atmel: tse850-pcm5142: Remove redundant of_match_ptr()
  ASoC: sunxi: sun4i-spdif: Remove redundant of_match_ptr()
  ASoC: ssm3515: Remove redundant of_match_ptr()
  ALSA: Remove redundant of_match_ptr()

 sound/drivers/serial-generic.c   | 2 +-
 sound/soc/atmel/atmel-i2s.c      | 2 +-
 sound/soc/atmel/atmel-pdmic.c    | 2 +-
 sound/soc/atmel/mchp-i2s-mcc.c   | 2 +-
 sound/soc/atmel/mchp-spdifrx.c   | 2 +-
 sound/soc/atmel/mchp-spdiftx.c   | 2 +-
 sound/soc/atmel/tse850-pcm5142.c | 2 +-
 sound/soc/codecs/ssm3515.c       | 2 +-
 sound/soc/sunxi/sun4i-spdif.c    | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.34.1

