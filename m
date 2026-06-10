Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF220346FDA
	for <asahi@lists.linux.dev>; Wed, 10 Jun 2026 17:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781111638; cv=pass; b=BqDKbAJMVaqpl+zRVp0ePQ5LMkcQDgOZIWEdeDhcHPZOdENnwxbTxrviIza7Qa0CvJrty4jEOEwEQuRiTgHd2vD6W/lTant9Cxv//gfKDp8yoA0Xn2aDEypkmsleFlmBxLEcy1KDvz/c3+t0BXxjXS27Cj5BMwhoCh1grL3xdhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781111638; c=relaxed/simple;
	bh=RErhEsQs2Hc6r2DUSHczI57A2dhYKImKPCppGHJn1s8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FRUUw2f+NzQ30R3U15xeG3+8KvvN6MrlIHy5qbNNKLsOyco7PKdpz4Yq1vKdHFDZRgZovuPJWOqIvqpA4RyN7bogHssvCut/tFOSXVPeoXK+2Q7uQOoepJ4NfWq/lohkWIf4Pc1dJKC/Wz/GCT3+6hstMtt9NeKXInQ//+EnnxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1YPf9Nm; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1YPf9Nm"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-66077e888b2so7095161d50.3
        for <asahi@lists.linux.dev>; Wed, 10 Jun 2026 10:13:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781111636; cv=none;
        d=google.com; s=arc-20240605;
        b=jHb5jzdT4ar4byU2wbiJbZvqMr5KZbIZXQeOvciEUniw0yX5k9+IDf9oKQ5MalPEwn
         S+KQI81Ah9+Szjk9eXxhJgacK2QgPKplTiigAv/e/k7tIjAYB3yKjGRr811twnGJ1WY0
         rWa5fi8PMQfsS35MbQg3MX6xhVHmle/U5ByolpG5bU06mKepk8wsHycS0JuJ9UIQzLvV
         o6TwrZztmjeh9Ox/cz0XwF7S/78Gp5juVf9gdb//B5DyePtnfFpuqku8ls+i5oD9wqvy
         vG5TBlttKsAo6wUd9icLR2IV4mcCmkeINdjEwiUUUy59Tg+Cr/3X9o7fAgEiev5o6LN1
         7xLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RErhEsQs2Hc6r2DUSHczI57A2dhYKImKPCppGHJn1s8=;
        fh=/V4VEoBhQOHdnkXDC/CztG+N/i343UXUbnJLbhw6F9o=;
        b=MFPwyFqGMLJGhGguvwoJboVHjmZ4ONE+u5FKN1y4Pr1FPJ4ZDt/rFJgITVTO9EMz98
         sf9sQx05b9mvuA9nr+MRgI4V3UCgxJDq1HY9Kv+WLMSrjWDjCM6jezf9HeWIDVT+4YMy
         YjEjjTTstgNGDkGtrpgkbK180fgqr+S79BTQLuZNmL+T8+QevY3G+UER+2GmeHNwRM8M
         vBhRqzD+tFAOAJIkOrqaZCEAeAQN299spsev0u0oU/QVpjroYf+HdVe7lafeCQDO2ZEL
         lVZR5JZEaW6CZWjAbvzV8hZWbHNeYH/esDM8jHkkswr0AMd/LXVvDSKXDNx+ZvQ2kfqU
         iVZQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781111636; x=1781716436; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RErhEsQs2Hc6r2DUSHczI57A2dhYKImKPCppGHJn1s8=;
        b=F1YPf9Nm48zVpljyyuXCf/jb6USodO35glxs9nE2xQGD7ZNs5/WIBeneCb+oOGfeQr
         zlZvLyA6DaD7cOt+/Sn2N1q6STgWHioHo1VrnGT0j/tu5JLPqk9Nu+sUyyWyGpWPf1ed
         McWX+Z1uUp+gutr6fy5XzLKpeH5Lx+WoDQixZiKnzONXqlZ+rgvzFvhWutl70QhjWNEY
         DImewRUwdL5RhnRRAKQ2TxYKEM5e1i8sNchsb07/b08xbu5L8QwwCSwpPtUMhs5vjnZr
         DnrVBzKAled4gpbnaqtTo7vrhT36rHjdlz3/LNIfXxTX5upqaqtVBYK1y6iqmZjfukrg
         diZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781111636; x=1781716436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RErhEsQs2Hc6r2DUSHczI57A2dhYKImKPCppGHJn1s8=;
        b=Y+AszZMmLhGgCNzhMNjwc/qhenG30CeO4JHQiYo1XLrJSfSKXUDUWgJHu5ubQdSvZ3
         WKR1B98D8iohUWEB0kBHBzgZt1pVbNONlPcYHp5HRkJJmqtLz6m95miUh0/4B4qMfMNk
         vUVNXrS20wriwKwTJ5s0SqeOK8lrMsg0pSo+90S3X43E66iD86PtQBhHfckE3m6GgFUu
         3Gpp/9aFfWGsbIAvxyS4d+G3iTeehm+43l81g31l4A9ZuBVT8BQRv/+BzSOlmsWa94Hz
         IKYKqSulDfxtlfVIx6mCm+n3rv+SH3KgGBz66LaA+b2NAM9MCTYZuinZtJcQPtrlCPqt
         jg5Q==
X-Forwarded-Encrypted: i=1; AFNElJ/zkn+rfb03yM9S6caHdo/o+/MCLoEqwnWoSTGeDDeXTrD40sWbXISMF2WLsTu1QVhlmv9lAw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyQMmBuV1UhsITCmWRJee8azsfVJ5Y3cxFBJ6/8KrN7oQLFpdEb
	8nqhdsb1ukBeavGvgmDj/4l5RVjCeUypG/R+Z9VhHkFVzoMXKX4O/GIyg+n4Brx2zw/LtWvz/g0
	nCZ/KiwZ9YTd3KHZCwjrAo1qB9A5d2uE=
X-Gm-Gg: Acq92OHJhBPDTgL2CpOeavpoyenUOnTtANW/Pl7WKY1ZplKjdcKIJpkR08quYrtsAs2
	jhylmnbLEi7c7rgTi9ZBfj0rgm4u8f+22sAEnoU0/VTsvBdKNXEBzOTTxeWQEeAqBz4MQeVPuLu
	73ZhbhhU4B0U1vnxehQss4HaPo+3lVp8EGciZQVqryUmWgGBXi5K1LMgqICBQhvBOjma3Kj9kfz
	+lnsCwmM+VahK+wFFIV52WGmypdttx6eLFENyHKqtOpb5yVLFlcfM6Re0UlGIiTfLuBc0F79w9q
	0tWL1PsGTw+Q2f341trB14T8tc+bT1SNBoh7+rrWcuHmCfwBk65LhPYIxKkLl5mXXGZDiFeVzu/
	Q1GEC3ZzNaCeUzro=
X-Received: by 2002:a53:b88d:0:b0:660:82b0:d38e with SMTP id
 956f58d0204a3-66106f8de18mr18309309d50.52.1781111635941; Wed, 10 Jun 2026
 10:13:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260504160940.2168650-2-u.kleine-koenig@baylibre.com> <aimXkX4FC4JVxt6q@monoceros>
In-Reply-To: <aimXkX4FC4JVxt6q@monoceros>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 10 Jun 2026 13:13:44 -0400
X-Gm-Features: AVVi8Cc2yCwPpJgRGZEngfFOksAG5gfPPMtu7ftS2bMAppzj9N6wERU4TkZ0QcY
Message-ID: <CABBYNZKuOdtxa8ksEZM1FyjYJCQ22H6NzaX31t6LcZuvn0LMNg@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: hci_bcm4377: Use named initializers for
 pci_device_id array
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Marcel Holtmann <marcel@holtmann.org>, Markus Schneider-Pargmann <msp@baylibre.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Uwe,

On Wed, Jun 10, 2026 at 12:59=E2=80=AFPM Uwe Kleine-K=C3=B6nig (The Capable=
 Hub)
<u.kleine-koenig@baylibre.com> wrote:
>
> On Mon, May 04, 2026 at 06:09:40PM +0200, Uwe Kleine-K=C3=B6nig (The Capa=
ble Hub) wrote:
> > Initializing a struct using list initializers is hard to read, compared
> > to that using named initializers is more ideomatic. Convert the macro
> > used to assign values in the driver's pci_device_id array accordingly.
> >
> > This change doesn't introduce any changes to the compiled array on an
> > x86 and an arm64 build.
> >
> > Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig=
@baylibre.com>
> > ---
> > Hello,
> >
> > this is a preparing change for making struct pci_device_id::driver_data=
 an
> > anonymous union (similar to
> > https://lore.kernel.org/all/cover.1776579304.git.u.kleine-koenig@baylib=
re.com/).
> > This requires named initializers for .driver_data. But even without tha=
t
> > this is a nice cleanup making the macro better readable.
> >
> > Gcc is happy with simplifying the assignment further using
> > PCI_VDEVICE(BROADCOM, BCM ## id ## _DEVICE_ID), but this is a bit fishy
> > because PCI_VDEVICE also assigns .class and .class_mask (using list
> > initializers), so I didn't convert that.
>
> In the meantime I learned that doing that would break W=3D1 builds, so it
> was a good choice to not go that path.
>
> > Once all pci_device_id use
> > named initializers, the two zeros can be dropped from PCI_VDEVICE and
> > this entry simplified accordingly.
>
> Is this patch still on someone's radar? Ideally for application in time
> for 7.2-rc1?

It is no longer in patchwork so if you really want to get in please resend.

> Best regards
> Uwe



--=20
Luiz Augusto von Dentz
