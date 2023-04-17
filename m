Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5401848
	for <asahi@lists.linux.dev>; Mon, 17 Apr 2023 05:21:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1B89C433D2;
	Mon, 17 Apr 2023 05:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681708906;
	bh=jiGbgFYo45rHlUklkyRi1i+LiExpFhzQE1G1wquv1eo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=vCFGFQls0h5iCAa6IGkKsU7GUAgtM4MrmUdSYXLO6V5VM2GXZx2V9933wlJ24+uUz
	 3dMTO/QObZchE++xEbxtOKEpebM/expOoHFq753wdzcVWsKKs2A5KuBlpUUWbvutgA
	 dlcq7YRR7cMGgcDHv2jqE+2zAC1j1oaybi1K+sFJ9OqR7jTpsOHhajpPg3W4HuwDvx
	 3qRl1m5RZVYGJqsJTTGhzGPqfIlXhIFpxWfGiGTs2vFzj4/HGEGqnLQbXKuVe0h7Zv
	 +9nizZwc4k/tJE2GMrgIsxwJdRonRZheEnOM2DtBetVFTqQhDeQb/TohNGi6MQUdis
	 +lCfbjYWx1R9g==
From: Kalle Valo <kvalo@kernel.org>
To: Hector Martin <marcan@marcan.st>
Cc: Arend van Spriel <aspriel@gmail.com>,  Franky Lin <franky.lin@broadcom.com>,  Hante Meuleman <hante.meuleman@broadcom.com>,  "David S. Miller" <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  "John W. Linville" <linville@tuxdriver.com>,  linux-wireless@vger.kernel.org,  brcm80211-dev-list.pdl@broadcom.com,  SHA-cyfmac-dev-list@infineon.com,  netdev@vger.kernel.org,  linux-kernel@vger.kernel.org,  asahi@lists.linux.dev
Subject: Re: [PATCH 2/2] wifi: brcmfmac: Demote p2p unknown frame error to info (once)
References: <20230416-brcmfmac-noise-v1-0-f0624e408761@marcan.st>
	<20230416-brcmfmac-noise-v1-2-f0624e408761@marcan.st>
Date: Mon, 17 Apr 2023 08:21:41 +0300
In-Reply-To: <20230416-brcmfmac-noise-v1-2-f0624e408761@marcan.st> (Hector
	Martin's message of "Sun, 16 Apr 2023 21:42:18 +0900")
Message-ID: <871qkjxevu.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Hector Martin <marcan@marcan.st> writes:

> This one is also spooking people when they see it in their boot console.
> It's not fatal, so it shouldn't really be a noisy error.
>
> Fixes: 18e2f61db3b7 ("brcmfmac: P2P action frame tx.")
> Signed-off-by: Hector Martin <marcan@marcan.st>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c
> index d4492d02e4ea..071b0706d137 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c
> @@ -1793,8 +1793,8 @@ bool brcmf_p2p_send_action_frame(struct brcmf_cfg80211_info *cfg,
>  		/* do not configure anything. it will be */
>  		/* sent with a default configuration     */
>  	} else {
> -		bphy_err(drvr, "Unknown Frame: category 0x%x, action 0x%x\n",
> -			 category, action);
> +		bphy_info_once(drvr, "Unknown Frame: category 0x%x, action 0x%x\n",
> +			       category, action);
>  		return false;
>  	}

What about changing this to a debug message so that it's not shown at
all in normal operation? I don't see what value this message gives to a
user.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
