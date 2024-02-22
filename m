Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140EF1586E8
	for <asahi@lists.linux.dev>; Thu, 22 Feb 2024 17:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708623604; cv=none; b=j2wGzAsR9eoZnymasPqRbsuSXtJcHQ9gr6kKNk6mrHcf/plbPdjXU/wCz/k6U4KrfsBXvqHGiHzTpmxJRzZ3Ir4UrXVkDi0IPpNc+ueJEYxJkWHtQYg1F2iXiToHUdrQq8yrh5om9C/z3K7Bo38Z1q2Kk9iPwPrVwzhPa1GbmZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708623604; c=relaxed/simple;
	bh=hdLpspnbEGp4kEuYunjFJ86S1uZvH9wpW0yn7Y14D/4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r75ZPOfZARiitxW4qg+JAO2px8ZxeQNNFGR7I8EeKAQiOqKAO9swE+dShiV5YR4y0kZrPcjj5h7rTANedB4FlJrY9gQsqJbDAtSn2d3TzvTQZ8kRtluTyGRbbWpm6V0K7glg5WPbx2dQUxfZOC43BWoro0cPxkS+K7fXsC29v8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=djaQ1YqT; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="djaQ1YqT"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-42e5b4a91f9so1954951cf.1
        for <asahi@lists.linux.dev>; Thu, 22 Feb 2024 09:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1708623593; x=1709228393; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZEqwPir77gZiomgrLUuNDH63tTDpLGc+7y089oTBF1I=;
        b=djaQ1YqTIGBZ6HU49g2K1iY9E26EfJCDgkCAGJ3h658PTmtsD1ZSSNGJEJm6j8eV0T
         VZcatUb7wXH5ngeI7yZrEkBfl1PFSIAplEGHAgl7t7c8ha1xKY5mFDrEjFG+z55jEn/I
         h5efwxjb6CipKm8JSpryQ3iizCNvLwFsXV+VYzR/BQMW0IwKrXy7S3x6NsG4U4GqgRcn
         g/f3PfFyxnlhHp9BI3mr4LF3Bwf9iO80J34DlcSRnGkOfARFWquBjE3RYlDQbwRkyQci
         NMNiALRv5MuGLYx+NfJ1i+QZxMw2gLyEiyQW5mLFkw0RSS2zojoDtejuPtE6ykmfuQOM
         7E4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708623593; x=1709228393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZEqwPir77gZiomgrLUuNDH63tTDpLGc+7y089oTBF1I=;
        b=u2o3gwBjocSpPFzvIAGVkhWvpqJAWPwhwdRu8PLgwJs9M9yaFZhTzKGZSCoPnflXB2
         OswjGqvU6bcpkg2t3iSJpw0TypugwtmO+QV+MP1W7fZ8V/g1RK2HUupEurkmsMsaHP4F
         KJybVtmodQEdoxBJiTpSEityJhYZHZkJ8XZH+eG9ZdyTDX6Zx/tEWRZOuABAjoeVIvAK
         cU3G1iU2WWsehcwAbvUNLWcrc9SBGs+Ihnwtt1Yp8f6xh1jJcOor31ezvvc7UwNpXKaz
         XuBQbPGJn91QCrqlmGacijUj23Wc3Zp00Sam95ZTxZ3wyXE4o141nwLKDWNckk0X0O7R
         LlZw==
X-Forwarded-Encrypted: i=1; AJvYcCXtp+3SjcahuqJ3R0b+tXo3s15ma1/cqxmQTxXgywNMXSFtzVH5dHmNtFHbqOJemqy1PAu0soPAv6Fvw8v+M/e4Sig2PPw=
X-Gm-Message-State: AOJu0Yx6H20ST3/xAsv3XYVLA+jMHkTi6Un4J+LSsHa4qejwYx2sysGh
	mW5NtFyxJOYHp/W/4pifLJnIWmq2F7DvrmPIG8Wa2P5S2w3vHaYaEbjcpVURBWU=
X-Google-Smtp-Source: AGHT+IHWgbe6ipO8HL4XSLjafpdpzGiSGfQct8NtUqWcRWqXLU3Gq7aLBUbxfLYc4BAno8BAqxzaSw==
X-Received: by 2002:a05:622a:11d0:b0:42d:feeb:64df with SMTP id n16-20020a05622a11d000b0042dfeeb64dfmr18277023qtk.36.1708623593054;
        Thu, 22 Feb 2024 09:39:53 -0800 (PST)
Received: from soleen.c.googlers.com.com (249.240.85.34.bc.googleusercontent.com. [34.85.240.249])
        by smtp.gmail.com with ESMTPSA id f17-20020ac86ed1000000b0042e5ab6f24fsm259682qtv.7.2024.02.22.09.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 09:39:52 -0800 (PST)
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
Subject: [PATCH v5 08/11] iommu/sun50i: use page allocation function provided by iommu-pages.h
Date: Thu, 22 Feb 2024 17:39:34 +0000
Message-ID: <20240222173942.1481394-9-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
In-Reply-To: <20240222173942.1481394-1-pasha.tatashin@soleen.com>
References: <20240222173942.1481394-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert iommu/sun50i-iommu.c to use the new page allocation functions
provided in iommu-pages.h.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Acked-by: David Rientjes <rientjes@google.com>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Tested-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 drivers/iommu/sun50i-iommu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
index 41484a5a399b..172ddb717eb5 100644
--- a/drivers/iommu/sun50i-iommu.c
+++ b/drivers/iommu/sun50i-iommu.c
@@ -26,6 +26,8 @@
 #include <linux/spinlock.h>
 #include <linux/types.h>
 
+#include "iommu-pages.h"
+
 #define IOMMU_RESET_REG			0x010
 #define IOMMU_RESET_RELEASE_ALL			0xffffffff
 #define IOMMU_ENABLE_REG		0x020
@@ -679,8 +681,7 @@ sun50i_iommu_domain_alloc_paging(struct device *dev)
 	if (!sun50i_domain)
 		return NULL;
 
-	sun50i_domain->dt = (u32 *)__get_free_pages(GFP_KERNEL | __GFP_ZERO,
-						    get_order(DT_SIZE));
+	sun50i_domain->dt = iommu_alloc_pages(GFP_KERNEL, get_order(DT_SIZE));
 	if (!sun50i_domain->dt)
 		goto err_free_domain;
 
@@ -702,7 +703,7 @@ static void sun50i_iommu_domain_free(struct iommu_domain *domain)
 {
 	struct sun50i_iommu_domain *sun50i_domain = to_sun50i_domain(domain);
 
-	free_pages((unsigned long)sun50i_domain->dt, get_order(DT_SIZE));
+	iommu_free_pages(sun50i_domain->dt, get_order(DT_SIZE));
 	sun50i_domain->dt = NULL;
 
 	kfree(sun50i_domain);
-- 
2.44.0.rc0.258.g7320e95886-goog

