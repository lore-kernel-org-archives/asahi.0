Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1E03D63
	for <asahi@lists.linux.dev>; Fri, 23 Sep 2022 12:36:10 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id w28so21191edi.7
        for <asahi@lists.linux.dev>; Fri, 23 Sep 2022 05:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=d/yUuWWWXl5ESaI6tj/y3SDZ6qLNIH1D9CJraoESCUk=;
        b=mZYMTlY53jZxyCxt6S2/Cc47i7NGZuMBASDB9iBcHIAvNm32EHSV1NTrvFPVpNSviw
         xI1fxz1kruoVzVIvbpOgNfpWmydt3Fm9/jaCI55EhT8qEtcLsPwxpaZTiZpFhGcF7L0H
         u4pB8X9WX2re7Qk28suZ5vv9Xncb1IwpISGsWIGoO3TRSho5uzwHxlra5Ctqb7O4B823
         KOeePgO2i6gDO3JC6LX/H3TJXIWTrTVM1c4ZIBdEpnBQoI7CqEup39qRH4cdWe2IJyI6
         OsuT5xGnNMuQUCxGtV2eKjMJI3Afel/UbAu9n6jtd9oUPePa0ctmoPmcLf3B9ecw2tiG
         XqDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=d/yUuWWWXl5ESaI6tj/y3SDZ6qLNIH1D9CJraoESCUk=;
        b=R7wiZKkw+vLDFpS3s3oyaEDJYNkH2apEw/8C+ttf8j4SiBSn0iHMSlYtqJ9L8pPI/g
         8xpfz2jChXUPiXwZ3dnpm+AlhfSY6FDI6RaPEUe9vYwxih3ctbSwLV4KEEgAcLIukoay
         fUsOxby6eYyiQsmaSrq5+i7V32R0FfO2SFahigaXGr8AIg2UZsCZbJbLnRe0CEG+nxCA
         tn/xsgrZrP4HfmhgE6lqDKr1c5VEqqXVhtAh7LxMoegZZHV60KWL5/plwxVGbuJmcPPW
         DK4aEz5o4TbIp2HiIy4cTZvWk8vdqUMLgTFOlGO4000OhtsAmWCySZEX2mHKI3qWllDR
         BOUQ==
X-Gm-Message-State: ACrzQf2hd4NmNzUH2Ywa5fZKgi0E/3Js14RbpBdMTwxxHX3dWPULhheW
	xgzw/tak2GpBiDpB+/BPR5E=
X-Google-Smtp-Source: AMsMyM4NSEv1rO6MuysjMbNIPIJCT28Pneqsw81YD2o382aJzYAXQ6uJFboa6Xb+hC1QGpITgFcvZg==
X-Received: by 2002:a05:6402:11c8:b0:451:7220:6343 with SMTP id j8-20020a05640211c800b0045172206343mr8052630edw.184.1663936569926;
        Fri, 23 Sep 2022 05:36:09 -0700 (PDT)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id s18-20020a05640217d200b00451319a43dasm5511848edy.2.2022.09.23.05.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 05:36:08 -0700 (PDT)
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
Subject: [PATCH v9 3/5] iommu: dma: Use of_iommu_get_resv_regions()
Date: Fri, 23 Sep 2022 14:35:55 +0200
Message-Id: <20220923123557.866972-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923123557.866972-1-thierry.reding@gmail.com>
References: <20220923123557.866972-1-thierry.reding@gmail.com>
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
index 9297b741f5e8..709b05d3aad2 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -23,6 +23,7 @@
 #include <linux/memremap.h>
 #include <linux/mm.h>
 #include <linux/mutex.h>
+#include <linux/of_iommu.h>
 #include <linux/pci.h>
 #include <linux/scatterlist.h>
 #include <linux/spinlock.h>
@@ -391,6 +392,8 @@ void iommu_dma_get_resv_regions(struct device *dev, struct list_head *list)
 	if (!is_of_node(dev_iommu_fwspec_get(dev)->iommu_fwnode))
 		iort_iommu_get_resv_regions(dev, list);
 
+	if (dev->of_node)
+		of_iommu_get_resv_regions(dev, list);
 }
 EXPORT_SYMBOL(iommu_dma_get_resv_regions);
 
-- 
2.37.3

