Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D363B5395
	for <asahi@lists.linux.dev>; Thu, 29 Sep 2022 16:14:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3966C433B5;
	Thu, 29 Sep 2022 16:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664468080;
	bh=N/dxcUsikEjlv9lELYdCoUo6xsUVTNhUjYMniWeGUlg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JL6YYK+kRd+FBXxO+1TFstS9lD1vl7jXboq9MO8AuSpc2uBNAZpgzwap787vx/Dl0
	 VqL3KLSZgNf5EPYTiDhdDMFll+98CTM1gEj2m7VQqGMmkDukEmU7sO72B0jKlEFD7J
	 ApMdpyn7F9idP0xe/QU3y4CV+rsrpeaXGYyrIHmP/V7uq4S02+ls9awsTX8hfJNf1e
	 +Qn26Z4Vn8uHtOXx4kVQNF96pYrc7AE25rLBbiz7nIEVj0ALruVJ7xPxMaesClkVKC
	 Vce7xMUEK/eygKKq4eMbenzCuhskCVSnCpXqCSUirluN5GCERvcVgOHlSHVzlFiZR8
	 SVWqAkXQPoYmA==
Date: Thu, 29 Sep 2022 21:44:36 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dmaengine: apple-admac: Do not use devres for IRQs
Message-ID: <YzXEbI7D+Z+YzwDJ@matsya>
References: <20220918095845.68860-1-povik+lin@cutebit.org>
 <20220918095845.68860-4-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220918095845.68860-4-povik+lin@cutebit.org>

On 18-09-22, 11:58, Martin Povišer wrote:
> This is in advance of adding support for triggering the reset signal to
> the peripheral, since registering the IRQ handler will have to be
> sequenced with it.

Applied 3-4, thanks

-- 
~Vinod
