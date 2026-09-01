Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FDA47CC75
	for <asahi@lists.linux.dev>; Tue,  1 Sep 2026 10:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788258560; cv=none; b=N+EAJjr0uC/OndsBC9B9+JVOgJJxKDGhgzhDS++00uUoSM6OkQuRtk2scSSB3M0vI4I9FykmWVb2Du/5mqIMM4IeX54F09p9yAGMHSuCrhaArj2lPfDHcpFlG3THw+SF+GIzqnOMuHWdcQQG2/BzSW75kiGay5Lt/ndZ1QtmXsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788258560; c=relaxed/simple;
	bh=FY6nUFUsg5ykRDaCyNCZU21elpZrnVLRtGzYwII8m2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SyFqJlipRlpa5Oe3lvWgp6Jou8Ts3VBj+W9Vz14DQ3N5hVREhmDatj4m1RfYbA1unK0dyYWJ+k5/481h3Jlj01MNmEvlLtKBBElbriYCI30uaPVduQFcMDP4foHRJHUVNfmScdqednlj/7d4AfY1RtBQq7/mJvSb8ItqSsiphu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=UJoZeETj; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="UJoZeETj"
Received: by chaosmail.tech (Postfix) id DFAC61CA0A1;
	Tue, 01 Sep 2026 10:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1788258549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wVHbMMgwTRdvhl3Xmvr04M/6W1HqFA3Q/iNZoN90xm8=;
	b=UJoZeETjsONrrStc6fPMM2/3N/4qWCpKOeIMbnOlJHle4OMLltV9Y9AfD3sFBmM+yvwK0k
	Pffd3MJDmqQ6YUOM6jSs3odEYG8FTXwv8KwZusx69gKN8xKSQZv8DX8kZP/6MM7tg3RKeO
	B42B+rXWp1d5sI4QztMftwfmht5dxA0=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Tue, 01 Sep 2026 12:29:04 +0200
Subject: [PATCH v9 5/6] spmi: apple: lock around FIFOs
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-t603x-spmi-v9-5-09e702e3b153@chaosmail.tech>
References: <20260901-t603x-spmi-v9-0-09e702e3b153@chaosmail.tech>
In-Reply-To: <20260901-t603x-spmi-v9-0-09e702e3b153@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788258545; l=1392;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=/okjDmX4WP5ORuj7W0YBcJBa1hZOvGWaK9RmHtLYrOM=;
 b=WnKJwlq7w2uVMsDpKoc1KRadm9XwZCXpgV+5QO0UT3WYQgI1czf73DyMd9APoKSHsIZBGBCVL
 NG5aoXO2j0HCZCm64gBjlW16op2lrrsungHq/scqlGHMVv8KrhiIKsT
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

From: Alba Mendez <me@alba.sh>

The driver was missing locking around register interactions.

Signed-off-by: Alba Mendez <me@alba.sh>
Reviewed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/spmi/spmi-apple-controller.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
index 9843dc871d6c..fabccd25aa0d 100644
--- a/drivers/spmi/spmi-apple-controller.c
+++ b/drivers/spmi/spmi-apple-controller.c
@@ -16,6 +16,7 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/spmi.h>
 
@@ -39,6 +40,7 @@
 
 struct apple_spmi {
 	void __iomem *regs;
+	struct mutex fifo_lock;
 	bool prev_fail;
 };
 
@@ -78,6 +80,8 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid, u16 param,
 	size_t i = 0, j;
 	int ret;
 
+	guard(mutex)(&spmi->fifo_lock);
+
 	if (spmi->prev_fail) {
 		writel(SPMI_ACT_FIFO_FLUSH, spmi->regs + SPMI_ACT_REG);
 		spmi->prev_fail = false;
@@ -195,6 +199,7 @@ static int apple_spmi_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	spmi = spmi_controller_get_drvdata(ctrl);
+	mutex_init(&spmi->fifo_lock);
 
 	spmi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(spmi->regs))

-- 
2.55.0

