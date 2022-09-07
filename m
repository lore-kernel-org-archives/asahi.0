Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711BD7E
	for <asahi@lists.linux.dev>; Wed,  7 Sep 2022 08:16:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF2F6C433C1;
	Wed,  7 Sep 2022 08:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662538589;
	bh=WPz0hEmaLRR2o9iEaOapRahUqEImeqvU61J+OmlJNQg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=hGMFQ5sK0ZM6kVlEbtpKlKvnd5C/qv883+l+bqrVBQKuZMguKcl38KYIoAFomUGQB
	 3uAuVhecjkwmqnUmftQivDethtqrAsw0kd31TRJj1CCPqFh0cvJeZhBIbQZX4TCakS
	 ZwhMfJPXUMRaOUKBKbfXja6r0LBT1L0uE0D4aDEPmlVoBm/Jtax1wb64voxixJYVLk
	 PSm1HfF6giQxyvomAUDMw7YlWihj3leTtIosDpSpEkbd8aXUxsLau4Bbm707vennRs
	 0yZuvRKlfOtjTnv9jlSPsjdXk4WxzAnbKffXKu240SeoAWHdv8c3R5ZNCieQfLunZI
	 +YU4cZhUnldHQ==
From: Kalle Valo <kvalo@kernel.org>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: Arend van Spriel <aspriel@gmail.com>,  Franky Lin <franky.lin@broadcom.com>,  Hante Meuleman <hante.meuleman@broadcom.com>,  Alyssa Rosenzweig <alyssa@rosenzweig.io>,  asahi@lists.linux.dev,  brcm80211-dev-list.pdl@broadcom.com,  "David S. Miller" <davem@davemloft.net>,  devicetree@vger.kernel.org,  Eric Dumazet <edumazet@google.com>,  Hector Martin <marcan@marcan.st>,  Jakub Kicinski <kuba@kernel.org>,  Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,  linux-arm-kernel@lists.infradead.org,  linux-wireless@vger.kernel.org,  netdev@vger.kernel.org,  Paolo Abeni <pabeni@redhat.com>,  "Rafa__ Mi__ecki" <zajec5@gmail.com>,  Rob Herring <robh+dt@kernel.org>,  SHA-cyfmac-dev-list@infineon.com,  Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH net-next 12/12] arm64: dts: apple: Add WiFi module and antenna properties
References: <YxhMaYOfnM+7FG+W@shell.armlinux.org.uk>
	<E1oVpne-005LCR-RJ@rmk-PC.armlinux.org.uk>
Date: Wed, 07 Sep 2022 11:16:22 +0300
In-Reply-To: <E1oVpne-005LCR-RJ@rmk-PC.armlinux.org.uk> (Russell King's
	message of "Wed, 07 Sep 2022 08:48:42 +0100")
Message-ID: <87zgfb8uqx.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Russell King (Oracle) <rmk+kernel@armlinux.org.uk> writes:

> From: Hector Martin <marcan@marcan.st>
>
> Add the new module-instance/antenna-sku properties required to select
> WiFi firmwares properly to all board device trees.
>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  arch/arm64/boot/dts/apple/t8103-j274.dts  | 4 ++++
>  arch/arm64/boot/dts/apple/t8103-j293.dts  | 4 ++++
>  arch/arm64/boot/dts/apple/t8103-j313.dts  | 4 ++++
>  arch/arm64/boot/dts/apple/t8103-j456.dts  | 4 ++++
>  arch/arm64/boot/dts/apple/t8103-j457.dts  | 4 ++++
>  arch/arm64/boot/dts/apple/t8103-jxxx.dtsi | 2 ++
>  6 files changed, 22 insertions(+)

Is it ok to take this via wireless-next? Can I get an ack from the
maintainers of these files?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
