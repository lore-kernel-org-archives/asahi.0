Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D262A28E1
	for <asahi@lists.linux.dev>; Tue, 31 Jan 2023 11:41:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 928434206F;
	Tue, 31 Jan 2023 11:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1675165296; bh=E02jK0HlPkJh0tyYFV8UsqvgBIJZaTRiVPCBOL462vo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=dUt2YIRKEw1+TG9Jv2dQng0H9MMnJM9zEg0H/cTfORprdblyj0pqn0YfvM+hvKKHi
	 vLD7pykyehWi/5rlGkk5IJq6P2VN18mTTiJltHbzxCUyPfv0OKpFxc8Ynv6Yi9Dujg
	 EuFhswdBieNSnczEn+LKgKxwObOLcsiRA3wkVVgRl+Rmi88V7UTLD/+n5PjhnH7bhd
	 yiuPBqkFOi6eH/R/LdlR/49yUMnzWv74eYtIGOsVVUbpNSevCcYB8M2GeJ9k9yXZAM
	 bljzfvesJLaDPjNRYQ8PshlS+ZqnhEu4K8yFpLoQJTzC07aE0/nC2udkt5dtUTStNZ
	 nL6QWRgg8hDzg==
Message-ID: <3b6e9efc-d415-bfa1-ff0c-3d20dd1dae3a@marcan.st>
Date: Tue, 31 Jan 2023 20:41:32 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] soc: apple: apple-pmgr-pwrstate: Switch to IRQ-safe mode
Content-Language: en-US
To: Sven Peter <sven@svenpeter.dev>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230123065125.26350-1-marcan@marcan.st>
From: Hector Martin <marcan@marcan.st>
In-Reply-To: <20230123065125.26350-1-marcan@marcan.st>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/01/2023 15.51, Hector Martin wrote:
> This requires changing the reset path locking primitives to the spinlock
> path in genpd, instead of the mutex path.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> ---
>  drivers/soc/apple/apple-pmgr-pwrstate.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 

Thanks for the reviews, applied to asahi-soc/soc!

- Hector
