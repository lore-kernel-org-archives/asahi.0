Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F8E7B
	for <asahi@lists.linux.dev>; Thu, 16 Feb 2023 09:04:15 +0000 (UTC)
Received: by soltyk.jannau.net (Postfix, from userid 1000)
	id 295AE26F7A6; Thu, 16 Feb 2023 10:04:11 +0100 (CET)
Date: Thu, 16 Feb 2023 10:04:11 +0100
From: Janne Grunau <j@jannau.net>
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>,
	Kazuki <kazukih0205@gmail.com>
Subject: Re: [PATCH v2 0/3] SPI core CS delay fixes and additions
Message-ID: <20230216090411.GH17933@jannau.net>
References: <20230113102309.18308-1-marcan@marcan.st>
 <167362544665.163457.10878671229075890152.b4-ty@kernel.org>
 <20230214185234.uj63aovylzixs6xa@kazuki-mac>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214185234.uj63aovylzixs6xa@kazuki-mac>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hej Mark,

On 2023-02-15 03:52:34 +0900, Kazuki wrote:
> On Fri, Jan 13, 2023 at 03:57:26PM +0000, Mark Brown wrote:
> > On Fri, 13 Jan 2023 19:23:07 +0900, Hector Martin wrote:
> > > Commits f6c911f3308c ("spi: dt-bindings: Introduce
> > > spi-cs-setup-ns property") and 33a2fde5f77b ("spi: Introduce
> > > spi-cs-setup-ns property") introduced a new property to represent the
> > > CS setup delay in the device tree, but they have some issues:
> > > 
> > > - The property is only parsed as a 16-bit integer number of nanoseconds,
> > >   which limits the maximum value to ~65us. This is not a reasonable
> > >   upper limit, as some devices might need a lot more.
> > > - The property name is inconsistent with other delay properties, which
> > >   use a "*-delay-ns" naming scheme.
> > > - Only the setup delay is introduced, but not the related hold and
> > >   inactive delay times.
> > > 
> > > [...]
> > 
> > Applied to
> > 
> >    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
> > 
> > Thanks!
> > 
> > [1/3] spi: Use a 32-bit DT property for spi-cs-setup-delay-ns
> >       commit: f276aacf5d2f7fb57e400db44c807ea3b9525fd6
> 
> Shouldn't this be sent to 6.2 before the property becomes a stable ABI?

can we still get "spi: Use a 32-bit DT property for 
spi-cs-setup-delay-ns" into 6.2?

If not I can send a single line patch which switches 
of_property_read_u16() to of_property_read_u32() to avoid defining 
"spi-cs-setup-delay-ns" to u16 as stable devicetree ABI.

sorry this comes so late before 6.2, we missed to track the patches.

Thanks,
Janne
