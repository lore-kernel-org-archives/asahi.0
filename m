Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CC17C
	for <asahi@lists.linux.dev>; Sat, 17 Sep 2022 16:07:26 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id lc7so55725568ejb.0
        for <asahi@lists.linux.dev>; Sat, 17 Sep 2022 09:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=HXhHTXR6AXeVkgCKHHUE8tzYQH29u4Ru0s+xmvHSENo=;
        b=RCEH1jpOwhK+fxs8PxfM9tB++yktORRyyVi1HY6rhnhR3gu20KAwBVAnUKFTyzYWhk
         rI3LVTtbaRTGbgGm/zHLvPGpi7RSwQFg8LZGGkLrIeQ6V3XE8R5jJWca8BJdL2WO5iep
         M6oEb8K02b8AfZrGrccbjrWyuCasT9vUi4GfyJu2j1w9EoaTWuxYFG7voc2CulhcJcpE
         ohYTY5+poyiUUERJGXejdYbyu5JkwnQ7FAgheNAbh7nW7i6aPhnq0HfjsPBGrqtlgJ8O
         Ic4FtzHgzPxchflVMUHa+ySX8ZzjtpFRPPuYWkTyZr/jN92TUxok7snokpFt1viphfoJ
         FnUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=HXhHTXR6AXeVkgCKHHUE8tzYQH29u4Ru0s+xmvHSENo=;
        b=foTE/fYA2WI/IPOgOmdK6D5GrA6UqdvarfClOrZFGmrfUSJk3Gtrdf57kPB+kzyZO9
         0diQGhux0VZNcBk2xZebmyT4cOSHySRhwoBgT7lzqzyxhElVSxcudtWZ0r+IqLh0+zEB
         0OdO3OR1H3cFEjBINGVnE82z1cVV5/kGg/XxeKWP2rpLQlOEY2RBHmrPD9DIXcbmKEsS
         dsHT78UnSatU7n7wlHjyfsrd5KLq6bkoOFD5L7qHffez96AtYW2DHdgMQMf6s9ZfX2v7
         wvnROG17e6zgAW71fqsbfMREeZHJy52Z1G8Ng1CcWP7RsuznMTUBoJPo5SoSIqyG7fCb
         J8yA==
X-Gm-Message-State: ACrzQf2UM5SAmGe3hEdImYLJEN4HMmr4M6PjqODKnUoq7fSUkKYfKG8c
	77qC+qf8P/U2eHEbc/c3mgs5GE9SKS7/vcJobPA=
X-Google-Smtp-Source: AMsMyM4e1Noge/d1e5W5x6EkKKQTaPBojKfQ5+xCeBrX05ECBYwIa9awUsDvBZeWCCPOwQsiHOMx9E5w4QdBiqF0PBI=
X-Received: by 2002:a17:907:97d4:b0:77c:99cc:2d6f with SMTP id
 js20-20020a17090797d400b0077c99cc2d6fmr7171424ejc.363.1663430845035; Sat, 17
 Sep 2022 09:07:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YyGR+z5nGPh66LdY@shell.armlinux.org.uk> <19191d4d-e8a8-4319-bf7b-d5301a792a21@www.fastmail.com>
 <YyWtz4u5fcxQAB4R@shell.armlinux.org.uk> <b601263b-8363-432a-b6d7-504fabd37fef@www.fastmail.com>
 <YyWzlUnJds0Y1igM@shell.armlinux.org.uk>
In-Reply-To: <YyWzlUnJds0Y1igM@shell.armlinux.org.uk>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sat, 17 Sep 2022 11:07:13 -0500
Message-ID: <CABb+yY0Bo3hs51KYTKvSYGHbzcO=p_s59fm=apevudxz5x3=Ew@mail.gmail.com>
Subject: Re: [PATCH 0/3] apple rtkit: add support for atomic operations
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, 
	Hector Martin <marcan@marcan.st>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 17, 2022 at 6:46 AM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Sat, Sep 17, 2022 at 01:33:45PM +0200, Sven Peter wrote:
> > > On Sat, Sep 17, 2022 at 12:42:30PM +0200, Sven Peter wrote:
> > >> Hi,
> > >>
> > >> On Wed, Sep 14, 2022, at 10:34, Russell King (Oracle) wrote:
> > >> > Hi,
> > >> >
> > >> > This series adds support to the Apple rtkit for atomic messaging,
> > >> > which will be necessary for SMC support on these platforms.
> > >> >
> > >> > SMC support requires a bit of rework after recent review comments,
> > >> > so I'm sending this separately in the hope that we can move forward
> > >> > with upstream kernels.
> > >>
> > >> Maybe I misremember or maybe you forgot to pick up my reviewed-by tags
> > >> for the mailbox commits.
> > >
> > > It's the first time I've sent the mailbox commits after Hector
> > > mentioned them.
> >
> > There are just too many things in flight right now which is part of the
> > reason I'm happy you're trying to get all this upstream!
> >
> > https://lore.kernel.org/asahi/YxYoW2IZFK%2FJdKgH@shell.armlinux.org.uk/
>
> Hmm, I'd completely forgotten that I've posted it previously! Hmm,
> no response from Jassi on the previous posting despite nothing no
> action being required on the patches. Jassi?
>
Usually I let patches roast in public until rc7 but I sensed other
parts of apple support might depend on these.
So I picked patches 1 & 2 from this series yesterday.
 https://git.linaro.org/landing-teams/working/fujitsu/integration.git/log/?h=mailbox-for-next

cheers.
