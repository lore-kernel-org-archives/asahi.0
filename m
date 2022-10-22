Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2588933DF
	for <asahi@lists.linux.dev>; Sat, 22 Oct 2022 13:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666446601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9L4JE6hZ7E7BRXfPAr2m26KAuFLoVfy/IaYPaNDhBM4=;
	b=X7RgAjamHH+yxz0OuKQwEV+tuawspljziaNpYTwZWcXT+H0+ccrqRxp91e8GEVR/OFa/iP
	p5LJTmMnh4joTiqL4nnLCNGZByZA/cP1WZneIteqBjz9rjfTI4/eeRm0aNLz43b8ZSPbRr
	MkrMF8B1VvEoQl7FTT4lAkd8bGnysjA=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-617-ik6gLVqZNB2kz7VqW7TiNw-1; Sat, 22 Oct 2022 09:49:58 -0400
X-MC-Unique: ik6gLVqZNB2kz7VqW7TiNw-1
Received: by mail-vs1-f69.google.com with SMTP id a6-20020a671a06000000b003986a4e277dso1423876vsa.12
        for <asahi@lists.linux.dev>; Sat, 22 Oct 2022 06:49:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9L4JE6hZ7E7BRXfPAr2m26KAuFLoVfy/IaYPaNDhBM4=;
        b=taz1vvqLxtFPNDrYbc7YY8caBKg+/Xda6EqUV45llTChdaPcFowA3pO7x5cGw0us7p
         DwzF3CZhgSUJyca0938xz+36h5sfkOpp7Q3Bt79JeWl66itKf49Za9tGoNIepltoxslE
         sjUHJKQtIFGkcWBq7jxGFj2GMcIvwmiGQi6DrQ7gKPiWTXCFj2UleY5to/rWvjD+3G90
         VM4Mzp4R9p3aycEzqxIRq4he+ThFLW9zB4i8iaP9bnEXGM3i3DVlyoCyQF0TAKa+fY0v
         zK2vGWuzu9g11zX6mnoizysdaRs+5HOObwMWtmLg9XsuQLAftCNLIcRCMidqdGLoiDgC
         fmcw==
X-Gm-Message-State: ACrzQf32GaDx6n904st6pDxvcMkzNFKSAD5jLhPs+KfZp5uXd4xxQ1FQ
	U/fZDj7HtD43sqlXJryR91Y3Bu0p3nAwfacUvPpVNgxHxbQR5JcSr6W2tVsP/9EG/fdAvwyZr7r
	S2Vvuuekm4MUqNgkO0UHCVM4An7XDo74=
X-Received: by 2002:a67:eac1:0:b0:3a6:eeaf:bb10 with SMTP id s1-20020a67eac1000000b003a6eeafbb10mr17843637vso.13.1666446598139;
        Sat, 22 Oct 2022 06:49:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6ulU5EcnN5sYdSwkk4YPB4fyn/1SpiyaEqPkdjSmKDL50inCgaVHuxtn3ot8G8PsbCohyqEeH7CEQstqyyGTM=
X-Received: by 2002:a67:eac1:0:b0:3a6:eeaf:bb10 with SMTP id
 s1-20020a67eac1000000b003a6eeafbb10mr17843631vso.13.1666446597922; Sat, 22
 Oct 2022 06:49:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221021235523.76585-1-konrad.dybcio@somainline.org> <cccebca9-69a9-523c-dd5e-85d17f0946b6@somainline.org>
In-Reply-To: <cccebca9-69a9-523c-dd5e-85d17f0946b6@somainline.org>
From: Eric Curtin <ecurtin@redhat.com>
Date: Sat, 22 Oct 2022 14:49:41 +0100
Message-ID: <CAOgh=Fyg7nRMy2oKNgcFCqXXsxbZY1jEmXf-y-JH-P3TLTMz8g@mail.gmail.com>
Subject: Re: [PATCH] irqchip/apple-aic: Mark aic_info structs __initconst
To: Konrad Dybcio <konrad.dybcio@somainline.org>
Cc: asahi@lists.linux.dev, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 22 Oct 2022 at 01:04, Konrad Dybcio
<konrad.dybcio@somainline.org> wrote:
>
>
>
> On 22.10.2022 01:55, Konrad Dybcio wrote:
> > These structs hold information used only at init time that never
> > gets modified, hence mark them __initconst.
> >
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Reviewed-by: Eric Curtin <ecurtin@redhat.com>

> > ---
> Forgot to add:
>
> Suggested-by: Marc Zyngier <maz@kernel.org>
>
>
> Konrad
> >  drivers/irqchip/irq-apple-aic.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/irqchip/irq-apple-aic.c b/drivers/irqchip/irq-apple-aic.c
> > index 1c2813ad8bbe..ae3437f03e6c 100644
> > --- a/drivers/irqchip/irq-apple-aic.c
> > +++ b/drivers/irqchip/irq-apple-aic.c
> > @@ -248,14 +248,14 @@ struct aic_info {
> >       bool fast_ipi;
> >  };
> >
> > -static const struct aic_info aic1_info = {
> > +static const struct aic_info aic1_info __initconst = {
> >       .version        = 1,
> >
> >       .event          = AIC_EVENT,
> >       .target_cpu     = AIC_TARGET_CPU,
> >  };
> >
> > -static const struct aic_info aic1_fipi_info = {
> > +static const struct aic_info aic1_fipi_info __initconst = {
> >       .version        = 1,
> >
> >       .event          = AIC_EVENT,
> > @@ -264,7 +264,7 @@ static const struct aic_info aic1_fipi_info = {
> >       .fast_ipi       = true,
> >  };
> >
> > -static const struct aic_info aic2_info = {
> > +static const struct aic_info aic2_info __initconst = {
> >       .version        = 2,
> >
> >       .irq_cfg        = AIC2_IRQ_CFG,
>

