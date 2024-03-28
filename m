Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73FC13E6D4;
	Thu, 28 Mar 2024 19:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711655549; cv=none; b=Ts79hrnhWXYE3plhEHcoe6zMe1sxSM1nD1/Yx5eQ2Cqc/0D4B73bEZ+ysXzEvGbQFCp2W9OfUxuisytvOxvVC5nEyAhhGQU4FSyki7DkiT+13D+AyzLGUr2KU2qTEr97JrSJ6dV375cVtGoTDoW4IZBfv9bH65PI9+BI4I4dFdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711655549; c=relaxed/simple;
	bh=qmQFGHYUei7BOkNgnnntn6VCVy9UtjipJi0ZJ6b8pZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WJbdZtoySnpArpKIq3Y++q+4noEuikoyvfCKGgU8nniqriLp3WjGlhCSIQN2aO4CrNverX+/B/cC/BW8I6UvBtosmiOx8siUe/3mvobdXBRnWiXZaeixC20ZngOUUvSRuBphg/9H4753nOZ4nW1WhH/TYgI+Dba7Tiwa3tKER0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=acm.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BzZO+VTw; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BzZO+VTw"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2218a0f55e1so736398fac.1;
        Thu, 28 Mar 2024 12:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711655547; x=1712260347; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YT6C4kyGaXJTnO4s5bmEmPWYlNQPKErlDo5CuGDxbV8=;
        b=BzZO+VTwXeXUMfJp9uaaNk4/luhN8JJWb2nmCyppB8FE5a7zKGcBmsi1/bRgiA19IE
         EszGeNAhHKlmt+vtVRbaML+vX02rPBw4rj9C4d2UGX0A/fWnTxB+ISF7cF3Skn0E57jn
         0uC9dL7CsFZooyDb1lumfmUmR4DdL9D5Y46wXtXQGhQJ4lpYKaUdoZclWDa2CUqY8s3E
         NWdCLySAgwUC/Csg0VwwkPBSoN2w0qW8Hm8jBz8wlZvpzfJ4u5f6iARYTMMO5HL5GDiz
         vsasRI2txY/fhPHnkQHG2GfwpvSFzCkhMztyKops+XFI8JaDs4H7cu1znDOdLysCU329
         WX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711655547; x=1712260347;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YT6C4kyGaXJTnO4s5bmEmPWYlNQPKErlDo5CuGDxbV8=;
        b=CZxb6Ho1780NXsrCzL7uKROfRoXQPEafGh6ZBNlq4v5RQ2tzaLWH7R1bqlvKKDmhwW
         kWALeF/0b9/que+1klY9/D1jzd1YGOxnd6biZ09MjLgKdz1ubY0Lb7H4Q/Kh8i9/jTOP
         BBRFuE0Ppmj/6fowrRbbobI0dBYKT4flCbpDzCuTSGxZvus7pcSozPo2DH3ujUj1f8+i
         tMikwkpNXDJMA6xKgELzHOV2sp1GQYVoRkZ6I67HbS1mN/5Yp4ZXsTLAAo7ZZjdXHS0c
         RRso4Tgvu5PnOCGpeUiwTmNKaxVInwjhY8BgCmC6GL7MfNEcttJHdQivFVnzSH3s0cbL
         yWbw==
X-Forwarded-Encrypted: i=1; AJvYcCWIH5Q+x9vUlEd3IoM0XT68dB3+pFz13itwtb7rQVqFOCAw1LiXkRa/UBapnGPFZ8pB/UsRZURoiZCrtYI0JQgg/fmLqXSBKTJyF0bIorNIR0O30QhSCFvfw+ebAnTxiCM/Hte/QRp09JVz0s+ZnfFYOvO5X4MuOQ==
X-Gm-Message-State: AOJu0YyLgLBOgOfo8AtzhQ01bKzyybiYHuc+UCIWo0mjZumS0jwmkCQZ
	Go02T/kybBXvGA869VkZuL9MmyXG/LNsxCf02GBfSYc+pMcC1T0=
X-Google-Smtp-Source: AGHT+IHzO114l0NerWSB89S0FuZIWvU872Dx5hTOnZas2urBgE80eNZxB2BV9A8JCj8+LYtYL67EKw==
X-Received: by 2002:a05:6870:3513:b0:22a:8e5:941 with SMTP id k19-20020a056870351300b0022a08e50941mr177999oah.52.1711655546921;
        Thu, 28 Mar 2024 12:52:26 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id pd12-20020a0568717a8c00b00229f94bf403sm536320oac.19.2024.03.28.12.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 12:52:26 -0700 (PDT)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from mail.minyard.net (unknown [IPv6:2001:470:b8f6:1b:b987:69e:202a:697a])
	by serve.minyard.net (Postfix) with ESMTPSA id 4B51A180059;
	Thu, 28 Mar 2024 19:52:25 +0000 (UTC)
Date: Thu, 28 Mar 2024 14:52:24 -0500
From: Corey Minyard <minyard@acm.org>
To: Allen <allen.lkml@gmail.com>
Cc: Allen Pais <apais@linux.microsoft.com>, linux-kernel@vger.kernel.org,
	tj@kernel.org, keescook@chromium.org, vkoul@kernel.org,
	marcan@marcan.st, sven@svenpeter.dev, florian.fainelli@broadcom.com,
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
	ulf.hansson@linaro.org, manuel.lauss@gmail.com,
	mirq-linux@rere.qmqm.pl, jh80.chung@samsung.com, oakad@yahoo.com,
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
Subject: Re: [PATCH 6/9] ipmi: Convert from tasklet to BH workqueue
Message-ID: <ZgXKeL36ckOyNpI/@mail.minyard.net>
Reply-To: minyard@acm.org
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-7-apais@linux.microsoft.com>
 <ZgRePyo2zC4A1Fp4@mail.minyard.net>
 <CAOMdWS+1AFxEqmACiBYzPHc+q0Ut6hp15tdV50JHvfVeUNCGQw@mail.gmail.com>
 <ZgXDmx1HvujsMYAR@mail.minyard.net>
 <CAOMdWS+nB5EENp_Vb=k1j77nrch5JgbZP2XYPJ2ieTja14zB0w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMdWS+nB5EENp_Vb=k1j77nrch5JgbZP2XYPJ2ieTja14zB0w@mail.gmail.com>

On Thu, Mar 28, 2024 at 12:41:22PM -0700, Allen wrote:
> > > > I believe that work queues items are execute single-threaded for a work
> > > > queue, so this should be good.  I need to test this, though.  It may be
> > > > that an IPMI device can have its own work queue; it may not be important
> > > > to run it in bh context.
> > >
> > >   Fair point. Could you please let me know once you have had a chance to test
> > > these changes. Meanwhile, I will work on RFC wherein IPMI will have its own
> > > workqueue.
> > >
> > >  Thanks for taking time out to review.
> >
> > After looking and thinking about it a bit, a BH context is still
> > probably the best for this.
> >
> > I have tested this patch under load and various scenarios and it seems
> > to work ok.  So:
> >
> > Tested-by: Corey Minyard <cminyard@mvista.com>
> > Acked-by: Corey Minyard <cminyard@mvista.com>
> >
> > Or I can take this into my tree.
> >
> > -corey
> 
>  Thank you very much. I think it should be okay for you to carry it into
> your tree.

Ok, it's in my for-next tree.  I fixed the directory reference, and I
changed all the comments where you changed "tasklet" to "work" to
instead say "workqueue".

-corey

> 
> - Allen
> 
