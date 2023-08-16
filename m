Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAC07F0
	for <asahi@lists.linux.dev>; Wed, 16 Aug 2023 01:48:10 +0000 (UTC)
Received: from dggpeml500003.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RQWCK6tClzNmY6;
	Wed, 16 Aug 2023 09:44:29 +0800 (CST)
Received: from huawei.com (10.175.103.91) by dggpeml500003.china.huawei.com
 (7.185.36.200) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 16 Aug
 2023 09:48:01 +0800
From: Yu Liao <liaoyu15@huawei.com>
To: <marcan@marcan.st>, <sven@svenpeter.dev>, <alyssa@rosenzweig.io>,
	<asahi@lists.linux.dev>
CC: <liaoyu15@huawei.com>, <liwei391@huawei.com>
Subject: [PATCH -next] soc: apple: rtkit: Use PTR_ERR_OR_ZERO() to simplify code
Date: Wed, 16 Aug 2023 09:44:49 +0800
Message-ID: <20230816014449.2988332-1-liaoyu15@huawei.com>
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
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500003.china.huawei.com (7.185.36.200)
X-CFilter-Loop: Reflected

Return PTR_ERR_OR_ZERO() instead of return 0 or PTR_ERR() to
simplify code.

Signed-off-by: Yu Liao <liaoyu15@huawei.com>
---
 drivers/soc/apple/rtkit.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
index d9f19dc99da5..9ad4f2bd05e9 100644
--- a/drivers/soc/apple/rtkit.c
+++ b/drivers/soc/apple/rtkit.c
@@ -706,9 +706,7 @@ static int apple_rtkit_request_mbox_chan(struct apple_rtkit *rtk)
 		rtk->mbox_chan =
 			mbox_request_channel(&rtk->mbox_cl, rtk->mbox_idx);
 
-	if (IS_ERR(rtk->mbox_chan))
-		return PTR_ERR(rtk->mbox_chan);
-	return 0;
+	return PTR_ERR_OR_ZERO(rtk->mbox_chan);
 }
 
 struct apple_rtkit *apple_rtkit_init(struct device *dev, void *cookie,
-- 
2.25.1

