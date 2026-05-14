Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC9D3BB102;
	Thu, 14 May 2026 13:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778764836; cv=none; b=NdPP2d7Px6PCq9/6wP9JgsqUfhufW3jp2cg4iU1/JM/wuWzjE6avAt9gIKswVATqHZPAfawzt3HpAJxtPIr4hjC1Z1xeHUpaIE0vagDi1rl0mEbB7/Oo9CYrc5Q5EOOfa16fTwo06whLeyMTwok4E2GD3f4yg+laYEPyQY4bXqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778764836; c=relaxed/simple;
	bh=Ew8sNdAbDD8HHEiNp0fXLa+xg171HJQFiqRZFuz8RFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oxYzAGSmGn/9YdQJckWzn3VXyfp0zF3SfSkA+FSfEnSttYXEto9WTVujFh3zXRE/03A5QxbeZIf2eI/Y/OquZa+5ei6kl/joiURohtUci8KBjEwsJYt4YLeMFYrKqLpKqa/tQftfUQzSVPwiCztBOoA/VrBmLGQf9IVXlVj4SGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=erX1Qk10; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="erX1Qk10"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C86AAC4AF09;
	Thu, 14 May 2026 13:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778764836;
	bh=Ew8sNdAbDD8HHEiNp0fXLa+xg171HJQFiqRZFuz8RFU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=erX1Qk109xYnrUQD5Mk4e4ChE8Rq1Yv/VqiVCMa/5WNPWBEqbPWUh+JXeKzRKF+p6
	 ZbDYgVG9K/XBnqmST25y63M/R0AevoCy0CkXAV+05fTJptggAIi82SMu0cPcKj8XFX
	 9jRj99BAHCUADFyibthoOQW+qv+q2cA13ObhU0O72TAbTalC8Pjjp5+5YAdsrcvyrL
	 b1yHZvyOY/33xhsJOKe0vKHwi7G92t9eh5lMr4K+EjJo6Ym8jv96eihN03yZNdwNW5
	 MdfB5GsWkR2efsD758PSPpqQ+gE93ysJggEtoNPXgB576AyPWzcWLKcqLqqc72PZTL
	 wVspT8u7MFK8g==
Message-ID: <8e29246e-cb29-4eb2-86ca-8e0b8e3f601c@kernel.org>
Date: Thu, 14 May 2026 15:20:31 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] nvme-apple: Reset q->sq_tail during queue init
To: Nick Chan <towinchenmi@gmail.com>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Yuriy Havrylyuk <yhavry@gmail.com>
References: <20260514-nvme-apple-sq-reset-v2-1-84cbb5c70bf5@gmail.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260514-nvme-apple-sq-reset-v2-1-84cbb5c70bf5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14.05.26 15:16, Nick Chan wrote:
> Fixes a "duplicate tag error for tag 0" firmware crash during controller
> reset while setting up the admin queue on Apple A11 / T8015.

... caused by stale entries in the submission queue due to an invalid 
sq_tail offset after reset.

And I guess this also happens on the i/o queue and is fixed by this as 
well, isn't it?


> 
> Fixes: 04d8ecf37b5e ("nvme: apple: Add Apple A11 support")
> Cc: stable@vger.kernel.org
> Suggested-by: Yuriy Havrylyuk <yhavry@gmail.com>
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---


Reviewed-by: Sven Peter <sven@kernel.org>



Best,


Sven


