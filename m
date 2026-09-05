Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE413CB55D
	for <asahi@lists.linux.dev>; Sat,  5 Sep 2026 08:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788596749; cv=none; b=Ey/pj3LV5Yoy78WVvkFhkpYLX4YYqx4cLXM2SZbJBaIPjHtJxTy9GfWmKnmKx4FODpJ8OwdhS2nldCV3dt3kjqcb2ivpl6JPYeNQ+o1yfkrqFFkG4EY0X7bEN/4/T6bij+1p7ERGf10v09tO4NpFww5kUv861ea3EZd1BdAXoHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788596749; c=relaxed/simple;
	bh=OviR5kaHs976PRzULV1vC0IpWTkvgJa0y9VkRRzLNZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W9p++GA32jCmzP1Ka5ldSK2rdQCMIa0VLQX60hiL6/6WPM49kG+A8vFEz4Vgad06uA+KlD9QF9hramGYUppWyt2mPVEcvFvZDaXcN+/UFqv5BFNeDL7eciCw9tvvcM1oGdE0LffXJ2BiKqYKdWe37Z2mY/nlH0Yejk82kn78R6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TQQCTBco; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TQQCTBco"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3966791a6eeso2102593a91.3
        for <asahi@lists.linux.dev>; Sat, 05 Sep 2026 01:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788596743; x=1789201543; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w4JWIpadkBBtpyHMGkKKLMv6w38PE5gnqdnr/RtDlQw=;
        b=TQQCTBconFXbhKAtF/+QgUcrq9ru85xA03qTijH71HKzpPWsYdQme/r7RoSuPtxB4/
         SYdzJ7eNAwRy+LVkMdU4+xIgRpXQKZJcXxx3ReU9vAgRfNvOjqdXaMspaQFTaS+iCWO8
         EiHPBdaiTNpQncFr2TrQRkmtji17fY30mmRJiifUI4GBcPt0Cf57XJsdwxx7/TKuqkiL
         LAosBrpzuwaoSSiiJQS59tMx9ENoU7aTeSD0/huU+IlbVKRM+XOeeqoYUZsY9pe5Bget
         sKHOlzcjTb9bFupVdO0SwTQoOrzVEAEg1EOWCOue0XsiLIMgogBTRl5zvVywq0rO4czm
         DIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788596743; x=1789201543;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w4JWIpadkBBtpyHMGkKKLMv6w38PE5gnqdnr/RtDlQw=;
        b=a0Qx+u/c97jmzQxn7o25VCx9TUWiP6c3nS74EmrFQnLUtudxcRA2yc2YOsoQc6tXkd
         rFN/G8YIg2+TFApHdxmzvV8aTWcr4W47DOq7vZozJnWfswB1YkWiTr5bJJUejnicJe7y
         NnfsN12munS2yHHATbwMu0MQBfP0/YaFN0sax6NWKLm7+3AuzOUwVRTTdEtH7wYbseA3
         ICUoYty2uXvRp2os6ez3v1RGGz1EbUL/lVWJEelTWdVYg8H85xEgo2CSa49r9qwLh5xa
         gqImgtl+f9lVV5vomCM/yaXe2JTcV2s5DEjvbf3/Hja+pcSy1OvSfnVr9ENW31ikIzW7
         KTuQ==
X-Forwarded-Encrypted: i=1; AKwUvBwtql0lkE3WYFcqrhJe8JQ9WZNAhQzbOnEtts+DUUzOEWymts/ApDAjePlzwLjyPBdCWN92BQ==@lists.linux.dev
X-Gm-Message-State: AFuF++ljayBpBwqAODyTNCKNz36oT6WtO63opn6XjRhwYM8WekKNOtem
	ttgQcenp2hlp10xNgFccufA50LBRb4T/86SdqZYhR4DKQOXj7qf/wBIE
X-Gm-Gg: AYBFou2KEcaPKa3a7flQYQQzO4CTb5SMoZ/KatHvWlaNptNNEG5TGKDwwEOi1CVwS+S
	LjVAzikQsqEQooSWcpCGuqJtGApPWwnqg7Lj5NrStAb1GhwCap1MXTw9pLXVAyetAFeJP+59+vi
	arurc3CciHpSxgFFUDjyZidVMLzTdlbyo8CdZFG4jefvDoxbUHUocqCADpYOL+oh4V8BMSd6q1+
	anW72eNNhRK8RNgUhnspvJioA6/NNQQUf1SyhxXqYrdiCUMfL2GNxHfVxYu46NRbbauwzQiARZq
	Y6y8V3MLtTpIYaLxRT6jPyukBpAhqqeM3sv+aEVwRlZFN5W14LPMnWcHgzwtt7ejPLCH5H6Y3hr
	wmH1ErKvpX8L/LN4Fk4dYLV+1tX2yDFkIrT7UKPlgTVsMgyg0TW/fH6grM+Xlsn0ypxNrnfayAN
	IcMSps9aSkwGcYfxGZBAOQCi1Drymv7xu7IWaVH3WHqz23/d4/cnhm0Uhv77dhVKoKQ6HX+/3Uh
	7KMBw==
X-Received: by 2002:a17:90b:17d0:b0:398:9bd4:d18 with SMTP id 98e67ed59e1d1-39b26298ba1mr15383737a91.23.1788596743161;
        Sat, 05 Sep 2026 01:25:43 -0700 (PDT)
Received: from [192.168.1.107] ([223.122.38.120])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ca07sm14262328eec.1.2026.09.05.01.25.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2026 01:25:42 -0700 (PDT)
Message-ID: <4e65ef39-cf1b-49d4-a899-da36acb442c2@gmail.com>
Date: Sat, 5 Sep 2026 16:25:36 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] dt-bindings: interrupt-controller: apple,aic2: Add
 apple,t8140 compatible
To: Yureka Lilian <yureka@cyberchaos.dev>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>,
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-watchdog@vger.kernel.org
References: <20260904-apple-a18-pro-initial-devicetrees-v1-0-0c25401d165d@cyberchaos.dev>
 <20260904-apple-a18-pro-initial-devicetrees-v1-4-0c25401d165d@cyberchaos.dev>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20260904-apple-a18-pro-initial-devicetrees-v1-4-0c25401d165d@cyberchaos.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Yureka Lilian 於 2026/9/5 凌晨3:49 寫道:
> The Apple t8140 (A18 Pro) SoC uses an AIC3 as interrupt controller, same as
> the M1-M4 SoCs.
>
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>  Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
> index 1cb886785173..e3cadc5ad39d 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
> @@ -46,6 +46,7 @@ properties:
>                - apple,t6030-aic3
>                - apple,t6031-aic3
>                - apple,t8132-aic3
> +              - apple,t8140-aic3

the title should be "... Add t8140 compatible" describing the hardware corresponding
to the added compatible since the compatible being added is not "apple,t8140".

(Alternatively, if you mention the compatible in title, say "...Add apple,t8140-aic3" as
"compatible" is already implied)


>            - const: apple,t8122-aic3
>        - const: apple,t8122-aic3
>  
>
