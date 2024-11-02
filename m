Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694A61E515
	for <asahi@lists.linux.dev>; Sat,  2 Nov 2024 13:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730553311; cv=none; b=gysLHJSjB3J21GOL0VDrYwJuZ+wGoNoTjq4ql2yNYYyWehW3f2xEZhtO0w9acPx4M5xusYfA58mZ7gmCvjNsG/cm0R//RSd3untZkshaC8E6DUQw3eNUhk9AmwTqa6VekEmuvBrBo0PjeXUdazi2GTJcjkywb5CELpPkHKHp+qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730553311; c=relaxed/simple;
	bh=fWFWaJrtT873uGrZbfXFWcjGiIbzel0zDqI7deZ84Bk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fKqLevXTGOa4BECgAqHz1py6zM2XUxJZwxst1XpPW6AoQTXN7SbQVwvQaSXawUmn+gKtKrjYF4JkZreixH2DZyy+D3vVXeMr7/zwUNhINoVJKBDE2wmFA2RqIerfEAPH/OjA5DkV9fJG2wcc/xFNKV7m/5uFuxevv/BcIO5HTrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BH72r0c4; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BH72r0c4"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20cf3e36a76so30659705ad.0
        for <asahi@lists.linux.dev>; Sat, 02 Nov 2024 06:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730553310; x=1731158110; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YqIV8fJvUTPe1XkFfFuu3lKfRKNmYvmwJe3hWNSUszg=;
        b=BH72r0c4L5YcLKLz91EBDF9G9/DZseqJPAeEc3GQo/wsnUbp3pB5OrX61QPLyZL1FX
         hPh3aoPTP8MvPF7d6KLPuKsUEEOozNbcXjhn7BnMODLtJo6CSdMTZoQHAaQzpw1fO405
         hGm7z9Xxk3stsXKVb621QDxjmSwYmAUhSNBoXgMbHnCU1bsJ8rFI6rZK/toq6loChERT
         nIIIVudbU2uIPB7nGcAKXpHP3vuxjDaVvp8i4s+A+vF5VnMRslCye3EFr5Ogfcju1red
         RFciojayGo4lcNMfTRHJtmRUbYA4JfZ6v0jhEHt4WIkxmMWchwGbAzgqBT8JS1LDP1VD
         /7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730553310; x=1731158110;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YqIV8fJvUTPe1XkFfFuu3lKfRKNmYvmwJe3hWNSUszg=;
        b=KzBKbfnUNw3yRjw66Wj3pogBLHgxFmJeECLo/W5pEt8Fwwof2CYeRUMLnqd/7/6PCw
         iDJY5Ou01s7RmyDbLpE1/65J6BpKrNiwB6CUdhoBTwEP0R9x9QUCvjpb/Z+cpkDdBdtO
         dxr464UfXA0VHWWtkkAII7OAFLGaWYIgUAiq8hnuy+iysA9Ia9dK2VI+Zsv+DKZ0gTRx
         qpZBiEfmVtr2Kv2U8iGISAKvNjmj/OlfvK4coHA2sCYF7AwVXJpFbZeD5kpndm2d8uMv
         P6nKfKuH1e6e9wqzM+8hWie+yH+M9blDjEAsKyCt6PnoOT3ZpGR6snzIebJy5T6IjeLu
         Ukwg==
X-Forwarded-Encrypted: i=1; AJvYcCWYoheKI02R5BqCVOnyvcm7qrgqHSBy7DuYLfDt92Y/4SmPl6Ld/xmdYiG2UyHMF9ZQSjG/qg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyZQFjpNatIvKigqgAdoxGz7ioNnm+112lwoNbCHAb03TE9jNut
	M1NKmkv3hteGaa+0HrhevmzacbL6RhVyosk6+VPKS6dXigbQPLZi
X-Google-Smtp-Source: AGHT+IEjZyMhv52i+FdmXziel3S6uh0T/4JCB2ptezWEGIl82CVPxNSuviQk+FJATDrk0E2JnpSDUw==
X-Received: by 2002:a17:902:d4cd:b0:20c:dc32:b5d0 with SMTP id d9443c01a7336-21103ca87e7mr141827475ad.58.1730553309583;
        Sat, 02 Nov 2024 06:15:09 -0700 (PDT)
Received: from [192.168.0.122] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21105706886sm33500465ad.68.2024.11.02.06.15.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Nov 2024 06:15:09 -0700 (PDT)
Message-ID: <6fb61676-2744-4735-ab00-2a523e03ea96@gmail.com>
Date: Sat, 2 Nov 2024 21:15:05 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: spi: apple,spi: Add binding for Apple
 SPI controllers
Content-Language: en-MW
To: Mark Kettenis <mark.kettenis@xs4all.nl>
Cc: j@jannau.net, marcan@marcan.st, sven@svenpeter.dev, alyssa@rosenzweig.io,
 broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241101-asahi-spi-v3-0-3b411c5fb8e5@jannau.net>
 <20241101-asahi-spi-v3-1-3b411c5fb8e5@jannau.net>
 <46b31874-9fe2-4534-9777-816765a265b1@gmail.com>
 <87wmhm3u7v.fsf@bloch.sibelius.xs4all.nl>
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <87wmhm3u7v.fsf@bloch.sibelius.xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/11/2024 16:39, Mark Kettenis wrote:
>> Date: Sat, 2 Nov 2024 10:36:56 +0800
>> Content-Language: en-MW
>>
>> On 2/11/2024 03:26, Janne Grunau via B4 Relay wrote:
>>
>> [...]
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +          - apple,t8103-spi
>>> +          - apple,t8112-spi
>>> +          - apple,t6000-spi
>>> +      - const: apple,spi
>> Apple A7-A11 SoCs seems to use a Samsung SPI block, so apple,spi is too
>> generic. Fallback to something like apple,t8103-spi instead.
> 
> Well, if that is a Samsung SPI block it probably should have a
> "generic" compatible that starts with "samsung,".  The M1/M2
> controllers have a different SPI block (presumably) designed by Apple
> themselves.  So I think it is (still) appropriate that that one is
> "apple,spi".
I just looked into the SPI on A7-A11 SoC in more detail instead of just
going off the ADT compatible. It seems a very big chunk of the registers
offsets and bits seems to be the same as the ones in M1. So, feel free to
ignore my comment above.

Acked-by: Nick Chan <towinchenmi@gmail.com>

> 
> Also, (upstream) U-Boot already uses the "apple,spi" compatible.  So
> changing it for purity sake just causes pain.
Well, if upstream U-Boot is using it, then I agree that "apple,spi"
should continue to be used.

> 

Nick Chan
