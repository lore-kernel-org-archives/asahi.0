Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9C0548E8
	for <asahi@lists.linux.dev>; Fri,  8 Mar 2024 08:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709887934; cv=none; b=f83pTGKcTSF5XAE4eXZjJ1OBWnlQZgdN6BzZjrcu/PNkZwB1/DMSSmigXNAsCZT7gdAZXgTN+l+tIZrnkzCZ3aIWXOlrY7PVn8wlI4opOdDAVjbo/fNIDfntfY7s3Ru5mwM8QS4nPE9E1ayvZyFguxc5EETI6MXLo9DlW7+4afc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709887934; c=relaxed/simple;
	bh=7IY/EZDqLP3gMUE/l+/yAAJeCn0pnD9Wioy9NyED6Lg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RFTnM6l3atvf/vamcrt4dSKcng8iC2CzQmwa9BM7k+SeRqT1Ijp2lKCrDHSpaOEbvPnHL+2js2CSOXaTqPSmTitq/UOD+jxcj0oL6YYGr3XwFD7LJ+JgC8qQABVzaNV0Ynwl3ULQ8kdHwZkWjiXB+zsHYlPP5dq0iKLewWG3BK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1riVxH-0006wD-Dh; Fri, 08 Mar 2024 09:51:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1riVxF-0056NH-LB; Fri, 08 Mar 2024 09:51:49 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1riVxF-00245h-1p;
	Fri, 08 Mar 2024 09:51:49 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH] nvme-apple: Convert to platform remove callback returning void
Date: Fri,  8 Mar 2024 09:51:10 +0100
Message-ID:  <c035aaf3bffc16018d657dd3dab37751da9f3564.1709886922.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1926; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=7IY/EZDqLP3gMUE/l+/yAAJeCn0pnD9Wioy9NyED6Lg=; b=owGbwMvMwMXY3/A7olbonx/jabUkhtRXFxuNnWMqXT9anH93aYpN+jqX35sXCL215MhIvVXhx hz7zpq1k9GYhYGRi0FWTJHFvnFNplWVXGTn2n+XYQaxMoFMYeDiFICJKBVzMDRUezX4rGy54M6x KzDjVXJC4vSFNc6rG8L/iohPVPgZquzBtq554Zt1PoLF/JGyfbKZG542LBJdmq9lMXtV8Ef9Zam 2gc0um6dIdX7eZOQ1JbGqN9ZgfcyUb/c+cXr8b3JRLWUs/X7VTG2OpJ37jnnW6ZcUmxLnaF+LNZ Ksmpi8nPFXTsbsRS+Yojxby/SuLrjJ+eRU8THX7I3axmuk+5mXXrMNPnTnanPQ1v4/96O9pJlue R6L5sx+FvN31wqZh59ZqoMttBYd5Ell+HLqYPvs/RYdVw9LJj955RF4ZFOayHoVufpwsR1dm3Mi WbbMCC1gPTnzYIV/z2uHyzVWeXnBThc4dmwMShdboGsPAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: asahi@lists.linux.dev

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/nvme/host/apple.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
index a480cdeac288..dd6ec0865141 100644
--- a/drivers/nvme/host/apple.c
+++ b/drivers/nvme/host/apple.c
@@ -1532,7 +1532,7 @@ static int apple_nvme_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int apple_nvme_remove(struct platform_device *pdev)
+static void apple_nvme_remove(struct platform_device *pdev)
 {
 	struct apple_nvme *anv = platform_get_drvdata(pdev);
 
@@ -1547,8 +1547,6 @@ static int apple_nvme_remove(struct platform_device *pdev)
 		apple_rtkit_shutdown(anv->rtk);
 
 	apple_nvme_detach_genpd(anv);
-
-	return 0;
 }
 
 static void apple_nvme_shutdown(struct platform_device *pdev)
@@ -1598,7 +1596,7 @@ static struct platform_driver apple_nvme_driver = {
 		.pm = pm_sleep_ptr(&apple_nvme_pm_ops),
 	},
 	.probe = apple_nvme_probe,
-	.remove = apple_nvme_remove,
+	.remove_new = apple_nvme_remove,
 	.shutdown = apple_nvme_shutdown,
 };
 module_platform_driver(apple_nvme_driver);

base-commit: 8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
-- 
2.43.0

