Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062D63E008F
	for <asahi@lists.linux.dev>; Mon,  6 Jul 2026 10:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783334812; cv=pass; b=MwmpN4sFywLd55wEl7SjXg7+AvQbLMtbV6yfIo5sxXZHMAAn93i/+oFBFww4nC31ubvZ+ASzsHKeBAGg53M2TqJXe6fA2q/c6NZz/7IhDw1DlacW4LzaPBqu26No0RxzA0epDZo8BhX9mE9rWGvRkDqjrvg6vj58EZBCEqRweQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783334812; c=relaxed/simple;
	bh=uUIk3kxclfHLCmTIwRsZlNP9+Z44aJAAqLrMNzUY0j0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PKHpZDw190xMhEFsiv2JB/ej3qyO23pTOg9e02vyv8/KCEUod46MlDrsRQ3dyd3oDNqJ9Kxl/6i9YDVkWYRo/o5URVuB04l/WSDqfmX9hfl6FIHWSH6fPuCPF39D+uSBpYZ9U8yHcPD+ne3IcDoNA+0RiMuzNymk973xumpUbrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DvLxpsbn; arc=pass smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DvLxpsbn"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-381065a7a03so2056152a91.0
        for <asahi@lists.linux.dev>; Mon, 06 Jul 2026 03:46:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783334810; cv=none;
        d=google.com; s=arc-20260327;
        b=QLhP/q2lXIpZGz6XTF9uZpdWM0OyonxroayO8n1zW8cC0ARJygWocW6+FkD6wDh7dU
         2UvhoMJ9xUnYLLEu7QwPb+nzo6aZYD9dF8hIAK7WGZQEJmd1HAONpRyA7uLfwLFAZMOm
         F2FrfeRaFFGHhLkdYppoY1iPoUkPjQ3nhcQoBKQbnnJAxEPobaMgPzGGKvpEwKuekfmf
         ryLu5G4E6zH3q74LhocRnJ9jg1jTRrWUel/VEuTEKy/8qzPK5Z1a4vGt7tphvv4I5O4U
         k8CZFnIOuhtk34sAcOo8iO8dU6fhhuE2rxlBVR9RQVEmQbOV+YnLFUQLCQUboeiBo3d4
         3QRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=J86H9bXagD00jbr5qUyNUhzQedlVcUlifJq0za2JQfM=;
        fh=nabuvkAuaD7ILwv0D9QwT1pr+urNy3zNiePb+WHptLw=;
        b=jXDnzsy4qxYOmykTEBoUvLtO61HKdK8pt4NH0pqe3mkXGV54yLfeJ3p0fqazxEDESr
         XfCzoCjoZigSSrvkEWE1fJx7LV3soMxe+DPtCNX5F4y66MiY4lWkJuwW8c++gcC/jCPW
         cL5Bjn72ZrAtR47iwDMn70n3xZpgxl2NwkxMfErKg3d9/C5gNJqkYpgquF0SIjqVtPds
         gOAnyhYnsicV8FxfRBTgMjjh6QXKYxrUu2t7ECnW2rZEY1tqCqwFtSQgejgL7P1Znavh
         88yESziCwykEA5j9D2EJ17O6Dp5mawXUMYWo5LQZ5kbzh6L3Ox+FiHoEsMHdeetk+Xb2
         vCYQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783334810; x=1783939610; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J86H9bXagD00jbr5qUyNUhzQedlVcUlifJq0za2JQfM=;
        b=DvLxpsbngYcCqMLuyjmivq2IroCG8nFiFp3EXM/7YtQxBP3Cont4USSqASehKO6NbM
         n17Y7Vd1WA/BbJVAfyLDIQdZ7KHYWnYl7u1rLjruYhwIwAPMoejqkTsBfEN1DsSlFmvb
         Z3Jg+nFDR6mU7mKQs2Yihzg7Vk++gxfUh0+c+O7aLHb6Ql31vXDhIGLAagr/uZwweUSU
         /apIvhrS9URwasVKSxVtBy2foPWhp7h0u6/5SFqU8QuhaaGElKT/Zw6B99/GF2o3BF6/
         nVlrY59Rnz4P77JK4yqCaCJC90x7MRpT/udYQAYiV1TBEq7O/XeDuklP76mNgv8aCzrE
         DNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783334810; x=1783939610;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J86H9bXagD00jbr5qUyNUhzQedlVcUlifJq0za2JQfM=;
        b=lm+htxcWxt5wYY25eHbs1Rq5n0imQ9mAxvtWq6cb/1ePYgsvK6+QmEJRFMUMtD0pEY
         /Z5ayNp2HxlUUcUVdJ7Magdkvx8S0vWY89qugWjDybo4/di4rBwU0xA3AR6DIYqtzX8h
         NgaU3lj6sPROzPlQNdpdroR9bJR3obNrAdYIA+QlXoLrdLmOkRcXAVEKh1aSTq6UUjdX
         Ez4iPRRo7Ly31BnTWzoCQRzitf+7b3yRaDpCD0/EAx0yRF9uUjsNWLdUlcUf6Xqe/O0p
         UaWQIH2T7divGngpliGXCZU2Nj7LS/liBb12jgvcnoglfmJl2I9zRzfigSCgw2AwnFGl
         C67Q==
X-Forwarded-Encrypted: i=1; AHgh+RqwEBolgyU7GetEC4T3KhACygV4qdrx+++E5q1L9yX++bCqoexT9kjCqd0yShMX/fGgbsmocA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyGqJYyh/S4mGFMtVpM8yFbEqejGqnlZo7sDmogd1mglOPWtnzM
	+ueD6c4MLbU752d9YgqPPkKd5w3yDmTHPejYcQRt2Cgu4+3y4EsbVsb1qSe2OXKhB2O/mUtfWr4
	vPUx6YnF484XfkHPPWXkxG+Y01ishiXU=
X-Gm-Gg: AfdE7clcwUfXDxQ3HLwAuIgPJgBE3i/Kdc7ZCiPrA8Crap/cpgTeQjEDw0CUkJBMcFV
	XCy5u78qaf1bRX6CByT3srv+O1TBmjYYAyrTK4DPQvcV0S+opnAfYNMuzH4Ju1S5l79tYxKApE5
	gcI5hTvY/p1Ye3MaaMYiJoXnM6VrAzFr2+hOvZ9VbjJxx6qBBESvMtTy5sS5zFped+4SPyRcbn9
	AW2i2hn+WxYDkvmFPnKfg5iOac0ajZl6s6/rYnieD8xpDWvkhCFt5aGKt2WGOyuPheXjIHNXuyJ
	hD6nCOykxSz4axUZIaVf5m1sngI=
X-Received: by 2002:a17:90b:5390:b0:37f:eb45:e058 with SMTP id
 98e67ed59e1d1-3829d70cc30mr9250564a91.19.1783334810241; Mon, 06 Jul 2026
 03:46:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260703055355.244898-1-phucduc.bui@gmail.com>
 <20260703055355.244898-14-phucduc.bui@gmail.com> <934f9346-f530-4107-aac3-1cdd2829779c@intel.com>
In-Reply-To: <934f9346-f530-4107-aac3-1cdd2829779c@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 6 Jul 2026 17:46:38 +0700
X-Gm-Features: AVVi8CfcqZEkSIP8omXIyORuxkBiX744iOmSXmoaBR0SsfvMSdawSePMoE-lAFE
Message-ID: <CAABR9nGSRH3DmehUxQVmfJ4Po8TOhfHXDnjjkzVJDZZ1w0_51w@mail.gmail.com>
Subject: Re: [PATCH v2 13/24] ASoC: codecs: cs35l56: Use guard() and PM
 runtime scope helpers
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

Hi Cezary, Richard,

Thanks to both of you for the reviews!

> > -     ret = IRQ_HANDLED;
> > +     return IRQ_HANDLED;
> >
> > -err:
> > -     pm_runtime_put(cs35l56_base->dev);
> > -err_unlock:
> > -     mutex_unlock(&cs35l56_base->irq_lock);
> > -
> > -     return ret;
> >   }
> Nitpick: this will leave a superfluous newline.

You're right. I'll remove the extra blank line.

> It looks like a bug that it checks rv but returns ret.

I'm not sure I fully understand what you meant by that comment. This
conversion preserves the existing behavior, so although checking rv
and returning ret may look a bit odd, I don't think it changes the
behavior or introduces a bug.

> The local ret variable can be deleted.
> Should change all the error returns to directly return IRQ_NONE.

As you suggested,
I'll remove the ret variable entirely and return IRQ_NONE /
IRQ_HANDLED directly.

Best regards,
Phuc
