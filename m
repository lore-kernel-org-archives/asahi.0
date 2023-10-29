Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901C03D7F
	for <asahi@lists.linux.dev>; Sun, 29 Oct 2023 15:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="GiOdl9U2"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 01A6287C7A;
	Sun, 29 Oct 2023 16:09:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1698592185;
	bh=Xkatk2Z/5gWHc/ZSNjw1IUVXxIt1J2MN5pOe1DWP8IA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GiOdl9U29wjoQcSnnKG0G13xyVxPDGyrKaCwW2m8ljOOT3OzJPV+o+LLjo69nUyEm
	 Xy/qIODtDsW4/xUPo/FMqcVeqTYIBmKH64vd+UsnozE+jPqsFCHNMjE4TF6gUuCrYU
	 /zmynAvTjFDqcRM9LxWHKUyOMIou6/H/LZ6OHY4TTaCAHOIfGE1ZwyJ9RdnqYZtT7o
	 GChnTpHtkw4wcipRWjug8admptyGRjcu1TDNmDXM+mdtS/JV9p1l+uY3e2DF43hXrd
	 oRAxin2HFkEmTkB1ylhqLASB4Sp3tonkMXMykYL4v82oOO7jqOwlcCmgyj6T0xNSRW
	 Kdk/vryj708BA==
Message-ID: <a597cbed-79a1-46a6-bcb1-f40498b17545@denx.de>
Date: Sun, 29 Oct 2023 15:32:06 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] usb: xhci: Guard all calls to xhci_wait_for_event
Content-Language: en-US
To: Hector Martin <marcan@marcan.st>, Bin Meng <bmeng.cn@gmail.com>
Cc: Mark Kettenis <kettenis@openbsd.org>, Neal Gompa <neal@gompa.dev>,
 u-boot@lists.denx.de, asahi@lists.linux.dev
References: <20231029-usb-fixes-1-v2-0-623533f6316e@marcan.st>
 <20231029-usb-fixes-1-v2-1-623533f6316e@marcan.st>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20231029-usb-fixes-1-v2-1-623533f6316e@marcan.st>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/29/23 07:37, Hector Martin wrote:
> xhci_wait_for_event returns NULL on timeout, so the caller always has to
> check for that. This addresses immediate explosions in this part
> of the code when timeouts happen, but not the root cause for the
> timeout.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>

Reviewed-by: Marek Vasut <marex@denx.de>
