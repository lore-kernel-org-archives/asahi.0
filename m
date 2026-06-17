Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB48A402429
	for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 13:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781701336; cv=none; b=AW0J6LcEJ1aPVIP5wc5A9rNder4FBSEmOC0GZbNjbUEvJN4Q4bhIXro5L4TxkfiinyHPcyerBAR4u9nSdSDAdx5n30a2O//NSNYhSQ7Zg7UsAuIr4XYsOi+hI5buDmyKQ71sWeuCP73Rou6AM8NUxiBAHfZX0ErhsWvI4MUDbdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781701336; c=relaxed/simple;
	bh=ER7cBoORTtCo7YHQmTGpBnqKr/GhDtCtpgQSSh5vv20=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lBRB5cPURJXun9ke6OcovBP1/yEHrRRWB55l5hWHQ9QqC9cQNfjs33uq91alV1kGgAVJH0cAZ11cK6Z6G7xBDxBIwPpH5+rFXIYjeJusln0CtsP2QvX7gM83RvTlyuBUDxzdEbgCxdDZVEY+yd0VkJsZVHJfSdJkg6lsgW74MhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dvEr+JnO; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dvEr+JnO"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-491609cdd8fso30768725e9.2
        for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 06:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781701333; x=1782306133; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KoyHU0/MnlEjPkHmAG8qUfE8grsoj3Z59or+Bu6rF3E=;
        b=dvEr+JnOqy+k6DHeoQ7+VD/iUQixSxvRvmHXuhHOju22YBDWNFn2FxMQEDlmQhT8gc
         3qCdsMkyn9PEp5XK9wrNR0p3ygIu2cx2vq+t2kMjFF/OtKHjofniPmA4vvd9+W2uZsSO
         10HTlNd2dKMVUFTqdtZubUHo8tr3T5Fo+hkHG1KoR7HUNylAp0zxqCPGhP2R4dS25ExO
         Fwx/zOXYiXHFcjdVyqSrM/c/nV4T9hasMOYc/lZMUcSQRgdV2qR/r5Wk4/BWjHTbRxOu
         CjeuPzTkBJppeSj5h4Tb2z3hTSkIv/WE7wSO0bCZFKw7u0QUjtzsYCbBvmKwzv5avZeq
         FoeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781701333; x=1782306133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KoyHU0/MnlEjPkHmAG8qUfE8grsoj3Z59or+Bu6rF3E=;
        b=kJY2XFU5Q7ccuvNuxemPqmRENZ0EY4jccByiqJXG9+DxzKnP+naoFDRlXdx/LsY+FO
         BkSHoDyuk9/0Mxj4ukuWTgEZRO028G1oDKrqgfHLMEiLxqvRsp+sT/W0R68qDZgykZp/
         Y2wzsgKVT17KVqYVEAwjUbwzOPoOcY1WRa8d5cQlGdQMozugPMMmCQXiXC5AS7WlJrq2
         W8zStON2uU8sHBYkq8RDc+HWwttctmXyx4hRBDCv9ckAAWsrbro+UCvzMWn9tM27/iJ8
         7IFVPS9753rxT/E7UcwqMkmvWc1Y5OZGc4I7bPjGm0Ji2e9b6VmoMk9sTK5nQayz1juX
         4R2Q==
X-Forwarded-Encrypted: i=1; AFNElJ/LqV3oR7ayVtWQh3ZVoKiIBiKqDHVRJCvhJEi8f2qzufNDgMCm3mieTIJALiSxaKwAnd7/yg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzfQ4WwqrunMTVymgUgm6i5rJC3X+nqxTCeQLsDSlf096VDCaFO
	zyWAIoKCGl3ES40d8pglX5zTqSHpu7br03T45J+WHdJvYxuSYNY86Cjw
X-Gm-Gg: Acq92OE8boeR8brAAYb+OP7YmA1ASYg1pPUeCk9HQAPZb/56Y1yM6DhpGe8Yg2it9y0
	5QiZiEcP/eDsHn5T8ZwTjrN9ub0e92OtnhehC1Z3PGnziSYb2WjcDaxVyio8jHS84f1ShenaIBJ
	320FWpoMRq8AbZWpWqzTfK+1WbRQ+i5inP7DYcmEIHrJhlgBlKZJ0S43U77ZTUHt7a2RXU2BACj
	YFKp8vkDw+OhCH35MZWg1uR+E7N8zhG9cjszzqlmf7Yzrq9DX8jRPB3tgNk1/rHOm8pDSTXkngI
	lA7XuQ8MtXugamReq9mG9AEW/Hps+YPpk7IwVqzVBcjoaMiXtaW3Z+eHsuR2dUfGBrYfNqf2vnv
	8fpjqzxKraHRBq8WZb7W7A9gLPHVK65prKBspw3vbR7GRLvi9+Miu4dz0C+v+S2Av5AjUYVmuTH
	saI6eB10xU1BP0tO8ZLqXpBG2AugP0H6tPTAXNp8TIVcnYncXccQ==
X-Received: by 2002:a05:600c:8189:b0:492:32a0:7f92 with SMTP id 5b1f17b1804b1-492333aabe8mr70111375e9.12.1781701332662;
        Wed, 17 Jun 2026 06:02:12 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a4ff67sm157906775e9.6.2026.06.17.06.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 06:02:11 -0700 (PDT)
Date: Wed, 17 Jun 2026 14:02:09 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: phucduc.bui@gmail.com, Mark Brown <broonie@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Cheng-Yi Chiang <cychiang@chromium.org>, Tzung-Bi Shih
 <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, Benson Leung
 <bleung@chromium.org>, David Rhodes <david.rhodes@cirrus.com>, Richard
 Fitzgerald <rf@opensource.cirrus.com>, povik+lin@cutebit.org, Support
 Opensource <support.opensource@diasemi.com>, Nick Li
 <nick.li@foursemi.com>, Herve Codina <herve.codina@bootlin.com>, Srinivas
 Kandagatla <srini@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu
 <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Oder Chiou
 <oder_chiou@realtek.com>, Lars-Peter Clausen <lars@metafoo.de>,
 nuno.sa@analog.com, Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
 patches@opensource.cirrus.com, chrome-platform@lists.linux.dev,
 asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 15/78] ASoC: codecs: cs42l43: Use guard() for mutex
 locks
Message-ID: <20260617140209.3f89706c@pumpkin>
In-Reply-To: <ajJ9rbHTspXHo6Ou@opensource.cirrus.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
	<20260617103235.449609-16-phucduc.bui@gmail.com>
	<ajJ9rbHTspXHo6Ou@opensource.cirrus.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 17 Jun 2026 11:57:49 +0100
Charles Keepax <ckeepax@opensource.cirrus.com> wrote:

> On Wed, Jun 17, 2026 at 05:31:32PM +0700, phucduc.bui@gmail.com wrote:
> > From: bui duc phuc <phucduc.bui@gmail.com>
> > 
> > Clean up the code using guard() for mutex locks.
> > Merely code refactoring, and no behavior change.
> > 
> > Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> > ---
> > @@ -913,17 +908,13 @@ int cs42l43_jack_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *u
> >  	if (override >= e->items)
> >  		return -EINVAL;
> >  
> > -	mutex_lock(&priv->jack_lock);
> > +	guard(mutex)(&priv->jack_lock);  
> 
> I believe you have to use scoped_guard here, as there is a return
> from the function above, if memory serves it attempts to release
> the mutex on that path despite it being above the guard.

Indeed.
I believe clang will complain.
That makes these mechanical conversions of existing code dangerous churn.

While using guard() (etc) can make it easier to ensure the lock is released
when functions have multiple error exits, I'm not convinced it makes the
code any easier to read (other people may disagree).

	David

> 
> Be worth having a quick scan through the rest of the series for
> this as well.
> 
> Thanks,
> Charles
> 

