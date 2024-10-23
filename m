Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C571448DF
	for <asahi@lists.linux.dev>; Wed, 23 Oct 2024 09:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729674326; cv=none; b=Dc7Xr6TuKY7h16jA/3OSgj9fH0ZY38qTUXpgL08n6EK4BIX1TuEzl66NMPyedFFPSovuSD81a5xN6EhqUY3p7HGXMZ+LgTC152sU+ZoLI3n+W+kaGcsTBAqreze0okVAHZ0qdWcVNKdNvs52d6N0YBwe7A5W4Ko1Na6B3Lfyo5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729674326; c=relaxed/simple;
	bh=X36zWetOyTJAz93vBOWJ+rocrYfNGhJ7Z73gXa68vyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=di6qqPZ8tNdr4uJ6LVJviaQz0AMAX4jnCJxld5qbiBdH6RzRe4DQANc6m8Yt0qhWGsyP/Vlry/UIUiJZfwrhwHBa8RrMtTDpA0yP0mMHBQp2ey6KTIlXstcgvSIWAkcHQrfu859Q/mBx/zayzqGMqw+awNLBHedxe/PWT8ej8pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hoAIChf3; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hoAIChf3"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539f6e1f756so7634213e87.0
        for <asahi@lists.linux.dev>; Wed, 23 Oct 2024 02:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729674323; x=1730279123; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X36zWetOyTJAz93vBOWJ+rocrYfNGhJ7Z73gXa68vyg=;
        b=hoAIChf3jJ4ywQX4Dhowi5Grw+BgSsWazflh0dX0cLoDBB+nE+NchColsb0weGICMq
         wLQDJN+KAO/axpAgbXWmn0bSm3JufOhfZx910so1J3JxP52xbuBRqhoEfi/9mo/GgNx1
         8UGPaJN8ydE4F7dlVdcGstZ/EfTXB2D7kady2+DEt2WGSwWxPgCPukhM0fYldt9yRANz
         00fSETa5UgdkCgdTiqDAv8B0zA0IYzvEWnrQT0Ob3s0xgMwJnLl5NGC5a1pLevpn2L8J
         MpHj07kL17DcJJSTVtOdkz4iXppaMihkWkfUZLAUGEhmd/JaP5IcF8gH04Nsx8jQ9k0N
         kYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729674323; x=1730279123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X36zWetOyTJAz93vBOWJ+rocrYfNGhJ7Z73gXa68vyg=;
        b=ahkYJ9wCNJqyPXGR0NIBX47cvA8Q6iaRrLNE5OfeZi2LLvVAVLOwrh3JyJJp01WHLe
         tOSnAOx+CRdSRRIHfhEByWkBZ8aDqRKLbJ/Isc2W8CKT0SCb+91nNIiQSPLi5Dr77ICJ
         5ryCxarklkK//wPWHvTzESgIfkAeS1Fiw3VFhX+4D2xbVW/WlRBdU7Br+hbAKE+hGrPw
         BAX4hnuwA/BrhawKkY4KRbub1sEHofHLfkbY/u9zImLr8K+XBqm7k98rI9D4FZ0NxZnL
         bI0Kj2EQiKOUZegnDtIgsVHmx8oMTzAj/6XToK2q8Mec2pA7G8O3ccmnBstOLOb1bDOm
         nFuw==
X-Forwarded-Encrypted: i=1; AJvYcCXLQBE35PmUit5bK0K5Q4my972vzPpeCvc6SXefVVRht2OQa2xtTevciJ8NkIws8MXDijyjcg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxLF8Dn+i3hrBJyuIP4TuoBsLtq1K3eSlB1ZQHKGvDpq5lD4By4
	kjHKNYW0WL8FeHM4xP6N4TEhHUUVxS7nKwvvsQbtmtURlzuVTvwjHBpCDRc4sEIGIq636HZCmZ0
	kgUNaSaQT45TdY2sYZwB22zAKZdC240ZUFjf//w==
X-Google-Smtp-Source: AGHT+IH1+v9bDoKekaMKgbzEkbrdYTS5dXGjA0/CBdqgcdFe8CjG21FHGf37DjwlkgqMpl892dYOQgZjGQaLo7ZGFiE=
X-Received: by 2002:a05:6512:3e0a:b0:539:f37f:bed9 with SMTP id
 2adb3069b0e04-53b1a2f42ffmr857364e87.8.1729674322600; Wed, 23 Oct 2024
 02:05:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241023044423.18294-1-towinchenmi@gmail.com>
In-Reply-To: <20241023044423.18294-1-towinchenmi@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Oct 2024 11:05:10 +0200
Message-ID: <CACRpkdZP9oDd+fRKKagFtGbfLx=Rk5LJ7bvaKimw5-t25XZAfQ@mail.gmail.com>
Subject: Re: [PATCH v6 RESEND 00/20] Initial device trees for A7-A11 based
 Apple devices
To: Nick Chan <towinchenmi@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 6:44=E2=80=AFAM Nick Chan <towinchenmi@gmail.com> w=
rote:

> This series adds device trees for all A7-A11 SoC based iPhones, iPads,
> iPod touches and Apple TVs.

This is a good and important series. FWIW:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Are patches not getting applied since you resend them?

Yours,
Linus Walleij
