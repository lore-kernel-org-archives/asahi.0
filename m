Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4FA3B52E9
	for <asahi@lists.linux.dev>; Thu,  6 Aug 2026 17:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786037853; cv=none; b=Fs2hzyPoXQj/INvRzRS5EpH7ifJBjJLC8PZny1zzjrc1c5j/FADFj+rGvolm0WgUUt2kAKe22f6lEVhGOQmY0trYNjO3N7J58LvJVLOAUKEmwVgix4PJIN08aTkMBLl7UPcpzoQ+jUAYPMYNd1SJleXHrDF40wFX7bHNSKTXQ9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786037853; c=relaxed/simple;
	bh=5IDpeGoVi7UJYFyWRcM7ZaQZoQV0M709o0nywzNbIVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MAkyn/ig1cBP5v6t9y8sd4brFPbjD+W4KACwHOvi0OY7MFODYA/TsFpcyCsxykAk3yOAPfWeuZ1+9JLP8uA6qkU6OfwRFIhazqi1mrusa4jWlZx2KDNrbj33P8dv+uduxONNRFftO9lObUCgna496mWrMg2UK/3tTcbdy42FrJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=IUyxeOGl; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=huILaywR; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="IUyxeOGl";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="huILaywR"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 06D6B1D000BD;
	Thu,  6 Aug 2026 13:37:31 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 06 Aug 2026 13:37:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1786037850; x=1786124250; bh=tHnqyOO1uD
	suoF/xnUQI2mRzSuyrmk/rA7QZretz+bg=; b=IUyxeOGlOih7TBAnxusRso1hWL
	+YD1l8lbfLnHwA0Ufvz6nUguE6wwkFRDKrbNNYhXtEFBUpmukgRUgSdJk0Ln2sgw
	xYvY8JiJKYPkRPDovyP31TrBfVNapNytvyr13BZVzjfbl1R5GRlqgHZgZ8PXX+us
	bu8VG8QXT0lV/Hh4MVs0Dm3L90Ew05oiZxdWsZ1z+i9a8oF+TME47U4gM5bS/qfd
	gaNCY2QiH8jhF7vaAQsQMokKtQC3t0L/OiSnnre23g2NUWte/GDVb3ZQo24NRze5
	gGU4lrjdt3hHY8D84AifjhevQg0CjH+XlLGbOm3Onc8FMMIleaCdPdpmyuvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1786037850; x=1786124250; bh=tHnqyOO1uDsuoF/xnUQI2mRzSuyrmk/rA7Q
	Zretz+bg=; b=huILaywRzta094cghAmg/6V4TdtDqy2H/XXrwFKqf95sUihGqZ3
	81y+lRl2fPzTG3A0Uk/nfvOdKcFG1lmiq8lkmReWqtIVnehpDYEFaAYiUAiasQ8z
	IdC4ukU8TiqEK8ZM32l7isyoTeJNbGpPif3MGRbIsogQfuFvAAlCmQu4PPn0eWNm
	ntyV4M4xr8Zpz+CUBIQzAUFcxTc3zhFuIs3AEvCQKdnldzQwLpyhRJY2ij4JZl0+
	3BpMeWdSDXFlK6fH7iZhzxCZeQ+74BSEMz6xD1Rcejel7DvbcWKBDzYgkNmQyWnx
	BNXU2mxZNfgbttuKZVXrFFPtVoCEg79Ufzg==
X-ME-Sender: <xms:WsZ0asjitWyoR78JyGC827Km5p7ELDBt5EyTjboqKOA4kuPIDIxIDg>
    <xme:WsZ0ag2qwvBL5raTTuIq3xNoKOEHT9QyPgo8gg30TEab1g71OdTSjrKIJhI7j4tJz
    lNQ2deOwpyE6A6g72opBziBGDtESv7yE_L2gocK-QwagR61--HyIKw>
X-ME-Received: <xmr:WsZ0avdO9znJLTTAKvHxJc1Y5JHT8XPOdEJZak_5utkTpDTwYG5XhAaDeuMPvUMYqSzO-vWDE-WukJwEL9FF7SysAt1VEI9yL7o>
X-ME-Proxy-Cause: dmFkZTGwCXBcn4aLfwWdfO4trPZD1QJnLbrbvPnKiG1qC8XfJLrdxauf+uW9V1IadvHpNS
    l5/Rx2MIiAcq66IRw6VMNUNmUS8TMak8AF662vYKZTkaUb9XRvR3Hq5ZAly3FQS82dOD/I
    4+krjZ6PDY8zDg9K5QtufjuF7verAuoLHeGORs8+FMIAy6vf4TJevfTLkBahtqzGNudqIp
    iIYMJZZHHEsfRL5babwzPWb74SeHSZPNEoaDGDsaEGPqXhdTAhVvEf3mcMgDTUfm01KbNe
    3awc5mWY2/ljAsdLPc3I8Eji1uJDQFl78xVLs0EIksEuFDfEUFgdFbpIMbb/3lMTV/MroX
    7vJLKhjVBRD9TNWGb4gVqNEBqgrqsBX1nLp2nlySFTGREb3kRF4FTj0wlVkEKHeYz1uhse
    IAF0V7fJroKG015cX/hl+yIpMupTZq8aFUslwBqeHbSEAgsYz7zHWKWYfrOZvgpwrCoqpy
    cQEXtyjVsn+xUvfLOx1SEUWntwSxS54UMqKz3IdDwJCNNJRH8FdCZXF/SEKkMqkPgDaYPw
    RR14r5sUSe+UTd/GPp9Q03lcoLGMAGhR8wrOaqK0ILBlBjavlLbSa2DEkfSLJpL/KJQHOS
    NidEGnsb2LJMV9HTmqZNDp2CTvQ9jBSni+FdQVBb9fvYn7agCX7VHpTNXUAA
X-ME-Proxy: <xmx:WsZ0amzGoA_8Pqn4FLbFJQwVPwDUW5AVWeEYuRNjSvaez5uPnSRu6w>
    <xmx:WsZ0anwa1PMy9xcRax62pV8WbhZYJ0_NT0h4qxZB8n3s9FSk9Ze96Q>
    <xmx:WsZ0anaAaX4TbHmCUIdK_TtLIwNJ15EtoBrr0FRBzptOFUIhcg5B3w>
    <xmx:WsZ0ag3EtiYRGPs7tq1OaBZaH0E2oHJl506hZtU7uFL86p-ayp2zCg>
    <xmx:WsZ0an5YLg3nZukQbedDSXz2LgIABtNCffZm2HXNwIhwQZbZVGx0fze->
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Aug 2026 13:37:29 -0400 (EDT)
Date: Thu, 6 Aug 2026 19:37:28 +0200
From: Janne Grunau <j@jannau.net>
To: Sven Peter <sven@kernel.org>
Cc: Neal Gompa <neal@gompa.dev>, Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>, Arnd Bergmann <arnd@arndb.de>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] Apple NVMe fixes for macOS 15+ firmware / M4 support
Message-ID: <20260806173728.GA682012@robin.jannau.net>
References: <20260806-b4-nvme-fwabi-v1-0-bde19ce8db04@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260806-b4-nvme-fwabi-v1-0-bde19ce8db04@kernel.org>

On Thu, Aug 06, 2026 at 05:27:32PM +0200, Sven Peter wrote:
> Hi,
> 
> This series fixes a bunch of bugs that were working fine with M1/M2 NVMe
> controllers with older firmware but are now starting to bite us.
> With macOS 15 a new firmware is installed for the controller and both
> XNU and the controller are a bit more strict now. This firmware is
> required once we add M4 support.
> 
> The first patch fixes a panic that can happen when the controller fails
> to initialize, which now happens for the first time with the new
> firmware. The other fixes then make it work again.

Whole series tested on devices with pre macOS 15 system firmware, a M1
with system firmware 13.2 (OS firmware 12.3) and M1 Max with system
firmware 14.5 (OS firmware 13.5).

Tested-by: Janne Grunau <j@jannau.net>

Janne
