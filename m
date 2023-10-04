Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D8915E82;
	Wed,  4 Oct 2023 13:46:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13389C433C7;
	Wed,  4 Oct 2023 13:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696427166;
	bh=HFpyoczoeu93B+eyyu6aLGqXz6EFGkxrIUbFli4Gm9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R9wnh80R+hyC3UCzgdQOevuIaFw10AHaxEtnkhDeM9CZVHt5suUFQbRfVqoBG0NfN
	 YvOVJtocj4W1zPS5tY6h++IK+YC1Ry+VQly3iHEyBj7oVIcj8BOfNh9YghmGBR93iG
	 HA0npNiH6hS+aZsvwYuw2W9obVnKMSlfhaX7kB4E8HG2/y41qD4PUMKOg90/BNtC30
	 D2w/qzlxcwEi3KLRV3G3wn7adzEFWgnVyzBz7qoT5wbTwvrpaFPBsUU5aZr5BrRoDT
	 qGoKCmg4yFlxJaxIh/WBQ8KxBZSUj1sZYCthploXGKeZyjKmeEN/O/HIzd4ZZ3PK2L
	 DUyDfQY1PhKGg==
Date: Wed, 4 Oct 2023 19:16:01 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dmaengine: apple-sio: Add Apple SIO driver
Message-ID: <ZR1smXBXyx7xDEmg@matsya>
References: <20230828170013.75820-1-povik+lin@cutebit.org>
 <20230828170013.75820-3-povik+lin@cutebit.org>
 <ZR1kz7Sil8onc1uC@matsya>
 <06444557-414A-4710-88A0-620975BB258A@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <06444557-414A-4710-88A0-620975BB258A@cutebit.org>

On 04-10-23, 15:32, Martin Povišer wrote:

> >> + * There are two kinds of 'transaction descriptors' in play here.
> >> + *
> >> + * There's the struct sio_tx, and the struct dma_async_tx_descriptor embedded
> >> + * inside, which jointly represent a transaction to the dmaengine subsystem.
> >> + * At this time we only support those transactions to be cyclic.
> >> + *
> >> + * Then there are the coprocessor descriptors, which is what the coprocessor
> >> + * knows and understands. These don't seem to have a cyclic regime, so we can't
> >> + * map the dmaengine transaction on an exact coprocessor counterpart. Instead
> >> + * we continually queue up many coprocessor descriptors to implement a cyclic
> >> + * transaction.
> >> + *
> >> + * The number below is the maximum of how far ahead (how many) coprocessor
> >> + * descriptors we should be queuing up, per channel, for a cyclic transaction.
> >> + * Basically it's a made-up number.
> >> + */
> >> +#define SIO_MAX_NINFLIGHT 4
> > 
> > you meant SIO_MAX_INFLIGHT if not what is NINFLIGHT?
> 
> I mean the number is arbitrary, it doesn’t reflect any coprocessor limit since
> I haven’t run the tests to figure one out. It's supposed to be a small reasonable
> number.

Sorry that was not my question. Should this macro be SIO_MAX_NINFLIGHT
or SIO_MAX_INFLIGHT..?

> >> +static int sio_device_config(struct dma_chan *chan,
> >> +      struct dma_slave_config *config)
> >> +{
> >> + struct sio_chan *siochan = to_sio_chan(chan);
> >> + struct sio_data *sio = siochan->host;
> >> + bool is_tx = sio_chan_direction(siochan->no) == DMA_MEM_TO_DEV;
> >> + struct sio_shmem_chan_config *cfg = sio->shmem;
> >> + int ret;
> >> +
> >> + switch (is_tx ? config->dst_addr_width : config->src_addr_width) {
> >> + case DMA_SLAVE_BUSWIDTH_1_BYTE:
> >> + cfg->datashape = 0;
> >> + break;
> >> + case DMA_SLAVE_BUSWIDTH_2_BYTES:
> >> + cfg->datashape = 1;
> >> + break;
> >> + case DMA_SLAVE_BUSWIDTH_4_BYTES:
> >> + cfg->datashape = 2;
> >> + break;
> >> + default:
> >> + return -EINVAL;
> >> + }
> >> +
> >> + cfg->fifo = 0x800;
> >> + cfg->limit = 0x800;
> >> + cfg->threshold = 0x800;
> >> + dma_wmb();
> > 
> > ??
> 
> Again, shared memory
> 
> >> +
> >> + ret = sio_call(sio, FIELD_PREP(SIOMSG_TYPE, MSG_CONFIGURE) |
> >> +     FIELD_PREP(SIOMSG_EP, siochan->no));
> > 
> > this does not sound okay, can you explain why this call is here
> 
> We are sending the configuration to the coprocessor, it will NACK
> it if invalid, seems very fitting here.

I dont this so, purpose of the device_config() is to send peripheral
config to driver for use on the next descriptor which is submitted. So
sending to co-processor now (when we might even have a txn going on)
does not seem right

What would be the behaviour if already a txn is progressing on the
co-processor

-- 
~Vinod
