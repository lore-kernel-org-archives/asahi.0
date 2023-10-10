Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD0627453
	for <asahi@lists.linux.dev>; Tue, 10 Oct 2023 15:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="lFIFIjoM"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-d84f18e908aso6189226276.1
        for <asahi@lists.linux.dev>; Tue, 10 Oct 2023 08:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1696952148; x=1697556948; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W+bVvVmNARXfzksOwpB0sUT7ON07eOsylXSyNT6q0Wk=;
        b=lFIFIjoM4/HD7KMo7Gh7EnOnhqwSfGH+9f1WdZ7RFkTx6GQitnTNLk+cPYGahKDveL
         zj13m+1CjZ5i0q4TXnaNJMuQQFmYTYp8AhFj7jl9OnzYRevg+AKpVmRXzS3znGtdokbl
         TPZJwv9gfX1HTAEMv2idTf+AAeo6cmdSQwcocRtc8nitENGHSs7fDMGvylyFrg+Yn5ve
         V8NF/ZHqfmLYtY7XpqthP1szMJxcfGUX4imxenrspgA4KPQsLdgk4ageeGV39mRa0/yB
         zGYdHkjfRIDs5jeCd1DdPKmcjQUrQOxeJmfKO1txK4oTFQsJylk3fiMjWraRMO/8HOvp
         LkRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696952148; x=1697556948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W+bVvVmNARXfzksOwpB0sUT7ON07eOsylXSyNT6q0Wk=;
        b=BXiyCtlhWzpQIVj3KIRgsq2hhHv+lNTWUDYwiQdqf1w/cndmwB7xkpFHj9SyiqWXnu
         cTZKEBBShgojDXBYd+lklk2+pIExFZHw51EpIVId/mBZAPnuZpYU0eyi4Rur/nr7PJ3a
         yk/buQ+IqihhsGCN3l0Nh8VUtGHU/iw/HeMw2Ue3Wa4wMk8TyYk4lm/fR/l6jdZJ66Aj
         G8WpzGSPjEbkveAUwguSSCqBa8iaY3A90ml0GNnK/UMrfKEF4RLBLgHmnFBCBLhVS8Pg
         keSsMbabiV5jvIyDySjOoqRIMlAuKN28jpGsIeKTPlUokPF0gaYjlsXxdtDAlx1GbJFo
         WEGw==
X-Gm-Message-State: AOJu0YwQOz0GYRIS7TKAMu7KPPsKquKhNpzqKFV7dEp1+AKL6M7BZEHF
	FuaZWcnVpRrAvEj21Ict6J7rCNZlyoJiex9Jxs5skw==
X-Google-Smtp-Source: AGHT+IHyKvPvteLHJsP21FSAJDsvCrIM7jAUYYBVWwm3qsR0h8B0YjeevGze8t/rDMvBAMvKtKPMdsN1QwahNOoS6YM=
X-Received: by 2002:a25:4cc9:0:b0:d9a:6aaf:2589 with SMTP id
 z192-20020a254cc9000000b00d9a6aaf2589mr1415894yba.9.1696952148563; Tue, 10
 Oct 2023 08:35:48 -0700 (PDT)
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
 <CAEg-Je-mpcrEoM_nD3_8A=gZhdWpn3hxfGZNEfGRNupGwRdetw@mail.gmail.com>
In-Reply-To: <CAEg-Je-mpcrEoM_nD3_8A=gZhdWpn3hxfGZNEfGRNupGwRdetw@mail.gmail.com>
From: Phil Elwell <phil@raspberrypi.com>
Date: Tue, 10 Oct 2023 16:35:37 +0100
Message-ID: <CAMEGJJ3jeOK2WbW7YP4=y2E0Z7GnffHiqZhgAmXJjKchv3jG+A@mail.gmail.com>
Subject: Re: On brcm80211 maintenance and support
To: Neal Gompa <neal@gompa.dev>
Cc: Hector Martin <marcan@marcan.st>, Dmitry Antipov <dmantipov@yandex.ru>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	"lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>, Arend van Spriel <aspriel@gmail.com>, 
	Franky Lin <franky.lin@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>, 
	SHA-cyfmac-dev-list@infineon.com, brcm80211-dev-list.pdl@broadcom.com, 
	Asahi Linux <asahi@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>, 
	Kalle Valo <kvalo@kernel.org>, Julian Calaby <julian.calaby@gmail.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

On Tue, 10 Oct 2023 at 15:53, Neal Gompa <neal@gompa.dev> wrote:
>
> * Spam *
> On Sat, Oct 7, 2023 at 8:51=E2=80=AFAM Hector Martin <marcan@marcan.st> w=
rote:
> >
> > On 07/10/2023 00.48, Dmitry Antipov wrote:
> > > On 10/6/23 18:34, Hector Martin wrote:
> > >
> > >> For better or worse, if nobody else does, I'm willing to sign up to
> > >> maintain the chips shipping on Apple ARM64 machines (i.e. BCM4378,
> > >> BCM4387, BCM4388 - that last one I have bringup for downstream, just=
 got
> > >> it done this week) and partially BCM4377 as a bonus (since I have ac=
cess
> > >> to an older Intel Mac with that one, and already did bringup for it,
> > >> though my access is sporadic). I'm already playing part time maintai=
ner
> > >> anyway (other folks have already sent us patches I'll have to upstre=
am),
> > >> and we need this driver to keep working and continue to support new =
chips.
> > >
> > > Good news. Would you capable to consider some generic (not hooked to =
any
> > > particular hardware) things like [1] ?
> > >
> > > [1] https://lore.kernel.org/linux-wireless/20230703162458.155942-1-dm=
antipov@yandex.ru/
> > >
> >
> > Sure, I've done cleanup type stuff myself too.
> >
>
> Can we please get this done so that the pile of Broadcom patches can
> actually start landing again? It's been frustrating watching patch
> submissions be ignored for over a year now. At least add Hector as a
> co-maintainer and allow him to land stuff people have been using
> outside to get Broadcom Wi-Fi to *work*.
>
> Having stuff sit on the pile and be *ignored* is frustrating for
> contributors and users, and massively disincentivizes people from
> working in upstream Linux.

This is just a quick note to say that Raspberry Pi obviously has a
vested interest in the future of the brcmfmac driver. In our
downstream tree we use the upstream driver largely unmodified - there
are a handful of patches that tinker around the edges, the largest of
which is in the area of firmware location and being phased out - no
patches from Infineon/Cypress, Synaptics or Broadcom.

We're very much WiFi users as opposed to WiFi developers, but if
there's something useful we can contribute then please speak up and
I'll see what we can do.

Phil
