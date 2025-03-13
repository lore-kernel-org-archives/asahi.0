Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D633E610C
	for <asahi@lists.linux.dev>; Thu, 13 Mar 2025 00:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741826999; cv=none; b=T36gXLcT2kvtrilvyjjHbOLGlTTtH2YC+tw7PXKgrR7wEryk9sLQRYDzBAELAz4W0Cj5WiRGg4psa0qBRXMbzu5Li8fWpCD8D455aoxKYmmL5cnVM1aof2LahYR303Q8fIvwWTHFS6F0UyY9BvhP50EvYLho4QAd+YyU1o9K2kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741826999; c=relaxed/simple;
	bh=Z49HXwaxexdDXy7kOpCh40mnlaoCuxB1V0yAtiPZZAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WpM3gDIR0jtSEzApwqavOEN/civjuXGMCCXNZgBI1D6t8CxOLGIm0cvJ227Jp0EyLu6wZr8kApu+x3kT/MhwgLarWgCrTdl4S4kxyUqLpjew/sg29IR5Hr8rF+wLRJIR3f9/WK5rEBnu8QVsbgEk8Vyp3TXiPotrugqwEG138Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EM8Ts2/M; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EM8Ts2/M"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-47664364628so5677621cf.1
        for <asahi@lists.linux.dev>; Wed, 12 Mar 2025 17:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741826997; x=1742431797; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkeNyflx08eBwoXdOrj+id9tFS6hOSl0Scgwwso0Pdc=;
        b=EM8Ts2/MKHb6CpPsce2ctODTQIRAQyHGOH8g1HFJdACqTffYHxUVwkro+A50wkuCa9
         hk9klpdpkoYsPqrUKwN/zjS7o2UnpBBJGGH8oLNG8mLzqHag66w8Nz++2X748PUaodws
         zKai5kPCQ0DTXmQ/dEZxI5rVNY4/BfIT1uHy8Xph7y7F0IcN6lkTT2icETamZB8qMhzs
         +TnLmN6+cUV8hPFNW019kQpWV6YHA8WcZEAnxKdNDZkjaLznoTyMnQ6LDllAH3if7GY3
         7lR+bufcHoDVABu/tVC6t1T2E6BN+e8kSMV32jytQ6v2stEwbRRJEXD5+Kcnt8EdWTxa
         9EPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741826997; x=1742431797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HkeNyflx08eBwoXdOrj+id9tFS6hOSl0Scgwwso0Pdc=;
        b=Wgj/B6BHpwVEBO5+w5Z3vkrgr0G7Jam7KH7iwfxIGz51C9/na7a+z6ep23EH9Q0TOh
         zHeHG60uGe10hBkWI6xuLJ7wrJCOYp66JLq7jUEe1+aqx6pZAwbruH6wD9F/YMXIZ5BL
         DUAcPo/OPpCB2k9RjafFttxdqVGdkuaPFu4VQUqjtLpxtfkYyLeBEZHTdXT4YO2wx8rW
         3JWHnuXdIjzAbguou6SL7IZE7/wNWALjx8zuzO4SkRujr2zM/Aftzf+ddixTRctJqWru
         ppVRnch8Hjpf33p0znmGytPeGdA/yUUA4j+Seo9soZ4n4DmsgcoSP/MeHbJ37qMpo5Ew
         l/Gw==
X-Forwarded-Encrypted: i=1; AJvYcCVykHl3LWQZvquSFWWSOLS6IbQ+wLX+S2liUWhH6Z5SzXTTgkrwYjFpT8R+gC5HZV9Ge7rROQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/kP+kcGK3yPf3nWAgncsbYKqaTxWHlUYr1hurji67E4JHchNp
	prWy67LTUoW7RLk8m2PlWcIbfziCbgyH9pHywcafbQUgMtRDrzXtsrjWHE6xWaFWAodRQyuctLW
	lzOxd6e57do/BjAw45fn0+emqtl0=
X-Gm-Gg: ASbGncvYXyGleDMyJD50DdS33jUxu86TBXPiDEQ/qyVW+6D4vg60ydX4w8Db7u2ygnZ
	GzzJJxQgpZUKBIwe1HjzcA5wsWzAYSgVQwkmNceEzUg8rU9RjWtHkn5Lw8OLJgFbXwEbEQJYi9V
	CQoMbMrOjLvANrUsPsSrGCzqYMLlfyVxxnRlU=
X-Google-Smtp-Source: AGHT+IE4UMHREzgkQUDlb9f76ML3et+Bb02b5+av1fLvRw1YGIeJDBdw7dFMjSxPahafRrC3GwwrWULZTUZ927Q/Ez0=
X-Received: by 2002:a05:622a:438a:b0:476:652f:4db4 with SMTP id
 d75a77b69052e-476ba8b2f27mr8949481cf.5.1741826996633; Wed, 12 Mar 2025
 17:49:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250227-apple-codec-changes-v3-0-cbb130030acf@gmail.com>
 <CAHgNfTxS1Q4PPsw520-J4Yn6xg+QZOYFkYhg5yv-uZFu5waN_g@mail.gmail.com>
 <20250307205156.GA583954-robh@kernel.org> <5996925.DvuYhMxLoT@setsuna> <20250312125832.GA359842-robh@kernel.org>
In-Reply-To: <20250312125832.GA359842-robh@kernel.org>
From: James Calligeros <jcalligeros99@gmail.com>
Date: Thu, 13 Mar 2025 10:49:40 +1000
X-Gm-Features: AQ5f1JpviH4ysHbqATC6ly_Fa9fyvcQzoJXH7f6pMF6qeXNeHE906TPegzKdRB0
Message-ID: <CAHgNfTwLfqCP-TL_pdqxs0AC+1z845Ca1zU6dUS=xwNMgaz+5Q@mail.gmail.com>
Subject: Re: [PATCH v3 17/20] ASoC: dt-bindings: tas2770: add flags for SDOUT
 pulldown and zero-fill
To: Rob Herring <robh@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
	Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, Dan Murphy <dmurphy@ti.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shi Fu <shifu0704@thundersoft.com>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	=?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Hector Martin <marcan@marcan.st>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	asahi@lists.linux.dev, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 12, 2025 at 10:58=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Mon, Mar 10, 2025 at 07:30:07PM +1000, James Calligeros wrote:
> > On Sat, Mar 8, 2025 at 6:51=E2=80=AFAM Rob Herring <robh@kernel.org> wr=
ote:
> > > How would it work when you need a mask? "dai-tdm-slot-tx-mask" is
> > > enough?
> >
> > The existing TX/RX slot masks are used to control which slots the codec
> > is operating on, AIUI. I don't know if it makes sense to alter how code=
cs
> > deal with this. Could we combine the suggested dai-tdm-slot-tx-idle
> > with an optional dai-tdm-slot-tx-idle-mask property? From the machine
> > driver's perspective, the API would then be similar to the existing
> > set_tdm_slot ops. The current downstream macaudio machine driver builds
> > its links by allowing multiple codecs and CPUs to be linked to a DAI,
> > like so:
>
> Wouldn't the NOT of dai-tdm-slot-tx-mask be the idle mask?

Theoretically it should be, and that's probably just what we should do.
We would then just have the dai-tdm-slot-tx-idle-mode property to worry
about. There may be a reason a unique property was added however, as only
some codecs have it set in our downstream DTs. Perhaps Martin can shed
some light on this?

> >
> > dai-link@0 {
> >       cpu {
> >               sound-dai =3D <&cpu0>, <&cpu1>;
> >       };
> >       codec {
> >               sound-dai =3D <&speaker0>,
> >                         ...,
> >                         <&speaker6>;
> >       };
> > };
> >
> > In this case, the codec-specific mask property was added so that a mask
> > could be applied to a specific codec rather than the whole dai, however
> > from upstream drivers tt looks like the way this should be handled is t=
o
> > have "dai-tdm-slot-tx-idle-mask-n" properties at the dai level, then ha=
ve
> > the machine driver set the mask for the appropriate codec during setup.=
 So
> > for macaudio, assuming speaker5 requires this zerofill mask, we would
> > have something like this:
>
> I'm now confused why you need n masks and what does n represent?

We can have n cpus linked to m codecs in macaudio, and we need to specify
the TDM properties for each codec individually . There seem to be a couple
of ways upstream drivers deal with this, but the "nicest" way I've seen is
what amlogic[1] does, which is extend the dai-tdm-slot-* properties with
an index (-n) representing the specific codec it's for.

Regards,
James

[1] https://github.com/torvalds/linux/blob/master/Documentation/devicetree/=
bindings/sound/amlogic%2Caxg-sound-card.yaml
