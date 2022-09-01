Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7E6EDA
	for <asahi@lists.linux.dev>; Thu,  1 Sep 2022 22:33:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2D5FC4347C
	for <asahi@lists.linux.dev>; Thu,  1 Sep 2022 22:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662071625;
	bh=JVBvlEBiOmHDg0DcOMfECbdzQXwhpcC54UdN/AtqjWo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZPVfMQ0a8z2yo7VG7Fxo5kVxNZ6K7rrfDo/aAlpY3aOAgCKGZL/5sYaYDVT2lsS9v
	 IMvV9Ysbn3Tpv9eXvaXih3f/on21G3SgnFEKTdc3rTpTDBtDjRohkzdpDjjIpudIn7
	 SBZem0lYwtAz5tmiVU4RnRhptT93mngtFZhreI1EHQlI9eSk9EgjuGVGI4sf1jzu43
	 b1ZYgRMRI5+kTJ6H9EK2yukdB/XwX0Ba3rPeh1BPAY92sJ7+/NOvlihI2mKsliPCTr
	 gPi5aN64izpfRJFyFwPa6OYwUQrl3KghiDKoTk+Uoc+ZEvMxpIkVtT5WpJlvDR4tIe
	 m4xZK2gZyKr4w==
Received: by mail-pj1-f52.google.com with SMTP id p8-20020a17090ad30800b001fdfc8c7567so6379313pju.1
        for <asahi@lists.linux.dev>; Thu, 01 Sep 2022 15:33:45 -0700 (PDT)
X-Gm-Message-State: ACgBeo1skzKX1Unwrtt1Y8S++EnhfrPSvqjTL9YFz5mhf/69yJ1s6RFR
	ehklU/tyfqy/7+FElWn0moRE6iaaXHc0PSKWPw==
X-Google-Smtp-Source: AA6agR42ASWP/CdkWAsB45KeALFYih+dn+yvzlUdsO7wBNb4Q0XNeVIFC9eif6EAMJZELzBQOqErTEHGgIdN4pieNj4=
X-Received: by 2002:a17:902:ef81:b0:174:445f:b88d with SMTP id
 iz1-20020a170902ef8100b00174445fb88dmr30127552plb.148.1662071625166; Thu, 01
 Sep 2022 15:33:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk> <E1oTkeH-003t9A-3K@rmk-PC.armlinux.org.uk>
 <426469c1-13cc-178b-4904-09439d7788e8@linaro.org> <YxDL+cAx9kkZRL8K@shell.armlinux.org.uk>
 <928ddeff-efac-920c-7bbf-dda35a942b93@linaro.org> <YxDOpCq0vIlt4VNa@shell.armlinux.org.uk>
 <2fedff34-6a20-f1ce-a756-2bd8671fcd52@linaro.org> <YxDWG5dmzErhKIXw@shell.armlinux.org.uk>
 <ef6c7248-1efa-5366-6bcd-900c5f10ccb2@linaro.org> <YxDiBFIn6artUOZm@shell.armlinux.org.uk>
In-Reply-To: <YxDiBFIn6artUOZm@shell.armlinux.org.uk>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 1 Sep 2022 17:33:31 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+GCKisAVA0AfE=yWJYy18mAGQ7rY1sKGYraXv-berNSg@mail.gmail.com>
Message-ID: <CAL_Jsq+GCKisAVA0AfE=yWJYy18mAGQ7rY1sKGYraXv-berNSg@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Hector Martin <marcan@marcan.st>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Sven Peter <sven@svenpeter.dev>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 1, 2022 at 11:47 AM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Thu, Sep 01, 2022 at 07:25:03PM +0300, Krzysztof Kozlowski wrote:
> > On 01/09/2022 18:56, Russell King (Oracle) wrote:
> > >
> > > 8<===
> > > From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
> > > Subject: [PATCH] dt-bindings: mfd: add binding for Apple Mac System Management
> > >  Controller
> > >
> > > Add a DT binding for the Apple Mac System Management Controller.
> > >
> > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> >
> > Yes, looks good.
> >
> > I won't add Reviewed-by tag, because I think it would confuse Patchwork,
> > so please send a v2 at some point.
>
> Thanks. Do you have any suggestions for patch 2? Should I merge the
> description in patch 2 into this file?
>
> The full dts for this series looks like this:
>
>                 smc: smc@23e400000 {
>                         compatible = "apple,t8103-smc", "apple,smc";
>                         reg = <0x2 0x3e400000 0x0 0x4000>,
>                                 <0x2 0x3fe00000 0x0 0x100000>;
>                         reg-names = "smc", "sram";
>                         mboxes = <&smc_mbox>;
>
>                         smc_gpio: gpio {
>                                 gpio-controller;
>                                 #gpio-cells = <2>;
>                         };
>                 };
>
> but the fuller version in the asahi linux tree looks like:
>
>                 smc: smc@23e400000 {
>                         compatible = "apple,t8103-smc", "apple,smc";
>                         reg = <0x2 0x3e400000 0x0 0x4000>,
>                                 <0x2 0x3fe00000 0x0 0x100000>;
>                         reg-names = "smc", "sram";
>                         mboxes = <&smc_mbox>;
>
>                         smc_gpio: gpio {
>                                 gpio-controller;
>                                 #gpio-cells = <2>;

Only 2 properties doesn't really need its own schema doc. However, I
would just move these to the parent node.

>                         };
>
>                         smc_rtc: rtc {
>                                 nvmem-cells = <&rtc_offset>;
>                                 nvmem-cell-names = "rtc_offset";
>                         };
>
>                         smc_reboot: reboot {
>                                 nvmem-cells = <&shutdown_flag>, <&boot_stage>,
>                                         <&boot_error_count>, <&panic_count>, <&pm_setting>;
>                                 nvmem-cell-names = "shutdown_flag", "boot_stage",
>                                         "boot_error_count", "panic_count", "pm_setting";

Not really much reason to split these up either because you can just
fetch the entry you want by name.

How confident are the asahi folks that this is a complete binding?

Rob
