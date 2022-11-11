Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFE524F38
	for <asahi@lists.linux.dev>; Fri, 11 Nov 2022 16:18:20 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id l14so7094032wrw.2
        for <asahi@lists.linux.dev>; Fri, 11 Nov 2022 08:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HuoiIm8f1+pLkMCMfNs8Z4K3LzZnaZWtse5hncoBXug=;
        b=M52kVvCdx0HRD9z9mO1F8e0fzsb2XcgwgybCoobS1hQT8sGGISqPnVCB3+/jzIwjbM
         IcmfSIghOi9oaXPVGtN4FLLVY6yX9AYrfidV5karpgA/1hVM5luKnWGH+vitU2uYCWd6
         5eAIUc99r1DKRSyiUg31h5/pevHaGtpvNrjq4uXCccfWhFGyUeBMHxBg1wEaSS15kwtQ
         Dzol1yom695mWpOamueMBlsyP2In7gaLsfsBFKiI/6d24mt+muHy8ezDFlmhwUnpWJCh
         vswyh+nwYf/nr9Wmg27iqKW1iSuHN8yPfjtTNDldDE1hWCg4Kx68TrM+VQxAwiaLC08E
         0MhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HuoiIm8f1+pLkMCMfNs8Z4K3LzZnaZWtse5hncoBXug=;
        b=OBZFNd2Ag357Ijxc/pvgSkMJrLDlLtDdAdypdTb/LYTnjRFBB77thAVOyeKNXdmCkz
         xFGGhoKRctUdv0XPnLs9codtpZeFAvnAbTombsJT4XhkFYZMBGoXbs7ns+yEGSiD4NMa
         eAdm8+QtfUuJ/VpKosVOSKcrJjVeIFeeZNq5V8GYZs7TJvSdXDg5ojIWDxrCBGKB/N3j
         +oaCK2zvzYmHVt+frPq353/3z5UkFUP4foRe47/HND4T/aQ2An6N4VuUesxyTGzqkzq3
         G3pvMbYN0r9d0HsrVK+eyXtid95ZgT5iP+lJnBYbXScdZrQb1ws5ZCVgoUHd6uvUrWA1
         9I/Q==
X-Gm-Message-State: ANoB5pnxeQbNfHSR1QEQ/HP3STeck33hHlkSeGzk5xP9nNTHUayZ2NhE
	VusXaE1GvEyZ2gdlizrnAUw=
X-Google-Smtp-Source: AA0mqf66bmefffZKNUwzzvTsT6THe6UE9dqH+ghD/eURunUNMVYZYLIi7Xzlg12UKZcN7BG/l8mFVA==
X-Received: by 2002:adf:f0c2:0:b0:236:7c38:147b with SMTP id x2-20020adff0c2000000b002367c38147bmr1621819wro.569.1668183499650;
        Fri, 11 Nov 2022 08:18:19 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id s13-20020adfea8d000000b00228d67db06esm2308030wrm.21.2022.11.11.08.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 08:18:18 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Joerg Roedel <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
	Janne Grunau <j@jannau.net>,
	Sameer Pujar <spujar@nvidia.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	devicetree@vger.kernel.org,
	iommu@lists.linux-foundation.org,
	linux-tegra@vger.kernel.org,
	asahi@lists.linux.dev,
	Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v11 5/5] iommu: dma: Use of_iommu_get_resv_regions()
Date: Fri, 11 Nov 2022 17:18:06 +0100
Message-Id: <20221111161806.630527-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221111161806.630527-1-thierry.reding@gmail.com>
References: <20221111161806.630527-1-thierry.reding@gmail.com>
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
2.38.1

