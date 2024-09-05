Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A2728684
	for <asahi@lists.linux.dev>; Thu,  5 Sep 2024 02:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725502179; cv=none; b=dEVXdy9jUeGtuWwApuGIJyUx+3rVxnEuanfNJ8YkmJPm2PAFKxAvYBI6v8G5LDyvSF6RmQPRMt9fZ9Lz+FnKQjK9ZWKR92yHtfGnsPXh94Zg60D3OD6NT8P2gVzkCuGhBeWZg3xfD3NHDmOt3e+9Juy5dsw7yU4MKgdocgNcr5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725502179; c=relaxed/simple;
	bh=V5+gNunt16oUkcf+NPsxyEcEVV/pBevZJ7IRqjTAZb4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pI61Jbjg9qc9NoMTHywWSQHd1YCBEsnr/EviR2UAKKr+++GrArdrBJULgvuRDXxyBYNgBjpBwuhiEx8HfDOFSYmx5HtjP1AxXNMI9R1VQlTlO7+0Ndrwrbq3yGSfmDwZQevMfBoE3dJmyIlhysZMNy08gG3gDS5v+dueOQiPlsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
	by APP-05 (Coremail) with SMTP id zQCowACHaurPEtlmOPFYAQ--.14890S2;
	Thu, 05 Sep 2024 10:09:26 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: marcan@marcan.st,
	sven@svenpeter.dev,
	alyssa@rosenzweig.io,
	linus.walleij@linaro.org,
	maz@kernel.org,
	joey.gouly@arm.com,
	stan@corellium.com
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ma Ke <make24@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] pinctrl: check devm_kasprintf() returned value
Date: Thu,  5 Sep 2024 10:09:17 +0800
Message-Id: <20240905020917.356534-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowACHaurPEtlmOPFYAQ--.14890S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKFW7ZFW5Ww13ZF1fGF4xXrb_yoWDGFb_Ca
	y8urZ7Jry8CFn8urW7tw13ZFy0ka15JFyvqrnagFW3Cry5Xr4UJrWkurn8Gw48W3s5JFyD
	trykZrWrXw1UCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbSAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
	FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr
	0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8v
	x2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20x
	vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
	3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
	AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAI
	cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUAxhLUUUUU=
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/

devm_kasprintf() can return a NULL pointer on failure but this returned
value is not checked. Fix this lack and check the returned value.

Found by code review.

Cc: stable@vger.kernel.org
Fixes: a0f160ffcb83 ("pinctrl: add pinctrl/GPIO driver for Apple SoCs")
Signed-off-by: Ma Ke <make24@iscas.ac.cn>
---
 drivers/pinctrl/pinctrl-apple-gpio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c b/drivers/pinctrl/pinctrl-apple-gpio.c
index 3751c7de37aa..f861e63f4115 100644
--- a/drivers/pinctrl/pinctrl-apple-gpio.c
+++ b/drivers/pinctrl/pinctrl-apple-gpio.c
@@ -474,6 +474,9 @@ static int apple_gpio_pinctrl_probe(struct platform_device *pdev)
 	for (i = 0; i < npins; i++) {
 		pins[i].number = i;
 		pins[i].name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "PIN%u", i);
+		if (!pins[i].name)
+			return -ENOMEM;
+
 		pins[i].drv_data = pctl;
 		pin_names[i] = pins[i].name;
 		pin_nums[i] = i;
-- 
2.25.1

