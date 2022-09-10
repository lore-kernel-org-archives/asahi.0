Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70744ECD
	for <asahi@lists.linux.dev>; Sat, 10 Sep 2022 11:37:16 +0000 (UTC)
Received: by soltyk.jannau.net (Postfix, from userid 1000)
	id 44E6126F009; Sat, 10 Sep 2022 13:37:14 +0200 (CEST)
Date: Sat, 10 Sep 2022 13:37:14 +0200
From: Janne Grunau <j@jannau.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: asahi@lists.linux.dev, Mark Kettenis <kettenis@openbsd.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Hector Martin <marcan@marcan.st>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, Sven Peter <sven@svenpeter.dev>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 04/10] dt-bindings: arm: apple: Add t6001/t6002 Mac
 Studio compatibles
Message-ID: <20220910113714.GC4024@jannau.net>
References: <20220909135103.98179-1-j@jannau.net>
 <20220909135103.98179-5-j@jannau.net>
 <25b42684-1bee-b7f6-a89d-ed0b0ea7428b@linaro.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25b42684-1bee-b7f6-a89d-ed0b0ea7428b@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

On 2022-09-10 11:57:34 +0200, Krzysztof Kozlowski wrote:
> On 09/09/2022 15:50, Janne Grunau wrote:
> > This adds the following apple,t6001 platform:
> > 
> > - apple,j375c - Mac Studio (M1 Max, 2022)
> > 
> > And the initial apple,t6002 platform:
> > 
> > - apple,j375d - Mac Studio (M1 Ultra, 2022)
> > 
> > Signed-off-by: Janne Grunau <j@jannau.net>
> > ---
> > 
> >  Documentation/devicetree/bindings/arm/apple.yaml | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
> > index 8d93e8a6cc18..b34e56b9dc59 100644
> > --- a/Documentation/devicetree/bindings/arm/apple.yaml
> > +++ b/Documentation/devicetree/bindings/arm/apple.yaml
> > @@ -19,12 +19,14 @@ description: |
> >    - MacBook Air (M1, 2020)
> >    - iMac (24-inch, M1, 2021)
> >  
> > -  And devices based on the "M1 Pro" and "M1 Max" SoCs:
> > +  And devices based on the "M1 Pro", "M1 Max" and "M1 Ultra" SoCs:
> >  
> >    - MacBook Pro (14-inch, M1 Pro, 2021)
> >    - MacBook Pro (14-inch, M1 Max, 2021)
> >    - MacBook Pro (16-inch, M1 Pro, 2021)
> >    - MacBook Pro (16-inch, M1 Max, 2021)
> > +  - Mac Studio (M1 Max, 2022)
> > +  - Mac Studio (M1 Ultra, 2022)
> >  
> >    The compatible property should follow this format:
> >  
> > @@ -79,8 +81,15 @@ properties:
> >            - enum:
> >                - apple,j314c # MacBook Pro (14-inch, M1 Max, 2021)
> >                - apple,j316c # MacBook Pro (16-inch, M1 Max, 2021)
> > +              - apple,j375c # Mac Studio (M1 Max, 2022)
> >            - const: apple,t6001
> >            - const: apple,arm-platform
> 
> Blank line.

Added. The other entries in this list are not separated by blank lines.  
What would preferred to fix this? A whitespace only patch or can just 
add those additional blank lines in this change?

> > +      - description: Apple M1 Ultra SoC based platforms
> 
> With this:
> 
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks,
Janne
