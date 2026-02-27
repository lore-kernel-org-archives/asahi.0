Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576DE43DA3E;
	Fri, 27 Feb 2026 15:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772206170; cv=none; b=eRUmp7xgh+3+V2TkKELiXsqr5/v4U0HPm9XhIvRJ1mG5gEgB3UMgH3sT+YS2kaHxE4j6Q8o+YkgLHLejrNfCD6H14QtrEtkC/jElunIKu0w636lGaPMfRFGYDNQ6SpiD7/XtF+bRYrFV+gXmdErYWJnWOriwc6E0CggZm/tqQ9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772206170; c=relaxed/simple;
	bh=O/q+TFseq2hzCJfcTUGyfDbN1lRfrdm/shZP4tSCQKY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=W9J/rGUA//6vHv6otgSV8rOnHeoU74tEqC6iSPYqbTVJF9JEQNaEPeSgGJPwix2EhKKwpSky05zT5WtcPDlLuMwRLpx5czo1g3shqLCLs/JaDj9AJVqi0GSivBq4BjTurTsVmkiQeyA0fApCzSRpbeAOMUWrTo8/O5s4BBqgqvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NufdE3Hq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NufdE3Hq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D5F0C116C6;
	Fri, 27 Feb 2026 15:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772206170;
	bh=O/q+TFseq2hzCJfcTUGyfDbN1lRfrdm/shZP4tSCQKY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NufdE3Hq78VHJsKfkOBnnvEn6PQyOYzTyvw/Sn3LImY1RlF0VKi0oE6gn/KR4lzw1
	 5c2ZfT7Ajfb4ENbYw7vqZ0tFgNtG7O/uhOU3V4rFrkLig2HQHl5jnZBRKZJN7KBKqq
	 bV7LxFr/7Hoqi4JNB5BNpshmLV5aIAk0kf54bsJpCFVilWL7RMSIhEeHbaxLndjsbk
	 K/KQY02ZeEX3r5aJnexEWmsytBwQBo6L3OzcqyV8M2k9O4Z28JiShmz8VfrbWD4xa3
	 /Mlo76GBgzk915ueSIQpFeZCHHRuj16Ba9CJMBq39yejEkw3IY7OMdzxLsxhQ27c2o
	 WDkhOowyhlCIQ==
From: Vinod Koul <vkoul@kernel.org>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Janne Grunau <j@jannau.net>
Cc: asahi@lists.linux.dev, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Vladimir Oltean <olteanv@gmail.com>
In-Reply-To: <20260215-phy-apple-resource-err-ptr-v2-1-e43c22453682@jannau.net>
References: <20260215-phy-apple-resource-err-ptr-v2-1-e43c22453682@jannau.net>
Subject: Re: [PATCH phy-next v2] phy: apple: apple: Use local variable for
 ioremap return value
Message-Id: <177220616687.330302.14977409521915392205.b4-ty@kernel.org>
Date: Fri, 27 Feb 2026 20:59:26 +0530
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Sun, 15 Feb 2026 09:02:51 +0100, Janne Grunau wrote:
> The indirection through the resources array is unnecessarily complicated
> and resuling in using IS_ERR() and PTR_ERR() on a valid address. A local
> variable for the devm_ioremap_resource() return value is both easier to
> read and matches expectations when reading code.
> 
> 

Applied, thanks!

[1/1] phy: apple: apple: Use local variable for ioremap return value
      commit: 290a35756aaef85bbe0527eaf451f533a61b5f6c

Best regards,
-- 
~Vinod


