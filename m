Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8658312E4D
	for <asahi@lists.linux.dev>; Sat, 13 Apr 2024 00:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712967937; cv=none; b=J8uGz3GhsqXSKC7CJnF2MpitQXiug38Ib1EVpcx1H/Xigd05BqkulX8c5wLEjRtYfE3Sw47tCrg1xIqIQWLOBaaIvsiHzjA9hJswZQngvZ32fKmJprItCcCEso2b2qzlOuIxU7jdM0g2rDA85mkFE5PGEOhcVK86hq1IgWFb4iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712967937; c=relaxed/simple;
	bh=yaKp2sRaul+d8oXy8RrRaFP/wgzV01J4vQOxiwdC63U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CJhBO8MGXLdoPF3uidf+jUJPzJOKB1ICThw+C339zDFZJEK3szhBa/Xuq4R9JREu8RpLoGJgFa5q+QT4UxPDuh5vUdblKjqk/J9tiwhOzAVOvboq69U/G4yrqxf8bE0HYK1R+eOJo8LTDbFCdnO+V+2ROmydLhvk2xpOLWm9fwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=X64LsQ0D; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="X64LsQ0D"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-78d61097b43so90840485a.2
        for <asahi@lists.linux.dev>; Fri, 12 Apr 2024 17:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1712967932; x=1713572732; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GxsyMTKANsChLuxDrkmJaktgLM+pVsQuG3GqfblYy+c=;
        b=X64LsQ0Dfm4ubbkrLGWDbCMOtdDTmTLqU+UW4h7fwmIN49X9UJzaJXaaEG2TLL5oGp
         zN9fGdNssdk25Iqt4X96y84jGsUfPREeQ75x0tBQScGWhzlDsrM5gcV8yW+HPapYNisa
         cqeydC/1UPLfTQf+9X1tt6jCjfbRRrud4POYrl+MgvnXriFBbrYVAOwTlheAV3NWqVyk
         pGpX8yv0lW88ThwbpGylCTNj5Brai9abCcwHpE4tSxZ91UgwV9KgWfViooe60rh0GErs
         lBnzWD9WBU/x+q2gawWLjFvvU5RiU8zCrOlwv/7F1qtzvvIt7vVfmqwbDkEy4hSkekP7
         Fvjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712967932; x=1713572732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GxsyMTKANsChLuxDrkmJaktgLM+pVsQuG3GqfblYy+c=;
        b=kt/QVLyHqiJmksdJTUUTNiIPoHJZMgt6/5/typt/stWiJ3fAu68ZfYvl4jhlGwvpeK
         R2qKNiTdyHu2LUVKQv238Lv/rwwx0KGjvCsyM/RlJrhDin5X4uupLiLHhq/yxuf+VwBS
         8z0NQUKgko2H0xdzVDyrj3pSjTClrrehvFy120kDZ1yvJ4T73R/QDV0bHPO/+0Szbna4
         n93w0t6ADfZvkT95vZ98RDy61pbSI1dcLz8AlOvyhRsvoDFUmjpAfNSnrI7fNIJCvatl
         JxCJ05V3fjmehCL2zWmEkxs0UxoIzShc0BhVbVc9KAxMHDGlSedk5X2v8oZxW8AnQ5Vh
         K3GQ==
X-Forwarded-Encrypted: i=1; AJvYcCWidXchJ2hd5+LkX8/3R0kUhYSEVhXsY0IhlFAs6zhtVPmH8d6bDfC0XfrFLZSzV++yrPFb60enL1eiYeCOUN8j5/OAFHY=
X-Gm-Message-State: AOJu0Yy9VJMgQIDZVfcGDDWCP6V1jW7bn2/ekHnWgECXuh8ilRRr2ByY
	Atye9R2YQfU+Cm/sKntSPHNbh9t7/9jWnEJabER7LZJmvFzYF/Bfa733fZnxuwQ=
X-Google-Smtp-Source: AGHT+IEkNWXvNi+BSDc9at/eU/P3rQB2xk7v0rRabM9OChaVToo3gqnYxXYIGwdXJVnOXaB2E6eCQQ==
X-Received: by 2002:a05:620a:45a4:b0:78e:a3d3:eec1 with SMTP id bp36-20020a05620a45a400b0078ea3d3eec1mr5189213qkb.47.1712967932439;
        Fri, 12 Apr 2024 17:25:32 -0700 (PDT)
Received: from soleen.c.googlers.com.com (128.174.85.34.bc.googleusercontent.com. [34.85.174.128])
        by smtp.gmail.com with ESMTPSA id wl25-20020a05620a57d900b0078d5fece9a6sm3053490qkn.101.2024.04.12.17.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 17:25:32 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: akpm@linux-foundation.org,
	alim.akhtar@samsung.com,
	alyssa@rosenzweig.io,
	asahi@lists.linux.dev,
	baolu.lu@linux.intel.com,
	bhelgaas@google.com,
	cgroups@vger.kernel.org,
	corbet@lwn.net,
	david@redhat.com,
	dwmw2@infradead.org,
	hannes@cmpxchg.org,
	heiko@sntech.de,
	iommu@lists.linux.dev,
	jernej.skrabec@gmail.com,
	jonathanh@nvidia.com,
	joro@8bytes.org,
	krzysztof.kozlowski@linaro.org,
	linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	lizefan.x@bytedance.com,
	marcan@marcan.st,
	mhiramat@kernel.org,
	m.szyprowski@samsung.com,
	pasha.tatashin@soleen.com,
	paulmck@kernel.org,
	rdunlap@infradead.org,
	robin.murphy@arm.com,
	samuel@sholland.org,
	suravee.suthikulpanit@amd.com,
	sven@svenpeter.dev,
	thierry.reding@gmail.com,
	tj@kernel.org,
	tomas.mudrunka@gmail.com,
	vdumpa@nvidia.com,
	wens@csie.org,
	will@kernel.org,
	yu-cheng.yu@intel.com,
	rientjes@google.com,
	bagasdotme@gmail.com,
	mkoutny@suse.com
Subject: [PATCH v6 07/11] iommu/rockchip: use page allocation function provided by iommu-pages.h
Date: Sat, 13 Apr 2024 00:25:18 +0000
Message-ID: <20240413002522.1101315-8-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
In-Reply-To: <20240413002522.1101315-1-pasha.tatashin@soleen.com>
References: <20240413002522.1101315-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert iommu/rockchip-iommu.c to use the new page allocation functions
provided in iommu-pages.h.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Acked-by: David Rientjes <rientjes@google.com>
Tested-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 drivers/iommu/rockchip-iommu.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index da79d9f4cf63..4b369419b32c 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -26,6 +26,8 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 
+#include "iommu-pages.h"
+
 /** MMU register offsets */
 #define RK_MMU_DTE_ADDR		0x00	/* Directory table address */
 #define RK_MMU_STATUS		0x04
@@ -727,14 +729,14 @@ static u32 *rk_dte_get_page_table(struct rk_iommu_domain *rk_domain,
 	if (rk_dte_is_pt_valid(dte))
 		goto done;
 
-	page_table = (u32 *)get_zeroed_page(GFP_ATOMIC | rk_ops->gfp_flags);
+	page_table = iommu_alloc_page(GFP_ATOMIC | rk_ops->gfp_flags);
 	if (!page_table)
 		return ERR_PTR(-ENOMEM);
 
 	pt_dma = dma_map_single(dma_dev, page_table, SPAGE_SIZE, DMA_TO_DEVICE);
 	if (dma_mapping_error(dma_dev, pt_dma)) {
 		dev_err(dma_dev, "DMA mapping error while allocating page table\n");
-		free_page((unsigned long)page_table);
+		iommu_free_page(page_table);
 		return ERR_PTR(-ENOMEM);
 	}
 
@@ -1061,7 +1063,7 @@ static struct iommu_domain *rk_iommu_domain_alloc_paging(struct device *dev)
 	 * Each level1 (dt) and level2 (pt) table has 1024 4-byte entries.
 	 * Allocate one 4 KiB page for each table.
 	 */
-	rk_domain->dt = (u32 *)get_zeroed_page(GFP_KERNEL | rk_ops->gfp_flags);
+	rk_domain->dt = iommu_alloc_page(GFP_KERNEL | rk_ops->gfp_flags);
 	if (!rk_domain->dt)
 		goto err_free_domain;
 
@@ -1083,7 +1085,7 @@ static struct iommu_domain *rk_iommu_domain_alloc_paging(struct device *dev)
 	return &rk_domain->domain;
 
 err_free_dt:
-	free_page((unsigned long)rk_domain->dt);
+	iommu_free_page(rk_domain->dt);
 err_free_domain:
 	kfree(rk_domain);
 
@@ -1104,13 +1106,13 @@ static void rk_iommu_domain_free(struct iommu_domain *domain)
 			u32 *page_table = phys_to_virt(pt_phys);
 			dma_unmap_single(dma_dev, pt_phys,
 					 SPAGE_SIZE, DMA_TO_DEVICE);
-			free_page((unsigned long)page_table);
+			iommu_free_page(page_table);
 		}
 	}
 
 	dma_unmap_single(dma_dev, rk_domain->dt_dma,
 			 SPAGE_SIZE, DMA_TO_DEVICE);
-	free_page((unsigned long)rk_domain->dt);
+	iommu_free_page(rk_domain->dt);
 
 	kfree(rk_domain);
 }
-- 
2.44.0.683.g7961c838ac-goog

