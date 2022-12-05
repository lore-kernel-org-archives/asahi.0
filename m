Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A0A7C
	for <asahi@lists.linux.dev>; Mon,  5 Dec 2022 07:23:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id DD0664260B;
	Mon,  5 Dec 2022 07:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1670224994; bh=h+UiLRi0HrBaW4Acn5ZL5HH6vRNTHq7sTp7ruAUzaT8=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=mg2aAuXG2q2GH7gmakmzyQOF6333uTCXpEbaNEDvwM5MKwjQBhOjXy6G6y6W2C/V6
	 Mx9QRH4x1YmKFPmtEwDRPV4dRGlrb+5NiXspxWKd1VAubbVtHi2l2whowDDdebooUA
	 IFewudJFv0t2taoZGEnpLkhWgxKtaP3WgQJzN+ekJMQLAtvj3mj8yMsEzlYGbWDAHs
	 2J4hn80tzAXg89RSo0TnYAPFy0bDPmR+ysou/cw8i+TTXlZdKC7+i5ht4yIaP93AVA
	 MZOdeKioK243y1ca7qI5Qv69zfCCWb5PUXnRdK1IWz/ILbqFdlEB3wuDBif8m2h72f
	 6A3THIRMvl7lg==
Message-ID: <975cdec2-3b0b-0557-5040-b483638c4007@marcan.st>
Date: Mon, 5 Dec 2022 16:23:07 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v15 9/9] irqchip/apple-aic: Move over to core ipi-mux
Content-Language: en-US
From: Hector Martin <marcan@marcan.st>
To: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>, Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel
 <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev
References: <20221203064629.1601299-1-apatel@ventanamicro.com>
 <20221203064629.1601299-10-apatel@ventanamicro.com>
 <18abbb1b-ec5e-11c6-ab16-b523f329064e@marcan.st>
In-Reply-To: <18abbb1b-ec5e-11c6-ab16-b523f329064e@marcan.st>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/12/2022 16.14, Hector Martin wrote:
> On 03/12/2022 15.46, Anup Patel wrote:
>> From: Marc Zyngier <maz@kernel.org>
<snip>
> 
> Reviewed-by: Hector Martin <marcan@marcan.st>
> Tested-by: Hector Martin <marcan@marcan.st>
> 
> Smoke tested on t8112, nothing exploded :)
> 
> - Hector

Come to think of it, rather than r-b, that (and #3) ought to be:

Acked-by: Hector Martin <marcan@marcan.st>

- Hector
