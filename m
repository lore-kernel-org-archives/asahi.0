Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12B8320C
	for <asahi@lists.linux.dev>; Sat, 17 Sep 2022 17:23:37 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id kr11so9804620ejc.8
        for <asahi@lists.linux.dev>; Sat, 17 Sep 2022 10:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Zsw1dVk71Y37l8JEvNAuX0YZyn6br/vd9BwO/CtaCpA=;
        b=lfplLZg6IOl95pmIuhOQ9UVSvddGzsFLs12ktjbmnDrhouAK7y16jHdEXAl+9Blri/
         WF5ZOKoGT/fGWjg04T2xQeSaG0nGWQgQQfLoy5hvTYq60i6GlOG4UhM7jPGI98lcFSBG
         oN7mnoMjjfKU3N7MoZtbFlejWcRlSL1rjYRqj7A54UaaUCormc2cxLN4W2tEOQlNT5NY
         /77M+UAz6mEzLcMdcB1UC3f3IEsGKdDGsw7GZYY/XAg/Fx+fUfVChvVQbjFKnDazb3yM
         qojUGe1ULI5CP1nVATTnXhpc9T4XOwInJiPWDUb1vx8e0+tK7xDBk1En0z9hDaMXyB7i
         5T1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Zsw1dVk71Y37l8JEvNAuX0YZyn6br/vd9BwO/CtaCpA=;
        b=lssR7G5YfB8w9WuE3Ml2JIVgTLrsgpeFAr4DlJsgN3jKwFrwXVbUhX4sCUCYc3Ria+
         E8sAMn/TpvD4sF3j8NZAQxvNgi0U6mswqMxZ3OkchES7Uq3IpdLkAl3Yvf1F6rSvBP8c
         LpfdrN1MotzaTA54ZKi0IybxqPbW0tmtexSzdOGvkQf2RLuNLoZgmPzhwP+p5TOqrrpr
         6AueaQ/SyWUTNcIS5fz0raEApi95CsjlO1tevxBNbscg52JoOUH4s4wnW/aBlF0/8jBN
         TA4HYzzzQuh6Mxo5VS5waBi6T1lsy76cHr4L3VznoWQ4xTw8EPSnWYTquR13I/NH82oQ
         o5jA==
X-Gm-Message-State: ACrzQf2jeXts4J1rr/dWq3wfIiaNfG70Nqt+Lz27lYZcvUplGwp/LY5z
	d/lynawfhVdlvlYIs1f9FVa/wXoXBP7Xb4aBBL+AWjPe
X-Google-Smtp-Source: AMsMyM4PQJbQ69yQxXQ/pqdcZjezJkm4lcSafdu8GcryyVhalMrhpgC5BTQTnYOifhX/lgTaJR44rgDD1ZbIvHOHx9E=
X-Received: by 2002:a17:907:a0c6:b0:77d:7ad3:d05f with SMTP id
 hw6-20020a170907a0c600b0077d7ad3d05fmr7278631ejc.734.1663435415941; Sat, 17
 Sep 2022 10:23:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YyGR+z5nGPh66LdY@shell.armlinux.org.uk> <19191d4d-e8a8-4319-bf7b-d5301a792a21@www.fastmail.com>
 <YyWtz4u5fcxQAB4R@shell.armlinux.org.uk> <b601263b-8363-432a-b6d7-504fabd37fef@www.fastmail.com>
 <YyWzlUnJds0Y1igM@shell.armlinux.org.uk> <CABb+yY0Bo3hs51KYTKvSYGHbzcO=p_s59fm=apevudxz5x3=Ew@mail.gmail.com>
 <YyXzaDIkCsjUkEcD@shell.armlinux.org.uk>
In-Reply-To: <YyXzaDIkCsjUkEcD@shell.armlinux.org.uk>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sat, 17 Sep 2022 12:23:24 -0500
Message-ID: <CABb+yY1ZVb1TceGZWokfxdm46-zSjhq149zzbxWc0xCV+aQ53w@mail.gmail.com>
Subject: Re: [PATCH 0/3] apple rtkit: add support for atomic operations
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, 
	Hector Martin <marcan@marcan.st>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 17, 2022 at 11:18 AM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Sat, Sep 17, 2022 at 11:07:13AM -0500, Jassi Brar wrote:
> > On Sat, Sep 17, 2022 at 6:46 AM Russell King (Oracle)
> > <linux@armlinux.org.uk> wrote:
> > >
> > > On Sat, Sep 17, 2022 at 01:33:45PM +0200, Sven Peter wrote:
> > > > > On Sat, Sep 17, 2022 at 12:42:30PM +0200, Sven Peter wrote:
> > > > >> Hi,
> > > > >>
> > > > >> On Wed, Sep 14, 2022, at 10:34, Russell King (Oracle) wrote:
> > > > >> > Hi,
> > > > >> >
> > > > >> > This series adds support to the Apple rtkit for atomic messaging,
> > > > >> > which will be necessary for SMC support on these platforms.
> > > > >> >
> > > > >> > SMC support requires a bit of rework after recent review comments,
> > > > >> > so I'm sending this separately in the hope that we can move forward
> > > > >> > with upstream kernels.
> > > > >>
> > > > >> Maybe I misremember or maybe you forgot to pick up my reviewed-by tags
> > > > >> for the mailbox commits.
> > > > >
> > > > > It's the first time I've sent the mailbox commits after Hector
> > > > > mentioned them.
> > > >
> > > > There are just too many things in flight right now which is part of the
> > > > reason I'm happy you're trying to get all this upstream!
> > > >
> > > > https://lore.kernel.org/asahi/YxYoW2IZFK%2FJdKgH@shell.armlinux.org.uk/
> > >
> > > Hmm, I'd completely forgotten that I've posted it previously! Hmm,
> > > no response from Jassi on the previous posting despite nothing no
> > > action being required on the patches. Jassi?
> > >
> > Usually I let patches roast in public until rc7 but I sensed other
> > parts of apple support might depend on these.
> > So I picked patches 1 & 2 from this series yesterday.
> >  https://git.linaro.org/landing-teams/working/fujitsu/integration.git/log/?h=mailbox-for-next
>
> Thanks!
>
> Now I need to work out how we get patch 3 into mainline - there appears
> to be no maintainer for drivers/soc, so unless something happens, it's
> not going to be picked up...
>
If nothing else works, I can pick it as a one off case.

cheers.
