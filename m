Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1C815696D
	for <asahi@lists.linux.dev>; Thu, 22 Feb 2024 17:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708623592; cv=none; b=ufyDqHuvk/+ODxsFC9ZCjVW2mbfthOCdHDdBZrfPevI5TsRUXYAk88cLmsavnPqKQahedVUXc9/V1cuynxlOZHEtlhUP5S1k6qOJhCsJAkFZEiE4p7v/8oZzwSSoqNOEOTJS+jvR3tUW2fZzIZ7HCG9kYAwFWqb1S8xzT3/tWAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708623592; c=relaxed/simple;
	bh=e5/EqNK9UpM0PQlRBjtqkQj6WaKZ0lxzfKw0E0tVZJ8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z8rwLDZKhQ/ls0PDgIDOBiigPhUg3TvRx2W2Dx8e4r0undyO8u97p/E9kuVQgx5DbzV+vFKjppL8NoEc8MZyYomasEIn2sSweiPJFBX/ECmCzbNW7mzH9sjpzJsoDqdmXqyvZZtTSHnFw4O5yAuoxbJS/nG/qxKFB90XXoPQjXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=ZjP2anxf; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="ZjP2anxf"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-42c7c1cb2e9so47182541cf.3
        for <asahi@lists.linux.dev>; Thu, 22 Feb 2024 09:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1708623588; x=1709228388; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WCq+3vWtONMZUCcchixRvndD69tz6ABYgm5wv9T97ic=;
        b=ZjP2anxfvHOXyBn56Cl/0RbUYDFJ2qGMc+6aBV6aJSgfVcvWsY8AvQCv/Xuqs1/u9D
         hZEGvjdhLJioSoK+186cpzLCXl0WsUY2KcojTC2fOMOYA7z/84xtKEa1E0bv4Fr17HOC
         0b/s5snQHs2GXJCgYUh3LZDh1eTwRY+EHV0hQOKuZl6JAM08j7nLQvD9FRTpWcprGqQi
         BnGzkCzEO8cX9uxA/w4/64dNHP0a7f98Hk4M1YPWyqoWEV/nRO0uK9Z9k6i4XGupJ8tQ
         Bt54yWOFLi6Pk9OBh+kZh2QsRRjmQYNRMi+kMjaGVHXnaMCIZsCtEzMvySjlNCYNfVR0
         B76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708623588; x=1709228388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WCq+3vWtONMZUCcchixRvndD69tz6ABYgm5wv9T97ic=;
        b=dQtyvKWne3Y4tjwFN6OAvTU/BlsRxzEunkXFLEmXbjrzZs4VzbLAI1Ae+8MdeQ1ZdF
         YyJ5yWEdkkaiBrx//6lErw4CZO+6mjcWEJxxbPuip+Js3t63dd5q0TwOO77KYZX2enR6
         drUX9x3S5FTgUT5+WnQEFGL1kL06uFP6rsvDDGGOpd5SY8Yy/Yc+LM7NKorfg/a1murz
         7ALJ39sC8Fm7vRj3u7oEOM7thWGj+pfEhV7/vOwwFogWUDoG9w9Gi4dBLGWmaQnHjWrL
         yWOYzVkW4Tqa9OlTnuHRr7e+vXIMasmZ283w+aOeMeQRmPV8cRF32ysMGuHxyfKZREWP
         IoRw==
X-Forwarded-Encrypted: i=1; AJvYcCWub6Vfv3M7RV+6j/4TIUvAXsINgYC7kYYmBzav1aV9Uq9ITB5jN29z9YnNnYFtOkxeu7rPqRhqvWX/rechHn+y0wPhL3c=
X-Gm-Message-State: AOJu0YzQd6V7NZwD++yrnZRMw5Uu8VS1d6Iei6/53aFlcrSQb22S1pmf
	vPqieFp+n4d6aXyBGHedl3NgKdIh+7rj0Marl1UYkQE1haNw5E04MaKvs/f17WI=
X-Google-Smtp-Source: AGHT+IHYsjufxgrQOIaZKGAlBEgAe+E77c4mX2kxpmgTPbMZQuerhv+xRzMr0weawYHNzNvAJaqSlw==
X-Received: by 2002:ac8:7e82:0:b0:42e:5791:3531 with SMTP id w2-20020ac87e82000000b0042e57913531mr1519017qtj.22.1708623587773;
        Thu, 22 Feb 2024 09:39:47 -0800 (PST)
Received: from soleen.c.googlers.com.com (249.240.85.34.bc.googleusercontent.com. [34.85.240.249])
        by smtp.gmail.com with ESMTPSA id f17-20020ac86ed1000000b0042e5ab6f24fsm259682qtv.7.2024.02.22.09.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 09:39:47 -0800 (PST)
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
Subject: [PATCH v5 02/11] iommu/dma: use iommu_put_pages_list() to releae freelist
Date: Thu, 22 Feb 2024 17:39:28 +0000
Message-ID: <20240222173942.1481394-3-pasha.tatashin@soleen.com>
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

Free the IOMMU page tables via iommu_put_pages_list(). The page tables
were allocated via iommu_alloc_* functions in architecture specific
places, but are released in dma-iommu if the freelist is gathered during
map/unmap operations into iommu_iotlb_gather data structure.

Currently, only iommu/intel that does that.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 drivers/iommu/dma-iommu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 50ccc4f1ef81..fa0c4be79f9f 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -32,6 +32,7 @@
 #include <trace/events/swiotlb.h>
 
 #include "dma-iommu.h"
+#include "iommu-pages.h"
 
 struct iommu_dma_msi_page {
 	struct list_head	list;
@@ -156,7 +157,7 @@ static void fq_ring_free_locked(struct iommu_dma_cookie *cookie, struct iova_fq
 		if (fq->entries[idx].counter >= counter)
 			break;
 
-		put_pages_list(&fq->entries[idx].freelist);
+		iommu_put_pages_list(&fq->entries[idx].freelist);
 		free_iova_fast(&cookie->iovad,
 			       fq->entries[idx].iova_pfn,
 			       fq->entries[idx].pages);
@@ -254,7 +255,7 @@ static void iommu_dma_free_fq_single(struct iova_fq *fq)
 	int idx;
 
 	fq_ring_for_each(idx, fq)
-		put_pages_list(&fq->entries[idx].freelist);
+		iommu_put_pages_list(&fq->entries[idx].freelist);
 	vfree(fq);
 }
 
@@ -267,7 +268,7 @@ static void iommu_dma_free_fq_percpu(struct iova_fq __percpu *percpu_fq)
 		struct iova_fq *fq = per_cpu_ptr(percpu_fq, cpu);
 
 		fq_ring_for_each(idx, fq)
-			put_pages_list(&fq->entries[idx].freelist);
+			iommu_put_pages_list(&fq->entries[idx].freelist);
 	}
 
 	free_percpu(percpu_fq);
-- 
2.44.0.rc0.258.g7320e95886-goog

