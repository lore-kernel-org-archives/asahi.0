Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC44C4A2D
	for <asahi@lists.linux.dev>; Fri,  9 Sep 2022 15:44:18 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1662738255; bh=iQf3eHuSRWeGotbEYofBZciMp+NjvuT3Kv1h/4d/X3M=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=n2eWeH6ZvPApY9mJ0yKUXl1e12MAK+7kor4NjJZ6CufN8lt/yiaXpx8DrOKCJHWU+
	 ruPpKHk10oPnza/ORTzLinO+9fJU1PvwkRit9928gEFuRIODfVqk4B/wWs5IzJ0HNz
	 MzbcedJpnccEHAPsnk8WWsu3dbsSjobljAn8uTy8=
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH 07/10] ASoC: cs42l42: Split I2C identity into separate
 module
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <aabae52f-8230-f837-c17a-59d781b5af62@opensource.cirrus.com>
Date: Fri, 9 Sep 2022 17:44:14 +0200
Cc: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 ChiYuan Huang <cy_huang@richtek.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Matt Flax <flatmax@flatmax.com>,
 - <patches@opensource.cirrus.com>,
 alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <5C349ED8-BD51-40BA-BD02-A44FBBEF9C52@cutebit.org>
References: <20220909135334.98220-1-povik+lin@cutebit.org>
 <20220909135334.98220-8-povik+lin@cutebit.org>
 <aabae52f-8230-f837-c17a-59d781b5af62@opensource.cirrus.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>


> On 9. 9. 2022, at 17:40, Richard Fitzgerald <rf@opensource.cirrus.com> =
wrote:
>=20
> On 09/09/2022 14:53, Martin Povi=C5=A1er wrote:
>> +static int cs42l42_i2c_probe(struct i2c_client *i2c_client)
>> +{
>> +	struct device *dev =3D &i2c_client->dev;
>> +	struct cs42l42_private *cs42l42;
>> +	struct regmap *regmap;
>> +	int ret;
>> +
>> +	cs42l42 =3D devm_kzalloc(dev, sizeof(*cs42l42), GFP_KERNEL);
>> +	if (!cs42l42)
>> +		return -ENOMEM;
>> +
>> +	regmap =3D devm_regmap_init_i2c(i2c_client, &cs42l42_regmap);
>> +	if (IS_ERR(regmap)) {
>> +		ret =3D PTR_ERR(regmap);
>> +		dev_err(&i2c_client->dev, "regmap_init() failed: %d\n", =
ret);
>> +		return ret;
>> +	}
>> +
>> +	cs42l42->dev =3D dev;
>> +	cs42l42->regmap =3D regmap;
>> +	cs42l42->irq =3D i2c_client->irq;
>> +
>> +	ret =3D cs42l42_common_probe(cs42l42, &cs42l42_soc_component, =
&cs42l42_dai);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret =3D cs42l42_init(cs42l42);
>> +	if (ret)
>> +		cs42l42_common_remove(cs42l42);
>=20
> This introduces a bug that regulator_bulk_disable() is called
> twice if there is an error.
>=20
> cs42l42_init() was supposed to clean up if it returns an error, which
> it nearly does, but my original patch is missing the call to =
free_irq()
> in the error paths of cs42l42_init().

Ah! I didn=E2=80=99t inspect it closely enough then, I only ran into the =
missing
free_irq.

Martin

