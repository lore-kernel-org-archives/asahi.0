Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DC93E9C3C
	for <asahi@lists.linux.dev>; Fri,  9 Oct 2026 07:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791530525; cv=none; b=k1n8EyQ3g29kGXLiqSGJsOEeHiYvwZvenpMNVojdGmvLCUrv/hZBOuWUuo3wTlZIDfWZw4vaMaMN7Vt9rVojblc5wcwAuMUd46q9EUehP0YctKSkm1XQZS3DGtBg2RszCUAHoNdszrKv0YhyKEZDHvY7FmjbIQ3nv7E4n1z3CRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791530525; c=relaxed/simple;
	bh=ay7Lrhmehs7j0JdHgXH5IIpsVNVS4CqUBpPRiqIzs/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pwMFoE4s/wfWjV72k2NaZsAJwzpVa2TH8i62H8Hv5NuNsIigahAzaNw+ImvM3EMKZvJMrIdoizzqua+VcZ6E6QZpXSRkASkt9Vst1jQEsu/22F/pD62qwLnSkMF+rlGLnhcLmJ8bpGKJbMl1UaQrPZLxTAdIi9koMQA4VcvAAZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=foxF9vKq; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="foxF9vKq"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc1cb472b76so1767756a12.0
        for <asahi@lists.linux.dev>; Fri, 09 Oct 2026 00:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791530524; x=1792135324; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vGQ1K2lnEtPHoywNrrfZAa9ebz8nSIt73vgH/dzJD9c=;
        b=foxF9vKq8/20PhI6tSUDZu9yVw9m13hTFXhUL2xfzcpQsiHkEu3nm6h6S+FvpmK85E
         QniJltaD1e13Vg9T1jT8G6Lf/f5YRpl/PsZ7wtV/ZxsaIcDEJDkaYOBfL8AIidoop0sq
         UWjDylhG20fR8VAJztnHnZDtehRSClBfkc7CAP1u/Vh/etJ2etk575WRNJLu/pYn3VYw
         pKFqe4KUUJJ5Rd39mQ/D3gwbBVdUZry9Brbk9IO3AXXnSwGuaVnIsL8o6b/s7AaJg/cD
         IzMjU5+xURpzkt2Xj2tCpaqzT4Q/DjtjmwavEsKt1VWGmqsMof86SWePH0lmVRC+HcfG
         F9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791530524; x=1792135324;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vGQ1K2lnEtPHoywNrrfZAa9ebz8nSIt73vgH/dzJD9c=;
        b=xMv8WODUpd3Wr+8HRHTz7q50T/CulcDTs3SSL1n5nS9721QOQBVLy8iExEdOT4sgBV
         DVpfbVmhef86+U+gDvQqbIixp3jkksz6zO1qExyNt7Q0o4B9cicodWcZXFcMRkhv2ga/
         uYfhYW0T3+RAELWqOu5Okzn0NxxijYGJenk+3np/Amu7PDPf0X2ac8HYxfQj7/3qXZGP
         KK/c26t+eCStugMYvXoSuYhAh2eb5RjheR42LazDQ9G4swkLBcKpV5hnjbRrlaHcCsJZ
         OZAtOeb23DrgkB+k4koSOVCQ8HiMlKp6aUbkwGwQyEV6kUnujtn+2e9ykF8DVJiDC2ll
         lyFg==
X-Forwarded-Encrypted: i=1; AKwUvBxud6V7m53Ar93wNmofT0HZZEBgtnP6PB/Bfa2CWYV3C3a3uIwigs9HEyKFBDxR+BP7BWxraw==@lists.linux.dev
X-Gm-Message-State: AFq9FYJ5DoABLqZdYERwQtrirdvS0dMvJcBHSzzOigXyC9wdvMHalhHJ
	czsymPkKByT2dO1JbPU3ClEzJT6WpSAW+QpzijUF6Nujpujyjiz2Nu1W
X-Gm-Gg: AYBFou3eCuzvoR6qUocFQ2ItCSkUnpT524P2bHvnQzZ3kE1fJ4eHdRVa5uRyVw7OLTz
	SSygdEec/wXvqJNCU+gfCwAQpOw6mQ7uIFqrbxe8iY0pv3M8qAnmUyMNar0nsm/rQSYB7yC/aEN
	6T0Ae+xzRj4tdXRkaTSUU+WVfyEtpIneIm9b9Rk8htNcv3r7kOXGEvZVzmeXFbpRUtnvWnrMul+
	bY3CAZsbQ47jlNSsyEl7lap3wFXw005Aq2k+F99DaQA9J6xRWjXY78nkxXmjQ9FsnYPOdww6PK0
	WUkbVgcWZT2yawW8rF+6voByRijVKBFWDGdvJjCApVSfyYKksRG/oy42CDQynb7UJot/A6roS4o
	MZ/4ySohGBU8eGMwBmpO3GbdbQFodIF+mnpPkYDg7Cgg6Kuc20+XJRpYIe6Z0IA0kxsGnUPFGTA
	EqaN+lrSHgyH4lsaoabsMtNL7ULb75ZHd+9AqeN3axCIEcHOVgSqMlYZ7Zc0L5TlCDTXp+CvHjM
	wNICG+roRK3IHeKE0m7mg/GfrGhh4c1Yz2QFrhugkJAt95Anptr4R3jOhoXGqo0dwFY6d6aTDH5
	tICgFaLgLdRG79cfcIAg1xILXF35nbYMUOBvS7QoLJ4b9A7CNIM=
X-Received: by 2002:a17:90b:3a48:b0:3ab:413:49b6 with SMTP id 98e67ed59e1d1-3ab3a79a2d8mr1074419a91.41.1791530523677;
        Fri, 09 Oct 2026 00:22:03 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab397920b4sm1115948a91.4.2026.10.09.00.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:22:02 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject:
 Re: [PATCH v2 05/21] ASoC: dt-bindings: Add binding for Apple Silicon Mac
 audio
Date: Fri, 09 Oct 2026 17:21:52 +1000
Message-ID: <rT1KWd0SSiuQLd7MLQWREA@gmail.com>
In-Reply-To: <20261009-daring-objective-flounder-c0b66d@quoll>
References:
 <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-5-7b47ed6335a8@gmail.com>
 <20261009-daring-objective-flounder-c0b66d@quoll>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Friday, 9 October 2026 5:17:53=E2=80=AFpm Australian Eastern Standard Ti=
me=20
Krzysztof Kozlowski wrote:
> On Sun, Oct 04, 2026 at 04:03:32PM +1000, James Calligeros wrote:
> > +examples:
> > +  - |
> > +    sound {
> > +      compatible =3D "apple,j416-macaudio", "apple,j316-macaudio";
> > +      model =3D "MacBook Pro J416";
> > +
> > +      #address-cells =3D <1>;
> > +      #size-cells =3D <0>;
> > +
> > +      dai-link@0 {
> > +        reg =3D <0>;
> > +        link-name =3D "Speakers";
> > +
> > +        dai-tdm-idle-mode-0 =3D "zero";
> > +        dai-tdm-idle-mode-3 =3D "zero";
> > +        dai-tdm-slot-tx-idle-mask-0 =3D <0xf0f0f0>;
> > +        dai-tdm-slot-tx-idle-mask-3 =3D <0x0f0f0f>;
> > +
> > +        codec {
> > +          sound-dai =3D <&speaker_left_woof1>,
> > +                      <&speaker_left_tweet>,
> > +                      <&speaker_left_woof2>,
> > +                      <&speaker_right_woof1>,
> > +                      <&speaker_right_tweet>,
> > +                      <&speaker_right_woof2>;
> > +        };
> > +
> > +        cpu {
> > +          sound-dai =3D <&mca 0>, <&mca 1>;
> > +        };
> > +      };
> > +
> > +      dai-link@1 {
> > +        reg =3D <1>;
> > +        link-name =3D "Headphone Jack";
> > +
> > +        codec {
> > +          sound-dai =3D <&jack_codec>;
> > +        };
> > +
> > +        cpu {
> > +          sound-dai =3D <&mca 2>;
>=20
> Example looks incomplete, you miss TDM slot properties.

The machine driver generates the TDM slot assignments for the DAIs
and sets them at runtime.




