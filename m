Received: from rosenzweig.io (rosenzweig.io [138.197.143.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BFA29B4
	for <asahi@lists.linux.dev>; Thu,  2 Jun 2022 17:53:53 +0000 (UTC)
Received: by rosenzweig.io (Postfix, from userid 1000)
	id A0CEB4000C; Thu,  2 Jun 2022 17:44:34 +0000 (UTC)
Date: Thu, 2 Jun 2022 17:44:34 +0000
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Sven Peter <sven@svenpeter.dev>
Cc: Hector Martin <marcan@marcan.st>, linux-arm-kernel@lists.infradead.org,
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add ARM/APPLE MACHINE mailing list
Message-ID: <Ypj3Aps1e5h2qTHx@rosenzweig.io>
References: <20220602173144.2263-1-sven@svenpeter.dev>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220602173144.2263-1-sven@svenpeter.dev>

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

On Thu, Jun 02, 2022 at 07:31:44PM +0200, Sven Peter wrote:
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
> -- 
> 2.25.1
> 
