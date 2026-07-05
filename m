Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0C61AAE28
	for <asahi@lists.linux.dev>; Sun,  5 Jul 2026 02:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783217142; cv=none; b=rfAz84WyHnVnGVaJx/ss6auOEagVm9MRkAjRDUqg3eUqKHIG+iKA/6rAUnigtCGTn9FVJVzNLFRidR5OQdkV9KnKizquNqFZEEHjx5i3Iylfd7vUYrXoKEW23W5Jt+xUZnT9qm3x9wlnBFwDVDG6hujSJdC8CrlrvGC7rowbdEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783217142; c=relaxed/simple;
	bh=so+yhVCvvaIqqGt6b6i9YWmP4WE6FyTqPwNSmqlViWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=txkiBoZWweMIX+xbBBS2uJsveWn203Kt+gWaiU6aqYM7NoHAurAKmj4D0SG8pF1vL5p5iFadNGo/ZaYYJF98jJ9D8SmWZaYe7p7/zsIFhogZR28kebCEKaC/BCfA2XsoCeI8EuvNypV4lioqTvDxvxrz/Qq9tCKqTXJLSvD4+Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k7kBm2if; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k7kBm2if"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c9e7391839cso1698381a12.0
        for <asahi@lists.linux.dev>; Sat, 04 Jul 2026 19:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783217140; x=1783821940; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HKocKtEz1RsMH+lMlj2oc8msPllSiCeLmatH4dj48Vo=;
        b=k7kBm2ifb/p0wpaNfZY1Ykh+jd6/N/mI0Bl1xmZxVNB3lfbENg8zlWkjt/SA/IfKUF
         wAZH9yG4KlyRuEAc/Mq3fMRi6yuLwdv9MsuHTDaWwUJvkw/wK5iz+1mcxFqsVq9QtTiV
         uiLZ7rK6OoH8kveFnLNpXPHMfQCGtyJa16/WCM97bwwSc37U7GqbsCXnahxicK2l32kQ
         7XNCEDzYARGN6W0bjD+sRMPt06GtMap/YYfe2WlRxWSx/xC36IFZnigL0Dfw1/BK3lgv
         /ZaRjiihCzgV+x2uBzey2NmdS8l3Qq+KPYYOz8A++/JBAbTBGyTO05Le7/Jcm4jfRGIH
         YEYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783217140; x=1783821940;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HKocKtEz1RsMH+lMlj2oc8msPllSiCeLmatH4dj48Vo=;
        b=eEwF2uJsZHmFSE74IyAf9UrQ6EsvYVExhc4Rn1Pt2bE6kjUToIJA6Q6mYukD/glWhu
         IUTFE5piyOLZ1KuBUuZ//JsI/xGBs6hmuie0/cEZKkrU92ExAUI4eypykTueF3/Lix3A
         B7UwNZc9cCYATc/C8JgplQvNLiyLduNzczvW66nmwe0hZN5Zsz+9CFyEI2JebrGv1BNw
         wBUqieVu2cmu0jSP7hcz+4DNG47VbFAA0jGKGmod8EaefSugjh1F+MkqM2HUjakKYWi+
         VOQOG63M1d8pEOX2RfGQkShvSn7KutP6amDHP1+57HwoYOU5KXSBlZ/vmFe31Mu+7Krf
         wuFw==
X-Gm-Message-State: AOJu0YzhQmQKuJsppbaNzwcN2u90npxWVfYRr5+B3620j0piCKmif9BW
	h5spUxnjqWcJ2ws1fXefFO7VAV6sejUgbDYD9Hz1RqtV4S7xpARE5Oxf
X-Gm-Gg: AfdE7clskrCZjJmx4Sl/b4XR7pmy2noEWAlMl0n2a4aIlbb152DL500Ku9K3GAYi8CA
	8FUwnN5LPNQ4qoy8jnvG1FH04TPflCBf5jcwmOfBtMjjC5w88u2LVK5kiFUL2W9dbBNElTC1HZr
	vNs/PFxDxkwhfqyrYellxJZyTwCz12mZ5WqQx+78f6HcuQJ0vPk54+79EX06wL65E3FIr3eBaTt
	PFT7HKH+f68uEpCLv03ijj/7vKiCZVjURO7UH9J973d9gtaUYf7u9sC3fAu2TD6aKiIwKMkcG2I
	upWoKlleJoZnGPPHoBQ+qhRbDUvXD2zcwMBAbpxfsTcxHHeTxAbrQ7xLr7oUOQq/A4DzSHM8RrK
	+oe4W9+HaJPnCkM95OiwNXOxNN9ClI37Z0zf7sFot0Vg8ocGZUl09DYvBtbZ6yKWnx06eLcuejT
	sDnBAD59AgEdH4tAAdi0wiq0dIgrXGjpgWlve/ZUwRk9YP5wliczQyM8SUSq5BP/EcnWiwfYheK
	HC+zGdtUKTNnqNz+2olFjGDnmBzhJcPz2t5YIpGmnR93OaFukpBzeOnP1rRuMhYieacLP/g1CYx
	/6k6
X-Received: by 2002:a17:90b:3808:b0:37f:9ce1:cda4 with SMTP id 98e67ed59e1d1-3829f2f3fafmr4872588a91.26.1783217140598;
        Sat, 04 Jul 2026 19:05:40 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f3a9341e0sm27946996eec.12.2026.07.04.19.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 19:05:40 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Joshua Peisach <jpeisach@ubuntu.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 4/7] ASoC: apple: mca: Support FEs being clock consumers
Date: Sun, 05 Jul 2026 12:05:33 +1000
Message-ID: <sCELYiNQSvCxqjQFP0uhkQ@gmail.com>
In-Reply-To: <DJLKAJ8IU0Z5.EU158RDQ31H0@ubuntu.com>
References:
 <20260628-apple-audio-redux-v2-0-6328269c9652@gmail.com>
 <20260628-apple-audio-redux-v2-4-6328269c9652@gmail.com>
 <DJLKAJ8IU0Z5.EU158RDQ31H0@ubuntu.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Josh,

On Monday, 29 June 2026 11:19:27=E2=80=AFpm Australian Eastern Standard Tim=
e Joshua=20
Peisach wrote:
> On Sun Jun 28, 2026 at 7:42 AM EDT, James Calligeros wrote:
> > +		writel_relaxed(port + 6 + 1,
> > +			       cl->base + REG_SYNCGEN_MCLK_SEL);
>=20
> Where does the "6 + 1" come from, and should it have its own #define?

This actually only ever gets set to 0b111 (port =3D 0), and trying to set
it to anything else breaks the machines which consume VISENSE data from
the connected codecs. I will just replace this with a static value for
v3, which seems to work on all the machines we currently support downstream.

> -Josh

James



