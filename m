Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD3F7468
	for <asahi@lists.linux.dev>; Mon, 27 Mar 2023 19:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679944422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E1zRha7BHAhGg6ATSz7b6xyQOdyDIKVBqdliEZL7zC0=;
	b=iwQVaKbfPg2IS19GJDO5SSD/v2Yy0dq4vA8IbqBymRhNSEIK4K78cSqi54Vemciz02VOfe
	ZYEci4aPHi5jGtf3mZjc0WuiQAgqL78fhv6ELvS3cmaZ7EkPKLe+fdDMMaDNftCsm6u8jh
	HKEU4I4goNN1AbksZHUgNsHULK1ydmQ=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-R5UDqgUFMre14nk9eqwFkQ-1; Mon, 27 Mar 2023 15:13:41 -0400
X-MC-Unique: R5UDqgUFMre14nk9eqwFkQ-1
Received: by mail-ua1-f69.google.com with SMTP id l31-20020ab03d9f000000b0073fb003de27so4564598uac.23
        for <asahi@lists.linux.dev>; Mon, 27 Mar 2023 12:13:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679944421;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E1zRha7BHAhGg6ATSz7b6xyQOdyDIKVBqdliEZL7zC0=;
        b=VdEsTNpR+QmwEYuoSQl0PQjz50FJ7RIDRtL1KWAS5v/xCN/IJzHAYN4OzN90JBClPC
         Eg3/qRPJfrK5jQvStW0L/+YuNdMYRmKu+sum2yiup9G9rJFSci1SV20a7eJqh+ELdC3n
         BU37ZUIgiifI5D0eX0YPAVyMZ8wxrVtSVgWXWUEX9uRUy/n2oQS/vj3ZDiWlglmtM9hv
         BBnAnwQi0ou7u1zRiqy8M/h7dUlNEq+TgKKn7bQKIEbXcpGVgS/C8jB3M9GvqjQ/adQs
         VAnAvdzI4OHLvG225mxNSa+gQuFDi7M8znRBkwpWrLI3PySGMEBc8ImLAi1oQJCec0QN
         szRg==
X-Gm-Message-State: AAQBX9eJnwmJ7zF7JqmvRyYml+jtNlqt+qH4zmsw664FgzjahuzNu2r+
	/0YhdtXf+EbTnsobUdQdiDYTtEDIn/8piNMybj5+wE2hCX6WQ9iTm0kb5kjJ5trUXIyoYy+hv7P
	wwRgFW62BwP1hv/hv/Feyd6rJuRJAeUQ=
X-Received: by 2002:a05:6130:c0d:b0:68e:33d7:7e6b with SMTP id cg13-20020a0561300c0d00b0068e33d77e6bmr7024117uab.1.1679944420933;
        Mon, 27 Mar 2023 12:13:40 -0700 (PDT)
X-Google-Smtp-Source: AKy350aaQogn32n+L7ho5TXNxSDqxcL5rz6nhgbIjh/RSrzQQA6apKf0AxmPK9a0UJLy7cSZ4T8TLlgvPPzbQgzK2iU=
X-Received: by 2002:a05:6130:c0d:b0:68e:33d7:7e6b with SMTP id
 cg13-20020a0561300c0d00b0068e33d77e6bmr7024107uab.1.1679944420622; Mon, 27
 Mar 2023 12:13:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230327054838.67353-1-kch@nvidia.com>
In-Reply-To: <20230327054838.67353-1-kch@nvidia.com>
From: Eric Curtin <ecurtin@redhat.com>
Date: Mon, 27 Mar 2023 20:13:24 +0100
Message-ID: <CAOgh=FyVPSmXLJgvsfep0waEoKDT3BsuVg7ZYY=_98A=TYJXng@mail.gmail.com>
Subject: Re: [PATCH 1/2] nvme-apple: return directly instead of else
To: Chaitanya Kulkarni <kch@nvidia.com>
Cc: marcan@marcan.st, sven@svenpeter.dev, alyssa@rosenzweig.io, 
	kbusch@kernel.org, hch@lst.de, sagi@grimberg.me, asahi@lists.linux.dev, 
	linux-nvme@lists.infradead.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Mar 2023 at 06:56, Chaitanya Kulkarni <kch@nvidia.com> wrote:
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
> index 5fc5ea196b40..942a3b71a6d5 100644
> --- a/drivers/nvme/host/apple.c
> +++ b/drivers/nvme/host/apple.c
> @@ -209,8 +209,8 @@ static inline struct apple_nvme *queue_to_apple_nvme(struct apple_nvme_queue *q)
>  {
>         if (q->is_adminq)
>                 return container_of(q, struct apple_nvme, adminq);
> -       else
> -               return container_of(q, struct apple_nvme, ioq);
> +
> +       return container_of(q, struct apple_nvme, ioq);
>  }
>
>  static unsigned int apple_nvme_queue_depth(struct apple_nvme_queue *q)
> --
> 2.29.0
>
>

