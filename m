Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22AF80639
	for <asahi@lists.linux.dev>; Thu, 28 Mar 2024 13:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711633046; cv=none; b=Lqi77lZGQ07XGfRTta1ikMOuAhF8iiaOlU+cOmQ9+M44bzJ+BrhZEjt5QWqCZupfu0VZK0m/A0lE32jt4SVNOotFjFY4xrWmVmYG6epirMZAMuIcWFNz1sdFGPvqCHoqhhGkVKPpJqgyj5/jfwxSgxFBdfGvRyutiUIYaqjb/Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711633046; c=relaxed/simple;
	bh=vhptj9/Vq4Rm0PoGzxaGiCJqIgDUZwkAbXDvc9ksjDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YTh4ycN866jOSGSCnKCLEc8gclE0T2Sm0Fglz44KxOvIJWg3jV3UFiQPVCXC7SP+DrbQON/D/9gUwAnxCrYzgRqZRZ0r6uQrghIWkedpwE/sk6RSXYFx1b5b3/fxW53YN6q/U5OOBM9phzuKzaajpO5rFIbB3QY0tdX/gBXc9uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SIqWtTFM; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SIqWtTFM"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dc742543119so993858276.0
        for <asahi@lists.linux.dev>; Thu, 28 Mar 2024 06:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711633042; x=1712237842; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhptj9/Vq4Rm0PoGzxaGiCJqIgDUZwkAbXDvc9ksjDI=;
        b=SIqWtTFMnJtqqu4rJ/7MLgT7CdeN2PIerRgt0FN/tyjx45poQJrq1FkKE5Zm6DJcPO
         JXX9/Y+EhjWDy1IIax/bvNgEdiSf5ug3MGPCGaqR3sbIB6QNf6UApGeawmXRsZEB3Eei
         dQQchif24DT0hEvP0uazYArBzdhgPQQMq74aaZAubQmmrfb24Wyp7KBjzWa6z2YDKcXe
         tdm32XhhH2j1vqk+j6dOXoPrPQq95HCsYVDcWspPoysQrxh91a0dutyMgwvyqtxq32z+
         4tW90BqZyuthfpcXmwHCCdJJDBnIB0N+6KnGHiykPp/Gd/4HOUkj/lFY9HBLJ8Xd18Nv
         x6Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711633042; x=1712237842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vhptj9/Vq4Rm0PoGzxaGiCJqIgDUZwkAbXDvc9ksjDI=;
        b=QLRJAaZQ04l9tlyQYu6/pxySDmrbGGKYU/JurGOOAoJ61ZlitbfgpEIpbFFRQDKW8e
         zhfWwpvkOaXrSbI/gT5i3OCpkAX2NQ1pcUXKyd4npU6tzByvrgu4Cft+RPYT5YuZZyHq
         6KDHAxmTCRn2BxOOnknXbf8FSw00ymlYaL/oF51Dwusjn1+k2LVQtkxmLiIOT0+z6rfY
         2AEDAVvx+wuvxID3wuzWNH3cdGVJ22QBB4xFXHcL6rNrqCH8QGG4O+PJLl/fYXgmSVSS
         R/LpCGkWP9laJ89j1v0XIg9qFpfUXf4me751ZoRPyEcoschd9qJjmyp6BBmNOIXCC9EU
         yJcw==
X-Forwarded-Encrypted: i=1; AJvYcCUsaVOi/9aLPXJL9FwqOtK2ElRrUba0yY52Ql1oeGz2K6br//Nn7NX7L4qWvA9yXfajecPL1VI1ASvUfQHxatX/rep2EOY=
X-Gm-Message-State: AOJu0Ywn0gyBYHKk5PGyBFzlqRCfAnaItQsnV5eIirLjrGbgQVYHvGLq
	rhK9vZfSQ/WXQTVc3TPGa2awWJS2FqPQDcZLoiOle1D/T482paH+8973er9opu3qWxIsGBI5cO4
	aXVxkPMRvJ9t3j0hJZ2cbzutJ5EYO5XHE927pGQ==
X-Google-Smtp-Source: AGHT+IGjGHEbsk10nKTaVGgOOQzkHc5Qm9STf87bHGVpMP0DEmjO9lKjEWUgvRJ23UvcJC23rRkiymMtwiTmbVMLRs0=
X-Received: by 2002:a25:b9ca:0:b0:dd1:3cc1:5352 with SMTP id
 y10-20020a25b9ca000000b00dd13cc15352mr2820459ybj.15.1711633040798; Thu, 28
 Mar 2024 06:37:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-10-apais@linux.microsoft.com> <CAPDyKFpuKadPQv6+61C2pE4x4FE-DUC5W6WCCPu9Nb2DnDB56g@mail.gmail.com>
In-Reply-To: <CAPDyKFpuKadPQv6+61C2pE4x4FE-DUC5W6WCCPu9Nb2DnDB56g@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Mar 2024 14:37:09 +0100
Message-ID: <CACRpkdZ7wAbtTUmmLCef7KnATmfZeAL26Q-gLqnGe3CdZ3+O3A@mail.gmail.com>
Subject: Re: [PATCH 9/9] mmc: Convert from tasklet to BH workqueue
To: Ulf Hansson <ulf.hansson@linaro.org>
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
	patrice.chotard@foss.st.com, wens@csie.org, jernej.skrabec@gmail.com, 
	peter.ujfalusi@gmail.com, kys@microsoft.com, haiyangz@microsoft.com, 
	wei.liu@kernel.org, decui@microsoft.com, jassisinghbrar@gmail.com, 
	mchehab@kernel.org, maintainers@bluecherrydvr.com, 
	aubin.constans@microchip.com, manuel.lauss@gmail.com, mirq-linux@rere.qmqm.pl, 
	jh80.chung@samsung.com, oakad@yahoo.com, hayashi.kunihiko@socionext.com, 
	mhiramat@kernel.org, brucechang@via.com.tw, HaraldWelte@viatech.com, 
	pierre@ossman.eu, duncan.sands@free.fr, stern@rowland.harvard.edu, 
	oneukum@suse.com, openipmi-developer@lists.sourceforge.net, 
	dmaengine@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-mediatek@lists.infradead.org, 
	linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-s390@vger.kernel.org, 
	netdev@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2024 at 1:54=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.org=
> wrote:

> At this point we have suggested to drivers to switch to use threaded
> irq handlers (and regular work queues if needed too). That said,
> what's the benefit of using the BH work queue?

Context:
https://lwn.net/Articles/960041/
"Tasklets, in particular, remain because they offer lower latency than
workqueues which, since they must go through the CPU scheduler,
can take longer to execute a deferred-work item."

The BH WQ is controlled by a software IRQ and quicker than an
ordinary work item.

I don't know if this little latency could actually affect any MMC
device, I doubt it.

The other benefit IIUC is that it is easy to mechanically rewrite tasklets
to BH workqueues and be sure that it is as fast as the tasklet, if you want
to switch to threaded IRQ handlers or proper work, you need to write a
lot of elaborate code and test it (preferably on real hardware).

Yours,
Linus Walleij
