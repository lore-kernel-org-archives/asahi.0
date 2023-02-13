Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523F033D1
	for <asahi@lists.linux.dev>; Mon, 13 Feb 2023 12:33:48 +0000 (UTC)
Received: by soltyk.jannau.net (Postfix, from userid 1000)
	id 7763A26F77E; Mon, 13 Feb 2023 13:33:46 +0100 (CET)
Date: Mon, 13 Feb 2023 13:33:46 +0100
From: Janne Grunau <j@jannau.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/17] dt-bindings: interrupt-controller: apple,aic2: Add
 apple,t8112-aic compatible
Message-ID: <20230213123346.GB17933@jannau.net>
References: <20230202-asahi-t8112-dt-v1-0-cb5442d1c229@jannau.net>
 <20230202-asahi-t8112-dt-v1-5-cb5442d1c229@jannau.net>
 <2f5a63ba-f4de-da89-7621-3fe1d79cdc94@linaro.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f5a63ba-f4de-da89-7621-3fe1d79cdc94@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

On 2023-02-13 12:12:25 +0100, Krzysztof Kozlowski wrote:
> On 12/02/2023 16:41, Janne Grunau wrote:
> > The Apple M2 SoC uses AICv2 and is compatible with the existing driver.
> > Add its per-SoC compatible.
> > Since multi-die versions of the M2 are not expected decrease
> > '#interrupt-cells' to 3 for apple,t8112-aic. This is seamlessly handled
> > inside the driver.
> > 
> > Signed-off-by: Janne Grunau <j@jannau.net>
> > 
> > ---
> > This trivial dt-bindings update should be merged through the asahi-soc
> > tree to ensure validation of the Apple M2 (t8112) devicetrees in this
> > series.
> > ---
> >  .../bindings/interrupt-controller/apple,aic2.yaml  | 23 +++++++++++++++++++---
> >  1 file changed, 20 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
> > index 06948c0e36a5..120e23ff668c 100644
> > --- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
> > @@ -31,19 +31,22 @@ description: |
> >  properties:
> >    compatible:
> >      items:
> > -      - const: apple,t6000-aic
> > +      - enum:
> > +          - apple,t8112-aic
> > +          - apple,t6000-aic
> >        - const: apple,aic2
> >  
> >    interrupt-controller: true
> >  
> >    '#interrupt-cells':
> > -    const: 4
> > +    minimum: 3
> > +    maximum: 4
> >      description: |
> >        The 1st cell contains the interrupt type:
> >          - 0: Hardware IRQ
> >          - 1: FIQ
> >  
> > -      The 2nd cell contains the die ID.
> > +      The 2nd cell contains the die ID (optional).
> >  
> >        The next cell contains the interrupt number.
> >          - HW IRQs: interrupt number
> > @@ -98,6 +101,20 @@ properties:
> >            - apple,fiq-index
> >            - cpus
> >  
> > +if:
> 
> Put it under allOf. After "required:", just like example-schema asks for.

moved

> > +  properties:
> > +    compatible:
> > +      contains:
> > +        const: apple,t8112-aic
> > +then:
> > +  properties:
> > +    '#interrupt-cells':
> > +      maximum: 3
> 
> Shouldn't this be:
> const: 3

same effect but more explicit, bot changed

> > +else:
> > +  properties:
> > +    '#interrupt-cells':
> > +      minimum: 4
> 
> const: 4

thanks

Janne
