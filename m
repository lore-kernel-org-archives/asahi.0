Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767221C5F1F;
	Wed, 19 Feb 2025 09:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739958885; cv=none; b=Ld4WpSbXGZQ5vl4SBOFJxwY2ubbegmnJeoBfTpb/iYDI7dlzrCuuDHW/6u3P1FDl1ivfYfKqC60ZY/UkAYrW8d8iR3oDYgw1VelmcWwHhTPvxgc9gXuXV7SUtmAPTKHsmPRSi6a3tSWnDGhM0OAfJUra0VwGn6eyqfG5whbQvZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739958885; c=relaxed/simple;
	bh=Ud5ArEVeWEhgplooqFyTa9NH4iriGbo3oERuVmwEI0Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Go+4zIL1cTiFfn1PFPmLALmwIoc1+CzBzVuyg8E9GjkIVfK6rx9VeeVDSezMDZ4KtL6O3Fop3QewKcqVT5rND4iDXZrPXXSak5GmbNYZ89fYmlSBKII2R25X6gHazTQVNLM7YEsmcArNC1Bd59JljuQDXxO6aSUrm6FzK9Y+0hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=is0OjQ08; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="is0OjQ08"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e5dcc3b0c77so3389372276.0;
        Wed, 19 Feb 2025 01:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739958882; x=1740563682; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BCav4SHfE7EQJCkWf7DvjjeXn6VgMu12EYuLJnvgv48=;
        b=is0OjQ08EvYx0CemXGwA6HfbpiRaaNczNrjckhGGulF01BS7lCgYgPpjnFrCGZYnvp
         mN1PI09S/7QiL5KGyog1RSAmw4W5W+ox6X+hESConCbwZ0u5bdaeaLUivnecJY1pMv1O
         Es71Y/iUN5QAhsemMd681e0FTy/WSZmnpYaphheBoGP3bY8Qegje5pmiCSf6Q0vR+SE4
         k9FU0KpLvYvVrlhgKQRk29a8HtghDnwm4VwYx15Xuadmehl9B5VyKa2rrFNwhttRw07u
         ntRD0Zdi7c2rK5i3K5mQsTulaas6+w8G5Mr5hR4oBckK8zpObYXwnRt4MJriIL/gxXg2
         GLpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739958882; x=1740563682;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BCav4SHfE7EQJCkWf7DvjjeXn6VgMu12EYuLJnvgv48=;
        b=m27/kOZBMb1xulsOudHMPGvWiblL9ICpioDxjE2KSFzwVK9VjB7iW8Eg/iNbCCLiY+
         40DWLEOe06egURbUCoyJvRUQMdWLXdZpIU3kDt2NRxeEHyy8vsFNhKXAzTvE3kCPO5qW
         52y4YEgixamAGO5BA2nxNc8KHYwQp/Aa2hOPFmm/R8kGIJJ+v3lvd9FWM85tFkC7GVPe
         svaCA54204z/Xh42hn/uov/LAC+QE9M/XBrosJ1dnIYXQbz176tTV56+lOyo4/DlgyXj
         O0dQQBGY7q7E6pKAn+8ATGyAPtzHkrxMzVUjwhUsW64MKTKn6+u2ND1kku/Nab3IoeoB
         f8UA==
X-Forwarded-Encrypted: i=1; AJvYcCWqYh/Poq8lBpBNuCi5DqUGiS2asnMCaMRVvYKk4+/MdNel2aRGVRsbb5l9nerNm9F9sjbwvg==@lists.linux.dev, AJvYcCXxruZl543EqSKO7AaAFgNEM8DeQjZj2LJ5OxdXUdz8wD+Sox1TZ6di0z0H9wJJGYEPyP+6@lists.linux.dev
X-Gm-Message-State: AOJu0YyREKfdsQIN4axePyKnCM/VhV7yCDYzquEEl8Xzm00OpvBiwohi
	AoVNaV1733TRvfQQVKW5V0ymMMegAT72BICIE0sR1111/AOYVQFs/FiHkmIS8VUA6LVJJrqUDwD
	4+5rw/HcpQ63ZjOoXkx+hes/r8Vo=
X-Gm-Gg: ASbGnctVxCFT7RaFyZcqxrEnVeUnJA9Lw8XrsuWbT8FKGGD7Jz56z61m49lz9zqDpAf
	nT4rXqEqU9bbxff4PBeOxilJKVKcugtlLZl2fMxwJwUGHtYZCQD7eqE5W/SPOgJwbTEt3xlRtPQ
	==
X-Google-Smtp-Source: AGHT+IFAsRovKqEPyfeA7p4gUvXbV4eJrMlwT7pqKN/+12P/FiSevR15M7Mr7rEzXhQloaQvHIzmg0pHyi/KhmeP6Fs=
X-Received: by 2002:a05:6902:108e:b0:e5d:d6b8:2317 with SMTP id
 3f1490d57ef6-e5e0a1400admr2490172276.44.1739958882412; Wed, 19 Feb 2025
 01:54:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250219-isp-v1-0-6d3e89b67c31@gmail.com> <20250219-isp-v1-3-6d3e89b67c31@gmail.com>
 <16f6d4a2-2102-48b9-a0ae-b8c6595975b8@kernel.org>
In-Reply-To: <16f6d4a2-2102-48b9-a0ae-b8c6595975b8@kernel.org>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 19 Feb 2025 10:54:31 +0100
X-Gm-Features: AWEUYZmesv9PAJrRnsNQHdoWoBNxlIk4Jp5agMR2Ng1Yo83bsxbQ8IUxBouljGI
Message-ID: <CAMT+MTR7dhtt3SOMg0K3UakJQftqnc2S-rV41HdHtA+o9aSPug@mail.gmail.com>
Subject: Re: [PATCH 3/5] media: dt-bindings: Add Apple ISP
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Feb 2025 at 10:37, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > +
> > +  apple,platform-id:
> > +    description: Platform id for firmware
> > +    $ref: /schemas/types.yaml#/definitions/uint32
>
>
> No, use firmware-name.

Not sure how is firmware-name an appropriate field, fw-name is a string
that references a firmware file, while this field is an id that is sent to the
coprocessor firmware in order to identify the platform.

> > +  apple,temporal-filter:
> > +    description: Whether temporal filter should be enabled in firmware
> > +    $ref: /schemas/types.yaml#/definitions/uint32
>
> And why is this not enabled always? Why this is board specific?

Not every board has support for this feature.

> You miss here ports or port. ISP usually gets signal from some camera or
> other block.

For complex cameras - yes, but this is closer to a UVC camera connected
via a bespoke protocol. We do not need to deal with the sensor access,
all of it is managed by the coprocessor firmware.

> > +        properties:
> > +          apple,config-index:
> > +            description: Firmware config index
> > +            $ref: /schemas/types.yaml#/definitions/uint32
>
>
> No duplicated indices. You have reg for this, assuming this is index.

There are duplicated indices, see isp-imx248.dtsi in patch 5 for an example.

> All these do not look like hardware properties but rather configuration
> of sensor which should be done runtime by OS, not by DT.

Those are board-specific and not discoverable via the ISP protocol.
