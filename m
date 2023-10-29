Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDB51C15
	for <asahi@lists.linux.dev>; Sun, 29 Oct 2023 15:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="W8YVQXtv"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 7CA7F8719C;
	Sun, 29 Oct 2023 16:09:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1698592180;
	bh=c1M6ST+n9p6CiLGsOnHhEGuEQJxDMBDFbvBzzQ1GMVQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=W8YVQXtvjANOyavDwKsfliboYGdxd8zymjnXM2PTA5U2+WLam/YJlB/6rOig81QE1
	 /1ll2BqfiWO+FBVYhXK2q6y3b8KC/YQ14iwgIDv9khraYWkPBFGPmg27auYdlN89sv
	 G46BS28M0KL6Ij2LVJ5RUmiFWuDXrIZYL9TJrODQ++oIrgzLoX8ojCmtqQEliwE6zM
	 XOPvtC7QFz5KL9EKwDtJ+0XI2QPCsrtgxsfBY/TfGT9+JczkZMRjoD69J4nJdLnKFC
	 deJtcdurmbmRoKT04w/BLvRFuvoRYnOX5PbV1BqpmIZjjRu4m2vwBNms+iUpIKsZnA
	 TEdrJiyS3RiqA==
Message-ID: <0e08be5a-4f71-4c13-8791-127fbba7cb63@denx.de>
Date: Sun, 29 Oct 2023 12:43:34 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] usb: Pass through timeout to drivers
Content-Language: en-US
To: Hector Martin <marcan@marcan.st>, Bin Meng <bmeng.cn@gmail.com>
Cc: Mark Kettenis <kettenis@openbsd.org>, Neal Gompa <neal@gompa.dev>,
 u-boot@lists.denx.de, asahi@lists.linux.dev
References: <20231029-usb-fixes-5-v1-0-54bb13001f54@marcan.st>
 <20231029-usb-fixes-5-v1-1-54bb13001f54@marcan.st>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20231029-usb-fixes-5-v1-1-54bb13001f54@marcan.st>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/29/23 08:36, Hector Martin wrote:
> The old USB code was interrupt-driven and just polled at the top level.
> This has been obsolete since interrupts were removed, which means the
> timeout support has been completely broken.
> 
> Rip out the top-level polling and just pass through the timeout
> parameter to host controller drivers. Right now this is ignored in the
> individual drivers.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>

Except for the negative timeout value question, which needs to be sorted 
out:

Reviewed-by: Marek Vasut <marex@denx.de>
