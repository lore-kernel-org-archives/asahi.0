Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E7E3D0935
	for <asahi@lists.linux.dev>; Wed, 30 Sep 2026 07:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790753794; cv=none; b=hZOI5ZwF3UG5km+YzdWlw9FycyFMX42QNLQo89ThFngu1i5/NfW7viJs6Wq7dtmbkS5BFiVIAWNTwOW8RDCBOB7O1LgEXTOHevlw8+rEWgLNIFuGdeQkk+BDGZTdAxzggo7PJV+7AHsqid3F9oCzYFEt4qpKVWkX/0/FMfggvJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790753794; c=relaxed/simple;
	bh=IdSAxfgzIsA5UVG0b3AAedLhYXOcEtjTR/fFSjPyySs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fhcSffLW+8WaAq5Iu0G+zoGxktgsqJiCJIJJbQhbry4ovm+zWTIKNUW+MMPT8mjkxt+B6meBJKVGxYl/M/rgeCdjbx+TeCYqYjdKrMt11V9/4NEfJGKt2REdJsMFMtwRXovoVOB1xLqS39I0bbWH1RY3MPttW4GZ7ZH78CvvRz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JuC+3cCJ; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JuC+3cCJ"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0eeda3e03so1901536a91.1
        for <asahi@lists.linux.dev>; Wed, 30 Sep 2026 00:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790753792; x=1791358592; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PRNSLRyn2N1iTesBby/+rq6D8yhyFSP+EyakI7q9A6g=;
        b=JuC+3cCJ0dxF9jqVogU/HLnfrgEI04e0cCkZ0ZaWW3lz9nMoMaLJOdxGd3aOo/Vn86
         EUOhWrJoCuMohzpnpugchEnJX82mS0FERweCmSRbjAaO1/S1gU3EITvmWc89y1QOXWU4
         /f8Yk5zLR7u6YEO8zi50utAkcNhXUZWRRcunzJlL8cq7n4ltQpcWGEPwXjVvb1WU1g9u
         vdZvGSrezieuIq18zhUr/wA/cs3ABP3rd76w+L4D8XxAsTvRYh0SNfQYjI8jbFIcJEl6
         SiDK7GPUIZZk6eNe7azRuG02xuX21G/i4ctf4DxXbvh5qwJau4y2sBQ6zz6Cc41HwJfV
         ZahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790753792; x=1791358592;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PRNSLRyn2N1iTesBby/+rq6D8yhyFSP+EyakI7q9A6g=;
        b=2yoR2gj88B5YI09PK3xG6cj1QEcG3AiAxA+xe+buu90rVpaIEYgrZ8XvZqm6jceXMo
         M2AnLjw9k1jHj0FSKEHhHUzGsiMKwEARBr1BwJTPmhHe26qtUg10pgeZA5KcwJQ4ja2H
         +ovLaAXBKHJc+JwlyWrrZy1gP1lHyHd0ABhKu356Ua03Furf8mmEd/Z4yXlQTL4UgpcI
         fdmV/OTWBWpj4lGm88G3kLATUjXvTTPWruTLpROYBp5UCO5zt8GqEAcFDxmjTo1WyOVV
         FP3wadJOErj9p6NtyJXP3ZQ08MNw0UIaFc7zK9sZRqUz40lX+mMJsX7+u0oM2aepc3zg
         kgKw==
X-Forwarded-Encrypted: i=1; AKwUvBxlG1PNW1qLjH7ZapPGjlOD33nQC2fgp4wo88gbjOg50Shj+gONjJ3hgEp45jfmibgXrrBZQg==@lists.linux.dev
X-Gm-Message-State: AFuF++nyDbgdxuLbDJasPkR/6TTcR/KW7OmbQqvru4tTUBq+a5nq7C/H
	FhWmSCC+tj7x9eketc6CZdtjkRMyUJ+RfeB+2v5Jj2Y/gx+baorBwji4
X-Gm-Gg: AYBFou2j4Njn4uR5Zh6DGdIgoJBIVB+9E+ay9B/fv35RgEWwNeS+jL5ML33RodV3jRK
	HUyI8T9U4V8fOj+HT42v09guK/GjBil/EXX9kJ0buEoxn/ny+YrAwv/wHzWcgHBZy4shbnNCuYY
	MSYxTJ3RciATHjPxv0wGOY+pvUtYGAAHKf/UJ4KdeoDt8+MVPnxDCKJVSi+QYVeq3LEqB25D18w
	HPWBGDyhsITqmlmNNGNTJBfsZQIRLkuGzzqzZ0Q79doIhDSMMPyOcppQNkmIKEB7qvJlhdwKRo5
	JcxLsMDHF9D3XHXkF7qNj9uoDhzylf6dob9rHqyg2BsvdOeI/d08mNbwpYdkQo63MliPrWgpytz
	QHPocbPXkC1FZmTYeKztfITGzHlzbBFYsIgmxTvXAfqrsZS22mRIAndtc6CvvzFxf/lAYAoAtqD
	7XQnpfZlX76/CsaFc1oS9EdLC2FLehsEw+ntIkBwwiATjDeng8HSUXY7KkbCFTjxEnpfcbuvXZk
	pEtx2dt7jdgspsgKvn8LecQgNO+4tcPbGEoNCZBXgiWXQMigMr2BdBwaVLNNeu+G6O0nQ/Uf9oT
	d2TzeJEGIZ1+706O2hM399XKy5HnCEml4F4kJw30DKzC/pE82Q==
X-Received: by 2002:a05:6a20:d492:b0:3dd:a196:3095 with SMTP id adf61e73a8af0-3de9ebb39c1mr589504637.69.1790753791652;
        Wed, 30 Sep 2026 00:36:31 -0700 (PDT)
Received: from minako.localnet ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7dab202f1sm367179a12.27.2026.09.30.00.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:36:31 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 James Schulman <james.schulman@cirrus.com>, asahi@lists.linux.dev,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.de>,
 linux-mediatek@lists.infradead.org, Hector Martin <marcan@marcan.st>,
 Sasha Finkelstein <k@chaosmail.tech>
Subject: Re: [PATCH 16/28] ASoC: apple: Add macaudio machine driver
Date: Wed, 30 Sep 2026 17:36:21 +1000
Message-ID: <ItQHm5ZKQ4Wltp6qbCRkSA@gmail.com>
In-Reply-To: <0ae94fbe-cd41-4d49-b073-e65ab8eff724@sirena.org.uk>
References:
 <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <6dv6M3LAS9mol5fvC8Ie-w@gmail.com>
 <0ae94fbe-cd41-4d49-b073-e65ab8eff724@sirena.org.uk>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Monday, 28 September 2026 9:03:13=E2=80=AFpm Australian Eastern Standard=
 Time Mark=20
Brown wrote:
> On Sat, Sep 26, 2026 at 11:06:02AM +1000, James Calligeros wrote:
> > On Tuesday, 22 September 2026 7:38:54=E2=80=AFpm Australian Eastern Sta=
ndard Time=20
Mark Brown wrote:
> > > > +	list_for_each_entry(kctl, &ma->card.snd_card->controls, list) {
> > > > +		if (!snd_soc_control_matches(kctl,
> > > > volume_control_names[ma->cfg->amp]))
> > > > +			continue;
> > >=20
> > > This is used from the volume limit timeout work which doesn't hold the
> > > controls_rwsem, userspace can add or remove user controls which would
> > > change the list so the work needs to lock the controls list.
> >=20
> > Would it be sufficient to scoped_guard the controls_rwsem wherever we
> > use this pattern?
>=20
> I think so, but I didn't properly check.
>=20

I did some testing of this and it causes deadlocks if we try to take the
semaphore from inside the workqueue. I believe it is related to the fact
that speakersafetyd has a blocking handle to the controls open at all times.
This may be fixable by simply having speakersafetyd take a nonblocking
handle instead. I will do some more testing before submitting v2.

> > > > +static int macaudio_dpcm_hw_params(struct snd_pcm_substream
> > > > *substream,
> > > > +				   struct snd_pcm_hw_params *params)
> > > > +{
> > > > +	struct snd_soc_pcm_runtime *rtd =3D
> > > > snd_soc_substream_to_rtd(substream);
> > > > +	struct macaudio_snd_data *ma =3D snd_soc_card_get_drvdata(rtd->ca=
rd);
> > > > +	struct macaudio_link_props *props =3D
> > > > &ma->link_props[rtd->dai_link->id];
> > > > +	struct snd_soc_dai *cpu_dai =3D snd_soc_rtd_to_cpu(rtd, 0);
> > > > +	struct snd_interval *rate =3D hw_param_interval(params,
> > > > +						     =20
SNDRV_PCM_HW_PARAM_RATE);
> > > > +	int bclk_ratio =3D macaudio_get_runtime_bclk_ratio(substream);
> > > > +	int i;
> > > > +
> > > > +	if (props->is_sense) {
> > > > +		rate->min =3D rate->max =3D cpu_dai->symmetric_rate;
> > > > +		return 0;
> > > > +	}
> > >=20
> > > It feels like this DAI ought to have separate ops...  Also, for the
> > > sense link will we definitely already have a rate set up?
> >=20
> > AIUI, the cpu rate should always be set up by the time we hit
> > this path as it is only taken when setting up the VISENSE FE (after the
> > playback stuff is already set up).
>=20
> Is that something we actually enforce or is that just a thing a sensible
> userspace should do?  I can see something racing.

We don't really enforce it. speakersafetyd is the only thing that opens the
VISENSE PCM and does a blocking read of samples
which only starts and subsequently completes after the "real" PCM
is configured and playback begins. The sample rate is reliably
reflected to speakersafetyd via the kcontrol on the VISENSE PCM. We
have not experienced any race issues with this arrangement in ~5 years
nor has anyone reported any to us. I'm happy to take pointers on
how we should be doing this if the current approach won't fly.


