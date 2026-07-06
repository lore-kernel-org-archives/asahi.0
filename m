Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F92642E8DC
	for <asahi@lists.linux.dev>; Mon,  6 Jul 2026 12:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341437; cv=pass; b=uhxN67gn7hXCLeBBvBBNOhj8qxHugc9CyVtTrwhWE+WctdRI09p2LYSacc//DeRyS9w4tiL1rbRje12KlaIJMQAAn326v7NRgjjMzgdjXC4NgSU6/cLej4V5/17RBW6UQ4eF48+V1lHV1Q3Sq1m0YbObpmLHQ06sZDDah/AnIsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341437; c=relaxed/simple;
	bh=Fy1sg1FRdxZLE+BdNcUjVv9HercnjIEfJiH/fJ/eQx8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kshdvavck5p2VvUnm+byUzlsdjf98a4RuPURZM4uCUbnkjhy/XopRhbYim1U5ibL5jcaKLXVMZePlCu8S/FYNHTb1eQf9hz9cyu6xkIIJQwAbRenLj+n/Ukwyb83SieQ5UrAQEe7W81wL2cPmS5DKM3YYbDageJlCc6OKBNuvgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IhmV1mZ7; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IhmV1mZ7"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cab973140bso36462235ad.3
        for <asahi@lists.linux.dev>; Mon, 06 Jul 2026 05:37:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783341434; cv=none;
        d=google.com; s=arc-20260327;
        b=cB9KHm1H0RqImztWiw2y6yJmJh1XXQ0SkKKxY9q48F5hBgT//IphLS8K+vTVciWbFE
         LEHLrXHN35jdsyx7J1mPU0DwKE5kTF40s4brCr+h4wsWGYB2UJQ3scuHnUR1EJ7tt1Bp
         GoFyjxuNIXZlbcCmhBC/a1b4fNLMdoa6kBv1wIJJ8OryHST1O45c0nh2eZ0fzWUogBnl
         oJAUjOiO2qC8Nd15JXK9M1F8UHHf+FZGgM0SQRFWCVlPkfRb4y2QLUl2hcSnDjAOHoOB
         Fg+tc1kJGmJjpQLkVxYG5ikB5M9RcduXZYMRVCIonmu7XDvdEDBke3tZ+5EjxT+N7KIH
         9voA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Fy1sg1FRdxZLE+BdNcUjVv9HercnjIEfJiH/fJ/eQx8=;
        fh=Xy27ElKn7zCCS9OJhpdnMmKRFrhDVTgvp1CeLIBXT38=;
        b=ae1O/NyeOt7TgB6rXRSb/Z68RlbWaVBp9JJQhy52kx7GgL2maJ1CtwzNlAj/jCIfJl
         pv+ZBNIGdlZgmYZ2QD3guBkdz3lE5Q+vad/M+b3zfV2DUcmKJ1sn35XOdHnFNpJMa0RP
         o54AN9hYiALjIucMk1HBeJf484/x6JYt1FFgqzR1/CDx76m35HC5CQM/mNaNO+bano79
         NkXdAGh31XdKvYGROYMp8PwkLYr4mtxYzHW39ma3ejINUAIE9YqCT4iBlaIhcXEfGo0S
         hZ/OOO5bgGA+9/YNKIdJOeZ6Zz34BOGGDwlB+KwbBrN+5whcBIbmrX6LWra5COBuZwW9
         e84g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783341434; x=1783946234; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fy1sg1FRdxZLE+BdNcUjVv9HercnjIEfJiH/fJ/eQx8=;
        b=IhmV1mZ7PMW1PTDoO/oot8esRYTYn2G2Ze2Ifb9O3DGpm1eA/nD0uafM1Aex1j3BxP
         kaB5pF8/oY6DvndqCKwEaGrI+Em2OYQOlVT4j9dIrEYXVuKsb1doDDR248VD/4KCCxgy
         2Ooo+g1H0ECrSkup8CwSO2HcAHWj/kKTGdzpv5xZ9w79UD2/XkWFXRXBkisOiBN0LUtF
         /l94b80gsUxrkTPAnoR9+b3WDCEupxyeLe6hVi2RCfYl0HZy6vjXl4RVi+tmuVJ1htfD
         GA9R4AwFfimoAB7bmWPWiMTLsQ1pmHHU7zN3Z12NN6DbMxFiQTx236cFSZq0IlPTWLGh
         8Hvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341434; x=1783946234;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Fy1sg1FRdxZLE+BdNcUjVv9HercnjIEfJiH/fJ/eQx8=;
        b=JMoi6fNNHkvamh8XqAIX6+MPRliJt/Co70bEq3xvHidLh/6zN/h+E8aHM6AYqdPXGh
         D0XPd2kShw0zjAjcLhnTywL8ovT593CUukKGh1UVNNjtmnoRjKKwRZqCSlIukerqNWLe
         KbFa0o6+fD50IlCplPFVMbUjNhPqLqjWxHucjau8Ts3upLQOA4eLph6096xYtLTgWAxw
         53Xkumo/ghoFHs7O8947W5Q/NwpwXCxJDYGkOLipVJkvmTWLeAqTM2Bt+NJcM1tdzIFy
         ejoIgMBZbw/FkYAZoSjk+9o1asTKyRg7Bu7Wbg2OltTGe9JFpgBSemiareQx9efAgUv6
         xagg==
X-Forwarded-Encrypted: i=1; AHgh+Rqv2T9yKlAhA8vrz0oHlkhKRyOZem/922f4j2KYeiaUF+CCm04fNOolC7iMowzFBH3x33Cf6g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/mYFhxn7feFAnpR7SwvuMfTff9XjD09givObqybrDaQil1vaT
	oXoN4J9wkRJbZsf5Y2kYRhO4bJstDrXPt0cg0mx/yHCtVrBrBnGbwWz+5j25py6uaBbPvQiyf8u
	wbiIgjiGtAGhW/7eh7TRf1g+sA3uGgpY=
X-Gm-Gg: AfdE7cn2P8WvNZOXuGDHcynyVk+qLVTc7mSpQjWLpMYNY8CHtNDSqzgJrHdJ7Sm5Vb0
	xINHnyBxcEdSmeawmG9aGLkgbcgsti2LetmIYVTbiJdke9g41s8zOA+lFGLzshp2vjyESfndhcf
	bFbMg257lNXTd/EuRct+JKLWVtx+1o2oboyIaPVwcqbdrou96eTLIFS/B60+2YT5iFIJ16gQ1JT
	nKUG6P7x6Hv3W+pfywS1n4BeKH8AZ8IaC/jmdRk9nayvmkqRf5wqKtvbcGuxZ7DfO48aCer+cRi
	PggYEYSeddvIh43UJxt52dz90caIJM14XEUqwNA1/upUsu0A/S3WM1uHkmpt
X-Received: by 2002:a17:903:947:b0:2c9:b8e5:5741 with SMTP id
 d9443c01a7336-2ccbf07b545mr2322555ad.35.1783341434357; Mon, 06 Jul 2026
 05:37:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260703055355.244898-1-phucduc.bui@gmail.com>
 <20260703055355.244898-14-phucduc.bui@gmail.com> <934f9346-f530-4107-aac3-1cdd2829779c@intel.com>
 <CAABR9nGSRH3DmehUxQVmfJ4Po8TOhfHXDnjjkzVJDZZ1w0_51w@mail.gmail.com> <91335528-fe36-44c7-8e72-37bb0d4f2620@opensource.cirrus.com>
In-Reply-To: <91335528-fe36-44c7-8e72-37bb0d4f2620@opensource.cirrus.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 6 Jul 2026 19:37:03 +0700
X-Gm-Features: AVVi8CekunH_Av_DBeV6qAHzPUl7QVZFKXN1EOeDHNYBqX9OGye6fLchJawVKpY
Message-ID: <CAABR9nE8WN=HnYo0JYhQ-uOtW5SZ8fN-x3xG90dzMzYDrue8zw@mail.gmail.com>
Subject: Re: [PATCH v2 13/24] ASoC: codecs: cs35l56: Use guard() and PM
 runtime scope helpers
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Cheng-Yi Chiang <cychiang@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>, povik+lin@cutebit.org, 
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

Hi Richard,

>
> I mean the code is correct but it looks wrong. Because it tests for
> an error in rv but then returns a value in ret.
>
> This can be cleaned up now. ret isn't needed because it can return
> IRQ_NONE in all these places.
>

Got it, thanks for clarifying.

Best regards,
Phuc
