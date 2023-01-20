Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2EC3C3A
	for <asahi@lists.linux.dev>; Fri, 20 Jan 2023 17:42:57 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id az20so15863101ejc.1
        for <asahi@lists.linux.dev>; Fri, 20 Jan 2023 09:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2xF3f5wHV+S35suHnmllkaENFgAezZr/q4RI61G5lis=;
        b=EQMVF3SDDdX8L3plLIxJLOmmOOyQZdzuysc9Mj8mrNHfnj3Qpz+ClJTrtYqQd8Li69
         sfif4PpYEZVLcbjNTlOATImOIFno0tORUeLSPypZ5u4yunq4sngIJGOx+j3D2f8lC9KI
         FJoaOgmrLUtQ+T9oQWgfvm5d9RHdi7w3yYDb040v9TWzXFStfLsSghTZEVSZxP182irV
         4nbrq7ND33vaHu/fjY43/n+UAFndp6g18Yuo4FuB2/r7Q2wNb+CZdpCMR5TtvQLcJCw6
         Qolm6Kq/g3DtQVqY2vSFVGxKE8s/W+J+KscordVfuFq/c2yocgzPT3XCIJPAu2veK74Q
         kpvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2xF3f5wHV+S35suHnmllkaENFgAezZr/q4RI61G5lis=;
        b=7O15Nzg5FQcH5TZwo94wSjMYH2CCzKD1wfD7crpob5Y2eC4Ucj5rcjopzEL2nE5CHl
         6tE02tB06Tljtlkpd4J4PS+P0ASF/scqEIySmi6/v1iUhx6zU7hD8S8uuJ/bP5w0JSJf
         CXMzJIVCBgvSic0XOh8Lg/xIyRoPnEmnUn5n2CKdHX22Bj7bBLWWFfSrxjzBdgYGtKgt
         tjF60ZPjSCVG/LZWMnTAKiKwKnTQcqbSxQyRsyRVyBrn/3kpm7nhsQiW22xUGz0akmHx
         4CBisP9SyUWcifWsTVG6Djc4tezl9F+7WhDbSwmc0crBGSRX+m5ekp1Rq6n68c6xp8KF
         MGCw==
X-Gm-Message-State: AFqh2kped/lKCrTQnGmEI8g6x/2hOA/gL4VqMOTTbIjmI8M0iZW8H/iX
	ludBmrwc0zxIqlu4ms12cf4=
X-Google-Smtp-Source: AMrXdXvfVXAglNQb1KVGn5/i/z1k7cQBmEP5ph4w5wk4z3IgOwcwuI1+Hftag/jdccDJ78nsonNdtQ==
X-Received: by 2002:a17:906:4557:b0:84d:3a95:cdf5 with SMTP id s23-20020a170906455700b0084d3a95cdf5mr15136751ejq.10.1674236576177;
        Fri, 20 Jan 2023 09:42:56 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id u1-20020a1709061da100b0086b7ffb3b92sm9936014ejh.205.2023.01.20.09.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 09:42:55 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Joerg Roedel <joro@8bytes.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Will Deacon <will@kernel.org>,
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
Subject: [PATCH v13 4/4] iommu: dma: Use of_iommu_get_resv_regions()
Date: Fri, 20 Jan 2023 18:42:51 +0100
Message-Id: <20230120174251.4004100-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120174251.4004100-1-thierry.reding@gmail.com>
References: <20230120174251.4004100-1-thierry.reding@gmail.com>
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
Acked-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/iommu/dma-iommu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index f798c44e0903..8e023f032b76 100644
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
2.39.0

