Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EDE186E
	for <asahi@lists.linux.dev>; Thu,  8 Sep 2022 11:38:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id C3A5942450;
	Thu,  8 Sep 2022 11:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1662636627; bh=+WfXnmU5h8HnqOApI/MBnFeTKMAoVkVZ67dL2ngIcxA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Bq2ziIrh+VlOtoQ6bzRhsuuSxak/XjWictNpNHQm95uAOudZMUIg46orswoJzRpv0
	 hLchImQWWh4EQDUO57FeO+4WGU1jmLyBAY9DG3NsTqCfwWGVIDuqnfigGDOOV08Mux
	 lwMkv0H1BoQNTjyxfPGgxlglMGmCCoicNcvJF+n3dbw901P05rsw8WcxuyJMJbIgeR
	 bIUG1PVr8KVe+5K+XS+6yTne5at4lUqVscTTPI2srcwg98Lm5qTexiWlBIKxJKRMtC
	 TmK7JkUTEm0FW3zMI+7sVTWzyzGsWRLV3GuVvRkrqKt4ajBBq5nzWN2/ByjqZ1/MPF
	 RxMeYmNcmK4JQ==
Message-ID: <a7ff9909-d797-c3f4-1ca7-1b92e85db34d@marcan.st>
Date: Thu, 8 Sep 2022 20:30:19 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 2/5] dt-bindings: net: Add Broadcom BCM4377 family PCIe
 Bluetooth
Content-Language: es-ES
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sven Peter <sven@svenpeter.dev>, Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 asahi@lists.linux.dev, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220907170935.11757-1-sven@svenpeter.dev>
 <20220907170935.11757-3-sven@svenpeter.dev>
 <bcb799ea-d58e-70dc-c5c2-daaff1b19bf5@linaro.org>
From: Hector Martin <marcan@marcan.st>
In-Reply-To: <bcb799ea-d58e-70dc-c5c2-daaff1b19bf5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/09/2022 20.19, Krzysztof Kozlowski wrote:
> On 07/09/2022 19:09, Sven Peter wrote:
>> +
>> +  brcm,board-type:
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    description: Board type of the Bluetooth chip. This is used to decouple
>> +      the overall system board from the Bluetooth module and used to construct
>> +      firmware and calibration data filenames.
>> +      On Apple platforms, this should be the Apple module-instance codename
>> +      prefixed by "apple,", e.g. "apple,atlantisb".
>> +    pattern: '^apple,.*'
>> +
>> +  brcm,taurus-cal-blob:
>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>> +    description: A per-device calibration blob for the Bluetooth radio. This
>> +      should be filled in by the bootloader from platform configuration
>> +      data, if necessary, and will be uploaded to the device.
>> +      This blob is used if the chip stepping of the Bluetooth module does not
>> +      support beamforming.
> 
> Isn't it:
> s/beamforming/beam forming/
> ?

Nope, it's one word: https://en.wikipedia.org/wiki/Beamforming

- Hector
