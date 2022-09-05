Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DB97E
	for <asahi@lists.linux.dev>; Mon,  5 Sep 2022 23:52:07 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1662421924; bh=W3JevZj+Q9D8r4igU1ZJmgIAeBet1bJnmsd/TGyYu1A=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=OJg/WetN0MEqqqGYSigrzdn9TEaFgN9D4ozqzm+x1AYqELC93mC/O+G3wKlMjI0KR
	 Yk/acY923n3/RakzT73BXiSFGEW7cbaSfbleD3qB6hSpi4sCaPD5Nd8dCpJheiRl7/
	 WXdwJQDItW2qap9E4NKWkWI1T0R7IFvh+PK652Kk=
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH v3 2/4] arm64: dts: apple: t8103: Add MCA and its support
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <20220905223927.GE10102@jannau.net>
Date: Tue, 6 Sep 2022 01:52:03 +0200
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 asahi@lists.linux.dev,
 alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <27908832-4453-4199-A899-7B93ABD1216B@cutebit.org>
References: <20220824160715.95779-1-povik+lin@cutebit.org>
 <20220824160715.95779-3-povik+lin@cutebit.org>
 <20220905223927.GE10102@jannau.net>
To: Janne Grunau <janne@jannau.net>

Ciao Janne, thanks for the comments and fixes.

> On 6. 9. 2022, at 0:39, Janne Grunau <janne@jannau.net> wrote:
>=20
> On 2022-08-24 18:07:13 +0200, Martin Povi=C5=A1er wrote:
>> Add the MCA I2S transceiver node and its supporting NCO, ADMAC nodes.
>>=20
>> Signed-off-by: Martin Povi=C5=A1er <povik+lin@cutebit.org>
>> ---
>> arch/arm64/boot/dts/apple/t8103-jxxx.dtsi | 4 ++
>> arch/arm64/boot/dts/apple/t8103.dtsi | 73 +++++++++++++++++++++++
>> 2 files changed, 77 insertions(+)


>> +		/*
>> +		 * This is a fabulated representation of the input clock
>> +		 * to NCO since we don't know the true clock tree.
>> +		 */
>> +		nco_clkref: clock-ref {
>=20
> clocks are not valid inside "simple-bus", the node name "clock-ref"=20
> conflicts in "/", maybe use "clock-nco"?

I would smuggle =E2=80=98ref=E2=80=99 or something to that effect into =
the name,
otherwise sure, let=E2=80=99s do it.

Martin

