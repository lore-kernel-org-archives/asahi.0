Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610C920B20
	for <asahi@lists.linux.dev>; Fri, 17 Jan 2025 14:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737123465; cv=none; b=n5LHaPnNa+B+bfNNIQGbFXdtbvsZe+6hOipyQ6QaOrOuYD4RXcwuERs8Iz2iE5hRKzaQjNFKfoJ9UYU246JHsYVRTaJ+9HtYXfceK8Ci/b1TL2lLQ0ajnTAp8QAMZ/4F3zbyAIpOhzuwb6oaDGKxqFiJkzCa+JU6jXP/EB1eGpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737123465; c=relaxed/simple;
	bh=aGwzPY4c5gn4nEKlnu01wESwyE/Yu3m4vbeoQZY75XA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M37l7aMRmbLuu/gvMXstSYZD+JMpCbBkAKMPJBMtPWfcxWIJsCZXZOFiiOsuN1+1kgqwBCbfr8A7PEtvWqM3oqbxcnL28frGKaYTj7nuUUESQTZMl/RCYHm7zbmHqXR4Hcj2LpGZyrgClk6sGcDQGuH5Hm+0rUUxom6vnvk6PdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZgL0LjcG; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZgL0LjcG"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e549be93d5eso4087594276.1
        for <asahi@lists.linux.dev>; Fri, 17 Jan 2025 06:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737123463; x=1737728263; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aGwzPY4c5gn4nEKlnu01wESwyE/Yu3m4vbeoQZY75XA=;
        b=ZgL0LjcG+GHMoZiZJtWBjPVSc0jFOWCm81Fw6tHY+udYK3IJvulspEPoHl9ElhQdeK
         kC3OU0TP7DvD2ch9WXz4SI1sAlLJxYolu2q/MNJgyjdOw5HiNqRnY65E6Wd9T1I6JorR
         zzmQvqpRPmUOjI1TuI9g0KI6zi0znRM4fsY3B9CDCJ3tiP2FDLDbLN96evsKSRAX6UsB
         35JDKukdkEJ7uBDv0rS3xL6AhZ3wMJFDRfRozDjU0h1wIX+FDPLkViU5zutK+ohDOzbe
         QiSJYQ6mZ+rbXdPjV8fJa6x3uCZDIHd+ijL0g3BY/Ga9GNYXdSkHskiR67NQnzqRM6Ul
         4wLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737123463; x=1737728263;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aGwzPY4c5gn4nEKlnu01wESwyE/Yu3m4vbeoQZY75XA=;
        b=JZa1A9h1iRVPDTMm6IQOn9ZW2Pegj10ohl7Lnl1ggoPPaH22zhOkQcHknBszx2XJU+
         Hn+HKn7RKWbSxe6lJLY34w96DpsX6Gqm0r8qIeG3T1JWIj98DoLZqgrKuimUa2tC3nrv
         sjrJ3KZfzbtNqKuf5ioH2SyeaDOAkHXZlcLNJfjlqpwb5nx3hwF2anK3AN3oqmoin+TJ
         OVGhku2hvgMStlAep0Mq8GY2BZDbYZaLKivnGoW8+feOrT5wGddCa66DMIY4rNd2i0Kb
         WK9u+cv2GzCWqB/taWjhN8lIQ8WqqK+FfYRmmQ90DyeGwPJu7Y9dzGWhxLw6gFivAxJC
         P1HA==
X-Forwarded-Encrypted: i=1; AJvYcCV2PPv2EBPnr0xX417pAGbUDt6N7wd7vSQmmKQfApDP7DT3IzcuvGASMoR2pg/b20KTLy4KGQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwUKL6jbqzsg3ojkvQDCiG28oELF5IA2DmeASTT3F2ElXyFsPFA
	sbHF1aXZCZT7KbBHw527yam2H6d5mj2GOPjjxZwvHC3xc8IiHUt/6OZZpKjn8ixjulAonKyu7Uk
	9e/fDauHEKU2/RGJRrZA0y3uwhkc=
X-Gm-Gg: ASbGncvBuiIlgzuXP03D4GCghRhkP8XBZSU7jc1LelyJKQNSlGb5TuSQFW4to3EkGm3
	+1zBLnQDa6T1yXwUSH0cFtqIveII5MHJDT0fR4g==
X-Google-Smtp-Source: AGHT+IEgzT2Y8X/d+HOguRWOezTmCdaDrvMrd0xyuzC2YC1+k0LNDI0M/Oo8/mnNOxO0+kIgTEzO5F/+UdmBoEnNI4E=
X-Received: by 2002:a05:6902:1b0d:b0:e49:e085:c0b4 with SMTP id
 3f1490d57ef6-e57b104668amr1782609276.8.1737123463394; Fri, 17 Jan 2025
 06:17:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250114-adpdrm-v4-0-e9b5260a39f1@gmail.com> <20250114-adpdrm-v4-2-e9b5260a39f1@gmail.com>
 <mu7qiybhj7tu5hauk7izfxqlookc3awpknhjk74zwpkbznei4m@kewap6vivzoa>
 <20250116-vivacious-congenial-nightingale-cb2f6d@houat> <2alm7gds4k2lnbk36gjdw6yhzhpls3ce5baycdiv7lsigxsbzn@rhwdgnphwwp6>
 <20250117-neon-unicorn-of-plenty-bbe639@houat>
In-Reply-To: <20250117-neon-unicorn-of-plenty-bbe639@houat>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Fri, 17 Jan 2025 15:17:32 +0100
X-Gm-Features: AbW1kvbN_g2HyuopLeZCoB8YJ1kzXFaQ1lvT6Fub5esd6CPjCjqmkvDJ9dDJO2Q
Message-ID: <CAMT+MTTrvXsYONQj0V5U+dPJtCBOAQ-Lfg7NONMB6onMvJ+3QA@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] drm: adp: Add Apple Display Pipe driver
To: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>, Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Jan 2025 at 11:24, Maxime Ripard <mripard@kernel.org> wrote:
> >
> > I was thinking about using drmm_ here, as the DRM device is also created
> > and destroyed each time. But I might be mistaken here.
>
> Ah, right, it makes sense then, thanks!
> Maxime

Not sure i understand. The drm device is created in probe(), and is
destroyed by devm.
I do not see a path where it can be created/destroyed without a trip
via probe/remove,
and so tying the lifetime of the bridge in question to devm seems correct?
