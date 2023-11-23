Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977D621108
	for <asahi@lists.linux.dev>; Thu, 23 Nov 2023 10:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marcan.st
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marcan.st
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marcan.st header.i=@marcan.st header.b="f9vhNyIe"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 0EAB14245E;
	Thu, 23 Nov 2023 10:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1700734849; bh=TnIpe5+vYibOehFo39KJIQUXdlzRb5h5RBqVCFGk+Hg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=f9vhNyIeRFEF+Rjf46M9ZYxGk9Ln13zWMZnIx8lXeQlaIHQMETwK96em/GykOzW5+
	 LuLZNOnMcLh4uOsI3FSrGV3aGiz8dIZwjHWUUgq5u7HjNkiE1yU6pPngRsNOKvHozE
	 yjpNE2KP4qyFyQPlLzyJAcNV4hB9w3mdaN5Xbe/gXyKZe4b1hwiDrr4g+e+B/WlJtU
	 9wFlmMhxbG0uBeyDUAbUG7sAmGZIBUpq7D8Ff6ROqEF+npYU50Z/9Bc5T3BfQlfXbq
	 rXBwrCY6Fz8WabnFEYG2NMauWVsADpAwdGH7tSu6VztGqDf6a1/uP2hnRrc/Nr7FEF
	 6KDCcJ6A7yuwA==
Message-ID: <e8aef878-bd70-4dba-856c-61d9065ca327@marcan.st>
Date: Thu, 23 Nov 2023 19:20:43 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH] soc: apple: mailbox: Add explicit include of
 platform_device.h
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, soc@kernel.org,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20231030142620.818663-2-robh@kernel.org>
From: Hector Martin <marcan@marcan.st>
In-Reply-To: <20231030142620.818663-2-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2023/10/30 23:26, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other and pull in various other headers. In
> preparation to fix this, adjust the includes for what is actually needed.
> 
> platform_device.h is implicitly included by of_platform.h, but that's going
> to be removed.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Note this was added in the merge window and missed the last round.
> 
> Arnd, Can you apply this directly.

Just noticed this but I'm confused. I never sent Arnd the pull for this,
so it's not upstream nor on the way yet. I've applied it to
asahi-soc/mailbox though. Thanks for reminding me, I'll send the pull now :)

- Hector
