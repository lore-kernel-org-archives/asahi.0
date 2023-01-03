Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263F28466
	for <asahi@lists.linux.dev>; Tue,  3 Jan 2023 14:56:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id EE5F741DF4;
	Tue,  3 Jan 2023 14:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1672757786; bh=JxObLc/qm6ouCvba+ko/0VFoVj+NMIFZ8pHIBxM2D20=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To;
	b=Y9Lw3GuNhDYbSLECBkDfYelRfYNUeIPCzNUZlNTewWRean55tCrPsG0VK8rVtUaon
	 GNt+PB+NFYVPSxe1+/t9TqPMjB71waj3JK0CegQtx4ialHrep6CJt5YKhLhN41iePC
	 f7AaJQ3QoejXCDvLVw7hqlxAtt2QgLAtiBgp4m4aDAPIYofip8A0FqsqMQHejc+MEU
	 3ZKxYI74o79FA8JrP0giWA/DDtBCeZ3UW+25Ecd/VAwUqiarT4XWIQes4Vf2fL1INL
	 MEAqz4lyBcrBtEwsqj+x7flQvaNu5Ya8nHPN+S9YBob6Zs1zPeB9Ens7CcPbTeshwT
	 wwdGCUHHK51zw==
Message-ID: <b98e313d-8875-056b-4b64-bb7528f2670a@marcan.st>
Date: Tue, 3 Jan 2023 23:56:21 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>, asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Eric Curtin <ecurtin@redhat.com>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20230103114427.1825-1-marcan@marcan.st>
 <ff77ba1c-8b67-4697-d713-0392d3b1d77a@linaro.org>
 <95a4cfde-490f-d26d-163e-7ab1400e7380@marcan.st>
 <b118af4c-e4cc-c50b-59aa-d768f1ec69ff@linaro.org>
From: Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v2] nvmem: core: Fix race in nvmem_register()
In-Reply-To: <b118af4c-e4cc-c50b-59aa-d768f1ec69ff@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/01/2023 23.22, Srinivas Kandagatla wrote:
>>>>    drivers/nvmem/core.c | 32 +++++++++++++++++---------------
>>>>    1 file changed, 17 insertions(+), 15 deletions(-)
>>>>
>>>> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
>>>> index 321d7d63e068..606f428d6292 100644
>>>> --- a/drivers/nvmem/core.c
>>>> +++ b/drivers/nvmem/core.c
>>>> @@ -822,11 +822,8 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
>>>>    		break;
>>>>    	}
>>>>
>>>> -	if (rval) {
>>>> -		ida_free(&nvmem_ida, nvmem->id);
>>>> -		kfree(nvmem);
>>>> -		return ERR_PTR(rval);
>>>> -	}
>>>> +	if (rval)
>>>> +		goto err_gpiod_put;
>>>
>>> Why was gpiod changes added to this patch, that should be a separate
>>> patch/discussion, as this is not relevant to the issue that you are
>>> reporting.
>>
>> Because freeing the device also does a gpiod_put in the destructor, so
> This are clearly untested, And I dont want this to be in the middle to 
> fix to the issue you are hitting.

I somehow doubt you tested any of these error paths either. Nobody tests
initialization error paths. That's why there was a gpio leak here to
begin with.

> We should always be careful about untested changes, in this case gpiod 
> has some conditions to check before doing a put. So the patch is 
> incorrect as it is.

Then the existing code is also incorrect as it is, because the device
release callback is doing the same gpiod_put() already. I just moved it
out since we are now registering the device later.

> These are not stupid nit picks your v1/v2 patches introduced memory 
> leaks and regressions so i will not be picking up any patches that fall 
> in that area.

v1 certainly had issues which you rightly pointed out. Now with v2 you
are nitpicking that I merged two codepaths that belong together, and
fixed a corner case bug in the process. If there is an actual problem,
please point it out. "Lol why did you fix this other bug that naturally
falls into the influence of the changes being made" is not constructive.

>> found a bug, I fixed it, I then fixed the issues you pointed out, and I
>> don't have the time nor energy to fight over this kind of nonsense next.
> 
> I think its worth reading ./Documentation/process/submitting-patches.rst

Oh I've read it alright. You're not the first maintainer to have me lose
more faith in the kernel development process, this isn't my first rodeo
(hint: check MAINTAINERS, I'm also a maintainer). And I know it doesn't
have to be like this because other maintainers that are actually
reasonable and nice to work with do exist.

I'm going to note that right now this core subsystem code is broken in
the *success path*, while all the arguments here are about the *error
path*. In other words, there is a negligible change that any
mistakes/regressions I'm making here would actually impact people, while
the status quo is that the code is actively breaking people's systems.

So, are you going to actually point out the supposed regressions with v2
so we can actually fix this bug, or should I just drop this submission
and keep it in my downstream tree and you can continue to get bug
reports about this race condition?

- Hector
