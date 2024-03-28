Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD1A7E787;
	Thu, 28 Mar 2024 16:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711642898; cv=none; b=ZmdinYQ81tKppTn4DD33yp8jNWf52d2OoNOPFfWkSXfdwPaaDroiiL8YT9f0AkvPaJuN/avIlprs9xCiuzhs0CiKOFRcOvTYnd7lpWd9Cw0u5p/3XRIlu0NXWHXk1GyI297F6TD8GBa//F/XBTWUDgP23/5z9FKsiwAm7DCerMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711642898; c=relaxed/simple;
	bh=cb1ZOrJZuOdP2ez095r01xUHOIJ2EXFtH/u5E76hFpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UAhf7W5BBJMJ3JZlhj6tK4Y1CsQk7EUJvVfC80lWKgREqWMNqXlf/ocVGknyxh5SDRV1yyydgQno6frJ/+VV5GIrZfWNP2hAR89j6QBAiI9UUcXx+LGljNLQaibuKlMk7y1PHr9Aup9Q/+YgNXU/5Qbwo1sw5shnsM++cljPDco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PRwpehZU; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PRwpehZU"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6e782e955adso1090001b3a.3;
        Thu, 28 Mar 2024 09:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711642896; x=1712247696; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TpQlnbUKf5vfOk3TpOVHNGMqh00k5XUuxEvlHT+naYc=;
        b=PRwpehZUEAMtBl2quzmoug81sDcfgHD7qpUhEQrUbJUwC0XUsOHh+JVi02UIkyv8em
         AP1/GnfpuYKMEN/5Tf4jKOWTiWgp/iI7Z7FyqCqmbwfSAgkbN50fKtisCeN4FU7WLLOs
         Nd9gWZumRmf6f0bN6U0ztssJjhbocp6MTesM9q68LHWlDxA9Ska361i/V9abXs5YApLB
         b23SfFSe8oLjX6DF8iC7jlQK9dC94R1XlvyFK0hvPTn9QDbyP6LPvVjOUFkqaZ6IwLyh
         oISKZvTnbysPTwgvG/w3Qeybb90ebCPEChwkwEGUODRxk6IctP3TGrch1SF7pI+E04J7
         Yz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711642896; x=1712247696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TpQlnbUKf5vfOk3TpOVHNGMqh00k5XUuxEvlHT+naYc=;
        b=Ye8EX68IcKPwMjYPGZb5o05T7axEWKUs1gO2Q7xSgj/DwXXs0OsLn58gvsAm198knp
         7AYpjAn4/LOny7addQmONV4qNu5ZiNtzebsrgRm3vLcEFE8qlnnVtd2HUsprDseps471
         cUhsYlSP//oax2aFhIhWcosWRzwySszHtX2BJ6giJFtEA3noz9gaiJDqrgy0PQNywgj2
         XlLgA5Go5IxpjmJdeJ5MpJaQ08rYfm5BhtahN3wd6yNT/KcXt18Fn+GhZcitESlWcdcc
         uocn/U82PZ2bX79IXr+AJCsynj4WDo3uI191n4i9CMkDPMcYHYhz555L9JXggcPCd2sj
         VJKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXmd2okOInvOHStmOCTbh1wOo+lKobMK93yquXcE+SQtbsZ0CSRynsEsDKMmwoZLG5yjao0yg7PRYAed2HmPnjJ5NTfrn2tSzW1DxQMGIizwntw8Uime1/jJ/OpqY2cNWK6vT9v9JHBHE3QrsJHJ2TA4qzLkLUSQ==
X-Gm-Message-State: AOJu0YxSP0/ExsxxQWA6VxqKSEI7bsM1hgDOyHyTCZRTHMiy87F+hUXE
	bvgRl5hD76OekZyo2liWO6o03YFPsW0INIiwikniju7X3k79vvTD
X-Google-Smtp-Source: AGHT+IHNLtSIfLiMjPgdNbH73n29Rqo4mQsh/oBERN464FH6NwbPkAtXL24hv7Aec7RU+H+HqkGb1w==
X-Received: by 2002:a05:6a20:7495:b0:1a5:7308:3297 with SMTP id p21-20020a056a20749500b001a573083297mr1591044pzd.0.1711642896210;
        Thu, 28 Mar 2024 09:21:36 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:4d4e])
        by smtp.gmail.com with ESMTPSA id fd37-20020a056a002ea500b006eab6ac1f83sm1576815pfb.0.2024.03.28.09.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 09:21:35 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Thu, 28 Mar 2024 06:21:34 -1000
From: Tejun Heo <tj@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Allen Pais <apais@linux.microsoft.com>, linux-kernel@vger.kernel.org,
	keescook@chromium.org, vkoul@kernel.org, marcan@marcan.st,
	sven@svenpeter.dev, florian.fainelli@broadcom.com,
	rjui@broadcom.com, sbranden@broadcom.com, paul@crapouillou.net,
	Eugeniy.Paltsev@synopsys.com, manivannan.sadhasivam@linaro.org,
	vireshk@kernel.org, Frank.Li@nxp.com, leoyang.li@nxp.com,
	zw@zh-kernel.org, wangzhou1@hisilicon.com, haijie1@huawei.com,
	shawnguo@kernel.org, s.hauer@pengutronix.de, sean.wang@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	afaerber@suse.de, logang@deltatee.com, daniel@zonque.org,
	haojian.zhuang@gmail.com, robert.jarzmik@free.fr,
	andersson@kernel.org, konrad.dybcio@linaro.org, orsonzhai@gmail.com,
	baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
	patrice.chotard@foss.st.com, linus.walleij@linaro.org,
	wens@csie.org, jernej.skrabec@gmail.com, peter.ujfalusi@gmail.com,
	kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
	decui@microsoft.com, jassisinghbrar@gmail.com, mchehab@kernel.org,
	maintainers@bluecherrydvr.com, aubin.constans@microchip.com,
	manuel.lauss@gmail.com, mirq-linux@rere.qmqm.pl,
	jh80.chung@samsung.com, oakad@yahoo.com,
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org,
	brucechang@via.com.tw, HaraldWelte@viatech.com, pierre@ossman.eu,
	duncan.sands@free.fr, stern@rowland.harvard.edu, oneukum@suse.com,
	openipmi-developer@lists.sourceforge.net, dmaengine@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-mediatek@lists.infradead.org,
	linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-media@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-s390@vger.kernel.org,
	netdev@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 9/9] mmc: Convert from tasklet to BH workqueue
Message-ID: <ZgWZDtNU4tCwqyeu@slm.duckdns.org>
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-10-apais@linux.microsoft.com>
 <CAPDyKFpuKadPQv6+61C2pE4x4FE-DUC5W6WCCPu9Nb2DnDB56g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFpuKadPQv6+61C2pE4x4FE-DUC5W6WCCPu9Nb2DnDB56g@mail.gmail.com>

Hello,

On Thu, Mar 28, 2024 at 01:53:25PM +0100, Ulf Hansson wrote:
> At this point we have suggested to drivers to switch to use threaded
> irq handlers (and regular work queues if needed too). That said,
> what's the benefit of using the BH work queue?

BH workqueues should behave about the same as tasklets which have more
limited interface and is subtly broken in an expensive-to-fix way (around
freeing in-flight work item), so the plan is to replace tasklets with BH
workqueues and remove tasklets from the kernel.

The [dis]advantages of BH workqueues over threaded IRQs or regular threaded
workqueues are the same as when you compare them to tasklets. No thread
switching overhead, so latencies will be a bit tighter. Wheteher that
actually matters really depends on the use case. Here, the biggest advantage
is that it's mostly interchangeable with tasklets and can thus be swapped
easily.

Thanks.

-- 
tejun
