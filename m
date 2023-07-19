Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB46A22EFB
	for <asahi@lists.linux.dev>; Wed, 19 Jul 2023 22:38:53 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-668730696a4so83343b3a.1
        for <asahi@lists.linux.dev>; Wed, 19 Jul 2023 15:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689806333; x=1692398333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hhDuaWIdtI3VxINGy4xngROSBmAaTvKi9fOK78JMCKc=;
        b=gHaeqrsBSvle8ussVsR2PnH5rF8XjBtz2YegJot+HtyutyM+p2jd7p5WTMwXfLbqHV
         +xL3Ot0KrrPCKPgYi2dMxFCxdkaD5j0a53+puK1gAaYfH/28SN4lwzGecKFqmv/PyZlg
         iQYcScmvWVW1A9oecLmiftqdQChuipQtTqKzmH5NAuuEPXFrZ8E5U11M62NfWD8F11iV
         KpTV8RKH0OLjRPJlpA+TCnFjPdJx23hWbWJBvyLkPune4CT8PwQx0lGJzOFgcJDclv7G
         VqFBRyIjF+LBaAsXISbpykHOoDUD3X1BR16FDxqPHUBUrv+9nvlp3A8rlhE7xQkfv9E6
         2yUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689806333; x=1692398333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hhDuaWIdtI3VxINGy4xngROSBmAaTvKi9fOK78JMCKc=;
        b=XdXwETBMkwEJlomLZfNzjWgl2ZTsxriGl+dfx61eaQRzWN3wlCB78aEpjYicVvEjFB
         WIQB7UE4RaFS44gGOQXXdcN5VPdT11zZedyMXfGBi5za14/586M4HtnZ5/CuPSRC51f9
         LTr5YzTRRE9Sx+K6z4pIlvNgg9pH5nkWiKxE1YOE8WvGyYwWe/TsE8J5Jp7irQNykp4T
         z9O36hJPsmLq5MDBpSu4SXIMb9+gTSx0W22XTtglZxxLg26IOcE75U8NbpMI/w2KsfMc
         cGYciaxbj9pE5Y8EgVFXlDHvACFZK44pEOiyTuHcC2qT3ihzW2Ba0fkIiFtWH///3X4k
         TlDQ==
X-Gm-Message-State: ABy/qLZxt+f06dMEBYGluJ9wpc0PWqRdzFsYdAqyRvunqnhTjRym1Q6B
	ZWtkUz0ar/fHGv4GUytFk0Y=
X-Google-Smtp-Source: APBJJlFnSVZU+y2eVwJou+1lLI+OGWpLPNJffWtRe6QH8zxmp4w0rfb4mjaYTPjekBnsDdlrDuPmtQ==
X-Received: by 2002:a05:6a00:1a4c:b0:67a:f6f6:ccc6 with SMTP id h12-20020a056a001a4c00b0067af6f6ccc6mr4522386pfv.5.1689806332980;
        Wed, 19 Jul 2023 15:38:52 -0700 (PDT)
Received: from ubuntu777.domain.name (36-228-69-4.dynamic-ip.hinet.net. [36.228.69.4])
        by smtp.gmail.com with ESMTPSA id e8-20020a633708000000b0053051d50a48sm4028568pga.79.2023.07.19.15.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 15:38:52 -0700 (PDT)
From: Min-Hua Chen <minhuadotchen@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Min-Hua Chen <minhuadotchen@gmail.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soc: apple: apple-pmgr-pwrstate: mark apple_pmgr_reset_ops static
Date: Thu, 20 Jul 2023 06:38:47 +0800
Message-Id: <20230719223848.138363-1-minhuadotchen@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes the following sparse warnings:

drivers/soc/apple/apple-pmgr-pwrstate.c:180:32: sparse: warning: symbol 'apple_pmgr_reset_ops' was not declared. Should it be static?

No functional change intended.

Signed-off-by: Min-Hua Chen <minhuadotchen@gmail.com>
---
 drivers/soc/apple/apple-pmgr-pwrstate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/apple/apple-pmgr-pwrstate.c b/drivers/soc/apple/apple-pmgr-pwrstate.c
index d62a776c89a1..9467235110f4 100644
--- a/drivers/soc/apple/apple-pmgr-pwrstate.c
+++ b/drivers/soc/apple/apple-pmgr-pwrstate.c
@@ -177,7 +177,7 @@ static int apple_pmgr_reset_status(struct reset_controller_dev *rcdev, unsigned
 	return !!(reg & APPLE_PMGR_RESET);
 }
 
-const struct reset_control_ops apple_pmgr_reset_ops = {
+static const struct reset_control_ops apple_pmgr_reset_ops = {
 	.assert		= apple_pmgr_reset_assert,
 	.deassert	= apple_pmgr_reset_deassert,
 	.reset		= apple_pmgr_reset_reset,
-- 
2.34.1

