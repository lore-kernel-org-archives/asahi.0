Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66979746B
	for <asahi@lists.linux.dev>; Mon, 27 Feb 2023 15:13:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DB35C433D2;
	Mon, 27 Feb 2023 15:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677510789;
	bh=BjWkrs/gmj0cFLL9MNDb8Zu8rH+c69H6MGykaCOCffE=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=fo22Bgv5GraLLN95eClok53Gcu6rbZ8mRfKy9JRuZuN3SKAniU804B9JS33SZCvkj
	 NoR8rSD4XVpYGQSqrPLFevxgd3SyPoCdmQf0SOwnDdGewCsR+v443MItLLX4hlg8un
	 o3BZOmYeCdP5xJa1dy3x2cfmfgFTiPmxonx3x9xSXmFQyZ4NY6teKd0F+rx0PP97ol
	 4jgHT0cLpYwBA9O2GOpqCOEiAfTNiad3UVqtrCNIocBVbd/gRNSOdj+lEZaY3TxbZc
	 v46G39S2bbVwolfLDT9kPAjoaYWVeEYllUHlyt/zjjedizsI0lbfEuc2A96X29ic/1
	 nyd/ua33MU+ig==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: wifi: brcmfmac: pcie: Add BCM4378B3 support
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230214092838.17869-1-marcan@marcan.st>
References: <20230214092838.17869-1-marcan@marcan.st>
To: Hector Martin <marcan@marcan.st>
Cc: Arend van Spriel <aspriel@gmail.com>,
 Franky Lin <franky.lin@broadcom.com>,
 Hante Meuleman <hante.meuleman@broadcom.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Linus Walleij <linus.walleij@linaro.org>,
 Arend van Spriel <arend.vanspriel@broadcom.com>, asahi@lists.linux.dev,
 linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
 SHA-cyfmac-dev-list@infineon.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167751078017.20016.9919421224417148636.kvalo@kernel.org>
Date: Mon, 27 Feb 2023 15:13:05 +0000 (UTC)

Hector Martin <marcan@marcan.st> wrote:

> BCM4378B3 is a new silicon revision of BCM4378 present on the Apple M2
> 13" MacBook Pro "kyushu". Its PCI revision number is 5.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Reviewed-by: Julian Calaby <julian.calaby@gmail.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Patch applied to wireless-next.git, thanks.

1d5003d05f98 wifi: brcmfmac: pcie: Add BCM4378B3 support

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230214092838.17869-1-marcan@marcan.st/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

