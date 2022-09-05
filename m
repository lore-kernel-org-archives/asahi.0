Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C982468E
	for <asahi@lists.linux.dev>; Mon,  5 Sep 2022 17:08:46 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id se27so18237993ejb.8
        for <asahi@lists.linux.dev>; Mon, 05 Sep 2022 10:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=WgjgV6exEQAEiAyC6E25mKANsasFgoGpWzbdU8ZUP1c=;
        b=qsP4xrxwyFsC1aHjBN9OomtOEc6gHWzZzwrLVOA2rT+J3/v1Osls/cpZ3DlbRAIAIO
         /GR2lT5alv7UiXSP9+LJmqlykl4HMApITzyKSn46nRSw5E71yyPb4xWtaeXKbb3HIvJg
         5ABwTOU71KG8RcT/TLOTGjFJuVpfSwRLAyv7GnGQl/Geqb0SHES2oP7OuE9o28tnoyK/
         ZiHmqTSVBW9Vuzmr8pxFKtRe1NKcxeq8In4NXNQCjETkUkttkb+DifZoNSrBjiA/cINj
         O0/om1fp+bS921k4sVCtFOO3P3U1YUSGnNhvFJi6Szs/iUXQ06dTaCytUbKp15ta+5pc
         LX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=WgjgV6exEQAEiAyC6E25mKANsasFgoGpWzbdU8ZUP1c=;
        b=ef99POOeuMTf9lapTqIfo9AuVS/GG3a9TqgW+r+vRx4YqgL0owvfmpoUGlagFHdUKE
         SBVAg3gM8dpRHfi3smaXJD34tHE3fLos+fg2onybMGC2jrgYa7k/68CYAOTEv7fNuKd4
         towFKsnoJuF97O98x3bspRpcN69RxcXvL/5DRO8E4NSJTR0O/JFklzZjP1RWvhy3cXKj
         OzI45oBFS6hiS4T1ytptbEIvmwa3PNZQnQ7xpQj3vIEqD5H1nk1yfB8ov/PFQSKsnKDn
         ckBYsWuDOTCGEPruKLh5BtZ6e54UgZbgCJm+rhLTRRaLSzN77RRDuaTU8gOcOoarOBh+
         HtLA==
X-Gm-Message-State: ACgBeo3nHUQ1wLsggKfvDcEyrgC+dyHK71p2PMOmRjMy7IhzD6Hg1Tqe
	a0hUDKuFdkPZleyuor/QPeI=
X-Google-Smtp-Source: AA6agR6gD6HpBH6h8rRmD/uYLRg3TsUXl3vhLS56kcvAY5q4cDsjroHjjx1d5Mqew3h2bO9QrY759w==
X-Received: by 2002:a17:907:970c:b0:741:748b:6dac with SMTP id jg12-20020a170907970c00b00741748b6dacmr27360129ejc.479.1662397724538;
        Mon, 05 Sep 2022 10:08:44 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id m14-20020a50ef0e000000b0043d5ead65a6sm6690584eds.84.2022.09.05.10.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 10:08:43 -0700 (PDT)
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
Subject: [PATCH v8 3/5] iommu: dma: Use of_iommu_get_resv_regions()
Date: Mon,  5 Sep 2022 19:08:31 +0200
Message-Id: <20220905170833.396892-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220905170833.396892-1-thierry.reding@gmail.com>
References: <20220905170833.396892-1-thierry.reding@gmail.com>
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
index 17dd683b2fce..67be1542a994 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -24,6 +24,7 @@
 #include <linux/memremap.h>
 #include <linux/mm.h>
 #include <linux/mutex.h>
+#include <linux/of_iommu.h>
 #include <linux/pci.h>
 #include <linux/scatterlist.h>
 #include <linux/spinlock.h>
@@ -390,6 +391,8 @@ void iommu_dma_get_resv_regions(struct device *dev, struct list_head *list)
 	if (!is_of_node(dev_iommu_fwspec_get(dev)->iommu_fwnode))
 		iort_iommu_get_resv_regions(dev, list);
 
+	if (dev->of_node)
+		of_iommu_get_resv_regions(dev, list);
 }
 EXPORT_SYMBOL(iommu_dma_get_resv_regions);
 
-- 
2.37.2

