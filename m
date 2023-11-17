Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C7A1A729
	for <asahi@lists.linux.dev>; Fri, 17 Nov 2023 10:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dx8JS3Aq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700217704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S0DHWe0PlgOeEwze+kKHsskavc+r58IDDlhHIcWPq4Q=;
	b=dx8JS3Aq9ApWrLFiqiiHrKMtp71/TNKxLbX72JtaIbqahmGSJ7FwMxlWIpWArzGyxQ2KbZ
	4RongSLwCil+1XPisXBxS+jyPmst7tsOLEfiCLTSvTYrbgy6AHRz8mT6evT2Lzf5h+BeBD
	gws69ZU4NEKPdc95/6qA74tmkorUAG4=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-495-0zj8mr5ePt-9CASwuE1RPQ-1; Fri, 17 Nov 2023 05:41:41 -0500
X-MC-Unique: 0zj8mr5ePt-9CASwuE1RPQ-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-28043db47ebso1976848a91.1
        for <asahi@lists.linux.dev>; Fri, 17 Nov 2023 02:41:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700217700; x=1700822500;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S0DHWe0PlgOeEwze+kKHsskavc+r58IDDlhHIcWPq4Q=;
        b=hdMOK/78Kd6QjilkxRAS/b/jsT+kKVkhPcutmIwC9IsEygasgt9FCdTFQuZmNyp3F3
         kuEfTJ5c55Bd/0yg0BD451N/i0ivoLp6UOlNH76xulyZCL3MfAloXaYFzmwNhioUBMsN
         W18oaflFAcUE0Hc4j+j0TJpqAYIhZo2ucedRy9escDFt/6tsnY6vWKcHn0/OHPCx0IlN
         F5o8GQ/wrE6nFmsamXL9daoE18XA1xENpLJ6rvqDlVrmmaaVpC6a+Hk9uKJh5Kbm7Lsa
         N/24V4tgVuDC/n6ioAmgi7NDN4KhXNlCbes+s5svDOKfXWT9AbvcCudL+DLvaME9dg9e
         lTDg==
X-Gm-Message-State: AOJu0YyxcrEQ95VGIAjfoZDbiFXE7UyK5n6bVkZ4L7jSQL1+5xAZ0hHX
	Tb+mOoqNZddC5YwL1v3vY2eG7UbraNFn4b0dr9cnfqSbT9gq7CdiwOxjTdgW60Ku03gnJ1rBUy1
	gw9Hu61YHHPouoEQFmvAEpxTKZiHbwwM=
X-Received: by 2002:a17:90b:1d0c:b0:280:3911:adfe with SMTP id on12-20020a17090b1d0c00b002803911adfemr15715912pjb.39.1700217699942;
        Fri, 17 Nov 2023 02:41:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6J68BIrvn5CZSlpJZSopT7qMWbenDuyCol5ESBNwFJLL9bN6k6d3CO98T35n7sS2GFVV3Soh28IxqitTAMiw=
X-Received: by 2002:a17:90b:1d0c:b0:280:3911:adfe with SMTP id
 on12-20020a17090b1d0c00b002803911adfemr15715896pjb.39.1700217699557; Fri, 17
 Nov 2023 02:41:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231116160235.2708131-1-neal@gompa.dev> <20231116160235.2708131-2-neal@gompa.dev>
In-Reply-To: <20231116160235.2708131-2-neal@gompa.dev>
From: Eric Curtin <ecurtin@redhat.com>
Date: Fri, 17 Nov 2023 10:41:02 +0000
Message-ID: <CAOgh=FxPJay6dw0-O8Kk85oO2tAze7kSo_jWuF5gmA1MAh1Row@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] btrfs-progs: mkfs: Enforce 4k sectorsize by default
To: Neal Gompa <neal@gompa.dev>
Cc: Linux BTRFS Development <linux-btrfs@vger.kernel.org>, Anand Jain <anand.jain@oracle.com>, 
	Qu Wenruo <quwenruo.btrfs@gmx.com>, Qu Wenruo <wqu@suse.com>, David Sterba <dsterba@suse.cz>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Davide Cavalca <davide@cavalca.name>, Jens Axboe <axboe@fb.com>, Asahi Lina <lina@asahilina.net>, 
	Asahi Linux <asahi@lists.linux.dev>, Josef Bacik <josef@toxicpanda.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 Nov 2023 at 16:10, Neal Gompa <neal@gompa.dev> wrote:
>
> We have had working subpage support in Btrfs for many cycles now.
> Generally, we do not want people creating filesystems by default
> with non-4k sectorsizes since it creates portability problems.
>
> Signed-off-by: Neal Gompa <neal@gompa.dev>
>
> Reviewed-by: Anand Jain <anand.jain@oracle.com>
> Reviewed-by: Qu Wenruo <wqu@suse.com>
> Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Makes sense to me!

Reviewed-by: Eric Curtin <ecurtin@redhat.com>

Is mise le meas/Regards,

Eric Curtin

> ---
>  Documentation/Subpage.rst    | 17 +++++++++--------
>  Documentation/mkfs.btrfs.rst | 13 +++++++++----
>  mkfs/main.c                  |  2 +-
>  3 files changed, 19 insertions(+), 13 deletions(-)
>
> diff --git a/Documentation/Subpage.rst b/Documentation/Subpage.rst
> index c762b6a3..1655ae7e 100644
> --- a/Documentation/Subpage.rst
> +++ b/Documentation/Subpage.rst
> @@ -9,18 +9,19 @@ to the exactly same size of the block and page. On x86_64 this is typically
>  pages, like 64KiB on 64bit ARM or PowerPC. This means filesystems created
>  with 64KiB sector size cannot be mounted on a system with 4KiB page size.
>
> -While with subpage support systems with 64KiB page size can create
> -and mount filesystems with 4KiB sectorsize.  This still needs to use option "-s
> -4k" option for :command:`mkfs.btrfs`.
> +Since v6.7, filesystems are created with a 4KiB sectorsize by default,
> +though it remains possible to create filesystems with other page sizes
> +(such as 64KiB with the "-s 64k" option for :command:`mkfs.btrfs`). This
> +ensures that new filesystems are compatible across other architecture
> +variants using larger page sizes.
>
>  Requirements, limitations
>  -------------------------
>
> -The initial subpage support has been added in v5.15, although it's still
> -considered as experimental, most features are already working without problems.
> -On a 64KiB page system filesystem with 4KiB sectorsize can be mounted and used
> -as usual as long as the initial mount succeeds. There are cases a mount will be
> -rejected when verifying compatible features.
> +The initial subpage support has been added in v5.15. Most features are
> +already working without problems. On a 64KiB page system, a filesystem with
> +4KiB sectorsize can be mounted and used as long as the initial mount succeeds.
> +Subpage support is used by default for systems with a non-4KiB page size since v6.7.
>
>  Please refer to status page of :ref:`status-subpage-block-size` for
>  compatibility.
> diff --git a/Documentation/mkfs.btrfs.rst b/Documentation/mkfs.btrfs.rst
> index 7e23b9f6..be4f49cb 100644
> --- a/Documentation/mkfs.btrfs.rst
> +++ b/Documentation/mkfs.btrfs.rst
> @@ -122,10 +122,15 @@ OPTIONS
>  -s|--sectorsize <size>
>          Specify the sectorsize, the minimum data block allocation unit.
>
> -        The default value is the page size and is autodetected. If the sectorsize
> -        differs from the page size, the created filesystem may not be mountable by the
> -        running kernel. Therefore it is not recommended to use this option unless you
> -        are going to mount it on a system with the appropriate page size.
> +        By default, the value is 4KiB, but it can be manually set to match the
> +        system page size. However, if the sector size is different from the page
> +        size, the resulting filesystem may not be mountable by the current
> +        kernel, apart from the default 4KiB. Hence, using this option is not
> +        advised unless you intend to mount it on a system with the suitable
> +        page size.
> +
> +        .. note::
> +                Versions prior to 6.7 set the sectorsize matching to the page size.
>
>  -L|--label <string>
>          Specify a label for the filesystem. The *string* should be less than 256
> diff --git a/mkfs/main.c b/mkfs/main.c
> index d984c995..0570c8f8 100644
> --- a/mkfs/main.c
> +++ b/mkfs/main.c
> @@ -1384,7 +1384,7 @@ int BOX_MAIN(mkfs)(int argc, char **argv)
>         }
>
>         if (!sectorsize)
> -               sectorsize = (u32)sysconf(_SC_PAGESIZE);
> +               sectorsize = (u32)SZ_4K;
>         if (btrfs_check_sectorsize(sectorsize))
>                 goto error;
>
> --
> 2.41.0
>
>

