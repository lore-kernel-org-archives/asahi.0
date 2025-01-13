Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A15233D69;
	Mon, 13 Jan 2025 08:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736758743; cv=none; b=rC55G8hGRbPr2SJzNXZ2yiiU1br+dinLGRWhhFHAFKh/fXT62WU92feTgEC6YbudcaEL2nNeTRNDmKmDGlm8SGBEijFyEbiNUoFT+HktvZF5R9WYG3wiGfsedllome5o6+gwXFAUXXy1/M4MlMLkCyQLN5Xkx5ypM6xJzgc1HAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736758743; c=relaxed/simple;
	bh=2wJJM13zlSd944RH/1F0Bz3tql/OxPThH7169R04jPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fUuIQ0IODsyElxHsm9glXFc2eNo8s75BJ5LirbgxzeBnLVkGrTO+gVxRzRcqQzcnJSxVDbp/F2m4UsUSrSVp/SxwSrPzmkmtcqNgsPIwfawzR+rdqchDrZ+fej5Jx1GhtQ+hc618VrpqLRll63axGuqsUkN/nWOTPBLzXva10qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iF3rsECn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iF3rsECn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F7ABC4CED6;
	Mon, 13 Jan 2025 08:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736758742;
	bh=2wJJM13zlSd944RH/1F0Bz3tql/OxPThH7169R04jPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iF3rsECnnNXnLPj/o91djAfP13GvTUDHa2aK3jynTdpWUxaFsoHt+YYpkPFr2bKhE
	 paaaxfqSUYRyNmmn5DgXeZlS7H1ClTLKP+oyDF+5GGDc2WsJ1et8+uLlDwJA6dc8Yh
	 iBKHhWS8W7njrgoB4rmdN/Dy6jnx/scMlCusFopJtOhRwT7LIC432I46q+uA2e4VTT
	 IygCnhmFDWjW+tC5D5GmeULFnqs4qDnkJIkQqQYXJQsOvzLw5ublYsF1jTSODgkwbC
	 9BDvIfgqmUwktgiixLRMuCPn3STy19yGn/+3RanXIrVLiaNUHa+N7JZ6x5ru221kEl
	 e3ah5b52n3SCg==
Date: Mon, 13 Jan 2025 09:58:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>
Subject: Re: [PATCH v3 1/5] dt-bindings: display: Add Apple pre-DCP display
 controller
Message-ID: <7rr3fja4rxjbdmgpdqaid5fybiu6uctpbvp24ujv5drfmeiowf@u4pkhzyhy3pd>
References: <20250112-adpdrm-v3-0-c674dc19fa7f@gmail.com>
 <20250112-adpdrm-v3-1-c674dc19fa7f@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250112-adpdrm-v3-1-c674dc19fa7f@gmail.com>

On Sun, Jan 12, 2025 at 09:43:48PM +0100, Sasha Finkelstein wrote:
 +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Input port. Always connected to the primary controller
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Output MIPI DSI port to the panel
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - ports
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    dsi@228200000 {
> +        compatible = "apple,t8103-display-pipe-mipi", "apple,h7-display-pipe-mipi";
> +        reg = <0x28200000 0xc000>;

This looks not matching unit address.

> +        power-domains = <&ps_dispdfr_mipi>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                #address-cells = <1>;
> +                #size-cells = <0>;

Make the example complete, so you will see that address/size cells are
unnecessary here or, if you really have more than one endpoint, they are
supposed to be here.

> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +            };
> +        };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/display/apple,h7-display-pipe.yaml b/Documentation/devicetree/bindings/display/apple,h7-display-pipe.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..dc07edccb437b221ea9772b9356e1896326aa7da
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/apple,h7-display-pipe.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/apple,h7-display-pipe.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple pre-DCP display controller
> +
> +maintainers:
> +  - Sasha Finkelstein <fnkl.kernel@gmail.com>
> +
> +description:
> +  A secondary display controller used to drive the "touchbar" on
> +  certain Apple laptops.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - apple,t8112-display-pipe
> +          - apple,t8103-display-pipe
> +      - const: apple,h7-display-pipe
> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: be
> +        description: Primary register block, controls planes and blendinga

Description goes to 'reg:' field, just like I asked last time.

> +      - const: fe
> +        description:
> +          Contains other configuration registers like interrupt
> +          and FIFO control
> +
> +  power-domains:
> +    description:
> +      Phandles to pmgr entries that are needed for this controller to turn on.
> +      Aside from that, their specific functions are unknown
> +    maxItems: 2
> +
> +  interrupts:

Same comments as before - list and describe the items.

Best regards,
Krzysztof

