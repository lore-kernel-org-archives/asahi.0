Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.81.229.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794113553;
	b=hKyf9OGBdUuG4gR61A1GvKXKTlAGXp41VJYROAi7jAB9TggF78YNLuC7HsD53IOBEX4f
	 hqeZ+/pJwnuJnQaVkjSGNlWxRKOl00DWThWVSFmyP7mc6zlsvL8bj4wNZtu4+c1Ge5NVD
	 Vbepwowe5bOj66nhin//0C8w3jaqo+hfk6KUOQWwe17CKAYBIYq2lDzz2YNK4wGwGzbie
	 QlzuH1XcEhoS1fUcM23JDF4e9eI+UeqKk8DADowIoLHthdNvfl15d3im2RCTfakKzj045
	 AL2J80JU+IxA17EVx2FXcroRNxZeENaXC+rgy84+1V7Xn2/+7ksnbeN0Hpr+A/9n/KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794113553;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=2dQBG9InMagHP0mqEPXt9dfx1YydVwdimm3JgTpzy48=;
	b=Em0jU/GZ5+s2BfO2QnvqIRajrE9jn95h1iBa4P382BnAky2fI21ipPKGSNVt9NAtoia1
	 GKz5k+lNVltwSxyYcWEwPLuYif7Fgnzdynoi1R+YxcGQdp7SwBA3FS7QB4cRaWnAG47Bz
	 R4KMbifiX0zO6Mg3cyEAUUEKDzzFHMiikjQDxaWP6zAD/2EBvjoYvbji3zPZom1zuYOKx
	 091qJgvgdJR2jUwQtIQrt6HkiBqznAbgMzYdg+y6Pzkr2BRaJoGEinMajP1q81coEt0VT
	 ykWbYaoQxiY7kWbqVlXYHk+i+wLkDa1IsTf6QrwMfPwIHm7IYTZLNburyS9LsZ9zsLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chaosmail.tech;
	spf=pass smtp.mailfrom=chaosmail.tech;
	dkim=pass header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=OlfpHa0P;
	arc=none smtp.remote-ip=77.81.229.115
Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E89606A31E
	for <asahi@lists.linux.dev>; Sun,  8 Nov 2026 04:52:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86E89606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=OlfpHa0P
Received: by chaosmail.tech (Postfix) id 7015D1CA4AC;
	Sat, 07 Nov 2026 20:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1794083794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2dQBG9InMagHP0mqEPXt9dfx1YydVwdimm3JgTpzy48=;
	b=OlfpHa0PRSlBZLyoMBe9tnwDxHD8ojrn//tcG4wa/Am8wm+FsQcrKvOndzKecdCVqujcgU
	n5Cw2Q8muDcxkmwjYtG7y4Wgbmojdc6yRzsq0pIyqEPCJJo4Kb7RIzt90F+XGxcgFneG3O
	PBwoFPYZYYdo4IwMTgMmB7E2R5zoWzA=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sat, 07 Nov 2026 21:36:27 +0100
Subject: [PATCH v11 5/6] spmi: apple: lock around FIFOs
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-t603x-spmi-v11-5-322490215f58@chaosmail.tech>
References: <20261107-t603x-spmi-v11-0-322490215f58@chaosmail.tech>
In-Reply-To: <20261107-t603x-spmi-v11-0-322490215f58@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794083789; l=1392;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=d3g+GWSt/AwZqBYJkjfa+jLDq3xqOV8n8h3KEqKdYZ8=;
 b=fAnuOCbRphwdfJfXSN1CepEzsKQadhW5fSYoXoX9dgEFUH9IkSn6VG1OtqZzn25cldaa1G0cg
 mfs/wrogzKdCUJ/16Jv4DMIlQT+CNTA27v9AYZK6/zjMRnLhP6aLZwC
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
2.56.0

