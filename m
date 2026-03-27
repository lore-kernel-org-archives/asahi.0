Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A5C37DE8B
	for <asahi@lists.linux.dev>; Fri, 27 Mar 2026 06:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774592392; cv=none; b=UFHUsdaYbOlGXrEQl6kdojWTuIOKBQfmEKxXp4VMQZ3RSrfGUTAXashQb2nZ+bII31A6z5CCBXhro3n5iilma4SSx9cgzPYPjBJDHuOuyfxXOBSbje4s8Vi2YMsGdBQiW4LCHPpGZkdEd2+F5qxBScB0sEKH9K2WdFBRXFvytk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774592392; c=relaxed/simple;
	bh=a9MV5tB528dqbT7LmCuycL/iOqssie+F8rRh56jLNrY=;
	h=Mime-Version:Subject:From:To:CC:In-Reply-To:Message-ID:Date:
	 Content-Type:References; b=YHZXJVgI2Y8gMdKL4jvAO2MmMeh7C+DufW1OOO1ouKwAnyX9a1kMDn1P1E88KU4/zaFZmovd5/3f5qxTXD8XvZJ9zGzctqelsi/EKuX+0Ckv2TTTB+jzQcTs2BzDX91IwQOA/ccyAZdBU1j5lyRWC7NxQ/3XDIEzS0l/DmYBido=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=rUoMx9ho; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="rUoMx9ho"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260327061942epoutp01e513165f2267b7af2278c090ab119885~gnl6Ztv1M3196231962epoutp01F
	for <asahi@lists.linux.dev>; Fri, 27 Mar 2026 06:19:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260327061942epoutp01e513165f2267b7af2278c090ab119885~gnl6Ztv1M3196231962epoutp01F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1774592382;
	bh=XnJA/5zwAPxZ6vMIZJbzIFubHwh+nIkMH+ZqspPFCx0=;
	h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
	b=rUoMx9hoGfks4r+dxmr5olSm/bblUxZcyt4PWgT7YJaBNdPalrNlN0cMvjQol1iJz
	 spAJj3ov5ZFNwm/P1ZcffyGowvWtNOfXs/ZS3bb1XA58vrY5YlcN7fyKFO2w2AyW8V
	 dhigBaDblg2q8IbpIaE8/WEF2q1syAyqZsN+lIxc=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20260327061941epcas2p17e4702f290bbe98e79942dda2d496d8c~gnl557Uoj3148231482epcas2p1K;
	Fri, 27 Mar 2026 06:19:41 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.38.208]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4fhr8Y3HDzz6B9m4; Fri, 27 Mar
	2026 06:19:41 +0000 (GMT)
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
Message-ID: <20260327061940epcms2p576446826c1c5336a57ec19f433122386@epcms2p5>
Date: Fri, 27 Mar 2026 15:19:40 +0900
X-CMS-MailID: 20260327061940epcms2p576446826c1c5336a57ec19f433122386
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
	<CGME20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p5>

On Thu, Mar 26, 2026 at 03:43PM +0100, hch@lst.de wrote:
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


I've confirmed what you discussed, and it seems like the approach you
proposed is a better one.
Can I send patch v7 as above?

Regrad,
Minsik Jeon
