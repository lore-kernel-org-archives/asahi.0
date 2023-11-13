Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866DE241F5
	for <asahi@lists.linux.dev>; Mon, 13 Nov 2023 20:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DWZbu5pJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699905970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
	b=DWZbu5pJZU2A4tZlyCIf7IaBcpqY9elGeXGkvs1hQ5P4y7hY11zqETCGwALcrfoZlOW4M8
	TkpUk58AT7pBYpZTBaRL6zC0qmDaS70zFUjAL9/RKcK8Jv7ZJhPKbM/q/1JeUKhawc0WDY
	a2aPuJPXJfb8z4mK5bDkdKc1U0VKspg=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-60-sZdaW17xOdi1Rq1WfLBaSQ-1; Mon, 13 Nov 2023 15:06:07 -0500
X-MC-Unique: sZdaW17xOdi1Rq1WfLBaSQ-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-66d0b251a6aso59225766d6.2
        for <asahi@lists.linux.dev>; Mon, 13 Nov 2023 12:06:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699905966; x=1700510766;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
        b=AlnL4weRCJ0vX0Qrw4yQJN4O+jvKhPJYDPov/qswMu90lzMh7Oe4CZDwbwnamyN/hg
         60506NZLz8KlSdl3uCto08FDWUNksbOEMXpiYG85B1BLqAfM4TMFu5udSWoLgKOQDYXB
         5JifvRIFJg4Sw+32u+fmCFAkbErnh4IsR7Pw7K/TeBWCqZt8sExt1kZxY1uoQ33mhK6E
         gDtUbnxJXvcZIznxkV4C3dWDJc9+giFTtXwfojAI3VGWlM7cAhclAFdhrp9gMGnkp9am
         cxuYV5ZC41/FkzyPjJhmwPierxsSqkWDAohVyBSV6wk7R+7KtqlrXo0kN2Sjdr7WthhA
         WsZg==
X-Gm-Message-State: AOJu0YwDf/IhMaf7GoHE3Hz6miL5+jk6vKMmcP2RYugtjpno/0z+Eg2m
	NL95/oxgC2JjBxKPcGd7Qgg1qu3slpQKPZ3Mya+naHa10cYg9Vc9sMSl6qf7+/YMcBk90E0l1mG
	bdL+OnL6vonYJPSo=
X-Received: by 2002:ad4:53c6:0:b0:63f:80a0:4eea with SMTP id k6-20020ad453c6000000b0063f80a04eeamr283842qvv.24.1699905966594;
        Mon, 13 Nov 2023 12:06:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHU546dToL/RnbvSEEgGYhgfAOuTUeuUj6W3IfV3UEMZ3+1fSCYuM0AW5xrguKdlx+xfhHm1A==
X-Received: by 2002:ad4:53c6:0:b0:63f:80a0:4eea with SMTP id k6-20020ad453c6000000b0063f80a04eeamr283817qvv.24.1699905966425;
        Mon, 13 Nov 2023 12:06:06 -0800 (PST)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id q8-20020a0ce208000000b00647386a3234sm2299097qvl.85.2023.11.13.12.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 12:06:06 -0800 (PST)
Date: Mon, 13 Nov 2023 13:06:04 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: acpica-devel@lists.linuxfoundation.org, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev, 
	Lu Baolu <baolu.lu@linux.intel.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Dexuan Cui <decui@microsoft.com>, devicetree@vger.kernel.org, 
	David Woodhouse <dwmw2@infradead.org>, Frank Rowand <frowand.list@gmail.com>, 
	Hanjun Guo <guohanjun@huawei.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Joerg Roedel <joro@8bytes.org>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-snps-arc@lists.infradead.org, linux-tegra@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Hector Martin <marcan@marcan.st>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Robert Moore <robert.moore@intel.com>, 
	Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, 
	Sven Peter <sven@svenpeter.dev>, Thierry Reding <thierry.reding@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Krishna Reddy <vdumpa@nvidia.com>, 
	Vineet Gupta <vgupta@kernel.org>, virtualization@lists.linux-foundation.org, 
	Wei Liu <wei.liu@kernel.org>, Will Deacon <will@kernel.org>, 
	Zhenhua Huang <quic_zhenhuah@quicinc.com>
Subject: Re: [PATCH RFC 13/17] iommu: Remove dev_iommu_fwspec_set()
Message-ID: <fussoe3f2shd222d2lwvcts3odhnyuvfxpgv6c3k2d4udxu3uv@db53jszpgq7v>
References: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
 <13-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <13-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

