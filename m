Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F077408627
	for <asahi@lists.linux.dev>; Wed,  8 Jul 2026 09:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783502293; cv=pass; b=MjXx0URB758iPZRRJJN4g9aBlbwNcabOkBkd1Jmcuv+PiWzzJLxRr591iUn38hwLVLXwZs9XW3vhELfMXT368b0JgpK2Yz3Gc6beUqKtVREirWBrKLABESeEqAklD1yW0AVG6+5VB4iKgBxzhFx4XaJHAqWWHImTTKyM48+qa6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783502293; c=relaxed/simple;
	bh=PuwDkPB4+DP3Frg5ZiBjH6BGS1KGyNIF8NXdWFT9eoo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MUuLsP19Ws7aaRodvp3tUIJTXqcp1tPLYakDm6H8SfEnYy3kiAuJs6tdogJZRLsRArbDbrH1bcvvWKw74QE69wW4MUoQzIt+idZS/SzIxMljR0Oahr2w/ykCP+hwABMxf7XSKX4oWL/EPlRAaFFfzgo0UYV4WWozyCVtK171gI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gdFpN+qX; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gdFpN+qX"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-381065a7a03so338473a91.0
        for <asahi@lists.linux.dev>; Wed, 08 Jul 2026 02:18:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783502291; cv=none;
        d=google.com; s=arc-20260327;
        b=SACYNwb122aIlMmnoGmBhJYjHJ8dwRDFEzEYr8cXmB7Zu9jwTRr6CfXK1nj8jU221l
         /foScXqT0Q61yL/2JtjhqEh7JqtAQB2u3+4MNw1r5hEDlaiyuJ2jL/6ZeF6JsHEdtOBk
         P0PFW+6Y+OwcCqVTOMYAwRmNufbT+q3wlqOVAEnsPHj7NPW9OOAnvxXLr+5uvagt7sr4
         AaM12ym5mg1UTGMYVWgo6IBiejK0WYbGPuTyN9jmvpvIfJdZAYljxzJ0RbhaN4Ixv24j
         s6AkvM4xxwnFY4eg6/lcNUZKZXDEmn93c2ZApwMrYhLedWhBAzNgbW9xTvPFa7wMgvis
         M1JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PuwDkPB4+DP3Frg5ZiBjH6BGS1KGyNIF8NXdWFT9eoo=;
        fh=sYGrBNi94RHOfEIuUjrcrisyBOSRsFi7M/nRhU+EZr8=;
        b=lEjrRMbzPPKvcyrvmmNpFy2VNcTFBXEcevQ2l0Ef9bKzmPcZP0zby4b08C23O5Zwws
         ye8MW18XYrjXR0goLZRjmzKdVkxO62JhHYP+koWvLFsEI2bAwtp50b/nuREPInRUFdr2
         AgSNvVOUKT8kKqrLw1Aft4F8Q+NyVBX2R/Rl02f2D2H3ditt0joTQ+xGTxoyxZ8Y05NW
         6njI7yFxXakdKgfoHSKPX6l58mqnCEJzUUldgyePl4ZcRfT7XvZZxyvre9MeT2BNGsFa
         us00AEJedt3nZAdRlYOCZfEf9JMWd4E0u+mwouY0TTULg2wviX5YuW51jXcNgCtXX/YZ
         rsWg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783502291; x=1784107091; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PuwDkPB4+DP3Frg5ZiBjH6BGS1KGyNIF8NXdWFT9eoo=;
        b=gdFpN+qXO4Lu5iNemxTLlPRKJ1Jp34IxjF7BbR2ZUoKzNl8gZT1vhCAO84ZZrvroUd
         5uY43rrena5w/g3fg9H36f9jYkqbKw5236Ik8pcm2l0U2dY1XHBHB9h6bKB9///jd9H+
         uQU/9Kgso9XlOHnYe6wdubJ1CWREgkA7S2mwmd9o6WQL/m1XrjV+JEAcHj+scZHiaZOV
         bTjSSuSWO0kw/IALF+CiGqhiOA1d+sP5Sjnn7j42T5i76J0QnxrpWW+5QlYDRu5XW6Cz
         fqnK34OJ7QzWj7xjAI0I86GLfbEBuu6ICv9OjpeBuY4D1VeoKseW08sxEM88KQoFteTy
         5bxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783502291; x=1784107091;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PuwDkPB4+DP3Frg5ZiBjH6BGS1KGyNIF8NXdWFT9eoo=;
        b=fV4BLjTjpZt7xQlaAw1lSs7S8GO/5IpLyR42CCu99gRs9IBjRxKHObf+4oFWzotNEG
         OcF+4K9FpseiLQWKHgeiRHemKgODaECJe1PPzkfzTyhdYrmZMglh4GCdaXYiB9M52ysN
         UE4Xttk7vLlh2NK/SNaUBfZ3Co+ji7b2taLp/SF4aIOht2y9u3ibVgr16h1419dZRIwG
         MJ3aExjIbffCzr5rqeWuVxy1CrNBZR9eEiG2n9fvcY2JckHZyYs223i1sofJ/rCewltd
         WFxNVcxDLoCpXYyF64Mj4VwPNE5loWDe8RVrRrscKx1axJdm7FMxcCT+WtH2Xo1caJTW
         wLdw==
X-Forwarded-Encrypted: i=1; AHgh+RqzdHaLhPrgHKCokAR7efAuRRz/+kSXy3PtaCHj5Q18FNE7j6IOvrLLLkw1/V5QKHRse6SlrA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzsNgBOHfElyX8LxOl32O+F7Z3+ePdmbDbbggUt6R1M36cwtnaq
	G/hHj02CkzphuaB5kn4OVnXxsUX8W9WvqcunZJLVo3f6SUr7q8ujqmjJDsnpYVlzxsEF+OEXgIz
	/geWbFzHnGrfmMI1u/xW9aNNtuXU7hZs=
X-Gm-Gg: AfdE7ckxJaqQWaB+/26LoO6RIH+3Vi423AWu43a3aMhtP7wYwlNJ70Fzp6zbrTC5gdX
	SeSizLDU578WUgOtV179mUxWYNVVIHl3D0ov6LuXTh6nI6/zw66fzvnAc2jV98XIjwebT6o83Sw
	hJI6onEK4W4ke9ecD01CNZZQZGmLB4OfH+RVLDUj/rOz+EemBE+akpgy3JrX9FOioHHK+19HdUl
	Vuj57gZRHpeykgmTgeoBFhP26OmJ81oKqJfDNumgkEDGAoaj8TWVGfszDyEJZYJdmTkO/QDjmBK
	RwLBw+0o7OFnl5ShOuIPvyJtmd8NqablvR5BDA==
X-Received: by 2002:a17:90b:35c4:b0:387:e0bb:5804 with SMTP id
 98e67ed59e1d1-3894278dc04mr1516861a91.43.1783502291528; Wed, 08 Jul 2026
 02:18:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260707051006.20058-1-phucduc.bui@gmail.com> <20260707051006.20058-25-phucduc.bui@gmail.com>
 <ak4PLbAQqYrTYk6r@opensource.cirrus.com>
In-Reply-To: <ak4PLbAQqYrTYk6r@opensource.cirrus.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 8 Jul 2026 16:18:00 +0700
X-Gm-Features: AVVi8CeZIxoV1cGqNdJwk9FtpcwwUCuvjDdVhAa2LOP5pB8VlRjSPupFY0VCbos
Message-ID: <CAABR9nEz9Fa64u3zv+82YTNgToi38n8eQ0aT3NMRrpyBQMAqLw@mail.gmail.com>
Subject: Re: [PATCH v3 24/24] ASoC: codecs: cs2072x: Use guard() for mutex locks
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, David Rhodes <david.rhodes@cirrus.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
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
	Cezary Rojewski <cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Charles,

Thanks for catching that.

>
> Apologies for just spotting this but the subject line is wrong,
> it says cs2072x not cx2072.
>

Since this is only a typo in the subject line,
should I resend just this patch, or would you prefer that I resend the
whole series?

Best regards,
Phuc
