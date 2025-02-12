Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BCF209671
	for <asahi@lists.linux.dev>; Wed, 12 Feb 2025 10:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739354479; cv=none; b=sasKMhOLACzOeewTLu9BM7GJU/QTgDyEzvX2b7t1TgNvHd1zSlU7QTV+LWS7bGXmuoSd6BZMnEuMFqTTZlvDz8T2mSJ5omFUsMKbmvqJM/PYUCtGI9uwrCFLDKjCjOdU7WgXQgnz6+jxrtIR8CbDFcxqG4cFJrJU/f/gARfzJds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739354479; c=relaxed/simple;
	bh=sLtMNl2PIK/GBgnQIKx/qPFCh0ea5y3KjwR+JGxQbxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JtQdEcTM/O1IAw7qZsdpOVy+psFvjEF9fBbVQGNYvkMy1bT5qxg8WkdfKHZ5iHuTFtFunYVDjAfUpw+r98FQrhqxbjpsFAX+UOsM4qOIh3n80jsmXV9bOgNqJznvQpR5DRNFNx55QashVRJ9FwyrgS0VQjaRy7vafbKQdIgskw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ag+g7u1q; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ag+g7u1q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739354476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k10/aEW9kI4Fw7g7ICooPKDGPu1yctxg0l9c8ZseCIM=;
	b=ag+g7u1qDtYw/QcwbCDCqqQ2lfEpfwLaab9xlmie5m+S8UTLb6pOvlZL//kQIwfKDAsq41
	hQF8WUT9Y+3wRTNLBtPrAHgUTavzMtOQQvNnsWxor1X71VeZrrLKqKLoZxEp0BlwVzuuPd
	BeV97o+4a1mGPPmBLrNX3nIVvTYb7uY=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-480-VGO4xcm5NeG3oVJjgHRojg-1; Wed, 12 Feb 2025 05:01:15 -0500
X-MC-Unique: VGO4xcm5NeG3oVJjgHRojg-1
X-Mimecast-MFC-AGG-ID: VGO4xcm5NeG3oVJjgHRojg
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2fa228b4151so10837619a91.1
        for <asahi@lists.linux.dev>; Wed, 12 Feb 2025 02:01:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739354473; x=1739959273;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k10/aEW9kI4Fw7g7ICooPKDGPu1yctxg0l9c8ZseCIM=;
        b=Xroi1dy2FGEn6J0pw6Xe2oIk6xrcQlwt0xXulA5hl8lZBSkBe+wgaJYJn3Kk5An7zw
         IJlLVGfP2IQVwmg0PTc2PNVU7PCB775A66JlY2+e0ociJJEZek6dhzDrLjcK2SnmJepe
         WesyjY2w2K0RLXoGverxPG/+knBYo/6vaM+joq7B9aMGuQwTpCe3RDJxbbJduhu7bAD4
         cY1HyASCyolB9d8S3/gp/xYbnoaBvsjoKjuGZpPtlkK/LIRwz+nC52KSaJZpjvse7U/J
         07oXTBEey76GB/2QoDrlvCV5Gpk1eFiqZtEkNQNYI8+XmYxzMFSUQD4hISC1854thmax
         DfJw==
X-Forwarded-Encrypted: i=1; AJvYcCUZbgElDEdSdelli6dnhkmDsopd4A2XV8DYtKsBHVYvEais5Pj4TulArbQpUZ5KZEvlpFGyBA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywligf9ZpH8i+04MHBuCqS6z9/7f2MuCRaaR62WpzbXtmd44zxQ
	KsRaAHYPjUYqLDulGHRSm5BHr7ZfouVZojI599TYbkOWzn4KlvqO1HO+zq51k377sROJLBSxYgY
	3ureu/fEAN+DADYPVxW805OLdPXFtiYDWMoYdIUvXxzMJ35gH4Oig6HZbOTVMlHIniaexomQ2Zf
	7K2sEivdUMxkXIiGMs8iDqoSHmRPg=
X-Gm-Gg: ASbGncvJLHjIfD7hcEJn0dULmO/8akaywEMd+pX0o/wm6H105/XqyimWcPUmwqC7tS1
	3AfUdodwl6WyQTT5v5LvYWsZpxDOJZbvTDF3FchF0r1eLBAhDeEowrJEvl8f4bVJ6HpbQMJiShm
	dfkldLgGF8AYnY/GbKS7M=
X-Received: by 2002:a17:90b:3a08:b0:2ee:db8a:2a01 with SMTP id 98e67ed59e1d1-2fbf5c6a05amr3885264a91.30.1739354473034;
        Wed, 12 Feb 2025 02:01:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHapn9jYWGyKoK8rERdyukBRLyP6apd4I5Sp/cSU8BhLWDuyyGc2UAEQe4Lq75zmYbK/CB6jhRtH7HcRUIhM4Q=
X-Received: by 2002:a17:90b:3a08:b0:2ee:db8a:2a01 with SMTP id
 98e67ed59e1d1-2fbf5c6a05amr3885222a91.30.1739354472720; Wed, 12 Feb 2025
 02:01:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250212085853.1357906-1-harshit.m.mogalapalli@oracle.com>
In-Reply-To: <20250212085853.1357906-1-harshit.m.mogalapalli@oracle.com>
From: Eric Curtin <ecurtin@redhat.com>
Date: Wed, 12 Feb 2025 10:00:36 +0000
X-Gm-Features: AWEUYZn-hP_kxTTtLow8M16VioOce2ZF8-IggRFFQ_uJOeNCeNsgfNjbEVocXew
Message-ID: <CAOgh=FzNk089VSrLbuAS=UA45dpY3mVFoebE2xg5ZGvTrtmVWg@mail.gmail.com>
Subject: Re: [PATCH] soc: apple: rtkit: Fix use-after-free in apple_rtkit_crashlog_rx()
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Janne Grunau <j@jannau.net>, Asahi Lina <lina@asahilina.net>, Jens Axboe <axboe@kernel.dk>, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dan.carpenter@linaro.org, 
	kernel-janitors@vger.kernel.org, error27@gmail.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Erv_t0-3rrTAlG5yo3UxuAyuHAlkbQbSwsQ-StUolaU_1739354473
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 12 Feb 2025 at 09:08, Harshit Mogalapalli
<harshit.m.mogalapalli@oracle.com> wrote:
>
> This code calls kfree(bfr); and then passes "bfr" to rtk->ops->crashed()
> which is a use after free.  The ->crashed function pointer is implemented
> by apple_nvme_rtkit_crashed() and it doesn't use the "bfr" pointer so
> this doesn't cause a problem.  But it still looks sketchy as can be.
>
> Fix this by moving kfree() after the last usage of bfr.
>
> Fixes: c559645f343a ("soc: apple: rtkit: Pass the crashlog to the crashed() callback")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>

Reviewed-by: Eric Curtin <ecurtin@redhat.com>

I wish we used the attribute cleanup stuff by default more in the
kernel, it would prevent a lot of things like this, it does what we
want it to do, most of the time.

Although I'm not sure it was introduced yet when the code was written.

Is mise le meas/Regards,

Eric Curtin

> ---
> This is based on static analysis with smatch, only compile tested.
> ---
>  drivers/soc/apple/rtkit.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
> index 4b0783091a92..1ccec7ba640c 100644
> --- a/drivers/soc/apple/rtkit.c
> +++ b/drivers/soc/apple/rtkit.c
> @@ -360,7 +360,6 @@ static void apple_rtkit_crashlog_rx(struct apple_rtkit *rtk, u64 msg)
>                 apple_rtkit_memcpy(rtk, bfr, &rtk->crashlog_buffer, 0,
>                                    rtk->crashlog_buffer.size);
>                 apple_rtkit_crashlog_dump(rtk, bfr, rtk->crashlog_buffer.size);
> -               kfree(bfr);
>         } else {
>                 dev_err(rtk->dev,
>                         "RTKit: Couldn't allocate crashlog shadow buffer\n");
> @@ -369,6 +368,8 @@ static void apple_rtkit_crashlog_rx(struct apple_rtkit *rtk, u64 msg)
>         rtk->crashed = true;
>         if (rtk->ops->crashed)
>                 rtk->ops->crashed(rtk->cookie, bfr, rtk->crashlog_buffer.size);
> +
> +       kfree(bfr);
>  }
>
>  static void apple_rtkit_ioreport_rx(struct apple_rtkit *rtk, u64 msg)
> --
> 2.39.3
>
>

