Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3EC569C
	for <asahi@lists.linux.dev>; Mon, 30 Jan 2023 16:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675097636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kkgm+GawpEMj0/b8bomXaQOPdUfNkg30jmt/yNSamL8=;
	b=Gvd8XoG6FAAlaYOG+dTrpjYwsPxmM4kByQ0Z7KtvK51v5bd7vZhjrHkkOvXewkhtS9HgkZ
	jQ+HdG89RueS+aWkynDVjmHkhApHhYnRfDXFyHywKK+YBniiy3owPQfjSOumy3hqmxyRd8
	Ba6OwK6CQ2ew4GbHw2V+CeKA81fAb1o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-50-zZ7rEQT-N0i_kqYp6qaNmw-1; Mon, 30 Jan 2023 11:53:55 -0500
X-MC-Unique: zZ7rEQT-N0i_kqYp6qaNmw-1
Received: by mail-wm1-f71.google.com with SMTP id r2-20020a05600c35c200b003dc547f6250so2183864wmq.4
        for <asahi@lists.linux.dev>; Mon, 30 Jan 2023 08:53:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kkgm+GawpEMj0/b8bomXaQOPdUfNkg30jmt/yNSamL8=;
        b=L5yg+xesmWn+wn6Y7dBiExcudoIH/igVsf9sv75vFZJYn5ujhyI7C9KRV5ieouQyBI
         6YM5GzWeN0RK5w98MwRZAkmCeINvL4dLugux+dRAT0VfcsNtA6uzulU6hSJrDjP3/5RB
         qtyxFlehqRxuNHaGUs9/i2jTUeth/gL8cknEbtmtRC6eNXyJO2OMBArm9gu5MJjjmC9o
         fenIyUuRb1R+Ul8esU4WaRheWjZRO0ADZRNeSjsOQJm5m4xU3V/iOery6KRVGsId+KFj
         mUU+7XRtxGCTGekBV+UlG8kAf/Rb5IDI+AsO9okjfTCoWsPLkVRcheKjBW+BjluzPSOT
         w11w==
X-Gm-Message-State: AFqh2kqK1a7g1vIM+ntSkMithSysas1Drh+KhI7ZZYrW8okazeUu2pfr
	Jrpfjti2G/ycnVkT7aGQ4zTsGuggqA0sb/MnRbSvZvneK7knkZewZdIDKOZi56FK7mrc0tvqxHz
	IRp1tr/LkU5VhIU+wMoDQFywGcv9daD327kcHTlHwYhR6bYcA399jf+oc9HRvV6itzA==
X-Received: by 2002:a05:600c:3586:b0:3da:fb3c:c1ab with SMTP id p6-20020a05600c358600b003dafb3cc1abmr48909719wmq.0.1675097634607;
        Mon, 30 Jan 2023 08:53:54 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtAfoRcm7NT4ZYC0o5cofJixnO/hgW2tQbP0lBvYL7zDDtE7psgWTMQUvqDIedKwjr+ouHdog==
X-Received: by 2002:a05:600c:3586:b0:3da:fb3c:c1ab with SMTP id p6-20020a05600c358600b003dafb3cc1abmr48909693wmq.0.1675097634291;
        Mon, 30 Jan 2023 08:53:54 -0800 (PST)
Received: from p1.. ([77.75.244.146])
        by smtp.gmail.com with ESMTPSA id n20-20020a05600c465400b003dc43a10fa5sm8677422wmo.13.2023.01.30.08.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 08:53:53 -0800 (PST)
From: Eric Curtin <ecurtin@redhat.com>
To: asahi@lists.linux.dev
Cc: Eric Curtin <ecurtin@redhat.com>,
	Dan Carpenter <error27@gmail.com>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/APPLE MACHINE SUPPORT),
	iommu@lists.linux.dev (open list:IOMMU SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] iommu: dart: DART_T8110_ERROR range should be 0 to 5
Date: Mon, 30 Jan 2023 16:53:50 +0000
Message-Id: <20230130165350.58533-1-ecurtin@redhat.com>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This was detected by smatch as one "else if" statement could never be
reached. Confirmed bit order by comparing with python implementation [1].

drivers/iommu/apple-dart.c:991 apple_dart_t8110_irq()
warn: duplicate check 'error_code == ((((1))) << (3))'
  (previous on line 989)

Link: https://github.com/AsahiLinux/m1n1/commit/96b2d584feec1e3f7bfa [1]

Fixes: d8bcc870d99d ("iommu: dart: Add t8110 DART support")
Reported-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Eric Curtin <ecurtin@redhat.com>
---
 drivers/iommu/apple-dart.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index efe877842f72..3adacf4094d7 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -112,15 +112,15 @@
 
 #define DART_T8110_ERROR_MASK 0x104
 
-#define DART_T8110_ERROR_READ_FAULT BIT(4)
-#define DART_T8110_ERROR_WRITE_FAULT BIT(3)
+#define DART_T8110_ERROR_READ_FAULT BIT(5)
+#define DART_T8110_ERROR_WRITE_FAULT BIT(4)
 #define DART_T8110_ERROR_NO_PTE BIT(3)
 #define DART_T8110_ERROR_NO_PMD BIT(2)
 #define DART_T8110_ERROR_NO_PGD BIT(1)
 #define DART_T8110_ERROR_NO_TTBR BIT(0)
 
 #define DART_T8110_ERROR_ADDR_LO 0x170
-#define DART_T8110_ERROR_ADDR_HI 0x174
+#define DART_T8110_ERROR_ADDR_HI 0x175
 
 #define DART_T8110_PROTECT 0x200
 #define DART_T8110_UNPROTECT 0x204
-- 
2.39.1

