Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C93158D72
	for <asahi@lists.linux.dev>; Thu, 22 Feb 2024 17:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708623605; cv=none; b=r3tEa40TwbuK7bCYzGJpCBHppn200O90C+FpgVsOqpeS3ImJunRconRtAuOwK5EY9SeTcjAU7bjbLlcF1HWS+hyJAVd3262VpFgoS7NtiiW4ZoV6WotbgnATZiY8aMaxraBWxqMWrVkDjS7Zq9h3SW4cKloNxyrDr/+u2utdyhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708623605; c=relaxed/simple;
	bh=s2nvM2JSjpFzXc4jGY+I9yEyb0A/qzUAKQj+oJecsuI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dRS6Q9sp3G9SSpUEvASYQtw7h+E7SwRxghQhDJ8c8hfGQyUPCtTpfFMyueK/Qr/3jhGoRb9tYt2grH4Dfm6unaAgVX6Y41LZeYIBI9KL8iB6GINiiWLi2N9CtGHbLsXw+O/JD/fngIAd48AncDAdE4QDc76APzGbRdFmtieN2m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=ueZxYEqh; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="ueZxYEqh"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-607bfa4c913so20623267b3.3
        for <asahi@lists.linux.dev>; Thu, 22 Feb 2024 09:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1708623596; x=1709228396; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SZ2pQJ9+dxF//EaiCt/uq+OdRpwnCyd+9hrUk8R734o=;
        b=ueZxYEqh36LQ2BwZ68K6Kx6wJ+LkY3uABYLIQsL/wGr7FFH87Dv4UZrHMQS/Zt/1VJ
         CAE+LCBZtF5LurgB/M59TIyppGGLCJBqSOhW+EfMHEEDhO6o5KMzK49WrZ+kKSmdLNJX
         9ggrDXQqEpDp/JspYHiGbo8R3SQ3ASEGb6iI5BTrZlDIy4K4PA/bboU78LJIf3jw1TsD
         HcITzD2nJCb5iHHg9S+jvy2D2LD9CmWXpSgA2AJco31fD+d3uZga7xtlLBZpzAmtsX8n
         FAV0m7nJYM5rPQpspzLQpr3lTEusZCQc2LVGYGSiutQYG/zpDZWqIf7++J4djJ79PNpM
         Y7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708623596; x=1709228396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SZ2pQJ9+dxF//EaiCt/uq+OdRpwnCyd+9hrUk8R734o=;
        b=X3XLq/wfdyLUzfKdoNsxY3HZLvDJaWYY3PszRw7WBHa1WUrNjOAG7nM2+PcIFVY/O0
         ca0kasdJPOVBf9DGxhpEuEKSYBDTTZxw50DBIfpCBbn/2E6GoV4agjD28faI9MC050xC
         IrDKXDKxrOpDAizAO6VaAz+3XgV2TNvb8EEmsPYBQRmr4MSfOYUQpK/AI8/ON+wILZch
         LrWHw2dgxKLPhNidXfhzhqJ3ZJwjJ4pV1NObgX8j0J7ZYLfN6nNqd5xHNjlGx1rctEvZ
         Mu2yC+Kzd6bG4QVhjgLyacn2D9xkpteUgpLLVMk+P3bluBfdd4DqygKLGKrvwI/P/Xhx
         1yuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtDNMrCtZ1TRFerEGSaHOczM43+D271s5QUsM8hhRfB3cn9PL400ieFxHEr2L5GrGsWQ6YZ/ekv5Az0rXynaFrHD5MntQ=
X-Gm-Message-State: AOJu0Yw40sctiAgx6qk+DmERmFpqhI/hQGksDhKOJH/24NGJgy0E3PrI
	UswoLD7XnJoBAZJJKVLQL95zAohSuUQ8/ay3ihtUdTMqP3k4SEcIFWGUYL5CmA4=
X-Google-Smtp-Source: AGHT+IEtAUUqy5uqw2b6AFNUjnG1318TVskHRq83YxSHDfvItzdqlBQeiT8forYQaEVyJnoFBVJVWg==
X-Received: by 2002:a81:431a:0:b0:607:ef06:eb8 with SMTP id q26-20020a81431a000000b00607ef060eb8mr20801514ywa.40.1708623595945;
        Thu, 22 Feb 2024 09:39:55 -0800 (PST)
Received: from soleen.c.googlers.com.com (249.240.85.34.bc.googleusercontent.com. [34.85.240.249])
        by smtp.gmail.com with ESMTPSA id f17-20020ac86ed1000000b0042e5ab6f24fsm259682qtv.7.2024.02.22.09.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 09:39:55 -0800 (PST)
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
Subject: [PATCH v5 11/11] iommu: account IOMMU allocated memory
Date: Thu, 22 Feb 2024 17:39:37 +0000
Message-ID: <20240222173942.1481394-12-pasha.tatashin@soleen.com>
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

In order to be able to limit the amount of memory that is allocated
by IOMMU subsystem, the memory must be accounted.

Account IOMMU as part of the secondary pagetables as it was discussed
at LPC.

The value of SecPageTables now contains mmeory allocation by IOMMU
and KVM.

There is a difference between GFP_ACCOUNT and what NR_IOMMU_PAGES shows.
GFP_ACCOUNT is set only where it makes sense to charge to user
processes, i.e. IOMMU Page Tables, but there more IOMMU shared data
that should not really be charged to a specific process.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Acked-by: David Rientjes <rientjes@google.com>
Tested-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/admin-guide/cgroup-v2.rst | 2 +-
 Documentation/filesystems/proc.rst      | 4 ++--
 drivers/iommu/iommu-pages.h             | 2 ++
 include/linux/mmzone.h                  | 2 +-
 4 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 17e6e9565156..15f80fea8df7 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -1432,7 +1432,7 @@ PAGE_SIZE multiple when read back.
 	  sec_pagetables
 		Amount of memory allocated for secondary page tables,
 		this currently includes KVM mmu allocations on x86
-		and arm64.
+		and arm64 and IOMMU page tables.
 
 	  percpu (npn)
 		Amount of memory used for storing per-cpu kernel
diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
index 104c6d047d9b..604b2dccdc5a 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -1110,8 +1110,8 @@ KernelStack
 PageTables
               Memory consumed by userspace page tables
 SecPageTables
-              Memory consumed by secondary page tables, this currently
-              currently includes KVM mmu allocations on x86 and arm64.
+              Memory consumed by secondary page tables, this currently includes
+              KVM mmu and IOMMU allocations on x86 and arm64.
 NFS_Unstable
               Always zero. Previous counted pages which had been written to
               the server, but has not been committed to stable storage.
diff --git a/drivers/iommu/iommu-pages.h b/drivers/iommu/iommu-pages.h
index daac2da00e40..6df286931907 100644
--- a/drivers/iommu/iommu-pages.h
+++ b/drivers/iommu/iommu-pages.h
@@ -30,6 +30,7 @@ static inline void __iommu_alloc_account(struct page *page, int order)
 	const long pgcnt = 1l << order;
 
 	mod_node_page_state(page_pgdat(page), NR_IOMMU_PAGES, pgcnt);
+	mod_lruvec_page_state(page, NR_SECONDARY_PAGETABLE, pgcnt);
 }
 
 /**
@@ -42,6 +43,7 @@ static inline void __iommu_free_account(struct page *page, int order)
 	const long pgcnt = 1l << order;
 
 	mod_node_page_state(page_pgdat(page), NR_IOMMU_PAGES, -pgcnt);
+	mod_lruvec_page_state(page, NR_SECONDARY_PAGETABLE, -pgcnt);
 }
 
 /**
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index bb6bc504915a..a18edcf12d53 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -202,7 +202,7 @@ enum node_stat_item {
 	NR_KERNEL_SCS_KB,	/* measured in KiB */
 #endif
 	NR_PAGETABLE,		/* used for pagetables */
-	NR_SECONDARY_PAGETABLE, /* secondary pagetables, e.g. KVM pagetables */
+	NR_SECONDARY_PAGETABLE, /* secondary pagetables, KVM & IOMMU */
 #ifdef CONFIG_IOMMU_SUPPORT
 	NR_IOMMU_PAGES,		/* # of pages allocated by IOMMU */
 #endif
-- 
2.44.0.rc0.258.g7320e95886-goog

