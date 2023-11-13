Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549D024207
	for <asahi@lists.linux.dev>; Mon, 13 Nov 2023 20:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xg7duv6l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699906320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
	b=Xg7duv6lPJlORQ/b7cIdTFxaF53Wdn6hQyuiVSIGOQvMpjUM69+07MB4afhyFNq0YdBPwp
	9up0UqctJcWoCbILnK2r3RBrNwRLLcskl9f6awYA1VI6+LIcEcZktI0ZDETzq0AbdkCc9V
	oWOs5kFi82V3EFBJ0FAexhDKDQoBXnA=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-304-hIEgVbaOM3uRYhKEzrMKEA-1; Mon, 13 Nov 2023 15:11:58 -0500
X-MC-Unique: hIEgVbaOM3uRYhKEzrMKEA-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-41cdc542b56so58305271cf.0
        for <asahi@lists.linux.dev>; Mon, 13 Nov 2023 12:11:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699906318; x=1700511118;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
        b=MeaNBcG0566URmK1E8+CRL+ad7R5yEsCqqlvAaA8g/Ef+cPUkJkdCe/Esv6C/iQtKb
         kiH54uOj6xxLuZ+oBuLH7wdUTUVsjEVXOxnsUZDau7yYfNnbcWFm5gBmZ2ZE8LCEqI2D
         uwY1RfVpMBbVDzxGmG9eCKeUqSjEeetFce8MG5DK8N4bzMwxm2fIBkQjvuUoDAu4w0Dx
         AsCK5Cxe7AvvlGVnsfo7vJb3/hapCBcx+QhT0jG5eenNM3qxPOHsort1CuTR0Y3KArLi
         8xTPnuBc7U68vdDrBDSdRXJ9rAcNCOgNIojmyMnCa0hNjHsANApCkfRMYQc6pty0WCav
         M4yw==
X-Gm-Message-State: AOJu0Yzuk2VSh35Z8aN3FUIkxnULUJTfUpvTZcHzs0gk1lB33xs+4m2n
	C6IYDfUVZbtDumdhulH/4OblePy5Jzzjq4YKqlxeqQoyab1pbKlz50FNnt0/1qtY1ncuTDlh0N8
	8JsByq67rhj2+7ac=
X-Received: by 2002:ac8:5f0c:0:b0:41c:e02c:858 with SMTP id x12-20020ac85f0c000000b0041ce02c0858mr147756qta.49.1699906318352;
        Mon, 13 Nov 2023 12:11:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFswPYZrUE+iHPpixm0usY52QHAZzAKPKkAbEgaDvDovqU3DEFNzLkKbZFJyBFwEre9EilUMA==
X-Received: by 2002:ac8:5f0c:0:b0:41c:e02c:858 with SMTP id x12-20020ac85f0c000000b0041ce02c0858mr147719qta.49.1699906318082;
        Mon, 13 Nov 2023 12:11:58 -0800 (PST)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id f19-20020ac840d3000000b0041cb8732d57sm2169319qtm.38.2023.11.13.12.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 12:11:57 -0800 (PST)
Date: Mon, 13 Nov 2023 13:11:56 -0700
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
Subject: Re: [PATCH RFC 08/17] of: Do not use dev->iommu within
 of_iommu_configure()
Message-ID: <ciuy76347ki3xb5jzyji5fbzpsm2ssvcyvfgm6q7fqbneaoj7y@v5fpadftudhm>
References: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
 <8-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <8-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

