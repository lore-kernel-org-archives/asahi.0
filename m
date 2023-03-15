Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A25653AB
	for <asahi@lists.linux.dev>; Wed, 15 Mar 2023 15:08:16 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjT-0007Fw-E7; Wed, 15 Mar 2023 16:08:03 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjS-004KVL-E5; Wed, 15 Mar 2023 16:08:02 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjR-0057dJ-BZ; Wed, 15 Mar 2023 16:08:01 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev,
	alsa-devel@alsa-project.org,
	kernel@pengutronix.de
Subject: [PATCH 023/173] ASoC: apple: mca: Convert to platform remove callback returning void
Date: Wed, 15 Mar 2023 16:05:15 +0100
Message-Id: <20230315150745.67084-24-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1601; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=wPm821FwPtGv/GvaeLedY8OG2bMRZ46ll1a3f2mXz8k=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd1uKF4twdFxN2YW+TcoInEACi06FNKaFgXYb nNtxaWpoumJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHdbgAKCRDB/BR4rcrs CZ5RCACBfLIX6M/sQrkbnnY1xNfV+0VXAsSS/QFNC2qM8RBpvEUU/1EAXDsrY3MSQTVUlPfXP98 dw1s/egsrz0uO7OLO4FEOyH6ZFN88FBZ8lvkWifswC9VRd4+OCFADGd/TAB7yh7gBOhoxSQyeoQ LK3FfE5xdK39QWQmY3Vhtg9Je1i5PZ1zzzF+m1asJd2uMyy1lZ+r7OZ9Dvhsh1TE9ecCDLpGvW9 MvLrMrBbJFG2M3TWDhSDd/CuXw+u6WaZUvdWLy5AY2uQUDhNzFpcv50gGRgsBb1Jyd5FwhUmECy nLh1eQ9Xl/y5bFE+z4dIoYYVwuEC5l/2br+EGKYSw9NetpEa
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: asahi@lists.linux.dev

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/apple/mca.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 64750db9b963..ce77934f3eef 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -1159,13 +1159,12 @@ static int apple_mca_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int apple_mca_remove(struct platform_device *pdev)
+static void apple_mca_remove(struct platform_device *pdev)
 {
 	struct mca_data *mca = platform_get_drvdata(pdev);
 
 	snd_soc_unregister_component(&pdev->dev);
 	apple_mca_release(mca);
-	return 0;
 }
 
 static const struct of_device_id apple_mca_of_match[] = {
@@ -1180,7 +1179,7 @@ static struct platform_driver apple_mca_driver = {
 		.of_match_table = apple_mca_of_match,
 	},
 	.probe = apple_mca_probe,
-	.remove = apple_mca_remove,
+	.remove_new = apple_mca_remove,
 };
 module_platform_driver(apple_mca_driver);
 
-- 
2.39.2

