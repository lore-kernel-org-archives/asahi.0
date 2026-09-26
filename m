Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD33308F03
	for <asahi@lists.linux.dev>; Sat, 26 Sep 2026 01:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790384776; cv=none; b=MsBERspTElWzufDxY48MjfozaO6nWfLiB05xYZs9Wkcz7EhOOOPAK5w705GrWIvoN6URdHeUG+qf/xB9nmmOuWw4lojQwvOhnPg/VKzLkHyr60FMPJqgnn8za3HReLNqtUPnu6+xSnEd2Vj7vEkRuAYDYUZbeTRlei47In5J+xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790384776; c=relaxed/simple;
	bh=mhu7VQi5nbBAN9Zn9j1l1cfmqS/PN4mzd61KAU5Q0HA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aNaSbuootYty/dDprHuwjlHkxeT4/iWJTdItTOCLFNe/FTi2PrPqWndAZ287puGEd+ar+e7jApy1/nZAuAcBxoL7Nb6EWUZtjd8oNJtr5iH2CRBpWAepdQ2gZQrqXnrexPz8UDTZpIelfw33615FpiESfuCfxXdLJb2cTx1hDDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XS/Opct9; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XS/Opct9"
Received: by mail-pj2-f40.google.com with SMTP id d9443c01a7336-2dfa0f73c3cso4140175ad.0
        for <asahi@lists.linux.dev>; Fri, 25 Sep 2026 18:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790384775; x=1790989575; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uPh7h4QVBO0+zLyzuNTJsDnUZi453ATtVOhNG9pw0Zg=;
        b=XS/Opct9QBaT3ZO3g02UJLiG1cDoRt7wSfbvlBG/Lm9ulaeRsI0bIFpjyFq66dKMBH
         ci12jGawPwkbMGwUpluR673OKPsd1GDxCzZ+6NMYeOYrFJR9/VFfxEdaNKqDZWLZpG2k
         WHnxHPvBdsKV6gaQw7W8FXRQhmb9qxzHKuwFPtkZzmSH45y7WhVMxh3ylppmPeoFdut9
         wzQxq6MYSXw4ALidN8xVBEyqWHgMB2MnXDmpc4TK+geK47+Y5wm6qU8oRjh3zClNBdzf
         d4BWQN8BtpKa6+5RiB0RTsMQQL0EzgoBJxtuCVAmKt+S+81ZffsUwv4CaFwVH+6lHg74
         CIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790384775; x=1790989575;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uPh7h4QVBO0+zLyzuNTJsDnUZi453ATtVOhNG9pw0Zg=;
        b=WxoFiWtw78AA2+czzQeb2kx5P2MO9avitzSTuHouAI7mFTSgFbRNvAa0xM30jcSYfM
         NhVL4UL7U9ToSUN1Sh2yr7rA/sjB5wVPTtsD4UKAKbS4VWu4KcPEXlSukPP8r/fIN3Pr
         xVLGBHQvHlyGTwNxQXUjNql/oYjDOnF5vOldFYYyRfla+aHoDdGUbFzG7ej5TYo9Z8jy
         5hWuGWFcpENneWtIjw8JZM2KQYj47xFMJbO8Pdu62WImLLvtSRZ3cLGZ96pgeqfbs6JP
         AWxkSPrL5gdmJVtvWGNEQ/PtF0Mpc/mi6fE7zuG2AnVU3bvHtBJO8fWWQYE+6obsa1mx
         7k2g==
X-Forwarded-Encrypted: i=1; AKwUvBwV+k8C/vZlr4fpKU9QSUMjdzi4rES3aImhOFHXU59cBAtVAxuCLbACn7r5bJYVpsaZXhhhgA==@lists.linux.dev
X-Gm-Message-State: AFuF++k6FXDaidqeY7kxLm2wjF5rju/tKu4/6ILHeIH6+WQ+K+opKlXp
	vupS1DWbPqALqkgLwwMdsz4bDcsdmpR5mkwXQg0BsvfueCN60pGdPdJI
X-Gm-Gg: AYBFou3rPX8c9tTOGcWkp4rOT1JF3x9bTsaGazCjFV+DwyGJ1q3CwYic5xFmx3tTpQR
	NogzOdNfPzGq+oidlxHp17uuyRwiuGhsgERDzbzMM0vemo53OAIt0LMPfTNcT4rEojkDUPaJNC3
	cVAfanv2euPJnFca28tHsZY5bTq/sqiqJO372lMZnmdR/XAxCwMaZy/DuFURlaj5x2qNc6S2kl6
	m/qbKetmi4ZtJcJwRnfyJ5Lwr3sSqBTe4XZVZtqmPhBQUUJI2kw1PPtTa7ty8BSYPAa266vf0rQ
	JQypd8JzFM+C/YnSvRreMNde8a/uajZUZFTFgh2hwQMS0qtNmrCzG0w1P7SmG6FkAGsOQlOsjzy
	VV7/biaM2drzWdLqJ3c5CjdHeNMrGXGYS5uxqO0rEX5QG5P5PJWa0rYaqBIMyIKLdr0uPpoQnPu
	2xZ5hywBzrlfNLTrBEzfqxOFFO4vD8oUvokqP/FouahETpFAlKdS7NTI1o3+zrl/9oQ40tu7BBL
	LWR4pTpV5PAw0nf3X5DAg4dWEF5HL/j16YV1Y5dPrIAYTtxjkF5GS7yXGi+8c/EOHA9nZFzDYpC
	uB+NEcfxXxsmyztDCR4c8LYNjf6se8e6ZLEu/vxfEUIIAjy2Cj0=
X-Received: by 2002:a17:903:245:b0:2dd:8e7d:90f7 with SMTP id d9443c01a7336-2df7da6101cmr56469765ad.9.1790384774750;
        Fri, 25 Sep 2026 18:06:14 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913e032bsm17424215ad.27.2026.09.25.18.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 18:06:13 -0700 (PDT)
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
Date: Sat, 26 Sep 2026 11:06:02 +1000
Message-ID: <6dv6M3LAS9mol5fvC8Ie-w@gmail.com>
In-Reply-To: <arJMrsl45g2_bLPB@sirena.co.uk>
References:
 <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-16-741cc20a74e5@gmail.com>
 <arJMrsl45g2_bLPB@sirena.co.uk>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Mark,

On Tuesday, 22 September 2026 7:38:54=E2=80=AFpm Australian Eastern Standar=
d Time Mark Brown wrote:
> > +static void macaudio_vlimit_update(struct macaudio_snd_data *ma)
> > +{
> >=20
> > +
> > +	/* Check that *every* limited control is locked by the same owner */
> > +	list_for_each_entry(kctl, &ma->card.snd_card->controls, list) {
> > +		if (!snd_soc_control_matches(kctl, volume_control_names[ma->cfg->amp=
]))
> > +			continue;
>=20
> This is used from the volume limit timeout work which doesn't hold the
> controls_rwsem, userspace can add or remove user controls which would
> change the list so the work needs to lock the controls list.
>=20

Would it be sufficient to scoped_guard the controls_rwsem wherever we
use this pattern?

> > +static int macaudio_dpcm_hw_params(struct snd_pcm_substream *substream,
> > +				   struct snd_pcm_hw_params *params)
> > +{
> > +	struct snd_soc_pcm_runtime *rtd =3D snd_soc_substream_to_rtd(substrea=
m);
> > +	struct macaudio_snd_data *ma =3D snd_soc_card_get_drvdata(rtd->card);
> > +	struct macaudio_link_props *props =3D &ma->link_props[rtd->dai_link->=
id];
> > +	struct snd_soc_dai *cpu_dai =3D snd_soc_rtd_to_cpu(rtd, 0);
> > +	struct snd_interval *rate =3D hw_param_interval(params,
> > +						      SNDRV_PCM_HW_PARAM_RATE);
> > +	int bclk_ratio =3D macaudio_get_runtime_bclk_ratio(substream);
> > +	int i;
> > +
> > +	if (props->is_sense) {
> > +		rate->min =3D rate->max =3D cpu_dai->symmetric_rate;
> > +		return 0;
> > +	}
>=20
> It feels like this DAI ought to have separate ops...  Also, for the
> sense link will we definitely already have a rate set up?

AIUI, the cpu rate should always be set up by the time we hit
this path as it is only taken when setting up the VISENSE FE (after the
playback stuff is already set up).




