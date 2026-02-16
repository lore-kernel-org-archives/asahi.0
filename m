Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17FA27FB3E
	for <asahi@lists.linux.dev>; Mon, 16 Feb 2026 09:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771232702; cv=none; b=dlZ+xnhRNnuv+8FJzwkix3EEyPPw1Da/SweTsW7Hk7OyaktyxR0wAWn2ywGEZqVUx91c2Zb2BxgdbvM+415NrY0eWNA4hEhfIiEN3p1BGKl8YOIuRm3LGn28Zvs57IqltSTo90CKMj84cMMnS1dlqDc/a+CFTcJKAOfiE9RIWmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771232702; c=relaxed/simple;
	bh=38J3gPJENWo9tLMeXIYSN25dnAKHmMqv4zScsC3rwYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EyZ7eknFD2ItymAgKh3kKdQfJ+spApF8q43ExfuJrFjGsR8XX/+MQCDnc0e6qfTcDkNB87du94VdXjq5huj1eajAM4j9VwzSpX9zijhY4bw99w1d5WnMBzdUB/10n+4gV2kO8MzjjvTvRSqba4fxokt+CWd0lF5oue45uQm18Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lpK58N0H; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lpK58N0H"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4359c54b682so261695f8f.3
        for <asahi@lists.linux.dev>; Mon, 16 Feb 2026 01:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771232699; x=1771837499; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=em6VPs2GZRn54p6b2nYQwPaDQws0EFVjZBMU1Ysa5Vc=;
        b=lpK58N0HyPnfl3KtSInRXyQ2fKDPE0ukyeXBRDAkg3f6E+sxJAlooE6abgPPpuI9kU
         ocjBvWqPLRjCpUpT/Q7mZnjzPVoZ3n7+Vy7M76yngTvyjd8eDAJvWmZZFYlMue2g89zv
         dcVslBSb3izJslpN3MD/m8m3LDVPqd5/Z1IX5BPjm0H5wLCL83EScnwXOxW3FJdZvVl3
         Um7HguIEY0B5/C7Qfn2vdIXqbKLFnDtu/EUgybBTP5R0pQdk0+6osXi+EzNewJ5bIYV+
         3jiTXzbtSEB+jOKRrwl0vRzBLw6RZcjOxKBXLgHGCTZioZpGQ7IQorYCc+S1czTxEwi4
         E4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771232699; x=1771837499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=em6VPs2GZRn54p6b2nYQwPaDQws0EFVjZBMU1Ysa5Vc=;
        b=S8xXN4SjxFL83EG+W8NZzWVA02gSr2bGck1yDqxan57BmJs0AlcUzXDqwrZD5YugKI
         q4eolAr+xeQqypWFCsCiwjIc/IGmD+PSynRsPcOBghVInzNaAzydOXPYdudtQ3paxcKy
         /ELsmNGE6/v+X4x5MouZtBddJVPDZdD1+uxqPPNHt4U/rkX0Q2Ut6rbtqvUXN78vdR7L
         f3WetPyZDtplgI0gxUocWSnXnDyVzQRiM7Iqla9C7aqezTUWbmLRnvZm0D2xyWwAeZsk
         cFFQhBi63NsGiLumdBkXaAYLEWJo/0KlnbaoqjW+TBRhg+5c9AscVQJTCAxTSKiDJKNp
         80iA==
X-Forwarded-Encrypted: i=1; AJvYcCVGRSdzFHWEw1AXdpA5hT279q3G8V9ho62s5SJePiP7ZdIJvHoOHxfwUTHiKKSSe7WnbkcZYw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzq1f/E++mIqpWEQAgBPE4jUs0GydgnTD/zFF8m417EFfaI6o7N
	F0JCGpgdgq5v3SLcXzq20CHl5BAYBA2WVwXBj266VyGZjKpw1EPT1dTK
X-Gm-Gg: AZuq6aJe6oS+inUW7v86NKeWx1itMpJ13imEFBeFphKBy6cGIgDawQhxeSPDCZhgmWl
	J43G8xE7WYAgHK687OlWd/h/TY/zV2Q6tETTYnpQkZ17rYJOr9HUIBEbWKwHlw5qkB0sxA/NPV8
	CtJwPwX/mTAFojIy3KeA14Ju7f31ardAp/SJr/UM42bg8x65aWlY7tVdmb71213xvbBzmjI1AOU
	uQYfrCclu+yzitSLAXcLUOicKath+FT1wGZ6oQ2R+Fi2UtPMG+WCHEmro0vissxFKj8v40WFHeD
	sUmFHgeVv1kySAtaN3IUzG2D0ydqUn6SSY3ZSHAq/95JtC34xgBqYWnZSjBWxUs4Rw8G+Fjyex7
	7r6OJBY061O8xkpeCiaCGPpYRpNhcm2asslH88IKVr7zmNC5av3xe80jytjYxKVDqdwih6iquWn
	LOgWRlE9ZKLXXsRg==
X-Received: by 2002:a05:6000:2508:b0:437:72ce:8954 with SMTP id ffacd0b85a97d-43796af4d32mr10923244f8f.6.1771232698983;
        Mon, 16 Feb 2026 01:04:58 -0800 (PST)
Received: from skbuf ([2a02:2f04:d501:d900:68e2:cc27:74c:c083])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac8075sm24922456f8f.29.2026.02.16.01.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 01:04:58 -0800 (PST)
Date: Mon, 16 Feb 2026 11:04:56 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, asahi@lists.linux.dev,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH phy-next v2] phy: apple: apple: Use local variable for
 ioremap return value
Message-ID: <20260216090456.23oko4jx5bcahq3p@skbuf>
References: <20260215-phy-apple-resource-err-ptr-v2-1-e43c22453682@jannau.net>
 <20260215-phy-apple-resource-err-ptr-v2-1-e43c22453682@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260215-phy-apple-resource-err-ptr-v2-1-e43c22453682@jannau.net>
 <20260215-phy-apple-resource-err-ptr-v2-1-e43c22453682@jannau.net>

On Sun, Feb 15, 2026 at 09:02:51AM +0100, Janne Grunau wrote:
> The indirection through the resources array is unnecessarily complicated
> and resuling in using IS_ERR() and PTR_ERR() on a valid address. A local
> variable for the devm_ioremap_resource() return value is both easier to
> read and matches expectations when reading code.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/asahi/aYXvX1bYOXtYCgfC@stanley.mountain/
> Suggested-by: Vladimir Oltean <olteanv@gmail.com>
> Fixes: 8e98ca1e74db ("phy: apple: Add Apple Type-C PHY")
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> Changes in v2:
> - Use a local variable instead of the complex indirection with the
>   resources array
> - Link to v1: https://lore.kernel.org/r/20260207-phy-apple-resource-err-ptr-v1-1-78735b07ed2d@jannau.net
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

I hope this can be picked up for the linux-phy PR.
