Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39953BED2A
	for <asahi@lists.linux.dev>; Fri, 27 Mar 2026 06:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774593455; cv=none; b=YgkSmvKNUJpHsrgn3auzcvLoNXtUbdlmEKDv/amJfO9DnJjH9uPDZ8E0NgOn/c9bwhmtpVOUyx5/SShAkV3dXU5oiirKBNZcE+XPbJxCI7HmFomeUlON2supii+5oFBLQtkn4SZynWZwrBYTplplg/xXlD1CRwNDsEA/XE1b25U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774593455; c=relaxed/simple;
	bh=qWmYBof7kcqXZaGJFhox3PYJRvZy8oAyxrCoD4W/WCA=;
	h=Mime-Version:Subject:From:To:CC:In-Reply-To:Message-ID:Date:
	 Content-Type:References; b=k4F80ymX19g6G8vSaAWEqZy2lLNWsL3gdwufho4D6Wna36nvmQI5meRCClLtIZnZnVGr3hxQ0YAzwWBf4oSF4gb5n5v9XPvdjASYPdQBVE9GrvhezQzgcyprOKSJ7N3n1OosiXHbg/NMl5PRDxwlYs49wKODy8ApEGRTPANylAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=K5oZfykv; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="K5oZfykv"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260327063722epoutp04d14fa1601223aa5353c406b9b7e7f4c2~gn1VbRSBo1906119061epoutp04B
	for <asahi@lists.linux.dev>; Fri, 27 Mar 2026 06:37:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260327063722epoutp04d14fa1601223aa5353c406b9b7e7f4c2~gn1VbRSBo1906119061epoutp04B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1774593442;
	bh=1+O6aNFLjR2fJGkRkFMDHHc6Xd1lom5HjfhLE8xyfdk=;
	h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
	b=K5oZfykvxGQYKRUaqowjfHzqKh454SqP8PZTsCS8db/DUZ402z4wQCglIdPwTHBfI
	 FK+dN6YUkt2m7DQlbznP/TDIGQNvcxYAlHAI9hn8sEKBziC4Yl8WU+Y5CSGRca81wa
	 3CkQrZCrHbN9MiBEWBm98SOcbTvECGaRuidS6PeI=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20260327063721epcas2p2c4f0a625266a14058ef94d5c52416784~gn1UtWWrK0303903039epcas2p2g;
	Fri, 27 Mar 2026 06:37:21 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.38.210]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4fhrXw6mQNz6B9mD; Fri, 27 Mar
	2026 06:37:20 +0000 (GMT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Subject: Re: [PATCH v5] nvme: Skip trace complete_rq on host path error
Reply-To: hmi.jeon@samsung.com
Sender: =?UTF-8?B?7KCE66+87Iud?= <hmi.jeon@samsung.com>
From: =?UTF-8?B?7KCE66+87Iud?= <hmi.jeon@samsung.com>
To: Keith Busch <kbusch@kernel.org>, "hch@lst.de" <hch@lst.de>
CC: Justin Tee <justintee8345@gmail.com>, "axboe@kernel.dk"
	<axboe@kernel.dk>, "sven@kernel.org" <sven@kernel.org>, "j@jannau.net"
	<j@jannau.net>, "neal@gompa.dev" <neal@gompa.dev>, "sagi@grimberg.me"
	<sagi@grimberg.me>, "justin.tee@broadcom.com" <justin.tee@broadcom.com>,
	"nareshgottumukkala83@gmail.com" <nareshgottumukkala83@gmail.com>,
	"paul.ely@broadcom.com" <paul.ely@broadcom.com>, James Smart
	<james.smart@broadcom.com>, "kch@nvidia.com" <kch@nvidia.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-nvme@lists.infradead.org"
	<linux-nvme@lists.infradead.org>, "asahi@lists.linux.dev"
	<asahi@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?UTF-8?B?7J207J2A7IiY?=
	<euns212.lee@samsung.com>, =?UTF-8?B?7Lm47LCs?= <joshi.k@samsung.com>,
	=?UTF-8?B?7KCE66+87Iud?= <hmi.jeon@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <acVGECskf5pg3_MY@kbusch-mbp>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20260327063720epcms2p43a46a694d9cda121cc804bfa2bab8d59@epcms2p4>
Date: Fri, 27 Mar 2026 15:37:20 +0900
X-CMS-MailID: 20260327063720epcms2p43a46a694d9cda121cc804bfa2bab8d59
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-223,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6
References: <acVGECskf5pg3_MY@kbusch-mbp> <acQxjZMOqj74yIJf@kbusch-mbp>
	<20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p4>
	<945a3e98-ee75-453c-ae80-f3c9e3e57e58@gmail.com>
	<20260325063333epcms2p60954532c1b65a1665bad6dcdcfd7d62c@epcms2p6>
	<CABPRKS8-x6Tfr90inpz1fR0=8a5HD=mkujtfLJ1h9ikEUjTvxg@mail.gmail.com>
	<20260326014429epcms2p135ffd3c2b2fface6423d045e9614c262@epcms2p1>
	<20260326065152epcms2p51a18d3bbecb6eb6dc2ddba09651e5152@epcms2p5>
	<acVCnozG1WKPkq1L@kbusch-mbp> <20260326143124.GA17507@lst.de>
	<CGME20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p4>

On Thu, Mar 26, 2026 at 08:43 -0600, Keith Busch wrote:
> Yeah, the spec is not very clear on their use. It just defines the codes
> and a one sentence description, and then never mentioned again. I think
> it allows the possibility for the controller to internally complete a
> command with such status from some undefined OOB mechanism. I'm not sure
> why the host needs to have their own self-generated status codes anyway
> since it can already attach whatever arbitrary flags it wants to its
> private data, like how we use NVME_REQ_CANCELLED.
> 
> Anyway if a controller did return it for whatever reason, even if it is
> a bug, we'd want to see it in the trace.

Sorry, The date is wrong, so I send it again.
On Thu, Mar 26, 2026 at 08:43 -0600, hch@lst.de wrote:
-> On Thu, Mar 26, 2026 at 14:43PM UTC, Keith Busch wrote:

I've confirmed what you discussed, and it seems like the approach you
proposed is a better one.
Can I send patch v7 as above?


Regards,
Minsik Jeon
