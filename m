Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491AD28EA
	for <asahi@lists.linux.dev>; Wed, 14 Dec 2022 14:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671029046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Od+ZzidxMkq0q/yuo1WBwXnhx0kOazQnqrbp3yVh/SA=;
	b=LQ9/9GUsW7IN2rzsoG2ucCUUvjMsOXD+mGN7uVi7G1r4c1Tvr9KeDOErdCq3SHk84zuLeq
	xLltx9bCD88kGxHAQF+XdV1wyfB7zv5FjlcdC8Gy8FpKVV41lnRkbLewAv8eX/QICP8UpG
	WQC0rUP9VADvqUmB0D6mSyKE6417A3U=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-257-yEGDbVYhMIOVE4xaHFP7rw-1; Wed, 14 Dec 2022 09:44:04 -0500
X-MC-Unique: yEGDbVYhMIOVE4xaHFP7rw-1
Received: by mail-vs1-f71.google.com with SMTP id k2-20020a676f02000000b003b0ad24798eso5185749vsc.0
        for <asahi@lists.linux.dev>; Wed, 14 Dec 2022 06:44:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Od+ZzidxMkq0q/yuo1WBwXnhx0kOazQnqrbp3yVh/SA=;
        b=tIxhdJp//A0zofoTtWqsp1qGPRhQX/XENtezQ3hIpII8LofG8QTxZG5B41BFqNNZfb
         YR6AMDO4SmhQ1wpFiql9biUiarIZiymqSNCHwm3y2a7oKa+gQAjPDKciFBV7tg4+reXx
         DxjxilExayvS/wdTVzNvS2RQPpX58yT31jdb1vxe+exUbBSzG6+ZcSEr9cPbQOMTPFMQ
         4TCGG0q1q3yJOnSO72l1spO616c6R9xru0KoLVdYqtkq+XxPfUeqsijrbgDnwpU6RbTj
         r70tu9TjAzBA9R/Pv2RjAlK31Ohyp4BpmlRsYgs/FIGLZYI+Z5zmssSbtmvn2/wR21VQ
         zr1g==
X-Gm-Message-State: ANoB5pnSQxVJz5UVq+VetucaxEBAfD6NeMzyR1irYFin5NufE8OT3XaQ
	aiVqTEKjd9PHiMTCUGRBu22zkMPWKG1DY4p+WTEvbhuD8JvQ6fvIwzo/PG2haoxj1Lg425jS2dY
	gqSM1PXYnLQZ1K5vpSJSqImyx9490mLI=
X-Received: by 2002:ab0:1626:0:b0:3b3:e759:ed55 with SMTP id k35-20020ab01626000000b003b3e759ed55mr47758857uae.106.1671029044290;
        Wed, 14 Dec 2022 06:44:04 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5dYfeZwV/UZD42wC3ZAeGn3qE4Z/ss22NsGqT1kATRGiXRxDym15thfFXzewCPVqoLEowiNwDy+9HORdcuxjQ=
X-Received: by 2002:ab0:1626:0:b0:3b3:e759:ed55 with SMTP id
 k35-20020ab01626000000b003b3e759ed55mr47758856uae.106.1671029044007; Wed, 14
 Dec 2022 06:44:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221214142952.9372-1-marcan@marcan.st>
In-Reply-To: <20221214142952.9372-1-marcan@marcan.st>
From: Eric Curtin <ecurtin@redhat.com>
Date: Wed, 14 Dec 2022 14:43:48 +0000
Message-ID: <CAOgh=FwYsdi1aK3ajgmJ23HBNUajZ=k+q4r2qrdYja28tHLYoA@mail.gmail.com>
Subject: Re: [PATCH] nvmem: core: Fix race in nvmem_register()
To: Hector Martin <marcan@marcan.st>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Dec 2022 at 14:40, Hector Martin <marcan@marcan.st> wrote:
>
> nvmem_register() currently registers the device before adding the nvmem
> cells, which creates a race window where consumers may find the nvmem
> device (and not get PROBE_DEFERred), but then fail to find the cells and
> error out.
>
> Move device registration to the end of nvmem_register(), to close the
> race.
>
> Observed when the stars line up on Apple Silicon machines with the (not
> yet upstream, but trivial) spmi nvmem driver and the macsmc-rtc client:
>
> [    0.487375] macsmc-rtc macsmc-rtc: error -ENOENT: Failed to get rtc_offset NVMEM cell
>
> Fixes: eace75cfdcf7 ("nvmem: Add a simple NVMEM framework for nvmem providers")
> Signed-off-by: Hector Martin <marcan@marcan.st>

Reviewed-by: Eric Curtin <ecurtin@redhat.com>

> ---
>  drivers/nvmem/core.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 321d7d63e068..d255feca5e17 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -837,20 +837,16 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
>
>         dev_dbg(&nvmem->dev, "Registering nvmem device %s\n", config->name);
>
> -       rval = device_register(&nvmem->dev);
> -       if (rval)
> -               goto err_put_device;
> -
>         if (nvmem->nkeepout) {
>                 rval = nvmem_validate_keepouts(nvmem);
>                 if (rval)
> -                       goto err_device_del;
> +                       return ERR_PTR(rval);
>         }
>
>         if (config->compat) {
>                 rval = nvmem_sysfs_setup_compat(nvmem, config);
>                 if (rval)
> -                       goto err_device_del;
> +                       return ERR_PTR(rval);
>         }
>
>         if (config->cells) {
> @@ -867,19 +863,21 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
>         if (rval)
>                 goto err_remove_cells;
>
> +       rval = device_register(&nvmem->dev);
> +       if (rval)
> +               goto err_put_device;
> +
>         blocking_notifier_call_chain(&nvmem_notifier, NVMEM_ADD, nvmem);
>
>         return nvmem;
>
> +err_put_device:
> +       put_device(&nvmem->dev);
>  err_remove_cells:
>         nvmem_device_remove_all_cells(nvmem);
>  err_teardown_compat:
>         if (config->compat)
>                 nvmem_sysfs_remove_compat(nvmem, config);
> -err_device_del:
> -       device_del(&nvmem->dev);
> -err_put_device:
> -       put_device(&nvmem->dev);
>
>         return ERR_PTR(rval);
>  }
> --
> 2.35.1
>
>

