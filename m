Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494423AC22
	for <asahi@lists.linux.dev>; Fri, 27 Oct 2023 19:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IqFN4VCH"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-53e08b60febso3758500a12.1
        for <asahi@lists.linux.dev>; Fri, 27 Oct 2023 12:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698435775; x=1699040575; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MjCNJUH4XI4ZJeN1+OaSxgenZOZV/PYnVyqlHJ9C/nw=;
        b=IqFN4VCHUGxp4GQ+z7LoFqAlM6OYBDGlOdwkSDFZjFb2nyLhiu3JoAfkdm3jjtm2ri
         scc5eNZ0kYYKTiCJQ5IY8UyMQ7CLA7riXWCqpiCifMmINZw2f5A9QqtZ+iNGkyZkRyxs
         56nl2cbm6XzRUJcbmq9FOfi9WIgQHXK71fWFQw8aEhHIWwZfMDk8cCtJ1riH4iBHPgkk
         suZh5NgDDYX16kqbPLZHVlMFWZxdPxkrcm1v4mOUrlCc22OtbybRkaZSfnhDNfJBoZZ2
         UVhKQeSIpU+/LedsLXuylYpjtnpaQoVg5lPf3hANqWcsujuN5vtPxlGRy6t6kug0hPD4
         pcKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698435775; x=1699040575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MjCNJUH4XI4ZJeN1+OaSxgenZOZV/PYnVyqlHJ9C/nw=;
        b=mPI+qBVdqFVNfBKj3Ql9OB6L+0htgfcy5gsTpiNryFgtMj3I8BU2EMW+ZEEonikKEP
         hUVxVS4k9R+31+K2Ij8nliPt6yfZ1TxvQKR4oASGtYb5d/4mmXEf+jqW/IXnoHYs9zaF
         y7x8yIpBWibTJZCdai8rNnm4tvA/RpBJcKlYtoTUpJMWtvnZwNdhCC5uUx1tMmSWp6vx
         Pt12Bvr0JTkI68O94l4cJHi2stGYpthzPNFYaLaUvrn5XfV11AW+5TeTgdKjuW+tZlcW
         Y4R0nUObjWhc35h6NpBxJHchLqOftnAPviSPKQgfQtMn8UthDHXviVVvEBcDJ3uKYNCn
         18uA==
X-Gm-Message-State: AOJu0YwMMp0ywU5vfelM8sa33ORTxwvgfCwxn4w2Itpr5PNYJtMoJwGI
	URYQ8kiVo544//d8lgyyVmB3cBaqVOhBB7H3y+s=
X-Google-Smtp-Source: AGHT+IGAryab5AiuJkZtlFTy+YnT9Zz66ged/cD0vmWVeQ4aLi1S27h6W2XcolXR+5hM0tSIMk8je87rxfha67owFC0=
X-Received: by 2002:a50:aad0:0:b0:53e:8e09:524d with SMTP id
 r16-20020a50aad0000000b0053e8e09524dmr3094815edc.5.1698435775252; Fri, 27 Oct
 2023 12:42:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231027-usb-fixes-1-v1-0-1c879bbcd928@marcan.st> <CAEg-Je-o+xSG-Yxtqt=+HAZds_HO62dtkAZ64kon_a6xG5SaOA@mail.gmail.com>
In-Reply-To: <CAEg-Je-o+xSG-Yxtqt=+HAZds_HO62dtkAZ64kon_a6xG5SaOA@mail.gmail.com>
From: Neal Gompa <ngompa13@gmail.com>
Date: Fri, 27 Oct 2023 15:42:18 -0400
Message-ID: <CAEg-Je_Heanyggk=p2V3x4y1qJ9=eR50RCj-ZZvFnmy0aKbmeA@mail.gmail.com>
Subject: Re: [PATCH 0/8] USB fixes: xHCI error handling
To: Hector Martin <marcan@marcan.st>
Cc: Bin Meng <bmeng.cn@gmail.com>, Marek Vasut <marex@denx.de>, 
	Mark Kettenis <kettenis@openbsd.org>, u-boot@lists.denx.de, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 27, 2023 at 2:58=E2=80=AFPM Neal Gompa <neal@gompa.dev> wrote:
>
> On Thu, Oct 26, 2023 at 7:26=E2=80=AFPM Hector Martin <marcan@marcan.st> =
wrote:
> >
> > This series is the first of a few bundles of USB fixes we have been
> > carrying downstream on the Asahi U-Boot branch for a few months.
> >
> > Most importantly, this related set of patches makes xHCI error/stall
> > recovery more robust (or work at all in some cases). There are also a
> > couple patches fixing other xHCI bugs and adding better debug logs.
> >
> > I believe this should fix this Fedora bug too:
> >
> > https://bugzilla.redhat.com/show_bug.cgi?id=3D2244305
> >
> > Signed-off-by: Hector Martin <marcan@marcan.st>
> > ---
> > Hector Martin (8):
> >       usb: xhci: Guard all calls to xhci_wait_for_event
> >       usb: xhci: Better error handling in abort_td()
> >       usb: xhci: Allow context state errors when halting an endpoint
> >       usb: xhci: Recover from halted non-control endpoints
> >       usb: xhci: Fail on attempt to queue TRBs to a halted endpoint
> >       usb: xhci: Do not panic on event timeouts
> >       usb: xhci: Fix DMA address calculation in queue_trb
> >       usb: xhci: Add more debugging
> >
> >  drivers/usb/host/xhci-ring.c | 100 +++++++++++++++++++++++++++++++++++=
--------
> >  drivers/usb/host/xhci.c      |   9 ++++
> >  include/usb/xhci.h           |   2 +
> >  3 files changed, 92 insertions(+), 19 deletions(-)
> > ---
> > base-commit: fb428b61819444b9337075f49c72f326f5d12085
> > change-id: 20231027-usb-fixes-1-83bfc7013012
> >
>
> The series looks reasonable and has worked quite well in Fedora Asahi.
>
> Reviewed-by: Neal Gompa <neal@gompa.dev>
>

Resending now that I'm subscribed to the U-Boot mailing list...

Reviewed-by: Neal Gompa <ngompa13@gmail.com>



--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
