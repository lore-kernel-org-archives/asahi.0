Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FBF363086
	for <asahi@lists.linux.dev>; Fri, 19 Jun 2026 09:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781860432; cv=none; b=KEBdPbHFTSRAbT73Cz3MW6auWZgzzQ9qldV/d0yHTEhVhzposMVt29lEMhEvpQg9f92NOzMxm+g7xBMippYNAmnp0XyWS4zvP5E6NXTWETzdCHIMwUKii6OGG7xKD3+RUzmwywynLDnOGiKcNJaBOZVYRUCOR5KHWLo2uiaTKr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781860432; c=relaxed/simple;
	bh=lHzB6EZ41MiDTwBOkyeJrpZ0oY0kME/5CGkptBf/jlg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ns6+nksTn8R57HrKQPiCrjrJlmdrqMoIYQCqIqB7p/nNO7U0GHlRUtJzfzXKGgwItXb8GnleKF+95r5Rl/qFZErZc4fVpgoXKoQLXQYb9pPmufB4MnGlvqtqGBoUL8XtCREIq6t3qXjGF0stKIgz3slqcVsaP1Y9ndOkD3V0FIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LYWxBFee; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LYWxBFee"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4645995069bso1050223f8f.1
        for <asahi@lists.linux.dev>; Fri, 19 Jun 2026 02:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781860429; x=1782465229; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IsrGIaLO7MXNYwDCXl5rLdyTY6/tEE8Vl4Mj+GBAm/g=;
        b=LYWxBFee5C+IkNhjJv+lMKH2WipIc4uFNGOcUN4Aus7lUnN567lymmuEKpgFni+pB/
         zC5azEDfY0C5eytNXf7Tp5ktZ/x6MuQyb8w8iI5G4XD6DwrSU9wsfatoba1SWMlq4eM9
         WRvkXDwoG83xDoMUQI4tYV9rBTRaNppW6VCGqnwg8wa8TtRq7UCGHXR0cLrrYNeSc9+d
         7cRSVBmixMFhCiQ3mLntm51P2kEwE2fvpSWHPjNqjbbUCeZbghOOqzMbc3PYskO9NJAP
         1svUhXCcit4nrnGOHmxcMUHNoaP720/QXRwkVAD9ZPnmw+6bCoI0j326OETT7d5+zVq2
         NQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781860429; x=1782465229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IsrGIaLO7MXNYwDCXl5rLdyTY6/tEE8Vl4Mj+GBAm/g=;
        b=dPnc0dV+08yuYHOteIj1JnW8tvqM18FuRRFv46oTehm4gIRSBlpeJD8Ot0wMEr82LD
         PIzAZ7svefTv6w0Av8Z/G0uaw3U0yO15wps+zISLBl+7W3jbpwxNf4CDMa0af6XnOq02
         qk0S9QaPY99YM3HRDUFPTtt8S9Vd5XUr6tytwp3JXujwvoco8O0g6NH36lqR/p+m8Ll+
         G9cNFzRcZ2BX3VPqQ62dicesywZr0pWePCxfdk444xWU/LtCil3QQhGtqzseYMIVEy0X
         Z9WiiuOGNweUef9U1DCRXPa02nqXsuqxb6t1YzRupXN3LCWmLrcQZC/8F4yKonBoyqlY
         tG4g==
X-Forwarded-Encrypted: i=1; AFNElJ8c2JHdVtcIsnK92mYWpa0jp7nA+dNF5Py4ZyRIcAnLjV1TIvpaY+WzsElpVycN4s9oiWTWcQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5vaMIA8M7MYy1+7ruoNyRmMhDyqLTqcSrq3ElfJBiY4rLjpx+
	E8AnzQUdhxyPVoW+BjosYSRjMTq1SWT0x7mP30IybcM8SvDVSVDhTyp3
X-Gm-Gg: AfdE7ck0UdC5TgKQYC1dnpTjNQYQR/MoMc1SAR9MjHB9chpmKS+OhktjDPrKhaxyNm8
	aS5DDDcYGupdqLPNPGtgiiD2Bi952CIiDel5zYnYaaYbUDZfIrCErLOM8V/7ADPNksfC2FdLJCF
	ugqVo9gPGbE5RlTUe8HIv0nEkTwYFEcK0ndrTEnt+KuKmjlSAANPeXtjARaDJhGtzP0LPP0lW1r
	dDCt1ZjFnl+nNLVxQt0Eu4U2qcwy03GxD0OV/zPBA/+fLrFihH/a6+/JAc9OqYKE52p0Ifgrh1L
	bMYcsFOFv1boWyZwG2g1KohOVrWPnOtsDyKuUr493480g1vq2+WjiB+N7c/hP5jIgTKKDQzqnrl
	m1nUdVNq6dZV5Zs+6JWRhXcnMRexDZixcir7s/YOxsbXzm2MbDY0BE0YXh8isjrEeexxK2upaCO
	fzsekZWT3+HOTPI1J/YpRH6Spilzb+h1Xjf71tGdl7P4tGbKMr8g==
X-Received: by 2002:a05:6000:41ea:b0:464:5df5:332a with SMTP id ffacd0b85a97d-465026e230fmr5178308f8f.34.1781860429313;
        Fri, 19 Jun 2026 02:13:49 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650bc428d9sm6387329f8f.27.2026.06.19.02.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 02:13:48 -0700 (PDT)
Date: Fri, 19 Jun 2026 10:13:46 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, Mark Brown
 <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Cheng-Yi Chiang
 <cychiang@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck
 <groeck@chromium.org>, Benson Leung <bleung@chromium.org>, David Rhodes
 <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>,
 povik+lin@cutebit.org, Support Opensource <support.opensource@diasemi.com>,
 Nick Li <nick.li@foursemi.com>, Herve Codina <herve.codina@bootlin.com>,
 Srinivas Kandagatla <srini@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Shenghao Ding
 <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu
 <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Oder Chiou
 <oder_chiou@realtek.com>, Lars-Peter Clausen <lars@metafoo.de>,
 nuno.sa@analog.com, Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
 patches@opensource.cirrus.com, chrome-platform@lists.linux.dev,
 asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 15/78] ASoC: codecs: cs42l43: Use guard() for mutex
 locks
Message-ID: <20260619101346.2ec49087@pumpkin>
In-Reply-To: <CAABR9nG+6gOj4KnWmTyykgGN93xy6jKQh+-_f8Xxn=Jkv28vBA@mail.gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
	<20260617103235.449609-16-phucduc.bui@gmail.com>
	<ajJ9rbHTspXHo6Ou@opensource.cirrus.com>
	<20260617140209.3f89706c@pumpkin>
	<CAABR9nG+6gOj4KnWmTyykgGN93xy6jKQh+-_f8Xxn=Jkv28vBA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 19 Jun 2026 15:20:37 +0700
Bui Duc Phuc <phucduc.bui@gmail.com> wrote:

> Hi Charles, David,
> 
> Thanks for the review.
> 
> > >
> > > I believe you have to use scoped_guard here, as there is a return
> > > from the function above, if memory serves it attempts to release
> > > the mutex on that path despite it being above the guard.  
> >
> > Indeed.
> > I believe clang will complain.
> > That makes these mechanical conversions of existing code dangerous churn.
> >
> > While using guard() (etc) can make it easier to ensure the lock is released
> > when functions have multiple error exits, I'm not convinced it makes the
> > code any easier to read (other people may disagree).
> >  
> 
> I built the code with both GCC and Clang and didn't see any warnings.
> 
> My understanding was that the early return exits the function before
> the guard is instantiated, so it should not affect the guard's cleanup
> handling.
> 
> Could you explain what issue you are referring to? I may be missing
> something.

When a variable is defined (and initialised) part way down a block the
compiler moves the definition to the top of the block but doesn't initialise
it at all, the first assignment happens where the code contains the
definition.

However the destructor is always called at the end of the block.
So if you return from a function before the definition the destructor
is called with an uninitialised argument.

This has always been a problem with C++.
It usually happens when you define a variable inside a switch statement.

	David

> 
> Best regards,
> Phuc

