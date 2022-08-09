Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3DC23D0
	for <asahi@lists.linux.dev>; Tue,  9 Aug 2022 08:50:26 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1oLKfR-0006K1-7S; Tue, 09 Aug 2022 10:32:49 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1oLKfM-002fas-63; Tue, 09 Aug 2022 10:32:46 +0200
Received: from pza by lupine with local (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1oLKfN-0001Qi-La; Tue, 09 Aug 2022 10:32:45 +0200
Message-ID: <b18ef07670c09d4a58b70dc3671549a9b7d5b4e2.camel@pengutronix.de>
Subject: Re: [PATCH 2/3] ASoC: apple: mca: Start new platform driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Martin =?UTF-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, alsa-devel@alsa-project.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 09 Aug 2022 10:32:45 +0200
In-Reply-To: <20220808224153.3634-3-povik+lin@cutebit.org>
References: <20220808224153.3634-1-povik+lin@cutebit.org>
	 <20220808224153.3634-3-povik+lin@cutebit.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.38.3-1 
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: asahi@lists.linux.dev

Hi Martin,

On Di, 2022-08-09 at 00:41 +0200, Martin Povi=C5=A1er wrote:
> +	mca->rstc =3D devm_reset_control_get_shared(&pdev->dev, NULL);
> +	if (IS_ERR(mca->rstc)) {
> +		dev_dbg(&pdev->dev, "couldn't obtain reset control: %pe\n", mca->rstc)=
;
> +		mca->rstc =3D NULL;
> +	}

Please don't ignore errors, this could be -ENOMEM.

For optional resets, use devm_reset_control_get_optional_shared(),
which returns NULL if there is no resets property in the device tree.

regards
Philipp
