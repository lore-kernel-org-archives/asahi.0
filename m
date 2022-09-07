Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE517E
	for <asahi@lists.linux.dev>; Wed,  7 Sep 2022 08:14:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B66FFC43470;
	Wed,  7 Sep 2022 08:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662538476;
	bh=nCjrwhu4Hv0/rkKfoQw5UBPI3nCcw75wcbv6WTgbygo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=L8risvptovTerFqCZSvFpVhLBSrmTkOVbSDtxBOfe4pG3kVUUrFwGzGV6F5TbEg24
	 PFa+a8o645k0IN54/8Lb3o60UQ2dvJh8jyBf4tk3rVLWCfZNsGqNhv1z01LK6FSJFK
	 TKDdOcEfbTQHd116b8shu1lBjEul/xzrsPOxV6ioSYo09aFgSdN4ow/pWtfcPFkwDN
	 e+ods9s8dg0JgWfhL8pBFNepXb/KiQlDTujBRfdN7i3cDw91PgNyz6geJn+nrCKeEm
	 zFvjY9JtdKprfYY8mVzQ5MriSZRRvpoGO7uoQdOdUTU9PCBtp7a663lZNEzcVBHK5l
	 xaQEgXdIaCt/Q==
From: Kalle Valo <kvalo@kernel.org>
To: "Russell King \(Oracle\)" <linux@armlinux.org.uk>
Cc: Arend van Spriel <aspriel@gmail.com>,  Franky Lin
 <franky.lin@broadcom.com>,  Hante Meuleman <hante.meuleman@broadcom.com>,
  Alyssa Rosenzweig <alyssa@rosenzweig.io>,  asahi@lists.linux.dev,
  brcm80211-dev-list.pdl@broadcom.com,  "David S. Miller"
 <davem@davemloft.net>,  devicetree@vger.kernel.org,  Eric Dumazet
 <edumazet@google.com>,  Hector Martin <marcan@marcan.st>,  Jakub Kicinski
 <kuba@kernel.org>,  Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
  linux-arm-kernel@lists.infradead.org,  linux-wireless@vger.kernel.org,
  netdev@vger.kernel.org,  Paolo Abeni <pabeni@redhat.com>,  =?utf-8?Q?Raf?=
 =?utf-8?Q?a=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,  Rob Herring
 <robh+dt@kernel.org>,  SHA-cyfmac-dev-list@infineon.com,  Sven Peter
 <sven@svenpeter.dev>,  van Spriel <arend@broadcom.com>
Subject: Re: [PATCH net-next 0/12] Add support for bcm4378 on Apple platforms
References: <YxhMaYOfnM+7FG+W@shell.armlinux.org.uk>
Date: Wed, 07 Sep 2022 11:14:28 +0300
In-Reply-To: <YxhMaYOfnM+7FG+W@shell.armlinux.org.uk> (Russell King's message
	of "Wed, 7 Sep 2022 08:46:49 +0100")
Message-ID: <874jxja9ej.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

"Russell King (Oracle)" <linux@armlinux.org.uk> writes:

> This series adds support for bcm4378 found on Apple platforms, and has
> been tested on the Apple Mac Mini. It is a re-posting of a subset of
> Hector's previous 38 patch series, and it is believed that the comments
> from that review were addressed.
>
> (I'm just the middle man; please don't complain if something has been
> missed.)

Thanks for sending the subset, this is much more manageable. Arend,
please take a look. It would be nice to get this to v6.1.

BTW brcmfmac patches go via wireless-next, not net-next, but no need to
resend because of this.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
