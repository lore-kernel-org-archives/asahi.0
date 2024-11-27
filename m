Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6914B13C816
	for <asahi@lists.linux.dev>; Wed, 27 Nov 2024 08:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732695869; cv=none; b=b82NOlHLg5OHNUMHUJjZzSDfKSdwb7/TFFBWivIhnuT08PfbdUaE+3dDuHx7U2nOVtz6ld8vv6Ve8euxPYpN5f1C4p2LOSenVydPJKxEMkxBdTV9QokbzRpi3ABhkQ7QiL/z4umjq858hgIYNTRnpsugpMN0RUeUsDgKlUDZOnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732695869; c=relaxed/simple;
	bh=6PxgdC42a8ZvRFETs70k63iKhzy70aAH+Rwgk6+gxnw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NTUNUudE8Ed5xVzo7MdwhFVYa0icsqz0EauWBRaoOIRZU5tKs32HodKbEy4DE1Z6o7oyrPzmdN27YKn7yZW/numYJoDd74fL6JdATelNrNKYxxcaNGFwx6mhbJ7ByYBinc2NU7JhZ6fHcw80ZR0w2kv4UW0Iwu8lxa2jolsycIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XAXTEDyy; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XAXTEDyy"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e3836b1ed44so448466276.1
        for <asahi@lists.linux.dev>; Wed, 27 Nov 2024 00:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732695867; x=1733300667; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lOqsn9U9UwR9ECKJB886+Y24JEgcO/1OMJG6KFsH084=;
        b=XAXTEDyyrte4r4Y/TDkC+E6A8x4MfBKL4BG7ujeGj2/gz9NTCR6VbR9zcurNEoQkiL
         v5MJJMAkWQnBiP1oo3kRIRKa1MDQLgWVGJNvN/TOL7OQFeLAPDRrsF7wZpaTttQYviqT
         5wmJfoItRFzIrUkm/PNFUdxX8pZniwtTNNLWOUBqLAgYbKl7spY7SMVI7hv51s0Ur6j6
         y+o6p88W2KEn0obhjLFfiky0POBFT6O6cZ3uimJ2auSb3cf10MSG2VYXuJ6fDGglbSqj
         K7NG+Z3/EEQIAwlkiuLYo4T7ye8zQs87ujLV9t5WkkApbhux5tFyvFwLESpcJOX3OHnN
         s8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732695867; x=1733300667;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lOqsn9U9UwR9ECKJB886+Y24JEgcO/1OMJG6KFsH084=;
        b=Wo7pZybFemgGt+yPPpSlmFNEPThmX3pJ3O600554Ti30wvNPjBH3F+omb3PgkaT8fm
         mO3G6ycEPfXTCLyo7ZNs8Kt1QvGHikVhKaVwlXPqoSYpUY5SXM7wqZReia7XRyK7MB0r
         0LxE7TIp0prvAfH2Ib63AXZ7JOYPS/6E5GQiFVBbSso4+c/Ks1d8oCrGcI4WHgA5dZ+W
         bvKyjptWrv/sLRGRyBZxbBYUZrycFLE9smcXwOiZbuzLR4ujqmOyt1hD80L9NNaqBcMW
         Q8bu6Jjx2ad5i09KsxRTYOWW4f7B+wYX0QNgk9Bruu02h+r0mqwSUS9F3+3J4gCoOwur
         nprQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5GgPOsvYcbgDG/V3Qk5xqovFJp/eLmeTCzGSc+1fWy6gL+ZaG2T6FkKktwCiHHOb/pAa3JQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzBPvUjvMHWGlTh5WpLanK/9En7P42Xlpe0eHh3EPd8vHHwNksr
	zkJ/+fEDfiseVuB3MrddJ6FdV1CVEkanojq0kTweUT0VaCCdAJz+SOkdXoaxKCzmsOjwYmT2CBP
	FWNIx24aHuTNxjMGXwLvDYyYwA+s=
X-Gm-Gg: ASbGncvzFd3GNLkVj4OlY64JWTFTHiiS7QjLh6XiPdcSg+D559JdCxiV2P7Ws0wWytB
	qbLWFlhFjtkU8wRM/EFL9kmGycnvkXbyc
X-Google-Smtp-Source: AGHT+IE7WQ4zcWjkTsHj3YU6P5a3zfrxQl6S9zfO+CZjireFyD7ogJ24uCCbFBJtrFm5m1j/xcyE0rDoDRhRHJhalAM=
X-Received: by 2002:a05:6902:91e:b0:e35:ddad:5ab0 with SMTP id
 3f1490d57ef6-e395af12b3dmr1823834276.18.1732695867370; Wed, 27 Nov 2024
 00:24:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com> <20241126-z2-v1-2-c43c4cc6200d@gmail.com>
 <Z0aCSBNEAJlgNIAI@google.com>
In-Reply-To: <Z0aCSBNEAJlgNIAI@google.com>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 27 Nov 2024 09:24:16 +0100
Message-ID: <CAMT+MTT0oiODONgEipLuAaZyzD-YyM8mbAcRsZKn8N4E326kMw@mail.gmail.com>
Subject: Re: [PATCH 2/4] input: apple_z2: Add a driver for Apple Z2 touchscreens
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Nov 2024 at 03:22, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> > +     u16 checksum;
>
> Does this need endianness annotation? It is being sent to the device...

Both host and device are always little endian, and this whole thing is
using a bespoke Apple protocol, so is unlikely to ever be seen on a BE
machine. But i am not opposed to adding endianness handling.

> > +             slot_valid = fingers[i].state == APPLE_Z2_TOUCH_STARTED ||
> > +                          fingers[i].state == APPLE_Z2_TOUCH_MOVED;
> > +             input_mt_slot(z2->input_dev, slot);
> > +             input_mt_report_slot_state(z2->input_dev, MT_TOOL_FINGER, slot_valid);
> > +             if (!slot_valid)
> > +                     continue;
>
> Shorter form:
>
>                 if (!input_mt_report_slot_state(...))
>                         continue;

Sorry, but i fail to see how that is shorter, i am setting the slot state to
slot_valid, which is being computed above, so, why not just reuse
that instead of fetching it from input's slot state?

> > +     ack_xfer.tx_buf = int_ack;
> > +     ack_xfer.rx_buf = ack_rsp;
>
> I think these buffers need to be DMA-safe.

Do they? Our spi controller is not capable of doing DMA (yet?)
and instead copies everything into a fifo. But even if it was capable,
wouldn't that be the controller driver's responsibility to dma-map them?

> > +             if (fw->size - fw_idx < 8) {
> > +                     dev_err(&z2->spidev->dev, "firmware malformed");
>
> Maybe check this before uploading half of it?

That would be an extra pass though the firmware file, and the device
is okay with getting reset after a partial firmware upload, there is no
onboard storage that can be corrupted, and we fully reset it on each
boot (or even more often) anyway.

> > +     error = apple_z2_boot(z2);
>
> Why can't we wait for the boot in probe()? We can mark the driver as
> preferring asynchronous probe to not delay the overall boot process.

A comment on previous version of this submission asked not to load
firmware in probe callback, since the fs may be unavailable at that point.

Ack on all other comments, will be fixed for v2.
