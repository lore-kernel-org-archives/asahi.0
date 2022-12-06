Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA6E2CA7
	for <asahi@lists.linux.dev>; Tue,  6 Dec 2022 10:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670323075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DkUVoTAl7YZ8iV+h+p/E7rejIu+4PoMJoPM9UjUbhrQ=;
	b=cSnpji3yDz6/ahLpUlfqkopcpjc/fL41bGAHdcfZ1aG6Quc2Ftq2jf3GVFNJoMNsOIuRFi
	B6kdUGj5SWJEdUNvEJ5SZJb5JTV6Fqt/GSfh7vEL8NJSsjPQP6LkVj/Qw7pbVX/Ylg6GGe
	Gl8tfCbA8Catdl2BYAqJO9qUjqnloy0=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-657-bbPY7uKDNWiRcgMQlnE_uw-1; Tue, 06 Dec 2022 05:37:54 -0500
X-MC-Unique: bbPY7uKDNWiRcgMQlnE_uw-1
Received: by mail-ua1-f71.google.com with SMTP id o43-20020ab0596e000000b0038421e4c7deso7425129uad.19
        for <asahi@lists.linux.dev>; Tue, 06 Dec 2022 02:37:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DkUVoTAl7YZ8iV+h+p/E7rejIu+4PoMJoPM9UjUbhrQ=;
        b=5Dh82R3Xw/YJbjV1ezB4uUC9BLtlWpvSogmREzk/t2aAdGEjqbhHFPQvETYEKXlXtw
         9VbCTHLRKqUHKhVhFgP0sX531YveY+ispA64fZxCPaH6quuPx4q05r4kjsWHg6i/7fSd
         AjePVxtj+47IcS51kohAZtm8cLcwaR4Lhs/4GrZAXdTAHOBAwIOA0G1LSuaIWJj20qA9
         JExwXVVt7wXCxaFtC0HTshYp1MzpHSqUXwIV7la8IBXTg4J6gIP9XXLlRrspaxGjKiVK
         3eL9ux5aAodvO85VwF5X0FsAU/sudez8+hnwXEWTkW/AOS1GC9+M51+QgPaxXdRvi8EU
         Aufg==
X-Gm-Message-State: ANoB5pniaSiSTnr7AofReBymRnEKUrlvtoFPo2WxlrsBQGNFmZqRexdj
	KfQaBxRjfpQ+NkW0zrHb1KYx/IFZ4r3TNVQkQw+m3R6ezLutbcGqhC93yyNodcKDY+vszljfGWm
	wPE1ONE4nzjO2a2CrAGyE8TK8S+uuNtA=
X-Received: by 2002:a05:6102:3129:b0:3aa:125:9040 with SMTP id f9-20020a056102312900b003aa01259040mr52571436vsh.13.1670323073982;
        Tue, 06 Dec 2022 02:37:53 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6g7L+LzHomWoPugltUcCEbFCYXsailw2SvmbWFnpYUoOMzTBFD8TqxAz2rJgHpXlRIYrnKnvS2Ku+ZOMZW4I4=
X-Received: by 2002:a05:6102:3129:b0:3aa:125:9040 with SMTP id
 f9-20020a056102312900b003aa01259040mr52571429vsh.13.1670323073783; Tue, 06
 Dec 2022 02:37:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221129132208.4337-1-hch@lst.de> <20221129132208.4337-2-hch@lst.de>
In-Reply-To: <20221129132208.4337-2-hch@lst.de>
From: Eric Curtin <ecurtin@redhat.com>
Date: Tue, 6 Dec 2022 10:37:37 +0000
Message-ID: <CAOgh=Fxb7f7aozjxYM8uXd5RdLnxUmiQ2MiT7vAWT94OgdyUpw@mail.gmail.com>
Subject: Re: [PATCH 1/9] nvme-apple: fix controller shutdown in apple_nvme_disable
To: Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>, 
	James Smart <james.smart@broadcom.com>, Chaitanya Kulkarni <kch@nvidia.com>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, asahi@lists.linux.dev, 
	linux-nvme@lists.infradead.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Nov 2022 at 13:29, Christoph Hellwig <hch@lst.de> wrote:
>
> nvme_shutdown_ctrl already shuts the controller down, there is no
> need to also call nvme_disable_ctrl for the shutdown case.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Eric Curtin <ecurtin@redhat.com>

> ---
>  drivers/nvme/host/apple.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
> index 94ef797e8b4a5f..56d9e9be945b76 100644
> --- a/drivers/nvme/host/apple.c
> +++ b/drivers/nvme/host/apple.c
> @@ -831,7 +831,8 @@ static void apple_nvme_disable(struct apple_nvme *anv, bool shutdown)
>
>                 if (shutdown)
>                         nvme_shutdown_ctrl(&anv->ctrl);
> -               nvme_disable_ctrl(&anv->ctrl);
> +               else
> +                       nvme_disable_ctrl(&anv->ctrl);
>         }
>
>         WRITE_ONCE(anv->ioq.enabled, false);
> --
> 2.30.2
>
>

