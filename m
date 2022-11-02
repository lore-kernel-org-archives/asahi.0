Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E241EA01
	for <asahi@lists.linux.dev>; Wed,  2 Nov 2022 17:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667408742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8g+IU1SbconJtIJvE9qWH+h96tYel1GhCAQmvBe4qsI=;
	b=XJPEDlVKiPnFSfbr173eMLO2awzmTbJGCHwX+JP0CCqPlylroMJ43d/aEVu2Pntqx4+A13
	AOoV6h/kMJNrjRZ7cfG7ErElrozcvNB7HX0m2Hdo4N+c5lpZlCYkhWe7Vxn4xVWnGBYuQO
	tOi0j/9SOyeyKthezao8AYXvdoBjTKM=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-452-pPnAuFORNlWAOWfNPtPUfQ-1; Wed, 02 Nov 2022 13:05:41 -0400
X-MC-Unique: pPnAuFORNlWAOWfNPtPUfQ-1
Received: by mail-ua1-f69.google.com with SMTP id m36-20020ab013a7000000b004112461a277so7446359uae.13
        for <asahi@lists.linux.dev>; Wed, 02 Nov 2022 10:05:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8g+IU1SbconJtIJvE9qWH+h96tYel1GhCAQmvBe4qsI=;
        b=afJmsetqmPk7SA3zew8Jcomf6s9T5BTgY2SKYFHSWawK86hnqSn/Y1l4kZc+4ehuUg
         rc9+80kt7L/ao+mut9Wx2OdsLGFxLW+L+2aOVEs14oxUVSwjV2WM5GGY6fkLe+yytrUg
         FmvrVwUvFTbhmdCRQwX3x1rn3pIk42iQ+5a5guWyzPAIcAicXaogNp4b5pue5gP7st/2
         Tk3U9335VzkU2+lpnjpGWWmMyYW3itKCQq70pmxbVuKmQXG0TViW3fJ/GEe+aySVDPeq
         gSRz26oH+6JzAJd5AMPvX+n5Qc44ho9NkCt4Smo32ajm/ISMw5grgTkdwo9Tpsul3uro
         SwFA==
X-Gm-Message-State: ACrzQf1UTB416jZVOuvGIRIoW1dFCR4SIGc2ryLHMbe9kcAVU9uKVErW
	GL6PMf2QeT9eMT7mvEb630hnReJ6k/oY0XLHUMpgKkX6DWepghs2B6lYNFJavXcVkZ9KVgBEa6g
	D+zPIlfZjhyMqSI7VUgaHdP3mtUR2Grk=
X-Received: by 2002:a67:dc0b:0:b0:3aa:304f:54bc with SMTP id x11-20020a67dc0b000000b003aa304f54bcmr12393812vsj.76.1667408740594;
        Wed, 02 Nov 2022 10:05:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7ZVn7Uq6fOScLt3XDDum0YUD0JH7ATLN68jBf8DzysLFYF3QjlN0LTcHgv3m8T/SZU2rTj+ahxYImgUAhPpRU=
X-Received: by 2002:a67:dc0b:0:b0:3aa:304f:54bc with SMTP id
 x11-20020a67dc0b000000b003aa304f54bcmr12393784vsj.76.1667408740326; Wed, 02
 Nov 2022 10:05:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221102161542.30669-1-sven@svenpeter.dev>
In-Reply-To: <20221102161542.30669-1-sven@svenpeter.dev>
From: Eric Curtin <ecurtin@redhat.com>
Date: Wed, 2 Nov 2022 17:05:24 +0000
Message-ID: <CAOgh=FxPmg_xDq=5xW3=NpGXHBWAZ-E57SiqsbVfNc7UXtq5sA@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: tipd: Prevent uninitialized event{1,2} in IRQ handler
To: Sven Peter <sven@svenpeter.dev>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hector Martin <marcan@marcan.st>, 
	=?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Nov 2022 at 16:24, Sven Peter <sven@svenpeter.dev> wrote:
>
> If reading TPS_REG_INT_EVENT1/2 fails in the interrupt handler event1
> and event2 may be uninitialized when they are used to determine
> IRQ_HANDLED vs. IRQ_NONE in the error path.
>
> Fixes: c7260e29dd20 ("usb: typec: tipd: Add short-circuit for no irqs")
> Fixes: 45188f27b3d0 ("usb: typec: tipd: Add support for Apple CD321X")
> Signed-off-by: Sven Peter <sven@svenpeter.dev>

Reviewed-by: Eric Curtin <ecurtin@redhat.com>

> ---
>  drivers/usb/typec/tipd/core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index b637e8b378b3..2a77bab948f5 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -474,7 +474,7 @@ static void tps6598x_handle_plug_event(struct tps6598x *tps, u32 status)
>  static irqreturn_t cd321x_interrupt(int irq, void *data)
>  {
>         struct tps6598x *tps = data;
> -       u64 event;
> +       u64 event = 0;
>         u32 status;
>         int ret;
>
> @@ -519,8 +519,8 @@ static irqreturn_t cd321x_interrupt(int irq, void *data)
>  static irqreturn_t tps6598x_interrupt(int irq, void *data)
>  {
>         struct tps6598x *tps = data;
> -       u64 event1;
> -       u64 event2;
> +       u64 event1 = 0;
> +       u64 event2 = 0;
>         u32 status;
>         int ret;
>
> --
> 2.25.1
>
>

