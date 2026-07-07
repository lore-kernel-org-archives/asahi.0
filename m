Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406D1372045
	for <asahi@lists.linux.dev>; Tue,  7 Jul 2026 04:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783399252; cv=pass; b=FbHiYl6WI1mSrb2wmscTdnGUbmFfuqGMUaqzIbpwL2lFUxGJGvMdfDaWpUovIdxpANDwiQ/DPsqF+2Xfr+uJNhtuNhMAC2DFv0C28oQ20sr6IU2+b/ipv8KgTMGjoTp8m7+TVwvKUU6PhUWn2O7pavr9zsrr+2crM2LGLoGIjE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783399252; c=relaxed/simple;
	bh=pOlCq3UH6N22anVd0FdFVZcCqdVlilTCIIH1x5vVKWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LMkTZRTjPH5FU7BfwTcRsapKSimuGUQnROR9aupPNMCJjdUb0lbVNR2ptVQCi9P8ywxnlURUDOmIOn3A1yHYN5aKL5jiDKdDokb+qznu5BqyJvNpJPTgZZHqcgIMJFGu6feCTdEEfXEnVbPbyXtky50lwDUyVsF/5XbgD59MdpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qq3ds+Uv; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qq3ds+Uv"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cacb8416a1so30946395ad.1
        for <asahi@lists.linux.dev>; Mon, 06 Jul 2026 21:40:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783399251; cv=none;
        d=google.com; s=arc-20260327;
        b=D6yrDjWSQouBRgMAizrwHJPsabfF3zFkBkFOvE8+m1HCXmSU1JExPQcvt9N97fHcd4
         gSCxfhkKnOoeG7PZUH3JmuubFKKSYXSupHxz194LGCi1zQNquyG03pNd6i4eG+QtpFyH
         3o4+en2iMO9EPh5qj2tkPb0GGz6FaZIMwa0cfzzn7drsviekRdbeg5VnwM9J5zJpDNsa
         12lzb7G2P6g5QypVWbPb/IPruqFkKrOSvJAK4aOKoaC4qigkRkxXlVOP4tN0P5a9hu1+
         Lb2UvQ2ScCDUwwTILe1ix/NUeJROced7fK4phEbg0aNYjhiWOUvt+htk5c276fZWD8QR
         2jEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pOlCq3UH6N22anVd0FdFVZcCqdVlilTCIIH1x5vVKWg=;
        fh=zzAll4N9rMEbO3Plp5/SBuiyySDX8KSIwyNOPY58wBg=;
        b=FKJt+n7PZ5SdTHeAhcv8C60Nf2uHbCx71zUP5TDKOXJzVlgvfTF/4hOa5zBzW3LfWT
         4OUyYjbFncUjTcLTbgyTigVGaGkG6ZZTTNHKIJCno2P/cMsazjr1UxQXX3Iur3rdfU9k
         HWbY6WgPvTKcP3iEJUUmqT3BjqZ3SvW7FBtS4IdFxuWD47KYLncfKE/yVj5A54KEc0AY
         w3YkDzaCnExAVCMZ8Hedjfe8MRPmLTKKm5CxjFKH+LjJdZLedWIbBPjEqbhFD1vsczva
         YTX1e3xFYae8BA41yvKFBCrohQFoEXmk+mgxHKHEPcJQl9VuLjQ6dCNW/5YMjehN/xuM
         W4Dg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783399251; x=1784004051; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pOlCq3UH6N22anVd0FdFVZcCqdVlilTCIIH1x5vVKWg=;
        b=qq3ds+UvxzPJFGAztBadtmZ6D1RG9jpQScTxWB82HWiQBm5YSnwvxIaSX9SyqzSHuZ
         jrgjJ14mErCYYKUJtJuB6+xsPOfFFj7hDPDlmgYqfUPK5G9ch6LhjnagR1FVY10iV1NG
         i6Yk/o6/Fi92hVZiTTszFkQzOfXmj86IoCCIxGoW1ahQS6T9IukfQZys27kePquvXg32
         hXCkMHCY4c9xyDg5+ClmbDGtS1NkSe3zcNvXgEKZX0dXQxN+Oa+Zw0WDc1LBwm/bbTI9
         xY+y3bjcGZ1bJmkzoBVjih3hUugTvMVwSd2ZogolSLujztRr5AbTJ30X/sadfiXc9kVa
         VFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783399251; x=1784004051;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pOlCq3UH6N22anVd0FdFVZcCqdVlilTCIIH1x5vVKWg=;
        b=f3eTWKZ5V9HPb554Ej8SP2NuZ/0DtcAckJYqS7DTdZJp3wPu/hcgUkmLaWD/EFNrgy
         kTgO7+IKSrmnU7R+UHRV+tUKbFS4Xun5NGM2U2vQWHHdSuOZ9suLu/x0/bZ0z6bY+J20
         PTmgutCXA+vfG1ybsfGuTd27LOJKnB1vL8TgQZD6xOrpFRrkLB41VfN8GcJAo7dWyreU
         9b2aKZ03VNBBdx7yiMsN6XXvdNJ8a7KA+iIDth1xX1c8ql3Um5yQF52x8qtu9A/Z4b2r
         lClTOR8+/KgrmHL4Z7fs+RwNVyhzTVNDEpOoB4oQ2LkMJTNXWzgCHbp3dO4kYMJUTH1y
         davg==
X-Forwarded-Encrypted: i=1; AHgh+RpqwdHqXY01lK7SneAIj/ymBOiqHg/VlC/Ns/+wDYwiFdF564QlphAcxHQ1OGlhwMPSZMasqA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzmFG/jr2hD6DVMj9plrMzk/R1A0c+2XMbLKCW2kbgiBTWVgkqC
	KZJAimoT2pvxI1sdaV0SW0Y6kl8JJQbL7JmS2bSelANqIwIdpATn7ghJ+Js5mx4RUy3QEgTweqm
	CJyovXoidPEwc5V5gOH6K+tGE7TeRI1Q=
X-Gm-Gg: AfdE7ck+4SpiU9zrGHWr+s2Ezo8yzUK6fjLKpdnQvSEMWaXJeIjWcyX7cmWN6fxuVZA
	AmODaiDIuGkoAUvHGSs6P/WdIMm7XV5tE0WAm3qgOYLIQceIWm2UBhjfaN4HsoBt/wUP7y9Ejyc
	/M/j8ErTaIj5Ic9XhPuzSI15LLTKdNPf/q9/b0nYSKgkGDBH71bewd91wSzBYuMpN5wgB2hrkFp
	AOQ9e42XtxVROWYx/BhqBh0ucDUI9H0JKTOO3FMYaXyptVnHht/biN7sQ0pVScomVVsk7bpw072
	JDoDA3b4pWCjUfIzS3AY1b//XDQ=
X-Received: by 2002:a17:903:120f:b0:2c8:1f57:d2f7 with SMTP id
 d9443c01a7336-2ccbf0569edmr35053655ad.24.1783399250287; Mon, 06 Jul 2026
 21:40:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260703055355.244898-1-phucduc.bui@gmail.com> <71b1c1a0-fcef-4102-8ab6-146a2c372adb@intel.com>
In-Reply-To: <71b1c1a0-fcef-4102-8ab6-146a2c372adb@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 7 Jul 2026 11:40:38 +0700
X-Gm-Features: AVVi8CcQCZizGEeAayJz9voLwANrNZWRykbsEcNpz8Fp4dCchth8iHayuEhTJkI
Message-ID: <CAABR9nE=KGshxBg2mEF9gsXzv0WStXf2MPLeye-kTg+_SL7+jQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/24] ASoC: codecs: Use guard() for mutex & spin lock
 - part 1
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Cheng-Yi Chiang <cychiang@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Benson Leung <bleung@chromium.org>, Richard Fitzgerald <rf@opensource.cirrus.com>, povik+lin@cutebit.org, 
	u.kleine-koenig@baylibre.com, kuninori.morimoto.gx@renesas.com, 
	christian.ehrhardt@codasip.com, Linus Walleij <linusw@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Chris Morgan <macromorgan@hotmail.com>, 
	Dan Carpenter <error27@gmail.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Rosen Penev <rosenp@gmail.com>, Weidong Wang <wangweidong.a@awinic.com>, 
	Teguh Sobirin <teguh@sobir.in>, Val Packett <val@packett.cool>, Luca Weiss <luca.weiss@fairphone.com>, 
	wangdicheng <wangdicheng@kylinos.cn>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	chrome-platform@lists.linux.dev, asahi@lists.linux.dev, 
	Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	David Rhodes <david.rhodes@cirrus.com>, Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"

Hi Cezary,

Thanks for your review and for the Reviewed-by tag.

> However, I'm not the one who will run the functional tests for these and
> from review-perspective, the patchset overall looks OK:
>
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

I'll add it to the next revision.

Best regards,
Phuc
