Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46D517C77;
	Tue, 30 Dec 2025 01:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767058346; cv=none; b=WMMzHEJYel6odpsDexb6yPmTP1mJbXIzQqA656U3Oyv19ymPpdsKFqtlQKBxT5GK84VtyGKqp6C8+5KuzTwkGK9stU71UDfWaFHsqy48ib3wdrCbsTWAlvWeinCvHSy8CNEDW8fGNgcKkWImxQK8BeaF3gfy+OrKcZshamQqnfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767058346; c=relaxed/simple;
	bh=8GC9+1cPgKA6OlXPNo/vqRfC2edlTNPVVVG293aNUF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mjYt9hPCEfb8n0jTQI9M27qz92GuCAPujLgiwqqjVQui1MxhueGctJ0YfJDAKI1UN5Wbp3/Dld5ZVJ2Z0i2xOeXXwIkXyMbdZtbi55ZtY0uQDoDv7o+C/VtXKIUjtBmrSuaEfL4YrGlLffy23kkcFExtwP2VI6o5eg+QL/Ps7pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t0gWSqfe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t0gWSqfe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16129C4CEF7;
	Tue, 30 Dec 2025 01:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767058346;
	bh=8GC9+1cPgKA6OlXPNo/vqRfC2edlTNPVVVG293aNUF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t0gWSqfeZ5wpv1aoDOkKa0nd/G1HAxtAdbI+iNPqRs1+zmOyCOZNucc+Ftxn/Igxt
	 JQVD1uqZEeMDo4iT2QSP/ia54kdSSTiH5HUwQrhoux6B512R1fzshk69Rj9/0bOsI9
	 FbbrLt6fOBtnryWnsTmTR1w+AhWCznx/h9CnSqGRG3oAG6WBP35dzKkXVSsYiEGRC4
	 rqwbdGEvnMUYzT6zE+27R6hZEvBG1LAUeUssqFOLGxZTT+WMeJZitkPMER4ftd50eG
	 DM1JSAfSzrAxFDioeWU1wlretsnK4IMmq3JzptubpbQU0rszNFn0BwckanbfMOBRlT
	 BWX/vMDN8QyAg==
Date: Mon, 29 Dec 2025 19:32:25 -0600
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
Subject: Re: [PATCH v2 2/7] ASoC: dt-bindings: update tdm-slot.txt references
 to tdm-slot.yaml
Message-ID: <20251230013225.GA3037280-robh@kernel.org>
References: <20251221-tdm-idle-slots-v2-0-ed4d96413aec@gmail.com>
 <20251221-tdm-idle-slots-v2-2-ed4d96413aec@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251221-tdm-idle-slots-v2-2-ed4d96413aec@gmail.com>

On Sun, Dec 21, 2025 at 07:35:58PM +1000, James Calligeros wrote:
> Ensure that all references to tdm-slot.txt have been updated to
> tdm-slot.yaml, and are schema-compliant.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  .../bindings/sound/imx-audio-card.yaml   | 14 ++++++--------
>  .../bindings/sound/simple-card.yaml      | 14 ++------------
>  2 files changed, 8 insertions(+), 20 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> index 3c75c8c78987..eb702f48d694 100644
> --- a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> @@ -31,6 +31,12 @@ patternProperties:
>          $ref: /schemas/types.yaml#/definitions/string
>          maxItems: 1
>  
> +      dai-tdm-slot-num:
> +        $ref: tdm-slot.yaml#/$defs/dai-tdm-slot-num
> +
> +      dai-tdm-slot-width:
> +        $ref: tdm-slot.yaml#/$defs/dai-tdm-slot-width

Drop these and add just '$ref: tdm-slot.yaml#' up a level (with 
'properties').

You may need 'unevaluatedProperties' or you can put 
'dai-tdm-slot-num: true' here if you want to define which properties are 
used.

> +
>        format:
>          description: audio format.
>          items:
> @@ -38,14 +44,6 @@ patternProperties:
>              - i2s
>              - dsp_b
>  
> -      dai-tdm-slot-num:
> -        description: see tdm-slot.txt.
> -        $ref: /schemas/types.yaml#/definitions/uint32
> -
> -      dai-tdm-slot-width:
> -        description: see tdm-slot.txt.
> -        $ref: /schemas/types.yaml#/definitions/uint32
> -
>        playback-only:
>          description: link is used only for playback
>          $ref: /schemas/types.yaml#/definitions/flag
> diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
> index 533d0a1da56e..a14716b2732f 100644
> --- a/Documentation/devicetree/bindings/sound/simple-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
> @@ -27,14 +27,6 @@ definitions:
>      description: dai-link uses bit clock inversion
>      $ref: /schemas/types.yaml#/definitions/flag
>  
> -  dai-tdm-slot-num:
> -    description: see tdm-slot.txt.
> -    $ref: /schemas/types.yaml#/definitions/uint32
> -
> -  dai-tdm-slot-width:
> -    description: see tdm-slot.txt.
> -    $ref: /schemas/types.yaml#/definitions/uint32
> -
>    system-clock-frequency:
>      description: |
>        If a clock is specified and a multiplication factor is given with
> @@ -115,6 +107,8 @@ definitions:
>  
>    dai:
>      type: object
> +    $ref: tdm-slot.yaml#
> +
>      properties:
>        sound-dai:
>          maxItems: 1
> @@ -133,10 +127,6 @@ definitions:
>        bitclock-master:
>          $ref: /schemas/types.yaml#/definitions/flag
>  
> -      dai-tdm-slot-num:
> -        $ref: "#/definitions/dai-tdm-slot-num"
> -      dai-tdm-slot-width:
> -        $ref: "#/definitions/dai-tdm-slot-width"
>        clocks:
>          maxItems: 1
>        system-clock-frequency:
> 
> -- 
> 2.52.0
> 
