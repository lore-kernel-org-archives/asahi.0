Received: from flow5-smtp.messagingengine.com (flow5-smtp.messagingengine.com [103.168.172.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C13B13A86D;
	Thu, 28 Mar 2024 19:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711655411; cv=none; b=b0KTACsG8DN0ziz/GhGkvC2bsOXcqAfx18J90CnTjITXlTWhlaEdphnxWd6SJR5eJU0yD855OAhnpL7YwrhDxkc2tJ+OhRdKT+QFJmb5B3chEtCF04cgS1rSn3TjZJyE6onNTum7YfIgPQu0OSNtj8CInI9bsXohQ0QL5U/stUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711655411; c=relaxed/simple;
	bh=82WZ09r8X2wdE/vjUS1bY2Z6AeLXgQBKptYWCvEjiiY=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=UhwGozvVHcWRxowmZloDIXix3YG9UWnFXZ9NY+nZ+IwqPb6hUEYUr6wBU8mAFFiggqN6pIokeB1UYcP8eQFxy8V8DFD0/G0NoSo5UWr46+ZwnjWxndoUr6nVwNBUMQMRGMT8HjiGlRcq8v9VrqOYW2szhvQCRtMlLeHqnqIqXZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=f7UX+4Pc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=csg1O07t; arc=none smtp.client-ip=103.168.172.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="f7UX+4Pc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="csg1O07t"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailflow.nyi.internal (Postfix) with ESMTP id 35A5620026D;
	Thu, 28 Mar 2024 15:50:08 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Thu, 28 Mar 2024 15:50:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1711655408; x=1711662608; bh=BW4gpjPip0
	MIz7Sv02WTjVBL1poTtTjeiFToXn5W8yQ=; b=f7UX+4Pcu6g1fuDG/2VVEitZ3G
	QUMw7eXjSXsVFH66+taJAuA+K236VIbLKYe25JuST225E4z1xHxL2/2LtCRDTnmU
	n6ve6KfgedMjL2XLQveE6wn2Etpx5XZpxwVEvGc9S8uh0MO7kxHXOMvBs0RSLgOb
	Z4x6VFyXqeAGF29fvaja951eipxGSjyBqxDJrgJqsQGYGDJchM0S/wIgeKCC56Tp
	yy3P1woDZ2PYXLyJCN7oQDlQyZnTv8POQK4Y9IX1QsW7x4LXBpTuUVXL079pL1qY
	c8aHoEkfsGnaqC7cdNeGeJKfDtIInY7//byDCYjIJh0GZpsXE1Nlwpvc28Ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1711655408; x=1711662608; bh=BW4gpjPip0MIz7Sv02WTjVBL1poT
	tTjeiFToXn5W8yQ=; b=csg1O07txOaVvOWughgoF1bJEzemGtOETePgwtvzZAfA
	VtfvSPlTmevhy2SRIOSlxGl/ziKmaxcsgCY8MskufwdkbniJlzOnf6V2YN6oj/wj
	O/GMHPI1vHTQCnnkxXW8ewXWuqkTeHxgt378h4sL5SXj1OE11EYjcq+gJSzV/2yx
	57hBTFu9rPkf/BSl7zjPJkqQr23ZCzjOc+lNEw90HzsO6vZ1BHt1GGEbfjXZeYqk
	4mjQu7/I6378RC3ndN5bM7YGcXnnklViSVT1WVQmKqWfCE4MpnbATpOmDMjTcgSj
	Ndwws714kFqEKc2vOOAREK2Ek5kgI3Az+hJNSEwS1A==
X-ME-Sender: <xms:7ckFZgx5tu4bAvUGLkKcZrX-cRBBCFPUwivVbrqpvYnxZjfR3Ouh3g>
    <xme:7ckFZkRueNttJPZFneG6Q80JylGkQF6mdDjM59ne5mlAoW1W9VzUlkuyJ4EgvxkD9
    qcvlQkaqolFxDiDZLU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudduledguddvlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:7ckFZiVjaDs8eD5LFreZzpgUuHvfIy_8fMXgOX4leo573jO7501ZgQ>
    <xmx:7ckFZujghNVwcfUCWKm85BVyJWRtb8_SXoseITfNpe_wG_psaAm3sQ>
    <xmx:7ckFZiD3xw2zvDrylXyZZwHVDAyX3ZEv_6D9gPl8_sbUEnjX936dYg>
    <xmx:7ckFZvKUkZitQXBsGo5-E7fjRHu2EeySeOnc0hwOM13gLqXyAC2RIw>
    <xmx:8MkFZpfgruaumRILI-G9uyonNT2Mm7JcDkeb2mObdPHz9wSV9uAJgiH6gVM>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7B52EB6008D; Thu, 28 Mar 2024 15:50:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-333-gbfea15422e-fm-20240327.001-gbfea1542
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <678ba20b-9f1d-41cb-8a25-e716b61ffafe@app.fastmail.com>
In-Reply-To: 
 <CAOMdWSKY9D75FM3bswUfXn2o7bGtrei3G5kLt6JdcdOPDXaG8g@mail.gmail.com>
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-3-apais@linux.microsoft.com> <ZgUGXTKPVhrA1tam@matsya>
 <2e9257af-c123-406b-a189-eaebeecc1d71@app.fastmail.com>
 <ZgW3j1qkLA-QU4iM@matsya>
 <CAOMdWSKY9D75FM3bswUfXn2o7bGtrei3G5kLt6JdcdOPDXaG8g@mail.gmail.com>
Date: Thu, 28 Mar 2024 20:49:44 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: Allen <allen.lkml@gmail.com>, "Vinod Koul" <vkoul@kernel.org>
Cc: "Allen Pais" <apais@linux.microsoft.com>, linux-kernel@vger.kernel.org,
 "Tejun Heo" <tj@kernel.org>, "Kees Cook" <keescook@chromium.org>,
 "Hector Martin" <marcan@marcan.st>, "Sven Peter" <sven@svenpeter.dev>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>,
 "Ray Jui" <rjui@broadcom.com>, "Scott Branden" <sbranden@broadcom.com>,
 "Paul Cercueil" <paul@crapouillou.net>, Eugeniy.Paltsev@synopsys.com,
 "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org>,
 "Viresh Kumar" <vireshk@kernel.org>, "Frank Li" <Frank.Li@nxp.com>,
 "Leo Li" <leoyang.li@nxp.com>, zw@zh-kernel.org,
 "Zhou Wang" <wangzhou1@hisilicon.com>, haijie1@huawei.com,
 "Shawn Guo" <shawnguo@kernel.org>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Sean Wang" <sean.wang@mediatek.com>,
 "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, logang@deltatee.com,
 "Daniel Mack" <daniel@zonque.org>,
 "Haojian Zhuang" <haojian.zhuang@gmail.com>,
 "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konrad.dybcio@linaro.org>,
 "Orson Zhai" <orsonzhai@gmail.com>,
 "Baolin Wang" <baolin.wang@linux.alibaba.com>,
 "Chunyan Zhang" <zhang.lyra@gmail.com>,
 "Patrice Chotard" <patrice.chotard@foss.st.com>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Chen-Yu Tsai" <wens@csie.org>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, peter.ujfalusi@gmail.com,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 "Haiyang Zhang" <haiyangz@microsoft.com>, "Wei Liu" <wei.liu@kernel.org>,
 "Dexuan Cui" <decui@microsoft.com>,
 "Jassi Brar" <jassisinghbrar@gmail.com>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 maintainers@bluecherrydvr.com, aubin.constans@microchip.com,
 "Ulf Hansson" <ulf.hansson@linaro.org>,
 "Manuel Lauss" <manuel.lauss@gmail.com>,
 =?UTF-8?Q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 "jh80.chung" <jh80.chung@samsung.com>, oakad@yahoo.com,
 "Kunihiko Hayashi" <hayashi.kunihiko@socionext.com>,
 "Masami Hiramatsu" <mhiramat@kernel.org>, brucechang@via.com.tw,
 HaraldWelte@viatech.com, pierre@ossman.eu,
 "Duncan Sands" <duncan.sands@free.fr>,
 "Alan Stern" <stern@rowland.harvard.edu>,
 "Oliver Neukum" <oneukum@suse.com>,
 openipmi-developer@lists.sourceforge.net, dmaengine@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-mediatek@lists.infradead.org, linux-actions@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-media@vger.kernel.org,
 "linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-s390@vger.kernel.org, Netdev <netdev@vger.kernel.org>,
 linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/9] dma: Convert from tasklet to BH workqueue
Content-Type: text/plain

On Thu, Mar 28, 2024, at 20:39, Allen wrote:
>> >
>> > Since almost every driver associates the tasklet with the
>> > dma_chan, we could go one step further and add the
>> > work_queue structure directly into struct dma_chan,
>> > with the wrapper operating on the dma_chan rather than
>> > the work_queue.
>>
>> I think that is very great idea. having this wrapped in dma_chan would
>> be very good way as well
>>
>> Am not sure if Allen is up for it :-)
>
>  Thanks Arnd, I know we did speak about this at LPC. I did start
> working on using completion. I dropped it as I thought it would
> be easier to move to workqueues.

It's definitely easier to do the workqueue conversion as a first
step, and I agree adding support for the completion right away is
probably too much. Moving the work_struct into the dma_chan
is probably not too hard though, if you leave your current
approach for the cases where the tasklet is part of the
dma_dev rather than the dma_chan.

      Arnd
