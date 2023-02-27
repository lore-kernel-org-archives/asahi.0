Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780EBA34
	for <asahi@lists.linux.dev>; Mon, 27 Feb 2023 10:41:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64E9EC433D2;
	Mon, 27 Feb 2023 10:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677494511;
	bh=fqFYfDSyI09CKubLgEnSqmlaeFQFyaCajSXo34qA4mk=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=m1vx/6CLkn6REKzEJC2/1LPmJdb5rkClliVA7VugXf5YC4Q/ORYI3moD6xFmWxY1n
	 elwLxuu8gYrupt+uWdrjXdQXHHdTcw19pRdAdtcrXp0SY03d1CFv17j4A0lDpigbvN
	 Dy1QqemzlPIDPklHGpp+iQuk447/9eNmtehIbHnU8IGjIa0gdJ51+NaxycoAZTmWlE
	 Bkzst+TNFZ3mxz8tHhzdwcnhZb7Lj4dYgbfxuOhe887EQAK0ydiy+ym2/yQ7ZPa/JI
	 samCxAKFclJTN09ou0psQicGs+v2DOJoWzr2Rya+o/KKWKgp0jHQJnGiZl5UmSRQ6y
	 C10xMRROkggPw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [1/2] wifi: brcmfmac: acpi: Add support for fetching Apple ACPI
 properties
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230214080034.3828-2-marcan@marcan.st>
References: <20230214080034.3828-2-marcan@marcan.st>
To: Hector Martin <marcan@marcan.st>
Cc: Arend van Spriel <aspriel@gmail.com>,
 Franky Lin <franky.lin@broadcom.com>,
 Hante Meuleman <hante.meuleman@broadcom.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Linus Walleij <linus.walleij@linaro.org>, asahi@lists.linux.dev,
 linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
 SHA-cyfmac-dev-list@infineon.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167749450230.25422.12402282199427388164.kvalo@kernel.org>
Date: Mon, 27 Feb 2023 10:41:47 +0000 (UTC)

Hector Martin <marcan@marcan.st> wrote:

> On DT platforms, the module-instance and antenna-sku-info properties
> are passed in the DT. On ACPI platforms, module-instance is passed via
> the analogous Apple device property mechanism, while the antenna SKU
> info is instead obtained via an ACPI method that grabs it from
> non-volatile storage.
> 
> Add support for this, to allow proper firmware selection on Apple
> platforms.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Reviewed-by: Julian Calaby <julian.calaby@gmail.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

2 patches applied to wireless-next.git, thanks.

0f485805d008 wifi: brcmfmac: acpi: Add support for fetching Apple ACPI properties
91918ce88d9f wifi: brcmfmac: pcie: Provide a buffer of random bytes to the device

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230214080034.3828-2-marcan@marcan.st/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

