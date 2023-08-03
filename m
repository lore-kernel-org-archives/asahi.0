Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09FE1548D
	for <asahi@lists.linux.dev>; Thu,  3 Aug 2023 11:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 744D9C433C7;
	Thu,  3 Aug 2023 11:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691062467;
	bh=BkBCAVO6hJF4fOYI49LffKk6yX883oqjF0w8sTjILWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PCN4VOz3vZBLDraC13sTD64yaF6fph11RxQKvykMl4hCLeo/Mp2kdRAiZpOEW6ZJt
	 J4yjrfMabuFRB3KQoiVcRr16WjNMUeKHSwU4FLnZKXlLW0GaqecUIb5A+4RrorDIj9
	 01z9y4b+Q3EtGsQ40QacmNiqyNppnNNkW6augIuTjLAqvLDDECY17WYR20sdLSKOmq
	 ts7l3E/hFl6cd3KIULc0UrO26H8ilbCBpVJf2ntUJx5BAYfNMDiHvx/+9clYABGBAr
	 K3E6tdhOWqQMkJCElhHOMXMkpTra8qDHfvk7H6ibRO6HsGcq5MUD0Now1l1YP3GbTb
	 c4N8uTN4J8Kyg==
Date: Thu, 3 Aug 2023 17:04:22 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dmaengine: apple-sio: Add Apple SIO driver
Message-ID: <ZMuQvhIg0AHH2e7V@matsya>
References: <20230712133806.4450-1-povik+lin@cutebit.org>
 <20230712133806.4450-3-povik+lin@cutebit.org>
 <ZMlLjg9UBi3QO/qV@matsya>
 <7D43A9F3-892C-4E74-9618-DB37360B7641@cutebit.org>
 <38B71067-7D67-41B7-BF49-87511BAA06CF@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <38B71067-7D67-41B7-BF49-87511BAA06CF@cutebit.org>

On 03-08-23, 10:32, Martin Povišer wrote:

> >>> +static int sio_alloc_tag(struct sio_data *sio)
> >>> +{
> >>> +	struct sio_tagdata *tags = &sio->tags;
> >>> +	int tag, i;
> >>> +
> >>> +	/*
> >>> +	 * Because tag number 0 is special, the usable tag range
> >>> +	 * is 1...(SIO_NTAGS - 1). So, to pick the next usable tag,
> >>> +	 * we do modulo (SIO_NTAGS - 1) *then* plus one.
> >>> +	 */
> >>> +
> >>> +#define SIO_USABLE_TAGS (SIO_NTAGS - 1)
> >>> +	tag = (READ_ONCE(tags->last_tag) % SIO_USABLE_TAGS) + 1;
> >>> +
> >>> +	for (i = 0; i < SIO_USABLE_TAGS; i++) {
> >>> +		if (!test_and_set_bit(tag, &tags->allocated))
> >>> +			break;
> >>> +
> >>> +		tag = (tag % SIO_USABLE_TAGS) + 1;
> >>> +	}
> >>> +
> >>> +	WRITE_ONCE(tags->last_tag, tag);
> >>> +
> >>> +	if (i < SIO_USABLE_TAGS)
> >>> +		return tag;
> >>> +	else
> >>> +		return -EBUSY;
> >>> +#undef SIO_USABLE_TAGS
> >>> +}
> >> 
> >> can you use kernel mechanisms like ida to alloc and free the tags...
> > 
> > I can look into that.
> 
> Documentation says IDA is deprecated in favour of Xarray, both look
> like they serve to associate a pointer with an ID. I think neither
> structure beats a simple bitfield and a static array for the per-tag
> data. Agree?

yeah xarray am not too sure. I would still go with ida, we will see when
it is relly removed.

If you need a bitfield why not use bitmap apis.
I dont like drivers implementing the basic logic which kernel provides

-- 
~Vinod
