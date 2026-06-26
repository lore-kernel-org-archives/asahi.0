Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F32253958
	for <asahi@lists.linux.dev>; Fri, 26 Jun 2026 12:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782478649; cv=pass; b=MN1qt1E28hs5qkp3y5198fWYjWhLGODrqPMc8cHnZvSL0dLhjW+wS06gMcjVf9K/AHhWeBV+yicvpueYNCLSQHVt3zqekz7h4SfZ+UtPwO02uh0Sr4zcUOt3iWXZ9wGYuWJfyE/kbGLMt+xxuYbHBm5nnmBWTdBBY7D8wEV2sIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782478649; c=relaxed/simple;
	bh=8sC/X8kFjJJJ17yx82agnNOpLpbjIzUNwznUcxru8No=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lWIQ/EPO83O9JvfSTACuWtdMGR3hu7rUTvZ4MDWWlIeStoz2bjvqD1bsnI2Eac+k60HqWZ/J0tbq8Rp3acQfg9bmbAy8x3Mwjf2ose2roepQllu9aQD3o8L7+LigU3ien86CVwqCDvrmZ+D25zKtfF8S3dfHF6fKlLydqMzDHck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J0UX1j3m; arc=pass smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J0UX1j3m"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c8584e80d59so384462a12.2
        for <asahi@lists.linux.dev>; Fri, 26 Jun 2026 05:57:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782478647; cv=none;
        d=google.com; s=arc-20260327;
        b=V93CmZOouJIkEPcm8HMlt6fSSWimcqmbtlFV9SItmlpRv+huzxgn5SZ7/b+8cVEZ7d
         Tyw+f/BKhSFcoJBoQfbn223wHOcLvccIo4MZpfyBwvmdoFmSpiUsuAsEm/hkKJw/7ltU
         3ynWFxZryfFYZe+tRF02sB266NfeuTQsoEQY3YqvHlNmWtix+7d9Q1MSlgaCZzDKHEAx
         c1+MXGkRLhpnQIW/RRzjVVsF/7cdaTjsUdr/lz8AIOsJynABHsMl/6pl/1nSXGmI5WvN
         UzIaaOMU/RXGz7Bri3V0A2iVv4CshARnygXW8BujvAyVxnKhfwO5juNZwCjSZt7KicE6
         7CjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tZgJt3XD/Oh5GCeIKGuzpoEzx154Xmg96jamGMCE9ck=;
        fh=yS6vwJ3tUFG5daeZz1DvhWItLi93fW2gfT+l4hsRaMg=;
        b=gZwwQ28tL3Ng1kzt1K/iA1DII2Nh+lx07+s6rpATW5g/GZwk4mHgy1qtf9rkuqSSSt
         U8j2wqf/YdahN/5We+5FyrOwe5AsNIZ+ovrwhAyLHYazkBInZSXRY+p092xsvoh7rUJv
         kXyRpJEWw2IPN53lNbooFV51l/RFNXhdfqcyeMDiQNkdSDtOuEkiKIqT1yL/FxOJ2u2U
         1fKHS+lFQbibzQfZ1lf9kz4yxkWdf0f9mIA+W7AQD9x43C9IxQveIrM10mKz3HiBmvZf
         fZHANED/r+diFHEA8ZziTUp40tp3OReUAK57s9kAbkRrYovDnvjQde6AQTIaJJ1LEbU+
         pKdA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782478647; x=1783083447; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tZgJt3XD/Oh5GCeIKGuzpoEzx154Xmg96jamGMCE9ck=;
        b=J0UX1j3mjQh+GVl+il1cdabPSMVBV4AxORGcYjdaVh8LsVfsj3DVMElPq+ZmIDBy4g
         61ODzY35ShmZKJZEDeCobENh8tVmBXigNa+T0xctDyPhDjzyCoV8ID01xNBzygKebZaz
         VtryoBQGiCuaO0acomh6djIaCdBI2WMqEJZ0EYmnjFrkzcunBhAQXg3iJtfjFf1JJJfV
         DN9ySVPMpGPozvjWYFnPx9S9hCBszK1KRm1doKxIHhdUirPP0STTgBj5qBySBkBripSI
         YQ2AvojrM05GUxaEfJl5idilSNe8ZwDDbwAKx0FG7HXY9cbnOrNpzG00mlSsI8rA8Dhe
         DJhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782478647; x=1783083447;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tZgJt3XD/Oh5GCeIKGuzpoEzx154Xmg96jamGMCE9ck=;
        b=hmIt3dDO5mOB89VEsogy1Cv8jUuGjFnKuFT5tPYyE4f7js7XFwUg4SaEeUtCETDdPD
         yodUCMC/tqdvX5QTAJpF6PuCYEf0toRIwK0VYlp19CezBlSc09y7C34rPueJ2JdjxjR/
         DY3EDJoKCtf81XtG0ALC4Tkz5AQum0Yadc7LZnB7q5wpaS+FesxhBLRRqKurhodAhXjB
         /2K0TK7gZzQnlG23rsSBU6Tp3zVcRVqD/G4AhRfAZQt23hF5/Zc5beFvCj0kzRQwgyf+
         +q7c/P4hi4J4JqTfljgbaYHVOh+Ntp98dwJrBryyGrq1GW1JGOyAi3+5+BjbA5QYSbeg
         hgTA==
X-Forwarded-Encrypted: i=1; AFNElJ8nU+JUUJlgkbK7GgCuBEBGTQsFv7XvEkuEdT5vKTzrMJxiiyACquNRdvvaVxiSfRZwrZaszw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzl/OK0JRGGrcXSuF3YQxsc+2m0/xvPSNfuGuNgj0RIz6ln4bQF
	TfAALHvP9zAwmbjVDgflyjLBAPybPuhEZ69gUA/jXyukh1ZQ6um/6M5rfsUhjaLnA5DdHYMNH+a
	CRGVLZFi8aI3u6NhHrDYXNWQXasMUgpU=
X-Gm-Gg: AfdE7cmSQXY2ej5zXepwT9mI4E0nqa2QoTjOQ2wW6SFaZMN4HDzM9B9DsTDYBEUL0j5
	N5XknrdFaCnVunD1Y/VF+/KVzs0n/ARbFPZdYwyi/n6NH0VzK+3y2YHJDThHSmhsyrfGfdOcBZq
	CZgRnJctjYelbSHcX3my7B2Wagw7IphRaLgzdhj6fkRIUOhYZb5iBkbH7BvhuLHN9GHk0Vvwm9I
	u7t9h/rsSPvx1MqzISPyn+54hBrljc5jD2sbh6eNr4qzuHmyS1MUn9CFng0PSmtjEP2d3SR8l8I
	CvyYm4CIOI05ZPHyKFXLtvFPHSFmh7A/pOw+vCvONOj2VpePggusZnmXjxc5
X-Received: by 2002:a05:6a00:390b:b0:845:6252:f69b with SMTP id
 d2e1a72fcca58-845b3b09722mr8163064b3a.46.1782478647492; Fri, 26 Jun 2026
 05:57:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260626061329.23264-1-phucduc.bui@gmail.com> <20260626061329.23264-16-phucduc.bui@gmail.com>
 <aj5a7pgaDoN30Gs5@opensource.cirrus.com>
In-Reply-To: <aj5a7pgaDoN30Gs5@opensource.cirrus.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 26 Jun 2026 19:57:15 +0700
X-Gm-Features: AVVi8Cf6eb5dnLbYsqjVNTri5x3c-YQFHB_0iF60ES0iQWHt02WjGfax8ERd-Y8
Message-ID: <CAABR9nG9jDfK_wqS4Akfz5GL6HvZ-RkpPuYx4Q=vMn5jH_0foA@mail.gmail.com>
Subject: Re: [PATCH 15/24] ASoC: codecs: cs42l43: Use guard() and PM runtime
 scope helpers
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, David Rhodes <david.rhodes@cirrus.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Cheng-Yi Chiang <cychiang@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Benson Leung <bleung@chromium.org>, Richard Fitzgerald <rf@opensource.cirrus.com>, povik+lin@cutebit.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@opensource.cirrus.com, chrome-platform@lists.linux.dev, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> > ---
> > -     if (!jack)
> > -             goto done;
> > +     if (!jack) {
> > +             regmap_update_bits(cs42l43->regmap, CS42L43_HS_BIAS_SENSE_AND_CLAMP_AUTOCONTROL,
> > +                                CS42L43_JACKDET_MODE_MASK |
> > +                                CS42L43_S0_AUTO_ADCMUTE_DISABLE_MASK |
> > +                                CS42L43_HSBIAS_SENSE_TRIP_MASK, autocontrol);
> > +             regmap_update_bits(cs42l43->regmap, CS42L43_PDNCNTL,
> > +                                CS42L43_RING_SENSE_EN_MASK, pdncntl);
> > +             dev_dbg(priv->dev, "Successfully configured accessory detect\n");
> > +
> > +             return 0;
>
> I really don't like this duplicating of code blocks, it takes us
> to a situation we always need to remember to update both blocks
> in sync which feels like it makes reviewing future patches very
> error prone.
>

Hi Charles,

I understand your concern about duplicating the code.

My reasoning is that duplicating this block once lets us eliminate 12
`goto` labels,
which I think makes the overall flow easier to follow. To me, that's a
reasonable trade-off.

If you have a cleaner approach that avoids both the duplicated block
and the 12 `goto` labels,
I'd be happy to adopt it.

Best regards,
Phuc
