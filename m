Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7B9D521
	for <asahi@lists.linux.dev>; Thu,  1 Dec 2022 18:14:45 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id w2so1103815pfq.12
        for <asahi@lists.linux.dev>; Thu, 01 Dec 2022 10:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+qiP+aVyEbFOin+Fo/Yz6dh5ehlyeto99kkZi+uNlNg=;
        b=bLwHx176LOszJh7EjFmxlHoRSrusawe1m/8ONFIvi20Ao1VaNovHngA/dkeAr9PdM6
         HXyqLmIOclACQAJz9XvahXKcNR64jiGkSV2gp2VVafJ/t/8EGFbJrIYhGEV1aMX5xqTt
         j1+/A/Mk4bf9xbt+jBLBQywuGUSoPYAuKjqywUfWHdD/IzmCctJIGHC8g8PIOO8gna0z
         LZ1558q3nJqSv++SBilMpXNgyiGoLv103hh+ZzCzwnxRfKvhjbtqZtXqMpc2D5h9/eVt
         MSjyIjF5HqSDRPNLRETVpOLf/BOuCy2GfaRce6VtPi400GwVMFdkBA1JjPHuntxdehAV
         hrPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+qiP+aVyEbFOin+Fo/Yz6dh5ehlyeto99kkZi+uNlNg=;
        b=2SyRh0OrGTc5ktQsUhJ0E6an8gcO0wNNB/zB0ZXG9sOVAuxiwi0wjYYvTvHvddaW++
         bPoao5LakYQelQb5rx9L5PTk1bNZkwctjmBimk9ekbKfgO7X8KvxJkK1ClQJ0qAXXAWe
         twoAKYN29Ay+FlLFsoCksH30hin/a1VoJ0YPLVsnO9tJ6uU9+0cYaxm6AQ+2bqa8TIN+
         3Zjmk141H5uW80GHJPSIVc+DOGDxntukJ7z3FIp7y6H+c5CkuuTYQ3G01O2IkyD/vm3Z
         Moz9XZtQuFoTEwbYSZsuz6SdFe6VfIhOfDrkTjBG5N8cDyGL07noVpehjADJgeWTZpMi
         Lofg==
X-Gm-Message-State: ANoB5pkHD127M9dDsxoCUsPGH4q/D5qflyzg/No5yGr/1aG/MWUS0wj4
	ruQ6On4gqa8PykJC8ixV0eiKqg==
X-Google-Smtp-Source: AA0mqf4B6/UAlIPQX5wvlJ3k48CdDnGeviR46Lrs1HEVHn73FAxfx55icdrfZVrW9OOfLpFuIcVuaw==
X-Received: by 2002:a62:1417:0:b0:575:c993:acbe with SMTP id 23-20020a621417000000b00575c993acbemr11000843pfu.2.1669918485410;
        Thu, 01 Dec 2022 10:14:45 -0800 (PST)
Received: from ?IPV6:2400:4050:c360:8200:8ae8:3c4:c0da:7419? ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
        by smtp.gmail.com with ESMTPSA id b1-20020a63d801000000b0046ff7db0984sm2842628pgh.72.2022.12.01.10.14.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 10:14:45 -0800 (PST)
Message-ID: <18c884cb-dd73-09eb-65da-604cf45cb1b4@daynix.com>
Date: Fri, 2 Dec 2022 03:14:41 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] arch: arm64: dts: apple: Remove stdout-path
Content-Language: en-US
To: Hector Martin <marcan@marcan.st>, Mark Kettenis <mark.kettenis@xs4all.nl>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, asahi@lists.linux.dev,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, alyssa@rosenzweig.io,
 sven@svenpeter.dev
References: <20221201103651.27807-1-akihiko.odaki@daynix.com>
 <877czb42wk.fsf@bloch.sibelius.xs4all.nl>
 <c3b0cee9-032c-0447-37df-3ce5ce280e41@daynix.com>
 <ae89b38f-fd67-e0e5-1439-f376da985be8@marcan.st>
 <8b3c4fe0-4a81-ba47-2f01-3686cfdbd519@daynix.com>
 <647b6572-e5d1-d243-283e-616cef15a1f5@marcan.st>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <647b6572-e5d1-d243-283e-616cef15a1f5@marcan.st>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022/12/02 2:46, Hector Martin wrote:
> On 02/12/2022 01.38, Akihiko Odaki wrote:
>>   >> In contrary, if you boot the kernel without the hypervisor
>>   >> feature and this change, you will completely lose the console.
>>   >
>>   > How so? The console goes to both places with stdout-path set to serial0.
>>   > What it *does* change is where input is accepted prior to getty startup
>>   > (which is why u-boot specifically conditions this on keyboard presence,
>>   > modulo the USB issue - because if you *don't* have a keyboard then tty
>>   > keyboard input is useless). But if you're booting kernels without u-boot
>>   > along the way, you're probably doing it from the hypervisor or linux.py
>>   > anyway, especially if you plan to do something like "init=/bin/sh",
>>   > because without u-boot (+ optionally some EFI loader) there is no way of
>>   > editing command line arguments at boot time stand-alone.
>>
>> Well, that is not exactly the behavior I saw. In my case, if stdout-path
>> is pointed to serial, there is no output on the framebuffer, and it just
>> printed "_".
>>
>> It looks like the kernel only outputs to either of serial and
>> framebuffer, not both.
> 
> That is not what I've seen in all of my hypervisor runs since the dawn
> of time. You get log output on both.
> 
>> What I experienced is that when I directly booted the kernel from m1n1
>> without hypervisor, it showed no output to the display even though the
>> same kernel worked with U-Boot. While I could tell it used wrong console
>> by running the hypervisor, I wondered why it behaves differently without
>> U-Boot, and found the aforementioned U-Boot change, coming up with this
>> patch.
> 
> Then it sounds like something else is different about our setups,
> because I've booted the kernel from linux.py hundreds of times and I get
> output on both. Looking through the console code, the VT console gets
> added and enabled really early, and the subsequent serial console
> registration later does not disable it.
> 
> Look for "console: colour dummy device 80x25". It should be immediately
> followed by "printk: console [tty0] enabled", and this should all come
> well before the ttySAC0 serial stuff shows up.
> 
> - Hector

I think I understand the situation now. By "console", I was meaning the 
input and output of init, but I failed to clarify that and you thought 
it referring to kernel message output. I saw no messages earlier than 
init because my kernel command line has loglevel=3.

Regards,
Akihiko Odaki
