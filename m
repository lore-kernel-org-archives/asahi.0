Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E9DD293
	for <asahi@lists.linux.dev>; Mon, 30 Oct 2023 12:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="SBUxUMcU"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-66d0ea3e5b8so30073146d6.0
        for <asahi@lists.linux.dev>; Mon, 30 Oct 2023 05:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1698669505; x=1699274305; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PnuIYwmSwa+S4XlLT3QvUcDtJ9g3YgN2fZ+LLWa8C7o=;
        b=SBUxUMcUx4IAM2qTrLuBwSX09PIHi5aiy/K0UW8epPXDOFu7FlcG0Y7ObFoOcYSkmL
         5uJDYhYM8+a2NWqGtCIc4jCNN84Pygj4biu0j1xl/NDpEHXmFNVXUvtx2GRfFP9B/cMx
         geJIHs9dy8XHm6Az0yGN1GL5t8vhQ2+CZ2D9nW+aCyGiD7tQT9+IMhuHqWNpwnB895Hv
         eqjmeawiq5zYYEpxSjky/A9H4smDlMA+tsepAM/6RCPTo9QmxXetuEGsw4vg8NUyiZxO
         BjocYcteowh/c4rXwO275Y2m0GqE2ogD1GMaAJIFw1Sww/1wACuxpNwg9ZE9j+2Lo6QY
         KlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698669505; x=1699274305;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PnuIYwmSwa+S4XlLT3QvUcDtJ9g3YgN2fZ+LLWa8C7o=;
        b=tMgkQrebnNIgyOTeqL4Zc+Mhcec0cx7RMQMTgO9yzCVpYm21t/fVeX7Q0h4qtaUTnm
         qnzoscvEIlGzndhKDRoKIOi60PIRZVq8qT+qtwY+dKWTB8sZH2cit0m4MllboyklZA4j
         jvKUFL4Xtm8nGN6+R8NP0rtzlwL1e4x3OpaCeezPDLg3TmOCGy6Nq1p2O4a7eJ3/SdmN
         +yxhmNCYzl958WPb1T6l3rOwKcIiFul/HhO9hljM4YVP+cOelmL1FZyICF3L65adxcA4
         j0l8CmGTaiLQ/TX745EANQvjErFUvL4f2w64noOdYjbqV7HanuiP6ppxGPi1bjlzYd+p
         2ZSQ==
X-Gm-Message-State: AOJu0Yym/yCFEwvVGrl7QK4fr0wkB3ojEmD+5j/pecHaE1AHeHGI3gfr
	5/wt6AGzXBOjGHoIIuNDrtLFaw==
X-Google-Smtp-Source: AGHT+IFzZsEpO/RvvLS1iMDezad+WvzdwmrIgbedQy9A5of3lpQHjn7moFPfQR8WitI3jcfQDCqOxQ==
X-Received: by 2002:a05:6214:2a87:b0:66d:138f:95df with SMTP id jr7-20020a0562142a8700b0066d138f95dfmr12128949qvb.56.1698669504669;
        Mon, 30 Oct 2023 05:38:24 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-26-201.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.26.201])
        by smtp.gmail.com with ESMTPSA id es16-20020a056214193000b0065b0554ae78sm3321400qvb.100.2023.10.30.05.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 05:38:24 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qxRXD-006etA-C1;
	Mon, 30 Oct 2023 09:38:23 -0300
Date: Mon, 30 Oct 2023 09:38:23 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Janne Grunau <j@jannau.net>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] iommu/dart: Fix return code in
 apple_dart_domain_alloc_paging()
Message-ID: <20231030123823.GD691768@ziepe.ca>
References: <b85e0715-3224-4f45-ad6b-ebb9f08c015d@moroto.mountain>
 <20231030115650.GC691768@ziepe.ca>
 <d42a8cb4-dd0d-407e-8659-915ca821e1f6@kadam.mountain>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d42a8cb4-dd0d-407e-8659-915ca821e1f6@kadam.mountain>

On Mon, Oct 30, 2023 at 03:00:56PM +0300, Dan Carpenter wrote:
> On Mon, Oct 30, 2023 at 08:56:50AM -0300, Jason Gunthorpe wrote:
> > On Mon, Oct 30, 2023 at 12:03:12PM +0300, Dan Carpenter wrote:
> > > The apple_dart_domain_alloc_paging() function is supposed to return NULL
> > > on error.  Returning an error pointer will lead to an Oops in
> > > __iommu_domain_alloc().
> > > 
> > > Fixes: 482feb5c6492 ("iommu/dart: Call apple_dart_finalize_domain() as part of alloc_paging()")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > ---
> > >  drivers/iommu/apple-dart.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> > 
> > Really need to fix this so the function does return ERR_PTR..
> 
> It's called as a function pointer.  Changing that will create a
> backporting hazard unless we rename the pointer or something.

You can make that argument about almost any change in the kernel..

IMHO we needed an annotation like __user/__iomem/etc to indicate
ERR_PTR so at least there is some hope of trivially finding it.

Jason
