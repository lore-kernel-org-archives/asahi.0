Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46E61EA6E;
	Thu, 28 Mar 2024 19:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711654896; cv=none; b=OKJv6Ur/UQlzQZY9xz29yzGzZOLeVXdktgRkx5/YSvsr2xHkrDhUT2hz1gk9XZwMd1lKVYoS+26EKwArXiApbeAiKG5F6972acEN36xkJ2OytOFWBpi7nOntoqqAthV1RbCx1seNhdIhDR2aFt9qWbgMg20jK9U2DvXxsauEuyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711654896; c=relaxed/simple;
	bh=t4KQY4ygYmx+OB/j4jytyezWMylsTqngvr/2VLyyCA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nAWBwEfynDA2Hy4LVHSlIGU+4fcn4fkT+L+P0cKA0sl2rvVLL3EfM76RvCJ7guKQ+8hi/drhcdiwlfMNiCbjY4QDXj4IwVpDBCQ2BlySofu6nx5fHOQdSOqFfFzkaDoppxWF9o/HATp87vIEqJ+JHGSYpUKiWftz3xNyMdcs5mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aQW09tQ0; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aQW09tQ0"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-4d435a60217so487871e0c.0;
        Thu, 28 Mar 2024 12:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711654894; x=1712259694; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WIYRUJlYf8k4Ww5l6bxXyNzs1Z7gSD0K+4rAhlyLzPk=;
        b=aQW09tQ0T7LE6l257DxB60MpIcb4usI3Kq/pdHlACOfeYtgBbRmjzQrcyx/TExQ9Tl
         HkxU9UPkNi9MenD5qDjfE1OCr7HcbekRU8jOEfRtX+IJZuj7DT+a3X55JoeI5syHPlu1
         f9ApOQxBlci+szWozbIRI0DXhf7mMV2zdd2+SGDMh/aW2Rd+tyAurEu/C3qhbqX+M0in
         kUDVEPnccuDVgk7Bxitv40H0E92RKa1NH5JMCSlaSEYI/HUwH9ToyoeQjVN9bg4wpZKw
         XkIWn/hJJxfMDHAhmUWPMjlQIkTQPpVGjvzO+8gwsGA64qKmRvU3wzVt1vu2Nm+TBbnZ
         GUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711654894; x=1712259694;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WIYRUJlYf8k4Ww5l6bxXyNzs1Z7gSD0K+4rAhlyLzPk=;
        b=R8qh196rnWXxj9qhgGTvEGBwX8qnHR6Ri+T4gCe7yQKS/mNZcEu8tzPOKcmfT2VkAG
         sz8bKI0gFHQOYqq5DEligLVsO9+VkKMgDjASCtx7NPkTM2aBQet0EeM7f1aJpH5P1MpM
         l+oGmNeOZNXgLrZoG0SYWoQtbn98oN+B++ADY+hbDwHmTHGRqsQ4x3xLA3H8whGzBlb7
         smr8YCOpFfpvFX6YPytm9b58U1MgAUvnXx6suyLt4B5OygeIkQ0WEcVhGakbkNFDhR2v
         QmUYVsDG95eRtLO3lTfk96tv+5voqpW/16irMfv8fXk0SsVFSX7+6CB0QPgKT5Dy4QLK
         nDpQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7j6EkqAKoiQg3KOLZjMsX7g5XTWOXPXYJ4Fp3dx1gbWBnha6rMUJfHzm9CCbhQrdP476208CZNUkKGGC/LAhTqxWpueVuzhCSd0aUylAEWsH+kJh70XJy2i0yYzOgiSKu/9wS+PI1UePJW6GxqJojl/CndjoNVQ==
X-Gm-Message-State: AOJu0Yxy0lNNgH7Y5aSRpCj3Phxqm5Y8xD4Nd5FjFywjszy5+zLT+eG5
	+7paKVeB/+znpI/zcNbX5O6apGOJ78ust98BeFtFpsAta/b+ITpC5aNtgqL9n2UYVCUK7K2xdLm
	eVvPVVSMF0x4z5kERwzf2csGbYE8=
X-Google-Smtp-Source: AGHT+IF7RrkP6jmtYq8PnUCxuTgzt2Qt4CTC9MlCAHIq165hbFM88DzkJJ/z4aTnoTdb1soUmIZQWdyI4gYKg4Ogr2U=
X-Received: by 2002:a1f:ebc2:0:b0:4d3:43f8:8541 with SMTP id
 j185-20020a1febc2000000b004d343f88541mr348710vkh.1.1711654893631; Thu, 28 Mar
 2024 12:41:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-7-apais@linux.microsoft.com> <ZgRePyo2zC4A1Fp4@mail.minyard.net>
 <CAOMdWS+1AFxEqmACiBYzPHc+q0Ut6hp15tdV50JHvfVeUNCGQw@mail.gmail.com> <ZgXDmx1HvujsMYAR@mail.minyard.net>
In-Reply-To: <ZgXDmx1HvujsMYAR@mail.minyard.net>
From: Allen <allen.lkml@gmail.com>
Date: Thu, 28 Mar 2024 12:41:22 -0700
Message-ID: <CAOMdWS+nB5EENp_Vb=k1j77nrch5JgbZP2XYPJ2ieTja14zB0w@mail.gmail.com>
Subject: Re: [PATCH 6/9] ipmi: Convert from tasklet to BH workqueue
To: minyard@acm.org
Cc: Allen Pais <apais@linux.microsoft.com>, linux-kernel@vger.kernel.org, tj@kernel.org, 
	keescook@chromium.org, vkoul@kernel.org, marcan@marcan.st, sven@svenpeter.dev, 
	florian.fainelli@broadcom.com, rjui@broadcom.com, sbranden@broadcom.com, 
	paul@crapouillou.net, Eugeniy.Paltsev@synopsys.com, 
	manivannan.sadhasivam@linaro.org, vireshk@kernel.org, Frank.Li@nxp.com, 
	leoyang.li@nxp.com, zw@zh-kernel.org, wangzhou1@hisilicon.com, 
	haijie1@huawei.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	sean.wang@mediatek.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, afaerber@suse.de, 
	logang@deltatee.com, daniel@zonque.org, haojian.zhuang@gmail.com, 
	robert.jarzmik@free.fr, andersson@kernel.org, konrad.dybcio@linaro.org, 
	orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com, 
	patrice.chotard@foss.st.com, linus.walleij@linaro.org, wens@csie.org, 
	jernej.skrabec@gmail.com, peter.ujfalusi@gmail.com, kys@microsoft.com, 
	haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com, 
	jassisinghbrar@gmail.com, mchehab@kernel.org, maintainers@bluecherrydvr.com, 
	aubin.constans@microchip.com, ulf.hansson@linaro.org, manuel.lauss@gmail.com, 
	mirq-linux@rere.qmqm.pl, jh80.chung@samsung.com, oakad@yahoo.com, 
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org, brucechang@via.com.tw, 
	HaraldWelte@viatech.com, pierre@ossman.eu, duncan.sands@free.fr, 
	stern@rowland.harvard.edu, oneukum@suse.com, 
	openipmi-developer@lists.sourceforge.net, dmaengine@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-mediatek@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-s390@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > > I believe that work queues items are execute single-threaded for a work
> > > queue, so this should be good.  I need to test this, though.  It may be
> > > that an IPMI device can have its own work queue; it may not be important
> > > to run it in bh context.
> >
> >   Fair point. Could you please let me know once you have had a chance to test
> > these changes. Meanwhile, I will work on RFC wherein IPMI will have its own
> > workqueue.
> >
> >  Thanks for taking time out to review.
>
> After looking and thinking about it a bit, a BH context is still
> probably the best for this.
>
> I have tested this patch under load and various scenarios and it seems
> to work ok.  So:
>
> Tested-by: Corey Minyard <cminyard@mvista.com>
> Acked-by: Corey Minyard <cminyard@mvista.com>
>
> Or I can take this into my tree.
>
> -corey

 Thank you very much. I think it should be okay for you to carry it into
your tree.

- Allen
