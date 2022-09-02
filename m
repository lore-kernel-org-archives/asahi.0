Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19BC1869
	for <asahi@lists.linux.dev>; Fri,  2 Sep 2022 13:36:51 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id f14so1740041qkm.0
        for <asahi@lists.linux.dev>; Fri, 02 Sep 2022 06:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=WJD9hUtu4rC5sltdkxxaBZYUARUC2mjdG4r45BSg2Do=;
        b=l6LgwyeBvG+nfpd4wbpmiosLOHAznyozSmvz9IQera5MoToj5Cj302ZlObMTUeJaV9
         jxBWb2pBODtZgU0TTtkko7vlP8V2Pvhlen53adTwClVlZYvH4/oE0ASf9lmPtsbTat4Z
         L4W5uqKKDgcTuE4xeHAmTn49o2MCqrmTPQTSNN9xsamwip+h9Bf1ruin0WJRAjBMSALb
         bDcUBfqEMJv6G+X1tbRjE6vTuXyKPO9sAbVAiQcpT0iB2z4Soqqk/shOR7aGu0wnNijf
         z7WYhwFPxviQk7YG6nvxE6LPGSpAlOiFmkzHE4oGSwZbm58ftRX8la/yAD3xo+5KyzMt
         7VuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=WJD9hUtu4rC5sltdkxxaBZYUARUC2mjdG4r45BSg2Do=;
        b=J1cJ/60g/+P0k7OmI2K4IFkRNJqMhAU3WBuIMYd1qfRYtbMbk9yBMy5Yxc1k6iMgNq
         uLhJvJwXoKNj1R89XswE0cByEMMCNOGjeI/X5x8OOpPNzzyNoTp13oZUijdXkAI9HsJl
         z8uZuLmzXBaqRIGp/Ku3xHPF8WsagcSdtcNgLAQTwcQPu+XdfhmOeBBqCkPz2MspVvjU
         vwvAW0rpVGtNhyqsi4HbQhFT8n52NTPyWd1+YhBWCb4TLlFH6zjRHQCVQfJhd6piUNZM
         95tUEkH6f9zxO1SBbcfVawMv+lsC5JXMeRM2zEcN7AaC+MGqLWkJ1Vt839Ym/m/JmP3a
         zt4A==
X-Gm-Message-State: ACgBeo1KL4Cr0mFxcakHCZNV4zFXmHUzfTn7N5GUsNATHXO0hGT+rVuS
	EPrPHRqcXuH+NDD4QwNJnwDcz2KZfr26T2rcdvA=
X-Google-Smtp-Source: AA6agR7WApldRnUlS26hSE7qvi7+8SyDZzb5oOo+KIVN7qKJkdDbXbBplgaKPlebaG6+lKPG7ZopDUJ4VhSVuT9G8e0=
X-Received: by 2002:a05:620a:288a:b0:6b8:fcfe:db02 with SMTP id
 j10-20020a05620a288a00b006b8fcfedb02mr23904454qkp.504.1662125810519; Fri, 02
 Sep 2022 06:36:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk> <E1oTkeb-003t9e-Iy@rmk-PC.armlinux.org.uk>
 <CAHp75VcG5E+yTH2hG2CbnArsm+ZJ-sWRMmM-wLks0xUJkwSgcg@mail.gmail.com>
 <FEE9F7AE-B324-4426-AB26-17BDF30CFC91@cutebit.org> <CAHp75Vd8-mOuJvr=PRKjVKbz0SM9hPe39rEcraOMJFYtrwHjng@mail.gmail.com>
 <3B649A66-8116-432D-B88A-B5CE493EF930@cutebit.org> <CAHp75VeB3_sZ2vsSxMSsLeJSkyemDh9iOPHXJCN1mhodA13LNQ@mail.gmail.com>
 <E753B391-D2CB-4213-AF82-678ADD5A7644@cutebit.org> <CAHp75VdstDxcZ96d3XD=k8_q2oP3UvoL+QV-27BxWFyALWJ_QQ@mail.gmail.com>
In-Reply-To: <CAHp75VdstDxcZ96d3XD=k8_q2oP3UvoL+QV-27BxWFyALWJ_QQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 2 Sep 2022 16:36:14 +0300
Message-ID: <CAHp75Vfg+qZeVaGwi_SxWcnF77s6R980qe3nqinxHuvG-dx3ng@mail.gmail.com>
Subject: Re: [PATCH 5/6] gpio: Add new gpio-macsmc driver for Apple Macs
To: =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik@cutebit.org>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Hector Martin <marcan@marcan.st>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Sven Peter <sven@svenpeter.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 2, 2022 at 4:33 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Fri, Sep 2, 2022 at 2:12 PM Martin Povi=C5=A1er <povik@cutebit.org> wr=
ote:

...

> > in at least 9 places now, the number of which will probably grow.
> > Just to make the case for *some* printk helper.
>
> Wouldn't this be one line
>
>   printk(=E2=80=9C%.4s =3D ...\n=E2=80=9D, &cpu_to_be32(key));
>
> ?
>
> So I don't see disadvantages right now. Later on we can consider a new
> specifier _separately_, otherwise this series would be dragging for no
> sense.

Just to make my point clear. The single user or small subset of users
does not justify the new specifier. New specifier is a lot of burden
to printf() code. Find 3+ independent users and we can talk again.
That's why I suggest to either create a local (to apple whatever
stuff) helper or use existing specifiers in _this_ series.

--=20
With Best Regards,
Andy Shevchenko
