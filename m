Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E392F56
	for <asahi@lists.linux.dev>; Tue,  5 Jul 2022 12:58:46 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id n8so15228488eda.0
        for <asahi@lists.linux.dev>; Tue, 05 Jul 2022 05:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K8sz6qEujOk4h013kpPVYfRwZBm/BZHYeZBvWv+Q0zw=;
        b=oEUGLjgUVdWwQ8k+Y2aWyvkFjYZ3FREb6j09KGl8Jx14hqcpyFxW6LE9IUy+chauBa
         pottkoAMu9N5SPumEiE1VbDjcFglEgUgHw4KTk5kkFZ06APNckDvsEX/as07RfYHxrjY
         ydbwBesiWVEr49nkouXPKAgE+3LcHXjs9E6OGOMWhb7udusNFp2uWfwu/4tF8hNgX1Hv
         rLGVWnkpyJymnmZf7aq1AcUGx0MkkWjn1YRRoYNWPsrFO1djf3UkjvKocWhEsuodP9Al
         tzNpzhT7WncOiXk+7E/3VhYWsn3jP6orS4gpnkktdt3VlZnSm1MeZc4w79wOV/Bwlljf
         MTkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K8sz6qEujOk4h013kpPVYfRwZBm/BZHYeZBvWv+Q0zw=;
        b=CVmNd/7sRr5DLMVQsA/H+8izWNtUaJB1YYkWVce4Tqwge63vOMy4W7s9ctvp+GTu8S
         9h4jXLrBoW3ibtcooDMyNYI6vnqgJoxiIilL7hR+esxXkRXsgUwUt0Df3gHr9tq9Tqx7
         KIeuJnU++/WRmuS11ra//IE1zwq0BPKnIzS2CLiRa6iFouRoWbHeSu0WUf5xNLaeQwMj
         +meJJiiZORVCSZQThIMvjU+ScLaoNIaZDsPGxVLvJgvQkmg7QHgFgKg+CLJwxKyOxP94
         /8JDV8dsCLqdihHb4A39mOtsC2Kcbn7CqUiZQ4vXVegtui0cxAEnkucZDQ7yUqTA7ZDz
         azKA==
X-Gm-Message-State: AJIora+iib9SflLqmVEEgyN6CaBQij5CELwFRsxnrY50e1GVY7BO9znA
	mn8e/DmN/FNmJB2HHCFp3qo=
X-Google-Smtp-Source: AGRyM1upns2GtVrLDYg10SyzedcRjRBfIM0zN31nsHmp+MMQ26hybeFXZC6J46sU0RG6V0NzTHIX/w==
X-Received: by 2002:a05:6402:26d6:b0:435:ba41:dbb0 with SMTP id x22-20020a05640226d600b00435ba41dbb0mr46048821edd.242.1657025924863;
        Tue, 05 Jul 2022 05:58:44 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id eg37-20020a05640228a500b0043a587eb95dsm4535515edb.5.2022.07.05.05.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 05:58:43 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Joerg Roedel <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
	Janne Grunau <j@jannau.net>,
	Sameer Pujar <spujar@nvidia.com>,
	devicetree@vger.kernel.org,
	iommu@lists.linux-foundation.org,
	linux-tegra@vger.kernel.org,
	asahi@lists.linux.dev,
	Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v6 3/5] iommu: dma: Use of_iommu_get_resv_regions()
Date: Tue,  5 Jul 2022 14:58:32 +0200
Message-Id: <20220705125834.431711-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220705125834.431711-1-thierry.reding@gmail.com>
References: <20220705125834.431711-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

For device tree nodes, use the standard of_iommu_get_resv_regions()
implementation to obtain the reserved memory regions associated with a
device.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/iommu/dma-iommu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 1910f4f1612b..84fad59bc789 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -23,6 +23,7 @@
 #include <linux/list_sort.h>
 #include <linux/mm.h>
 #include <linux/mutex.h>
+#include <linux/of_iommu.h>
 #include <linux/pci.h>
 #include <linux/scatterlist.h>
 #include <linux/spinlock.h>
@@ -389,6 +390,8 @@ void iommu_dma_get_resv_regions(struct device *dev, struct list_head *list)
 	if (!is_of_node(dev_iommu_fwspec_get(dev)->iommu_fwnode))
 		iort_iommu_msi_get_resv_regions(dev, list);
 
+	if (dev->of_node)
+		of_iommu_get_resv_regions(dev, list);
 }
 EXPORT_SYMBOL(iommu_dma_get_resv_regions);
 
-- 
2.36.1

