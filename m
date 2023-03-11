Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD937B
	for <asahi@lists.linux.dev>; Sat, 11 Mar 2023 14:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678543838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rI9UkkY/zqKs0y6gyqXwPg+4g7Xn+4IOJ0Nvb47KScw=;
	b=V67J+zgaNf1GQq8hl3ydDDR2LriCRhPkAYfKN6uuWP+XATDgSyu8xWspsgFCSxNp/PLBVO
	oPVgdj6kOapQSjxCKEgKDxeeFBgufr2/3GAh2mA5evx/ECnZHd3nG3q6MEPCumYv5IYb2V
	BrOPcjtAs4740p1LdmY3JER3t8RRi7o=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-328--00nnRGJNfSkyGRzWc_4NA-1; Sat, 11 Mar 2023 09:10:32 -0500
X-MC-Unique: -00nnRGJNfSkyGRzWc_4NA-1
Received: by mail-vs1-f71.google.com with SMTP id o7-20020a67fc07000000b0041ea097b2ebso2697896vsq.10
        for <asahi@lists.linux.dev>; Sat, 11 Mar 2023 06:10:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678543831;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rI9UkkY/zqKs0y6gyqXwPg+4g7Xn+4IOJ0Nvb47KScw=;
        b=TBOxrQj8O+dboMJg1UFMtJT4VuTcBEJhXJa57ZdPuLVxJiZgfcoTI4+R5NwF0M/2UJ
         uxBqRnyLg+1FmQNcI13YC/6fkXktCrk1CY5JcwXgXgzv6mu4n3Lncts79HzT1GOmxXw7
         SUMrmvbcQR+t+QJJP0YRci0zHiJhNtAJYZ348f4dan9ncaloECoxfzUhuEElz0UuWZMW
         BuVjZ4P4N4FQHb9N0K+OW8nNB1I+F8eM6e70kKbvWLAbdjktC6Kt1rTLdj0TLAIUbnY3
         rVT9Re69ny6x8AEqXjsDxVRzkNj3B6wUIR3QPOLy30rcfOlnpj3MeQz2Dj2wucEgUEre
         s3ig==
X-Gm-Message-State: AO0yUKXj9Eg52RrGvGtNTBzHE/eZpRq0EcpASzsXa17gmc0K+Slg/irw
	Rhy3AWhEfjRLpL5JD7/msgsx8OaOMDHRVxt5VWHTMMn1Mfzh19eK7PkMD8tYVCQCMHESvRuWUyp
	ETZO2GRvhjEzXTAd2VDiNvT0greXJPes=
X-Received: by 2002:a9f:3001:0:b0:68b:817b:eec8 with SMTP id h1-20020a9f3001000000b0068b817beec8mr18498518uab.0.1678543831517;
        Sat, 11 Mar 2023 06:10:31 -0800 (PST)
X-Google-Smtp-Source: AK7set8tL22Z64GFZQlBETeAIXfNC/NFYd/MWg33mB4oH3lVXRGgxR03Dz5LsWIgpcSED5a84XZH6Ovr3dXVwTdKMzQ=
X-Received: by 2002:a9f:3001:0:b0:68b:817b:eec8 with SMTP id
 h1-20020a9f3001000000b0068b817beec8mr18498509uab.0.1678543831274; Sat, 11 Mar
 2023 06:10:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230311133453.63246-1-sven@svenpeter.dev>
In-Reply-To: <20230311133453.63246-1-sven@svenpeter.dev>
From: Eric Curtin <ecurtin@redhat.com>
Date: Sat, 11 Mar 2023 14:10:15 +0000
Message-ID: <CAOgh=FydD7Or4KBCHaQ-SyRFKx3rBeft1abVjMUMBxvuQbHMjg@mail.gmail.com>
Subject: Re: [PATCH] PCI: apple: Initialize pcie->nvecs before using it
To: Sven Peter <sven@svenpeter.dev>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 11 Mar 2023 at 13:41, Sven Peter <sven@svenpeter.dev> wrote:
>
> apple_pcie_setup_port computes ilog2(pcie->nvecs) to setup the number of
> MSIs available for each port. It is however called before apple_msi_init
> which actually initializes pcie->nvecs.
> Luckily, pcie->nvecs is part of kzalloc-ed structure and thus
> initialized as zero. ilog2(0) happens to be 0xffffffff which then just
> configures more MSIs in hardware than we actually have. This doesn't
> break anything because we never hand out those vectors.
> Let's swap the order of the two calls so that we use the correctly
> initialized value.
>
> Fixes: 476c41ed4597 ("PCI: apple: Implement MSI support")
> Signed-off-by: Sven Peter <sven@svenpeter.dev>

Reviewed-by: Eric Curtin <ecurtin@redhat.com>

Is mise le meas/Regards,

Eric Curtin

> ---
>  drivers/pci/controller/pcie-apple.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index 66f37e403a09..8b7b084cf287 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -783,6 +783,10 @@ static int apple_pcie_init(struct pci_config_window *cfg)
>         cfg->priv = pcie;
>         INIT_LIST_HEAD(&pcie->ports);
>
> +       ret = apple_msi_init(pcie);
> +       if (ret)
> +               return ret;
> +
>         for_each_child_of_node(dev->of_node, of_port) {
>                 ret = apple_pcie_setup_port(pcie, of_port);
>                 if (ret) {
> @@ -792,7 +796,7 @@ static int apple_pcie_init(struct pci_config_window *cfg)
>                 }
>         }
>
> -       return apple_msi_init(pcie);
> +       return 0;
>  }
>
>  static int apple_pcie_probe(struct platform_device *pdev)
> --
> 2.25.1
>
>

