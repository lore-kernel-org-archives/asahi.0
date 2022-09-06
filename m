Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7836713
	for <asahi@lists.linux.dev>; Tue,  6 Sep 2022 16:10:52 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-127dca21a7dso2046484fac.12
        for <asahi@lists.linux.dev>; Tue, 06 Sep 2022 09:10:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=0UoPNDaC8NCrfq0xjsW8qx2SIU/bt2Qiddj8DCUAP+M=;
        b=ree7ohK1g2nSkw7yhYFEeY3QjPt8ehlmiLCQLFFf4Ys2d1VxkXKqrxoLoqzY4duB+w
         axjOIsyih4MO8QEg2W1K3ltTWJFo3KqFTztnnxrMXGIODvfGK6EoZ8KxfHhUNRKJpudh
         iYlKzottDC4mT03C/M9uzlUWz6BxmsTT8z12j4Atq1gJGcSvgMEji387dA9Cv0DV5cHa
         ZnpbhQHBa2zV7cB53P2lSEWCQvqWXMg4u2FRKMXoelUv7JzzUz9V7raxZxu7KMpdcHEn
         TiSW+Yv3RahPSryzgFIRh6I2CFFVL4FjNWFIBdjCcK2grvy3UM774tBATjqaZUHFmadO
         UpiQ==
X-Gm-Message-State: ACgBeo31MKCGKPXarq2OpRFlf213/fefvDGfy/6DrhUp0W8g6oW0pz4n
	RSv+/oMoyfCzWJuYzFLf1w==
X-Google-Smtp-Source: AA6agR5Jt/pp6V/0cSJbLG/uZ3wRLl3rUFetLiWmtRsQju4iEwOlY/LWBZGhv3u72wd7Ebj6Z31rKA==
X-Received: by 2002:a05:6870:d354:b0:126:6b86:449d with SMTP id h20-20020a056870d35400b001266b86449dmr8005579oag.107.1662480651214;
        Tue, 06 Sep 2022 09:10:51 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id h6-20020a9d6406000000b00636f7059b27sm6062359otl.5.2022.09.06.09.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 09:10:50 -0700 (PDT)
Received: (nullmailer pid 618747 invoked by uid 1000);
	Tue, 06 Sep 2022 16:10:49 -0000
Date: Tue, 6 Sep 2022 11:10:49 -0500
From: Rob Herring <robh@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Mark Kettenis <mark.kettenis@xs4all.nl>, krzysztof.kozlowski@linaro.org, arnd@arndb.de, lee@kernel.org, linus.walleij@linaro.org, alyssa@rosenzweig.io, asahi@lists.linux.dev, brgl@bgdev.pl, marcan@marcan.st, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, sven@svenpeter.dev, krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
Message-ID: <20220906161049.GC534217-robh@kernel.org>
References: <928ddeff-efac-920c-7bbf-dda35a942b93@linaro.org>
 <YxDOpCq0vIlt4VNa@shell.armlinux.org.uk>
 <2fedff34-6a20-f1ce-a756-2bd8671fcd52@linaro.org>
 <YxDWG5dmzErhKIXw@shell.armlinux.org.uk>
 <ef6c7248-1efa-5366-6bcd-900c5f10ccb2@linaro.org>
 <YxDiBFIn6artUOZm@shell.armlinux.org.uk>
 <CAL_Jsq+GCKisAVA0AfE=yWJYy18mAGQ7rY1sKGYraXv-berNSg@mail.gmail.com>
 <d3cec3d22e464fa8@bloch.sibelius.xs4all.nl>
 <20220902172808.GB52527-robh@kernel.org>
 <YxcNLU+KGEolrdfT@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxcNLU+KGEolrdfT@shell.armlinux.org.uk>

On Tue, Sep 06, 2022 at 10:04:45AM +0100, Russell King (Oracle) wrote:
> On Fri, Sep 02, 2022 at 12:28:08PM -0500, Rob Herring wrote:
> > This one is actually pretty odd in that the child nodes don't have a 
> > compatible string which breaks the automagical probing.
> 
> I don't think that is necessarily true, and I don't think it's true in
> this case.

It is, because you are creating the devices in the driver rather than 
creating devices based on child nodes that exist.

> 
> The SMC core driver instructs the MFD core to create devices for the
> individual functional items:
> 
> static const struct mfd_cell apple_smc_devs[] = {
>         {
>                 .name = "macsmc-gpio",
>         },
>         {
>                 .name = "macsmc-hid",
>         },
>         {
>                 .name = "macsmc-power",
>         },
>         {
>                 .name = "macsmc-reboot",
>         },
>         {
>                 .name = "macsmc-rtc",
>         },
> };
> 
> Since MFD uses platform devices for these, they get all the normal
> functionality that these devices have, which include matching by
> device name ot the driver name, and udev events being appropriately
> triggered. As long as the platform drivers for these devices have the
> correct modalias lines, autoloading of the modules will work and the
> drivers will be correctly matched and probed.

Yes, and that's how MFD devices with no child nodes work. The difference 
is those get any DT info out of the parent node. Here you are presumably 
manually getting the child DT node you want for each driver.


> The Asahi kernel builds most of the platform support as modules,
> including these, so we know it works (if it didn't, then lots of
> module autoloading would be broken on non-DT platforms.)
> 
> > > Again the separate nodes are there because the RTC and the reboot
> > > functionality are logically separate and handled by different MFD
> > > sub-drivers in Linux.
> > 
> > It's really a question of whether the subset of functionality is going 
> > to get reused on its own or has its own resources in DT. MFD bindings 
> > are done both ways.
> 
> I think the current position on what to do about these is that everyone
> is looking for someone else to make a decision, and no one wants to!

I'm just looking for more information first.

> Firstly, I don't think that the number of properties in a node should
> have a bearing on the design of the DT binding - what should have a
> bearing is the logical partitioning of functionality.

It's not strictly about number of properties. Though nodes with only a 
compatible string is generally a red flag for me.

> Mark suggests that it would take six months for OpenBSD to transition to
> some other description - for example, if we merged the nodes.

The risk you take when using undocumented bindings...

> Hector says that MacOS's firmware description has the nodes merged, but
> their description is a mess.
> 
> The overall preference seems to be to keep the sub-nodes unless there
> is a strong technical reason not to.
> 
> The feeling I am getting from the review is that there doesn't seem to
> be a strong technical reason to merge the nodes - there are desires and
> preferences, but nothing concrete.
> 
> So at this point, I think it would make sense if I post a v2 with all
> the updates so far (sorry, given the long drawn out discussions on
> this, I've lost track of what changes have been made to the code, so
> I won't include a detailed change log.)

As I said elsewhere, sub-nodes is probably the right choice here. I 
think they need compatible strings in the child nodes, and addressing 
has to be sorted out which it seems may also break OpenBSD.

Rob
