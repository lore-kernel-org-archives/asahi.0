Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411D753B9
	for <asahi@lists.linux.dev>; Wed,  2 Aug 2023 08:14:22 +0000 (UTC)
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RG4Rf0PwjzNmX0;
	Wed,  2 Aug 2023 16:10:54 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 2 Aug 2023 16:14:19 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 2 Aug
 2023 16:14:19 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <asahi@lists.linux.dev>
CC: <marcan@marcan.st>, <sven@svenpeter.dev>, <alyssa@rosenzweig.io>,
	<ulf.hansson@linaro.org>, <p.zabel@pengutronix.de>,
	<yangyingliang@huawei.com>
Subject: [PATCH -next] genpd: apple: pmgr-pwrstate: change apple_pmgr_reset_ops ot static
Date: Wed, 2 Aug 2023 16:11:38 +0800
Message-ID: <20230802081138.3176853-1-yangyingliang@huawei.com>
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
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected

apple_pmgr_reset_ops is only used in pmgr-pwrstate.c now,
change it to static.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/genpd/apple/pmgr-pwrstate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/genpd/apple/pmgr-pwrstate.c b/drivers/genpd/apple/pmgr-pwrstate.c
index d62a776c89a1..9467235110f4 100644
--- a/drivers/genpd/apple/pmgr-pwrstate.c
+++ b/drivers/genpd/apple/pmgr-pwrstate.c
@@ -177,7 +177,7 @@ static int apple_pmgr_reset_status(struct reset_controller_dev *rcdev, unsigned
 	return !!(reg & APPLE_PMGR_RESET);
 }
 
-const struct reset_control_ops apple_pmgr_reset_ops = {
+static const struct reset_control_ops apple_pmgr_reset_ops = {
 	.assert		= apple_pmgr_reset_assert,
 	.deassert	= apple_pmgr_reset_deassert,
 	.reset		= apple_pmgr_reset_reset,
-- 
2.25.1

