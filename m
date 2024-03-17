Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BF3136A
	for <asahi@lists.linux.dev>; Sun, 17 Mar 2024 11:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710674821; cv=none; b=UXZQYXcHvpmAmvX1uQ3Cw9sB5Q+9oKh2jdJRxCZ5QAkLcebW1TddQ1i0akrw8l1MJUb7227tZa2pGtJ3q79rhZcYBpNkIP9+NJM473T+nsISPRl8qw9zH91AkZoRLp2cPo55FHtRVZ0VKon1G1jhtSA+4KexuOlloMIGH8AdtC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710674821; c=relaxed/simple;
	bh=KBpUr8+SiT/MU2ILAsWVDv4xHAMLrctHSSl34L+DKRI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pJajYDeDlAlfELB1/8HYVm430bqkbJlvKRSj9LbmiqX910cnn5aqkvQDoF8dcIEt8pZub+VsgOrxrkkJzsVWQLlXPSTUQa4yLCio7FtfmcowpB3e8jXIaaJZf6AwwISR91gXh0dqnxVTQyXcsSKLRCigxD8zbTa4m/FZOI17nm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a44665605f3so381920166b.2
        for <asahi@lists.linux.dev>; Sun, 17 Mar 2024 04:26:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710674817; x=1711279617;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L28hVGQTYDARzxNixZqeHURJbVFOB8qR0xfLOKnTTLQ=;
        b=E/YoyHMuVYASR5HhAHANsRNra2DQbXHJGbCfhnGH5WI7fpN2sEI6Z5Cfip1b6LZiXg
         qwZdoqqY5SlTsOsPq5/iLLeJw2TmajH4vX0kSOO10fwG0s+5o9c0jatsReEoCtTVLxw6
         fUT528P6vLA9QhyLJ2QhHsa+IOn/bS2R7vxceNpLE9DEVv7pSrK7BzEWUpHHg1feBexE
         6EwfYEH2w7ZCUm4TQT2aJwC0uyG+5YjBaVW1hVyCgPelpezd4qWdDWBqXsbeabVT/K7b
         LR8zzrN+us0u9tngeWKW4C6JDDycKFqW6MIwgSYtXzgndUO6OuJ4547yIjFiUurW92+a
         rTYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXD8lLwX9br2Kbn7qGZTStRkjgBNLlUE62jkvWumQDHRblQeu+azS3s6KLnCO8bPnn1KwfLtMbu9sT5qju5HKsiyPjOorA=
X-Gm-Message-State: AOJu0YybReaeid4maJNGdQgvpcz/9qQgK4hDV4wKVHyCkwwyOi0JcdA6
	5TaT3CVWYSDFs5Kwk+rH4SvZ6fubAAyZuW+N1m3AEJ2jF0uWnLE/EZsikAy1T6E=
X-Google-Smtp-Source: AGHT+IEeUJdbG/kTVvVrL10SXxpa1dfsGxSRWk1fyZmypT0dAwOCXcuIMHmni8Rx54GxwX60doaZZA==
X-Received: by 2002:a17:906:c78e:b0:a46:3a72:6853 with SMTP id cw14-20020a170906c78e00b00a463a726853mr4250342ejb.72.1710674816924;
        Sun, 17 Mar 2024 04:26:56 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id ly2-20020a170906af4200b00a466fccbe96sm3634302ejb.122.2024.03.17.04.26.56
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Mar 2024 04:26:56 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a44e3176120so447062066b.1
        for <asahi@lists.linux.dev>; Sun, 17 Mar 2024 04:26:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUEBD5LOGJmkyqXoNrhX97ohYbPAbspVlSCMOuLWpjktK7QsbaVIBmxOiMsgEaJfC4bEZg5j2ZmKKOf0MHSK3qWadZnlXI=
X-Received: by 2002:a17:906:338d:b0:a46:bc50:b087 with SMTP id
 v13-20020a170906338d00b00a46bc50b087mr308681eja.9.1710674816071; Sun, 17 Mar
 2024 04:26:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240317-asahi-keyboards-v2-0-d3f4b8384f68@jannau.net>
In-Reply-To: <20240317-asahi-keyboards-v2-0-d3f4b8384f68@jannau.net>
From: Neal Gompa <neal@gompa.dev>
Date: Sun, 17 Mar 2024 04:26:19 -0700
X-Gmail-Original-Message-ID: <CAEg-Je9KSs-Ve-p66U1p3K+gSzGa0hqLiXx3EoFYzb+0xBXJpw@mail.gmail.com>
Message-ID: <CAEg-Je9KSs-Ve-p66U1p3K+gSzGa0hqLiXx3EoFYzb+0xBXJpw@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] USB keyboard improvements for asahi / desktop systems
To: j@jannau.net
Cc: Bin Meng <bmeng.cn@gmail.com>, Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>, 
	Simon Glass <sjg@chromium.org>, Joe Hershberger <joe.hershberger@ni.com>, u-boot@lists.denx.de, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 17, 2024 at 4:07=E2=80=AFAM Janne Grunau via B4 Relay
<devnull+j.jannau.net@kernel.org> wrote:
>
> Apple USB Keyboards from 2021 need quirks to be useable. The boot HID
> keyboard protocol is unfortunately not described in the first interface
> descriptor but the second. This needs several changes. The USB keyboard
> driver has to look at all (2) interface descriptors during probing.
> Since I didn't want to rebuild the USB driver probe code the Apple
> keyboards are bound to the keyboard driver via USB vendor and product
> IDs.
> To make the keyboards useable on Apple silicon devices the xhci driver
> needs to initializes rings for the endpoints of the first two interface
> descriptors. If this is causes concerns regarding regressions or memory
> use the USB_MAX_ACTIVE_INTERFACES define could be turned into a CONFIG
> option.
> Even after this changes the keyboards still do not probe successfully
> since they apparently do not behave HID standard compliant. They only
> generate reports on key events. This leads the final check whether the
> keyboard is operational to fail unless the user presses keys during the
> probe. Skip this check for known keyboards.
> Keychron seems to emulate Apple keyboards (some models even "re-use"
> Apple's USB vendor ID) so apply this quirk as well.
>
> Some devices like Yubikeys emulate a keyboard. since u-boot only binds a
> single keyboard block this kind of devices from the USB keyboard driver.
>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> Changes in v2:
> - rewritten commit message for "[PATCH 2/6] usb: xhci: Set up endpoints f=
or the first 2 interfaces"
> - Replaced the usb keyboard Yubikey block with an env based USB device bl=
ocklist
> - Use "-EINVAL" as return value in "[PATCH 3/6] usb: xhci: Abort transfer=
s with unallocated rings"
> - added "Reviewed-by:" tags
> - Link to v1: https://lore.kernel.org/r/20240221-asahi-keyboards-v1-0-814=
b2e741790@jannau.net
>
> ---
> Janne Grunau (6):
>       usb: xhci: refactor xhci_set_configuration
>       usb: xhci: Set up endpoints for the first 2 interfaces
>       usb: xhci: Abort transfers with unallocated rings
>       usb: Add environment based device blocklist
>       usb: kbd: support Apple Magic Keyboards (2021)
>       usb: kbd: Add probe quirk for Apple and Keychron keyboards
>
>  common/usb.c                 |  56 +++++++++++++++++++
>  common/usb_kbd.c             |  61 +++++++++++++++++++--
>  doc/usage/environment.rst    |  12 +++++
>  drivers/usb/host/xhci-ring.c |   5 ++
>  drivers/usb/host/xhci.c      | 126 +++++++++++++++++++++++++++----------=
------
>  include/env_default.h        |  11 ++++
>  include/usb.h                |   6 +++
>  7 files changed, 227 insertions(+), 50 deletions(-)
> ---
> base-commit: 37345abb97ef0dd9c50a03b2a72617612dcae585
> change-id: 20240218-asahi-keyboards-f2ddaf0022b2
>

Series LGTM. Thanks for this! :)

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
