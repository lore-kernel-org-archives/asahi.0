Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD9B3EBF1E
	for <asahi@lists.linux.dev>; Sun, 25 Jan 2026 11:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769341741; cv=none; b=dcuoXjggQDQu+h3aEpkJcZP2JPiLI1PGAmpjY100gA0U8XLiKYiJrfb6hlGRVl+lBAToLFTcPxTiLLGlPzmN8thONDb2tEUbod4TiDFwvc+bcWGJMmgaV4I4pcooQMtHW8OJNpETgmNipXr+GHdjUR4oKW2Rj7zg7X9Qd9bQfqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769341741; c=relaxed/simple;
	bh=rjL77zUUToUEaHnlOYyIIVe+LQJi2/fxYrBq+3x7VUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CTiZEN9UWdKzfAHk6uFCJXg11peL5z/k2l1h9KAQjM06i88+rVbfQ/y/ufN6rwpTgmLopL7//IAvXeZPrc7GJDvPJ/Zq4Dyx74rzl0sU7ynvZpHVXflRXtb6QYhR2EmQDfVGXr17Z8qQrCx7+24nr9XkiDpZ9MhqDOL/d1Vy+Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=cOE/nwD4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=w3Vm91fr; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="cOE/nwD4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="w3Vm91fr"
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 22AEC7A0186;
	Sun, 25 Jan 2026 06:48:59 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Sun, 25 Jan 2026 06:48:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1769341738; x=1769428138; bh=d/ESZ+BjF+
	l0bKx2dy8B0A8Rnl/sw5R4KcwWPDgIvMU=; b=cOE/nwD4KhI9/lkClbht6dYy8N
	TsM81QddgixChETN62/eQN+l/Y/XCJTRKKxu53oXr4O05Y7ppRcVFxL+ettHvSVh
	lkqV6UTkZ/z27XXnUpXtKFtYL48n55/qjCi2zTypEl3MP12LZI/aSLz3IwPKI/87
	KhAlhcJaI3hvlafS0NDgOPWZGnMAuvJRwgPVKOb2ExrmUfkkYrwI0Tu+GZveXlWO
	mYIO2XN2RHgYKQD8ZFkxzdOzGOPC7xTW6DwxlYtNm6+Zdddf9OiXHgwy+9+WPiN0
	T2Z7l0sK6EoxR9F2bbvhxR0YtTZSDexv/hHCtVEpbxDmCR6V9iP6i69XX7EA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1769341738; x=1769428138; bh=d/ESZ+BjF+l0bKx2dy8B0A8Rnl/sw5R4Kcw
	WPDgIvMU=; b=w3Vm91frxER6kV66GFu7X+vWbBMjQnAAS9xdxMnnsFpB8zWdbTx
	chV9uMnBLuqOfsBklmBCIcxVxW3HUXWS4ECzBLNKD4QH5jb1z6ni9lMIX0HL3kwO
	7UwdgvsDnZPsViArfBcEepQ0Xax5oAVrVHKY1DvTfIvKFVoNwqHl0x0y4B3JTBuD
	FqGTKKkvcxgVFwKuNmGxMfO/z0/JcM/RujoCJQQt/PARPnI5xHsjIkieoscnap5/
	/7GGgv29CZafYqZqilu5xb6RFS05CWowE6AYquqr3yFqKaWrEU7aprsb47iDbRee
	Tb7sYSEXZIsSH8Cy+rqG82pAO4suiqkmUig==
X-ME-Sender: <xms:KgN2aWCf5gMdOgbSrp1NBxS6c8GrJPL0vsIk0EdeNtHpnpu4CGxQcg>
    <xme:KgN2acWGE8ZwYcNG4Vab8tNS5dDKmokwsDjWPhVpcc3LhX2fFVCyVOaSo1u3ogmvd
    9rIya7LdON9E5Ao5Q0yHUH11oUjevG6Zns5AE27dasUDThdadLeXNo>
X-ME-Received: <xmr:KgN2aU-ZUr1hjuH0-mFE7Tnh8I3jObm6C4RPOTyd9hnWZlW7TtTq2wOzoqzLMgkzTaj8H2_rEpNOlAp2nd4hkE1wy9-lyk6T300>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduheegjeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpeeigf
    dvheehleegiedtgfeljefgjeevfeejgeetkeetfeevtdefkeeluefhieegtdenucffohhm
    rghinhepuggvvhhitggvthhrvggvrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurdhnvghtpdhnsggprhgtphht
    thhopeduuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgrrhhkrdhkvghtth
    gvnhhishesgihsgegrlhhlrdhnlhdprhgtphhtthhopehsvhgvnheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepnhgvrghlsehgohhmphgrrdguvghvpdhrtghpthhtohepthhglh
    igsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghsrghhihes
    lhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvg
    hrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:KgN2aeR9atulmEYUpnk1EtQsUJ6yNX5AC0joewSERRVeO87DY0Gz2g>
    <xmx:KgN2aZQILSZebzY-Ov0cXT7CpZP4zobydWf9Br34hEswQ6wpJBZhcQ>
    <xmx:KgN2aa5wUCL--fp9fGqs4jQYl4l7NQc4lT9rYijgCnyyqLmvn9mKMQ>
    <xmx:KgN2aeVbfW9Kpux3ndc2tBZoHp8WPotuZWZKzW2XVmU3PI7vuxCfcA>
    <xmx:KgN2aVugQMkSEeassmSfPupr7xzZW6DxG1do6D-0Sqq4cLmtD3a-WuP4>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 25 Jan 2026 06:48:58 -0500 (EST)
Date: Sun, 25 Jan 2026 12:48:57 +0100
From: Janne Grunau <j@jannau.net>
To: Mark Kettenis <mark.kettenis@xs4all.nl>
Cc: sven@kernel.org, neal@gompa.dev, tglx@linutronix.de, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: interrupt-controller: apple,aic2: Add
 AICv3
Message-ID: <20260125114857.GA1667597@robin.jannau.net>
References: <20260125-irq-apple-aic3-v1-0-a2afe66a6ab9@jannau.net>
 <20260125-irq-apple-aic3-v1-1-a2afe66a6ab9@jannau.net>
 <87y0ll6i23.fsf@bloch.sibelius.xs4all.nl>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87y0ll6i23.fsf@bloch.sibelius.xs4all.nl>

On Sun, Jan 25, 2026 at 12:35:48PM +0100, Mark Kettenis wrote:
> > From: Janne Grunau <j@jannau.net>
> > Date: Sun, 25 Jan 2026 12:08:45 +0100
> 
> Hi Janne,
> 
> > 
> > AIC version 3 as found on the Apple M3 (t8122) is very similar to AICv2
> > in its base functionality. It can use the same device tree bindings as
> > AICv2 so add it to the AICv2 bindings.
> > This interrupt controller is used on all Apple SoCs starting with M3 up
> > to at least M5.
> > The only apparent difference is the increased IRQ config offset. Apple's
> > device tree codes this new offset as property of the "aic" node but the
> > value stayed constant for all SoCs with "aic,3". Since the SoC specific
> > compatible "apple,t8122-aic3" will be used in the driver this offset can
> > remain a driver implementation detail.
> > 
> > Signed-off-by: Janne Grunau <j@jannau.net>
> > ---
> >  .../bindings/interrupt-controller/apple,aic2.yaml  | 29 +++++++++++++++-------
> >  1 file changed, 20 insertions(+), 9 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
> > index ee5a0dfff437816056bda0de5523bf38be4f49ba..933e134d82bb599a68707ba34e04ea55d61050b9 100644
> > --- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
> > @@ -4,10 +4,10 @@
> >  $id: http://devicetree.org/schemas/interrupt-controller/apple,aic2.yaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> >  
> > -title: Apple Interrupt Controller 2
> > +title: Apple Interrupt Controller 2 and 3
> >  
> >  maintainers:
> > -  - Hector Martin <marcan@marcan.st>
> > +  - Janne Grunau <j@jannau.net>
> >  
> >  description: |
> >    The Apple Interrupt Controller 2 is a simple interrupt controller present on
> > @@ -28,14 +28,23 @@ description: |
> >    which do not go through a discrete interrupt controller. It also handles
> >    FIQ-based Fast IPIs.
> >  
> > +  The Apple Interrupt Controller 3 is in its base functionality very similar to
> > +  the Apple Interrupt Controller 2 and uses the same device tree bindings. It is
> > +  found on Apple ARM SoCs platforms starting with t8122 (M3).
> > +
> >  properties:
> >    compatible:
> > -    items:
> > -      - enum:
> > -          - apple,t8112-aic
> > -          - apple,t6000-aic
> > -          - apple,t6020-aic
> > -      - const: apple,aic2
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - apple,t8112-aic
> > +              - apple,t6000-aic
> > +              - apple,t6020-aic
> > +          - const: apple,aic2
> > +      - items:
> > +          - enum:
> > +              - apple,t6030-aic3
> > +          - const: apple,t8122-aic3
> 
> I think this is missing a
> 
>          - const: apple,t8122-aic3
> 
> otherwise, the non-{Pro/Ultra/Max} M3 can't have the simple
> 
>     compatible = "apple,t8122-aic3"

indeed, I forgot to copy my t8122 device tree over when I ran dtbs_check
before submission. Fixed locally and I added a apple,t8122-aic3 example
which tests the #interrupt-cells 3 case

Thanks

Janne
