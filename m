Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760F531985D
	for <asahi@lists.linux.dev>; Sun, 25 Jan 2026 11:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769340960; cv=none; b=e72XoG2AHzJqO3EG+KAL6SL4yFNPf+coSBNoqaf07/H0MEweJYnBvIJrwOIv5piIJI/E5XnOq7ORTk+a3D/9HrkMSBnX5YNZzSjcBWB2poBffYFoSEQ0nMmxWjhjZYEplFkFzgeOkht0S5oX2XmL/np+QLK978LiCB4Zlx7GY5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769340960; c=relaxed/simple;
	bh=x/0orBxeKZM+mhM0LjIHS2sanGBsiufMLuC6yLvXLfU=;
	h=Date:Message-Id:From:To:Cc:In-Reply-To:Subject:References; b=AeeCQJab5Wp0OocPzvUHkYh+YG5cW+0lXoZobUypf6ge5sdT43z0K7euCw59yF8mh7UUlhGpAolZRLUXprTpsOPHztfJxOEwX2CSTj25ipu2FZfbVIREec1z+H8a4pUUIdigziK1zaY7vsD5ujYTnyAd7ZxlSt3CA2q8b5I3FR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=J7U6GeFB; arc=none smtp.client-ip=195.121.94.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="J7U6GeFB"
X-KPN-MessageId: ff7bb1a8-f9e1-11f0-af3f-005056994fde
Received: from smtp.kpnmail.nl (unknown [10.31.155.5])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id ff7bb1a8-f9e1-11f0-af3f-005056994fde;
	Sun, 25 Jan 2026 12:35:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=subject:to:from:message-id:date;
	bh=C2uhhbpesDEO2hlyJwaE7Co6xlX913kY2j+ChemzF44=;
	b=J7U6GeFBfHZekGCsacdE/iT7EZ9FUCJsz4y5x2bkdMDu6Fad8FKwpUnoXvEhzhx6dPN9Mm36esMIz
	 XLt1B5xRxdQAiVq1he29e+owMNiMnnfAfQGWob/wDP0B8+2IOvK2TJOMpm5n9hnT3BH3QxhrTeNhKC
	 JF9j9c5/htiO43wkAAZ9y/JlwyFRx7AK8IQsqxU8gTZ+V1619BcUXaZCeSdICiAh0CIGlFPFOLbbGG
	 Y+lx2PhwGd5+yaW761CymxptYbmjuFrawrcbo1PIfCm0r8VfoC59VPK/8mzDXQfeIRiJwoefmbOkR8
	 Gvqg43NOgJPwbx8Ie3n5htkgKEDgV7g==
X-KPN-MID: 33|/pHX2bq9n4RcDNp+f2+9ka8ELQ8Pa5m+MZj5XpzdczBT8yEB4c3RCzrj5zUu76D
 EKmODw9EpoAKiIcvYfAAopUZ7VvNPHg6O156MN1kJN0Q=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|kSstmqaLKwUNjg6gbcB4irGicZr85Vqo9NR1Vbh17a2/iR+zxb1i/xOZMLVHJJ0
 d9WIeZ6a6FvDT2z2mLuR1bQ==
Received: from bloch.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id fefb5643-f9e1-11f0-8d40-00505699b758;
	Sun, 25 Jan 2026 12:35:49 +0100 (CET)
Date: Sun, 25 Jan 2026 12:35:48 +0100
Message-Id: <87y0ll6i23.fsf@bloch.sibelius.xs4all.nl>
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Janne Grunau <j@jannau.net>
Cc: sven@kernel.org, neal@gompa.dev, tglx@linutronix.de,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	j@jannau.net
In-Reply-To: <20260125-irq-apple-aic3-v1-1-a2afe66a6ab9@jannau.net> (message
	from Janne Grunau on Sun, 25 Jan 2026 12:08:45 +0100)
Subject: Re: [PATCH 1/2] dt-bindings: interrupt-controller: apple,aic2: Add
 AICv3
References: <20260125-irq-apple-aic3-v1-0-a2afe66a6ab9@jannau.net> <20260125-irq-apple-aic3-v1-1-a2afe66a6ab9@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>

> From: Janne Grunau <j@jannau.net>
> Date: Sun, 25 Jan 2026 12:08:45 +0100

Hi Janne,

> 
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
>  .../bindings/interrupt-controller/apple,aic2.yaml  | 29 +++++++++++++++-------
>  1 file changed, 20 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
> index ee5a0dfff437816056bda0de5523bf38be4f49ba..933e134d82bb599a68707ba34e04ea55d61050b9 100644
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
> @@ -28,14 +28,23 @@ description: |
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
> +          - const: apple,aic2
> +      - items:
> +          - enum:
> +              - apple,t6030-aic3
> +          - const: apple,t8122-aic3

I think this is missing a

         - const: apple,t8122-aic3

otherwise, the non-{Pro/Ultra/Max} M3 can't have the simple

    compatible = "apple,t8122-aic3"

>  
>    interrupt-controller: true
>  
> @@ -117,7 +126,9 @@ allOf:
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
> 
> -- 
> 2.52.0
> 
> 
> 
