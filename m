Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B54C12B80
	for <asahi@lists.linux.dev>; Wed, 10 May 2023 08:29:21 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1683707358; bh=5RZw6OLzkF81T9qBCgl/kjGdza5GpI9DB8+PLpboHg8=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=rUOzP4+D/25FepXKIIga+lR4GsBEH1La1wV6TDHRT5M83z9wFU6j5d+t8JsYygVbw
	 FdAGJxdzxWb0beuPIAYW2bJGb9pb6ye6hg893N0j3iczva7DTriLXEMsQVRA1u2r5C
	 pukl8a3drROy3U7JgZwV3YBrXcZ+jKS4W5UxbUPk=
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: Add adi,ssm3515 amp schema
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <627f1739-98b4-9576-4b11-887c8f7e0c52@linaro.org>
Date: Wed, 10 May 2023 10:29:17 +0200
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
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
Message-Id: <5FC57F67-CC16-4DA4-9A0D-9F9A0539EE67@cutebit.org>
References: <20230509163828.86003-1-povik+lin@cutebit.org>
 <7b8c22e3-75c1-8803-fb32-097d12fbde78@linaro.org>
 <04BB0158-6C7B-400C-A87A-6E9B2835FDC7@cutebit.org>
 <627f1739-98b4-9576-4b11-887c8f7e0c52@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>



> On 10. 5. 2023, at 10:23, Krzysztof Kozlowski =
<krzysztof.kozlowski@linaro.org> wrote:
>=20
> On 10/05/2023 10:15, Martin Povi=C5=A1er wrote:
>>=20
>>> On 10. 5. 2023, at 9:51, Krzysztof Kozlowski =
<krzysztof.kozlowski@linaro.org> wrote:
>>>=20
>>> On 09/05/2023 18:38, Martin Povi=C5=A1er wrote:
>>>> Add a DT schema for the SSM3515 amp by Analog Devices. It's a =
simple
>>>> mono amplifier with digital input.
>>>>=20
>>>> Signed-off-by: Martin Povi=C5=A1er <povik+lin@cutebit.org>

>>>> +additionalProperties: true
>>>=20
>>> uinevaluatedProperties: false instead, so users can have =
name-prefix.
>>=20
>> I actually tweaked this to have the example passing, which has =
sound-name-prefix,
>=20
> true is not allowed anyway - it makes your schema simply not effective
> almost at all as it allows anything...

That makes sense.

>> which I guess is what you have in mind. Not that I exactly understand =
what these
>> options do (both additionalProperties and unevaluatedProperties), the =
schema docs
>> didn=E2=80=99t enlighten me right away when I looked into it.
>=20
> The way to go and to start always is to look at example-schema. It =
tells
> you explicitly to use additionalProperties:false and switch to
> unevaluated "If and only if another schema is referenced".

OK. While I have you on the line, what does unevaluated do? In what =
sense are props
unevaluated?

> Best regards,
> Krzysztof

Regards,
Martin=
