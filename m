Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CCC7E
	for <asahi@lists.linux.dev>; Tue,  6 Sep 2022 07:00:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id A3197424B9;
	Tue,  6 Sep 2022 07:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1662447636; bh=rJz9iI2K7n8F2Tw4VDZQnYYMLTZj7rYz2v+XyLOOSFs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=FmN+kFAOPt2TetRbvhBsnOJ63QAP0FK8fwp/X6ifwqNQeTtSKYW81K7dsK7t3eNjf
	 3A1IQ/u4VkvfZIYEWa7EF6e4T2ZBYpsYwLpIDI6CvlpFcXKNZ+PevjJFc8QBn7BuIK
	 bqRWQfpGgJJYhF3G6ymedbnEGb8T8jF6q2ulcLw7WJg465a+lnYdL+YeqvRrBv7xFc
	 FfkSX9+Y+Nk919/SrWLF8FgBZDFGoUpXoOB7Gg0DIIT5MudsbQ0JNoTamT0v5bUwLM
	 eR8HfR64pIa27MSedS1MzfMRBDCl/HrSkMBdZ5cArGvgSBKHxv5ayiP8WugxZ80W1f
	 RwqP9o5z11aDQ==
Message-ID: <9cf54921-c6a5-b328-6941-d1cbe086bcda@marcan.st>
Date: Tue, 6 Sep 2022 16:00:31 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 6/6] gpio: macsmc: Add IRQ support
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>,
 Russell King <rmk+kernel@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, Sven Peter <sven@svenpeter.dev>
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
 <E1oTkeg-003t9k-Mc@rmk-PC.armlinux.org.uk>
 <CACRpkdaR9rBdPC_OBKx5e+=EtbR-Jn3GzrvGRYHMJmXwRxPhyg@mail.gmail.com>
From: Hector Martin <marcan@marcan.st>
In-Reply-To: <CACRpkdaR9rBdPC_OBKx5e+=EtbR-Jn3GzrvGRYHMJmXwRxPhyg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/09/2022 22.21, Linus Walleij wrote:
>> +       switch (type & IRQ_TYPE_SENSE_MASK) {
>> +       case IRQ_TYPE_LEVEL_HIGH:
>> +               mode = IRQ_MODE_HIGH;
>> +               break;
>> +       case IRQ_TYPE_LEVEL_LOW:
>> +               mode = IRQ_MODE_LOW;
>> +               break;
>> +       case IRQ_TYPE_EDGE_RISING:
>> +               mode = IRQ_MODE_RISING;
>> +               break;
>> +       case IRQ_TYPE_EDGE_FALLING:
>> +               mode = IRQ_MODE_FALLING;
>> +               break;
>> +       case IRQ_TYPE_EDGE_BOTH:
>> +               mode = IRQ_MODE_BOTH;
>> +               break;
>> +       default:
>> +               return -EINVAL;
> 
> I don't know how level IRQs would work on this essentially
> message-passing process context interrupt. Maybe I am getting
> it all wrong, but for level the line should be held low/high until
> the IRQ is serviced, it would be possible to test if this actually
> works by *not* servicing an IRQ and see if the SMC then sends
> another message notifier for the same IRQ.
> 
> I strongly suspect that actually only edges are supported, but
> there might be semantics I don't understand here.

IIRC that is exactly what happens - the SMC will re-fire the IRQ after
the ACK if it is set to level mode and still at the active level.

I do remember testing all the modes carefully when implementing this to
figure out what the precise semantics are, and I *think* I agonized over
the flow handlers quite a bit and decided this way would work properly
for all the modes, but it's been a while so I'd have to take a look
again to convince myself again :)

- Hector
