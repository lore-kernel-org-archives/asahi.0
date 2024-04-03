Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83E91E520;
	Wed,  3 Apr 2024 16:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712162654; cv=none; b=QmThfB2uG0DjDE/oD78W99O25/ADBN99gJ4GWZA7LIZ3B1CO1yTVfZ5ECgpRSGGXOAWldz11Dkop+eY0xFFwRiTjBZesftEsgmVSBKTjLCACuug1GvdNOv0Gu6B/tQyZrPVpXo0Nnys8riSOshTc0sdk6CJ0QqbqPsW6ESwbEl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712162654; c=relaxed/simple;
	bh=M1neYOlhzngATdBbVyJaKe7fkRAK//9DrStR8GOcQu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HZT2XFqARwF4Z+85DrgQGT9BNu/Qrhxwgl8kP7Kvm8wgPlOlU/6YaxP4O4hledGA1mkNbcaArPbCmwBNh874p01oMZ7M+zmfhwIFzX9WxPwNE6IJi2Zzcv3q9EeX9nmUg35ytnMDbJMJvOYA0YtYAitbeCsfo+gmgvjcjnhaH6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RgmwMsXH; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RgmwMsXH"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-4d8e8619f4aso9301e0c.0;
        Wed, 03 Apr 2024 09:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712162651; x=1712767451; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Aej6QFoETxeFvbQm8/sOYYAdEcWAnghw/7Ynm8n0ucQ=;
        b=RgmwMsXHbjzKaDOljdtc6tb+kslE/qRlIaIsIrbaKnpCQCLpYYTGxsJmmtHCUNEBSf
         HGI82OwR+Ws5ZxSkAzRPRDG6gW4ac0QHJgCaGo2fTS+DoZW4hdvz6r48cv13JGCUduIX
         6DlD6SIgyJocfkqXv/VNj4UfvujKb2vPSaWwWRAPRMUoezUyINhfRifGfPxPITG98C/8
         oepZ1smESLXetRfQ1EKueSr68RrDOoJdHsbaaKSPFTu4K81MlwkRaQa2kP/MuVYjtyNw
         LEpQMg89y4ruQYHe1dgd9p0n9xN/VuzAChxs0W0rlcwqtVeDgebjvsr+iidy7QWSOTGV
         z2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712162651; x=1712767451;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aej6QFoETxeFvbQm8/sOYYAdEcWAnghw/7Ynm8n0ucQ=;
        b=ljflk8Fno0C/nQUhP5DIZPTxs1rZzpI3v1rUp0XZU5eAvtdeP6n5DBZE9BfClNjo8W
         b8fFEZw5iMKkCQXkR0+aSLE53kzSnysc+cAG674vb7EfAUHuEp/sRY9beFh5uY6vUZyV
         7NFPgeZfUKBFxX+k8dw32rvPFZFblmhH1dArmBeDUvr0Jvyt5fvoIKJqLH7p49qtnGK0
         lupKVnFd6P7oUnW/7zi9OjjJ44557v81TkBMeIX4Jgj/nFqWxtBrs6ZlGZgLWikZGwfv
         YSX2I7SWon+yBUJMCvHLGsQcGr/NADc1BOuPXSJLSBHYCCcma8HDjqRYI9DN8iUJc64L
         9w+Q==
X-Forwarded-Encrypted: i=1; AJvYcCX5NN7ajmEKKgmvtvFkxMzVSn3QdLCElTUGD+X784Ry9AYrliGmRYlSeukTTW7IZr2yRs42TCfiltwJqazfHz7zay/gt9MQDCWux8NAIOZZU4KwYklnUaMIlX5aQo1DV55sQgi2f5MHcFq7j+lUKy9srOcZih1F2Q==
X-Gm-Message-State: AOJu0YxvNIQx6yqoymQCto4zR+qrcThB/YlastJcg34Dn8zw27AKm/gJ
	xjqNAw3vB1r/jAUlEHQD+amDPBJsQRXvMDqwMOCpGKw84N50eQSzjuaw0nziVAZ37EbdjdNqgEX
	t/ykQan9V05dI8JScUPJFpkkjI/Q=
X-Google-Smtp-Source: AGHT+IFEFFEcpcdQfCxRWJYlDuuUETZ0sWBciDlGUMCvLnJmEBIY1oP87nAaJSL5QQDatxb4oTnFcly4MrzzQ8OrF5o=
X-Received: by 2002:a05:6122:499a:b0:4d3:b326:5ae8 with SMTP id
 ex26-20020a056122499a00b004d3b3265ae8mr10815788vkb.14.1712162651582; Wed, 03
 Apr 2024 09:44:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240327160314.9982-1-apais@linux.microsoft.com> <20240327160314.9982-2-apais@linux.microsoft.com>
In-Reply-To: <20240327160314.9982-2-apais@linux.microsoft.com>
From: Allen <allen.lkml@gmail.com>
Date: Wed, 3 Apr 2024 09:43:57 -0700
Message-ID: <CAOMdWSLavg27YZgnfE2QHjO=4RNmFx_7veAURaPG_=qWX=KMVA@mail.gmail.com>
Subject: Re: [PATCH 1/9] hyperv: Convert from tasklet to BH workqueue
To: Allen Pais <apais@linux.microsoft.com>
Cc: linux-kernel@vger.kernel.org, tj@kernel.org, keescook@chromium.org, 
	vkoul@kernel.org, marcan@marcan.st, sven@svenpeter.dev, 
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

> The only generic interface to execute asynchronously in the BH context is
> tasklet; however, it's marked deprecated and has some design flaws. To
> replace tasklets, BH workqueue support was recently added. A BH workqueue
> behaves similarly to regular workqueues except that the queued work items
> are executed in the BH context.
>
> This patch converts drivers/hv/* from tasklet to BH workqueue.
>
> Based on the work done by Tejun Heo <tj@kernel.org>
> Branch: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-6.10
>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---
>  drivers/hv/channel.c      |  8 ++++----
>  drivers/hv/channel_mgmt.c |  5 ++---
>  drivers/hv/connection.c   |  9 +++++----
>  drivers/hv/hv.c           |  3 +--
>  drivers/hv/hv_balloon.c   |  4 ++--
>  drivers/hv/hv_fcopy.c     |  8 ++++----
>  drivers/hv/hv_kvp.c       |  8 ++++----
>  drivers/hv/hv_snapshot.c  |  8 ++++----
>  drivers/hv/hyperv_vmbus.h |  9 +++++----
>  drivers/hv/vmbus_drv.c    | 19 ++++++++++---------
>  include/linux/hyperv.h    |  2 +-
>  11 files changed, 42 insertions(+), 41 deletions(-)

Wei,

 I need to send out a v2 as I did not include the second patch that
updates drivers/pci/controller/pci-hyperv.c

Thanks.
