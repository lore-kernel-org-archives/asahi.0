Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA9270830
	for <asahi@lists.linux.dev>; Thu,  2 Jul 2026 19:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783020742; cv=none; b=JWsK+tYeMbm9j7vbMHpnFB6HKL8QsINv7a/eDg16C7gRy7BHnSKWP51SqA55B5xJ8/xrcozJKX9N+UVcIrFj68HC8A1qPBLMYJWfM7joEvo5MuZN91lJhrmStLDtzFC/m6FgsYYphToYJUq2ML9vUIeNwFeq7qs6nDnSs6fz3is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783020742; c=relaxed/simple;
	bh=Y3myU6PC6Y/+0AUV070w4T/IlmTKT4MrSxy6LSocXzY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SHWZIUwape5/iehwaBYcNvi93sCIpk62Uij0WqFL0iol8IknobPqp3RQy7OapC8h+jpc+ihoQSiSNpE3CBvxnZPAP0iiXwaluBNrgAO0aY1uaetMmbP3XBhvuVErqIhyR6sETzp7UmXlVFeF1ngmWXIEMzbB3+iJpVWEpbxsKGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QtYnmaAH; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QtYnmaAH"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-472055b0efaso1488019f8f.2
        for <asahi@lists.linux.dev>; Thu, 02 Jul 2026 12:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783020739; x=1783625539; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7qgcEW/wpSAcIIpifYaO2mjjD/biPw57/pk0Dft8EAU=;
        b=QtYnmaAH5B3N1SW+gLrWR3hMIKJ0rzNZk76uX1pihp3ExtSDPNxyR8hMXubxGBJhzE
         vPouvqYbW2vPsbVIlcJoJwHfOqMDLEXwrbUHn494GQQiM0Dw3a5Vbq56/gGaW+jy3yB5
         NtkNHJIIfKjhIit6KRQR6+ReVwTnkFScCOxIUGd1faoYzfAT8xtzlrkJN6oTi0EAIsy2
         8JT2fhnGU79DrJDhJoxaZPQaOFa+5eC1kpdXzVIEXYSuSerLPpu/mb8YMX6TckVl4e8S
         OHaR3enGAe4C1CBO441aDQxEU0kmuaVBNAeBTzqc7FhqANE5T3S3JHh057hqKC1UN22F
         JN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783020739; x=1783625539;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7qgcEW/wpSAcIIpifYaO2mjjD/biPw57/pk0Dft8EAU=;
        b=KVNsZOYkkKs6c65ib7kC+jmJlw6mD20lmN26VmhxAffTsfljjshBhYyqbcM6fCh96y
         kOFYggNtk1Rxy6xso5MZkUb0m9T0PNirsQosev06xNTgh1XBk4XwBnBs8bpf64lJ9K7U
         ZFq/RVYw6IH7B3V7B2sTU8R9U0yyXp4ddDywT/weakwhjtVmJXK5FFZMWqK9HkIQ3zvL
         Y+Ba5GM7wfZ3KFSj/jkHUnCUDw9WimV8AbiP9qMa1yzqfW2A0nZ75IPCocmHg7N7rKmx
         cWqybEXfs53ZZzhLDeKNHrU+/qpCGU0mytq6WSY22+InIHpymKiT6jWVUEx9eluU1wSD
         yq8Q==
X-Gm-Message-State: AOJu0YyPQVv6y+302uE4P/85zEFtw0OjFZWSw7odKd73qjZM7Nz9BOzf
	7FLoqaycxFIwpEUNwHFcz/Q26KWczPf3PBOBHMF8viibT7y6nRUnIyzl
X-Gm-Gg: AfdE7clILQudfWc5/VegMg+R9SUy19UEL0uv9BDthpd98MtLbtB+lH2ykThqEJfq3qu
	KSB00PkmRxbtH5arOLQezsVKVseSr4iE0KN3L10hOEZh0d4N075Z3HDHuXQSOY3L0FVM4IIwvSh
	/sVoK6Hzcg19TZBM6dIdge9Y/zjFUZn1ulq8GzErjO6UWFWoXyCOjvXPSVONjw+legLvzwxg27P
	18JO/thC9PPZGqRdyg+aojScCPoWJA3/RR1b55MLc7DKofAkBUdh2wU9eP0eLUAI117pa862oBt
	R+2EBGbzsw43GeTYOnfl0n92AMm7l5bYH7ms/JbVtAXCbzbHl7tBnurR6lOyMq5nHbIAlnFSY4n
	5+PYpypxuCMTc8fI9QxidgUYcIX36nfGX1+G0mOC9hRueTHJZd1wQdBg5Vrfds5xGH3KpMOHFQR
	gv58/iYzCWBKakeUNP/h4Zkuin+Joudv0n+E9WVLXLJrxh91XViAkeOIbJoZwwb7Df4+BQbdInL
	4RMedm7
X-Received: by 2002:adf:e00b:0:20b0:475:3a97:8e47 with SMTP id ffacd0b85a97d-4775918fa48mr8502412f8f.29.1783020738996;
        Thu, 02 Jul 2026 12:32:18 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477dd94ce4csm12070471f8f.17.2026.07.02.12.32.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 12:32:17 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <a0cee001-7bca-438a-943b-da28528e7df7@gmail.com>
Date: Thu, 2 Jul 2026 20:32:16 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] HID: apple: Add DockChannel HID transport driver
To: michael.reeves077@gmail.com, Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 iommu@lists.linux.dev, linux-input@vger.kernel.org
References: <20260630-apple-mtp-keyboard-final-v1-0-506d936a1707@gmail.com>
 <20260630-apple-mtp-keyboard-final-v1-8-506d936a1707@gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260630-apple-mtp-keyboard-final-v1-8-506d936a1707@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Michael,

On 6/30/26 13:54, Michael Reeves via B4 Relay wrote:
> +source "drivers/hid/dockchannel/Kconfig"
> +
>  endif # HID
>  

> +++ b/drivers/hid/dockchannel/Kconfig
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR MIT
> +
> +config APPLE_DOCKCHANNEL_HID
> +	tristate "HID over Apple DockChannel"
> +	depends on APPLE_DOCKCHANNEL
> +	depends on APPLE_RTKIT
> +	depends on HID

APPLE_DOCKCHANNEL_HID has a duplicate dependency on HID,
since you put the import for this file inside of 'if HID..endif',
and then also gave it a 'depends on HID'.

- Julian Braha
