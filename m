Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FE04A2F
	for <asahi@lists.linux.dev>; Wed, 21 Sep 2022 15:24:44 +0000 (UTC)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MXhwB0YfLzpV10;
	Wed, 21 Sep 2022 23:21:46 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 23:24:35 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 21 Sep
 2022 23:24:34 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <asahi@lists.linux.dev>, <alsa-devel@alsa-project.org>
CC: <povik+lin@cutebit.org>, <broonie@kernel.org>
Subject: [PATCH -next] ASoC: cs42l83: change cs42l83_regmap to static
Date: Wed, 21 Sep 2022 23:31:23 +0800
Message-ID: <20220921153123.1508144-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected

cs42l83_regmap is only used in cs42l83-i2c.c now, change it to static.

Fixes: 94d5f62a91aa ("ASoC: cs42l83: Extend CS42L42 support to new part")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 sound/soc/codecs/cs42l83-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l83-i2c.c b/sound/soc/codecs/cs42l83-i2c.c
index f90d43996a51..37629ebd90e0 100644
--- a/sound/soc/codecs/cs42l83-i2c.c
+++ b/sound/soc/codecs/cs42l83-i2c.c
@@ -145,7 +145,7 @@ static const struct reg_default cs42l83_reg_defaults[] = {
  * This is all the same as for CS42L42 but we
  * replace the on-reset register defaults.
  */
-const struct regmap_config cs42l83_regmap = {
+static const struct regmap_config cs42l83_regmap = {
 	.reg_bits = 8,
 	.val_bits = 8,
 
-- 
2.25.1

