Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A4933EC
	for <asahi@lists.linux.dev>; Mon, 13 Feb 2023 11:57:43 +0000 (UTC)
Received: by soltyk.jannau.net (Postfix, from userid 1000)
	id A0A4926F77E; Mon, 13 Feb 2023 12:57:41 +0100 (CET)
Date: Mon, 13 Feb 2023 12:57:41 +0100
From: Janne Grunau <j@jannau.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mark Kettenis <kettenis@openbsd.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/17] dt-bindings: arm: apple: apple,pmgr: Add
 t8112-pmgr compatible
Message-ID: <20230213115741.GA17933@jannau.net>
References: <20230202-asahi-t8112-dt-v1-0-cb5442d1c229@jannau.net>
 <20230202-asahi-t8112-dt-v1-2-cb5442d1c229@jannau.net>
 <5ebf96d9-689a-f915-29b8-31af891fc63f@linaro.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ebf96d9-689a-f915-29b8-31af891fc63f@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

On 2023-02-13 12:10:36 +0100, Krzysztof Kozlowski wrote:
> On 12/02/2023 16:41, Janne Grunau wrote:
> > The block on Apple M2 SoCs is compatible with the existing driver so
> > just add its per-SoC compatible.
> > 
> > Signed-off-by: Janne Grunau <j@jannau.net>
> > 
> > ---
> > This trivial dt-bindings update should be merged through the asahi-soc
> > tree to ensure validation of the Apple M2 (t8112) devicetrees in this
> > series.
> 
> No, the bindings go via subsystem. Just because you want to validate
> something is not really a reason - you can validate on next. Don't
> create special rules for Asahi... or rather - why Asahi is special than
> everyone else?

We did that 2 or 3 times in the past without commnts that it is not 
desired so I wasn't aware that this would be special handling.

Merging binding and devicetree updates together looks to me like the 
most sensible option since dtbs validation is the only testable 
dependecy of dt binding updates.
Keeping them together ensures the dtbs validate without delaying 
devicetree changes by one kernel release after the dt-bindings change 
was merged.
I suppose it works out most of the time if the merge request is sent 
only if it validates in next. That still depends on the merge order in 
the merge window but -rc1 should be fine.

I'll consider devicetree validation as eventually valid from now on and 
not care too much about it.

Janne
