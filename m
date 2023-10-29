Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFA28F60
	for <asahi@lists.linux.dev>; Sun, 29 Oct 2023 15:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="jP5cqF6F"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 934B287949;
	Sun, 29 Oct 2023 16:09:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1698592185;
	bh=CVVrIe/PWy9/xGDpT+cZGpfXFwLHJqXn9ScZ/uxq3jA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jP5cqF6F3hr7IFlhdM2B45j/g4aeMa7yu8ZgRwQihWsvhmGKKZ2ca5pq9D5XtLAKv
	 cX12237p++4OeopqWatQeoakjRObHZdE03yFfa99+ceU2++rH4EgGP3m/B2/NjONsW
	 4XjLo/VD4EByOaWd0qh+QKAxRKAFrmCA+3YOmck7B7+KshI/yWk/iIYwjar8p/Xcb1
	 raL8sk+Duwm/gtxZND+kh0ITrQnoMQ3nwFr3I3vIyg57H5LYpSRXdwRg7t6MyU6gOB
	 66qzjwG/wBZiFAcC0mtOhp4fMRUwOJH7N072qN0+hE9xppRM5zbNCTIZXx19chW2/K
	 S0KEiJe+pT9tw==
Message-ID: <cd81b46a-7d47-4e51-a92b-ad44b889137e@denx.de>
Date: Sun, 29 Oct 2023 15:33:43 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] usb: xhci: Better error handling in abort_td()
Content-Language: en-US
To: Hector Martin <marcan@marcan.st>, Bin Meng <bmeng.cn@gmail.com>
Cc: Mark Kettenis <kettenis@openbsd.org>, Neal Gompa <neal@gompa.dev>,
 u-boot@lists.denx.de, asahi@lists.linux.dev
References: <20231029-usb-fixes-1-v2-0-623533f6316e@marcan.st>
 <20231029-usb-fixes-1-v2-2-623533f6316e@marcan.st>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20231029-usb-fixes-1-v2-2-623533f6316e@marcan.st>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/29/23 07:37, Hector Martin wrote:
> If the xHC has a problem with our STOP ENDPOINT command, it is likely to
> return a completion directly instead of first a transfer event for the
> in-progress transfer. Handle that more gracefully.
> 
> We still BUG() on the error code, but at least we don't end up timing
> out on the event and ending up with unexpected event errors.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>

Reviewed-by: Marek Vasut <marex@denx.de>
