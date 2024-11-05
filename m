Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DEB1EABB9
	for <asahi@lists.linux.dev>; Tue,  5 Nov 2024 18:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730832159; cv=none; b=C43/RSQDqn7kFqoQgsyw4KC52yUfziQtKxaNp/EZ9TfJQoLLyD5Wy1kKDuOEuvoPFLjspfCnJ70ngLde9HWqXmJ2S1bjtQbOGYVtOXhPkjtsy+j4lMizWlGeD+Q5LvQXnRAZK9vvsdrqrspeX8VG1PUV+JUaJ18UnkDULvOCoBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730832159; c=relaxed/simple;
	bh=uRFSGSp6I5JuMM4uZmsg8At2nGyRL0YDNEodwAq8/EY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZgvctCqFTHtrZdJdLP0CT0WanYShDa+RbHzFT8bkxHtcGgQDSuZx4lSY+UhXneJ/tS0MjgiW3ydz+gIq8ZUdfK2MmyVlCvVXgxNdBK3+Bwr94nu5TDIq+Rj3SaFxPUPeVQXHDIqgiQqSakclpBH+yyTr+8+CIydA4i8LcefO26o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=FUfUrdJ+; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="FUfUrdJ+"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3a4d1633df9so19650905ab.2
        for <asahi@lists.linux.dev>; Tue, 05 Nov 2024 10:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730832156; x=1731436956; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/5k2rLKTo7KgnD4BR9+2dIjyjzlQVVkq8ThtV9wFto=;
        b=FUfUrdJ+CVFto7K1q2iYgW6S11VP5qUS93jfaAdOBWfS7QbMhBBx3oG2Z1WZ7ErKPy
         2P6OmMnkgBG/40Ugj2Njh1TPhyPsjBWKHDLryEQhYISOaGWIaT+9/71YWv+oG8gaa2Tg
         eW73KGZs1m7WzrDsTWHRdpPw0eQMb4DAJnpZo52fyeav0XfHEwvL8tKGLWl2SZ17MIC5
         Z8JHr7tGv4aZIDm9Otu53Tdc8mwEmohk5Bt/FYOft2DsSFo2zqgUH4T1lAL8j+BFVI8+
         zUVEB9T5YmgjLvM+3cgH21NsKCI+XlV0j49HzKMWnQKZysQpul7LE2XPFClupaWa6S1b
         DNdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730832156; x=1731436956;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q/5k2rLKTo7KgnD4BR9+2dIjyjzlQVVkq8ThtV9wFto=;
        b=Z8evOD0NCkLJYTaTqi5amBnVx6HhYNWVf09tK+p66R7SzJPGElz3hPOa5OPOkoaIxG
         B7tWiSTXxVkd7oN2gDKWlqywTQdz3FufTjYChMbrL7JzSWDhJIEha4N/Pa6pp2k7iJox
         0nMMuJ6/G/eOKFqIPdhosJZujCQvI8De0gORq7O7gNHuTYe2z/3GNT1ePZwxBP0IodB+
         Si7R1M2AYC9vwhltIlqpC2SNECX+CEXhuwByJExXeUTI4eX+mfbp2R7+B9zKRFOdmTS/
         aMSKeT1JDDlvR80tbpgmPumiygxYuV60kbagW5v8iPaWZ9kZIfGgDX5y/e2ckxMrrXQ+
         uZ9w==
X-Forwarded-Encrypted: i=1; AJvYcCUR8sESSFbtSHmgQnpxPfhDaIMRg3wda5OygThPXq6VGB0gBm0o1Ed7r1Uyucy5CopnUs+15A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyzWz/wcyxqjNO35I7PtGOCKT61QzuUxY/HqtbyQfQwElY/Kj9s
	l3WIORMCmes7qicriK0BoiIQl7BEOE9y0WJmctFx2x9KlQ5iyrGebCycGl3PbQl8QJlJh+n3EJF
	geco6fsAQziFKN+I1EJj1DYwEpYCxMRaJsgH8lQ==
X-Google-Smtp-Source: AGHT+IHafiE56RLycAX61PwBNuvy4TPzSnAPrcXkk0qt/3LnY4O4q/UmngQM9Vlm/dj0VEmvvCeNfFq4tqlEFF5LAvc=
X-Received: by 2002:a05:6e02:152e:b0:3a6:b445:dc9c with SMTP id
 e9e14a558f8ab-3a6b445decemr144631815ab.3.1730832155951; Tue, 05 Nov 2024
 10:42:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241104064650.799122-2-u.kleine-koenig@baylibre.com> <6b5b4f25-0f42-4f83-b6b5-82c1adbefe83@arm.com>
In-Reply-To: <6b5b4f25-0f42-4f83-b6b5-82c1adbefe83@arm.com>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Tue, 5 Nov 2024 10:42:25 -0800
Message-ID: <CAH2o1u77TViePZ2eh+FY7oQXxFAp+SEVM38ROP1uKfeMZ9E7hg@mail.gmail.com>
Subject: Re: [PATCH] iommu: Switch back to struct platform_driver::remove()
To: Robin Murphy <robin.murphy@arm.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Rob Clark <robdclark@gmail.com>, Yong Wu <yong.wu@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>, Michael Shavit <mshavit@google.com>, 
	Mostafa Saleh <smostafa@google.com>, Lu Baolu <baolu.lu@linux.intel.com>, 
	Georgi Djakov <quic_c_gdjako@quicinc.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> > diff --git a/drivers/iommu/riscv/iommu-platform.c b/drivers/iommu/riscv/iommu-platform.c
> > index da336863f152..382ba2841849 100644
> > --- a/drivers/iommu/riscv/iommu-platform.c
> > +++ b/drivers/iommu/riscv/iommu-platform.c
> > @@ -81,7 +81,7 @@ static const struct of_device_id riscv_iommu_of_match[] = {
> >
> >   static struct platform_driver riscv_iommu_platform_driver = {
> >       .probe = riscv_iommu_platform_probe,
> > -     .remove_new = riscv_iommu_platform_remove,
> > +     .remove = riscv_iommu_platform_remove,
> >       .driver = {
> >               .name = "riscv,iommu",
> >               .of_match_table = riscv_iommu_of_match,
> > diff --git a/drivers/iommu/sprd-iommu.c b/drivers/iommu/sprd-iommu.c
> > index a2f4ffe6d949..e84806eee281 100644
> > --- a/drivers/iommu/sprd-iommu.c
> > +++ b/drivers/iommu/sprd-iommu.c
> > @@ -531,7 +531,7 @@ static struct platform_driver sprd_iommu_driver = {
> >               .suppress_bind_attrs = true,
> >       },
> >       .probe  = sprd_iommu_probe,
> > -     .remove_new = sprd_iommu_remove,
> > +     .remove = sprd_iommu_remove,
> >   };
> >   module_platform_driver(sprd_iommu_driver);
> >
> > base-commit: c88416ba074a8913cf6d61b789dd834bbca6681c
>

Thanks, LGTM for iommu/riscv part of the patch.

Reviewed-by: Tomasz Jeznach <tjeznach@rivosinc.com>
