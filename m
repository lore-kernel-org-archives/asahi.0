Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978CB17277F
	for <asahi@lists.linux.dev>; Fri, 12 Jul 2024 14:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720794606; cv=none; b=tkrQmsx2Y8BDWWZ4OcdrW4A7+R01juCoLn8orvLyEdeTjEq/Gynmmhblj5e4sCkhhi3Clr+7DXz6YtUlXnHp6ZJe3pJ/hQGS4BQnsrBgPUZretL0Gq62QiveOzJh4o7z2TN9VOXVhPJcFyfU3JWOwCgvnZ6cEGs95W7YT9vN+hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720794606; c=relaxed/simple;
	bh=xNf1tJFXF2XZo5kA4RL74P4CbwPpLhsf5gbnmAkL9hI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mxRSB5mUB0uwmo8Sk1gT0oY8PLmr/FgSJ9ULdV86uWmLdJ/64JiMxaIC8qdx5QmoDO3uSCgIU10l2OSIzhD7snEvkfN8YGZLN8W2O8n+YyRDUYZeSD+ui5dtj4JuodbwqIymp/1agB2iVowF89jrsQNKY1pOEWjS06yCkGHqaJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gkW7SeNq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gkW7SeNq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720794603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Em+4lpr48F+sTPUkNgk9R0TQyrZ2qwV17RRP7sfDWpk=;
	b=gkW7SeNq7YLzqU2q1cbHiyvZBsk5722aP2Kaa1q0+mL+yUUuEmv4g6xSu3xiRNI2CqSmW2
	i+FdoDCpyzDlAt5h7nwKcSBWhFoPASUSyqpX2em41h8BcAk2j+Rjwx2zv8TwC+uTIPienN
	JbKNXIwlgcykzT0LXEKDsdbkRhaWZg0=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-18-N71Gc8sxNxSCMG0JO9IJww-1; Fri, 12 Jul 2024 10:30:00 -0400
X-MC-Unique: N71Gc8sxNxSCMG0JO9IJww-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2c96e73c886so1836598a91.3
        for <asahi@lists.linux.dev>; Fri, 12 Jul 2024 07:30:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720794599; x=1721399399;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Em+4lpr48F+sTPUkNgk9R0TQyrZ2qwV17RRP7sfDWpk=;
        b=w/DLRS6LaWW9sU2w64f4aQW+PBGV4klXL05nTF1zEQnSNmS2/s2bIZ5OtM9X7ilcH3
         GMLDo/lx3K6rUwVHPWgPLt4yiLFps0MzByEtw7l6uMp5jaHmMiM0Y5Cjwbs6dBR7YNCN
         vE/Vdkz6lOwByti20dVhW2ke5bjIbb8Zxjy6OEytRvHT/JTynK0Un0tuRGVZBB1lPN58
         waQop2pED09lXjHWhUENMcJV/n7OpXav95gX3jBJVYUO5xKVTE39oT9Z4+hpoJ95rOrI
         CvaLNtd/arV4oazGP8vGVL1g0RWt8EcHV6suCsOCISiBbWAsMZOkURMASHs/L/Znu1LG
         JBeA==
X-Forwarded-Encrypted: i=1; AJvYcCWT9a767veSF4HNSm1Oj7dhok6pydVtKo4kNEL12nM11MGobSajExPGhIXAXdWx6W6YAsR6C7xvnwH1gNr8BpYM3+wTcdo=
X-Gm-Message-State: AOJu0YwokoCOEkUhMbOTTQTgDfBbuVPRYtv3FDJoYScw/gFzNXBPiDUc
	7Kpeip26572EC5UFcG7WMwX36Z8NG3k3EFMPCeEYFE33PIpXMz/rQY4r5l+KfDsq4lIO7uQYALg
	MgznCcwytC7g3QBTn+gH+hsCcBOPy1D768dk830uHVBjeS7jCBq6j0osKDQ1Ac8DNTQRG+rryjG
	XSWyxJWcnPowVLHD+WQJxKSAkMeV0=
X-Received: by 2002:a17:90a:70c6:b0:2c8:87e:c2d9 with SMTP id 98e67ed59e1d1-2ca35d43887mr9092105a91.39.1720794599176;
        Fri, 12 Jul 2024 07:29:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEyEXCNphbXM4G/rPhQQo3eVo3TcpH/vUgTlLXnK+HK0NsMDnIjoeWz76/qY2/k2Ca8KWUcmscnLjrUmqi++Q=
X-Received: by 2002:a17:90a:70c6:b0:2c8:87e:c2d9 with SMTP id
 98e67ed59e1d1-2ca35d43887mr9092063a91.39.1720794598057; Fri, 12 Jul 2024
 07:29:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <124bbda3-7ccf-4e6b-b30d-7115e1c2620f@stanley.mountain>
In-Reply-To: <124bbda3-7ccf-4e6b-b30d-7115e1c2620f@stanley.mountain>
From: Eric Curtin <ecurtin@redhat.com>
Date: Fri, 12 Jul 2024 15:29:21 +0100
Message-ID: <CAOgh=Fx6hcJdbQpna2JJhnzp=YG_nyg-gpd=ZH7CewudtgDhAA@mail.gmail.com>
Subject: Re: [PATCH] nvme: apple: remove some dead code
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Jul 2024 at 15:13, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> platform_get_irq() never returns zero so we can remove his dead code.
> Checking for zero is a historical artifact from over ten years ago.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

There's quite a few return paths in platform_get_irq_optional, are we
sure it can never be zero?

Not calling out a specific case here, but it's not so clear to me how
we can guarantee platform_get_irq() is never zero,

Is mise le meas/Regards,

Eric Curtin

> ---
>  drivers/nvme/host/apple.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
> index b1387dc459a3..f5a3a4e8b1e5 100644
> --- a/drivers/nvme/host/apple.c
> +++ b/drivers/nvme/host/apple.c
> @@ -1417,10 +1417,6 @@ static struct apple_nvme *apple_nvme_alloc(struct platform_device *pdev)
>                 ret = anv->irq;
>                 goto put_dev;
>         }
> -       if (!anv->irq) {
> -               ret = -ENXIO;
> -               goto put_dev;
> -       }
>
>         anv->mmio_coproc = devm_platform_ioremap_resource_byname(pdev, "ans");
>         if (IS_ERR(anv->mmio_coproc)) {
> --
> 2.43.0
>
>

