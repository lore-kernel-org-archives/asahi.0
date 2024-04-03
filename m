Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41B11494DF;
	Wed,  3 Apr 2024 13:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712151217; cv=none; b=D0I0HGOPrSTpKTpm6MPEct5ziNCaL+35SUfgOazWQKmztKiOKEPmI3qgwGnIaixOD+q3s3+C0ji2nPijBLOwTQx1advKhPhv2wLCJ3ox9xQcX2ZsUwHzGnPzAMsCm2apNiZKU1bigFV+GSqhY0VAs55bo+USbD+NsYaKpe4DzkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712151217; c=relaxed/simple;
	bh=Qt01KTjE4NGp5XEomZDf90wNSv9JiA1QkpnnyKlsblA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=okKQmTJA9V2ou0EcVoPoGoTC20G11Agi2nqNNyDKJ8tTQsnOgKG1LMu1M6Xp6s6oTCGiH7vWSNo1cnufA0hlIGZ+YQcTZL/kg9g5hNJPlhyC1SR+SFZ+Y511y76nUsxaJpHGGVbnU1089qET6rNFvGOndKggCL/MavE3P+l0aEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C+u0Sd06; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C+u0Sd06"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5a52c5c96feso2359760eaf.3;
        Wed, 03 Apr 2024 06:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712151215; x=1712756015; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UfJ432sdibD0Lka67Qj4+39whrzSunQCkb9XAcwEVWQ=;
        b=C+u0Sd06AJoVEun36XNyU7Rng6YLUCg6tOOKEMNQDqIk9nods9TtQFxfHklWNv1gSc
         +8D9mGEixvXNnvyMleoCJeEQ5g42fQwaaK9W9rswsgIvXpA8q+0hm7CyKB9dvnSAMj6H
         ckWXssZTBpvhSV7skM7cHG63Ta5f4Umzg6DUSj2jAXY1yvwY5gbxYvAvnNSkZ9oLXFl+
         qocII3T9kp184kDZFxt7NVt5KiGB1YrU/LKid19S+nePuwTynd/5JjDGeZoyg2A2yj2C
         xB00tvxjLdZgHApR/Ca+AV0iJDBjDi8u9f24TLYDZedIItdG6h8DfrhMvMw8BUk/pMDO
         RQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712151215; x=1712756015;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UfJ432sdibD0Lka67Qj4+39whrzSunQCkb9XAcwEVWQ=;
        b=fGTyDWpFa0gP/7CXc65zDvSumNBUsTSvxOdKw/pnGOn9sONzcg2Z6Jd0SJUa66tOBE
         WvgNGgEMmWnIhV3vzDUEaMa/MZIIMDp4VbPCeT460jsv0Et/Y7VcQt1uRN87ZHtEr6tH
         4XigWoYMHURsodG1985nhxG7uwOXlDVBuMv4NzYkCOGhe1/FHw+Spw/I9L0lbupmBAnQ
         fCOl4MVrYYGU02zXcdmbBi1YxYg8PiEKN2+CTfBD+p7op1ws/b3K8D7LLzazueThOs4P
         Lt6cKupAi2V/nYHPAFPKMyf/XiXG4Oj45mhVWTt59lecFzenSTi/jIdR2lkK4yqxj/PE
         7RSw==
X-Forwarded-Encrypted: i=1; AJvYcCUHEHh2fwxOSl2NvHhI1b7bMQkMB7kGG7W8s0WEH4ETaSvdrHfF4KUWgn4LsMxVwZVCEpm9ZHcHPHhxWaGI0TCqr5EWhcE1w3onfMlunt+3a3E6b8sHBR3NkgzrbJjOOjlF/o3pnLnb/LP7zPyFrkmmt8Gvi/NodA==
X-Gm-Message-State: AOJu0YyoNSh5yUbXqx82zTtxTiT5ot/yXxblUAxMC6CF4YjADvUUSM7p
	cHGNfMwGAMRAUkZ6StyHVdA99yfHSyi3kVOD7mJNxhBwMbAs9vB6SI8JqfQLvmRF5MsTYqdQKWK
	hnzpHW7LQoTLYWB/LgTdKrpFBH+w=
X-Google-Smtp-Source: AGHT+IFsoYFg4TPJZ/xBylk5B9Nfa55HU119ldFLC4g550cJsZKKSI+Id/ONzGwerMZ8W2tZHWzr/Kf097BxBvAdyL0=
X-Received: by 2002:a05:6808:181d:b0:3c5:d426:9b87 with SMTP id
 bh29-20020a056808181d00b003c5d4269b87mr1074785oib.23.1712151214780; Wed, 03
 Apr 2024 06:33:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-8-apais@linux.microsoft.com> <ea4ac7a3-13ae-4d22-a3d9-fcb7d9e8d751@linux.ibm.com>
In-Reply-To: <ea4ac7a3-13ae-4d22-a3d9-fcb7d9e8d751@linux.ibm.com>
From: Allen <allen.lkml@gmail.com>
Date: Wed, 3 Apr 2024 06:33:23 -0700
Message-ID: <CAOMdWS+wH9qZ_08nVSQV1sY0C=uHMC+3NmPuFjwKzBFCgMa7MQ@mail.gmail.com>
Subject: Re: [PATCH 7/9] s390: Convert from tasklet to BH workqueue
To: Alexandra Winter <wintera@linux.ibm.com>
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

> >
> > Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> > ---
> >  drivers/s390/block/dasd.c              | 42 ++++++++++++------------
> >  drivers/s390/block/dasd_int.h          | 10 +++---
> >  drivers/s390/char/con3270.c            | 27 ++++++++--------
> >  drivers/s390/crypto/ap_bus.c           | 24 +++++++-------
> >  drivers/s390/crypto/ap_bus.h           |  2 +-
> >  drivers/s390/crypto/zcrypt_msgtype50.c |  2 +-
> >  drivers/s390/crypto/zcrypt_msgtype6.c  |  4 +--
> >  drivers/s390/net/ctcm_fsms.c           |  4 +--
> >  drivers/s390/net/ctcm_main.c           | 15 ++++-----
> >  drivers/s390/net/ctcm_main.h           |  5 +--
> >  drivers/s390/net/ctcm_mpc.c            | 12 +++----
> >  drivers/s390/net/ctcm_mpc.h            |  7 ++--
> >  drivers/s390/net/lcs.c                 | 26 +++++++--------
> >  drivers/s390/net/lcs.h                 |  2 +-
> >  drivers/s390/net/qeth_core_main.c      |  2 +-
> >  drivers/s390/scsi/zfcp_qdio.c          | 45 +++++++++++++-------------
> >  drivers/s390/scsi/zfcp_qdio.h          |  9 +++---
> >  17 files changed, 117 insertions(+), 121 deletions(-)
> >
>
>
> We're looking into the best way to test this.
>
> For drivers/s390/net/ctcm* and drivers/s390/net/lcs*:
> Acked-by: Alexandra Winter <wintera@linux.ibm.com>

 Thank you very much.

>
>
> [...]
> > diff --git a/drivers/s390/net/qeth_core_main.c b/drivers/s390/net/qeth_core_main.c
> > index a0cce6872075..10ea95abc753 100644
> > --- a/drivers/s390/net/qeth_core_main.c
> > +++ b/drivers/s390/net/qeth_core_main.c
> > @@ -2911,7 +2911,7 @@ static int qeth_init_input_buffer(struct qeth_card *card,
> >       }
> >
> >       /*
> > -      * since the buffer is accessed only from the input_tasklet
> > +      * since the buffer is accessed only from the input_work
> >        * there shouldn't be a need to synchronize; also, since we use
> >        * the QETH_IN_BUF_REQUEUE_THRESHOLD we should never run  out off
> >        * buffers
>
> I propose to delete the whole comment block. There have been many changes and
> I don't think it is helpful for the current qeth driver.


 Sure, I will have it fixed in v2.

- Allen
