Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB072737E3
	for <asahi@lists.linux.dev>; Sun,  2 Aug 2026 09:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785661642; cv=none; b=cib3ZDXoE9RDdP4YYif76f4bYqDD5OF5UzpvdP2wqVXcDrRadrH5sm76STW7rcseK0/7pn+egylIgMRe1j0+6xbpoXVz26ZFlfH76xFL8Sw/wK+UXb3o/URC4sVVfrg0FGQkWx4TzDBsY9ilg8xB0F+oZabZRG6Knw0QRyH82fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785661642; c=relaxed/simple;
	bh=RZ3yeMXR+2/THY7/Ox9OZK06r1AGGecqE3hZGQgHT2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p/3rbNpVs0i31n7lr8o0/o5FMLocE6I11Sp6okXQjZ5LskmkoCCaEjpsUUeB3NIlHfWzk2Zaow5ikQT47VC0l3csu5hlk2g9CxUfkdlNRmd2Ezkte1mt6idIAqdXk2FWtru1Zx/CzlcUZPIIHHlagL9NydF3Q86mKE8wxjEL9Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=U45ZRKdZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iaYYdgdb; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="U45ZRKdZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iaYYdgdb"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 695B51400143;
	Sun,  2 Aug 2026 05:07:20 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sun, 02 Aug 2026 05:07:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1785661640; x=1785748040; bh=GcowD4hPna
	FHV6viQpEqJbkWL7F/EROyiT8dzgigGfM=; b=U45ZRKdZUacgCfJeuXq+8XIfwg
	FkIe3LnHpKEl5LZJzKpkZTEgYvJADxrQbnUIvbEwJyCCQupTT7g1AudaCAvgZtp/
	RjF9+arRNJ48T5pSgAIuDBfzh+zJJtnGAt1iG+LI4uZcLJduk00/VvCLXj1y3xHV
	gHhEI8jFKw+kT4tctCg2ELCF0l9d/Avz7YJBnhQaL9njlSlzrH7Iug/RbFmlcbMm
	SDlGlTNWsXZYvQOrkGNn+GoiPYMEp9VlNc8Bzb7xGKdwJUC+RqQwkH0IYRQRbkE2
	Te2wKs6uO697k2wbzywGcnp7ABhMNLYghb4fjPYXfqoOx/TCuwzI45B9Dwlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1785661640; x=1785748040; bh=GcowD4hPnaFHV6viQpEqJbkWL7F/EROyiT8
	dzgigGfM=; b=iaYYdgdbc8hho4RDdf68ER6YQuxvEMU+b7dGVXkT9FVnk+yYfq4
	qG1KtjuFg5G3rczAV6kXJR/rgTMgjt0O4q1d+lCgaAKkFXgfmPgg2IMX1YXfrAti
	FF7VWQqdR5R9t+FPL8YDgBAS+Bp24T388klJ9ryT/KB9zfXRgut0FvbEQKZxRbvd
	wChNh+5sJWSy43jyHOdcRhY6W6zd3V7kufYjHYRDBXDV9n1ZkzgSFAM9KYGGnWH1
	2sa1fdelusbFhAlfYi4v30FI4M0Ll67c92XII7dUtuPj+gJMzHe+3KeDZvoKy5aJ
	KmQuCb8B2QowbuP5Wn6Nk9UOwmI9nAFfRZA==
X-ME-Sender: <xms:yAhvavzFCbnwRH47grekZXx3M80xjHwUS2f7ceA3O8S_mjzElsA1qg>
    <xme:yAhvajEfi1o6NOMMub6v71PdXbVSMiJGDsQYYdGUSroH4bF4I7SSBTgp87fwSbgU0
    _yjrBDh5Axng75fouGr_XeWBra9Us4BX1tGixBh30r2aBOOfNBSyb1U>
X-ME-Received: <xmr:yAhvakuHv5JBVcUcW7EpRX-j8oelL8B5iZraeS1zagRG1EKa00DOUcOR5gYuC3M7jGpQYvHwxXavZ43kBb9q0oSXbwGzB0lwXO4>
X-ME-Proxy-Cause: dmFkZTEtazb3aefcffG10LA8PvMPA8OYtMmfWjpIL55fBjfd9AI95fb06+KDp5LodwwKTa
    JPvvjV0gUCD7/zA2r57MQ/BJw8SCZtTm5v+4VIwFpWnYvam2fq3cTt08REowgdxfh7rF3s
    VEphO0c6UxRqSZepVtejjjSkCN9sKq2+9ZuSJBL3UYvaCGrAM/lrjjkRbtfjqShy8h2Fri
    YcIQenOsldMbNDI/gnvMnwByKKzfL1ldbQFa9u8fJghDFWRJZszVcpQNJt7BgBPuUwOmFs
    BilQLr70C8SPZH1vvDkfwZY369BotsIrtohR0HJdUnOylvl26JOeljIMdfkXrTXTluBdDm
    mvoIqoTrzoLZ9ro/RwQhiJFXDbhaTYoJ15tHxiI6BaotM/COL/qA5k+Zy6qE32ZXOM8y3A
    hVcCm9gORpMU159ZDU63ZUIPc01jnAPJOfL0qta4AYgMvbw7aFvJvW466LRYqGQY6n5jS/
    xambnA9eMiJQ9M7Xer7dGN8ivfsZWzgsJz1aF4WmT0Jou4G6Wpb5mU/bLAAq1D0P3Hm9zO
    nfMrVdvUxOIGaFHc/feZDhYubM9ETHYEKzxRApkBzhAfbHzvsAPfcEklD9EZ5zvtp1TOeE
    V4pEeGkAjiGf32VBFMhL5XFreaAAWsKwRCWL3sXUL8FMuYKpLVWpw5zDPnaA
X-ME-Proxy: <xmx:yAhvajA67ISfiPShw4ZqH6oZvH5brpyEvRoR1cReTSoIjNMkkIg7dQ>
    <xmx:yAhvavB8pl8k_EnC_ieSqQqJvqGoEuxrrd8hUG4gV9YD0xVrqNfKtw>
    <xmx:yAhvatqjYcYtyYrOuHc3MKU5-ZZLECogejx28JgAw3kfKMMVcUshMA>
    <xmx:yAhvaqGtWRMhPvec5bjrutgo3-kEngXxBxEvo63EpEG92a07DeXoSw>
    <xmx:yAhvahc9ngYaMtqECeuIW5VkzET0QgVu5qbqgBNIR01peIrlA9XFkgoQ>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Aug 2026 05:07:19 -0400 (EDT)
Date: Sun, 2 Aug 2026 11:07:18 +0200
From: Janne Grunau <j@jannau.net>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: spmi: apple,spmi: Add t603x
Message-ID: <20260802090718.GC806854@robin.jannau.net>
References: <20260728-t603x-spmi-v2-0-f43e5f10e583@chaosmail.tech>
 <20260728-t603x-spmi-v2-1-f43e5f10e583@chaosmail.tech>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260728-t603x-spmi-v2-1-f43e5f10e583@chaosmail.tech>

On Tue, Jul 28, 2026 at 11:28:07AM +0200, Sasha Finkelstein wrote:
> Add t603x compatibles, interrupt support, and support for SPMI
> controllers that are not always-on.
> 
> Keeping the "interrupt-controller" property as optional, as taking the
> j514c as an example, we only need this functionality on 3 out of 10
> SPMI controllers present on this SoC.
> 
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
> index 3e5b14bc8c31..9fc511bb0cb8 100644
> --- a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
> +++ b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
> @@ -20,6 +20,8 @@ properties:
>        - items:
>            - enum:
>                - apple,t6020-spmi
> +              - apple,t6030-spmi
> +              - apple,t6031-spmi
>                - apple,t8012-spmi
>                - apple,t8015-spmi
>            - const: apple,t8103-spmi

Please add "apple,t8122-spmi" as well

> @@ -34,6 +36,18 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  interrupts:
> +    maxItems: 1
> +    description: Optional, operates in polled mode if not present
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg

Reviewed-by: Janne Grunau <j@jannau.net>

Janne
