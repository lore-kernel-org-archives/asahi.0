Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC5C320C
	for <asahi@lists.linux.dev>; Sat, 17 Sep 2022 17:47:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 3B31E4503A;
	Sat, 17 Sep 2022 17:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1663436871; bh=uieYh6yor3/TXKrWYGESX5IiXkdGDWAI2XPOnzFPTn8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=sEqXZhV87QZL5OSktmkDn/OHU93yLnRAbh5bn6ZPRvJY5+qfIhdRziKSo6ymV/FOh
	 gNye4vjjvouGSdgx73jmXfk4Lh/vxl2xH2XCRhXuDWgk+fFUzNNjkksU9n+T8sHiu4
	 8cuxDBOd868kGdjf4dIEU8IaCC/7/bi3IO3leC7LBT8n8oMcYzvlqCqdDEPuAY/Fc+
	 BvxfwC2ttsgk1lx5MGlScicJRyApWEV62HwRYCg9hOW3eiBWZ02rllU/zrufeg2gVp
	 6iqQ40Km7UP/W5UdxDrgA/ATaNr2c+EIz9kW/vtwRkjz7bHX+DRSm1K+dXfEchHW0z
	 +30CfsyU6RzfQ==
Message-ID: <5277302e-c610-a925-df76-e1ac66956286@marcan.st>
Date: Sun, 18 Sep 2022 02:47:46 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 0/3] apple rtkit: add support for atomic operations
Content-Language: es-ES
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <YyGR+z5nGPh66LdY@shell.armlinux.org.uk>
 <19191d4d-e8a8-4319-bf7b-d5301a792a21@www.fastmail.com>
 <YyWtz4u5fcxQAB4R@shell.armlinux.org.uk>
 <b601263b-8363-432a-b6d7-504fabd37fef@www.fastmail.com>
 <YyWzlUnJds0Y1igM@shell.armlinux.org.uk>
 <CABb+yY0Bo3hs51KYTKvSYGHbzcO=p_s59fm=apevudxz5x3=Ew@mail.gmail.com>
 <YyXzaDIkCsjUkEcD@shell.armlinux.org.uk>
From: Hector Martin <marcan@marcan.st>
In-Reply-To: <YyXzaDIkCsjUkEcD@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/09/2022 01.18, Russell King (Oracle) wrote:
> On Sat, Sep 17, 2022 at 11:07:13AM -0500, Jassi Brar wrote:
>> On Sat, Sep 17, 2022 at 6:46 AM Russell King (Oracle)
>> <linux@armlinux.org.uk> wrote:
>>>
>>> On Sat, Sep 17, 2022 at 01:33:45PM +0200, Sven Peter wrote:
>>>>> On Sat, Sep 17, 2022 at 12:42:30PM +0200, Sven Peter wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On Wed, Sep 14, 2022, at 10:34, Russell King (Oracle) wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> This series adds support to the Apple rtkit for atomic messaging,
>>>>>>> which will be necessary for SMC support on these platforms.
>>>>>>>
>>>>>>> SMC support requires a bit of rework after recent review comments,
>>>>>>> so I'm sending this separately in the hope that we can move forward
>>>>>>> with upstream kernels.
>>>>>>
>>>>>> Maybe I misremember or maybe you forgot to pick up my reviewed-by tags
>>>>>> for the mailbox commits.
>>>>>
>>>>> It's the first time I've sent the mailbox commits after Hector
>>>>> mentioned them.
>>>>
>>>> There are just too many things in flight right now which is part of the
>>>> reason I'm happy you're trying to get all this upstream!
>>>>
>>>> https://lore.kernel.org/asahi/YxYoW2IZFK%2FJdKgH@shell.armlinux.org.uk/
>>>
>>> Hmm, I'd completely forgotten that I've posted it previously! Hmm,
>>> no response from Jassi on the previous posting despite nothing no
>>> action being required on the patches. Jassi?
>>>
>> Usually I let patches roast in public until rc7 but I sensed other
>> parts of apple support might depend on these.
>> So I picked patches 1 & 2 from this series yesterday.
>>  https://git.linaro.org/landing-teams/working/fujitsu/integration.git/log/?h=mailbox-for-next
> 
> Thanks!
> 
> Now I need to work out how we get patch 3 into mainline - there appears
> to be no maintainer for drivers/soc, so unless something happens, it's
> not going to be picked up...
> 

We own drivers/soc/apple, so I will pick that up (as long as it's
reviewed by someone else, which it is) :). Same with DTs for our platforms.

Those PRs then go out via the SoC tree. Please remind me if I haven't
picked it up and sent it upstream by Tuesday! (I need to get some sleep now)

- Hector
