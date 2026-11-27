Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772393;
	b=c3b9kQzqoQlvtWhuKMUriLPWjbtskxEj6W+I7iCqvWtrBsc9cNcF1rqa/DyWxd1Ztl3q
	 62U2pgH66UvIgRO2zuLwWoEcHUOIuR2YW74fh1gO7QHoI3H5ZqdKIINX7bmlFsyo28JVs
	 mWfE69kNWfADIWpzT08kJAr9zr2p0x04V8DbqGUau2pP8C3IRwKkYK91MyWI/J74YpV6t
	 bwlcDjf/9kkPgIA++UonpgW3yBVGey3BgpWszQrRAOBJHp0D8ADDz34exmF/ivYBnwUuf
	 iX2k0XDyChH/BMxnAAU4Dicxt4ycN2TmlHPGzUhM/n0QBKcIM/39m9nnVf/rui9QTaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SVK9o+TEy+mRM7Y9b0GBxL1NkApW4WyeZVqrEHMtafo=;
	b=MvCzSpKumuzKlJNOObFb8ENuwEqeFaqZiEIOCpgljisj1ATeQGxtAi04MPx0pMtq7ISn
	 L30fzPrZrUirnLVP0eEH5qznASD97ZpVljzxmY3C0ww3ddI6JHr3B4hJLCLeoDNhnAC8l
	 B/BW8oa+BLiQDKHJtS1WyphJkRmR78i6cIxIjcbgK7SawEX8mKqWCOj2Yg6K7Jw9ymVU0
	 2EK1VmSpJQe+QKOZIuMMGHcdAhTRHUfqNUYR4ay5rtDtcA+ul88eOgNxqtKBZJxQ90f8w
	 vj0Q1uiLTUJhm8FupIxWRZzD3q98ZZFCuf+1Pk6PIJnlQl73oRLtgnuL8H1H/2HQ8nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dXcl4Pk3;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DA0606A31E
	for <asahi@lists.linux.dev>; Fri, 27 Nov 2026 09:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51DA0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dXcl4Pk3
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dee593f18so7377431f8f.3
        for <asahi@lists.linux.dev>; Fri, 27 Nov 2026 01:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795772392; x=1796377192; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SVK9o+TEy+mRM7Y9b0GBxL1NkApW4WyeZVqrEHMtafo=;
        b=dXcl4Pk32cfbMhCrOl8J/p+nK7vgb1c4YBS7G5G8PBLmnUg6P7ML4WMuDiKtmUQ3d8
         yE8hXrAhCkCDDMrva2KT8788tTdpMZbMYLFfmGNOtK912rIZ7hSPHFD3fIllHLrwh6Zm
         ePPDcuJb9oks5d3OQ1II5RK0kCF1vUl/Gip1Ro+vB5FvDY3loNbM5Oq3o+dB+GwUeFhb
         auqacQpEMq2bagu3mB+k4QI8BOinv5q59Ht3ZFR0gYhD5HNujulLfuMvn0Bj1CsO7Lfm
         OC5/jiyE95UQiUikDriLCKTix00yVjsEvLxkWAxo5sbdUtvijAoxTQm/5zZ8a1+QlPAB
         Ni2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772392; x=1796377192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SVK9o+TEy+mRM7Y9b0GBxL1NkApW4WyeZVqrEHMtafo=;
        b=ImKs+jurTR4g8RGt/u+wf7EJD8XFWB4aL/NHd60QhVOJOClIfW4+f9yoDxyXJrMbMF
         iG5z9zUuXSt7F6Rj/DblyRY7CxbiL44p+VElerrfRv3TK0d3y6JAl9Dpapv1nbULbnwg
         PIGz5dL7rz09YYQxfogOyx+dDUJOZP4GDfaNsx0MTwhRZyyEgdREkvp1NPEDLNNeFoQp
         PjQDSkBzgRQkOQ54r3IxP2gl486VzKj6hPYuJzJuFERBXH4N2d+uEODYSpNjhwQPaAiI
         4Z4klIJv14Y7i5U74yuGT4hi5dTBBw/5J0n2WjK262GKKZ65qRuW9Yyf5OiaqIip1Qim
         ruqw==
X-Forwarded-Encrypted: i=1; AL+hErFyWUVyhyZu/rmquTLcyhcJOF1IPW++ODQmAO6LchH49h1Z2+JGRAecoXq+EDt8O89NY6SfUg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+VOQP2tJtRlXSvvlt/8/rz6tDjU3YeY+zP+vG/iUFkIJYkdTi1
	qtr7hWRYfAB0Acfd4fRTbzlpEJaawXiM9L8NMeurcy32x8b5R41UyxZQ
X-Gm-Gg: AZFdTZdU9F/UmjBwKJfh+xOImL2GcwFjF7iiGxHoCYL2OHauEqBWV4ybqvVgGVWCdqv
	K5lFK/6aIgadifTeIDvAtN11JnMYaZZLOx1/tBbw92VxAYoGQsH6SkXjbk7zMpnMszAX/37EUYt
	SQJIfRnHGeGo8W/vG1tHCFCGDeuXDrtxLkEO0OLVUXJsVFy+SHb06RZ8JiRrZ5WyB/xCCtXD4uW
	wi0mdv2l5BQ2+YvVlLImmvJHJbeWAf6DI03xq79hxX48yJpZaaJAVC7RArmihFNSw5uou7hqRUa
	3iD9kf1VSOGG8kbbzgjD8De4HOJCHW9h539638IOg3OnK8J4tao8z9BFnQZPrKOQeUDPEY682Bt
	cAigqoTxh9EYF37RVmmlmpsQpk4+4v6FwREdxgRvCGChBMQ/+m/c4YKlCPKCmt6zlYvZ+SFTXV3
	kcU/6jagQ2eLYdMd8eQdtBOcMcL660mM1x5uNWVSIaqCOm7eDmWzW0v5ZjOfIexojKmc0d5rELv
	nmkEcocotHgMF9soHpCet0BfjqzSXiGDL5Kvd7nEAzCVZa2Kckov5ijlvXmMJF8t9PXZVJYs1W2
	UNlxkl5iNluYCGfCpCLNjFsdCOErcaSD5JhxOz2S0ooR3FUhVpeaCUApfnLQClFnV5nj
X-Received: by 2002:a5d:5f53:0:b0:4b7:6ea2:54be with SMTP id ffacd0b85a97d-4b76ec0df5fmr25970915f8f.14.1795772391607;
        Fri, 27 Nov 2026 01:39:51 -0800 (PST)
Received: from localhost.localdomain ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm55531185f8f.21.2026.11.27.01.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:39:51 -0800 (PST)
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: Sven Peter <sven@kernel.org>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Robin Murphy <robin.murphy@arm.com>,
	iommu@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Anton Protopopov <a.s.protopopov@gmail.com>
Subject: [PATCH] iommu/apple-dart: Properly check the error
Date: Fri, 27 Nov 2026 09:51:18 +0000
Message-ID: <20261127095119.1342988-1-a.s.protopopov@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The apple_dart_device_group() function expects pci_device_group()
(or generic_device_group() for a non-PCI device) to return NULL on
failure. However, both of them return an error pointer instead of
NULL. The error pointer then is immediately dereferenced by the
iommu_group_get_iommudata() function.

Check for an error pointer instead of NULL and return the error.

Fixes: f0b636804c7c ("iommu/dart: Clear sid2group entry when a group is freed")
Signed-off-by: Anton Protopopov <a.s.protopopov@gmail.com>
---

(Found accidentally, while working on BPF stuff.)

 drivers/iommu/apple-dart.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index d8302128b465..36ce5ac39b7b 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -981,8 +981,8 @@ static struct iommu_group *apple_dart_device_group(struct device *dev)
 #endif
 		group = generic_device_group(dev);
 
-	res = ERR_PTR(-ENOMEM);
-	if (!group)
+	res = group;
+	if (IS_ERR(group))
 		goto out;
 
 	group_master_cfg = iommu_group_get_iommudata(group);
