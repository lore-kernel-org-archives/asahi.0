Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8D6258B
	for <asahi@lists.linux.dev>; Fri, 31 Mar 2023 12:47:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79021C4339B;
	Fri, 31 Mar 2023 12:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680266854;
	bh=x8TnEdhqK1xKEhcGbEgZoX2KmNiKogEIGPV8CmLXuBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UaKxVDl9WKCzZhclbtxVpSYFRPHqUv7Mv2qvA3/80KTMooErvoYSltw4fc/eHcXKq
	 dZBQkrIaat4hShpNTlXg0ydUNMYJd8Vhct0SX3yTy8mmgTgdCV10XrWXVvK7X4hQEn
	 9WymsrM/TGNAzwdTvNyHmrVFHGNSfqFU8SeKtlTkBion1PxWxpgiFM84MeaCMJy5Oe
	 aXyGsTYVf2EfLT3GqvX9EkIOqqmtiWuBm+1YRcPFVQGsCikfw+Jzc9O8MwYWHY1Wrn
	 dmiR/y3LUBGyg/eCGKyHMu8NJB0bsqS7Kkx9EdvRlFxsIBARzIZWD766Nd+TPsyuNb
	 4ihSzjKPJcP7w==
Date: Fri, 31 Mar 2023 18:17:29 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dmaengine: apple-admac: Handle 'global' interrupt
 flags
Message-ID: <ZCbWYR9LbGFw7S0A@matsya>
References: <20230224152222.26732-1-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230224152222.26732-1-povik+lin@cutebit.org>

On 24-02-23, 16:22, Martin Povišer wrote:
> In addition to TX channel and RX channel interrupt flags there's
> another class of 'global' interrupt flags with unknown semantics. Those
> weren't being handled up to now, and they are the suspected cause of
> stuck IRQ states that have been sporadically occurring. Check the global
> flags and clear them if raised.

Applied, thanks

-- 
~Vinod
