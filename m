Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D137F4
	for <asahi@lists.linux.dev>; Tue, 27 Sep 2022 11:35:07 +0000 (UTC)
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1664278499; bh=nOoQhB339U5GGM36GHbGtBpVI5SaHkuDid0bhw4EnqY=;
	h=From:To:Cc:Subject:Date;
	b=Nwr09I/sqmPoJufDCxfV0CwuwcAg026CaPqliB8Oe3lX+CrBM0UrVDJPUK2yi5mTE
	 v8fnko6E1l8dZp8T5Rv3h2rT8UYSLLgRUxfPi9FagnEeKVon6MGyq6OGD8EimtcO5k
	 Zj2oZ7LspQSEulDJ4+BhsWOy2A8fK2xIZGoe8o6g=
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: asahi@lists.linux.dev,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 1/3] ASoC: apple: mca: Trigger, not deassert, the peripheral reset
Date: Tue, 27 Sep 2022 13:34:24 +0200
Message-Id: <20220927113426.49724-1-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Replace the deassertion of the peripheral's shared reset with the
triggering of a pulse on it. This is what we should have been using all
along as the platform's custom is not leaving the reset asserted on
unused peripherals.

Fixes: 3df5d0d97289 ("ASoC: apple: mca: Start new platform driver")
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---

Cc: Philipp Zabel <p.zabel@pengutronix.de>

 sound/soc/apple/mca.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 69643524796e..75925bfcf754 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -995,7 +995,7 @@ static void apple_mca_release(struct mca_data *mca)
 	if (!IS_ERR_OR_NULL(mca->pd_dev))
 		dev_pm_domain_detach(mca->pd_dev, true);
 
-	reset_control_assert(mca->rstc);
+	reset_control_rearm(mca->rstc);
 }
 
 static int apple_mca_probe(struct platform_device *pdev)
@@ -1049,12 +1049,12 @@ static int apple_mca_probe(struct platform_device *pdev)
 					       DL_FLAG_RPM_ACTIVE);
 	if (!mca->pd_link) {
 		ret = -EINVAL;
-		/* Prevent an unbalanced reset assert */
+		/* Prevent an unbalanced reset rearm */
 		mca->rstc = NULL;
 		goto err_release;
 	}
 
-	reset_control_deassert(mca->rstc);
+	reset_control_reset(mca->rstc);
 
 	for (i = 0; i < nclusters; i++) {
 		struct mca_cluster *cl = &clusters[i];
-- 
2.33.0

