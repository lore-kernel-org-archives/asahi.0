Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349576708
	for <asahi@lists.linux.dev>; Fri,  2 Sep 2022 14:41:55 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id g21so1852059qka.5
        for <asahi@lists.linux.dev>; Fri, 02 Sep 2022 07:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=0ac1i9buWoWncajk6SXq/V2mUp/aPapb/moPxFtHBro=;
        b=mmaBi/9RC6JzJIPiGTLURB2g4mTUjg0f6HHHHeLisvJFyzFg3cllpWRBvU60UwISVN
         jy6mjv6UYv9oxlK69um/FYVDRIKQTkHR209BH6UvQM8oa6Wymarxp65qjBc+Bs1IdfOI
         1/rFKL14OWkpUnVbTqlF1u64YZuGaSotce3ZlBI1bKT7BD0UT5G9MXNmfYq9ZkOFflNg
         U2J1zR0fSA1f7n+jPsfAvrmCQjxRc4/SPJGL/1SoQVfqzWCLVMt/eaGrimYKpQGRmZEE
         J4jNztbsdP3fgPZ14Fvf8S7p0Zz4c1rtX8mqOvOhDTbKdkfgCXk6qgsfI9IDrsIe9yTq
         8NJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=0ac1i9buWoWncajk6SXq/V2mUp/aPapb/moPxFtHBro=;
        b=8MguvmnY2pyeWtbYdWS4lmlq4cWRY6C3QQp1JwhNq2OCf5JIG+iPQXsmXYAs2Vvwxd
         CDjgFXRKVt/WqXDzxrhW0Z9l6XGz886IqtdeWq3KKegCIHSh/AuKexpsaIDeJxRmC275
         gU35rAgi2w+TOXFRPJxVwJiHZ6A5GmJCLWdnikCMHT22IpvIMJbHJpSIlJwhpix38kN3
         lYmGLZfQxTIn2u9m28XhKHBpY2KTlJwIOsH1b/YrhZPL8zILBxj2rnq1mmSEL17kfmsj
         WO6n5elIz2VBQKJDD7sM/mNAnjFR4wzbmjm9LreXgLEKauhQW5JrZpg9RoX9IbYDODg9
         IAxQ==
X-Gm-Message-State: ACgBeo13Loukt5dcx4jDuI5n7Qc2zKwomrgxK9ci0j0gXA10ZCpcaiG5
	SNDMnStdInLkSO2S3C8IPQ+cu1Feu1TCEUB0u+0=
X-Google-Smtp-Source: AA6agR56MurRTLIs4bBYExs7jDRPEMyhQr5Mhf/O8ly8l0LxrCoTs+3wDiuMvxTNR4W5Nf7u3JlY9+f75gF3CAk/OfE=
X-Received: by 2002:a05:620a:288a:b0:6b8:fcfe:db02 with SMTP id
 j10-20020a05620a288a00b006b8fcfedb02mr24165177qkp.504.1662129714040; Fri, 02
 Sep 2022 07:41:54 -0700 (PDT)
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
 <85AE2F3E-6A1D-4AA0-9205-3E3DE5C6D79F@cutebit.org>
In-Reply-To: <85AE2F3E-6A1D-4AA0-9205-3E3DE5C6D79F@cutebit.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 2 Sep 2022 17:41:16 +0300
Message-ID: <CAHp75Vdfo87xT2S-MEO+z3o0eHZYtHHEzJBswSMNaWTSVhcXPA@mail.gmail.com>
Subject: Re: [PATCH 5/6] gpio: Add new gpio-macsmc driver for Apple Macs
To: =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik@cutebit.org>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Hector Martin <marcan@marcan.st>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Sven Peter <sven@svenpeter.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 2, 2022 at 4:37 PM Martin Povi=C5=A1er <povik@cutebit.org> wrot=
e:
> > On 2. 9. 2022, at 15:33, Andy Shevchenko <andy.shevchenko@gmail.com> wr=
ote:
> > On Fri, Sep 2, 2022 at 2:12 PM Martin Povi=C5=A1er <povik@cutebit.org> =
wrote:

...

> >> you need to do
> >>
> >>  u32 key_be =3D cpu_to_be32(key);
> >>  printk(=E2=80=9C%.4s =3D ...\n=E2=80=9D, &key_be);
> >>
> >> in at least 9 places now, the number of which will probably grow.
> >> Just to make the case for *some* printk helper.
> >
> > Wouldn't this be one line
> >
> >  printk(=E2=80=9C%.4s =3D ...\n=E2=80=9D, &cpu_to_be32(key));
> >
> > ?
>
> That would compile? I thought that=E2=80=99s not valid C, taking an
> address of function=E2=80=99s return value.

Ah, you are right. My bad.

--=20
With Best Regards,
Andy Shevchenko
