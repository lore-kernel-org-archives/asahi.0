Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8922D2F22
	for <asahi@lists.linux.dev>; Wed, 19 Oct 2022 13:03:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F7EC433B5;
	Wed, 19 Oct 2022 13:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666184634;
	bh=1pJqOYVy1IE3XFK2kqEPNoZQxLsiC1mKsFJO7efGQnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gaLH3ZvDOut/bfSvsAl07g5wMe09OCvgQfuVrm4YEsImGp+uwHdo8vDShr5cVYe+D
	 x7fvKalEnV5jXy/+AteUCXd0tyXGksC7gL+UZ5z3qzaQzdMVsRrV+oEXmjR45cbdUp
	 GmT1FMoCvO85VVUrGaqC5p9DwakYG8Ps3Aejr+hv7loqeLAKJPEYJxnSseMM89oFxB
	 gJmXJro4lPmBsmpQ0sGNxzC34GXRWUhkFTHADR7uFdHv4CZMZ9ze7PNFs/cungC3Vt
	 ZZL9ujGqdrMd0gPZ72ff6KuKfyxLU+I4C6bv/WhG5spg5FRnjsu7DcPCKtA6KmbQTm
	 EP8scwNGBzhZg==
Date: Wed, 19 Oct 2022 18:33:49 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: asahi@lists.linux.dev, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 2/2] dmaengine: apple-admac: Allocate cache SRAM
 to channels
Message-ID: <Y0/1tfNX1hwX6EFk@matsya>
References: <20221003081053.1826-1-povik+lin@cutebit.org>
 <20221003081053.1826-2-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221003081053.1826-2-povik+lin@cutebit.org>

On 03-10-22, 10:10, Martin Povišer wrote:
> There's a previously unknown part of the controller interface: We have
> to assign SRAM carveouts to channels to store their in-flight samples
> in. So, obtain the size of the SRAM from a read-only register and divide
> it into 2K blocks for allocation to channels. The FIFO depths we
> configure will always fit into 2K.
> 
> (This fixes audio artifacts during simultaneous playback/capture on
> multiple channels -- which looking back is fully accounted for by having
> had the caches in the DMA controller overlap in memory.)

This fails to apply for me, please rebase and resend...

While fixing, I think it would make sense to s/alloced/allocated perhpas

and also fix the indent in split lines to align with preceeding brace
(hint checkpatch --strict would tell you)

-- 
~Vinod
