Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75932590
	for <asahi@lists.linux.dev>; Wed,  1 Feb 2023 12:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675255547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=P5+/TE6LzKC07Kx1pXnv9JC6SnXItOhhp/p3/pfSlio=;
	b=V1fBEf6rR/I7cHMYqTiBKKul+L4Q1cVin6/w9LYtSRjtYAP803LMBVCy4zDYRQ77ZaW07e
	PrI/X7MAPJc+W0hvQlkUkRbtQTDueL0Hii+vYcTydyJ6us1qq34KxoTVY2QlAsT7rGo+P/
	4jaBs/opRLqG+NMvkiTzs7jtkVu7Dt8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-606-NyCJ38v1Mw2GvRqES9gICw-1; Wed, 01 Feb 2023 07:45:46 -0500
X-MC-Unique: NyCJ38v1Mw2GvRqES9gICw-1
Received: by mail-wm1-f69.google.com with SMTP id bd21-20020a05600c1f1500b003dc5cb10dcfso4116810wmb.9
        for <asahi@lists.linux.dev>; Wed, 01 Feb 2023 04:45:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P5+/TE6LzKC07Kx1pXnv9JC6SnXItOhhp/p3/pfSlio=;
        b=f9Aw7B2hZV1TbK2uYzIAZ6EvrfRZRJ7+YgBTIvrQsCh7fdYjtQ6V72I9WfzK+WYBto
         b+yINXKM5048q1R9bRcgxANb3VeBK/+52JWne5Fb0QNkcZtrYbXuUWKSoMJHEqyC78jO
         Yl4NZ6X3HoQAu9qneDA8Y0b0ZMgDIvqzTP57HoSpJ5OWECyisfaZhNVG6OJZI1QLPgqy
         FCKU0Y0gHxs4DKGj7uQvQE2Es638hnslkQ1eOiyQX5JExnHGLmHxlWxofEZ2xflom6qU
         XBZFPExTWyxH9fu3jQAuUfZmN2l0PEijJJxCSrWAh5CpC+gssbD09B3a1KUftE1FpBr6
         /+Mw==
X-Gm-Message-State: AO0yUKV3PXz25Nw9B0RsetR4goV/D92t1Lx8mW9MwnGamNqkqT0IcEV0
	LWDSvInlNi+87H+kPjgsJQf/SniXbtkhiPh20OaKydOhBDrAXHLa04qD/SjAlfkfGgxXlvpbWmW
	xwFLWJp2hPl/c89nCVyBHXazlPGNPhliKlbeUp+p3g60e7gLjGGdftEC1Luxm/li2Hw==
X-Received: by 2002:a05:600c:314d:b0:3dc:5bd7:62ec with SMTP id h13-20020a05600c314d00b003dc5bd762ecmr1867381wmo.32.1675255545053;
        Wed, 01 Feb 2023 04:45:45 -0800 (PST)
X-Google-Smtp-Source: AK7set8X93HL3Pr+6m4ySC12znD+8GoeAtT14ExdjxV3jscGlmPBNCPHqUqxLTGT8qb1RFXrdrgjLw==
X-Received: by 2002:a05:600c:314d:b0:3dc:5bd7:62ec with SMTP id h13-20020a05600c314d00b003dc5bd762ecmr1867352wmo.32.1675255544695;
        Wed, 01 Feb 2023 04:45:44 -0800 (PST)
Received: from localhost.localdomain ([2001:bb6:963d:9e00:7585:fe90:1658:512f])
        by smtp.gmail.com with ESMTPSA id k27-20020a05600c081b00b003de77597f16sm1626333wmp.21.2023.02.01.04.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 04:45:44 -0800 (PST)
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
Subject: [PATCH v2] iommu: dart: DART_T8110_ERROR range should be 0 to 5
Date: Wed,  1 Feb 2023 12:42:58 +0000
Message-Id: <20230201124257.7801-1-ecurtin@redhat.com>
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
Signed-off-by: Eric Curtin <ecurtin@redhat.com
---
Changes in v2: Remove DART_T8110_ERROR_ADDR_HI change
---
 drivers/iommu/apple-dart.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index 42666617803d..fd09abe8d29e 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -111,8 +111,8 @@
 
 #define DART_T8110_ERROR_MASK 0x104
 
-#define DART_T8110_ERROR_READ_FAULT BIT(4)
-#define DART_T8110_ERROR_WRITE_FAULT BIT(3)
+#define DART_T8110_ERROR_READ_FAULT BIT(5)
+#define DART_T8110_ERROR_WRITE_FAULT BIT(4)
 #define DART_T8110_ERROR_NO_PTE BIT(3)
 #define DART_T8110_ERROR_NO_PMD BIT(2)
 #define DART_T8110_ERROR_NO_PGD BIT(1)
-- 
2.39.1

