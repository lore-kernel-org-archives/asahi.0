Received: from flow7-smtp.messagingengine.com (flow7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A441E48C;
	Thu, 28 Mar 2024 10:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711620553; cv=none; b=Nbiw7JLZTmkopao7DyJPsEzqzcoHXHR/yd7Vul9x0KrxzfR36geJxrsy6s9XZUwkKznSLgsWYeAd73d2kN/EqQ2PwgAVKrHHoUT0an5mGON2WlgBcttmF2fUoxj39AGpPFNGf2Rt8B4hGW1TbpgVZeKTOut2V3cm+LrVGfy9YyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711620553; c=relaxed/simple;
	bh=rjRj8lT9t8c0kTmFFh6anVK23ZDO/NaAc4KKhIVP/Dg=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=pgza2ybZzsFYyiDRMB00k8z+4gp+4nQ1/S3jErV3GuJ8R3SVhCGZn6iVeaacnIEWLdEE88n1HW1qqaHtFNDNDsP2T97nvLBlcTVTE6YnPn5VsxT50sYycS3D4MZCd64kB66n5ZcCtiHH575KJwjfztDT1XdLN/SnYNC1oghyDb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=bZ/F23JM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=wIyGwxiT; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="bZ/F23JM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="wIyGwxiT"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailflow.nyi.internal (Postfix) with ESMTP id 5C11820053F;
	Thu, 28 Mar 2024 06:09:10 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Thu, 28 Mar 2024 06:09:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1711620550; x=1711627750; bh=pYBjGEQadh
	25rkMc0fkoc5Y7p79L1tP3xKDkS0IogRA=; b=bZ/F23JMPyrmIk/Ntj2seAKXb/
	fK61J0u8ls1qOi2xe5oyM0yZSsH19MZp9yi+zXy1BWPve1eXg+la8Sg/UxYaSRbf
	sz3eypDY+Q1OHr+nkbkQQXqADbtGp250VeO64zWBK3NlHeV3OuNA+AZQsGMbPzKc
	tIO1b/JsdoMTi9Sa4qtzIxjRNmOivgTzJ16capo1Du6/6Fjf289SueUzJiDFabNr
	qhusH+/OTCYUQ62Md0W6Kb3XPtKtRHxWZCqsKeVcfwYFkjwwnQZ/KFVsiJpsteij
	UEFhJXpiMc48Yj8JBMnhQua7+EaskwT/bkKa7TU7dUlzuZ/tjgJdklUZue1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1711620550; x=1711627750; bh=pYBjGEQadh25rkMc0fkoc5Y7p79L
	1tP3xKDkS0IogRA=; b=wIyGwxiTM97DFQgPX8br04l4NUp1wbd4F4aPRoaUOJ69
	IWjYFE2zpRpr2ZuCwawUtQP0xu1riAaYJcF8USi+pvWpGBrvqxzl6qy9M8HeUTvj
	kVxQ7atxp6oErsgqwVoswrTCwbaiyfyUdp8+oN7eMDHgG5G6bSbHffjZHTbQsPbP
	IflwKJRYQrIc3e2sOalAP3O2nnPS7RFCYwh52d72tHyVVP1qCEG8loNKTO3Li5SS
	3ttm0HswwW743xnKX1Ty4B5+hDe8/KcLasvI/O1mopYD2mG+ye8Mw2HvxrKxhJv0
	BtW1IYz8le5pBrV97eBtuTiYg1cJRixjcewJiJzDtg==
X-ME-Sender: <xms:xEEFZjUDB6vUXVuE4su_mfFztVEXuLQBqnkQAhHLwG1jR8Gk4Rhccg>
    <xme:xEEFZrkXsFEZpvOySs979kbBxybPVD4HPzNHJDAuQc2A74iPvQQqs8EEN8sgZ1AOY
    -B735Q1j88_yj5yeME>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudduledgudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:xEEFZvanNkHDHk3D4daIt3HN3RRy4VJsLZBS_5xTq6OZ_s46lBHeqg>
    <xmx:xEEFZuXz105eJN6iaqF1LnVwLMEtc10LEM014QjmGYfrwvQMnV9zQQ>
    <xmx:xEEFZtlackC-bm2ZG6jhrgNjSy9Qg70Et6FoLLjgTPEKil-mStUOQg>
    <xmx:xEEFZrdAQp1QGnibQ6HQuAZmU_FkzEzvep2EzwBzRXg0_5Nan7e3Mg>
    <xmx:xkEFZvTJcmNZMFGcjkzffyZ1DB1SyuiY0BkmrH3Smejf5bob7fZc1n9GOA0>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E6410B6008D; Thu, 28 Mar 2024 06:09:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-333-gbfea15422e-fm-20240327.001-gbfea1542
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <2e9257af-c123-406b-a189-eaebeecc1d71@app.fastmail.com>
In-Reply-To: <ZgUGXTKPVhrA1tam@matsya>
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-3-apais@linux.microsoft.com> <ZgUGXTKPVhrA1tam@matsya>
Date: Thu, 28 Mar 2024 11:08:47 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Vinod Koul" <vkoul@kernel.org>, "Allen Pais" <apais@linux.microsoft.com>
Cc: linux-kernel@vger.kernel.org, "Tejun Heo" <tj@kernel.org>,
 "Kees Cook" <keescook@chromium.org>, "Hector Martin" <marcan@marcan.st>,
 "Sven Peter" <sven@svenpeter.dev>,
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
 HaraldWelte@viatech.com, pierre@ossman.eu, duncan.sands@free.fr,
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

On Thu, Mar 28, 2024, at 06:55, Vinod Koul wrote:
> On 27-03-24, 16:03, Allen Pais wrote:
>> The only generic interface to execute asynchronously in the BH context is
>> tasklet; however, it's marked deprecated and has some design flaws. To
>> replace tasklets, BH workqueue support was recently added. A BH workqueue
>> behaves similarly to regular workqueues except that the queued work items
>> are executed in the BH context.
>
> Thanks for conversion, am happy with BH alternative as it helps in
> dmaengine where we need shortest possible time between tasklet and
> interrupt handling to maximize dma performance

I still feel that we want something different for dmaengine,
at least in the long run. As we have discussed in the past,
the tasklet context in these drivers is what the callbacks
from the dma client device is run in, and a lot of these probably
want something other than tasklet context, e.g. just call
complete() on a client-provided completion structure.

Instead of open-coding the use of the system_bh_wq in each
dmaengine, how about we start with a custom WQ_BH
specifically for the dmaengine subsystem and wrap them
inside of another interface.

Since almost every driver associates the tasklet with the
dma_chan, we could go one step further and add the
work_queue structure directly into struct dma_chan,
with the wrapper operating on the dma_chan rather than
the work_queue.

      Arnd
