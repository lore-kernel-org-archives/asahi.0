Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE215C90
	for <asahi@lists.linux.dev>; Tue,  9 Aug 2022 07:12:43 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1660029159; bh=cDApK5hmdG5/n12lVn89OuKR5PmgY/qsf/gyfBRzWuo=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=QtUiVtrSeVGFlOCcxuaC4OAl/+jssyZYOmznmpaVVGB9lXDf7lSTqjyVpaRhWT9Jg
	 9Rb79S3wkhZUnmTg9MctQmNkwB0P+FmsAARSKZXAG1KSbMga0CeFRucrwh9UYNOGnN
	 aVCoXCc/KGfGY64/nni984A1WnO8cQMz6Z9DdgV4=
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH 3/3] ASoC: apple: mca: Add locks on foreign cluster access
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <20220808224153.3634-4-povik+lin@cutebit.org>
Date: Tue, 9 Aug 2022 09:12:37 +0200
Cc: asahi@lists.linux.dev,
 alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D63678FD-92EB-42E1-B04F-CCA563F4596A@cutebit.org>
References: <20220808224153.3634-1-povik+lin@cutebit.org>
 <20220808224153.3634-4-povik+lin@cutebit.org>
To: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Philipp Zabel <p.zabel@pengutronix.de>


> @@ -331,8 +339,10 @@ static int mca_be_prepare(struct =
snd_pcm_substream *substream,
> 	 */
> 	if (!mca_fe_clocks_in_use(fe_cl)) {
> 		ret =3D mca_fe_enable_clocks(fe_cl);
> -		if (ret < 0)
> +		if (ret < 0) {
> +			mutex_unlock(&mca->port_mutex);
> 			return ret;
> +		}
> 	}

Stray unlock here

--
Martin

