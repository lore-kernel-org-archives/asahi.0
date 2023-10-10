Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87886200DC
	for <asahi@lists.linux.dev>; Tue, 10 Oct 2023 14:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-98377c5d53eso988308966b.0
        for <asahi@lists.linux.dev>; Tue, 10 Oct 2023 07:53:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696949613; x=1697554413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l2WcnQotkJYAWCE6CEWba043WY3ByyYClp8a0rZyMlw=;
        b=XZiD4g1/8vqosLCStxP08BT736318XQ79bit5O7EEwhwyI1jeUsnmnWI8MGw7LikU+
         STeCC3O4QZPmgRoG0075qJn4tONvS78POOkDBHOFmdXNVXQMrgJl5nW4c+LaKjYdZpCJ
         7kyxlWUdFkkIeNvkNikXq0sTH5xu7HllCrVpJNlIsowJgkV2W7AmmCbGVq7Bd3AGK7Ck
         b4QD7JsXfUg8vJPyQxOoI0+76Ni4UQY/nLPwSM5+QuIZUhNBl7Rg8dp0PvFZ5iSDfEa6
         v3sGYjfGe52bbAc5CtH30+tjqjiAw30tBKEhaxj1O7or8ZF6gRP9tSvxhaqGqiDXmxhv
         tewA==
X-Gm-Message-State: AOJu0Ywrn/37RjV9HhJFg+vLNmpM1EdtSKIZpNzwUSzx231S9ZNGWFak
	yRNvvOaO9x2sc5Nd5AhGQVzYIl2MLqu9EX3x
X-Google-Smtp-Source: AGHT+IHjBpLXPLPuNz8z+qWcDKxmP+B1ppfhRWOSJ32I/YDoG9eL7uXoNPxieazzhIGdCkaGz1vsTg==
X-Received: by 2002:a17:906:e:b0:9b2:8df4:f2de with SMTP id 14-20020a170906000e00b009b28df4f2demr16863164eja.15.1696949613328;
        Tue, 10 Oct 2023 07:53:33 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id gr22-20020a170906e2d600b009b2ba067b37sm8423055ejb.202.2023.10.10.07.53.33
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 07:53:33 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5334d78c5f6so9959679a12.2
        for <asahi@lists.linux.dev>; Tue, 10 Oct 2023 07:53:33 -0700 (PDT)
X-Received: by 2002:aa7:dd0c:0:b0:538:15df:d12f with SMTP id
 i12-20020aa7dd0c000000b0053815dfd12fmr15463803edv.18.1696949612893; Tue, 10
 Oct 2023 07:53:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6f78e624-62ee-3ae5-1db4-a0411566def8@yandex.ru>
 <CAGRGNgU7aySyUny9aG_+wXiKJ7j1weosa-rZDY4_WAXbq-3ABg@mail.gmail.com>
 <87ttr454bh.fsf@kernel.org> <3c5a3e7a-b332-4a77-51ba-bed3cad1e79f@marcan.st>
 <e1ee4d76-f717-a67c-8099-7b91192ba1ca@yandex.ru> <e470902a-35eb-9bb4-7a9e-167f985c98bb@marcan.st>
In-Reply-To: <e470902a-35eb-9bb4-7a9e-167f985c98bb@marcan.st>
From: Neal Gompa <neal@gompa.dev>
Date: Tue, 10 Oct 2023 10:52:56 -0400
X-Gmail-Original-Message-ID: <CAEg-Je-mpcrEoM_nD3_8A=gZhdWpn3hxfGZNEfGRNupGwRdetw@mail.gmail.com>
Message-ID: <CAEg-Je-mpcrEoM_nD3_8A=gZhdWpn3hxfGZNEfGRNupGwRdetw@mail.gmail.com>
Subject: Re: On brcm80211 maintenance and support
To: Hector Martin <marcan@marcan.st>
Cc: Dmitry Antipov <dmantipov@yandex.ru>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	"lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>, Arend van Spriel <aspriel@gmail.com>, 
	Franky Lin <franky.lin@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>, 
	SHA-cyfmac-dev-list@infineon.com, brcm80211-dev-list.pdl@broadcom.com, 
	Asahi Linux <asahi@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>, 
	Kalle Valo <kvalo@kernel.org>, Julian Calaby <julian.calaby@gmail.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Phil Elwell <phil@raspberrypi.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 7, 2023 at 8:51=E2=80=AFAM Hector Martin <marcan@marcan.st> wro=
te:
>
> On 07/10/2023 00.48, Dmitry Antipov wrote:
> > On 10/6/23 18:34, Hector Martin wrote:
> >
> >> For better or worse, if nobody else does, I'm willing to sign up to
> >> maintain the chips shipping on Apple ARM64 machines (i.e. BCM4378,
> >> BCM4387, BCM4388 - that last one I have bringup for downstream, just g=
ot
> >> it done this week) and partially BCM4377 as a bonus (since I have acce=
ss
> >> to an older Intel Mac with that one, and already did bringup for it,
> >> though my access is sporadic). I'm already playing part time maintaine=
r
> >> anyway (other folks have already sent us patches I'll have to upstream=
),
> >> and we need this driver to keep working and continue to support new ch=
ips.
> >
> > Good news. Would you capable to consider some generic (not hooked to an=
y
> > particular hardware) things like [1] ?
> >
> > [1] https://lore.kernel.org/linux-wireless/20230703162458.155942-1-dman=
tipov@yandex.ru/
> >
>
> Sure, I've done cleanup type stuff myself too.
>

Can we please get this done so that the pile of Broadcom patches can
actually start landing again? It's been frustrating watching patch
submissions be ignored for over a year now. At least add Hector as a
co-maintainer and allow him to land stuff people have been using
outside to get Broadcom Wi-Fi to *work*.

Having stuff sit on the pile and be *ignored* is frustrating for
contributors and users, and massively disincentivizes people from
working in upstream Linux.



--
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
