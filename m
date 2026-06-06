Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DDC3B0AE5
	for <asahi@lists.linux.dev>; Sat,  6 Jun 2026 13:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780752373; cv=none; b=BQj008SUJgzc7zbOhIt7WhxjC2htwi1+w9IXwy8CdlSjY20bSvIFrfGM067IwWMEoyl78IM8w109SvyyTAIabYUInzGX3zSNkXRVRHCU1kLGv9tOK82H7lkCWyMHax7Tu/lL/HA/z1zfcGu+eziKZH4ADpWhElfBB7rxtzx3xCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780752373; c=relaxed/simple;
	bh=m24MQbKzf1MwyNbAaZ52Y2HqborWGOg5ZSaflev6tNc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=npoLSFuo4jv7pdrP73OWAzNMKoUXdMMo5CQMuj7ZNr9Pq4krfI02vn7GkU6NtRht/AuNDjFjK6Cn3CGJ+jTJrTAd3ahf9nWPNlByLw+sLhoQbHloNTp4sJvjFnJtUSczK+58851Q4WtGEuSEdvOME9QfbyxGu1bdoUZ5OB1w80w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=llh3mTXV; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="llh3mTXV"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8422871b42dso1736155b3a.3
        for <asahi@lists.linux.dev>; Sat, 06 Jun 2026 06:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780752371; x=1781357171; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NeEBBh0lNzCCAreOc9bk7WWW8nd2UTHn7HjqcTneUFU=;
        b=llh3mTXVYjto12APrxqbx8yD7Rj+ytvbdpM7SyWOKpTi3LPJW16jFrFofvIBGtHKC2
         sxGdeDf2GoiUZSiM2AYX40i3qr4Zlu9fouUIrxPVZtAgPsv2YQ6Urbn2I/CB427jvO/1
         h0neMZ72yPIXxPRcltsvj/bBIYzWv/kgu51FUkY2QX/bT6+maGXyj4NHbMs28riVj7tI
         ndqfF4LYpWV93puChi824fg1AeKPFukCerta/+89fnZgkR8cN0L6wdt2f4CQc7exMTPv
         jVERUyLx2FatmhzUukK/JmoapUpojEM4jCRFQx9bBI1kEPSHuLrfH/lEGBIWthQV5st0
         /Yww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780752371; x=1781357171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NeEBBh0lNzCCAreOc9bk7WWW8nd2UTHn7HjqcTneUFU=;
        b=N5NR+0SzE7f9jaZG/EMij/F04ofS3H+ZZCK3kqaL1vVTHZN8l64s4thsTIhHHthewl
         l3c3BFgnzZttgtBoKbrAWAmgaudPfrss0uR1TeHixxXZI1dGODvtKgxzCSYUQPWYiJdj
         /TSEy69FA+W1YkgpobEJ2jfD77lWdH3VO595MO2itbRnh95q618j+MjmW8uRvG2ar5zl
         FJXcyMOWTkNBn/+X5a9Fto0X3GlQi/eANNw5A8ybXMgO5zrSsubLJ16c7napS8VStw69
         Q/2Y0e5caWW/RcWfLLwLldTm3PzP2A6Q4SOxJF27tXclK7P42j6tUsBPcC9zW/tp7C4A
         D6PA==
X-Gm-Message-State: AOJu0Yxfp7t8IxYQmB3OoSYjnXd5lsGChKcBgtRBaXrAsSSbwjBkIqeY
	3pRDqE57NJeQ2UmNRLu0Rk4F7SyFaMgL7ZxTtVzgy+mmf3SmClqJ/Fcm
X-Gm-Gg: Acq92OEO4ieBZU61+1FWBLDCIP3Qt6mNKNYMFPALcqCc2JXDwhy8aw8rA6Zl1Y1cqMi
	7c5lKk4huZsfTKnsMxORA4yqAUGE0YGsSycZVwOefunbycjU5S80hxfjKx0qxQL4wNBY3A3M2lB
	u4taXazsQ6IgM66qV1bPI1vae7GNTUX86uD04PqweBtlgE8vVqrlNA0g2+iUtJ1+MSK7BXP8Oip
	kAl8QD0XC5HcaHpvZuUbpXRVXDk3Tb6kgGRzFw4bh2Q9xmEjYHIAYr+/24g4HH5Nbvrds7qr97y
	XRTO44hF4h3BE1sMs5TMF+6EJXCMluDyyxqHFMhCFdgIvhHDZGkgk8ppD7/DkZURzEllZ5Coos2
	ony4HLOhYC2mxJL6F9R4JXcZd+6a0UMEMDm4XKtMIn54FjBZsVg6HW0yLuk2wQ7CbpmkLT2bemx
	8cNmTLsNvDqCCKu6GbDDTwofrc8pryMX//1N/TcwJGKMbom5w=
X-Received: by 2002:a05:6a00:1da3:b0:82f:3a1e:5618 with SMTP id d2e1a72fcca58-842b0dafd4bmr8292626b3a.22.1780752371348;
        Sat, 06 Jun 2026 06:26:11 -0700 (PDT)
Received: from [127.0.1.1] ([223.122.38.120])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-842829188b9sm12910688b3a.59.2026.06.06.06.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 06:26:10 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Sat, 06 Jun 2026 21:25:25 +0800
Subject: [PATCH 1/2] nvme-apple: Only limit admin queue tag space when with
 Linear SQ is present
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260606-prevent-tag-collision-t8015-v1-1-93ccf4eca550@gmail.com>
References: <20260606-prevent-tag-collision-t8015-v1-0-93ccf4eca550@gmail.com>
In-Reply-To: <20260606-prevent-tag-collision-t8015-v1-0-93ccf4eca550@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Keith Busch <kbusch@kernel.org>, 
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1520; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=m24MQbKzf1MwyNbAaZ52Y2HqborWGOg5ZSaflev6tNc=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBqJB/qBCoYq0Ez0tQV9FSpbDzHKmr987/6Tm152
 E69XiIGqPCJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaiQf6gAKCRABygi3psUI
 JL6OEACOBZpKq3tWJKlPioh5me2NNMMRMIe5utVW0bqMBKpjmqP3LeRjWQm/VfeKB48ntOYS1BI
 hks3Rnd4mrLdzCbnspo9epLHKpgBwJ4CsEKcisn22n9MSykbzwBKIkpgp71ndvvIYb/bxqi086A
 u440qaBo820Tyc74ElD93CuXgIsAutDV+hw3VJqvTSwPDTXEsZ03bQNGoe7yZOCyrqvj1PIz7fE
 xkmtUoD+suZJTjmXCn2ohTLExkZnNPABpqNrQ8UkYQ/yjYIgiolVEl4X6LKCLw38/pxF+pIJs+3
 1+y88fttHsS7FbTj7lDp2ZSUC+KniJCuFaEJECQjCNpyNLZSpotYI8qY3OK/VaoiGNIgBnyGme+
 7RzHd9HylqE9CsUQs60eWBoCkBlnWEiwTnxWLark0pSduu/Phw7FMOMFlvhJxBcdyWdPCZTIkkt
 k63yDX1dpoP3QNa37PkcG2VRM+CESHNgOHzcAbgbWQEgFgV7FFb6QJsT2piKh+ltPWZoGPcbZG7
 h0CUC+KwmkfrHxHDJHo9+XjYtCKdlx58Pv2TPyH9iB8BXlLPjdsrQXQzWrV8z9kdIBQZ/gUo6KW
 w14kgVGXMdIhSxF7Sssl/671LE82DMKMlS1Yx11HXwySbpL008BGXMl+pcypaWTzDmUeBo9i2cM
 VFCscrmIgwrx07A==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Apple NVMe controllers require tags of pending commands to not be shared
across admin and IO queues. However, on Apple A11 without linear SQ, it is
not possible for either queue to skip over some tags and must go from 0 to
the configured maximum before wrapping around.

As a result, in order to prevent tag collision, dynamic tag reservation
while a command is in-flight becomes necessary. In this context, there is
no reason to limit the admin queue's tag space, as it is not helpful in
preventing tag collision.

Cc: stable@vger.kernel.org
Fixes: 04d8ecf37b5e ("nvme: apple: Add Apple A11 support")
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/nvme/host/apple.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
index c692fc73babf..c1115e27a0d6 100644
--- a/drivers/nvme/host/apple.c
+++ b/drivers/nvme/host/apple.c
@@ -1303,7 +1303,10 @@ static int apple_nvme_alloc_tagsets(struct apple_nvme *anv)
 
 	anv->admin_tagset.ops = &apple_nvme_mq_admin_ops;
 	anv->admin_tagset.nr_hw_queues = 1;
-	anv->admin_tagset.queue_depth = APPLE_NVME_AQ_MQ_TAG_DEPTH;
+	if (anv->hw->has_lsq_nvmmu)
+		anv->admin_tagset.queue_depth = APPLE_NVME_AQ_MQ_TAG_DEPTH;
+	else
+		anv->admin_tagset.queue_depth = anv->hw->max_queue_depth - 1;
 	anv->admin_tagset.timeout = NVME_ADMIN_TIMEOUT;
 	anv->admin_tagset.numa_node = NUMA_NO_NODE;
 	anv->admin_tagset.cmd_size = sizeof(struct apple_nvme_iod);

-- 
2.54.0

