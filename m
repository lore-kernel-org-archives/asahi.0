Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9229A5A4C7;
	Thu, 28 Mar 2024 17:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711648041; cv=none; b=EqQcjfL2dpdYqQNrbotLRNoSDYnQRZ35Lf5xZOCnEgQu+ZLVwbqwk3aMDhcO1IvnyGthqJ2qkR8cj/9bmKGYqz1k68k05PllR8GAjIyjN4G+EFgKvak3n+JquHXT2j3dwRPH1pabkxu0Rorz3EOiDWahL1D5q/ROt8koljp6+J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711648041; c=relaxed/simple;
	bh=2RJ4UftN8nrBTsBDUrVAd7hn5NaOKJnB1Fl2J9lWRkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M4/nI/blH1MF8+2yoP/n1fZ+Ue/1Zx6s/9F0+I9GEGsw21dTfK1ZAwTXK3KCQUbiBITvPcn46h3FwKAgJgYu9OGwaKRpSPSShNzL85kmxOwYRjcvVG/3s5MfwxHtMLZ+KurFtgPiiEtZf2RyPLR4/oeTxD/M/1HRHXjg8tW/f/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mlIk9FJN; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mlIk9FJN"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-7e3257325b4so101663241.3;
        Thu, 28 Mar 2024 10:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711648038; x=1712252838; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WOul4usuPisehHXyQcZLwgce2H6JwRccYEaJQWtP1Jo=;
        b=mlIk9FJNu7t6D4YsKAV9RhU3dVyUsi0Xmf0Q2uAElLxHooS7KcjVjRiU4KrBZ59KMW
         rPc3XkXmPSCY/4jvAwSy5wHgWUtoPHgmUGqU+1MwUSYFWsXRP3kzuNLxVFSm8sG8lGJ/
         +unZF69E60nlk3gRa0S/zTjVHcU/0igaUFuNhyiANYZVcqwDbIo3zWaBfszTruUl5bTg
         7EFHh2zHAzmTEMbWkPX6LQZvUVnLxS/j4U8JfDTFF1CYHR0euXUx1TS8fGD6Up7GGYoH
         w+8vx5KbQTWQGOyNiwdZuV375BuhPo4kNE28/LMjXwWGSXJcAFM577NpQGsStqWTNXhq
         AQAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711648038; x=1712252838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WOul4usuPisehHXyQcZLwgce2H6JwRccYEaJQWtP1Jo=;
        b=SjtHkpPu0hvC2DVimEAwfwHDV69sgdKS1cvBvhU6FtyADuhqzFlHTrYKPXNdQiYtmT
         fo2amNq6vk2oajUZsZl8isEWa/WX9xxY/2HTmMC740Jc81uGrlrlfeDMGIGa+56hzmED
         qwQpw5wbEaS4rk85qA8Ob/5QIMN1QbgpsQb1qf2y0fIqoC9tyJ8HWnTtHneFto0bxo0A
         mCWjiAVXlX9lLjpG3654Ae6mZ8wpQGsZL+1KQuf/iakvJrmj9MAo1ez4xkeJXD3NOWS6
         VMQDH3SJl2FbCAg/yPOGW/9SDjuGWci+sfCf9wlYqCqlSP4tBupp5wbiA65uuByqB1vZ
         TucA==
X-Forwarded-Encrypted: i=1; AJvYcCVSSlVxZ7ARcKmI3THcd2zQqxCwE3WtxULAZq7Q1TaryzFwtLj3Mbo7q2Cf1y+1NTODvhxNZ0W3JhYSskAXLgWQnDBDu+b1iSVZOSFL1WiKIZ5vY+1p7a7MlGBUnHL9BCV5YPCq1cn9BX1ycRpIlkXUWBN7KOQAdw==
X-Gm-Message-State: AOJu0YwErgdp9s7MiDk+qxPumu5goOowcvZQ/OVXWUF8Qn90XtzuSlCF
	eTr5jiNOz5t2pOKMGsrSB4eX3V1OI2KfIoVwVwTcu9sx7S8c9zL0UHvDIl47IOjAdeHwh/9YJ9D
	WYLiwr2wIqbrYsXRpW+pGs29+qhE=
X-Google-Smtp-Source: AGHT+IHhsrATdsPlGDNfn/hR7BQXc3o4d86Rd7NcYHBOy9LUQjNRQoJ0rDqs8OMJuSA4Qyiba22Ugt9rz6m/+ouyIBc=
X-Received: by 2002:a67:f7c6:0:b0:476:fbbb:14bc with SMTP id
 a6-20020a67f7c6000000b00476fbbb14bcmr3836850vsp.30.1711648038557; Thu, 28 Mar
 2024 10:47:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-10-apais@linux.microsoft.com> <9c31b697-3d80-407a-82b3-cfbb19fafb31@arm.com>
In-Reply-To: <9c31b697-3d80-407a-82b3-cfbb19fafb31@arm.com>
From: Allen <allen.lkml@gmail.com>
Date: Thu, 28 Mar 2024 10:47:06 -0700
Message-ID: <CAOMdWSL9GUkoOOX4LNwMOV24-8xnmFKep15xj8NnmnBss-RYAQ@mail.gmail.com>
Subject: Re: [PATCH 9/9] mmc: Convert from tasklet to BH workqueue
To: Christian Loehle <christian.loehle@arm.com>
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
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2024 at 3:16=E2=80=AFAM Christian Loehle
<christian.loehle@arm.com> wrote:
>
> On 27/03/2024 16:03, Allen Pais wrote:
> > The only generic interface to execute asynchronously in the BH context =
is
> > tasklet; however, it's marked deprecated and has some design flaws. To
> > replace tasklets, BH workqueue support was recently added. A BH workque=
ue
> > behaves similarly to regular workqueues except that the queued work ite=
ms
> > are executed in the BH context.
> >
> > This patch converts drivers/infiniband/* from tasklet to BH workqueue.
> s/infiniband/mmc

Will fix it in v2.
> >
> > Based on the work done by Tejun Heo <tj@kernel.org>
> > Branch: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-6=
.10
> >
> > Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> > ---
> >  drivers/mmc/host/atmel-mci.c                  | 35 ++++-----
> >  drivers/mmc/host/au1xmmc.c                    | 37 ++++-----
> >  drivers/mmc/host/cb710-mmc.c                  | 15 ++--
> >  drivers/mmc/host/cb710-mmc.h                  |  3 +-
> >  drivers/mmc/host/dw_mmc.c                     | 25 ++++---
> >  drivers/mmc/host/dw_mmc.h                     |  9 ++-
> For dw_mmc:
> Performance numbers look good FWIW.
> for i in $(seq 0 5); do echo performance > /sys/devices/system/cpu/cpu$i/=
cpufreq/scaling_governor; done
> for i in $(seq 0 4); do fio --name=3Dtest --rw=3Drandread --bs=3D4k --run=
time=3D30 --time_based --filename=3D/dev/mmcblk1 --minimal --numjobs=3D6 --=
iodepth=3D32 --group_reporting | awk -F ";" '{print $8}'; sleep 30; done
> Baseline:
> 1758
> 1773
> 1619
> 1835
> 1639
> to:
> 1743
> 1643
> 1860
> 1638
> 1872
> (I'd call that equivalent).
> This is on a RK3399.
> I would prefer most of the naming to change from "work" to "workqueue" in=
 the driver
> code.
> Apart from that:
> Reviewed-by: Christian Loehle <christian.loehle@arm.com>
> Tested-by: Christian Loehle <christian.loehle@arm.com>

 Thank you very much for testing and the review. Will have your
concerns addressed in v2.

- Allen
