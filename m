Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E746828E1
	for <asahi@lists.linux.dev>; Tue, 31 Jan 2023 11:41:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 1A33F4206F;
	Tue, 31 Jan 2023 11:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1675165267; bh=NNGSgAFxYihFyg4mvYbp2zktoaPOKuPr/aNGn/QY44I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=GQ3bPOCO2475mTw1BGb5wB9ZlsNq+/vrGT9fccrdCcAeIXTAfzgfu76OxpHQg8BWm
	 JqHrXj6K+DDCQH1Z7qvNJ8R7H06E7Vg+GHSWRl/7UGvMdM675fXHkmM/yLAA7BzpZ6
	 D85rNyHYXo7wZAwcCUPdNjm4gI7qHu8SRP9XKUrJ1sPKQ0r32I+LpFZaKyIrMXoX9J
	 HSC7kKZBZL3DVyJF4jJdiUjsNqgte4YgKX56feEvIBxXLpENBjcpCoEq+fRCa3p6BI
	 S/AiILU3eZ7v/gDQ4PLMk6bO6WpVy81bgcBEP77b0OAUnbvVekNsXAjI/A8uUDfNv8
	 9ddW8UO7VC49Q==
Message-ID: <b9e8fc37-cb68-a768-a6d4-c03640b6bf50@marcan.st>
Date: Tue, 31 Jan 2023 20:41:03 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] soc: apple: rtkit: Add apple_rtkit_idle() function
Content-Language: en-US
To: Sven Peter <sven@svenpeter.dev>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230123065354.28179-1-marcan@marcan.st>
From: Hector Martin <marcan@marcan.st>
In-Reply-To: <20230123065354.28179-1-marcan@marcan.st>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/01/2023 15.53, Hector Martin wrote:
> This is yet another low power mode, used by DCP.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> ---
>  drivers/soc/apple/rtkit.c       | 21 +++++++++++++++++++++
>  include/linux/soc/apple/rtkit.h |  5 +++++
>  2 files changed, 26 insertions(+)
> 

Thanks for the reviews, applied to asahi-soc/soc!

- Hector
