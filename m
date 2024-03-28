Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328131327F0;
	Thu, 28 Mar 2024 19:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711655942; cv=none; b=tPIeNnCvBTNqbFNIuXrZ/HVoT6UYQbyCeHWRxFjsFC+Jec86cUcmgF35n7FFWQWTAk2/Pwr1OPO0dSUFSOa5BPra5PY0jSrOMg1op7GWwK3iY0Wh1jf1b7KWVrSTatiZESTj7+fneb7TlD18/HFmMUYCSca7K630eAuggpN6sNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711655942; c=relaxed/simple;
	bh=ZJAY5ItgPFNW0LMb5RnANZBqjmUyKGO9ruTQ3rdhYns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CGnjDEgCV12dUOxX88CYsLiKSVNthJWg9/dGk0NvzZzPI6v7FptGaMqY5WA3mQ7ahP9ZqcjP93wz7lCOWsK1BH3J2RTs7VGlq2/OvQO3qnA9bF81Po6jalIG8hzDm4ghhJdK17YzrBAki8OC//uG1V2YK1XEjYNmF/WPEOX0bbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RQtRlT5k; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RQtRlT5k"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-7e0425e5aa8so396523241.3;
        Thu, 28 Mar 2024 12:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711655940; x=1712260740; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vnKBKhBKsmsJMY/bC4lZDp0UO96Fq//Yoyy126bkPGI=;
        b=RQtRlT5k4oCxWspKMB4yT7EU83UFNgNR8AB26fLSG6vhyXimtqKEfdC5kvaepSnyqn
         J1cZdnT8eNYfOpRGXxr4J/4ME6B1SMbQVLW5ubeoFW9HNRFzfdcmLw69z0UmWkeVFt5M
         oEd9vsNwn0pv8ajetRmyqhOfg55JKcH7/jVjE5sV/OnlUnTFTVssIv0mMHTPDTMc6jLE
         AjONXdz61fxYWgd07tGpCQBfTrmYVhgcR1TDwE8amYvHRF8laF7QFpBGAp44O5oATvKH
         VJZwEPzW66XKUWAHl5dwHQXOgcYLpk55DdMeia5kbF3toBT5+pYO162mJMkqRUA5dqZL
         DSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711655940; x=1712260740;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vnKBKhBKsmsJMY/bC4lZDp0UO96Fq//Yoyy126bkPGI=;
        b=RH9wmmuLhDRfkWsxiZT462zLGEhRKUP66T2rlY7UEMQFHj4ZL7fVRwrw7iBReDaIUH
         E0oNU5htKmDNMnGZe0BJuRp2Kjqb87Ea7beSU637mQQSXcRrI5lrRaNbrKAYdkvnMjdZ
         Pg3agjiCBda01yvb8tKMrJM6kPGzojo0XXJMKX1GYMrx/B1MeVFx03FEt45t+nQHzTmj
         pR+q6RuLwlH0QSp8OFv8+dlUCJD+TtJdSzcU6dyPYXJCHBHbgzwyUebK3XtjWYOU0k26
         Yf6G0b8ezDCyWP0UIT548+iwYIenzIRjyut/pYw4SX9Ki/PzAm9/6aoyEQQnUerNBCg6
         IdmQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4giVVhysiZ0QiJ2bpEtc2CuvthU8BQ1/Bu6UPbeFjP6gm9SRWiZ3amfzfhvD/dePYj8WXl4+c7YrIPeDqdr715EqsuJ8yiRdH9643UsDw3Lg4ufJiXw4TJl+7gAwYQaMyb//de0eSBt7GUSNZOPFqPgAuvrED6Q==
X-Gm-Message-State: AOJu0YwLM9/EPTqE3+ZJWmx4S6UXeQQmLimMNS8CL2ZIzQrS2XR79Xfe
	GjXUtGEP8Tli2kEnXwfEF4+4J2alnj9uQyM3X5gF6Y1YzapLfHtw20D7GmTZdqnZ8pc/hi48MX0
	0k/ZN02yKoEIGSfn96VoJqhpzBrI=
X-Google-Smtp-Source: AGHT+IEsqiTQ+RuhLXyb/Y+jV0DgOZDtp/0zVM9owKFV3xn7f9aoxOYdP+JeSKGOIKqBlapOYOkCUtaaLw32MikZSqo=
X-Received: by 2002:a05:6102:2a65:b0:476:cf52:e1b7 with SMTP id
 hp5-20020a0561022a6500b00476cf52e1b7mr141814vsb.28.1711655940207; Thu, 28 Mar
 2024 12:59:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-7-apais@linux.microsoft.com> <ZgRePyo2zC4A1Fp4@mail.minyard.net>
 <CAOMdWS+1AFxEqmACiBYzPHc+q0Ut6hp15tdV50JHvfVeUNCGQw@mail.gmail.com>
 <ZgXDmx1HvujsMYAR@mail.minyard.net> <CAOMdWS+nB5EENp_Vb=k1j77nrch5JgbZP2XYPJ2ieTja14zB0w@mail.gmail.com>
 <ZgXKeL36ckOyNpI/@mail.minyard.net>
In-Reply-To: <ZgXKeL36ckOyNpI/@mail.minyard.net>
From: Allen <allen.lkml@gmail.com>
Date: Thu, 28 Mar 2024 12:58:49 -0700
Message-ID: <CAOMdWS+KrT2dK0XiEkZJT0aHnre1sr6gMMSkdxuXZaUh5e2e8Q@mail.gmail.com>
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

> > > >
> > > >   Fair point. Could you please let me know once you have had a chance to test
> > > > these changes. Meanwhile, I will work on RFC wherein IPMI will have its own
> > > > workqueue.
> > > >
> > > >  Thanks for taking time out to review.
> > >
> > > After looking and thinking about it a bit, a BH context is still
> > > probably the best for this.
> > >
> > > I have tested this patch under load and various scenarios and it seems
> > > to work ok.  So:
> > >
> > > Tested-by: Corey Minyard <cminyard@mvista.com>
> > > Acked-by: Corey Minyard <cminyard@mvista.com>
> > >
> > > Or I can take this into my tree.
> > >
> > > -corey
> >
> >  Thank you very much. I think it should be okay for you to carry it into
> > your tree.
>
> Ok, it's in my for-next tree.  I fixed the directory reference, and I
> changed all the comments where you changed "tasklet" to "work" to
> instead say "workqueue".
>

 Thank you very much for fixing it.

- Allen
