Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785601097B
	for <asahi@lists.linux.dev>; Wed, 11 Oct 2023 11:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="p2RQStGy"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5a7ba0828efso25593597b3.3
        for <asahi@lists.linux.dev>; Wed, 11 Oct 2023 04:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1697024841; x=1697629641; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F2CO58cNkDLoM5uuHoWEqHDI+8aDNQ1qA3on6BCuTZk=;
        b=p2RQStGymy50uAwv+o53CUBxFsB0ALO4iKiKExjR4mo2OwDI6BfBeuZ+8Xovj3jrqA
         bm4M5COfXeGZJGUgcM/5j9W6I7VRmkLsuKggYHojVu7khJyewYbCPDTW8gxG3CZBsYxR
         lo7zURgZKZW+e+AlGilIPoobhXBiWe0aj8qRQRKLl+VyH7GOgT+An/ChJ1PM7D5jT9pd
         1l9cLmTUWPQtmQ/64/illIZzELSCBbTFhakdPdWq2pDnn9CS1oNdYJjEv0Nj+hdOIVIe
         OSL5TfUbzXQZax7t1AledIoSovYZi68DmlOnGwH2DvsDGl7CZTceGMDKwmMjBXSDXBKy
         Geyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697024841; x=1697629641;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F2CO58cNkDLoM5uuHoWEqHDI+8aDNQ1qA3on6BCuTZk=;
        b=K9wH/npDlLB6n3Xou6hbXGkfxKW0M7jVlVaXJUKo7WFEZRds3J+2k0S+a7ttlGBYrS
         pZCotkM5xpQAg/uyxOb40o/e1G+i3D/bWQwMqejCKj7vWQlkzag2lQXGbRxG86Wt4dxr
         LJajrJH4OWnPtmULMQzxM1HFGNP5dPv1g5fhXBEGfwPeVPqS2K/huxWdBLT1YX7IfOxL
         C+pLBQJ4Dp/sed9UVVskjhUPKNLQBIWJS4ktORBmUPrEiWX2WM4Nh9fpkw8CnS+DNQre
         C5PPTSF8wVQrI+L8pt30g1ZAYPOSEofSCRcnBhvmREchyJIh2Sosi9X7yGqr+BJ3nUpe
         HIKw==
X-Gm-Message-State: AOJu0YztxPWqpUPEqu6u/BxW7tAVxFQCweFH/epOg/Yb99akXvFsAb/N
	fUQcuvX1tp5YpKPi+8eRnfL8eC1eFIw9hgB5XVmtCA==
X-Google-Smtp-Source: AGHT+IEXrl726KTwCoMXxA1mBIhJL2iH49mJ0WxzlwoEn3AUEKiO+Ze6qdfiQ8RSDTE2/HhIsAjgsjAIUKzuCUvwvPY=
X-Received: by 2002:a25:ac09:0:b0:d9a:63f5:10d6 with SMTP id
 w9-20020a25ac09000000b00d9a63f510d6mr4060901ybi.26.1697024841277; Wed, 11 Oct
 2023 04:47:21 -0700 (PDT)
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
 <87edi14fvp.fsf@kernel.org> <cce5765d-342f-4811-ab7f-fb41ede0b3a1@marcan.st>
In-Reply-To: <cce5765d-342f-4811-ab7f-fb41ede0b3a1@marcan.st>
From: Phil Elwell <phil@raspberrypi.com>
Date: Wed, 11 Oct 2023 12:47:10 +0100
Message-ID: <CAMEGJJ0=qM85F64ox5LLug5PWnBa4W9zDOqNay6ScU-aweSzHw@mail.gmail.com>
Subject: Re: On brcm80211 maintenance and support
To: Hector Martin <marcan@marcan.st>
Cc: Kalle Valo <kvalo@kernel.org>, Neal Gompa <neal@gompa.dev>, 
	Dmitry Antipov <dmantipov@yandex.ru>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	"lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>, Arend van Spriel <aspriel@gmail.com>, 
	Franky Lin <franky.lin@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>, 
	SHA-cyfmac-dev-list@infineon.com, brcm80211-dev-list.pdl@broadcom.com, 
	Asahi Linux <asahi@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>, 
	Julian Calaby <julian.calaby@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Phil Elwell <phil@raspberrypi.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Oct 2023 at 12:28, Hector Martin <marcan@marcan.st> wrote:
> I think we need to qualify this "no regressions" "rule". People regress
> our machines in mainline all the time. We catch it and get it fixed,
> sometimes in RCs, sometimes it goes all the way to stable and needs to
> get fixed there. We've had patches break everything from Bluetooth LE
> pairing to core memory management to the point we needed earlycon to
> diagnose it. That last one was a blatantly wrong patch to core Linux MM,
> it wasn't even something specific to our platform, but even that got
> past review (it just happened to break us specifically due to a
> coincidence).
>
> The review process doesn't magically avoid regressing things. "No
> regressions" is impossible without someone actually testing things.
> Claiming otherwise is dishonest. So if I end up as maintainer here I
> certainly am not going to promise "no regressions" for chips I can't
> test, without someone interested in those chips testing them. Of course
> I'll take regression fixes when they do happen and someone notices, but
> I can't know in advance until someone does.
>
> Consider a patch that changes some codepath in the driver. I can't know
> whether the original logic was always broken, or whether it worked on
> some chips, and whether the new logic works on those chips or will
> regress them, without testing. This is a regular occurrence with
> brcmfmac, due to the complexity and variability of the firmware
> interface. Often multiple versions of stuff are supported, or some
> structures can be extended, but sometimes they can't. It's a mess, and
> without firmware source code nor any official specs, there is no way to
> know exactly what is intended and what the backwards compatibility
> requirements are.
>
> The only way to avoid that is to gratuitously introduce version/chip
> gates for *every single change affecting behavior from the firmware
> POV*, which is a complete non-starter and would quickly yield a giant
> mess of spaghetti code. It's bad enough having to support explicit
> ABI-breaking changes in firmware, and having to deal with multiple
> versions of huge structures and convert between them. Trying to outright
> keep existing logic identical for "other chips" is just not going to
> happen, not without first having confirmation of what the requirements
> are from someone who has the required docs/source.
>
> I have a patch to enable WPA3 in Broadcom chipsets (yes, the driver is
> in such a sorry state it doesn't even support that yet). The current
> support attempt was added by a Cypress engineer and uses a completely
> different firmware mechanism. Is that supposed to actually work? Does it
> work currently? Is that the case for all Cypress firmwares? Or only
> some? Does the alternate mechanism we have for Broadcom chips work too?
> Only Cypress can answer those questions ahead of time, and they aren't
> (they ignored me last time I brought this up). So my current patch just
> replaces the mechanism with the known-working one for Broadcom chips.
>
> Next time I send a bunch of our downstream patches, I'm going to resend
> that WPA3 patch. And if it regresses Cypress WPA3 support, tough luck.
> If someone catches it (Phil?) and it turns out the existing support is
> the only way to do things on Cypress, I'll rework the patch to
> conditionally support both styles. But if nobody does, and nobody cares,
> then I'm sorry if I regress things, but there is no way to avoid it. We
> can't be gratuitously gating every single change just to hope to avoid
> regressions, without any confirmation of what is required. That just
> doesn't scale.
>
> Phil: Given Cypress' complete apathy towards this driver, if you want
> the Cypress chips in Raspberry Pi systems to continue working and catch
> potential problems ahead of time, it would be helpful if you can test
> the patches in this branch. This is our downstream brcmfmac patchset.
> Regardless of what ends up happening with the maintainer situation,
> giving this a whirl will be very helpful in catching problems with
> systems people actually use. It should be easy to bisect regressions too
> (we keep this rebased directly on recent kernels so you can apply it on
> top of your tree or whatever).
>
> https://github.com/asahilinux/linux/tree/bits/080-wifi

That sounds like a reasonable starting point - I'll take a look.

Phil
