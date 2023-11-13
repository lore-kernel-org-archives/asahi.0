Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2DE249EA
	for <asahi@lists.linux.dev>; Mon, 13 Nov 2023 20:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZhrbQhRZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699906489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
	b=ZhrbQhRZR1NNIm3C+HVzlzFTddOkFA1UG9qmPZhAMZeZSJKHBxrQIZIJKvq7l0nQvf96FW
	IIpTCRts0b3rpD9LvtBKuAEMlIxNc0NPR3jlLVb9os890hwmI0NZilJnpGNCSnhYMvalEL
	cHnrIWaKk1BvAjInZck82wc5atTglog=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-AZcvXWTDPYaQf5Gc1NXarg-1; Mon, 13 Nov 2023 15:14:48 -0500
X-MC-Unique: AZcvXWTDPYaQf5Gc1NXarg-1
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-5a8d9dcdd2bso100258187b3.2
        for <asahi@lists.linux.dev>; Mon, 13 Nov 2023 12:14:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699906488; x=1700511288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
        b=xLqohFTS/9tqjYDvxeoWfbe/LR6tqLPZ1VGnIjDMS3G3fTOKd0fHTny8F40/8vjWaq
         Xj9faVbo8eE0pIYesLPx4Gi2q8WYeSI2hqFnn8RVefnbgZHSplnArZP+RpAJ+T5muKIW
         RxNOGHuwzLeB7aM2p2X22wwDEZxK5hahW9wfcywd/xYvrI1OUKQBF41fsVqeqsejwHou
         1GqwCOOny8Du93H1sLzTqEYfuA2hCv0efeW2lg6HaqNWFoQtYpYA83TKCsG6lI7ORrzF
         VQbj2ZFqcph/WoP7zMqhA0zVVvLiR2Vur4TprynySCnHxmYmuuw2p2kbO7czguBxxVdW
         q7wg==
X-Gm-Message-State: AOJu0YwU9HG3qDtRp/IPWfqNpxFslzKOEEHl4itiVwdMLh3c7P3N4ScL
	jyTqLOhjOeh+EUxtl1QuqeopEmM74t1NazvW9cfWdCCOHftiSG2rWD2GI4pKdfJcKLWYXo5AL7l
	9Sotmt8TUpWd3E1I=
X-Received: by 2002:a25:5:0:b0:da0:3510:d46b with SMTP id 5-20020a250005000000b00da03510d46bmr6598086yba.52.1699906487817;
        Mon, 13 Nov 2023 12:14:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHtyhAPtrfBL5j0rs4OChIjX0J0MQ7pAdoQ6mY8g3IfqhpmTKneVz9ovn0oCERZBj6Wc4LsPQ==
X-Received: by 2002:a25:5:0:b0:da0:3510:d46b with SMTP id 5-20020a250005000000b00da03510d46bmr6598052yba.52.1699906487554;
        Mon, 13 Nov 2023 12:14:47 -0800 (PST)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id mg3-20020a056214560300b0065afcf19e23sm2297469qvb.62.2023.11.13.12.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 12:14:47 -0800 (PST)
Date: Mon, 13 Nov 2023 13:14:45 -0700
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
Subject: Re: [PATCH RFC 11/17] iommu: Hold iommu_probe_device_lock while
 calling ops->of_xlate
Message-ID: <5qix66x7f4mgnnylgy4uv2g5oeqxkwvdkrbleyxxfw3hlrhsth@fsqukzhyal6r>
References: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
 <11-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <11-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

