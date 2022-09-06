Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5D04A24
	for <asahi@lists.linux.dev>; Tue,  6 Sep 2022 13:46:59 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id nc14so23381446ejc.4
        for <asahi@lists.linux.dev>; Tue, 06 Sep 2022 06:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=vES/lt0MXBWqXZjxjspNA4S3RuvGiNZSCJKY5IddJHM=;
        b=C5pTfv6sM7dHl/ZnXWKdbzOFx9dYouAyAn964q9bxDazB+7rxfx//WubrSOaVpJmAn
         I6a5/NcMdG4+i+MU/Eo05NNOSC4/+lF3v1MzdCyAYNfIrvGWqYiSozA+j2MWL5pK9bKX
         vo9kCHdhqAdN8c7Fr3rJdBrJuV3IXT1CO/b/00U9Vc61zhMpZR8qqVlDqRn3/8moCJ+H
         cFOiQ52fsA1q+Qn7QWNWBVPoj5xgnGtYKXxs4BmtX9t78iApa61XgsftkvnxpcKq22cQ
         Cr+9GqHyfJ5Hgfw/OLBW+gKMJWnNsxLK0jLEvl/us2x/uvG/fzDv2S5lQUx3ZJMRH4ag
         IhrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=vES/lt0MXBWqXZjxjspNA4S3RuvGiNZSCJKY5IddJHM=;
        b=IB/AouCk1M63fafZKzayRYdYmZWvc6EO49657l1Y24Spc6iNfR7woGPsveGdS33fM0
         /LyO3Yg2ks7tfeazSKV7l0epogAEYw406hKmV+2wSv8C+DCZWwk/PkNMOy1Pnl8DmQd8
         qR7gOpF3jVs5fB2Vq+lXaQ9xC/uMIKCu6lQ+o4W9Wjlj028ymgFUPR7jU8N0Sn3tX0WU
         thx3SvFUoHvc4K2SPTtVEysBsjBGjwQbeo5rKB9vaZYNqMD5gIlUu0B0nRjpYwa/1hGm
         M/CIYnGn5DBwCWVM7B8fbr9HtcVO7qQb9xrV/Au1jT0LFWZkVYgT13mkM3Z51VOAwjV8
         7F/Q==
X-Gm-Message-State: ACgBeo2pZ5TMj2cvDO4I49/y0Qyh7qPj37JK+zI5XlUzhO5LzKd7DH+a
	sg42mpqpj4EjKoSyVwoHCaax14GGBr5MmkprL5ZSlw==
X-Google-Smtp-Source: AA6agR5PA0CgGPmgOwDTBTALSmyX+y6DwXy04Ax5g0iL8EPRemFjppQ8iC8xEmVJmovk2uEs5CvbEyl93SGawzLhgRs=
X-Received: by 2002:a17:906:58c8:b0:6fe:91d5:18d2 with SMTP id
 e8-20020a17090658c800b006fe91d518d2mr40054447ejs.190.1662472017364; Tue, 06
 Sep 2022 06:46:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YxDL+cAx9kkZRL8K@shell.armlinux.org.uk> <928ddeff-efac-920c-7bbf-dda35a942b93@linaro.org>
 <YxDOpCq0vIlt4VNa@shell.armlinux.org.uk> <2fedff34-6a20-f1ce-a756-2bd8671fcd52@linaro.org>
 <YxDWG5dmzErhKIXw@shell.armlinux.org.uk> <ef6c7248-1efa-5366-6bcd-900c5f10ccb2@linaro.org>
 <YxDiBFIn6artUOZm@shell.armlinux.org.uk> <CAL_Jsq+GCKisAVA0AfE=yWJYy18mAGQ7rY1sKGYraXv-berNSg@mail.gmail.com>
 <d3cec3d22e464fa8@bloch.sibelius.xs4all.nl> <20220902172808.GB52527-robh@kernel.org>
 <YxcNLU+KGEolrdfT@shell.armlinux.org.uk> <d3cecee5edd24f67@bloch.sibelius.xs4all.nl>
 <CACRpkdaSRcczEF8QZ4aO+-HDVS+n-8MXvn6ysnjJfUEabwUJ=w@mail.gmail.com>
 <909bb4e7-5bd2-2903-5bba-87ae37f3448a@marcan.st> <CACRpkdajhjpMzjMooDduu0jxrp0uDNJ90VfBPpHx+P14cFfskA@mail.gmail.com>
 <5b75dc7e-5337-73eb-450f-b72f479793c4@marcan.st>
In-Reply-To: <5b75dc7e-5337-73eb-450f-b72f479793c4@marcan.st>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 6 Sep 2022 15:46:45 +0200
Message-ID: <CACRpkdYkL36Zbm6BWM7N_y=xwgkWA54q7uiFn7ZOGrfM-4KY9w@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
To: Hector Martin <marcan@marcan.st>
Cc: Mark Kettenis <mark.kettenis@xs4all.nl>, 
	"Russell King (Oracle)" <linux@armlinux.org.uk>, robh@kernel.org, krzysztof.kozlowski@linaro.org, 
	arnd@arndb.de, lee@kernel.org, alyssa@rosenzweig.io, asahi@lists.linux.dev, 
	brgl@bgdev.pl, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, sven@svenpeter.dev, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 6, 2022 at 3:28 PM Hector Martin <marcan@marcan.st> wrote:
> On 06/09/2022 20.57, Linus Walleij wrote:
> > On Tue, Sep 6, 2022 at 1:36 PM Hector Martin <marcan@marcan.st> wrote:

> > This comes from the FDT background in OpenFirmware, and there is
> > definitely a timeline perspective (also called "waterfall model") in that
> > line of thinking: a DT is written that describes the hardware and flashed
> > into the BIOS and never changed, then the operating system is
> > implemented at a later point. This is how e.g. the PC ACPI BIOS tables
> > are also thinking about themselves.
>
> Yes, but again, that only makes sense from the point of view of
> describing hardware that exists, is useful, and could be used by the OS.
>
> For any given platform X, if platform X does not use the secondary GPIO
> controller for any service describable in the DT, then there is no point
> in describing that GPIO controller. Same way ACPI tables do not describe
> every single physical GPIO available on a platform, just whatever is
> used by the AML.

Good point. I don't know what ambition DT should have here.
If there is a discrete component on I2C for example, we tend to
describe it fully, this kind of stuff with misc "dark silicon" didn't
exist when DT was first conceived.

> If some day we find a use for those GPIOs, that would require a DT
> change *anyway*, to describe that usage, and the controller could be
> described then (we did something like that, using a GPIO that Apple
> doesn't, for the interim display-backlight power control support, though
> that is a temporary hack that will go away). Heck, we don't even know
> what these GPIOs are connected to right now!
>
> Ultimately, we're working with a reverse engineered platform here, and
> DTs will inevitaby be incremental.
(...)

That's OK, I think the patch series is good enough as it is and should
be merged, so I have added my Reviewed-by. I think the world
is a better place with support for Apple silicon being developed
in-tree.

> I'm a lot more
> interested in getting bindings upstreamed ASAP (so we can start
> guaranteeing no backwards-compat breaks, which is important to avoid
> outright breakage) than I am in trying to be exhaustive up front with
> device instances. It's perfectly fine to say that users have to upgrade
> both their DTs and kernels to get newer hardware support, on these
> platforms.

I agree.

Yours,
Linus Walleij
