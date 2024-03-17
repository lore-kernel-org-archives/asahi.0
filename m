Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6707484
	for <asahi@lists.linux.dev>; Sun, 17 Mar 2024 15:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710690726; cv=none; b=ino7mgllpP+521VKM3GCRm/fdKDvF0cWpYKvTE5Q5m+RqXGfkA9CgnJC9qp4pzk+2zP/XgomxteR7piqccMHVhajXTw+/rfwvog5jw9zQfZZuj0MHAI/2A2Iat9w7p7G/bzvCj9SDvPw0Dcujm6DeJmJs2gZfU8KYdt8vyrJEeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710690726; c=relaxed/simple;
	bh=vQja5Dm7E4FH7vNoFvly5tZGPWKpufqkDJpGdyD+kH4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZFK3nlubkrlghZNI0VY9mRReE6NuGKRJ6uaSiwKsC72W3B6dwLD3skzxDap+3ijAU8sqe8bysH83hb19cA0N/pvR+JFuVeUsEg20VS+zETuWxvP0Fv6jKGKvyL8YrrxiKXxNF27UPVucGhh7l3sFgaeufVREcjS4XauYL01s2pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-565c6cf4819so7951226a12.1
        for <asahi@lists.linux.dev>; Sun, 17 Mar 2024 08:52:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710690723; x=1711295523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S+1daUl7RQJOxUjNePwtmnUxaWO4L5xItqbCG0F5brY=;
        b=lOz+S9T1TaDtKbhkDjqzY3uzAQPe+zZwh8xh5DrbFkykKOvhzlIW2XhoPHUDnCw6vh
         4Tg+uDjx+5a/u155roBuvXrEMots104mk2SbGXPXiiYrAt1f33y8E8pkWy5BBahnNCRt
         sRrbDsPudBbzOZ0gPiGzS7McQMISqX8PyB4Jqu2t5CIyk1rtMmvylQx30BBE64ELeXNr
         g54SabERjqVr9NSLtVUsi7PC5NRMibnCiO5gCvYhF5z6Kpvsu0pXF91PFWPWoUY63hnR
         dpMXhLp902mkw9l+urRZ5FfmW4WfKOSdDqkZWAfVRpExocnjs3p0WLlLZmhng2zhzv6T
         4MTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXd2S3byCBPP7QMnUXxTlAwKrcC0ZKRR2aLY7b7eocWxTn2nAsSjU4XNnlPj51CH1ItjnsAjslg95FLlwuRVbiCgOsG8uU=
X-Gm-Message-State: AOJu0YxuXHpyKE6JvyKjyTkAxCrlGwbEYbHdvxPalWfLecjeKj13KSDT
	gDilzi1hLymNcqWgscYBXfY89da2j5e7TKkvrYa/wGZ/b5otMwMy5XLKhgsFk0Q=
X-Google-Smtp-Source: AGHT+IH0rypFR0/xNdgc24jvy8OykCgf0aPS++5kDe7NZA+ouo5vzUDDdH1+H5VewD9OWjBsJqQhfQ==
X-Received: by 2002:a17:906:2dcf:b0:a46:b821:83aa with SMTP id h15-20020a1709062dcf00b00a46b82183aamr1162742eji.23.1710690722810;
        Sun, 17 Mar 2024 08:52:02 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id h25-20020a17090634d900b00a454438091fsm3871072ejb.70.2024.03.17.08.52.02
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Mar 2024 08:52:02 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-568aa3096e9so3859659a12.0
        for <asahi@lists.linux.dev>; Sun, 17 Mar 2024 08:52:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWaKUJFzNnhc9PLGpyAMMjqQLy8hZ8473KX5vxGVN4UGpQg+rJ0WxT0ucv68GlVzLmT3DkvTyFvscAS/D+kC/zqdgev/iM=
X-Received: by 2002:a17:907:6d16:b0:a46:a8b8:f4cf with SMTP id
 sa22-20020a1709076d1600b00a46a8b8f4cfmr3390694ejc.35.1710690722073; Sun, 17
 Mar 2024 08:52:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240317-apple_config-v1-0-1b862bc140a9@jannau.net>
In-Reply-To: <20240317-apple_config-v1-0-1b862bc140a9@jannau.net>
From: Neal Gompa <neal@gompa.dev>
Date: Sun, 17 Mar 2024 08:51:25 -0700
X-Gmail-Original-Message-ID: <CAEg-Je-mnLRGhSnMgwffXek-P4vJj=S8Kbog6EgwEyrQOpMgmw@mail.gmail.com>
Message-ID: <CAEg-Je-mnLRGhSnMgwffXek-P4vJj=S8Kbog6EgwEyrQOpMgmw@mail.gmail.com>
Subject: Re: [PATCH 0/4] configs: apple: Switch to standard boot + small adjustments
To: j@jannau.net
Cc: Mark Kettenis <kettenis@openbsd.org>, Tom Rini <trini@konsulko.com>, 
	Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de, asahi@lists.linux.dev, 
	Hector Martin <marcan@marcan.st>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 17, 2024 at 7:54=E2=80=AFAM Janne Grunau via B4 Relay
<devnull+j.jannau.net@kernel.org> wrote:
>
> This series contains a few misc config changes for Apple silicon
> systems:
> - switch from the deprecated distro boot scripts to standard boot
> - allows EFI console resizing based on the video console size
> - enables 16x32 bitmap fonts as Apple devices come with high DPI
>   displays
> - enables 64-bit LBA addressing for USB storage devices larger than 2TB
>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> Hector Martin (1):
>       apple_m1_defconfig: Turn on CONFIG_SYS_64BIT_LBA
>
> Janne Grunau (3):
>       configs: apple: Use "vidconsole,serial" as stdout/stderr
>       configs: apple: Enable CMD_SELECT_FONT and FONT_16X32
>       arm: apple: Switch to standard boot
>
>  arch/arm/Kconfig           |  2 +-
>  configs/apple_m1_defconfig |  3 +++
>  include/configs/apple.h    | 24 ++++--------------------
>  3 files changed, 8 insertions(+), 21 deletions(-)
> ---
> base-commit: f3c979dd0053c082d2df170446923e7ce5edbc2d
> change-id: 20240317-apple_config-981fcd9028b9
>

LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
