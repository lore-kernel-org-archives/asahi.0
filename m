Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD326FD6
	for <asahi@lists.linux.dev>; Thu,  3 Nov 2022 13:39:15 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id kt23so5282631ejc.7
        for <asahi@lists.linux.dev>; Thu, 03 Nov 2022 06:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HuoiIm8f1+pLkMCMfNs8Z4K3LzZnaZWtse5hncoBXug=;
        b=WOIOrTs5wDw45r6z1U4MpbhJq9ZryvRk3zOzSYUmYMec/MQxf3XmaBKYvPOrW9phMZ
         UAswei6GmqvYKULPZKvu4EC06uAQ3oUPdBDaCRnvqBxURM5H8nk3rW7ZwO9vnG+KibgH
         /kthT9vb9jS7RjOfaei8dc5/58TXTJsFwgDhJNGQ0fasmyfpK6C4NtDXrAgdEAvBNbKt
         t2AvI09T0oeHAtBBYcRli8B7NjxKYYktBKvoMLPeardsdEa7xfCz/8ReTq4U8ouZmFP2
         +CxXTIzPpF1A5apjqogM+4+goqbUNtpG4Jj2t8eAG/jProlkpbSvAbr+EnMfNxk+8l7p
         DNIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HuoiIm8f1+pLkMCMfNs8Z4K3LzZnaZWtse5hncoBXug=;
        b=bLSSKfzBn+wlRNt/dhlQzrnD9Jxkfx/8g40FVSjVsFmytMPaYpKUt4m4onuGyqzNQr
         sQde6VUI7eK5h/ksIGy3oBp4AHhMgt1tvycWcij7FfDlA/B2G6VPJCDNP662Bw4hlO9P
         If0SoXc3C05gjBwO9eBPbKiGTDfHR1THLbCii73JFfZyX3XFMg1SwHkYSdIIZUbM4Vl2
         ra2AeggbkLCP1WBcoi0Evi8Sk68ZbA3QEWORR/Zr4SH1KwS8+WUenxdgEESLaH8CLzY+
         VdP9eBOr/EnAgP+pDaz25jQqq8Q9SVmdMKdo9vzwvKO1zLJfENoRnQx7RM900ON9X+dL
         7iiQ==
X-Gm-Message-State: ACrzQf0bTUiVgioqQomlRDNI5oQzZh6NPUFRI7NcZ+8i2og0YVx+Ilpz
	2SrtXpp6Al68712T1lXd8GitOrx9ejs=
X-Google-Smtp-Source: AMsMyM515jSAgrgtrPv6W8cuyVKGjXoGniUUGUbH7rNavvWKdzFTbZakrYtH2QbWOm5oPcugOCAcuQ==
X-Received: by 2002:a17:906:fe45:b0:788:15a5:7495 with SMTP id wz5-20020a170906fe4500b0078815a57495mr29363453ejb.633.1667482753890;
        Thu, 03 Nov 2022 06:39:13 -0700 (PDT)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id x20-20020a1709064a9400b0074136cac2e7sm510618eju.81.2022.11.03.06.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 06:39:13 -0700 (PDT)
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
	devicetree@vger.kernel.org,
	iommu@lists.linux-foundation.org,
	linux-tegra@vger.kernel.org,
	asahi@lists.linux.dev,
	Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v10 5/5] iommu: dma: Use of_iommu_get_resv_regions()
Date: Thu,  3 Nov 2022 14:39:00 +0100
Message-Id: <20221103133900.1473855-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221103133900.1473855-1-thierry.reding@gmail.com>
References: <20221103133900.1473855-1-thierry.reding@gmail.com>
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

