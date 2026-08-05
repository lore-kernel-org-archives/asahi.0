Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF58F41D10B
	for <asahi@lists.linux.dev>; Wed,  5 Aug 2026 10:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785924689; cv=none; b=OfhnET4WRC2qjDEELsVeuI7yVmJ5TpEBRxiZs9KUyy7WthSUAL3oE4QTItIuDpQAFHl5K2h636MoPcTKKQWFdbd1PWNulTcRxcNB57srMdHXJWRAHS/tjT0BeiK9HSn4NIEItci0a8TswmiZUpP/Vt+1Y4NqBv2MZvjrDHo9tUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785924689; c=relaxed/simple;
	bh=9v1qsSuSt17zkWDo0rgT7u0GD8CFvNhT5tDlGVpSQWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UsB6LNK+sa5rew2osfZr9Tz1roZht/ceIDjZmT+p8Nz3nLiIQy6+MYyjrGXwGvbAatccjImuD9F5qe1hlGlQCIa/VjZ3VhCCMZw/zqaOSaiTZqmIQDwtHREeAE3sJl/LML26ymqvI6rcTd7Gmp7FMAgE+Cso345aixmQOe5aOrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=OWw9k4+6; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="OWw9k4+6"
Received: by chaosmail.tech (Postfix) id 460D61C8806;
	Wed, 05 Aug 2026 10:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1785924678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pzFkFB/PMVDNKVFIxgRys9fGD169vs7WxjV3LX9ohSc=;
	b=OWw9k4+6fTyxDX4n+2MuQB0/NQC5SonigBjrqrMD72vOrrbmB5EORcBbLrOM/HFSW8jxwb
	4weYgzSHC6xJ79QA62rmI/MUFlHPwNiZSZD5j8VgcIXcd7BOl/GNY/mDHciYzkKcnttPFn
	NOuqNV+rlrT+oiT4pWMR7Wi6F6hFrAo=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Wed, 05 Aug 2026 12:11:15 +0200
Subject: [PATCH v4 5/6] spmi: apple: lock around FIFOs
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-t603x-spmi-v4-5-c15a12d9a7d1@chaosmail.tech>
References: <20260805-t603x-spmi-v4-0-c15a12d9a7d1@chaosmail.tech>
In-Reply-To: <20260805-t603x-spmi-v4-0-c15a12d9a7d1@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785924674; l=1338;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=fzMIw6AN9yEpQ6+KWLdyrm9k+KS8cIdmqz+BmFm8hO0=;
 b=w7oaICNm5Z83Ah+/lmDSgUWvYkB8SY2yDQKYxQU09i126frvsL4943XUsVXGiXIZAZ9qqIdq+
 0XPCoOX89uOBjIyJ0thtHzdvtcfafnp60v0C5NY5Qch7q+9lGZdviii
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

From: Alba Mendez <me@alba.sh>

The driver was missing locking around register interactions

Signed-off-by: Alba Mendez <me@alba.sh>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/spmi/spmi-apple-controller.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
index 49827e51e93e..c3bc1f6d5741 100644
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
 
@@ -79,6 +81,8 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	size_t i = 0, j;
 	int ret;
 
+	guard(mutex)(&spmi->fifo_lock);
+
 	if (spmi->prev_fail) {
 		writel(SPMI_ACT_FIFO_FLUSH, spmi->regs + SPMI_RSP_REG);
 		spmi->prev_fail = false;
@@ -195,6 +199,7 @@ static int apple_spmi_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	spmi = spmi_controller_get_drvdata(ctrl);
+	mutex_init(&spmi->fifo_lock);
 
 	spmi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(spmi->regs))

-- 
2.55.0

