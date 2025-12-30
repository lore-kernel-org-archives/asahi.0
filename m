Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9141DE8BF;
	Tue, 30 Dec 2025 01:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767058688; cv=none; b=PT2h2Pwj3wxD5VmJWSLnRKf8nkJztEiBAqo7fNoJ8wC3P83ESkbP14rLNlwSIPiD2m4ONt1zpeWSK8C4NaPXoA3XphKh+iRmAEnC2+qaZlaW8kqQMfAcQoCj5LOTzP12MTAUKQo9BwEESem4i4uRMWOVvmG5Padbag5RTtjL1R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767058688; c=relaxed/simple;
	bh=urCIY28Bgg/DWNEhGAokKr3T2XA/0hKP4bHhcr/Cd8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UThlcO1sFSrH/kxG+mo/5ZPtv1yX9hWYGC+ifDqvsD+OPazs3GzxPBLuHXuhtbRXxFUopFmSOZ9IWoMr51bK7IO0K0zWMfEGa5FYpL7wtnpKQ2T8ZMDIh1/9WQziz49vrFqzOyIrMVEpRmRL/xPrey4Xtgu2ZttHO9sAjYiYlrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ane3J7yR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ane3J7yR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15B2DC4CEF7;
	Tue, 30 Dec 2025 01:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767058688;
	bh=urCIY28Bgg/DWNEhGAokKr3T2XA/0hKP4bHhcr/Cd8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ane3J7yRRaqVeKXcNFl0zPb8F1eUzeet5WWEV7XMk7579tlwZy76sgoUiQbfEF+Uq
	 ye+KSU7k9a2XiwxqzgEuGpB7PwVPHtuVxyk4j5Wk0GkwFkLoTPwbKv+hNFR7qLqjm4
	 eYZfS6OUXYMcEmDJbeas4P5nVszIgcs8/MPstXi+7ZPL5DHpj1eSXag+gfkGqu3fLd
	 tpczmQLTtvsK3yW7drKcusScsXyQROhfD5Z7lBsRQbBuSEYO1wkgsxBgr2QYas4PdM
	 4cIMyPzt30MRC6PpladfWCKr1uBgJtYFiD3UrD+Dw3AyDVR2Fy7mdH2HZxVAxUD8pA
	 /8Pfl0Ckj9I8w==
Date: Mon, 29 Dec 2025 19:38:07 -0600
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
Subject: Re: [PATCH v2 3/7] ASoC: dt-bindings: add TDM slot idle mode
 properties
Message-ID: <20251230013807.GA3063323-robh@kernel.org>
References: <20251221-tdm-idle-slots-v2-0-ed4d96413aec@gmail.com>
 <20251221-tdm-idle-slots-v2-3-ed4d96413aec@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251221-tdm-idle-slots-v2-3-ed4d96413aec@gmail.com>

On Sun, Dec 21, 2025 at 07:35:59PM +1000, James Calligeros wrote:
> Add properties to describe TDM slot idle behaviour. These properties can
> be used to describe how a DAI is supposed to behave when not active.
> 
> For example, Apple Silicon laptops split a single I2S bus between two
> physical lines which are combined at an OR gate in front of the
> receiving port. One codec on each line is expected to transmit zeroes
> during the active TDM slots of the opposite line, or we will have corrupted
> data at the receiver.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  .../bindings/sound/tdm-slot.yaml         | 33 +++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/tdm-slot.yaml b/Documentation/devicetree/bindings/sound/tdm-slot.yaml
> index 5bc46048d689..e8b2d35a7c37 100644
> --- a/Documentation/devicetree/bindings/sound/tdm-slot.yaml
> +++ b/Documentation/devicetree/bindings/sound/tdm-slot.yaml
> @@ -33,6 +33,17 @@ $defs:
>      $ref: /schemas/types.yaml#/definitions/uint32-array
>      description: Receive direction slot mask. Optional. Identical to TX mask.
>  
> +  dai-tdm-idle-mode:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum:
> +      - none
> +      - off
> +      - zero
> +      - pulldown
> +      - hiz
> +      - pullup
> +      - drivehigh
> +
>  properties:
>    dai-tdm-slot-num:
>      $ref: "#/$defs/dai-tdm-slot-num"
> @@ -46,4 +57,26 @@ properties:
>    dai-tdm-slot-rx-mask:
>      $ref: "#/$defs/dai-tdm-slot-rx-mask"
>  
> +  dai-tdm-slot-tx-idle-mode:
> +    $ref: "#/$defs/dai-tdm-idle-mode"
> +    description: Transmit direction idle slot mode. Optional. For hardware
> +      that can configure its behaviour during idle TDM slots via
> +      .set_tdm_idle(). "None" represents UB/unspecified behaviour and is the
> +      same as not setting this property.
> +
> +  dai-tdm-slot-rx-idle-mode:
> +    $ref: "#/$defs/dai-tdm-idle-mode"
> +    description: Receive direction idle slot mode. Optional. Identical to TX
> +      idle slot mode.
> +
> +  dai-tdm-slot-tx-idle-mask:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Transmit direction idle slot mask. Optional. 1 represents
> +      an idle slot.
> +
> +  dai-tdm-slot-rx-idle-mask:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Receive direction idle slot mask. Optional. Identical to
> +      TX mask.

These can be under a patternProperties:

patternProperties:
  '^dai-tdm-slot-[rt]x-idle-mode$':
    ...

  '^dai-tdm-slot-[rt]x-idle-mask$':
    ...

And then remove the $defs.

Rob
