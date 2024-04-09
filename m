Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B5717C0B0
	for <asahi@lists.linux.dev>; Tue,  9 Apr 2024 11:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712660620; cv=none; b=cxqBtUTGWQ7ExPqY4MPtF5GJ9UFh6h9FoL/MB2wZgs5x8liMAMH3OLYEBE7JrMEAs4IaWW1d00YidIm0o9R5wufxkuERXfFGccivfDHtECakodVojBgs7ACuPfmfdNe44RMenSZoT484HDapCJ+a9J0VCxw9x2RYSmwB+Ei7XB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712660620; c=relaxed/simple;
	bh=rfBIQ16lw3YLziXerzIzYPI5vDnBIoD+c9BYXTQHuR0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OhrosxwkzuynU/fdlikHY1nNXlsSAftNlypqW6mpR6UUcv8G7AJLMLREGb81ZwTAK/cRHQDIfwFhE07623fPCITyr9HjvmFS5CrBEenPGUwsAehGAHDpHTl8tQZTLGVLHwnaXuTwz1JUMhV6KDV1oGDrlMVpgWq37lq9tax0qrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ZK93D7+G; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ZK93D7+G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=TSsEO
	mMeFjpa4wdVSYXOGdmsaMpEPa60zsgqosWqJow=; b=ZK93D7+GzJuOQcApaNkcC
	xAKy96ciTg4nKffwK8Qe7dIzr10itFNlG0vcuTnCCTEm/+B8urwBoOZgg1rF0X7H
	aNz08JIbB10S+Vh8LARJ0eXtui1SyPoVwMy9qPuCPh5ipEs1NEDV+N9egBuHPsWg
	m/yLaxeNP9YjTIqgYNizpk=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
	by gzga-smtp-mta-g1-3 (Coremail) with SMTP id _____wDnl5dgIBVmhGZSAg--.8304S4;
	Tue, 09 Apr 2024 19:03:13 +0800 (CST)
From: Ma Ke <make_ruc2021@163.com>
To: marcan@marcan.st,
	sven@svenpeter.dev,
	alyssa@rosenzweig.io,
	linus.walleij@linaro.org
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ma Ke <make_ruc2021@163.com>
Subject: [PATCH] pinctrl: apple-gpio: Fix null pointer dereference in apple_gpio_pinctrl_probe()
Date: Tue,  9 Apr 2024 19:02:54 +0800
Message-Id: <20240409110254.2201457-1-make_ruc2021@163.com>
X-Mailer: git-send-email 2.37.2
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnl5dgIBVmhGZSAg--.8304S4
X-Coremail-Antispam: 1Uf129KBjvdXoWruw1kCFWxCw4UWF48Gr47XFb_yoWfXrc_Ca
	ykCr97J348C3WrW3srtw13Zry0ka15XF9YqrnagasxCry3Xw1UJrWkuFs8G3yxW34kGFyq
	k3y8X34rXr1UujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRNv31JUUUUU==
X-CM-SenderInfo: 5pdnvshuxfjiisr6il2tof0z/1tbiPQG7C2VOCYQteQAAs+

devm_kasprintf() returns a pointer to dynamically allocated memory which
can be NULL upon failure. We add a check to ensure that failure does not
occur.

Signed-off-by: Ma Ke <make_ruc2021@163.com>
---
 drivers/pinctrl/pinctrl-apple-gpio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c b/drivers/pinctrl/pinctrl-apple-gpio.c
index 3751c7de37aa..af2f90d1950f 100644
--- a/drivers/pinctrl/pinctrl-apple-gpio.c
+++ b/drivers/pinctrl/pinctrl-apple-gpio.c
@@ -474,6 +474,8 @@ static int apple_gpio_pinctrl_probe(struct platform_device *pdev)
 	for (i = 0; i < npins; i++) {
 		pins[i].number = i;
 		pins[i].name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "PIN%u", i);
+		if (!pins[i].name)
+			return -ENOMEM;
 		pins[i].drv_data = pctl;
 		pin_names[i] = pins[i].name;
 		pin_nums[i] = i;
-- 
2.37.2

