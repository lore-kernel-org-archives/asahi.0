Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F487129A83
	for <asahi@lists.linux.dev>; Wed, 24 Jan 2024 18:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706119873; cv=none; b=E7z/HnuueeDlLVgn9Oqk28Ba9p/lWVnm5L1qI6tGRG5ADXRZBGZtVKp72+YjSveGR3zaPk5+8lHwTdZhf3MX/WSAoVLicfXxLsPb1PhHSGSa94H21k5q28bvXyqDgfIF7Sdvy588EpHudEJ/jmy54d3U+jK8skQUu8e0tF2QO40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706119873; c=relaxed/simple;
	bh=5UQE6R6C6AUkzbId7Ykcdx4OK37OHsLAgXu519xwaEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qIusEuJ/27UzD8K503CdHUX89tEmOUHTiHJ+7KJjUGwPAlcH0ndGXgEGhnY2NEvplY1DDiEiKp43+JjMhmj7nhz7DXEf3qJyjoXqyp9gr8IaC1T2FD4PUMPKpdC6XEYrj2hDkzWehdoZ43STriIhmOkb7JPfaoZiNbFMCsabi7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iH13AAgk; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iH13AAgk"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2cf2b218c62so9032431fa.2
        for <asahi@lists.linux.dev>; Wed, 24 Jan 2024 10:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706119868; x=1706724668; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8c9nUjIPANslCx2Ew4sSi05//NjSwZV6nm4afuT97Q=;
        b=iH13AAgkKM4h1Go1JUt1WRvmGklNrEsjTCaWCXy6BTEsZwm9u0DfW0ZyXk5pGofsBz
         00xjEVbS5buKRQ8Unx0pmYtfFwmR1jYGvpJg9qu8hRllkmsIZMOD9/6mjt7sbrMofKLR
         C9jgKYK8wEzMn4KRjoYIdrcu45PNdkehKtPhOTe/XX/Qp68KXDruF6Pt0UUFzxgi1fdP
         /Mh+W1CSAMonBzqVqy5ldfyD8PnFODrGyeGgMw1QS7YCfAOfjXfxEsdOglTzilaKImb9
         X2RYdxjXxs+UAHjEsZnQgj3House+Ty25mEZSLniL6TLdfusRk9tj8kydjSJkwHySuFr
         CaAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706119868; x=1706724668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C8c9nUjIPANslCx2Ew4sSi05//NjSwZV6nm4afuT97Q=;
        b=GUyTuAI5Lqwp0wh8BB8fVzfqWoVpvxpERwH4xNP2VPUlaZmA2QJg55KZIbe2y5/0ti
         WC3Lnoa+CGW+sx8Qjw8DCGqPYMZ+tCiEhGxV+50ZKKlXfbuw1a9wAtHOtJkpncnuoIhp
         pYB/yDQUL7GbnUHlnDYcRYjAST4BAcXKz9N+1Lh6ObAxXZgPWERyYr464q81JKrPgdJO
         pSR4SOY8B8iAFOs8lccsLvqMQOQdR//j1jWiM1Wxz3NTMUlv3xc9MQCbAEHGi61dioIF
         hMOPcOmSCrd6EDtTziDAhH/cDxjNDe0/O4VoD75qgBdDoGPDkISnkeAbGqkAw/IElQNU
         VN2g==
X-Gm-Message-State: AOJu0YzS08hTfuphB1ctzqgGamhpDaLeS79nC+QOwhD7f7kndo7dbfN1
	NdE1iRMQv43NvZ3Z+M2bfAH/LoTbGL1bjqo/J4+xrxgsyfoHmBbIQLPYKGWVanrbmJqEXgOUQ+s
	ZN3xcGav4s5deqvhPXKC+uQlckcU=
X-Google-Smtp-Source: AGHT+IFFXNE3muV10N3ttExhgNCetj5vrx4blsUxYPxIoqW1KTrLMSWHeFr341ly5/HXNCopRHJOt5VliEGljk2s0AQ=
X-Received: by 2002:a05:651c:2d1:b0:2cf:56b:3c04 with SMTP id
 f17-20020a05651c02d100b002cf056b3c04mr531543ljo.170.1706119867851; Wed, 24
 Jan 2024 10:11:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240107180252.73436-1-verdre@v0yd.nl> <CABBYNZ+rDo6ftN1+HdeWm6gij14YF_19WGRP7LM4Vjw-UWOTng@mail.gmail.com>
 <7cee4e74-3a0c-4b7c-9984-696e646160f8@v0yd.nl> <e6f4e681-63ca-4d85-b050-e215f86a63bf@v0yd.nl>
In-Reply-To: <e6f4e681-63ca-4d85-b050-e215f86a63bf@v0yd.nl>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 24 Jan 2024 13:10:54 -0500
Message-ID: <CABBYNZJp=RhwJoB9u7QT61M085a-+Eh-HN+X07GPmNoRJQHUfw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Disconnect devices before rfkilling adapter
To: =?UTF-8?Q?Jonas_Dre=C3=9Fler?= <verdre@v0yd.nl>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, asahi@lists.linux.dev, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonas,

On Wed, Jan 24, 2024 at 1:00=E2=80=AFPM Jonas Dre=C3=9Fler <verdre@v0yd.nl>=
 wrote:
>
> Hi Luiz,
>
> On 1/8/24 11:25 PM, Jonas Dre=C3=9Fler wrote:
> > Hi Luiz,
> >
> > On 1/8/24 19:05, Luiz Augusto von Dentz wrote:
> >> Hi Jonas,
> >>
> >> On Sun, Jan 7, 2024 at 1:03=E2=80=AFPM Jonas Dre=C3=9Fler <verdre@v0yd=
.nl> wrote:
> >>>
> >>> Apparently the firmware is supposed to power off the bluetooth card
> >>> properly, including disconnecting devices, when we use rfkill to bloc=
k
> >>> bluetooth. This doesn't work on a lot of laptops though, leading to w=
eird
> >>> issues after turning off bluetooth, like the connection timing out on=
 the
> >>> peripherals which were connected, and bluetooth not connecting proper=
ly
> >>> when the adapter is turned on again after rfkilling.
> >>>
> >>> This series uses the rfkill hook in the bluetooth subsystem
> >>> to execute a few more shutdown commands and make sure that all
> >>> devices get disconnected before we close the HCI connection to the ad=
apter.
> >>>
> >>> ---
> >>>
> >>> v1: https://lore.kernel.org/linux-bluetooth/20240102133311.6712-1-ver=
dre@v0yd.nl/
> >>> v2: https://lore.kernel.org/linux-bluetooth/20240102181946.57288-1-ve=
rdre@v0yd.nl/
> >>> v3:
> >>>   - Update commit message titles to reflect what's actually happening
> >>>     (disconnecting devices, not sending a power-off command).
> >>>   - Doing the shutdown sequence synchronously instead of async now.
> >>>   - Move HCI_RFKILLED flag back again to be set before shutdown.
> >>>   - Added a "fallback" hci_dev_do_close() to the error path because
> >>>     hci_set_powered_sync() might bail-out early on error.
> >>>
> >>> Jonas Dre=C3=9Fler (4):
> >>>    Bluetooth: Remove HCI_POWER_OFF_TIMEOUT
> >>>    Bluetooth: mgmt: Remove leftover queuing of power_off work
> >>>    Bluetooth: Add new state HCI_POWERING_DOWN
> >>>    Bluetooth: Disconnect connected devices before rfkilling adapter
> >>>
> >>>   include/net/bluetooth/hci.h |  2 +-
> >>>   net/bluetooth/hci_core.c    | 35 +++++++++++++++++++++++++++++++++-=
-
> >>>   net/bluetooth/hci_sync.c    | 16 +++++++++++-----
> >>>   net/bluetooth/mgmt.c        | 30 ++++++++++++++----------------
> >>>   4 files changed, 59 insertions(+), 24 deletions(-)
> >>>
> >>> --
> >>> 2.43.0
> >>
> >> I will probably be applying this sortly, but let's try to add tests to
> >> mgmt-tester just to make sure we don't introduce regressions later,
> >> btw it seems there are a few suspend test that do connect, for
> >> example:
> >>
> >> Suspend - Success 5 (Pairing - Legacy) - waiting 1 seconds
> >> random: crng init done
> >>    New connection with handle 0x002a
> >>    Test condition complete, 1 left
> >> Suspend - Success 5 (Pairing - Legacy) - waiting done
> >>    Set the system into Suspend via force_suspend
> >>    New Controller Suspend event received
> >>    Test condition complete, 0 left
> >>
> >
> > Thanks for that hint, I've been starting to write a test and managed to
> > write to the rfkill file and it's blocking the device just fine, except
> > I've run into what might be a bug in the virtual HCI driver:
> >
> > So the power down sequence is initiated on the rfkill as expected and
> > hci_set_powered_sync(false) is called. That then calls
> > hci_write_scan_enable_sync(), and this HCI command never gets a respons=
e
> > from the virtual HCI driver. Strangely, BT_HCI_CMD_WRITE_SCAN_ENABLE is
> > implemented in btdev.c and the callback does get executed (I checked), =
it
> > just doesn't send the command completed event:
> >
> > < HCI Command: Write Scan Enable (0x03|0x001a) plen 1                  =
                                                                           =
                                          #1588 [hci1] 12.294234
> >          Scan enable: No Scans (0x00)
> >
> > no response after...
> >
>
> So I think I found the problem here too:
>
> The problem with this one is that calling hci_set_powered_sync() from
> within the context of the write to the rfkill device blocks the write()
> until the HCI commands have returned. Because the mgmt-tester process is
> stuck in write(), it can't reply to the HCI commands using the emulator
> (which runs in the same thread), and after two seconds the HCI command
> times out and the test ends.
>
> I haven't really been able to confirm this other than that we're indeed
> blocked in write(), does this sound like a sane explanation to you?
>
> Seems like for this to work we'd either have to stop blocking userspace
> until the rfkill has finished/failed (don't think that's a good idea), or
> write to the rfkill device from an separate thread in mgmt-tester? The
> latter should be fairly easy, so I'll give that a shot.

Userspace code is normally not thread safe since we usually have been
using the concept of mainloop to avoid entering into the threading
support which might require locking, etc. That said we could perhaps
either not block at vhci driver, with use of hci_cmd_sync_queue, etc,
or use async IO mechanism in userspace so we avoid blocking btdev
handling.

> Cheers,
> Jonas



--=20
Luiz Augusto von Dentz
