Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327F65227;
	Wed, 27 Mar 2024 19:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711568162; cv=none; b=WMwRIuqJbyJbgpoMhli/+QcrwDzmdAjfNVkDzsFnQQydMfqzao+jNrkjrROB+NLsLPKF85JnO1XKIPqRbMIJuEIY9C5yrif3NWbmtszNRtnAwFAE6HUFRA3r7AVBRmzdIP6o/3OASoitUHKlJTvEM9EdAST+8EXCDapqIHl+KFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711568162; c=relaxed/simple;
	bh=T0Gc63+M14jsX7PKFtiIXFMl0tWSi9oDRmgoUZTW/2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kvWLzCHlXrCLVHGZq9tEGrVrmqm7KSNrNZfM/VNeF3qr9oqwDMT0waNjexrtBYb6MyvcNR0aKcPavrM9Qx1+KwvLDE+6XbMRo3wdksFd9xC7errlqfut1uYd0vGohu9fJUvwGRXMbKgpwpdS/w4jSdfFLTpMMjUYEKK1dPlfb0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VnJC1Oe3; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VnJC1Oe3"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a4a393b699fso38647766b.0;
        Wed, 27 Mar 2024 12:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711568159; x=1712172959; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aojaArSnA0JfedDto4elyer8YODIKcUTNNFpLzMMgW8=;
        b=VnJC1Oe3vU0LCl9yLc/K5q+rJd14IVzpXESGHX1HOZf4bv/fdWTaJFHqWIq2R88D4C
         CzU3ndrHOlePxDuLj8Smwi5laWiIG4US4A6liQxplmjp6mdxXcb8NyyhEQYPMiqqWgIP
         LtTs2xqxS8gIDpHIRcdnreFLBvyzZdzBicI5cIXUlkArwzZ9NcAk1OrFNNNgEoJn8gUJ
         FU4vtwhLpbCTOmDUm1fXZulkfZcqNPXnnwwflD3dlLqHnd4+EavIiQRFKXo5S4R+nS7N
         /G8ChYaqR9XfI3TUhov/yjCmfGkar3PJ4WgldksNzfvIgYgL8il0RgXmqDBuznI2QEAO
         NahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711568159; x=1712172959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aojaArSnA0JfedDto4elyer8YODIKcUTNNFpLzMMgW8=;
        b=LUYJk2jufy4cPas0Xbf45LUpRapbSL8S6t1dn9qgR3GRnndPe2z7DJdlBam8kLxOJK
         V60bV79os5yTD0Veu3M85VmGAiPymKZC0Gf7GewKevyUJfAhttvguqNSr/1eiOfSK21i
         noXLQmtU0DNoKokqkfIqm6LJw+z7XfsCuqeHN+frTAJEvTvc4SWrOL6MoGPd3TQsX/kr
         Ueq/ILZ8tCQ6QnTdpmERmg5nHbMbaX3jHtIYybkmz5kJQy6d6xX455D1+IEsuUD7FlfY
         6KGj2eLn9G366bG15LaxX+qQhraoRqBxgFP+aIXsW1whd3j8r4flW/rIZzVQK9NuJg3b
         T6Dw==
X-Forwarded-Encrypted: i=1; AJvYcCX2D3QBg1OIQg2R97LCuOQg+iKwvHzlVLwiv7RiIhCa1VnLOx/HrKque8L/j5/bC9b4SpuESP4ZSVSXMWkBqkmQzUX0NLE8RfdAhllbsnL7pLSvp73jYJKsbZDvdWrRsp0A8WcP7Bsv+6PrS/AXuu959CdQHVEb3g==
X-Gm-Message-State: AOJu0YxTv7yVOgxzB4/iTiwIOwhJta2BMVwqwjZrzVGXTNrXRnyOBQGn
	9AK4OfTxL4x/Q5XG7g6S2jnUWt03JgfRn0x88JCb1+a92Ej05Iql
X-Google-Smtp-Source: AGHT+IHWYCsKCZfCKe9WJ0A8h2jBWKCzprPvh9Stt4hH84aJN1DmeskwZihR1IueuTRTWs9wYxpP6Q==
X-Received: by 2002:a17:906:119a:b0:a47:3766:cfec with SMTP id n26-20020a170906119a00b00a473766cfecmr235001eja.9.1711568159337;
        Wed, 27 Mar 2024 12:35:59 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id j24-20020a17090643d800b00a4672fb2a03sm5858783ejn.10.2024.03.27.12.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 12:35:58 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, Allen Pais <apais@linux.microsoft.com>
Cc: tj@kernel.org, keescook@chromium.org, vkoul@kernel.org, marcan@marcan.st,
 sven@svenpeter.dev, florian.fainelli@broadcom.com, rjui@broadcom.com,
 sbranden@broadcom.com, paul@crapouillou.net, Eugeniy.Paltsev@synopsys.com,
 manivannan.sadhasivam@linaro.org, vireshk@kernel.org, Frank.Li@nxp.com,
 leoyang.li@nxp.com, zw@zh-kernel.org, wangzhou1@hisilicon.com,
 haijie1@huawei.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 sean.wang@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, afaerber@suse.de,
 logang@deltatee.com, daniel@zonque.org, haojian.zhuang@gmail.com,
 robert.jarzmik@free.fr, andersson@kernel.org, konrad.dybcio@linaro.org,
 orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
 patrice.chotard@foss.st.com, linus.walleij@linaro.org, wens@csie.org,
 peter.ujfalusi@gmail.com, kys@microsoft.com, haiyangz@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, jassisinghbrar@gmail.com,
 mchehab@kernel.org, maintainers@bluecherrydvr.com,
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
Subject: Re: [PATCH 9/9] mmc: Convert from tasklet to BH workqueue
Date: Wed, 27 Mar 2024 20:35:54 +0100
Message-ID: <9252961.CDJkKcVGEf@jernej-laptop>
In-Reply-To: <20240327160314.9982-10-apais@linux.microsoft.com>
References:
 <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-10-apais@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Dne sreda, 27. marec 2024 ob 17:03:14 CET je Allen Pais napisal(a):
> The only generic interface to execute asynchronously in the BH context is
> tasklet; however, it's marked deprecated and has some design flaws. To
> replace tasklets, BH workqueue support was recently added. A BH workqueue
> behaves similarly to regular workqueues except that the queued work items
> are executed in the BH context.
> 
> This patch converts drivers/infiniband/* from tasklet to BH workqueue.

infiniband -> mmc

Best regards,
Jernej

> 
> Based on the work done by Tejun Heo <tj@kernel.org>
> Branch: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-6.10
> 
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>



