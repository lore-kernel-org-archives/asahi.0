Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB18C2D3
	for <asahi@lists.linux.dev>; Mon, 17 Apr 2023 05:20:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CA2BC433EF;
	Mon, 17 Apr 2023 05:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681708822;
	bh=utLr9q/tilmsgA9ydZ94KoWcI92v9Hk3brelgERnjDA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=OqW6EGeeliksOWrGP/mACTVCzNkC2C5WnbNBzPTY11QxJJvZmDsaRCJKoIObAYJCL
	 5qs1ElkMGrANTlHcnf+KO2dpmfWYZxqt3gzMmKaQlR90WNi8aXqGT6MlUAJx04dUeO
	 UUKLDzcW0JgYUwuWK13JXYdkJWP2iUOifMcOWuln1LSMqUw4oSFp4OChSp7tMvT3uA
	 Cc3THhncqYVQECPUSRvN1tqcOBBsGEeR7gN3HRmbMSBdiI4Y25Xb1g636prmcuVa1G
	 C8K7KEfEeYQdUtfntwZwXvOUZMjpSvtazlLtGbLA3NWk/Kqwz4TeOluNwblVkirOwl
	 wFyjeUYa3PjCQ==
From: Kalle Valo <kvalo@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Hector Martin <marcan@marcan.st>,  Arend van Spriel <aspriel@gmail.com>,  Franky Lin <franky.lin@broadcom.com>,  Hante Meuleman <hante.meuleman@broadcom.com>,  "David S. Miller" <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  "John W. Linville" <linville@tuxdriver.com>,  linux-wireless@vger.kernel.org,  brcm80211-dev-list.pdl@broadcom.com,  SHA-cyfmac-dev-list@infineon.com,  netdev@vger.kernel.org,  linux-kernel@vger.kernel.org,  asahi@lists.linux.dev,  stable@vger.kernel.org
Subject: Re: [PATCH 1/2] wifi: brcmfmac: Demote vendor-specific attach/detach messages to info
References: <20230416-brcmfmac-noise-v1-0-f0624e408761@marcan.st>
	<20230416-brcmfmac-noise-v1-1-f0624e408761@marcan.st>
	<2023041631-crying-contour-5e11@gregkh>
Date: Mon, 17 Apr 2023 08:20:14 +0300
In-Reply-To: <2023041631-crying-contour-5e11@gregkh> (Greg KH's message of
	"Sun, 16 Apr 2023 14:46:48 +0200")
Message-ID: <875y9vxey9.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Greg KH <gregkh@linuxfoundation.org> writes:

> On Sun, Apr 16, 2023 at 09:42:17PM +0900, Hector Martin wrote:
>
>> People are getting spooked by brcmfmac errors on their boot console.
>> There's no reason for these messages to be errors.
>> 
>> Cc: stable@vger.kernel.org
>> Fixes: d6a5c562214f ("wifi: brcmfmac: add support for vendor-specific firmware api")
>> Signed-off-by: Hector Martin <marcan@marcan.st>
>> ---
>>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/bca/core.c | 4 ++--
>>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c | 4 ++--
>>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/wcc/core.c | 4 ++--
>>  3 files changed, 6 insertions(+), 6 deletions(-)
>> 
>> diff --git
>> a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bca/core.c
>> b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bca/core.c
>> index ac3a36fa3640..c83bc435b257 100644
>> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bca/core.c
>> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bca/core.c
>> @@ -12,13 +12,13 @@
>>  
>>  static int brcmf_bca_attach(struct brcmf_pub *drvr)
>>  {
>> -	pr_err("%s: executing\n", __func__);
>> +	pr_info("%s: executing\n", __func__);
>
> Why are these here at all?  Please just remove these entirely, you can
> get this information normally with ftrace.
>
> Or, just delete these functions, why have empty ones at all?

Yeah, deleting these sound like the best idea.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
