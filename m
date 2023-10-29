Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8461E6AA4
	for <asahi@lists.linux.dev>; Sun, 29 Oct 2023 15:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="WwqSXI9H"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 6554087970;
	Sun, 29 Oct 2023 16:09:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1698592184;
	bh=oiOePTZJk3mjOwFmtuBFh/I/NLzO9/6Xx/K68VXUxnA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WwqSXI9H/CsUdabu0gkzBEDTwjl8jwkkaJ+wPJC1vSeTT1iBKTn0Z7hZhee6c2pTR
	 +JRqt3YRs2QcQ/7KxLCGtlCGb+OXHbWmwBsrYL38J9I2gC8JDQ7AYeW6E2QIgzNxAI
	 3kU9venrwGL2E0iYfU5Q3YhAZEHEfeT9TdYf2DvSk4xkB8QistbFNF1OJ2krjK/2Wb
	 ldQp2SsRfjL17NczaeuCl//eVEqOaPH6SEXXAshw31RFtoYR1hOk50PGlLpNoVEeq0
	 DRMkFSwVNYd/KHR52kIrA4z0vlr1id8TDvTFDGBQ9QYtI+kR51SVNARK33CHs5MCs/
	 4+2O/XQhksc+g==
Message-ID: <1ccd86f8-619a-4a63-bcde-4d05bb3cf334@denx.de>
Date: Sun, 29 Oct 2023 13:14:19 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] usb: hub: Add missing reset recovery delay
Content-Language: en-US
To: Hector Martin <marcan@marcan.st>, Bin Meng <bmeng.cn@gmail.com>
Cc: Mark Kettenis <kettenis@openbsd.org>, Neal Gompa <neal@gompa.dev>,
 u-boot@lists.denx.de, asahi@lists.linux.dev
References: <20231029-usb-fixes-2-v1-0-9f793aa20fe4@marcan.st>
 <20231029-usb-fixes-2-v1-2-9f793aa20fe4@marcan.st>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20231029-usb-fixes-2-v1-2-9f793aa20fe4@marcan.st>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/29/23 08:09, Hector Martin wrote:
> Some devices like YubiKeys need more time before SET_ADDRESS. The spec
> says we need to wait 10ms.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>

Reviewed-by: Marek Vasut <marex@denx.de>
