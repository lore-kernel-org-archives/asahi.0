Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031878F60
	for <asahi@lists.linux.dev>; Sun, 29 Oct 2023 15:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="pr6I0ZHJ"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 831CB87950;
	Sun, 29 Oct 2023 16:09:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1698592188;
	bh=Oycuat/edA/HiT92S8gAyA5XupVbufHEA1EdkI44MnE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pr6I0ZHJJl/gdBL+taHT9A6vN9Goy4S9lJ5RPfb2qXUBghOQnbOHPoNtHM5f7QuxZ
	 gd7pqlxam3P58VYPGXtmVmMYv/dnK21EtkRI4h795uMdfe7TDGc7AeVqs4ua7ruoli
	 OZvS4RGQ4XQa6v4fewBYRHmfnEQPsy1zgOHbSMiRzDBNtXrTxYD52mCFDca6yG1A8m
	 XbaJfcDTFOcI34sQuedruWiOqtwTovZvcrTgJmIPF8K1e1dk7H+5pGOvnSqSVOB3yK
	 ZMEiRZHnMNkveFqQgdR8PWbkpNxffDDBfBG6wfASB2/d0umWT6fj7fO5Y8OOGj4PAj
	 6uC01wtnQru1w==
Message-ID: <5b653914-92a9-4b7b-87aa-51820ab90335@denx.de>
Date: Sun, 29 Oct 2023 15:35:46 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] usb: xhci: Fix DMA address calculation in
 queue_trb
Content-Language: en-US
To: Hector Martin <marcan@marcan.st>, Bin Meng <bmeng.cn@gmail.com>
Cc: Mark Kettenis <kettenis@openbsd.org>, Neal Gompa <neal@gompa.dev>,
 u-boot@lists.denx.de, asahi@lists.linux.dev
References: <20231029-usb-fixes-1-v2-0-623533f6316e@marcan.st>
 <20231029-usb-fixes-1-v2-7-623533f6316e@marcan.st>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20231029-usb-fixes-1-v2-7-623533f6316e@marcan.st>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/29/23 07:37, Hector Martin wrote:
> We need to get the DMA address before incrementing the pointer, as that
> might move us onto another segment.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>

Reviewed-by: Marek Vasut <marex@denx.de>
