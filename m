Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193483C26
	for <asahi@lists.linux.dev>; Thu, 22 Sep 2022 13:44:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id A3350425BE;
	Thu, 22 Sep 2022 13:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1663854274; bh=ZjgbMoWn7oYVqCiV35xhfgHZ/kJ0mzZefvAN1VyX0/8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=P9eaAKkcJVrdhQWTGDXEx5YbeRf66HZc/RPQllLitBBsSU1Rki4HaEFV1H7IKrEdQ
	 HrkTOCKz6KjRqWSW0L0Pew7TqnVtXsuh2Y3XZ3qMV12hinRH4MFO/TFVrkjzumCyrb
	 iZJ/602jfHe9PDalr4XnThHYw5EBLHvJSb33P3Z1o6FAQVBm0gV+i/5nOmTEx9cSdx
	 RifSWApM4p1ME4UIm4jKbEcqiZy9IN1+JaKz32iIMJEKQXm67Dh2hcYtSZ7xMJQoNo
	 AUp3DnX/5LlZttIXsiaY83AYgfXZKxtnto+57FXDGj/qcqzL6DWJ/su8/CCJYtrNBu
	 cBWNy4RWz7TSg==
Message-ID: <de3166f2-c851-ded5-d83a-f1b5f886da3a@marcan.st>
Date: Thu, 22 Sep 2022 22:44:28 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 0/4] Apple ADMAC peripheral reset clean-up
Content-Language: es-ES
To: =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>,
 Sven Peter <sven@svenpeter.dev>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220918095845.68860-1-povik+lin@cutebit.org>
From: Hector Martin <marcan@marcan.st>
In-Reply-To: <20220918095845.68860-1-povik+lin@cutebit.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/09/2022 18.58, Martin Povišer wrote:
> On Apple SoCs the ADMAC peripheral shares a reset line with another
> audio-related peripheral which is the MCA.
> 
> On the side of the MCA, the reset is described in binding (staged in
> broonie-sound/for-6.1) and in the soon-to-be-merged series adding new
> nodes to t8103/t600x SoC device trees [1]. The staged MCA driver does
> make use of the reset, knowing it's a shared one.
> 
> This series catches up on the ADMAC side, adds the reset to the binding
> and describes it in the t8103/t600x DTs (on top of [1]). It also pulls
> the shared reset from the driver.
> 
> Since [1] already includes another ADMAC binding change and will
> probably be fully merged into Hector's asahi-soc tree, I propose the
> binding change here takes the same route. Leaving patches #3 and #4 to
> go into dmaengine.
> 
> [1] https://lore.kernel.org/asahi/87pmful5r4.wl-maz@kernel.org/T/#t
> 
> Martin Povišer (4):
>   dt-bindings: dma: apple,admac: Add reset
>   arm64: dts: apple: Add ADMAC resets on t8103/t600x
>   dmaengine: apple-admac: Do not use devres for IRQs
>   dmaengine: apple-admac: Trigger shared reset
> 

Applied patches #1-#2 to asahi-soc/dt, thanks!

- Hector
