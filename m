Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594B91386A1;
	Thu, 28 Mar 2024 20:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711656128; cv=none; b=ZPUfzmdGYCy3bYpmTQowKXzzHSrZPLUTKJ9YSelnSiGhDmpLePMB16wCcidwnRKF1qYmLjRmHNwa+pBOSkYwxKcCJEbB0lGx3ZbtOgtk7I4tqFcs4yC8+71WQzVXovtdFg+pruSukJCd5o0Cf1VwPL5+FywdLjwKbWKoIfBS+NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711656128; c=relaxed/simple;
	bh=vbVoj5mONYHNgf9JQ9GQnrB9tevCRqpIKROsT3wC2Fk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XbYYRbybNF4yZ/F+RBZS6eFAhT3kirlVGK8NAmLO9+kgNkLm2XEvNsDYQMf0mI1FGgqCqyK2IaX/KS9Ml+IMZ6bzneC2TiPIUptq79VKBFZkk8ZQBrACA66VySoqhctEZNOpURCTPmx2dQaA3Cg0weOT0FL0SC40XgpBY9Etr7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uq1su02V; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uq1su02V"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-78a5f7269e3so219219885a.1;
        Thu, 28 Mar 2024 13:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711656126; x=1712260926; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lQZIemFmXjC6xyiLulQ43Ea/EhoY/GbG4RXFhJQU0/8=;
        b=Uq1su02VcCZlbqpa9vgZYpmwFJF8NhK3iBc2Gqnrjedx0pOAmd+tRJPUhutAPxXnm5
         caNywP4CAb5iH6x1z48iRsDv97vYcmA2LgVUcIcG92BYaxgzbjGPSFP7NgYviZRxnppz
         6zao87gwbCT2lqTvs41MpFhY/G5Lx8jEwziIbh6e0ZVTuI3F/+GTEadrzFdL1uiVNiRX
         nMjIqHCnryMGJ5wshHUmXlDXzI+tJb8T6wHlAhiu+NUmdMgbSy6M4CXnQRPvgiJX8Uc1
         nbZduvSaBjcQYIbLwhAGcyNo3q/+K9ngh01uv3OW5yr6xHkU/XACQ2RJFe1Oaj9cVfez
         1pow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711656126; x=1712260926;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lQZIemFmXjC6xyiLulQ43Ea/EhoY/GbG4RXFhJQU0/8=;
        b=g/FqtJvMg5MqjYrXcOT6LVeMpCw7JulAUW1gRrVU/VJWmznQh+ehIoUMVj77GsXGcr
         i+c50ZvN7jmOp66ZRqUDU4SHt1mbzzArDLQOO3/dWje53Gs0vzzHHyGSo0GNn2FKyUPw
         mnomLzwT+gAkBqJMTK4Z1jweOE/qMbWsYhxWOZs9oWwvd65PEHiM3v0F+j0/2dYde3iw
         Ouk0jcbkXFuNr/45hluA69qY/uRyeCTIBLorExFi25SsolziylJF2sG7DTW9W9FI+bxf
         ud/xKajSx6czyHG1oy6POR4Wpi3Jt2Mcqa5JosKkz8QlHectrGnf4ylQq6qmFWaHvl2d
         Z/RA==
X-Forwarded-Encrypted: i=1; AJvYcCVPRFrAmXTrmvpn8ZDLThk4prA3b3/Kz44Tf8BRprhfLLS3imIqSSHJzmZW50OjOjs4wdosutb4DudlGHD4YEuLYf24sDY49ipuKJ+yN/fzQQvALtAalxUix7Camk8MYyLSG8VYgrxcs0Sdq+DgxGdh4MtMMRahDA==
X-Gm-Message-State: AOJu0YzRPClZ6HYC9L0UrXJy4EslAGB22Lv20Q6zaGt4L3oIphmSGleS
	KIDNADGWI3VgXO08IvZbI42axLCVpVSBgUE5VWYktC6HX3tsIMh5PLsMhB6t0HlL68PyBfc4Opo
	3c5hlOFRso0RaHclBys+ecqC8g0Y=
X-Google-Smtp-Source: AGHT+IFQNOvoxYEranyGbOCvmAR4etDDhau+OcrTFex7JkKGx6yINzP/h18hs1c4qiY1arvh6SuEYWtwfkxWkgaJ4wM=
X-Received: by 2002:a05:620a:c4e:b0:78a:62a6:7e2f with SMTP id
 u14-20020a05620a0c4e00b0078a62a67e2fmr5081544qki.5.1711656126274; Thu, 28 Mar
 2024 13:02:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-3-apais@linux.microsoft.com> <ZgUGXTKPVhrA1tam@matsya>
 <2e9257af-c123-406b-a189-eaebeecc1d71@app.fastmail.com> <ZgW3j1qkLA-QU4iM@matsya>
 <CAOMdWSKY9D75FM3bswUfXn2o7bGtrei3G5kLt6JdcdOPDXaG8g@mail.gmail.com> <678ba20b-9f1d-41cb-8a25-e716b61ffafe@app.fastmail.com>
In-Reply-To: <678ba20b-9f1d-41cb-8a25-e716b61ffafe@app.fastmail.com>
From: Allen <allen.lkml@gmail.com>
Date: Thu, 28 Mar 2024 13:01:55 -0700
Message-ID: <CAOMdWSKC4B8zn6N+=5DssB_BiR6JkHBEpJr0ohKb149eJvCKMQ@mail.gmail.com>
Subject: Re: [PATCH 2/9] dma: Convert from tasklet to BH workqueue
To: Arnd Bergmann <arnd@arndb.de>
Cc: Vinod Koul <vkoul@kernel.org>, Allen Pais <apais@linux.microsoft.com>, 
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
	Duncan Sands <duncan.sands@free.fr>, Alan Stern <stern@rowland.harvard.edu>, 
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

> >> > Since almost every driver associates the tasklet with the
> >> > dma_chan, we could go one step further and add the
> >> > work_queue structure directly into struct dma_chan,
> >> > with the wrapper operating on the dma_chan rather than
> >> > the work_queue.
> >>
> >> I think that is very great idea. having this wrapped in dma_chan would
> >> be very good way as well
> >>
> >> Am not sure if Allen is up for it :-)
> >
> >  Thanks Arnd, I know we did speak about this at LPC. I did start
> > working on using completion. I dropped it as I thought it would
> > be easier to move to workqueues.
>
> It's definitely easier to do the workqueue conversion as a first
> step, and I agree adding support for the completion right away is
> probably too much. Moving the work_struct into the dma_chan
> is probably not too hard though, if you leave your current
> approach for the cases where the tasklet is part of the
> dma_dev rather than the dma_chan.
>

 Alright, I will work on moving work_struck into the dma_chan and
leave the dma_dev as is (using bh workqueues) and post a RFC.
Once reviewed, I could move to the next step.

Thank you.

- Allen
