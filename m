Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4B828D8DB;
	Sun,  4 Jan 2026 12:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767528322; cv=none; b=TpVa66mzmvD9UdOpdMYd3F9Hjjk2UviuLsmXLeoSaVfONyzmOYTNFpl/zBiC6cjLsnWpUrNgprkNesg+IOi9pGPd34zO5UOMHbEFMFn3ElRLr0ImOP3NFi4n25nBunjqxnNQZ7Fj1zrHqQoKrOOPtFZbfWUO7WQ55RQSNWmVtS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767528322; c=relaxed/simple;
	bh=p3dhNZI9rOps7CoI5KuesqaPCNZpJmogIoq7MYMTt7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ex/9FcxwyCBdg9pQ59eISWRRfQSLO6LZj3hCPxQjgj5bASvuDt+k1KnVVm9AKZNBQTEuYleG2etwHj34cbaKwQxQr3M89+6o5w03gbEYeVLuHiboiLc+nAjFD8XC7YSuaytmscZXZunUYn9yLYKLmosoCU70Zv+5/By9KKdEvxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e9tX/yfC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e9tX/yfC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D3F4C4CEF7;
	Sun,  4 Jan 2026 12:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767528321;
	bh=p3dhNZI9rOps7CoI5KuesqaPCNZpJmogIoq7MYMTt7Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e9tX/yfCYxNAiSslgxkqmar83uwhD7Ubn6JaekOIRBp1FkQTYu482iYJAb0FUhDGi
	 H14gQSqeH017UhuBc+aIouiYQw25oNRUPtjiuut5wrU42YoNtl15SrDz9zeKzEdcxH
	 BNj1zfQAqIVPOGQNpiuQRFx+r+pPdAiTMOww9cFf5BqiQE4jWkLaTTwli2yYRPtHMB
	 pX/blpDqkPhulRGgcu4fT0dAsX3COwUU308gwyviKQ4bEzEJXc8MGHCeeGooRctIKU
	 0G3taORlmjytXOdKOgt386KNQjPqs/uZyTpaqe8T4nuNbVU6Tj6m8tiCjx7V5+F9fN
	 +bpDHGeoqXtjQ==
Message-ID: <bb7d80e5-20f8-444f-938c-b0ce53357fd2@kernel.org>
Date: Sun, 4 Jan 2026 13:05:18 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mfd: macsmc: Initialize mutex
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Lee Jones <lee@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20251231-macsmc-mutex_init-v2-1-5818c9dc9b29@jannau.net>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20251231-macsmc-mutex_init-v2-1-5818c9dc9b29@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31.12.25 10:42, Janne Grunau wrote:
> Initialize struct apple_smc's mutex in apple_smc_probe(). Using the
> mutex uninitialized surprisingly resulted only in occasional NULL
> pointer dereferences in apple_smc_read() calls from the probe()
> functions of sub devices.
> 
> Fixes: e038d985c9823 ("mfd: Add Apple Silicon System Management Controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> Changes in v2:
> - rewritten commit message
> - added missing Cc: stable
> - rebased onto v6.19-rc1
> - Link to v1: https://lore.kernel.org/r/20250925-macsmc-mutex_init-v1-1-416e9e644735@jannau.net
> ---

Reviewed-by: Sven Peter <sven@kernel.org>


Thanks,

Sven

