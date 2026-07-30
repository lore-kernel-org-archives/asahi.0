Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E169C42047A
	for <asahi@lists.linux.dev>; Thu, 30 Jul 2026 14:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785423340; cv=none; b=l5HzhWmibF2AJAgzOCMI3KSE9A8hCw1qnXoZqL9Okaa99WNzeTtqDHDN9/tm+F1jxh4b3byVeorrmbPUi6nxJAnTZuiiKjZKTTZlP2iHOAu0l4w/foRAy2pOH7fyixlqBQ679AkNmOMaYBWgrIjA+8HWaqWI0wXDikUKai4xpps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785423340; c=relaxed/simple;
	bh=ynnqOp+fL3o9kKSR5OhAp0hTRoEdDY/H2zHWYl6VcPk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L97Ar5tG9vemGRGZS8Pra0Cp2CDeBbW+MAS7Z8E/xkIWtWBAwuj1RGJyCHNoTCiJEkxZ+9Yp+WAdo7AW65+7yDt+6Eqp0VbK8DNFY9kcftLFlts2h88vhHKuGA4C5KkS9aS9fM1rso7ErEAjEMfOIGnnliC5ni2V18//LqUvGA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6aae5eb0ee0so812078eaf.3
        for <asahi@lists.linux.dev>; Thu, 30 Jul 2026 07:55:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785423338; x=1786028138;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NdSKHD8tzJ9JeGjNeD/cemvIL5cN9rQR/KTJiq4Qf/g=;
        b=GLnyD17c58tVobWgszXy9SPPGgy7L7mfePhDDRuyuvJxffPldpklra6ZL77BlCu+rR
         SrC/bU/F6q3R1A4okf++/WThT0h+6zNCcthR6Ud9GFwKtyTFY5zkP1PkqP9umkrR0121
         TAlTgndqmFV1cChyywSpgw3hjLgu6+1GnYZ8Knih0dxzAR0UDgts9IHFHW9BLMfygH0e
         4HJG7RzJxQiz2uWNWnBwB/CnUt6EdR0fdiM+nPUBPZRygnR09MbV/77dIxqtJnQALpe8
         zc5Z6GF3XtfmalhdjgacvpGlFkaSt0dCWg8ulUF3gWK4oed0Wb896uNholKHm30YWYq7
         /5mw==
X-Forwarded-Encrypted: i=1; AHgh+RrmuDWvlrQlvZNHy1iHn8iVlWY57c4/7YTBx5FrmDbGc0rjrrjrK9tLOYaxFyg/+naiNfVssQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwFxBd2wfNWnyyuShkQdqkRr9FFWl47BPSKOV92JdculZAselJZ
	ZogigRR52yYR3UCY/0X5Jl+WWrNWwaSsh0nZ8DnnlEH7jE1nxgamG954SnKH7C4Q
X-Gm-Gg: AR+sD11o1VNpFMi5KeMuU6EtucyFZK20Hy/oQnJp7yk1CHGCW9i5FmhA5vQ7ekTB5AE
	P7+b0j62jEylo3RCig44UOVLKGTvvkP7SiWjDJdsNNanfJJ/JTN8EldBcJ9A+1P7ouEe+whNUjn
	2UPfPgyVeC5CgwROsDlBEUtXSKKx5IKAI9M+qjdpFNqh5YXZNi1ekDEjWNo8uuuTFZsUzkIRAMS
	1WTMemVB7lSymOgwT9GcODPX4ZbHoz2mrceHi1KrJo7m6/7H2QvfhG/lbjsBsyB2W3ZTiS9UtCT
	Yc4TdPX7QhUtdgvi6NQo4xOs1/tCcS2Zgr8oNW1ztwn2d50MWNfrR+kPbqS7ahS4exxJW6n9IEN
	ry/uSf4lRnRw4jecxoXpeLOukscgnRmr1yGf7iy/xxoJYVrnwccpmhxF0cey/ksc9HTy/7vGqfu
	wRjMxia93AByN3ACgHeGg/fzlXzwLrL/el4sqrob66aRfIIv+R3K88t3piYx6lV7azRojd1nDwt
	Cazs7y0ctAp1aAr5H6ClGRk6fZtJoN1P6yaKBLKFoW3CeXj+5v6HIDMBXAKGWUZySHiRv5PyN5u
	1uy06HFwoENlKYp6crt4cwKVto92PKYU1dXXIuIb42VBIQ==
X-Received: by 2002:a05:6820:2227:b0:6a3:d77e:725a with SMTP id 006d021491bc7-6acbbf101edmr1704545eaf.20.1785423337481;
        Thu, 30 Jul 2026 07:55:37 -0700 (PDT)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com. [209.85.210.50])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6acbc5d0273sm1624446eaf.14.2026.07.30.07.55.37
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 07:55:37 -0700 (PDT)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7eb64085c45so1654948a34.2
        for <asahi@lists.linux.dev>; Thu, 30 Jul 2026 07:55:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpEYJwDhyUViVG48uJfy7pqqiFFI4/Osz8rZjKKgFpRgkTwNIsW9wKlBeJjbeABRzPhPajc5w==@lists.linux.dev
X-Received: by 2002:a05:6830:4181:b0:7e9:ea18:d1ef with SMTP id
 46e09a7af769-7f02c1c499dmr1923471a34.26.1785423336851; Thu, 30 Jul 2026
 07:55:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260730004759.3089449-1-neal@gompa.dev> <2026073019-emoticon-decidable-200e@gregkh>
In-Reply-To: <2026073019-emoticon-decidable-200e@gregkh>
From: Neal Gompa <neal@gompa.dev>
Date: Thu, 30 Jul 2026 10:55:00 -0400
X-Gmail-Original-Message-ID: <CAEg-Je9X8ho7LyiRBL+z9aWf-EdwmgDdrzgfB3KaOaVGiEx_xQ@mail.gmail.com>
X-Gm-Features: AUfX_mwjt69Y4UONttNjpaGx_OmQhWJKzuOHScfgxTx8mxHBAZO42ivbKWNG3y0
Message-ID: <CAEg-Je9X8ho7LyiRBL+z9aWf-EdwmgDdrzgfB3KaOaVGiEx_xQ@mail.gmail.com>
Subject: Re: [PATCH] firmware_loader: Add /lib/firmware/vendor paths for Apple
 ARM platforms
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	Luis Chamberlain <mcgrof@kernel.org>, asahi@lists.linux.dev, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2026 at 2:01=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Jul 29, 2026 at 08:42:58PM -0400, Neal Gompa wrote:
> > On Apple ARM machines (branded Apple Silicon Macs), there is
> > non-redistributable firmware provided in macOS that is required
> > for Linux to leverage the hardware to run properly.
> >
> > The firmware covers Wi-Fi+BT support, USB, hardware ISP, the touchbar
> > touchscreen, and the trackpad.
> >
> > In order to ensure this firmware can be installed without messing
> > with firmware provided by linux-firmware and other packages that
> > put things in the tree, the empty "vendor" subdirectory was created
> > to serve this purpose. This directory is used by the asahi dracut
> > module as part of the Asahi Linux installation process to transfer
> > firmware from macOS to the newly installed Linux system.
>
> Why is this needed when there is the ability for userspace to add their
> own firmware search path to the list today?
>
> We aren't going to keep adding random paths here, please use the option
> that is designed specifically for this:
>
> >  * fw_path_para - module parameter - default is empty so this is ignore=
d
>
> Right there.

I was not familiar with this feature, and I had inherited the patch as
part of our cleanup effort to upstream the Asahi work. Sorry about
that!

Based on the documentation, this is the patch I've created for our
dracut module: https://github.com/AsahiLinux/asahi-scripts/pull/72

Is this how it is supposed to be used?


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
