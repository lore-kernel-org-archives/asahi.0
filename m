Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB5621D5AF;
	Thu, 18 Jun 2026 04:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781755519; cv=none; b=MPAAsTonHdx9WT2Yxf/GY4HQvEQF6Xew/kl1mHe+OlLK3LgiHltUBdR06SvfMsYf4reHeZ211gFWsnG3qMiM7OJV36DCC2SVq9ol9JoBGvuGIGNUbNfOoF5lPshB6smRIuNio3oarNUshyFaZfEWx6yhB4O4ADf1awx6Rx8HPq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781755519; c=relaxed/simple;
	bh=5mj80IHNwAvVc8D1JmVg38Ai1k+GIULCHte528L2kDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nroNCfDn5z+O8b4l5i5jS3Uvb1MVRsr10T/y6EwF/d5+6T0LRHpSmu4fmjig14YNiVimifkg5JQgVlytCFOFwUPzLyhYmxefJ0t3/YpFDxHS2JUd/aT6IQEhMNaTx5iOpPFPJpcHD+kzdOB+70aUznn12Kavq2r4tn22y0V7jbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nHa3LKTm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nHa3LKTm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75A301F000E9;
	Thu, 18 Jun 2026 04:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781755518;
	bh=+2Qun1bQqiWmbsCdLidcBgRBaZIl/bKSHtUSQ4Sosrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nHa3LKTmp6EcoZSSPPyY9beWT+AUiaQsjlrqIgRylTGlWxHTEry1bxnQF4Yx/Epcd
	 YcmBcMGzm1FE5Tgnzyt3AHvbJN/2BG7GXWUJ0z/kyMoj5L449zdPwJ9rv3oYthUqSG
	 cwtPsVbhaxDiXABZZiIbPq/33KcXhoXAA539CF1s46LDfVjia3rqhjOaEq34mlxnLT
	 JPGUnrngD3algxLms1Q1sO74Rm3n1373jy1tDQjL+MegLskUzv/QVvb3Ie8aqWaPLh
	 m2O4/RA0BMBYjIE2di692CdD13sDQCzEpbakTnM3dFKVEJSQxziFebWa/2iefZSz4t
	 GPpyyyXBFQlxg==
Date: Thu, 18 Jun 2026 04:05:11 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: phucduc.bui@gmail.com
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>, nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com, chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 11/78] ASoC: codecs: cros_ec_codec: Use guard() for mutex
 locks
Message-ID: <ajNud7QkwF369lBY@google.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260617103235.449609-12-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617103235.449609-12-phucduc.bui@gmail.com>

On Wed, Jun 17, 2026 at 05:31:28PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Clean up the code using guard() for mutex locks.
> Merely code refactoring, and no behavior change.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
