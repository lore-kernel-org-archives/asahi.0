Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8039FC18
	for <asahi@lists.linux.dev>; Wed, 11 Oct 2023 10:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="jGGOt2Zy"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5a7c011e113so21298547b3.1
        for <asahi@lists.linux.dev>; Wed, 11 Oct 2023 03:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1697021130; x=1697625930; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YL127oscJH6gp+yTxggd3LK31C8e1HyGUVVsaS6zp14=;
        b=jGGOt2ZynalWbbxwGpIjl84YRd9PNhqDBw+q9dB3jgbs1O1uIHop6ZhnmvPw7uRRYB
         DK7G/+opNQ1T0gzY0VvcACHyXsnUldcwUg5cE+eCvWWr/9dUGdYpjMZQlHgbSq1c+evL
         pHJjE2K1psc43xpxabk0oskHisP+PICrxKC6OHduQVTN0bDna6au2OcI2/9CdyGZ60t0
         4KA+TIrd8I4m0UVmrzgd4HIRSqgD2Hch/yqcSAILgFUb8XqJZp6s5GpuY0yBeSCTz0LJ
         V2jaSCQWE8bPc+vhbNQ0rvAaOZ8Ggci0GWBSHJn7JoyurquBN3t7Yh0BnEZK7WYcyD0F
         PLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697021130; x=1697625930;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YL127oscJH6gp+yTxggd3LK31C8e1HyGUVVsaS6zp14=;
        b=ItA5ViKkgfIA46L2HHazWchYLHZCqQ+jXK+VL1B3nGEVtIO+w4/MXeuX8zEegqnNpX
         b+f06HbCqqBBMeHD7EUEJzSqTdd3zTqFW7hI7ZtWy2uj5lyk1Nb3lWQybSyCiLctEjpB
         CM+iT7J68DMTHGUNMYwt0OJxgiG7LTWR5Ara645o1wpUkpX2ZtPPiHw5/LCUmDTQJDwg
         ZbhOZaVMBM/OAVPdwJBwrAAslZ2O+OkdTorkosKHCvqzuNNT7vn9O097+fOPxAoft/5S
         afXmg6qgWDz7+MWZriShRiY8rKsU1VRKKOlL/XW1vU43NFOgWKWhhi/jhVFyAEN3BWi5
         HETA==
X-Gm-Message-State: AOJu0YwS3i+nugOxfEUbY6Q96TFkF20pRjfZmo6yQvW110zKML3mnU1c
	gWRfVwqWCYyZC9BU1+TUl0XhClJ2AwJ2VhUqe2n7aw==
X-Google-Smtp-Source: AGHT+IEVy8EiOeFMRwy82Ir7VUyJ+VT9Vb2TmVUBB9wyYFi+w/lohD+ek63I+hZOrWHuWUg2Bmz6JRy1diehmTzQzwc=
X-Received: by 2002:a25:aaad:0:b0:d9a:526a:2514 with SMTP id
 t42-20020a25aaad000000b00d9a526a2514mr4809848ybi.62.1697021130679; Wed, 11
 Oct 2023 03:45:30 -0700 (PDT)
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
 <CAMEGJJ3jeOK2WbW7YP4=y2E0Z7GnffHiqZhgAmXJjKchv3jG+A@mail.gmail.com> <87a5sp4fha.fsf@kernel.org>
In-Reply-To: <87a5sp4fha.fsf@kernel.org>
From: Phil Elwell <phil@raspberrypi.com>
Date: Wed, 11 Oct 2023 11:45:19 +0100
Message-ID: <CAMEGJJ35-D5ReGsfUwhOxKE1OC6NaBWoAGudBp=QRkuLU5BYnA@mail.gmail.com>
Subject: Re: On brcm80211 maintenance and support
To: Kalle Valo <kvalo@kernel.org>
Cc: Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Dmitry Antipov <dmantipov@yandex.ru>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	"lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>, Arend van Spriel <aspriel@gmail.com>, 
	Franky Lin <franky.lin@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>, 
	SHA-cyfmac-dev-list@infineon.com, brcm80211-dev-list.pdl@broadcom.com, 
	Asahi Linux <asahi@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>, 
	Julian Calaby <julian.calaby@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

Hi Kalle,

On Wed, 11 Oct 2023 at 11:32, Kalle Valo <kvalo@kernel.org> wrote:
>
> Phil Elwell <phil@raspberrypi.com> writes:
>
> > This is just a quick note to say that Raspberry Pi obviously has a
> > vested interest in the future of the brcmfmac driver. In our
> > downstream tree we use the upstream driver largely unmodified - there
> > are a handful of patches that tinker around the edges, the largest of
> > which is in the area of firmware location and being phased out - no
> > patches from Infineon/Cypress, Synaptics or Broadcom.
> >
> > We're very much WiFi users as opposed to WiFi developers, but if
> > there's something useful we can contribute then please speak up and
> > I'll see what we can do.
>
> Is it possible to run upstream vanilla kernels on a Raspberry Pi? For
> example at least once a month take latest wireless-next[1], install it
> to a Raspberry Pi and run some simple wireless tests. If any regressions
> are found report that to linux-wireless. Preferably with a bisect log to
> easily find the offending commit.
>
> Testing patches before they are applied would be even more helpful,
> especially for the risky ones. We have a hard "no regressions" rule so
> earlier we catch the regressions the better.
>
> I also wonder should there be a dedicated brcm80211 specific mailing
> list? That way people who want to help could easily follow and discuss
> brcm80211 development, and no need to follow linux-wireless. For example
> we do that with ath12k driver.

It's a very busy time for us at the moment, but a monthly-ish wireless
smoke test sounds reasonable. Hopefully once we have a process for
that then occasional regression checks on upcoming patches would
become possible.

A dedicated brcm80211 mailing list would be good - I'd definitely sign up.

Phil
