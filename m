Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9736EA32
	for <asahi@lists.linux.dev>; Tue, 21 Jun 2022 05:53:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 64A0D41A42;
	Tue, 21 Jun 2022 05:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1655790439; bh=ijFdzRKGTtoK1EVyxIS8irIozCEEUXj0UcZnJdewx9o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=q1Y5wLaoxNsvyVxoe1tMqYu3F2C3TZU1t83aZmhfMJKOJpopgE/2q5lzAPty2tvDw
	 6Z7C6s0YGAZnEbPM1BmgwIVF/AvqFrYgebhKpqDmT6FmZuOR6GxwrvWyyi9/9BS81n
	 tOoLJScys6Nu2niNI5TERljSVQldBkk4+PINFEpQ34EZNqhosbAPy/6YrzLrWWGoDI
	 7jw1dux7hSAR2p5lwij4IAkQVa4u/sJVoFoY2CNA181BaXUriBLwi3kFwDE+TErbNG
	 tPr2+6aFxko7u8wixxz9YoYVH4bvtJE4HRIWPb3O620lQ9YYjMKXzxfrS0TjHQKpTW
	 r5pkDpBUyPJqQ==
Message-ID: <703c04df-9b61-0aca-9b2c-41f5a293e828@marcan.st>
Date: Tue, 21 Jun 2022 14:47:15 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] MAINTAINERS: add ARM/APPLE MACHINE mailing list
Content-Language: es-ES
To: Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: linux-arm-kernel@lists.infradead.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220602173144.2263-1-sven@svenpeter.dev>
From: Hector Martin <marcan@marcan.st>
In-Reply-To: <20220602173144.2263-1-sven@svenpeter.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/06/2022 02.31, Sven Peter wrote:
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 55114e73de26..621eeb037a91 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1826,6 +1826,7 @@ ARM/APPLE MACHINE SUPPORT
>  M:	Hector Martin <marcan@marcan.st>
>  M:	Sven Peter <sven@svenpeter.dev>
>  R:	Alyssa Rosenzweig <alyssa@rosenzweig.io>
> +L:	asahi@lists.linux.dev
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  W:	https://asahilinux.org

Applied to asahi-soc/maintainers. Thanks!

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
