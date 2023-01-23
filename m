Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A397C
	for <asahi@lists.linux.dev>; Mon, 23 Jan 2023 11:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674472991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P4b4VDNUOrCuuYzHrxL50l8orvsgc64zf6MDB9/G7nI=;
	b=gXha7neNnPg8RFXLLMTcmc/FtrG/qaCzXnrIMsSZmqb2n4+wE4vnCR/Be2kPGWDGaPkwUY
	eoVR4jr1tIILKJgxDPZ7M9ki7DPMZvDh5FZcx6GUtYepFq75bXs2C2Ea9oWpoYlL0CTCor
	bgK5vKSuaejv++jsdsB6szXge6V2ZQ0=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-7-YDfmDIjjPDC0FZUtV27rbg-1; Mon, 23 Jan 2023 06:23:10 -0500
X-MC-Unique: YDfmDIjjPDC0FZUtV27rbg-1
Received: by mail-ua1-f69.google.com with SMTP id o6-20020ab01506000000b004f8c11096a9so3254113uae.20
        for <asahi@lists.linux.dev>; Mon, 23 Jan 2023 03:23:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P4b4VDNUOrCuuYzHrxL50l8orvsgc64zf6MDB9/G7nI=;
        b=VNbDKH3EE8+Gy4f9u5sXo3hDFPswXzmfoFwYSMsnzWlk/S4PqrJnVEo71bmKRhpGgA
         TrVX6CeHFu691lD0m21IQrCH9p+TVmp6fH7Kg9zn3BM+wMQOyQ6U9hy+tF9Jobg0v35v
         /QeBjHO74t0SiiZLFZUK/rH2oaDh2l7eyIMU1YsQ9s0aKZS9RWqlpY2Rf11BfEsjbwsJ
         gmmDag5lyE2eSAK9W5IHvrir5DEK1hQ52LbgKZ4mnFbXQbDs/YxQ7N3t+C6s2DYalQNP
         WchOoYu/tovDwL7aIVUiM+P8PxyX1ps/h4c6lyXd7vpGqjkzGebtYSOV0lOQYK3iPPfq
         uO6w==
X-Gm-Message-State: AFqh2kpF400nPwsDOYPlvxpgcHx0c3WxTINWv8d6aflxaU8Xz5hNRXr0
	ep6jMqrQhCRQg3ZnaSD9o7FF2rjDjpyOoHRPPJPfaCzcsr9LNCMjVI3yp4qxNpkcfcyF0RP7Bxs
	mUwkcgJX6Eb1gWDbALp9X0MaJy/SCLUc=
X-Received: by 2002:a67:ea04:0:b0:3d3:ec78:1d72 with SMTP id g4-20020a67ea04000000b003d3ec781d72mr3814535vso.13.1674472989367;
        Mon, 23 Jan 2023 03:23:09 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuc4Nm/Dd8Fe0BnJ+91lG8llg4zFQJ+QI5+ZUz5w0mVaUsCVB3YJcAwwxLUJmz1/ORwUCIYKtjwtj8FATe11nY=
X-Received: by 2002:a67:ea04:0:b0:3d3:ec78:1d72 with SMTP id
 g4-20020a67ea04000000b003d3ec781d72mr3814527vso.13.1674472989089; Mon, 23 Jan
 2023 03:23:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230123065125.26350-1-marcan@marcan.st>
In-Reply-To: <20230123065125.26350-1-marcan@marcan.st>
From: Eric Curtin <ecurtin@redhat.com>
Date: Mon, 23 Jan 2023 11:22:53 +0000
Message-ID: <CAOgh=FwEpMGx-F6GZumOBkBYShtU_SVUWTzZ+WWY0Euc-75YGQ@mail.gmail.com>
Subject: Re: [PATCH] soc: apple: apple-pmgr-pwrstate: Switch to IRQ-safe mode
To: Hector Martin <marcan@marcan.st>
Cc: Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Janne Grunau <j@jannau.net>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Jan 2023 at 07:01, Hector Martin <marcan@marcan.st> wrote:
>
> This requires changing the reset path locking primitives to the spinlock
> path in genpd, instead of the mutex path.
>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> ---

It seems we need this to avoid a race from reading #asahi-dev IRC,
commit message could be more detailed here.

Reviewed-by: Eric Curtin <ecurtin@redhat.com>

Is mise le meas/Regards,

Eric Curtin

>  drivers/soc/apple/apple-pmgr-pwrstate.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/soc/apple/apple-pmgr-pwrstate.c b/drivers/soc/apple/apple-pmgr-pwrstate.c
> index e1122288409a..a3e2bc1d2686 100644
> --- a/drivers/soc/apple/apple-pmgr-pwrstate.c
> +++ b/drivers/soc/apple/apple-pmgr-pwrstate.c
> @@ -116,8 +116,9 @@ static int apple_pmgr_ps_power_off(struct generic_pm_domain *genpd)
>  static int apple_pmgr_reset_assert(struct reset_controller_dev *rcdev, unsigned long id)
>  {
>         struct apple_pmgr_ps *ps = rcdev_to_apple_pmgr_ps(rcdev);
> +       unsigned long flags;
>
> -       mutex_lock(&ps->genpd.mlock);
> +       spin_lock_irqsave(&ps->genpd.slock, flags);
>
>         if (ps->genpd.status == GENPD_STATE_OFF)
>                 dev_err(ps->dev, "PS 0x%x: asserting RESET while powered down\n", ps->offset);
> @@ -129,7 +130,7 @@ static int apple_pmgr_reset_assert(struct reset_controller_dev *rcdev, unsigned
>         regmap_update_bits(ps->regmap, ps->offset, APPLE_PMGR_FLAGS | APPLE_PMGR_RESET,
>                            APPLE_PMGR_RESET);
>
> -       mutex_unlock(&ps->genpd.mlock);
> +       spin_unlock_irqrestore(&ps->genpd.slock, flags);
>
>         return 0;
>  }
> @@ -137,8 +138,9 @@ static int apple_pmgr_reset_assert(struct reset_controller_dev *rcdev, unsigned
>  static int apple_pmgr_reset_deassert(struct reset_controller_dev *rcdev, unsigned long id)
>  {
>         struct apple_pmgr_ps *ps = rcdev_to_apple_pmgr_ps(rcdev);
> +       unsigned long flags;
>
> -       mutex_lock(&ps->genpd.mlock);
> +       spin_lock_irqsave(&ps->genpd.slock, flags);
>
>         dev_dbg(ps->dev, "PS 0x%x: deassert reset\n", ps->offset);
>         regmap_update_bits(ps->regmap, ps->offset, APPLE_PMGR_FLAGS | APPLE_PMGR_RESET, 0);
> @@ -147,7 +149,7 @@ static int apple_pmgr_reset_deassert(struct reset_controller_dev *rcdev, unsigne
>         if (ps->genpd.status == GENPD_STATE_OFF)
>                 dev_err(ps->dev, "PS 0x%x: RESET was deasserted while powered down\n", ps->offset);
>
> -       mutex_unlock(&ps->genpd.mlock);
> +       spin_unlock_irqrestore(&ps->genpd.slock, flags);
>
>         return 0;
>  }
> @@ -222,6 +224,7 @@ static int apple_pmgr_ps_probe(struct platform_device *pdev)
>                 return ret;
>         }
>
> +       ps->genpd.flags |= GENPD_FLAG_IRQ_SAFE;
>         ps->genpd.name = name;
>         ps->genpd.power_on = apple_pmgr_ps_power_on;
>         ps->genpd.power_off = apple_pmgr_ps_power_off;
> --
> 2.35.1
>
>

