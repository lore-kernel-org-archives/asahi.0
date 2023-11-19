Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EEC19BD7
	for <asahi@lists.linux.dev>; Sun, 19 Nov 2023 20:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="oI0UodQQ"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 783B286F44;
	Sun, 19 Nov 2023 21:08:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1700424496;
	bh=CxtwTpKnwXXhWSldFGaimZ660MQoOXtAtyNioYo6Z7k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oI0UodQQLch8MblRwgQgNw0lWP7s9jmvZXo5S0stLHuYbVWfb05Z3gBtSphAvft8w
	 42XZzfIA1h/C4HQsA4qRK0G6eJnOoPt4OzM+Z2sJ2vsQVqs1CrDg8nAVB0RvWo4Hf/
	 pnOH1iRhgEIqgXSRACGMgimkUm7wQs08k4wG/lpHEAIQAKY5ay/SRuqMhPUF2DckIC
	 Juz/r6T4l6cf07k4SLsjNy+83hlaHbAzrzqC3gGZjgAGt62f1Lkl4eNuLmvnGcVGQJ
	 RXk6UQqNtrOji10Z/9jjQEbGFGIo6i0aH/NhPEg46xTei+AiUtHdyzhGLZY3ceqomQ
	 6LFrGNX65+OzA==
Message-ID: <fe844c63-0c44-469c-a4e0-f0e1f2ac63fc@denx.de>
Date: Sun, 19 Nov 2023 21:08:09 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] USB fixes: xHCI error handling
Content-Language: en-US
To: Hector Martin <marcan@marcan.st>, Bin Meng <bmeng.cn@gmail.com>
Cc: Mark Kettenis <kettenis@openbsd.org>, u-boot@lists.denx.de,
 asahi@lists.linux.dev
References: <20231027-usb-fixes-1-v1-0-1c879bbcd928@marcan.st>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20231027-usb-fixes-1-v1-0-1c879bbcd928@marcan.st>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/27/23 01:16, Hector Martin wrote:
> This series is the first of a few bundles of USB fixes we have been
> carrying downstream on the Asahi U-Boot branch for a few months.
> 
> Most importantly, this related set of patches makes xHCI error/stall
> recovery more robust (or work at all in some cases). There are also a
> couple patches fixing other xHCI bugs and adding better debug logs.
> 
> I believe this should fix this Fedora bug too:
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=2244305

Was there ever a V2 of these patches I might've missed ?
