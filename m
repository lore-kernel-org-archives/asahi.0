Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC2313C918;
	Thu,  5 Feb 2026 12:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770295843; cv=none; b=CEI5+N10vc/texVEhGGtHutLt6oP9a4++iyx38p8Fn+j3+QxxjA9CCCTNkrIbQz7vReUoz9vAO3tIBYjdLqg8iYV4t1yH0+D0p3Irs+Gx31gORdz2AjbJdo9dL5Z9sZmmKQYRoXtu68XO//cUQz7HWNLTJdEsoWQPMeJQt5GMqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770295843; c=relaxed/simple;
	bh=8ZSFvFFjrBn3umwkPpCWB7+Cv6fyC2OJgBqtdvIYlAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q6QmCweJ7hcuSLDYt+dVdLFEKzvZ9fMJlZtp6fmhm0uamgkMXK3T1gMJPWWOdprYj1oIlkxplTn6/tM/twrb4vG2JLF/FSD3yvh9pa5I1ooqtzqudsI4UJsLBuw1M045ph73OvQcatVDc5D1wmFBvGgzdw6aeUQk8uAmat1yUEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JXdJqMsP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JXdJqMsP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42B82C4CEF7;
	Thu,  5 Feb 2026 12:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770295842;
	bh=8ZSFvFFjrBn3umwkPpCWB7+Cv6fyC2OJgBqtdvIYlAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JXdJqMsPnG5JvN/RqmqUjJrpoOZ+equY8ri6CNfNZrNfxnhMG35/Xn656s5MIv4g6
	 gw8JOgWNwFnZ7ksOYtSDWCGJrkrSEkDLiFLcriiQ9jt/yxxKDzGGZ8Qq7Tz6mLo2L6
	 oIC72ZtFxtiX9RjhN32IYlvFjmzl6vI3YW653nnoJQtCD2y/2QTgBvdcbFbJDxo/I8
	 PnanOOQTdBm/UgbJS5aSZnaz2g9L2l1bDzrz/fb+kDcCcSxWKmHAJOgM2rcIGc/rOD
	 ZX8bc4baFUOKebaOcVR2P1/tp6UVFRLU62W5or5m6Hv75YkfkuMqskRXljChRY93pS
	 v1Yj17yLxog2Q==
Date: Thu, 5 Feb 2026 13:50:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: interrupt-controller: apple,aic2:
 Add AICv3
Message-ID: <20260205-pastoral-magnificent-cuscus-ce58ad@quoll>
References: <20260128-irq-apple-aic3-v2-0-b4bc8e16c997@jannau.net>
 <20260128-irq-apple-aic3-v2-1-b4bc8e16c997@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260128-irq-apple-aic3-v2-1-b4bc8e16c997@jannau.net>

On Wed, Jan 28, 2026 at 09:57:08AM +0100, Janne Grunau wrote:
> AIC version 3 as found on the Apple M3 (t8122) is very similar to AICv2
> in its base functionality. It can use the same device tree bindings as
> AICv2 so add it to the AICv2 bindings.
> This interrupt controller is used on all Apple SoCs starting with M3 up
> to at least M5.
> The only apparent difference is the increased IRQ config offset. Apple's
> device tree codes this new offset as property of the "aic" node but the
> value stayed constant for all SoCs with "aic,3". Since the SoC specific
> compatible "apple,t8122-aic3" will be used in the driver this offset can
> remain a driver implementation detail.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  .../bindings/interrupt-controller/apple,aic2.yaml  | 45 +++++++++++++++++-----
>  1 file changed, 36 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
> index ee5a0dfff437816056bda0de5523bf38be4f49ba..a6e2251fcc111340c0a27ab6912452f6b1255be2 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
> @@ -4,10 +4,10 @@
>  $id: http://devicetree.org/schemas/interrupt-controller/apple,aic2.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Apple Interrupt Controller 2
> +title: Apple Interrupt Controller 2 and 3
>  
>  maintainers:
> -  - Hector Martin <marcan@marcan.st>
> +  - Janne Grunau <j@jannau.net>
>  
>  description: |
>    The Apple Interrupt Controller 2 is a simple interrupt controller present on
> @@ -28,14 +28,24 @@ description: |
>    which do not go through a discrete interrupt controller. It also handles
>    FIQ-based Fast IPIs.
>  
> +  The Apple Interrupt Controller 3 is in its base functionality very similar to
> +  the Apple Interrupt Controller 2 and uses the same device tree bindings. It is
> +  found on Apple ARM SoCs platforms starting with t8122 (M3).
> +
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - apple,t8112-aic
> -          - apple,t6000-aic
> -          - apple,t6020-aic
> -      - const: apple,aic2
> +    oneOf:
> +      - items:
> +          - enum:
> +              - apple,t8112-aic
> +              - apple,t6000-aic
> +              - apple,t6020-aic

If you are re-shuffling these, you can as well sort alphanumerically.

> +          - const: apple,aic2
> +      - items:
> +          - enum:
> +              - apple,t6030-aic3
> +          - const: apple,t8122-aic3
> +      - const: apple,t8122-aic3

Hm? How so this is not aic or aic2? We asked not to use generic compatibles
for aic/aic2 - for all your early upstreamings. Our advice and request
was in general rejected, although I could make a long term bet that we
will be right. And here we are.

Does this patch mean you finally agree with DT maintainers and abandon
the generic compatible fiasko?


>  
>    interrupt-controller: true
>  
> @@ -117,7 +127,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: apple,t8112-aic
> +            enum:
> +              - apple,t8112-aic
> +              - apple,t8122-aic3
>      then:
>        properties:
>          '#interrupt-cells':
> @@ -141,4 +153,19 @@ examples:
>                    <0x2 0x8e10c000 0x0 0x4>;
>              reg-names = "core", "event";
>          };
> +
> +    };
> +  - |
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        aic_t8122: interrupt-controller@2d1000000 {
> +            compatible = "apple,t8122-aic3";

No need for new example which has no differences from other ones. Drop.

Best regards,
Krzysztof

