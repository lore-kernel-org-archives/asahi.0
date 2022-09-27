Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD9E7FB
	for <asahi@lists.linux.dev>; Tue, 27 Sep 2022 11:35:07 +0000 (UTC)
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1664278500; bh=5V2FNZPR/FdcUVzzKFU8iKVMDZyNajtosOiBMcFQsT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=epQhjYPmlZqP/1YEmMW5V9o7ox8YLE07sN5IT+3c4uucytmQspASsFu3ECdKzHBZM
	 8JSIcd4NQFQEypJvmQGjxIizfiCept4da+QPhxsjQAU/aGKhWHHKbEpOeYuqerB1XH
	 X4SwHtoQ81W4y2TV0HWLPL19lYsg1MOs4PqsE6/w=
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: asahi@lists.linux.dev,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: [PATCH 3/3] ASoC: apple: mca: Adjust timing of component unregister
Date: Tue, 27 Sep 2022 13:34:26 +0200
Message-Id: <20220927113426.49724-3-povik+lin@cutebit.org>
In-Reply-To: <20220927113426.49724-1-povik+lin@cutebit.org>
References: <20220927113426.49724-1-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On removal of the driver, the ASoC component should be unregistered
first, before we start releasing any of the other resources.

Fixes: 3df5d0d97289 ("ASoC: apple: mca: Start new platform driver")
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 sound/soc/apple/mca.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 7ca653987b78..24381c42eb54 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -1129,8 +1129,8 @@ static int apple_mca_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = devm_snd_soc_register_component(&pdev->dev, &mca_component,
-					      dai_drivers, nclusters * 2);
+	ret = snd_soc_register_component(&pdev->dev, &mca_component,
+					 dai_drivers, nclusters * 2);
 	if (ret) {
 		dev_err(&pdev->dev, "unable to register ASoC component: %d\n",
 			ret);
@@ -1148,6 +1148,7 @@ static int apple_mca_remove(struct platform_device *pdev)
 {
 	struct mca_data *mca = platform_get_drvdata(pdev);
 
+	snd_soc_unregister_component(&pdev->dev);
 	apple_mca_release(mca);
 	return 0;
 }
-- 
2.33.0

