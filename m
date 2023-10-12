Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB1C26288
	for <asahi@lists.linux.dev>; Thu, 12 Oct 2023 16:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a7i2EFng"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-27cfb84432aso852437a91.2
        for <asahi@lists.linux.dev>; Thu, 12 Oct 2023 09:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697127949; x=1697732749; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1XA1bnjURyQEajydjepfYTZ+FcgQ3CdpqFI865kskAQ=;
        b=a7i2EFngGtQEmQKFNf1Upq8kl4kih0kHBXCVrM9AACnKeSgz9Po+TzM9gjG5l59PY3
         /8xatWRVHQT+QrHt6nhheYGfqUDX9qUN3S6ZEq+FCSaQNAqzCK4EQcapArv11XN/PChQ
         /ZL+DEorFcUWbxIzwWrNcs1+ANkxtQvGrhxiWF2T9Cr1UBve+fuBowqUNFBnSoPnoBED
         jIhj841Fmuo+6D6y0yO0xPnENOH2jcKadMKoHy0FA16H4HvwGU+JOPh/JntJfS/q2fUl
         IS8LVm+L21SvBK49baR+3PZg1uxS2YyKJloV3h85Z8ijLF7dciBTI657IOYt94rhdiAk
         bq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697127949; x=1697732749;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1XA1bnjURyQEajydjepfYTZ+FcgQ3CdpqFI865kskAQ=;
        b=PcljxCuT8rpTDYb5XXX5Ph3SOGP1LLh79BX5TRVpQ4qsNXacnJ7Uqv0qWDoQEzcfj6
         /irTn+16sQHtgImeFjjE/rLAEQFIClSUMHAn8FUhjPFeP3DbMJlCbTg+dDUHCODzjMvk
         9S8W1JKu6okSItRfj0YsnPPLvXy3TdGy8elwHWTVSRY7LEyWByaNaK4NeCPUNmYdFNtc
         mYIZOyVgf9gCgmTKBXaajGWezhHgyZ8ZCIQh3RgYf/C/Ahhza2hJGbok7n+uijqi2QEI
         VgcDq6sZnDt3tQLa73c6nbX1vDpqUmnLr0mvc8yqtZ1u62WyOUq+rN6HGEzzE3/jVTfX
         PyVw==
X-Gm-Message-State: AOJu0YwUOQZVhEyEDLEP7o/Sjv6vjsfa8DnpiP2w8VnJ9mSEzVZ+s/iT
	OpMgkE3H828Ih4V19/TAMJ0=
X-Google-Smtp-Source: AGHT+IEOCcgOF3ACTlAZ50AUtGYWnkIntc1mQq7q/5nOk/hE6VK/yLVWFH8/e9BFv21TIsrFTwmzMw==
X-Received: by 2002:a17:90b:1892:b0:27d:c36:e130 with SMTP id mn18-20020a17090b189200b0027d0c36e130mr4470251pjb.8.1697127949257;
        Thu, 12 Oct 2023 09:25:49 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id qa17-20020a17090b4fd100b002790423f66fsm2037732pjb.26.2023.10.12.09.25.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 09:25:48 -0700 (PDT)
Message-ID: <9b5e8c02-31fc-43c8-bac6-d84f540f2407@gmail.com>
Date: Thu, 12 Oct 2023 09:25:45 -0700
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: On brcm80211 maintenance and support
Content-Language: en-US
To: Arend van Spriel <arend.vanspriel@broadcom.com>,
 Hector Martin <marcan@marcan.st>, Kalle Valo <kvalo@kernel.org>,
 Neal Gompa <neal@gompa.dev>
Cc: Dmitry Antipov <dmantipov@yandex.ru>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>,
 Arend van Spriel <aspriel@gmail.com>, Franky Lin <franky.lin@broadcom.com>,
 Hante Meuleman <hante.meuleman@broadcom.com>,
 SHA-cyfmac-dev-list@infineon.com, brcm80211-dev-list.pdl@broadcom.com,
 Asahi Linux <asahi@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>,
 Julian Calaby <julian.calaby@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Phil Elwell <phil@raspberrypi.org>
References: <6f78e624-62ee-3ae5-1db4-a0411566def8@yandex.ru>
 <CAGRGNgU7aySyUny9aG_+wXiKJ7j1weosa-rZDY4_WAXbq-3ABg@mail.gmail.com>
 <87ttr454bh.fsf@kernel.org> <3c5a3e7a-b332-4a77-51ba-bed3cad1e79f@marcan.st>
 <e1ee4d76-f717-a67c-8099-7b91192ba1ca@yandex.ru>
 <e470902a-35eb-9bb4-7a9e-167f985c98bb@marcan.st>
 <CAEg-Je-mpcrEoM_nD3_8A=gZhdWpn3hxfGZNEfGRNupGwRdetw@mail.gmail.com>
 <87edi14fvp.fsf@kernel.org> <cce5765d-342f-4811-ab7f-fb41ede0b3a1@marcan.st>
 <14ce82c5-f807-59bd-30ec-7eff5066e4f0@broadcom.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <14ce82c5-f807-59bd-30ec-7eff5066e4f0@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/23 01:41, Arend van Spriel wrote:
[snip]
>> I have a patch to enable WPA3 in Broadcom chipsets (yes, the driver is
>> in such a sorry state it doesn't even support that yet). The current
>> support attempt was added by a Cypress engineer and uses a completely
>> different firmware mechanism. Is that supposed to actually work? Does it
>> work currently? Is that the case for all Cypress firmwares? Or only
>> some? Does the alternate mechanism we have for Broadcom chips work too?
>> Only Cypress can answer those questions ahead of time, and they aren't
>> (they ignored me last time I brought this up). So my current patch just
>> replaces the mechanism with the known-working one for Broadcom chips.
> 
> This is mainly why I introduced the vendor-split concept so we can keep 
> the Cypress mechanism and allow a different mechanism for Broadcom 
> chips. The Cypress mechanism did not work for the Broadcom chips I have 
> so I wanted to test it on the Cypress chips I got shipped long ago and 
> they simply do not come up. Have not tried with RPi as it is not running 
> vanilla kernel. Could try with a backports driver.

You can run mainline on all of the Raspberry Pi devices, as far as Wi-Fi 
is concerned I cannot think of any major roadblocks, if not, email me 
privately and we can figure this one out.
-- 
Florian

