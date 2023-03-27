Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030767468
	for <asahi@lists.linux.dev>; Mon, 27 Mar 2023 19:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679944456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R6oBo9zgyt6kd8ybd493kKZpaIisYcCPUD4+15shZ6I=;
	b=ZLnPAi3pq5x31IEN+IXegdUjo2fyiC507T0udm8om2xEudv/GY+DiCsmNEvUmXq3u46945
	8nFusc3D1SsCj7hUF0IDpeG+isuZH3a+mMEqILP05KKSsik/uC71yW0SCf0EKUtC0CYQCD
	5OWo/13zyrGwn3AHbjkM9jjRJ6KzRXY=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-98-g-Zdx1KCM9adIrx3GfYXxg-1; Mon, 27 Mar 2023 15:14:14 -0400
X-MC-Unique: g-Zdx1KCM9adIrx3GfYXxg-1
Received: by mail-ua1-f72.google.com with SMTP id n13-20020ab01e4d000000b0076512b30a3bso2484055uak.13
        for <asahi@lists.linux.dev>; Mon, 27 Mar 2023 12:14:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679944454;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R6oBo9zgyt6kd8ybd493kKZpaIisYcCPUD4+15shZ6I=;
        b=qNXrvTILHmuclQ5aJ8d2y6GjSkmF2B4visGZ5aF5YZ5QIHnPmyP+aoxdVE+rL/hIRq
         pLqA5e0djIDXpYpc2s/8TDz6p9hStCwXLfndxEh3qXTQ1DAI+0cT5z3Z0V8STZ7JLqd/
         ldcSTu5JmXxrPZsN5t0zya3gEy5f7zYx4xaqb2YAP5mOaU1/gvY7UFOqhDVOKKVNpcCq
         TOYj7tZG3cL1FRXCjTCWI/6RRq3CVW2xciQ7wgfvj8Lqs60/9didfGe9+FFJjl/1kpnH
         nEiyZx5V9dTbYsF0W71oLjl9omZV241F7YoX/ZROO1eXIG4iualddSvBKwMY4v7P7kA+
         jVLA==
X-Gm-Message-State: AAQBX9e/6DJ2qCq/93jhRqqtvjX+D7fgOJREgMcnciVi9bMCDv1f4pfm
	bTigQZaSzALzs1c7ixm6FzXdgmKNS+fKwaHhirQinPfEk1ezOmewskpi2e0703MzOAM3v9Q9fKu
	/36Z25vVjZ59i0J8UJwMci8jI0BENSVE=
X-Received: by 2002:a1f:94c2:0:b0:43b:ce2e:89f5 with SMTP id w185-20020a1f94c2000000b0043bce2e89f5mr2261070vkd.3.1679944454085;
        Mon, 27 Mar 2023 12:14:14 -0700 (PDT)
X-Google-Smtp-Source: AKy350aGKl8HZ9Z+eVtu17x45GHcnHGj0XkMhWL6GbKsINsyHYa99P9v4nA7zglNqeZf26tAGq2BMEqDU9BNf47/tIc=
X-Received: by 2002:a1f:94c2:0:b0:43b:ce2e:89f5 with SMTP id
 w185-20020a1f94c2000000b0043bce2e89f5mr2261057vkd.3.1679944453861; Mon, 27
 Mar 2023 12:14:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230327054838.67353-1-kch@nvidia.com> <20230327054838.67353-2-kch@nvidia.com>
In-Reply-To: <20230327054838.67353-2-kch@nvidia.com>
From: Eric Curtin <ecurtin@redhat.com>
Date: Mon, 27 Mar 2023 20:13:58 +0100
Message-ID: <CAOgh=Fx3e0M=oRhJ8m_-doRjs2nGfVNVGKq2Z7YsOgz+z34g0w@mail.gmail.com>
Subject: Re: [PATCH 2/2] nvme-apple: return directly instead of else
To: Chaitanya Kulkarni <kch@nvidia.com>
Cc: marcan@marcan.st, sven@svenpeter.dev, alyssa@rosenzweig.io, 
	kbusch@kernel.org, hch@lst.de, sagi@grimberg.me, asahi@lists.linux.dev, 
	linux-nvme@lists.infradead.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Mar 2023 at 06:55, Chaitanya Kulkarni <kch@nvidia.com> wrote:
>
> There is no need for the else when direct return is used at the end of
> the function.
>
> Signed-off-by: Chaitanya Kulkarni <kch@nvidia.com>

Reviewed-by: Eric Curtin <ecurtin@redhat.com>

Is mise le meas/Regards,

Eric Curtin

> ---
>  drivers/nvme/host/apple.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
> index 942a3b71a6d5..33601494ae50 100644
> --- a/drivers/nvme/host/apple.c
> +++ b/drivers/nvme/host/apple.c
> @@ -217,8 +217,8 @@ static unsigned int apple_nvme_queue_depth(struct apple_nvme_queue *q)
>  {
>         if (q->is_adminq)
>                 return APPLE_NVME_AQ_DEPTH;
> -       else
> -               return APPLE_ANS_MAX_QUEUE_DEPTH;
> +
> +       return APPLE_ANS_MAX_QUEUE_DEPTH;
>  }
>
>  static void apple_nvme_rtkit_crashed(void *cookie)
> --
> 2.29.0
>
>

