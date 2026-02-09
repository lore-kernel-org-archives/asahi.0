Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D6938552A;
	Mon,  9 Feb 2026 16:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770655585; cv=none; b=iUltcoc72LJn3bQOlWzGHKADOL1VN56HlsWViX9Io2+PtixMkdh+e5XByPL/5SlhpCqoVOuluYDEbmDojCajQQCh2Wr2UpAm5FFe5SusxaNwUoOAK8+zdlLSuPmeE9Rp6aWxlCNScWTeTFGQJCTBojU+gn+OmFbptPrq7Rp0lSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770655585; c=relaxed/simple;
	bh=yvJm2CvDj9npboW4Dn1BKbYvXBkODW928Si+6fskTsY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CMv/5VZItL0THzzm1jqovAYblEj6ny2Kd8nPBFbMnbWqcOvSYOOO+fWSO8D+kL5l9OnQ4NucJa8CNvAAkhVcQEY43OYJkHNhm+22LCNLzhZoEhrZxg3IZ9By9hPxkGUN1yjqevt89jhplHUHdvq0MRLpwQRibqiKrfQLFN7Po4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SRGR6rL9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SRGR6rL9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAB00C116C6;
	Mon,  9 Feb 2026 16:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770655584;
	bh=yvJm2CvDj9npboW4Dn1BKbYvXBkODW928Si+6fskTsY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SRGR6rL9Pn6t0eHoetOURp0COinD0ABrAn4szb9u5wx0thhJG9RTRMwoU60cFABci
	 6beSeSYyOkwR1px8jYcWyHFHEVmrivDkA0ExBJ7jmKzEPxOgZCloNzbZpI3szuNT3n
	 i1CaKkWul8HahINuQ9bGDmYeiyeBBr9NMAhzH3JWhLivwehKmd0pBfGWorPXOSUUwd
	 CaToEvLSAbiEo5d+huOmV9A3SS1E9sbtRIyBd8J7dOJMZuBUhls/+yVGMotwTjehmw
	 2xJtpeC+h66gFSt/J80fXliNueF858dkPVeAdK52p14DjWNEOPJ+Z+CzhB8UIJmijt
	 K8brcSi1I1E7g==
Message-ID: <d476ecff-03fc-4520-a228-662aa6752733@kernel.org>
Date: Mon, 9 Feb 2026 17:46:20 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH phy-next] phy: apple: apple: Check the actual ioremap
 return value
To: Janne Grunau <j@jannau.net>, Vinod Koul <vkoul@kernel.org>
Cc: asahi@lists.linux.dev, Neal Gompa <neal@gompa.dev>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20260207-phy-apple-resource-err-ptr-v1-1-78735b07ed2d@jannau.net>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260207-phy-apple-resource-err-ptr-v1-1-78735b07ed2d@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07.02.26 17:40, Janne Grunau wrote:
> The address where the devm_ioremap_resource() return value is stored is
> always a valid pointer. Check the actual return value instead as that
> that might be an error value.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/asahi/aYXvX1bYOXtYCgfC@stanley.mountain/
> Fixes: 8e98ca1e74db ("phy: apple: Add Apple Type-C PHY")
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---

Reviewed-by: Sven Peter <sven@kernel.org>


Thanks,


Sven


