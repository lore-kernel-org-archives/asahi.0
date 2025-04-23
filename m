Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E00215F5D
	for <asahi@lists.linux.dev>; Wed, 23 Apr 2025 04:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745384342; cv=none; b=e0cyUb/gkuBIjp6AiP/7OLjYb/knGQH64JvQme9LtV3H6vQSQYz7vSrTabtRbMIcgV6gmAVzA2qgM2Jh2hZASJKJZkCNaOSopEIweCKaDBmjNQ5HUrEuMMQsT4f+7OxByaUQoTctq4DxvovCdpUlAx1ABhf0DJzvodNDUQc5tmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745384342; c=relaxed/simple;
	bh=EY9ujoNfwKQ8qWkmSV56odIIKrNXJB79dFPjRW5I/X4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UDzmDUjgyMl7u9c366JlmDXxiV4hnd5NfKfHJXf4LccNi7iB4eSfL/San46gDtwIrFMp+r7y5IFDXfeUEgrATsDynpbYKv9TFIVCxJAFTHuYXagB4rsL3chwIRShvyQZ5n7607oCUod8nx4fh6NY37GN6BgUewZYSe5t3QhSHxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a0aN9f9S; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a0aN9f9S"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-736a7e126c7so5197598b3a.3
        for <asahi@lists.linux.dev>; Tue, 22 Apr 2025 21:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745384340; x=1745989140; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xyg383WQs++mdg+KNHFWZy7e9+DE/XMzzSgB2As2m/o=;
        b=a0aN9f9SDxzlihkl6P5hqlMxuEw5HFQSoLjNzXPGATMdRwA7BLBprMNx7Pg5kVb/ep
         MXnXyN4q63w0jbUB4PTipjawNGsC83Rjsej5GnfT5X6O28E+elZ2h+MoGj+rccVwgWEb
         jYzP1ND+4msQ47Fuid4yKnv8stBdPnlBs1xCiVRXfD+fZgBBuUP4pEQvvp1afl83NFbS
         DiQNnUuBvf7r5HHlM5XDVeKkhVP2uMnr0ysEj7YNYpb4Up9J9sQF5RaUXGe+JcKTNWyJ
         zTyZUaqHuGElDH/uE1aidbyxxMSmoz3Una7nfw1PNq4AwmrHMZRA4fYU45q9yxCbrJoO
         RUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745384340; x=1745989140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xyg383WQs++mdg+KNHFWZy7e9+DE/XMzzSgB2As2m/o=;
        b=QUK6IRDC1NeKzJO/POiobqt4rakBq0FIY1Pu6RU8mNF9bAwabj2tnLyxs1ejl17PEj
         I/Qd3fo0BqpFa9v00T9x58peF22gGClH87NLthK8uNnp489L5gVH1ZRMk7lL0qwSn0YC
         GeLXe4qAxDsFK2MgcCnfr1SwKXLbP5VhqLyQC2OJ1+ixKA6izPSmcjM/c0y8QKta3kPn
         wjCQ1lWDV/wTXPL8YdHb3AtR3gZnVCD9cIK3mpvgOUvwIkf5g7BQ0oDH1gkxseqAFEYY
         DQrpRtxMUG3cfeVH9kQ0Ug93nALC57ZuixExN98YDN05dsjZSP7bZr8F2n+Hke1mFl93
         SvGg==
X-Forwarded-Encrypted: i=1; AJvYcCXp8kzG6PX5XAFZoDI5ZwMQwFKYkf81lYtjHTHk5xZ62tskXywyqDij/N2Fnd+jmII/dNlAtQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzkNWvRACHSi3eUWX5fs1SWV0sorehiPAhzPFN7Brx7rDxWbK2d
	SVszlsJFm+Yljvqr936UzF4iG/TdrJgaOUihqY2MmTsLnQq61QyN
X-Gm-Gg: ASbGncvWjlDYH/GfxKf5uaq9X/46cpaTSjNHeeBj/92bYWdxskfo4XVY++eC9yyV4TZ
	J8npZvH8uDvQMtUuyjEjECx3c/rEDgK+8um40whWMvxm9/uGBEWUTR3NR+NImfrsgVgXQdF8dbJ
	rZ5kq8YxrKiWzFtiE30CDtnuy0NjUdoVfmfwggcSeBp7pmzLn6RDANE1xdP8rvSepUM6X/NAf0W
	Z8yzsiyJA+UEHd4CvXJYgxeC2BFiQ5LeUNwD88P0ceaYTdMX61KNOXcymVu1g6CGTNFjy2Kzft1
	e2fwcIJKU1Os/maK9CT1ZGEQxNARiDnNdsuQRLNXuNTPc1CMmX29IzgaL0KfgdxPSohaVfo=
X-Google-Smtp-Source: AGHT+IGTIS5Xlm9+VhCnh58WLvEtwL4pxJkbeifvZpi31EsCMwvpE4ldGQssGqpK2dlu5H9jrh6Pxg==
X-Received: by 2002:a05:6a21:7108:b0:1ee:d06c:cddc with SMTP id adf61e73a8af0-203cbd207b4mr30512585637.30.1745384340420;
        Tue, 22 Apr 2025 21:59:00 -0700 (PDT)
Received: from [10.89.236.32] (wf126-032.ust.hk. [175.159.126.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309d5d61f7asm2606442a91.0.2025.04.22.21.58.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 21:59:00 -0700 (PDT)
Message-ID: <e4159c2b-4081-4a4b-9a53-d6d559a3196c@gmail.com>
Date: Wed, 23 Apr 2025 12:58:55 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: spmi: Add generic SPMI NVMEM
To: Sasha Finkelstein <fnkl.kernel@gmail.com>, Rob Herring <robh@kernel.org>
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250417-spmi-nvmem-v2-0-b88851e34afb@gmail.com>
 <20250417-spmi-nvmem-v2-1-b88851e34afb@gmail.com>
 <20250422133619.GA1095169-robh@kernel.org>
 <CAMT+MTTwY=z1-_94ws+Oi+wvE2PA_s57dPmpMABC26q=MPw1Mg@mail.gmail.com>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <CAMT+MTTwY=z1-_94ws+Oi+wvE2PA_s57dPmpMABC26q=MPw1Mg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Sasha Finkelstein 於 2025/4/22 夜晚9:44 寫道:
> On Tue, 22 Apr 2025 at 15:36, Rob Herring <robh@kernel.org> wrote:
>>> +title: Generic SPMI NVMEM
>> What makes this generic?
>>
>> A generic driver is great, but "generic" or "simple" bindings are
>> generally a mistake.
> There is nothing apple-specific in that driver, just re-exporting
> several registers as cells. If you think that it is a mistake, I can
> rename it to apple-pmic, or something similar.
>
>>> +      - const: spmi-nvmem
>> What happens when there's some other feature of the PMIC exposed that's
>> not nvmem?
> If you have a PMIC that needs more features exposed, then you'd have to
> use a different driver. Or am i not understanding the question correctly?
I think the problem is what happens if more functionalities needed to be exposed from the M1 SoC's
PMIC. (right now I do not believe anything else is needed from it)

It would be multiple drivers. A simple-mfd-spmi driver (like drivers/mfd/simple-mfd-i2c.c
but SPMI) that exports a regmap and a generic driver that reexports regmap (any regmap,
not necessarily SPMI) as nvmem cells, plus extra drivers that uses the regmap exposed by
the mfd driver for extra functionalities.

To make this submission more generic and extensible, what would be submitted should be a
simple-mfd-spmi driver and a generic regmap nvmem driver. For specific examples, see below:

The PMICs from dialog semiconductor on older Apple SoCs definitely needs such functionalities.

On Apple A11 SoC there is a RTC clock device on the PMIC and the SMC on there does not have
RTC functionalities. To make the RTC clock work there a driver would read a counter that could
count a maximum of 194 days from the SPMI PMIC, and then access the PMIC nvmem cells that
held the rest of the time. In this case these drivers are needed:

(1) simple-mfd-spmi (2) rtc driver (3) generic regmap nvmem driver.

On Apple A7-A10X SoC a similar PMIC also exist, but is over I2C instead of SPMI, those devices do not
have a SMC. To make the rtc clock work there three drivers are needed:

(1) simple-mfd-i2c (already exists) (2) rtc driver (same one as above) (3) generic regmap nvmem driver

The PMICs on A7-A10X SoCs are also known to have WLED output for backlight, shutdown controls and
some sort of pinctrl needed for things like bluetooth.

In both cases a combination of (1) and (3) is more generic and applies to more than one bus types, and
allow extra functionalities other than nvmem to be added.
>
Nick Chan
