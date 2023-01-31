Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C658328E1
	for <asahi@lists.linux.dev>; Tue, 31 Jan 2023 11:42:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 5698D4206F;
	Tue, 31 Jan 2023 11:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1675165319; bh=uq9LY9uR6foVE86obMoxIVidZl7bs4lY4rwBIR/pMW0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=rolfF9x4y5Rn01Fbi/fc8KXhD2rNdKDOVXYWwTLC3ZCXL7cd+HVx6R4BpqaSy+vkA
	 pDm3R0WkSVLJ2+e39YFuiGrMngRY2jHG97hEEmZw7YHFM7uyjvjlcqxg4N10i84LYE
	 JApM5wQITZe90Gz9P/JrG+bMpWgJUIzaej07ilU44z2efnsS+lCapQN2uwK+FFbQso
	 P5CVkOflOiIQV/agXKHUubPfl93AvS6su8GCHDqKmTmoh+B4BsNsDCQmLqVFlM2Rwe
	 t16OhFR5DVqhRx2CDeZYA45fCDYxrHvsfhXLiOw1+yT87gQOH/AbYIg0qnVDv907+r
	 mgSEvStmacJiQ==
Message-ID: <714b8b17-4936-08c9-767f-fb6292a39f72@marcan.st>
Date: Tue, 31 Jan 2023 20:41:56 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] soc: apple: rtkit: Add a private pointer to
 apple_rtkit_shmem
Content-Language: en-US
To: Asahi Lina <lina@asahilina.net>, Sven Peter <sven@svenpeter.dev>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230121074253.9774-1-lina@asahilina.net>
From: Hector Martin <marcan@marcan.st>
In-Reply-To: <20230121074253.9774-1-lina@asahilina.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/01/2023 16.42, Asahi Lina wrote:
> This allows downstream consumers to keep track of private data for shmem
> mappings. In particular, the Rust abstraction will use this to safely
> drop data associated with a mapping when it is unmapped.
> 
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---
>  include/linux/soc/apple/rtkit.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/soc/apple/rtkit.h b/include/linux/soc/apple/rtkit.h
> index 62bfa37b5adb..1a9888a1797a 100644
> --- a/include/linux/soc/apple/rtkit.h
> +++ b/include/linux/soc/apple/rtkit.h
> @@ -22,6 +22,7 @@
>   * @size:      Size of the shared memory buffer.
>   * @iova:      Device VA of shared memory buffer.
>   * @is_mapped: Shared memory buffer is managed by the co-processor.
> + * @private:   Private data pointer for the parent driver.
>   */
>  
>  struct apple_rtkit_shmem {
> @@ -30,6 +31,7 @@ struct apple_rtkit_shmem {
>  	size_t size;
>  	dma_addr_t iova;
>  	bool is_mapped;
> +	void *private;
>  };
>  
>  /*

Thanks, applied to asahi-soc/soc!

- Hector
