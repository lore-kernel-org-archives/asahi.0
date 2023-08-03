Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082FE13FE3
	for <asahi@lists.linux.dev>; Thu,  3 Aug 2023 11:25:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95E9FC433C8;
	Thu,  3 Aug 2023 11:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691061948;
	bh=42OIzEptMa6drEW3K5eEpD6aaOKTvmXN6uoP8zn4eZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NqQfanK4cMycgyR2C5Aq5UnEX+S5/Uaatl0T69ek29TbeBGXIA7G8+eYXjTzEfXZJ
	 AVOgSl7KyBLvZis0Zel0nBncPP8gaNpTodnmQ2YIJ8XLyCrtAFiwY87qSObX0HRq97
	 tBeeMJHtBbDIhXolfqFYTyiH9sVE0oK4vdzFLPBLpXCfdcR8Eia8dsz6RsCJIAh/YB
	 Fclfh7kG9uuBlu61uwIPS/ZNGtlSz+wCjlr9P17qgqse7OyJLrdPO4eAu9dicipc34
	 YbTKdCiM+Pig0cCx/z6ojtNXphlH8GAv0Uan4qIJpX84nRTouM54Z9vcZcK1KNsahV
	 zxr3o3MDv20tw==
Date: Thu, 3 Aug 2023 16:55:43 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dmaengine: apple-sio: Add Apple SIO driver
Message-ID: <ZMuOt2THchrNDjDH@matsya>
References: <20230712133806.4450-1-povik+lin@cutebit.org>
 <20230712133806.4450-3-povik+lin@cutebit.org>
 <ZMlLjg9UBi3QO/qV@matsya>
 <7D43A9F3-892C-4E74-9618-DB37360B7641@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7D43A9F3-892C-4E74-9618-DB37360B7641@cutebit.org>

On 01-08-23, 23:55, Martin Povišer wrote:

> > can you use virt_dma_chan, that should simplify list handling etc
> 
> I looked into that when I wrote the sister driver apple-admac.c, I don’t
> remember anymore why I decided against it, and I don’t think it came up
> during review. Now that this driver is done, I hope we can take it as is.
> 
> There’s some benefit from the drivers having a similar structure, I sent
> one or two fixes to apple-admac for things I found out because I was
> writing this other driver.

And this would be a chance to covert the other one and get rid of list
handling code in that driver as well

> 
> >> +};
> >> +
> >> +#define SIO_NTAGS		16
> >> +
> >> +typedef void (*sio_ack_callback)(struct sio_chan *, void *, bool);
> > 
> > any reason not to use dmaengine callbacks?
> 
> Not sure what dmaengine callback you mean here. This callback means
> the coprocessor acked a tag, not sure how we can fit something dmaengine
> onto it.

Okay lets understand, how is this one used

-- 
~Vinod
