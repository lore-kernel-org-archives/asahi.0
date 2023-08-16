Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DFB2CA9
	for <asahi@lists.linux.dev>; Wed, 16 Aug 2023 08:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692173203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5NYlQ6R+ho+fnJBrOKcQIXp+73Tu96nMnvzgk7T5vh8=;
	b=AytO6yyvOT1ZdKR2+5zYXnf+EA14PlogtPlhdBpvTU0i7xWXOsvSIhMy4/ZyD97Mg7E+r3
	FH8mzZpfDNymJdEKxhiIDMHmT8gE1mWuo6LH3i+/vk8gEl6rcc8PP9q1EE30qIyx0zobKZ
	cjJVnN85qp6v8pTryJ2BfgWZD5NAyms=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-110-vi1VwlV9OV-8wTc0faqmKw-1; Wed, 16 Aug 2023 04:06:41 -0400
X-MC-Unique: vi1VwlV9OV-8wTc0faqmKw-1
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-6bc56f23c65so7651344a34.2
        for <asahi@lists.linux.dev>; Wed, 16 Aug 2023 01:06:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692173201; x=1692778001;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5NYlQ6R+ho+fnJBrOKcQIXp+73Tu96nMnvzgk7T5vh8=;
        b=arq2ZfHOdUqVjs+dVheIRIaNOsFlMejvKnFce9QHRkILYWUBJPMwgFtaXfr7GeTK0l
         rIvQ/JKMz/s7y1S0Io4pJt34XDWpJHw9Aq8eCed4Wv9unUpDxXDxlQbrDC9/F83uhcxi
         OPsyOt6DjZ3cmcgcpCDlqig9efwzqxOpKhswO+5sxo5+LnI/mbUSoFiDz6af1UrBBOCX
         F5ohZNbokJtVAtyQg7//jexe1sIcRCmhWZiLZjjFjk/jd/k3iT6pLBUdLSbbnmeSFtCD
         Bt081zgfp9bb5uXV1poVYJxIfmAPP6NwLituJEzcuYaOBlLo5i3fzem3CpD8XAzm9iRa
         S3RQ==
X-Gm-Message-State: AOJu0YzBjPuR25mEapNoDsamkTV9c9IgCKtgBbWGOxQMWycCAnJjjcvy
	iEnpwM5PMVo8Z4eiLOmvQlkdz11AD+MZln4p1cPLocsAcXuCowIeCOn8AqlgvNTHbSZa+dqIzlC
	HFYnztqdbmZNOkNQu1oK7ZL+0Jur/5lQ=
X-Received: by 2002:a9d:628d:0:b0:6bc:e2a8:6e3c with SMTP id x13-20020a9d628d000000b006bce2a86e3cmr915276otk.27.1692173201207;
        Wed, 16 Aug 2023 01:06:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDuIz1EwHRFYsD4wfjIgmt5dQC6InhDDyFofPxDmWddYppthFgY97S2EkA9DbP9cOF0JyGraczcOEAMvex21w=
X-Received: by 2002:a9d:628d:0:b0:6bc:e2a8:6e3c with SMTP id
 x13-20020a9d628d000000b006bce2a86e3cmr915269otk.27.1692173200996; Wed, 16 Aug
 2023 01:06:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230816014449.2988332-1-liaoyu15@huawei.com>
In-Reply-To: <20230816014449.2988332-1-liaoyu15@huawei.com>
From: Eric Curtin <ecurtin@redhat.com>
Date: Wed, 16 Aug 2023 09:06:04 +0100
Message-ID: <CAOgh=FxNtyrh9k1V-QgZDvcR9cSK2wJmg2hus_wj8fcO0GJR_A@mail.gmail.com>
Subject: Re: [PATCH -next] soc: apple: rtkit: Use PTR_ERR_OR_ZERO() to
 simplify code
To: Yu Liao <liaoyu15@huawei.com>
Cc: marcan@marcan.st, sven@svenpeter.dev, alyssa@rosenzweig.io, 
	asahi@lists.linux.dev, liwei391@huawei.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Aug 2023 at 02:54, Yu Liao <liaoyu15@huawei.com> wrote:
>
> Return PTR_ERR_OR_ZERO() instead of return 0 or PTR_ERR() to
> simplify code.
>
> Signed-off-by: Yu Liao <liaoyu15@huawei.com>

Yup, same thing, more concise.

Reviewed-by: Eric Curtin <ecurtin@redhat.com>

Is mise le meas/Regards,

Eric Curtin

> ---
>  drivers/soc/apple/rtkit.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
> index d9f19dc99da5..9ad4f2bd05e9 100644
> --- a/drivers/soc/apple/rtkit.c
> +++ b/drivers/soc/apple/rtkit.c
> @@ -706,9 +706,7 @@ static int apple_rtkit_request_mbox_chan(struct apple_rtkit *rtk)
>                 rtk->mbox_chan =
>                         mbox_request_channel(&rtk->mbox_cl, rtk->mbox_idx);
>
> -       if (IS_ERR(rtk->mbox_chan))
> -               return PTR_ERR(rtk->mbox_chan);
> -       return 0;
> +       return PTR_ERR_OR_ZERO(rtk->mbox_chan);
>  }
>
>  struct apple_rtkit *apple_rtkit_init(struct device *dev, void *cookie,
> --
> 2.25.1
>
>

