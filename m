Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB9C333427;
	Thu,  8 Jan 2026 21:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767906906; cv=none; b=rTTc3M1jLl+k2ntoc7odImOE720OaUHyeCFGuhb+P7O7n6FGvGH17ZAMZ+E8kbI9Uxv0QXQWCYisXG1zkD3Q3+esky1FeZo7j1DPG03zfkDTh6eq7y4aoKLvO3mlAB+YK484FRGZSqHz2DfZlkn/rZXKpfqkqBAk37kwRa6Cnls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767906906; c=relaxed/simple;
	bh=FYItuciEvFj6YCFlj2vV0fO7QS8ZeMzmtjFPAelyWz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bM205yNYnTDfbqZJKl76w5j22OzS/5A5MvkPvUfw9ibhGrf/tBpa6/pruWakrjqOS4EbobDuQSgQe7xYNYT4LuiARMlR3P+4jGhKNI7TeoiazdJdUnmUQY4VTykTKM1tmp379uY2Yi1HnGOedlXfyqEtzn4IcMgUGj+GAxLa/fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lPfzE15J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lPfzE15J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0DFEC116C6;
	Thu,  8 Jan 2026 21:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767906905;
	bh=FYItuciEvFj6YCFlj2vV0fO7QS8ZeMzmtjFPAelyWz8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lPfzE15J/ZLXfaTFsco+lkGWh8yEpmg5YdHYs8YSUZu/kjsFTxMmGeSSvTW7Y9UhF
	 0XpXu/SvD0UrrJjCg8YPvUtgRTkAq5vgxAt2o227owuSIRZXIyrf6drcryR9sAjtzt
	 CidZQGthYX9ML0+NrvQUdj2LJtYD28/ODGscHLh0ErxvX7NtlYAPbP0WXOMjzWZblu
	 Xte/BvahItZX8ZpiUqiRIqBoqptmAQpHRK9H35OyjK1ErWx1QTQTaA7Cl33SExT7R/
	 c7zLyZTpVEsC7vf9rf2s+jyBjY5QGEY6mWodUm1ODl0ckN+eulYIrhCA2pl961GW1P
	 2o3bTO/v9b8WQ==
Message-ID: <50608fda-e720-4d9c-8f88-cdb43affbb25@kernel.org>
Date: Thu, 8 Jan 2026 22:15:01 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: apple: t8103: Mark ATC USB AON domains as
 always-on
To: Janne Grunau <j@jannau.net>
Cc: asahi@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Neal Gompa <neal@gompa.dev>, linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>,
 Rob Herring <robh@kernel.org>
References: <20260108-apple-dt-pmgr-fixes-v1-0-cfdce629c0a8@jannau.net>
 <20260108-apple-dt-pmgr-fixes-v1-2-cfdce629c0a8@jannau.net>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260108-apple-dt-pmgr-fixes-v1-2-cfdce629c0a8@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/8/26 22:04, Janne Grunau wrote:
> From: Hector Martin <marcan@marcan.st>
>
> Shutting these down breaks dwc3 init done by the firmware. We probably
> never want to do this anyway. It might be possible remove this once
> a PHY driver is in place to do the init properly, but it may not be
> worth it.
Even with that PHY driver now in place we still need this. No need to 
resend to fix the commit description, I can do that when applying the 
series.


Sven



