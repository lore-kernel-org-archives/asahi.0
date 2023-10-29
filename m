Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357E863CF
	for <asahi@lists.linux.dev>; Sun, 29 Oct 2023 15:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="VQAxzpdR"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id A5F0D876F8;
	Sun, 29 Oct 2023 16:09:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1698592183;
	bh=yFlETdTA6Xp40NlI72b1ufUiTkOzvkjPt+KEtxPkQ2k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VQAxzpdR7fvfANEbvOb5B9H7OIiHGhQxNNyZ23MB4CXDdrM8rheL7VP3F161JoXrx
	 DbVjg9uuJAKIOG6YkV/RF5WqGsQQ4ENH9K0pSTiudi61c5DRdDLWa+a5njeUUX+Ql1
	 a7+pdwD4Hb9eCVKUipN8kNbinwOatpx4l3cmZ80WVE0PJk1UdynvTpjgpp2St73I/H
	 hp9e5O3UwneYS/FiftSzPtTy7qHhBpH+SGMylUKBZRtIVBSsg03ByhaU9ZmjAiwQBU
	 0OUCEnG+trGh4kSSy0JIwIjSTB11uCRi7fgEK+2yQ6yXDDpBivcN30okAo11K4F0UH
	 dgvziq0B1S/hg==
Message-ID: <11e44dad-9e32-44fa-90d3-baa0d2eb63a0@denx.de>
Date: Sun, 29 Oct 2023 13:10:48 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] usb: storage: Use the correct CBW lengths
Content-Language: en-US
To: Hector Martin <marcan@marcan.st>, Bin Meng <bmeng.cn@gmail.com>
Cc: Mark Kettenis <kettenis@openbsd.org>, Neal Gompa <neal@gompa.dev>,
 u-boot@lists.denx.de, asahi@lists.linux.dev
References: <20231029-usb-fixes-3-v1-0-0153210a7f55@marcan.st>
 <20231029-usb-fixes-3-v1-3-0153210a7f55@marcan.st>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20231029-usb-fixes-3-v1-3-0153210a7f55@marcan.st>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/29/23 08:23, Hector Martin wrote:
> USB UFI uses fixed 12-byte commands (as does RBC, which is not
> supported), but SCSI does not have this limitation. Use the correct
> command block lengths depending on the subclass.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>

Reviewed-by: Marek Vasut <marex@denx.de>
