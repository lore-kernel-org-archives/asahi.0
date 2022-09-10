Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EBEEC0
	for <asahi@lists.linux.dev>; Sat, 10 Sep 2022 11:43:26 +0000 (UTC)
Received: by soltyk.jannau.net (Postfix, from userid 1000)
	id 056FB26F009; Sat, 10 Sep 2022 13:43:24 +0200 (CEST)
Date: Sat, 10 Sep 2022 13:43:24 +0200
From: Janne Grunau <j@jannau.net>
To: Marc Zyngier <maz@kernel.org>
Cc: asahi@lists.linux.dev, Mark Kettenis <kettenis@openbsd.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Hector Martin <marcan@marcan.st>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, Sven Peter <sven@svenpeter.dev>,
	Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 01/10] dt-bindings: apple,aic: Fix required item
 "apple,fiq-index" in affinity description
Message-ID: <20220910114324.GD4024@jannau.net>
References: <20220909135103.98179-1-j@jannau.net>
 <20220909135103.98179-2-j@jannau.net>
 <874jxfqzvj.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874jxfqzvj.wl-maz@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

On 2022-09-10 11:37:20 +0100, Marc Zyngier wrote:
> On Fri, 09 Sep 2022 14:50:54 +0100,
> Janne Grunau <j@jannau.net> wrote:
> > 
> > Fixes: dba07ad11384 ("dt-bindings: apple,aic: Add affinity description for per-cpu pseudo-interrupts")
> > Signed-off-by: Janne Grunau <j@jannau.net>
> > ---
> > 
> >  .../devicetree/bindings/interrupt-controller/apple,aic.yaml     | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
> > index 85c85b694217..e18107eafe7c 100644
> > --- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
> > @@ -96,7 +96,7 @@ properties:
> >                Documentation/devicetree/bindings/arm/cpus.yaml).
> >  
> >          required:
> > -          - fiq-index
> > +          - apple,fiq-index
> >            - cpus
> >  
> >  required:
> 
> With a commit message added,

I've added

| The required list used "fiq-index" instead of "apple,fiq-index"
| described as property and used in the dts. Add the missing "apple,"
| prefix.

as commit description.

> Acked-by: Marc Zyngier <maz@kernel.org>

Thanks,
Janne
