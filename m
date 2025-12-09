Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2A226F443;
	Tue,  9 Dec 2025 19:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765307606; cv=none; b=iKlCLFoqFEY38/3jCXhxmebBJOnxnir36FotSCalPoic8owABeyVXmkOti7k1bVfrH2S5Zrhu5n9Tv8meUaSgTvY/BE9ZV1URXjwVGbkBma0mMaDzbNWBQ4NNlpX5pOQ4AKOKOYf/Ibk19jb3diX5Dc6gmcEJwVEAwBXdlAOa4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765307606; c=relaxed/simple;
	bh=E/h9yRqykG5Tglzcrsb/BCu5betWyxIoDaKz+Xbemzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PgJJ6GfS5bGfUkQ2GeUlCEUYgNveLdguM6VukOUeT4JwJwPZG3TsJdZKO1wdNwgkb9LCCZBnTLPROKAb0NQspNcKk0XjNMNtVLf3XHSsz+pTr28pN4ew+y8etd7H3cLTNVRGc1ImHwzz8FJZuIX/mS+IJvYbxnPN5diTRCqLK7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tewNc3LL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tewNc3LL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FEF8C4CEF5;
	Tue,  9 Dec 2025 19:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765307605;
	bh=E/h9yRqykG5Tglzcrsb/BCu5betWyxIoDaKz+Xbemzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tewNc3LLWC40awRaXgJRiR1PXqqGU+Mu32EeTyOs5DCaaPNNiJvPWFvcmlcAvlkfw
	 Q9817VCsC5cNDSTUk7uAk8erpV9uAWCOMiBXE1GZlOObvj5v0b2N9cGFXR5kecTYio
	 MhncKrgNG5CzcIYuwx0LV5T1plm72acYecsGUww9K5maTDpu8Out4kvgbq8/zgxzOQ
	 fdrFTrwppSbao9IIMMMSjJH2kVOi1sdVBmumcCDwvQsTTIi32csbZc/cRH3M2yV5q3
	 Cufl+RxaSwf5TCtJkxHs53oEWm09K7E7q4fzAD8sOLtLE3bAH2MPgfaH6gfHK5NqP0
	 /qrJTGztmzj/A==
Date: Tue, 9 Dec 2025 13:13:23 -0600
From: Rob Herring <robh@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Subject: Re: [PATCH 2/7] ASoC: dt-bindings: update tdm-slot.txt references to
 tdm-slot.yaml
Message-ID: <20251209191323.GA954261-robh@kernel.org>
References: <20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com>
 <20251209-tdm-idle-slots-v1-2-38dabf6bc01e@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209-tdm-idle-slots-v1-2-38dabf6bc01e@gmail.com>

On Tue, Dec 09, 2025 at 07:31:15PM +1000, James Calligeros wrote:
> Ensure that all references to tdm-slot.txt have been updated to
> tdm-slot.yaml.
> 
> Achieved by running "sed -i 's/tdm-slot.txt/tdm-slot.yaml/g' *"
> against the bindings/sound. No other references to the file
> were found in the tree.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  .../bindings/sound/imx-audio-card.yaml   | 4 ++--
>  .../bindings/sound/simple-card.yaml      | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> index 3c75c8c78987..1df29a556120 100644
> --- a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> @@ -39,11 +39,11 @@ patternProperties:
>              - dsp_b
>  
>        dai-tdm-slot-num:
> -        description: see tdm-slot.txt.
> +        description: see tdm-slot.yaml.
>          $ref: /schemas/types.yaml#/definitions/uint32
>  
>        dai-tdm-slot-width:
> -        description: see tdm-slot.txt.
> +        description: see tdm-slot.yaml.
>          $ref: /schemas/types.yaml#/definitions/uint32

These should be removed and replaced with a '$ref: tdm-slot.yaml#' at 
the top-level. 

If you have some constraints to add here, then the property can stay.

>  
>        playback-only:
> diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
> index 533d0a1da56e..2e1a5b3216c5 100644
> --- a/Documentation/devicetree/bindings/sound/simple-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
> @@ -28,11 +28,11 @@ definitions:
>      $ref: /schemas/types.yaml#/definitions/flag
>  
>    dai-tdm-slot-num:
> -    description: see tdm-slot.txt.
> +    description: see tdm-slot.yaml.
>      $ref: /schemas/types.yaml#/definitions/uint32
>  
>    dai-tdm-slot-width:
> -    description: see tdm-slot.txt.
> +    description: see tdm-slot.yaml.
>      $ref: /schemas/types.yaml#/definitions/uint32

Same here.

>  
>    system-clock-frequency:
> 
> -- 
> 2.52.0
> 
