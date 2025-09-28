Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F067019755B
	for <asahi@lists.linux.dev>; Sun, 28 Sep 2025 00:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759020390; cv=none; b=cOzO+63VS9O2pknMOa3lgwRD476im/UWkH/hugOB3Ns+RkzM7w7vptEDnqG1x6+TDvTVBjgbo4vKVS2CyZkQzqvlP7ulCRCjy7cmz+9twyHcXjs767SF/hE04xahiax9xUkAdfgkrLjPhLIVEBtbChOWLnSk54odd+T8/l9zvmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759020390; c=relaxed/simple;
	bh=uFT8DD+GpvmowlrkoMgNzPNeWBkwZV4HRy1OuviWi4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KH2oxCdxrrM/KRcWiVp6QRKKxzKFrgItk0kBJEizd0AIoSzpgv8o9mPW4ex74h0qltIDCMyoJrgbir8F4XUF6ejPT2mCurdYNuZHmMVcA4kbHVien4hJ+a4U4hRX6Qxq60qkt0OOLT3WaKyhaW/+Y6u9nyQ5Zn7N6JknY24L1Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=db0aGSkr; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="db0aGSkr"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2570bf6058aso48876015ad.0
        for <asahi@lists.linux.dev>; Sat, 27 Sep 2025 17:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759020388; x=1759625188; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R0SQxdo3RLHRiJ7AnzgCm7ZcELugvg2FhH462RqaNN4=;
        b=db0aGSkr6PuUoEG9Z8lSOzXVr+KHVwHU+PE9mGzrL8bD+csVDWib89s5kodKrTQI+5
         9y50VkFqE8K+3kDPPnO26lEjAMbdNMmK+noTbXYZ9ILeOsc7AxiOhUVw9wAHb8XFLEo8
         G75PE2jdSZebDV4L08cGEyYMUvY2gJJqQ4ayaJOxuIgLDM6p8Rd+KqS+bQ/JDP2yiVZW
         E70qc1FvlO2QF2Te18TT9xrv72vJq7PoamF/DLpyTK7W0TiQ68CEBftf6kVR2+z+zwwc
         xbJN+GFOQzdqJ4RrzpDKvlDlq+ZbKYskpGmvorDlgjBRxzJp1V33ivq97PTQu3JPKbLI
         1fGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759020388; x=1759625188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R0SQxdo3RLHRiJ7AnzgCm7ZcELugvg2FhH462RqaNN4=;
        b=q4LKEp8Sfr08OScstHzZ7v9BVyvY2WRV3axoF5EI5xGVZwDJhWs8p0kc5Nob4XNebi
         sCTjXJvWunox85Mf/n6seMh4tQSDhfMBtNSlyKBVhDth8iBltwFomIiSl/nsNEYxPW1O
         WAOKs/3Q65X8dtqXL3E8dhVVk1GKigDU45DhjlSeWcgHNIRtw0Q4PZX5G+qJkG7hAZnF
         4T0IzG2nKEFjF+Vmi5pj9Yt3XhROl3Q73a7bqk/AUYn+wtn7FHIEERQJsIccP4IXYPA8
         8oqa42ZC2KC/N8l9mmOp2ezuZkhhpD1KPluSO3t4OmQtAStRVnKuwJ3GICM3X6MazrxZ
         Inyg==
X-Forwarded-Encrypted: i=1; AJvYcCWG1yhGRyRf/cP4QAUQiOpR6o9qA91WId4sM3jkxoDINZ/0kvked4D6ex3i5+ep+WPzOB/1fA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwcVZ18buMrzr2ZmZ64fmVC5tbBFQ0dC0xdpYBpGw5T/jM9F2Ab
	ijc+iKjryWEeWBBpgnVwSVnbS8kcJFs8ITW8hqipCKUhg/oUurDT7p+9
X-Gm-Gg: ASbGncswMHsgxjLKMmjqWfd3ckAGFTtJ55VSwD07h6xdqi2c8wahtL881eG6Qo8ThHJ
	Cpp78TIcPRsbVfXGAV6m5XpT8SS4k048o+vg3Z/3gLik83p7mTkQan+3fpAs5kriVc+86rjCzvF
	B+w7jAGXtumYnS6gutpYHQTUW2qCiUEcFcJ3iB35sxefw4FMxPFlv1i3SdXnekQZltwVa9IIJIK
	XXpMDP1gVP3/ieOpOMuzb3uH0RnPJy7XjFXszzJK+pnhR43cWKh5+nI5yfPVwfo6nPPkj5zzfQT
	HWnTQQWLar62fcfQONzMjPtJ35v91jWvIJ7s7JqJgJMEeY4pFnzAM502rvH3FJxxtWDiRKNvR5n
	HOZKV6nqH4oJpiGWTLt8/ckfiIiUWaG7usZeud++TjAdNsUVrhNOZRQP2cMA7KnCdLnzS+Wb1+b
	uWce45fbq3TWoIMnJe6wELtbeJ1/qCvSts
X-Google-Smtp-Source: AGHT+IHh6vp11a5YTPpS7Cpx/YPQS6tq6OUbtGBtN9cobxgvPjCMMdsgzvmVq+T4sqfObnWyrmGxdQ==
X-Received: by 2002:a17:902:ef03:b0:27e:ef12:6e94 with SMTP id d9443c01a7336-27eef126f60mr78326435ad.55.1759020388025;
        Sat, 27 Sep 2025 17:46:28 -0700 (PDT)
Received: from setsuna.localnet (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ac27d4sm88980475ad.135.2025.09.27.17.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 17:46:27 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Janne Grunau <j@jannau.net>, Rob Herring <robh@kernel.org>
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org
Subject:
 Re: [PATCH v2 02/11] dt-bindings: hwmon: Add Apple System Management
 Controller hwmon schema
Date: Sun, 28 Sep 2025 10:36:03 +1000
Message-ID: <2537878.PYKUYFuaPT@setsuna>
In-Reply-To:
 <CAL_JsqK-9n3_H6vS80bZuZiSPi9UNuMzHEPFL_EzYTeyNS1cYg@mail.gmail.com>
References:
 <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
 <20250925204925.GA637503@robin.jannau.net>
 <CAL_JsqK-9n3_H6vS80bZuZiSPi9UNuMzHEPFL_EzYTeyNS1cYg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Rob,

On Friday, 26 September 2025 7:43:23=E2=80=AFam Australian Eastern Standard=
 Time Rob=20
Herring wrote:
> On Thu, Sep 25, 2025 at 3:49=E2=80=AFPM Janne Grunau <j@jannau.net> wrote:
> > On Fri, Aug 29, 2025 at 11:40:57AM -0500, Rob Herring wrote:
> > >=20
> > > This should be something like this:
> > >=20
> > > "^current-[A-Za-z0-9]{4}$":
> > >   $ref: "#/$defs/sensor"
> > >   unevaluatedProperties: false
> > >=20
> > > With the $defs/sensor being:
> > >=20
> > > $defs:
> > >   sensor:
> > >     type: object
> > >    =20
> > >     properties:
> > >       apple,key-id:
> > >         $ref: /schemas/types.yaml#/definitions/string
> > >         pattern: "^[A-Za-z0-9]{4}$"
> > >        =20
> > >         description:
> > >           The SMC FourCC key of the desired sensor. Must match the
> > >           node's suffix.
> > >      =20
> > >       label:
> > >         description: Human-readable name for the sensor
> > >    =20
> > >     required:
> > >       - apple,key-id
> > >       - label
> > >=20
> > > Though in general, 'label' should never be required being just for hu=
man
> > > convenience.
> >=20
> > That does not sound as it would be compatible with skipping nodes in the
> > driver if the node misses label. The driver could of course fall back
> > to create a hwmon sensors without labels.
>=20
> The driver absolutely should.

The original submission (and our downstream version) do this, but I changed
it for v2 per Sven's feedback [1]. Outside of development/experimentation,
we will (should) never have a sensor in the Devicetree of uknown utility.
If we know what a sensor is for, then we should have a label for it.

> > I looks to me it would be a
> > stretch to call the presence of the labels human convenience.
>=20
> Then it is an abuse of 'label". "label" is supposed to be literally
> that. Matching a sticker on a port of a device.
>=20
> If you need to associate a sensor with some other piece of h/w, then
> that should be via a phandle or something.

I don't think doing so is particularly useful for this platform. Few of
the sensors that we know about are directly related to any one piece of=20
hardware.
It's pretty much just the CPU cores and Broadcom module. The rest are things
like fans, palm rest area temperature sensors, ammeters and voltmeters for=
=20
entire
rails, etc.

Even where we can reliably associate a sensor to a piece of hardware,
(e.g. the WiFi/BT board), doing so does not by itself do anything useful. We
still need to write a human-readable label for the sensor.

I was trying to avoid yet another vendor property, but would something like
'apple,sensor-label' work here?

> Rob

James

[1]: https://lore.kernel.org/asahi/4a95cbf3-b3ae-4b26-8db2-dd5cf14a4c0c@ker=
nel.org/


