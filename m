Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CC33DAC10;
	Thu, 28 Mar 2024 19:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711654784; cv=none; b=ukKgFAEtQc+sQAuWCKi5Tq/C6cNhcPYm1gjotEoUzdmMNwW7atWq4Zm10/Y6t/1if/L5j7vrjGc9UbFJ2WK1f5s2CGYcMX3h6wINqlvrri6s8n6pZyFsUx6H1KLa05ok1e6jZT+J4LcrxNzAwvw8H9W3v8lOB0w7BjPcZEH50nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711654784; c=relaxed/simple;
	bh=622VK9NVBI6NV/BHlHroiE+gl2GqatwpJmnEQrqKhSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AAiJpcXwdgg5DvIlDQ9mjTcXNUrXMnoZ692sxpEf1JCtuqpleI8IclxaGol+ttZ3HQqbDvg12OM68havwHG3iw8QheT18vBhOZbQKpmc+JItJVVaNbE0/dAXODpAOI5he/A8uthcNp2upuMMx47r5Mnd8RJAq8gyspqZtFMRpHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=McOpnfK1; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="McOpnfK1"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-7e05d68723dso281197241.1;
        Thu, 28 Mar 2024 12:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711654782; x=1712259582; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=622VK9NVBI6NV/BHlHroiE+gl2GqatwpJmnEQrqKhSw=;
        b=McOpnfK1RfDKKXrOb6VfqSMuEWa0Z7p5512jwmZpq2/t0QVysXH3PZJpEwvGo/Jf9s
         fG0Bt4LIPLzUVMEX154g8FVnzH085nMTydebVv6QzzoS+MYNQbBmllTE5Yt6kaXuKXbB
         M+ooEsS0iBDF9hdRRlAnNzDXlYxxkRrBdIbl/ccLTXj0P7bqbLQoRTo1hWK/mGfqB5Tf
         YA6Z6lxPqGnNnsrX9C6JVu9tP0yZN+6q7TZ5fB0hOaZOwgwxWs491bFcs12ABM/HSzQU
         oTiTriQ7ocbZNaKpdkLGEd66WcEi2nHEC5t/IVGl0BjB85J6EC68/0yz+hN7aFQYOYqc
         X3MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711654782; x=1712259582;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=622VK9NVBI6NV/BHlHroiE+gl2GqatwpJmnEQrqKhSw=;
        b=fxdf/p/xbEYBZsd9MegDWjRprVsCfGjY5pS6YrB88C3n4Rdnzzy57ndVJOtbAVL6cL
         NpfadmtRcD2s/PBunGxzJOEjdke0AuGFF3k/YzJvMffzcH2UMPl84igzJi9PZt0x6MN7
         jJIhDzIyzhutyHCyiKzqFYW7tUK4nheAKrcHom7mS35+BDdEA6qSlo5xJL6LuO1KoEQ/
         GsSHb+cPvh1dSqkJZDqu3FiC3KUo5OM7KxAGwCKmZVDWfDSaTKN7YGpFjm4bH543nYVl
         v0sgt1q1wLj0ERrN8Gw5DdOVvNzcWid4GT36cxOOaOC4QgS4EO9jVSMU4fOC1FwuxW3w
         Z5qg==
X-Forwarded-Encrypted: i=1; AJvYcCWIa83GASUpYotKQqAL4t3QlG9Uo1hebzDNM6siilElxuwnfEE0HxSBTy6u+o16MODhT5jhAeEApEQ6QwXh8ZoUGPKj5/Q+vev/cOxBEaOlFggX5XeNydANDWmEIePSf1BrtOmevru2++kbj4KdLeywuxD3Q3Sbgw==
X-Gm-Message-State: AOJu0YxN0Nkv7GSq/J6X32ggXumGhfsyE4GI3embFAl8mF0N/7GDyGgq
	Y2fJKVm058dLngmnJqTVSUtCqERUcGARC6y0h8Vdn5A2c9/1FZL1PdLOE/7Oqtwg6aia0GvbBPG
	SPlx+86dd84ZAC/rh4xRqIQybtwc=
X-Google-Smtp-Source: AGHT+IEY59Ji/OARBUAoYgwqWp5p4Pop3R94bZWuKlJaRj9K8xYwJ5pD7jLBPmXxcg5SXNElqhUUtT98mEK7bvSO2Kc=
X-Received: by 2002:a1f:c801:0:b0:4d4:1cca:1a72 with SMTP id
 y1-20020a1fc801000000b004d41cca1a72mr369742vkf.6.1711654781874; Thu, 28 Mar
 2024 12:39:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-3-apais@linux.microsoft.com> <ZgUGXTKPVhrA1tam@matsya>
 <2e9257af-c123-406b-a189-eaebeecc1d71@app.fastmail.com> <ZgW3j1qkLA-QU4iM@matsya>
In-Reply-To: <ZgW3j1qkLA-QU4iM@matsya>
From: Allen <allen.lkml@gmail.com>
Date: Thu, 28 Mar 2024 12:39:30 -0700
Message-ID: <CAOMdWSKY9D75FM3bswUfXn2o7bGtrei3G5kLt6JdcdOPDXaG8g@mail.gmail.com>
Subject: Re: [PATCH 2/9] dma: Convert from tasklet to BH workqueue
To: Vinod Koul <vkoul@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Allen Pais <apais@linux.microsoft.com>, 
	linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, 
	Kees Cook <keescook@chromium.org>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Paul Cercueil <paul@crapouillou.net>, Eugeniy.Paltsev@synopsys.com, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Viresh Kumar <vireshk@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Leo Li <leoyang.li@nxp.com>, zw@zh-kernel.org, 
	Zhou Wang <wangzhou1@hisilicon.com>, haijie1@huawei.com, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, logang@deltatee.com, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, peter.ujfalusi@gmail.com, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, maintainers@bluecherrydvr.com, 
	aubin.constans@microchip.com, Ulf Hansson <ulf.hansson@linaro.org>, 
	Manuel Lauss <manuel.lauss@gmail.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	"jh80.chung" <jh80.chung@samsung.com>, oakad@yahoo.com, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	brucechang@via.com.tw, HaraldWelte@viatech.com, pierre@ossman.eu, 
	duncan.sands@free.fr, Alan Stern <stern@rowland.harvard.edu>, 
	Oliver Neukum <oneukum@suse.com>, openipmi-developer@lists.sourceforge.net, 
	dmaengine@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-mediatek@lists.infradead.org, 
	linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-media@vger.kernel.org, 
	"linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>, Linux-OMAP <linux-omap@vger.kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-s390@vger.kernel.org, 
	Netdev <netdev@vger.kernel.org>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > >> The only generic interface to execute asynchronously in the BH context is
> > >> tasklet; however, it's marked deprecated and has some design flaws. To
> > >> replace tasklets, BH workqueue support was recently added. A BH workqueue
> > >> behaves similarly to regular workqueues except that the queued work items
> > >> are executed in the BH context.
> > >
> > > Thanks for conversion, am happy with BH alternative as it helps in
> > > dmaengine where we need shortest possible time between tasklet and
> > > interrupt handling to maximize dma performance
> >
> > I still feel that we want something different for dmaengine,
> > at least in the long run. As we have discussed in the past,
> > the tasklet context in these drivers is what the callbacks
> > from the dma client device is run in, and a lot of these probably
> > want something other than tasklet context, e.g. just call
> > complete() on a client-provided completion structure.
> >
> > Instead of open-coding the use of the system_bh_wq in each
> > dmaengine, how about we start with a custom WQ_BH
> > specifically for the dmaengine subsystem and wrap them
> > inside of another interface.
> >
> > Since almost every driver associates the tasklet with the
> > dma_chan, we could go one step further and add the
> > work_queue structure directly into struct dma_chan,
> > with the wrapper operating on the dma_chan rather than
> > the work_queue.
>
> I think that is very great idea. having this wrapped in dma_chan would
> be very good way as well
>
> Am not sure if Allen is up for it :-)

 Thanks Arnd, I know we did speak about this at LPC. I did start
working on using completion. I dropped it as I thought it would
be easier to move to workqueues.

Vinod, I would like to give this a shot and put out a RFC, I would
really appreciate review and feedback.

Thanks,
Allen

>
> --
> ~Vinod
>
