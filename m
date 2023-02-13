Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0908C33D1
	for <asahi@lists.linux.dev>; Mon, 13 Feb 2023 13:42:27 +0000 (UTC)
Received: by soltyk.jannau.net (Postfix, from userid 1000)
	id EE68226F77F; Mon, 13 Feb 2023 14:42:25 +0100 (CET)
Date: Mon, 13 Feb 2023 14:42:25 +0100
From: Janne Grunau <j@jannau.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mark Kettenis <kettenis@openbsd.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 16/17] dt-bindings: arm: apple: Add t8112 j413/j473/j493
 compatibles
Message-ID: <20230213134225.GD17933@jannau.net>
References: <20230202-asahi-t8112-dt-v1-0-cb5442d1c229@jannau.net>
 <20230202-asahi-t8112-dt-v1-16-cb5442d1c229@jannau.net>
 <101940e8-c149-dd81-4abc-2a1479c19a9f@linaro.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <101940e8-c149-dd81-4abc-2a1479c19a9f@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

On 2023-02-13 12:15:55 +0100, Krzysztof Kozlowski wrote:
> On 12/02/2023 16:41, Janne Grunau wrote:
> > This adds the following apple,t8112 platforms:
> > 
> > - apple,j413 - MacBook Air (M2, 2022)
> > - apple,j473 - Mac mini (M2, 2023)
> > - apple,j493 - MacBook Pro (13-inch, M2, 2022)
> > 
> > Signed-off-by: Janne Grunau <j@jannau.net>
> > ---
> >  Documentation/devicetree/bindings/arm/apple.yaml | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
> > index da78c69774f2..883fd67e3752 100644
> > --- a/Documentation/devicetree/bindings/arm/apple.yaml
> > +++ b/Documentation/devicetree/bindings/arm/apple.yaml
> > @@ -19,6 +19,12 @@ description: |
> >    - MacBook Air (M1, 2020)
> >    - iMac (24-inch, M1, 2021)
> >  
> > +  Devices based on the "M2" SoC:
> > +
> > +  - MacBook Air (M2, 2022)
> > +  - MacBook Pro (13-inch, M2, 2022)
> > +  - Mac mini (M2, 2023)
> 
> Aren't you now repeating exactly what is in the schema? Keep only one...

yes but I think the duplication is OK. I consider the description for 
human consumption and the schema for computer consumption. The comments 
in the schema are aids to for editing the schema. This follows the 
existing pattern for M1 and M1 Pro/Max/Ultra based devices in this file.

Janne
