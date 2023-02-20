Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FACA7F6
	for <asahi@lists.linux.dev>; Mon, 20 Feb 2023 05:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676869282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Iz5/XJcUnQF/LFQxvol9TqG2b7RW1QrWjYsgCVHX3XQ=;
	b=EqT5ObQPLlnd6mT8wY7Kf8bHte8p0yQTWsAm62O+tXO0LC5+aTXSvoyi8mEb7xok63Yicy
	LBZNcVwWPspO5e5cd0TXNdUE6wvHE7SORprQ4/6K39+R8Nhoknch89yHvpHF39jKdKgegH
	k4Ah2rOJ/da1vxSoikkMPfUOraQ2Af0=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-91-fdSm1zEdPDCG6zIiFRw3Bw-1; Mon, 20 Feb 2023 00:00:42 -0500
X-MC-Unique: fdSm1zEdPDCG6zIiFRw3Bw-1
Received: by mail-vk1-f200.google.com with SMTP id z1-20020a1f4c01000000b004018b363debso439427vka.19
        for <asahi@lists.linux.dev>; Sun, 19 Feb 2023 21:00:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iz5/XJcUnQF/LFQxvol9TqG2b7RW1QrWjYsgCVHX3XQ=;
        b=NU0tPcMdf7BEo77acb9P2dm6w2PF/SvrqHXcCBfyFdLDCz556vBd+ewLtxBg1sVzXt
         yy6rXCIX0ewfJL6v0Tm+tbDy1i8uGM5GTASCfTg/NR8yi795Q2uU/EN4c7KQj7ypI0Q/
         xL1TRcsOEe0lfmAaIIMovMpb6XgajY4tHNJm5pVvrEisTKOrvsBgzpkiwJr/lWoJcu3K
         2MKWlro61jwyCmX9oDN/qi6EucmeOVhV1be8cO72IxZx1ZERzCarWabUTpCzHkSPqjy5
         BSWJhKzfZMv87jQr2Kn4agewP4HmRT7Exo/4o/sZ5uaj+leSntLKzyR1JF9YotAcr2D1
         LvnA==
X-Gm-Message-State: AO0yUKWsdJDGkHIvEMuHLf5S6eikGWxfBzzQrZ44RgXRE3ySr28PlU/L
	WRwKVqnTnGnhdmpVgeD4xqyHjK1g0bPvtZK+Jr6IXVsnsDyqkE6w/P8Bl0e50EZ2I2DUln82SmB
	J3/BBUEcQYqoAePc6QL8Vjgu9NiEtabs=
X-Received: by 2002:a05:6102:f0a:b0:411:bd2e:11ac with SMTP id v10-20020a0561020f0a00b00411bd2e11acmr165952vss.75.1676869241593;
        Sun, 19 Feb 2023 21:00:41 -0800 (PST)
X-Google-Smtp-Source: AK7set9f9ox6vr3CX95NfKEGX65cBproFKTgZSzrIfnLLXYRXGGY0eODN/Gl2kUycvwizSjQfY+ldPdK2BDBA0MyKSw=
X-Received: by 2002:a05:6102:f0a:b0:411:bd2e:11ac with SMTP id
 v10-20020a0561020f0a00b00411bd2e11acmr165950vss.75.1676869241338; Sun, 19 Feb
 2023 21:00:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230217141059.392471-1-nick.alcock@oracle.com> <20230217141059.392471-12-nick.alcock@oracle.com>
In-Reply-To: <20230217141059.392471-12-nick.alcock@oracle.com>
From: Eric Curtin <ecurtin@redhat.com>
Date: Mon, 20 Feb 2023 05:00:25 +0000
Message-ID: <CAOgh=Fyak7mxqva0qkUtrqBnsBbhMtP+AsHpOz3TNhwp4wPaAQ@mail.gmail.com>
Subject: Re: [PATCH 11/24] kbuild, soc: apple: apple-pmgr-pwrstate: remove
 MODULE_LICENSE in non-modules
To: Nick Alcock <nick.alcock@oracle.com>
Cc: mcgrof@kernel.org, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Philipp Zabel <p.zabel@pengutronix.de>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Feb 2023 at 14:20, Nick Alcock <nick.alcock@oracle.com> wrote:
>
> Since commit 8b41fc4454e ("kbuild: create modules.builtin without
> Makefile.modbuiltin or tristate.conf"), MODULE_LICENSE declarations
> are used to identify modules. As a consequence, uses of the macro
> in non-modules will cause modprobe to misidentify their containing
> object file as a module when it is not (false positives), and modprobe
> might succeed rather than failing with a suitable error message.
>
> So remove it in the files in this commit, none of which can be built as
> modules.
>
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> Suggested-by: Luis Chamberlain <mcgrof@kernel.org>
> Cc: Luis Chamberlain <mcgrof@kernel.org>
> Cc: linux-modules@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
> Cc: Hector Martin <marcan@marcan.st>
> Cc: Sven Peter <sven@svenpeter.dev>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: asahi@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---

Reviewed-by: Eric Curtin <ecurtin@redhat.com>

Is mise le meas/Regards,

Eric Curtin

>  drivers/soc/apple/apple-pmgr-pwrstate.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/soc/apple/apple-pmgr-pwrstate.c b/drivers/soc/apple/apple-pmgr-pwrstate.c
> index e1122288409a..2c15474c7b53 100644
> --- a/drivers/soc/apple/apple-pmgr-pwrstate.c
> +++ b/drivers/soc/apple/apple-pmgr-pwrstate.c
> @@ -319,6 +319,5 @@ static struct platform_driver apple_pmgr_ps_driver = {
>
>  MODULE_AUTHOR("Hector Martin <marcan@marcan.st>");
>  MODULE_DESCRIPTION("PMGR power state driver for Apple SoCs");
> -MODULE_LICENSE("GPL v2");
>
>  module_platform_driver(apple_pmgr_ps_driver);
> --
> 2.39.1.268.g9de2f9a303
>
>

