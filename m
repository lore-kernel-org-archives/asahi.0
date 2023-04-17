Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524291C30
	for <asahi@lists.linux.dev>; Mon, 17 Apr 2023 09:19:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id AF5D342404;
	Mon, 17 Apr 2023 09:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1681723181; bh=frGGl/SueB8zDDanXT+8MSbrFf+w013HktHuXgfQFII=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=d3r/XQjjpRmnKOn6gqDZX6a0czfKALdekPl084QtoSGIIBxHkv7Apz6IBEByzgMBL
	 /i7fGBFIYxIKVwDJsJ4em8yOSTK7OggUc3x8iLYkUsK7fo+MGfhP1acpAt/3WB2p8K
	 PWgDUutpc1eLl+E77tUcDHMTsSsTnMk+Mvy0NhVICk7K0SJCskaKKctGWXyPB15PZN
	 sLifQPTLjQt+Wo0398gtpHBu+1L8kYhvAJ7X8dzwdpafJeuPle7Qix0Wb8g9vqvncA
	 qS9bQoLQnYaPddEGPLOkRRsFEYh0IMGcGRfi6ohaBpitJVrsoMDxNehECqAVBxOQvY
	 cmVxGbAF2lkng==
Message-ID: <3d1acabd-ac0a-d0f2-3dd7-62165549e9dc@marcan.st>
Date: Mon, 17 Apr 2023 18:19:34 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RESEND v9 0/5] PWM and keyboard backlight driver for ARM
 Macs
Content-Language: en-US
To: fnkl.kernel@gmail.com, Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 - <asahi@lists.linux.dev>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sasha Finkelstein <7d578vix8hzw@opayq.net>
References: <20230214-fpwm-v9-0-f3094107b16b@gmail.com>
From: Hector Martin <marcan@marcan.st>
In-Reply-To: <20230214-fpwm-v9-0-f3094107b16b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/04/2023 23.19, Sasha Finkelstein via B4 Relay wrote:
> Hi,
> 
> This is the v9 of the patch series to add PWM and keyboard
> backlight driver for ARM macs.
> 
> Changes in v1:
> Addressing the review comments.
> 
> Changes in v2:
> Added the reviewed-by and acked-by tags.
> Addressing a review comment.
> 
> Changes in v3 and v4:
> Addressing the review comments.
> 
> Changes in v5:
> Added t600x device tree changes
> 
> Changes in v8:
> Changed the overflow handling to clamp instead of erroring.
> 
> Changes in v9:
> Missed a spot where clamping should be applied. Fixed that.
> 
> v1: https://www.spinics.net/lists/linux-pwm/msg19500.html
> v2: https://www.spinics.net/lists/linux-pwm/msg19562.html
> v3: https://www.spinics.net/lists/linux-pwm/msg19901.html
> v4: https://www.spinics.net/lists/linux-pwm/msg20093.html
> v5: https://www.spinics.net/lists/linux-pwm/msg20150.html
> v6: https://www.spinics.net/lists/linux-pwm/msg20190.html
> v7: https://lore.kernel.org/r/20230214-fpwm-v7-0-fb0a6bfbd037@gmail.com
> v8: https://lore.kernel.org/r/20230214-fpwm-v8-0-65518a0d4944@gmail.com
> 
> ---
> Sasha Finkelstein (5):
>       dt-bindings: pwm: Add Apple PWM controller
>       pwm: Add Apple PWM controller
>       arm64: dts: apple: t8103: Add PWM controller
>       arm64: dts: apple: t600x: Add PWM controller
>       MAINTAINERS: Add entries for Apple PWM driver
> 
>  .../devicetree/bindings/pwm/apple,s5l-fpwm.yaml    |  51 +++++++
>  MAINTAINERS                                        |   2 +
>  arch/arm64/boot/dts/apple/t600x-die0.dtsi          |   9 ++
>  arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi     |  18 +++
>  arch/arm64/boot/dts/apple/t8103-j293.dts           |  17 +++
>  arch/arm64/boot/dts/apple/t8103-j313.dts           |  17 +++
>  arch/arm64/boot/dts/apple/t8103.dtsi               |   9 ++
>  drivers/pwm/Kconfig                                |  12 ++
>  drivers/pwm/Makefile                               |   1 +
>  drivers/pwm/pwm-apple.c                            | 159 +++++++++++++++++++++
>  10 files changed, 295 insertions(+)
> ---
> base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
> change-id: 20230214-fpwm-d8f76bc8ddc1
> 
> Best regards,

Applied #3-#4 to asahi-soc/dt, thanks!

- Hector

