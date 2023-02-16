Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD3379C8
	for <asahi@lists.linux.dev>; Thu, 16 Feb 2023 16:21:09 +0000 (UTC)
Received: by soltyk.jannau.net (Postfix, from userid 1000)
	id 1BCB726F7A9; Thu, 16 Feb 2023 17:21:07 +0100 (CET)
Date: Thu, 16 Feb 2023 17:21:07 +0100
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
Message-ID: <20230216162107.GJ17933@jannau.net>
References: <20230113102309.18308-1-marcan@marcan.st>
 <167362544665.163457.10878671229075890152.b4-ty@kernel.org>
 <20230214185234.uj63aovylzixs6xa@kazuki-mac>
 <20230216090411.GH17933@jannau.net>
 <Y+5SCAj4Vk8NLrW9@sirena.org.uk>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+5SCAj4Vk8NLrW9@sirena.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)

On 2023-02-16 15:55:52 +0000, Mark Brown wrote:
> On Thu, Feb 16, 2023 at 10:04:11AM +0100, Janne Grunau wrote:
> 
> > can we still get "spi: Use a 32-bit DT property for 
> > spi-cs-setup-delay-ns" into 6.2?
> 
> I think I sent a pull request for this already.

I see today's "[GIT PULL] SPI updates for v6.2-rc8-abi"
https://lore.kernel.org/lkml/20230216131125.4A6FAC433D2@smtp.kernel.org/ 

but it was neither in "SPI fixes for v6.2-rc3" or "SPI fixes for 
v6.2-rc7" or in Linus' tree as of today.

I think something went wrong with "[GIT PULL] SPI updates for 
v6.2-rc8-abi". The message reads is if you intended to just send
"spi: Use a 32-bit DT property for spi-cs-setup-delay-ns" and not 62 
commits.

Janne
