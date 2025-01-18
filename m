Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8604D16EB54
	for <asahi@lists.linux.dev>; Sat, 18 Jan 2025 21:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737236126; cv=none; b=TxDzXWfKWky16GTfMDq4bUTGlcvIEbSkMGguYQp473FaV/bYa0TY9l/6yaA1Qeb21120NLIfjuLERCEmD75asJMicy4fHjKqJu4QfeQL3sI4+bm7Rke+FCHAs8l+NUSVP1KC0oRIkooOMLf9050SgKERAGfL2KKkKGVzk1f8g78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737236126; c=relaxed/simple;
	bh=qQOqPpSi7XIsmrHuVlGOVgHW6wGmVfV38Jt6+pI0tAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VOPqrufzszjxr15uVuHcdmoK5e/96MYFf2ldcq5fiM3i0AkHpsIFUFwya1gUB4fdW0RVXOWFumijgp01zX4bAIV7PUgoK4Jv+RK0Hm3Tt65d3Y3NLlj9KkaCYQ1NaoUIJED96MAicLk+3Cln0PziBUrJel6w3OVwVYzw7hIBsJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XH2fkVe2; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XH2fkVe2"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-303548a933aso28427611fa.3
        for <asahi@lists.linux.dev>; Sat, 18 Jan 2025 13:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737236122; x=1737840922; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4pAHJkXoFZdgHisVUkzvL4I/Edqgv9mE3mnJ+Lw62oI=;
        b=XH2fkVe2rn67/AxEHX6V4NAk8/Xq3d/8HL03alvavLA+bTBg7ZAolziV+ezd0PngBN
         M1ccuad4lufTzJTNpJVMRM3pyrllO9zVaSfmC6gSRXRHvkLO3DETHhTZZZYa8YHHwvNa
         n2+7NCR8/vqf/tad9lTQKnYM4Agfh2whPytVwKRAIY6T9p2CjsR2fVaOiOGNlSG/uHAP
         3Hbrm+Q9yozYMefvPJvr/rG7ECiMZFrRzZ03SuCSTb/xW/Cj/dV/esC4FtgwAMpibtdM
         YKnB29abcix+2B7OtjmU2hftDkXXziV2f1gVtQAGH09r2EP74zlDMenQ9IyHC47AWTHB
         Trug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737236122; x=1737840922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4pAHJkXoFZdgHisVUkzvL4I/Edqgv9mE3mnJ+Lw62oI=;
        b=Zs2ChQaCOseKvSGe7lfiIci8xiXp0HudzKIOb8lfUBmp3jMIkCUjsKtnOmj7QqZhz7
         fjv3GrJvGEI5fnJX8bNIOoZp8jQzOSnTRaNcUGSd8XavVgrleMtoLUCZlwcCStoyGEzR
         MUK1dUC55dusiYMR/V05U8AycG5DypstCF7NClJ1nV5NeTKmAUy7M6dzJHYAYJ/FH0Rj
         EdhJTuShUH600DQHLYpsDSN94Al/ot2cNxeaL6IRNqNaPQv7xcLabVRjy8Xg5v56Eiiz
         inE/6yzleOT/ZBT0za0+qUCFdUCw1gb+OCV4rAJwjdM9d41yeREU5NpG8HAMQzsQQ9+s
         4W+w==
X-Forwarded-Encrypted: i=1; AJvYcCWoznKsg3HXBV5O9qh1tE1pxscy6Cf+1WFJy/kOqrfkV3XYkb6dFwINqM+0oZJ5Gw23ESKshQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyl0rJOtQAVz2Qi9jbee77GhSZqr5HGm7dhozREV5ppdTi4P2ir
	gW+Hi9X2qPwXu+CK6lvYSMt+W6O7kvl88fpJthlvfa2Ef78KQnx3M/ypb/sATgo=
X-Gm-Gg: ASbGncuSEFUpGEuBLTlkf9BXYX9xGkx+JlAYsNS3egn7AA1cOURreoITYcf3BrUhPC0
	XfmEeIZKxlPxR657AktFAK/Di3j/gRWmx+sdNJ0eUsqBLMzhcyD6iAhYk6MS3OEy0MKeOSXqCFN
	aNPMV8onpL1m09Qf5/BOKSxaeBSZpzfavGI1BNDfhMUk9JDFMdXV+tXI0/RCPcsas7HdwRF7JLO
	ZPe6AfHsae4oSu/tYeKiR4ZdwMNmQ/mF9DldRIcqhwr5yEB4BGziSGi0OlR0axLbFP8t+BVPwwu
	YohL2oe43lG8Q/3wEBfD1wUvelOft4cvwn5iInxmifyhTZJ8ug==
X-Google-Smtp-Source: AGHT+IEe70NKsSNS6vODeZanfRqTTZhK/r5j+Z3Dmevq5/rL+i3YM7BD6wYBdurTwDfOej9kcBleRw==
X-Received: by 2002:a05:651c:896:b0:300:1d45:871f with SMTP id 38308e7fff4ca-3072ca5bce5mr25037041fa.5.1737236122551;
        Sat, 18 Jan 2025 13:35:22 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a3308edsm9034701fa.4.2025.01.18.13.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 13:35:21 -0800 (PST)
Date: Sat, 18 Jan 2025 23:35:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v4 2/5] drm: adp: Add Apple Display Pipe driver
Message-ID: <r56ycfx6eeampdduxy65v7tczwyfzgh6z64wmvivlxzt6ww2nk@6y7otqj5hoy5>
References: <20250114-adpdrm-v4-0-e9b5260a39f1@gmail.com>
 <20250114-adpdrm-v4-2-e9b5260a39f1@gmail.com>
 <mu7qiybhj7tu5hauk7izfxqlookc3awpknhjk74zwpkbznei4m@kewap6vivzoa>
 <20250116-vivacious-congenial-nightingale-cb2f6d@houat>
 <2alm7gds4k2lnbk36gjdw6yhzhpls3ce5baycdiv7lsigxsbzn@rhwdgnphwwp6>
 <20250117-neon-unicorn-of-plenty-bbe639@houat>
 <CAMT+MTTrvXsYONQj0V5U+dPJtCBOAQ-Lfg7NONMB6onMvJ+3QA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMT+MTTrvXsYONQj0V5U+dPJtCBOAQ-Lfg7NONMB6onMvJ+3QA@mail.gmail.com>

On Fri, Jan 17, 2025 at 03:17:32PM +0100, Sasha Finkelstein wrote:
> On Fri, 17 Jan 2025 at 11:24, Maxime Ripard <mripard@kernel.org> wrote:
> > >
> > > I was thinking about using drmm_ here, as the DRM device is also created
> > > and destroyed each time. But I might be mistaken here.
> >
> > Ah, right, it makes sense then, thanks!
> > Maxime
> 
> Not sure i understand. The drm device is created in probe(), and is
> destroyed by devm.

devm on which device? The bridge's lifecycle is tied to the mipi-dsi
host lifecycle, while the drm device is managed by the display device.

> I do not see a path where it can be created/destroyed without a trip
> via probe/remove,
> and so tying the lifetime of the bridge in question to devm seems correct?

-- 
With best wishes
Dmitry
