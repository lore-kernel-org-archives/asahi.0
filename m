Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769A93BFE4A
	for <asahi@lists.linux.dev>; Fri, 20 Mar 2026 14:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774015271; cv=none; b=QD9ku3VrmGJY/wQ1PahFKUSh1VVko2lWfwYtHprPuqvT5fMjEKPaHj/nVrnF9sC7vHlAduH+6gQlTdXtBtoCwL/WMsM5HsMmMlB6EncEKis9rgSh8X9L8ITs9XKovhbR4wFVXfyQZ5YeeP3LfqjSVy5sgGvIOs3NtWkGyLLNC+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774015271; c=relaxed/simple;
	bh=Nx8bQBs95SJZiGV9sxDUOjb6cqnHHMShwIEg031kToo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SR7QgqnOIvBgU+lV64K+Zy39IVsVnl7cL3cDaGV4K+HEnzrh6FdxaBAQl7JHC+F/iHp1B+BMcwqmVFYGLWhrFGPcURoDYKO46rvWjE4C8pwnf76EYmqCTibD6XHb9iBMY9JuUUQ+6u1+IW8Kihh55lG7TCYnXnvm3TTFDIPM5pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7d7851e2cc4so1880958a34.3
        for <asahi@lists.linux.dev>; Fri, 20 Mar 2026 07:01:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774015267; x=1774620067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=txsLO2jkdNhN6oBkuArfXNgiBSygoSMNA3GUMB3p1q0=;
        b=VkphAabuVZjT8d1gfspCS8SHDVdRD2J6wCRi0oHYA/A2PrbQA4+eIkeKMe1axzD1MB
         CVIynfSVkiOgLAoBzM696InR65oKWnpUEWuQfABYv9mY6jHOe5zlZt6/sDJZvck8BPxs
         xHF0LaaG9+d0sEq0ssUYQa5yXYpgvZo4Cl5Lhl369IlO+2zB8+dFIxhiJAEOxGFk0kJD
         O771e7weysbQNmvO3CXV93JgzatFohZU0msSLmhHit7N3uoxs4FA+qSSmvr7WbfXG6t1
         pDr3v28Ys282BU/DR/FRhbStd5jROHulhsiIAzWD/7/oNfORYeci4iP5ORnNKlG5Czqg
         /JpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhRwu1i3mfbfGFEE81u0IukZOR3hdU2ra512AMebFqOnhFRHuQLxanA+/54/B3PvQPfvw4wA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+fAOtSfxjvG/2KufTtJKCtX7vBFI1VwETsqax+wp4FBy489gM
	ZFGnDmtbOpvdwunbKhaZaLWNpWfqu/N89nuladvWOo2hynLen8PgVjvM7pc/gxPR
X-Gm-Gg: ATEYQzxhg3IfaWL7XAMT4ls4/iDTsPeFqKXTdqwx3j3SKYuszVH0GQvaDyOba9ftJRy
	t+TrD66eOH0szML3jfAmoBxGHyxSlytf24Hv/3I4c8nJGD/ynCgRoWBFymQeV8Ej3MWmImfH4yQ
	Q8GL+fAlpSU5hkJVnCOeP/mOA2I6OYbMJo1uSycKczq4w74iqx9+Vew5Gj4076uwvQDFyJyuVm6
	HRqYk6qzLW9czdR8RN+3gqHaLe8a0AGfw1o+lHNazBOxDLeYsUJOhJpqBR7XITXyWZlMOmOX4K/
	dckf4v7erROf945e3l1fVEDkDk480cLSq6r+hIWjdeO+8acPP0BL1N9jYkPt8KdHNJZsusRKMjY
	IwBZNusfJHCj6YN1Onz97tEuP3um5bFKiqWauHSFBurqQZg07rl34gHoy9IDvXbV6Uf5hzfoFxP
	EFHFfiuGlR/RxYES4ltdX3agcsb8/xDk064gBaf0U4NZw3goNc/V8ZqAp+PwVmF9maUx6nLuk1C
	cTicCYI7Luf9IpCSSCd5a8xdf6o4pQg0uJHHSRqJvdmWEJat0RWyuJJdy4f9B+5TcrpyzXaCg==
X-Received: by 2002:a05:6820:2212:b0:67c:2bab:bf5a with SMTP id 006d021491bc7-67c2babc2d6mr547435eaf.41.1774015265652;
        Fri, 20 Mar 2026 07:01:05 -0700 (PDT)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com. [209.85.210.54])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67c251a58dfsm1175706eaf.0.2026.03.20.07.01.03
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 07:01:04 -0700 (PDT)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7d743cd9e5bso1320864a34.2
        for <asahi@lists.linux.dev>; Fri, 20 Mar 2026 07:01:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXZDu/zVsxZfcolTebmbxn47ovkELcYu52NsBlDkL6zt5OFtGW+ZeifE83XN68FSU/IWM9Nlw==@lists.linux.dev
X-Received: by 2002:a05:6830:67c5:b0:7d7:d15a:ce8e with SMTP id
 46e09a7af769-7d7eb04feffmr2015751a34.32.1774015263260; Fri, 20 Mar 2026
 07:01:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260320-apple-m3-initial-devicetrees-v1-0-5842e1e393a8@jannau.net>
In-Reply-To: <20260320-apple-m3-initial-devicetrees-v1-0-5842e1e393a8@jannau.net>
From: Neal Gompa <neal@gompa.dev>
Date: Fri, 20 Mar 2026 10:00:26 -0400
X-Gmail-Original-Message-ID: <CAEg-Je9b1VujkHCVdXowQs+BXA0+DL=6sdoP0wuSYpau4T31XQ@mail.gmail.com>
X-Gm-Features: AaiRm53Q86Nf9dVOSTKn0cYEE4xmDvp3jUYoCfYFj-SX9hFNk_weUYFVfwHr6Ok
Message-ID: <CAEg-Je9b1VujkHCVdXowQs+BXA0+DL=6sdoP0wuSYpau4T31XQ@mail.gmail.com>
Subject: Re: [PATCH 0/9] Initial Apple silicon M3 device trees and dt-bindings
To: Janne Grunau <j@jannau.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Sven Peter <sven@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linusw@kernel.org>, 
	Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Sasha Finkelstein <fnkl.kernel@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-pwm@vger.kernel.org, Michael Reeves <michael.reeves077@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026 at 8:23=E2=80=AFAM Janne Grunau <j@jannau.net> wrote:
>
> Hej,
>
> This series adds initial device trees for M3 Apple silicon devices. The
> device trees contain only a minimal set of hardware not going much
> beyond the minimum required for booting kernel and initramfs and
> verify via serial console that the hardware and drivers work.
> The hardware with the exception of the interrupt controller is
> compatible with the M1 and M2 SoCs and the existing drivers.
> Changes for the interrupt controller were sent separately in [1] and are
> picked up and in linux-next. The device trees pass make dtbs_check with
> the apple,aic2 dt-bindings change from that series.
>
> Link: https://lore.kernel.org/asahi/20260223-irq-apple-aic3-v3-0-2b732807=
6b8d@jannau.net/ [1]
>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> Janne Grunau (9):
>       dt-bindings: arm: cpus: Add Apple M3 CPU core compatibles
>       dt-bindings: arm: apple: apple,pmgr: Add t8122 compatible
>       dt-bindings: power: apple,pmgr-pwrstate: Add t8122 compatible
>       dt-bindings: watchdog: apple,wdt: Add t8122 compatible
>       dt-bindings: pinctrl: apple,pinctrl: Add t8122 compatible
>       dt-bindings: i2c: apple,i2c: Add t8122 compatible
>       dt-bindings: pwm: apple,s5l-fpwm: Add t8122 compatible
>       dt-bindings: arm: apple: Add M3 based devices
>       arm64: dts: apple: Initial t8122 (M3) device trees
>
>  Documentation/devicetree/bindings/arm/apple.yaml   |   18 +
>  .../devicetree/bindings/arm/apple/apple,pmgr.yaml  |    4 +-
>  Documentation/devicetree/bindings/arm/cpus.yaml    |    2 +
>  .../devicetree/bindings/i2c/apple,i2c.yaml         |    4 +-
>  .../devicetree/bindings/pinctrl/apple,pinctrl.yaml |    4 +-
>  .../bindings/power/apple,pmgr-pwrstate.yaml        |    4 +-
>  .../devicetree/bindings/pwm/apple,s5l-fpwm.yaml    |    1 +
>  .../devicetree/bindings/watchdog/apple,wdt.yaml    |    4 +-
>  arch/arm64/boot/dts/apple/Makefile                 |    5 +
>  arch/arm64/boot/dts/apple/t8122-j433.dts           |   19 +
>  arch/arm64/boot/dts/apple/t8122-j434.dts           |   19 +
>  arch/arm64/boot/dts/apple/t8122-j504.dts           |   37 +
>  arch/arm64/boot/dts/apple/t8122-j613.dts           |   35 +
>  arch/arm64/boot/dts/apple/t8122-j615.dts           |   35 +
>  arch/arm64/boot/dts/apple/t8122-jxxx.dtsi          |   48 +
>  arch/arm64/boot/dts/apple/t8122-pmgr.dtsi          | 1149 ++++++++++++++=
++++++
>  arch/arm64/boot/dts/apple/t8122-usbpd-i2c.dtsi     |   32 +
>  arch/arm64/boot/dts/apple/t8122.dtsi               |  444 ++++++++
>  18 files changed, 1859 insertions(+), 5 deletions(-)
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260319-apple-m3-initial-devicetrees-5c546ad977a2
>

LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>

--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
