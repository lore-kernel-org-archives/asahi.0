Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E383B8593B
	for <asahi@lists.linux.dev>; Wed,  7 Feb 2024 17:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707327680; cv=none; b=SxE3QsSC3/KNLFUmlYgjPCwPp1hMcHQ2mBWB+7qIPE48xYQzByt7ck8ieRNb5H7ZXultvaftR78UNa9eF6qn7dKyINwZD3Bxfb091DTwtCRn2jrA701UEjj9jykm/h8CAJ9+tHibyzJ7DyFUy0XypHf0rdIlL1DHWIrAkha2PiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707327680; c=relaxed/simple;
	bh=ZrKDwv7ntd6MUNEgXFkjIjsD/7n0h2NtbCDhpUVACm4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=THqOMp6U6gNF210HBH9ZlVWO94N6vYOWaPBcHabw3iuOhrRp2peR0HWfwQ8jj/02dbLPdobSMBzuuHmgTtF7m2kh+HKcvdyoWEfrMd2QA4V34RoaVzKRKpYr+a9vEMDirZAcV7Bmxvpva98KwGYrHUZuGiMqiKfqFS5pHfRV498=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soleen.com; spf=none smtp.mailfrom=soleen.com; dkim=fail (0-bit key) header.d=soleen.com header.i=@soleen.com header.b=MVGrUsmF reason="key not found in DNS"; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=soleen.com header.i=@soleen.com header.b="MVGrUsmF"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-783eb452e01so5231585a.1
        for <asahi@lists.linux.dev>; Wed, 07 Feb 2024 09:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1707327676; x=1707932476; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wfVh0oPEahUZvzrBZ9xf+/i5rxN2+U5mi493evzNcuQ=;
        b=MVGrUsmFzEa1zOG5iOvip4WEilMnxnTnbYro2PY9XQ7WBazxydWQqmK/U4Y/9MHdVO
         IJSi7GVGDQZRiXEfcZzG/OIrouUA6YyQLA6DbCImCwkj7W1WvTBLtVcJIuC4g70J0YfU
         e4+1Aij6m0xh8UdUxk/D9qNXvY7u1ygsCx7dHwsVRRGGSgfQgch178Z1DW+fjJE2kNJF
         pPt/q1yhie22rcs7n0YQa2hYkmW8PeVIVLhzFdvFeDQ6nzwAYhMRtYZcC+PW2vMNd7ZP
         qrhBdUkZoKWAAmfBr1mqbf0DxDLpQUSrGUCjS56UNQK3D02VvED4faRgt+LpNUdR0lCf
         vXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707327676; x=1707932476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wfVh0oPEahUZvzrBZ9xf+/i5rxN2+U5mi493evzNcuQ=;
        b=huLUgVjwsNyIbRNVvlc7TCl7I9/hQXrxcjYaEauteAp7F76EWHV2merkSE8f0vl28m
         nC7FkCYADhUpA0mc5Uf5QXYkqdo+Wzg2diixxV3Qd3ncyc9vHfyOY3PmGdux/MLFhGlT
         //aj5ZsxoPSDMErVkN7m2w/14ox8JsB9ioeEL5C4JccOpOk8AXKXWs1a75jUIoz2Bqfo
         SxMd2Bf4rqyXJtKvoxcz4i05Rm3nfP2IvqyezGMFYZ9GtcFzosaF+5VDdi17JenTmnik
         8ScWRgVuKoDQMj3Cdi0TDsjOjDJxXpvrPcudlIh4AjyPPlOrasCtJkH1HegFVl3XAEps
         aw7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUrptc6vnffqvHbKOBYnAmGgrDdF0iKRSx7CULXhdsmA8XU6vEOGVfPXrZTr4Yhxs2PhF9pDXv5axA7A6jbuIlUdBRJ5Ko=
X-Gm-Message-State: AOJu0YyN7NEO2lb0ojFL8sCHZQuecuB8dT7N0tFxo+HI5jnfT6Z1kH1u
	f8Qjtfj8fjnB0TvxwuoBeiJP2aiSdepzsQcbjp4N/KvdoZ1ZJb33WYHAcuk912I=
X-Google-Smtp-Source: AGHT+IEYw/oN3ccwsdwQFv2jRl2FvfT6B6nkPyMXJGG4ZBtYYD02TxlhcFEf6LXGuUiTE1mdL7ys/w==
X-Received: by 2002:a05:620a:2191:b0:785:a0fd:26c with SMTP id g17-20020a05620a219100b00785a0fd026cmr230165qka.36.1707327676289;
        Wed, 07 Feb 2024 09:41:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVXXSvczqKSyNm43JX5/tzjrxJXXar4QNtSDMhqU2+N72ON7heLA3zeXwN1sPD8iNP1Ua3viph4VSvSaigEeBs+4AB16FSQoHG3nR2ARKpJ6Z6eqdW6RZ/Dx5gVULGUeNiZJs2bmFqEcerVJIR/k77MlP0P0vb2m946zLj3/Q+KKlAaf+S7e+fUwZ84VZBAoIKR3CAFqaEvfgSVeHvJDNlreq4nUF0bRbOmv+CTFkg6/34uIuhSrA1PfBuZS9NDpUrr7qD3iWEui7dadf1quYchsrHJm7Et0JCMwNo5G7j88fU0jnlH2f3xq6IprlzgVbwgVawD+F0w5yMxaKe31AMQCKLJDPkDnYGtso1cb3VcL9cwUUlE8zHdYGqDtmL4A3bNsEc+cHEYWlAikX+B5mca++p25pQQybiJgq5+xuv6MXn3SJAmkIrOedVuJQIGWWxUXhVKrHyW1vTefklNntllKnJ8kE94Q2QK6FQ7R5hbS7ZM+HnDQX4b8eU46NlXSODa0H04teVLWvmP9gtCad8fAMZqMrrR3WQ/TUTBO30OMZ3zF+k4DWHX9SXVVrt9nrRNprKLO9Z7u8dKJ7+GXLD3DWJoiQaPYhHwdfNS0J/6cWv0Cmhs4GVlXWvAwjKLkG6R+bd+Ys0jdTkMgWDuLUuIUZJXKs8G2j8ytxUN9ONqBDbvEtiqVgUbhqFtknANpqKIjtrOa5afMZB6vaVlSXSz7JIia1p4WLqYg76UjL26wPfE+YNYaoqoyla+/NM5tlqcG+Qv9qaBsUT0PrZlag/9hIB7OlkLkbIDeffOo1piVsMnuWQ2Fb0sIE5M3tMlSV4LOUvlm6MMoqTigjLdoiMPCpo3eSydh5ThPXQcdvauDs1iooRO19ROz7wfGQiGkN433FzI8pQIGwB/Y28HAGJ2Z/e4dzgMME9mxSg6/v6VWpPcpYfrpADNnE1HG5m17F3Z9/
 UwJNwsxkn3pX7eMFA/DZyCzVr6lCgR+6OWns+GLU2SxZUdU0xVvSfjQhkSCVyzsqGTBKOAl46Qb5IR6uUP95vhYRyZh/sazLK1hp6TuSuGwGRiqCEq3kw5QrDYNAeSeryfxDajztI6S9jiXf9iOAeZ2u7rYaFZy50vg9l9iMXxf9hkJco867096dyje+DKkhn4WuJV5pUKUPg0jyDyOEh9YkiepVTHVZe+2/e6eXAACmAIqtLN291FEcNxHSFVc9VoRJotuYKq+P9z10tdNS+gaUUxRVwOH60jk5JdNq6iqwWPhfb90cWSdU5X/SASbKNAWT2TUn7fb+cqTPdJqZU5F61vo4y6m5LgEiIZFuY8ciAZqGeXCJ4KoNYNcloHQYen9MDAb9yvPdMPytSIThAuivd6JL/t1mQ68T7pjNDeJUQ62Bl8xjmJOCkONVL1QfNYzX6G15djtpimeWhgGmyglvGJqsqIKWUnJObt/eRFoB8y
Received: from soleen.c.googlers.com.com (249.240.85.34.bc.googleusercontent.com. [34.85.240.249])
        by smtp.gmail.com with ESMTPSA id e10-20020a37db0a000000b007854018044bsm696310qki.134.2024.02.07.09.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 09:41:15 -0800 (PST)
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
Subject: [PATCH v4 07/10] iommu/sun50i: use page allocation function provided by iommu-pages.h
Date: Wed,  7 Feb 2024 17:40:59 +0000
Message-ID: <20240207174102.1486130-8-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.43.0.594.gd9cf4e227d-goog
In-Reply-To: <20240207174102.1486130-1-pasha.tatashin@soleen.com>
References: <20240207174102.1486130-1-pasha.tatashin@soleen.com>
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
2.43.0.594.gd9cf4e227d-goog

