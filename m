Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA70B517BB2
	for <asahi@lists.linux.dev>; Fri,  4 Sep 2026 19:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788549790; cv=none; b=MLn+bKMnsvoo08rzxisI+yWo0EpVo4qEm2ZM+Od0VkA0o/Poj/DULj1JjWmOQ946K0cJMCzab9mty70SRCzzrjtUqml7RwSkPFG/9fb+Aq2ean/R7wwXo4QRseQ1PBQ42Y98hf4UB08oOP6n6qJL1NXc7HYZh+s09PxIOBepafs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788549790; c=relaxed/simple;
	bh=BDEA6GudxwgaelSOCprdOjpqHWFJeXmM352vY61q+c8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IU9Hlj4qX7JEVJ8ZUIL3iDdbJQFDj7/NUtShOYY11PjjB0audQK/sWw+b5Y640+Nv+ukda/XMJtkHLqnKVhgMbawFYfMOVfYCVQR8aKU5gefy3j9zYhvhVWk9lXtAZ7EXhNilop3SKLEwvMklgW8bG8h0nU6qgI0z4wwDQ6Y/6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=CPBf9+GE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=i1E1/XLk; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="CPBf9+GE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="i1E1/XLk"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id B98851D000C6;
	Fri,  4 Sep 2026 15:23:07 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 04 Sep 2026 15:23:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1788549787;
	 x=1788636187; bh=NgAYkIVz3qqE8Evm69pEQadiQpGzFTgARH7DryhLzks=; b=
	CPBf9+GE1b79vDZ8fdGbDraxE/4s7lqTd10XiaL6lUavt4hPxmuDefWZK8y4APvz
	2Fm4h+Lj/NQTxF3LK03GLSdzS3z4FZARnlh0USu4ZD/dKiWcTWp9N8zW9sWSoOHz
	xwSfL0my7OoYjxssEsdciKpI73hYrtS1HTT8L8JvAu1Ma3jVdFmSs/PFOqFaXw8n
	H5nPA2TbrS6AlL+hXbAsrpdaVThHkGT06U5XlO+8250PFqGw1VCeCrflCm3KXcAS
	e8RZpTy9cVrTERYhKSdr4kaB7Tpn+G291bMxmqpn7vQQ20w9qEmtOY8tGx9JeMCs
	e8fJ7S4GEkww/bwx84lSGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788549787; x=
	1788636187; bh=NgAYkIVz3qqE8Evm69pEQadiQpGzFTgARH7DryhLzks=; b=i
	1E1/XLkCsRS+pP4Qvbx9UhGolC9SoQBN1uODBYU+TsLRq7611zXJsWbTwNIiYh1j
	RTzBLkuefzs3WMcRfTni6RK/GSNMQ6dFXUJOi/wP3oCUmVN7lp5x8VgNm9XUUFb9
	jSh1bcj/Gq5KBnZ2k6HSyo46RpT1xD8cm5OWKOjX2AV72yNfvA2Ld8ZsGzqfbSvm
	9rQ/kSVuxvKRFlDYiP0GunPeXwIjjgZx4oaM9AH86R/Thqhw1pPe8tLgbo/cF828
	s0XdP1qOJDuCp2pYSMsD01hQrMJCvwfQYMLvvAb7LQLj9mrRc0ypEHBvWw6u+ZNz
	BjDy325hQRsrL/kqKApJw==
X-ME-Sender: <xms:mxqbagUq5nqRe6y5LXF3Ni3RrLJw68RUlQsXq3JxjJcAiGqiQp0Z3g>
    <xme:mxqbapgX6T36YreLXaWsx9jo0SuTrE1AGtENaBnm7NzZH8nggj5p4FvvH435Fsl4Y
    oYwzAnj0TR2UeGf3i0Pn-Y_4FpjCkB0aNf_8CDIAuVF7OUUe8wMQFpH>
X-ME-Received: <xmr:mxqbaorLEdmPgHaYZiwFrcyBPpdpAEp2ad8p05K8pZgXOF4tFCi_O_I4FOuSZHjAn6bELWZIxm9b-u8gQEMM11equPKV2UbP8LQEYg>
X-ME-Proxy-Cause: dmFkZTGE5u1UdZxmTiONsLlgAgk1Upsu+uCvGB/VsgdfAX2dMLyJQAWoEyM7Hh0aP5oFp0
    +loYn89F63ra14QUB1ZnCrimTyLeACWE6DTONQA+wsQVbcFnaXDT2wnltHUtR3uvu0GYXi
    YJl9eAqqa/NMqYlqY/YUfeocpekeqyKkWcM2a7K+bYiJATu3nX8Sa1ZwiJwlKu8PuPzAN9
    HjKhSslaBogp3SYq0AZIoRYXLxl3vPW+rxRxTfSwWKWn6HyLfiOSdCO3VKcRZm2xLZNCwb
    A2N4vuLhQcULsgb+gjoqon+76I9WP6rBq2gDKnQ1OhNWQOrMofW/0K+BXJ+VJnn8JaJmcm
    S4DC3oQT3IFnCjLgNarx2AICjuU5dfeAZnGRf9QsYVOjsqXI/qIUhGdAAvjnq7zKLGHstg
    af3ZxhuzeSqxCBWhKI6Xfw+VLBJWEMh8Vdc/54Sd3UD0sKh/8nheP/TyzBavMtSOfY4MBo
    gRX2MdvL1+zIDE7tJ+c4NzzoKZ0dfZwxayrCDJU1VUiB92GXBcg2ofadUYkCirBL+mQQPB
    dN6/k/fIRGGnOd2BU6WUi7R7vXa4Diqw7esKM3r8zcDnJ8gP9Lx88iJFP5DO2DozaohBYy
    3OLLaDjKvSCzAGVHfC3bspe5fEGSb6UdhVB8xnmCayn5A/Y45pkqgRZeJiAQ
X-ME-Proxy: <xmx:mxqbavFbS8rwk1SMKRprHkgQQp50_DYDDI4zKxKpDJyAxxB3uCjsvw>
    <xmx:mxqbat6n41-MLepmoe33YUwnkO_7btdGQnpfJnV0umDAKenJeoZ4ZQ>
    <xmx:mxqbanfUMxlALehd8kwYeYTI6iXz_W4MHUwAOMWOLq8sahOc9kJ_6A>
    <xmx:mxqbao6ZTs80AWmnbOGeqf07-RWkJAoQWHWouPmpFz9vYY5OjS3wXw>
    <xmx:mxqbahuGaUWEgj2hDJCKJ7Zhr2UjNsSYT5fp90zMKXhnAdFePM8jI9Rk>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Sep 2026 15:23:07 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Fri, 04 Sep 2026 21:22:42 +0200
Subject: [PATCH 4/4] nvme: apple: Drop the PRP null check chicken bit
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-apple-nvme-fwabi-v1-4-f7ede661c469@jannau.net>
References: <20260904-apple-nvme-fwabi-v1-0-f7ede661c469@jannau.net>
In-Reply-To: <20260904-apple-nvme-fwabi-v1-0-f7ede661c469@jannau.net>
To: u-boot@lists.u-boot-project.org
Cc: asahi@lists.linux.dev, Mark Kettenis <kettenis@openbsd.org>, 
 Sven Peter <sven@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Tom Rini <trini@konsulko.com>, 
 Francois Berder <fberder@outlook.fr>, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1847; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=BDEA6GudxwgaelSOCprdOjpqHWFJeXmM352vY61q+c8=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqzZUr1pCi3zVFbcz/XIKDjPO/tNzozu+7+Ltgqfl4rsv
 Ce5cV1dRykLgxgXg6yYIkuS9ssOhtU1ijG1D8Jg5rAygQxh4OIUgIkkMDMy3Pu2+faM6fe9WXPL
 eRdNOuK24F3bd9HAmUdcPC7WXlxspsbIcDHuu2NK9NzezC1yIu8ab19ac+fzlLqYW+tc153+cSr
 iETsA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Now that we program the DMA direction correctly the NULL check that used
to make commands fail passes. Another side effect of this bit was that
non-align buffers on the admin queue were silently allowed and that's
been fixed now as well and we this don't need this chicken bit anymore.
More importantly, starting with the firmware installed with macOS 15,
which is required for M4 but can also be installed on the previous SoCs,
the controller no longer exposes this control register and any access
SErrors instead. Just drop the write entirely.

Based on Linux kernel commit 8ce883fd068b ("nvme-apple: Drop the PRP
null check chicken bit").

Link: https://lore.kernel.org/asahi/20260806-b4-nvme-fwabi-v1-6-bde19ce8db04@kernel.org/
Fixes: 50333c94f2de ("nvme: apple: Add driver for Apple NVMe storage controller")
Signed-off-by: Janne Grunau <j@jannau.net>
---
 drivers/nvme/nvme_apple.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/nvme/nvme_apple.c b/drivers/nvme/nvme_apple.c
index 54821f80c81..948a56e518b 100644
--- a/drivers/nvme/nvme_apple.c
+++ b/drivers/nvme/nvme_apple.c
@@ -26,8 +26,6 @@
 #define ANS_BOOT_STATUS		0x01300
 #define  ANS_BOOT_STATUS_OK	0xde71ce55
 #define ANS_MODESEL		0x01304
-#define ANS_UNKNOWN_CTRL	0x24008
-#define  ANS_PRP_NULL_CHECK	(1 << 11)
 #define ANS_LINEAR_SQ_CTRL	0x24908
 #define  ANS_LINEAR_SQ_CTRL_EN	(1 << 0)
 #define ANS_ASQ_DB		0x2490c
@@ -257,9 +255,6 @@ static int apple_nvme_probe(struct udevice *dev)
 	writel(((ANS_MAX_QUEUE_DEPTH << 16) | ANS_MAX_QUEUE_DEPTH),
 	       priv->base + ANS_MAX_PEND_CMDS_CTRL);
 
-	writel(readl(priv->base + ANS_UNKNOWN_CTRL) & ~ANS_PRP_NULL_CHECK,
-	       priv->base + ANS_UNKNOWN_CTRL);
-
 	strcpy(priv->ndev.vendor, "Apple");
 
 	writel((ANS_NVMMU_TCB_SIZE / ANS_NVMMU_TCB_PITCH) - 1,

-- 
2.55.0

