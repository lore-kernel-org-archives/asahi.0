Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58232171CD
	for <asahi@lists.linux.dev>; Fri,  3 Nov 2023 20:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZRGVqN+f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699041903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1OzQ+mysgekhlmn5TVv8N1n5lIKYQ3IFVh9mWG/eO8g=;
	b=ZRGVqN+fwgMw34BaOkHnPZFsIgC99yzih4vWEFF2D9lo2aasRDJgjMOZH8OvcNbJDaceNl
	ubDBEbskcdWZfV68vaqnzPVmHLArRNY3DanW4jLrOZly9TAL4fpsxxyvQ6TWQTTzCqQsq0
	68Gu+MIRNzYMbj7J/E5HliF3KgBUZQk=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-rjKP-NL4NWG27EeM-D2QNg-1; Fri, 03 Nov 2023 16:04:54 -0400
X-MC-Unique: rjKP-NL4NWG27EeM-D2QNg-1
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-6d329f136f0so2401158a34.1
        for <asahi@lists.linux.dev>; Fri, 03 Nov 2023 13:04:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699041890; x=1699646690;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1OzQ+mysgekhlmn5TVv8N1n5lIKYQ3IFVh9mWG/eO8g=;
        b=EiqIKNMelEYhufUf7wwncO9mLfeAmeZU5lHr8uIVVdn0WLr5Fbb6Picd8j+3HKCLnU
         4XuyEp+ZM4t5g69VvPut2s7ijo2ZAfIQ4yMPJF64gpcfCHEX334fl0hUPmGWDICO6U9Q
         D7dI6VWdP5k4q8FUZKPXUnsG4+gokjXdXbTN0vvE6itxf1NEcmByyIAL6T/tBAuy+29N
         GuSWsOmAypRRB4L+2zShjafI6uvkDNUq1blP29q31t+CJofKq+J4OZCaMl1BwOKShaf0
         Rrce6e2UyhySLeOu3lbpCPN2/UOkfPVFWy/GAsc5CYnmInETu0zL4gTJp00VLHxN9Kxp
         06bg==
X-Gm-Message-State: AOJu0Yz8dQWLvw4xuAP0E+RkCKpRbqr1Xadn9LlJfhQGbgYH9+cfWuWA
	3zqQmoSh7asN/xZ+J8+iPEnRrmftXVA2n+2EU+SYv9krMBGzdw38X8c1dT9cyDSaKdCye1n/iR6
	30nFPYXt7tufTTPk=
X-Received: by 2002:a05:6870:1183:b0:1e9:f220:ac3b with SMTP id 3-20020a056870118300b001e9f220ac3bmr22237323oau.32.1699041889967;
        Fri, 03 Nov 2023 13:04:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLi5AqLxsbuEYljInRn+NA31jis0Cd1kvF705FHYMuK6MitH6grMLWp9GtAPMIyyR4rFG8jA==
X-Received: by 2002:a05:6870:1183:b0:1e9:f220:ac3b with SMTP id 3-20020a056870118300b001e9f220ac3bmr22237291oau.32.1699041889682;
        Fri, 03 Nov 2023 13:04:49 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id q14-20020a632a0e000000b005bd3f34b10dsm1704766pgq.24.2023.11.03.13.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 13:04:49 -0700 (PDT)
Date: Fri, 3 Nov 2023 13:04:47 -0700
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
Subject: Re: [PATCH RFC 01/17] iommu: Remove struct iommu_ops *iommu from
 arch_setup_dma_ops()
Message-ID: <zrelyki44xy2jfqse2op5jjddnejbg4zpysvdkfx6ty2ylcjzw@ynuastkbx4kp>
References: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
 <1-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <1-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline



Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

