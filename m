Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C2C19918
	for <asahi@lists.linux.dev>; Wed, 10 May 2023 06:23:38 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1683699815; bh=qTralI+BjXkUYeKdpt1EKOYLurUZJUqEWnuIzQBEp7g=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=PmPugz2x90kQffxeCbG0qp9sZuQ50W491xv2ssNip1mGx5wefSNn7yw7IpH//9OjO
	 YL6cgtQNHGKBncWB8bmKNeg+LGFJiXkZ9RgObhHFtyBEQiWdCBRggzCbS8EE1RmHkS
	 /SoJHaiCoNMrqu+0713ZUsg4pWuun9aPZEIOy/sA=
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH 2/2] ASoC: ssm3515: Add new amp driver
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <ZFr+e+bM86Rwj2LH@finisterre.sirena.org.uk>
Date: Wed, 10 May 2023 08:23:34 +0200
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 =?utf-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 asahi@lists.linux.dev,
 alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <EA5B2980-917F-4F82-9302-F880B1B97ECD@cutebit.org>
References: <20230509163828.86003-1-povik+lin@cutebit.org>
 <20230509163828.86003-2-povik+lin@cutebit.org>
 <ZFr+e+bM86Rwj2LH@finisterre.sirena.org.uk>
To: Mark Brown <broonie@kernel.org>


> On 10. 5. 2023, at 4:16, Mark Brown <broonie@kernel.org> wrote:
>=20
> On Tue, May 09, 2023 at 06:38:28PM +0200, Martin Povi=C5=A1er wrote:
>=20
>> +static int ssm3515_setup(struct snd_soc_component *component)
>> +{
>> +	struct ssm3515_data *data =3D
>> +			snd_soc_component_get_drvdata(component);
>> +	int ret;
>> +
>> +	ret =3D snd_soc_component_update_bits(component, SSM3515_GEC,
>> +			SSM3515_GEC_ANA_GAIN,
>> +			FIELD_PREP(SSM3515_GEC_ANA_GAIN, =
data->ana_gain));
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	/* Start out muted */
>> +	ret =3D snd_soc_component_update_bits(component, SSM3515_DAC,
>> +			SSM3515_DAC_MUTE, SSM3515_DAC_MUTE);
>> +	if (ret < 0)
>> +		return ret;
>=20
> Why are we not using the chip defaults here?  We use those for most
> things as what's appropraite for one user might not be appropriate for
> another and it's easier to agree to follow what the chip does than to
> select things.  There's some exceptions like for zero cross options =
but
> not typically for gains and mutes.

This bit is controlled by the mute DAI op, where it is expected the
component starts out muted. The datasheet promises pop-free experience
if this bit is sequenced with the disablement of clocks, so it seems
like a good fit for said op.

>> +static int ssm3515_probe(struct snd_soc_component *component)
>> +{
>> +	struct ssm3515_data *data =3D
>> +			snd_soc_component_get_drvdata(component);
>> +	int ret;
>> +
>> +	ret =3D ssm3515_reset(component);
>> +	if (ret < 0)
>> +		return ret;
>> +	regmap_reinit_cache(data->regmap, &ssm3515_i2c_regmap);
>> +
>> +	return ssm3515_setup(component);
>> +}
>=20
> We don't normally reset things on component probe, only on bus level
> probe...

I don=E2=80=99t think I have a strong reason to do this.

