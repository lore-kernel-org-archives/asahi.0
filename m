Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8C34A2D
	for <asahi@lists.linux.dev>; Fri,  9 Sep 2022 15:10:50 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1662736247; bh=4NS9jOc+DKYjPlXdslwxuf9QrepRBJxIl1RQFwG0wLc=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=LJ4wFHF5Ch89nRfLgiUdEOVGOXI0VmjoH78a0fFKjH3755SQJKgdpZx2R9Wm+7h3g
	 xzMl3lYqxW3Hplz2UlV735ZTboKP6xQiA0IQBoQMOrUmJMxaVFmlmpOI2XZ52xGDFI
	 2kUJ2+JtivHhevG9Tt6VpzCZ0r3Oq2YcBy9Gfyyk=
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH 09/10] ASoC: cs42l83: Extend CS42L42 support to new part
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <541b11a1-6b5a-cae0-73d9-f1fe8c961a15@linaro.org>
Date: Fri, 9 Sep 2022 17:10:45 +0200
Cc: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
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
Message-Id: <822926B0-CF33-4FF0-B234-8EF644DCED21@cutebit.org>
References: <20220909135334.98220-1-povik+lin@cutebit.org>
 <20220909135334.98220-10-povik+lin@cutebit.org>
 <541b11a1-6b5a-cae0-73d9-f1fe8c961a15@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>



> On 9. 9. 2022, at 16:47, Krzysztof Kozlowski =
<krzysztof.kozlowski@linaro.org> wrote:
>=20
> On 09/09/2022 15:53, Martin Povi=C5=A1er wrote:
>> The CS42L83 part is a headphone jack codec found in recent Apple
>> machines. It is a publicly undocumented part but as far as can be =
told
>> it is identical to CS42L42 except for two points:
>>=20

(...)

>> +static const struct dev_pm_ops cs42l83_i2c_pm_ops =3D {
>> +	SET_SYSTEM_SLEEP_PM_OPS(cs42l42_suspend, cs42l83_i2c_resume)
>> +};
>> +
>> +static const struct of_device_id __maybe_unused cs42l83_of_match[] =3D=
 {
>> +	{ .compatible =3D "cirrus,cs42l83", },
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(of, cs42l83_of_match);
>> +
>> +static struct i2c_driver cs42l83_i2c_driver =3D {
>> +	.driver =3D {
>> +		.name =3D "cs42l83",
>> +		.pm =3D &cs42l83_i2c_pm_ops,
>> +		.of_match_table =3D of_match_ptr(cs42l83_of_match),
>=20
> This should complain with compile testing. Usually it comes with
> __maybe_unused/

Which symbol? cs42l83_of_match has maybe_unused.

Best, Martin

>=20
>=20
> Best regards,
> Krzysztof

