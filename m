Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FA023A3
	for <asahi@lists.linux.dev>; Tue, 13 Sep 2022 16:30:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id C4986419C2;
	Tue, 13 Sep 2022 16:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1663086642; bh=vzWGyteueLsswzGvi+6XzWghfOIHbD8/EIY1vSvR/2M=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To;
	b=khIywr8WAbFrcw7TLx+uGW8CRvSACmoi7qpuUwztfsImZq9bzF8i+TRYGI3X7WbJ1
	 1RRCyGUAth3b9bJ5bxJSOI/+aCZ1TqqDi/1gq4kBGpURUdn958V+cR/46Si8LnyL+X
	 Mb4QcGDJoE7IigtySNENfJBexu/NkOxtY5zIH8QRuBAfE55yuNzMwC5CmKw2M0dkRv
	 R8uflIzlvFxskcw+n4qmMKUzbrwQ1fusimFZIDiGGY27mORXkC+UBnON5bnwMSGPob
	 6bISHAp3tvNg44BUigPGss7Go+A5c9z3GBGL3eUfQjfxzceB62UthaxyXwH7doqVHE
	 IOLtGy5d1M09Q==
Message-ID: <7e9f12eb-7f5b-1757-cd2f-5d5f1ca9aacd@marcan.st>
Date: Wed, 14 Sep 2022 01:30:30 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: es-ES
To: Kalle Valo <kvalo@kernel.org>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Arend van Spriel <aspriel@gmail.com>, Franky Lin
 <franky.lin@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, "David S. Miller"
 <davem@davemloft.net>, devicetree@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 Rafa__ Mi__ecki <zajec5@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 SHA-cyfmac-dev-list@infineon.com, Sven Peter <sven@svenpeter.dev>
References: <Yx8BQbjJT4I2oQ5K@shell.armlinux.org.uk>
 <E1oXg8I-0064vm-1C@rmk-PC.armlinux.org.uk> <87bkrjbwaq.fsf@kernel.org>
From: Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH wireless-next v2 12/12] arm64: dts: apple: Add WiFi module
 and antenna properties
In-Reply-To: <87bkrjbwaq.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/09/2022 15.52, Kalle Valo wrote:
> Russell King (Oracle) <rmk+kernel@armlinux.org.uk> writes:
> 
>> From: Hector Martin <marcan@marcan.st>
>>
>> Add the new module-instance/antenna-sku properties required to select
>> WiFi firmwares properly to all board device trees.
>>
>> Signed-off-by: Hector Martin <marcan@marcan.st>
>> Reviewed-by: Mark Kettenis <kettenis@openbsd.org>
>> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
>> ---
>>  arch/arm64/boot/dts/apple/t8103-j274.dts  | 4 ++++
>>  arch/arm64/boot/dts/apple/t8103-j293.dts  | 4 ++++
>>  arch/arm64/boot/dts/apple/t8103-j313.dts  | 4 ++++
>>  arch/arm64/boot/dts/apple/t8103-j456.dts  | 4 ++++
>>  arch/arm64/boot/dts/apple/t8103-j457.dts  | 4 ++++
>>  arch/arm64/boot/dts/apple/t8103-jxxx.dtsi | 2 ++
>>  6 files changed, 22 insertions(+)
> 
> I didn't get any reply to my question in v1 so I assume this patch 12 is
> ok to take to wireless-next. ARM folks, if this is not ok please let me
> know.

Yup, this is OK to merge via wireless-next. In case you need it,

Acked-by: Hector Martin <marcan@marcan.st>

- Hector
