Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BD76FDC
	for <asahi@lists.linux.dev>; Mon, 27 Feb 2023 15:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 074B5C4339C;
	Mon, 27 Feb 2023 15:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677510035;
	bh=aGqo+beX4rpf9C772G4rfI3PDzyyWU40qI/tZHMx4Ec=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=N6gG8tXrOotmZtHYGZOFW82yXA0CP7fXiPBkZJLeJ9epC+6R3ku5FXR2K2uSrDeU/
	 BTfmo7cpA2VoWJX1mzhAKgPigic2O2cA5HBmnmOoOUsSM6+GbEwt3GgMdDyzno+vSk
	 olIGKotwFdm4MdL0MCE2XJIrvd9x7GdUQXIVnp56ovu8y+nAf5VIAE+Oym+tjWD/dA
	 rLrQf6qV5c55YoxDmznT9bIUJp2pAfBrnc85E6sL8DYP+WaFa8+a7wsEp1n1rNlGO0
	 3Az1YA5wznPw3spCWTsfrYAsK2iUr/eVBaiBaL6G5OGgka/jXSmwz1FBFAg/2WWkdp
	 KFr/mhTLVEPvA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [01/10] wifi: brcmfmac: chip: Only disable D11 cores;
 handle an arbitrary number
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230214092423.15175-1-marcan@marcan.st>
References: <20230214092423.15175-1-marcan@marcan.st>
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
 linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>,
 Arend van Spriel <arend.vanspriel@broadcom.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167751002773.20016.17380164269465295465.kvalo@kernel.org>
Date: Mon, 27 Feb 2023 15:00:31 +0000 (UTC)

Hector Martin <marcan@marcan.st> wrote:

> At least on BCM4387, the D11 cores are held in reset on cold startup and
> firmware expects to release reset itself. Just assert reset here and let
> firmware deassert it. Premature deassertion results in the firmware
> failing to initialize properly some of the time, with strange AXI bus
> errors.
> 
> Also, BCM4387 has 3 cores, up from 2. The logic for handling that is in
> brcmf_chip_ai_resetcore(), but since we aren't using that any more, just
> handle it here.
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> Signed-off-by: Hector Martin <marcan@marcan.st>

10 patches applied to wireless-next.git, thanks.

3c7c07ca7ab1 wifi: brcmfmac: chip: Only disable D11 cores; handle an arbitrary number
098e0b105ce1 wifi: brcmfmac: chip: Handle 1024-unit sizes for TCM blocks
398ce273d6b1 wifi: brcmfmac: cfg80211: Add support for scan params v2
d75ef1f81e42 wifi: brcmfmac: feature: Add support for setting feats based on WLC version
a96202acaea4 wifi: brcmfmac: cfg80211: Add support for PMKID_V3 operations
89b89e52153f wifi: brcmfmac: cfg80211: Pass the PMK in binary instead of hex
117ace4014cc wifi: brcmfmac: pcie: Add IDs/properties for BCM4387
dd7e55401fec wifi: brcmfmac: common: Add support for downloading TxCap blobs
75102b7543ed wifi: brcmfmac: pcie: Load and provide TxCap blobs
5b3ee9987f58 wifi: brcmfmac: common: Add support for external calibration blobs

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230214092423.15175-1-marcan@marcan.st/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

