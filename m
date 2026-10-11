Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99FF2FE56F
	for <asahi@lists.linux.dev>; Sun, 11 Oct 2026 20:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791750256; cv=none; b=X/SJvEAVRxRHmpTIPJw46drMpqNv6/o1r9lizrkwooGL9hVjZWGuMLAhvBi00qsf0sP65GPqA65JPVUk4lYByg9FbnsIco4CKptcn2hYKOMNZ63aqx0yKmul55xzo15ar0HQ5V62GUiAq6zCkjxuaD85TuscBO24gVaBYYVdJFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791750256; c=relaxed/simple;
	bh=OsRD+F+OLtUmpRSHXSpv9UfMmwgcSUQb/xDcJZ0DHJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CDcVYuCI28+m7V42HBDz9hmvcEpyn7GaRoLxdqh4CzoznYhBc2UqdSgPI2TXrziOekDWk0bCKEUv46QwkL+biZb26uRrcMMqoq+Ro56iZO2E3QT4T+asLteZ9g3XnyH7LR96G1hxQ6cfXo04WVIdXW8dm1wB1t6f592q7OdkdkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bDwkVR+M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bDwkVR+M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FA071F008A1
	for <asahi@lists.linux.dev>; Sun, 11 Oct 2026 20:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791750254;
	bh=OsRD+F+OLtUmpRSHXSpv9UfMmwgcSUQb/xDcJZ0DHJo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bDwkVR+Mng9JjATCiFJWqiEpR38DGPgfTc3U+ctxg8/zcUPYe6TqXRRdyU3ye9pMq
	 7khAoC94ueck2dwdL60uK4E66jZOkU2aqI2OXJq7u1JJAqaw9VxhBAj0gY5spb92cW
	 +kZv5+LK8cA2iUxOwjmkOQc3O42BTz05jz5D9LL+Y5TLkTdBtzOt+1yx64SZqy9GHJ
	 d0k1ADaHIOl5pGP5HGXGaq7W+xMmorZG1E7eT9Ws81zMZExmRZp7PPjtYaLFGZKJu5
	 BC2NFnqcI9Jxzg+QNaCHVJ009FaM4bblt/P0TJik5hwb/wsdZio2QQe9VyaQGnikLr
	 f/VK0uEoxEFvA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bcdab9a82bso1449924e87.3
        for <asahi@lists.linux.dev>; Sun, 11 Oct 2026 13:24:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwlGMi8905ZBuMPCoKy4QojpexhKcCWQJj0X+xUVfbrVzhpHnYb17rWIxd+RyeSTIrdxBu3vQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYKg5wnw8dg++5ybKfzFdyHcRl93hHLThZoAbH5tQXv1ursV0wAN
	qyp0f83En28t4dy4fM3hcediXujE+eSRb111bfPwdbdh4KIUkkoFR6h8sgd7KlcDB2JBGUYiW0S
	PIVkh8eRuJhVgWn5rMIf39qap35rFhos=
X-Received: by 2002:a05:6512:118d:b0:5b8:bc5e:b570 with SMTP id
 2adb3069b0e04-5bcde8c13ffmr2228437e87.40.1791750253189; Sun, 11 Oct 2026
 13:24:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261010-apple-m4-pro-max-initial-devicetrees-v1-0-781fb3f2d9f6@cyberchaos.dev>
 <20261010-apple-m4-pro-max-initial-devicetrees-v1-7-781fb3f2d9f6@cyberchaos.dev>
In-Reply-To: <20261010-apple-m4-pro-max-initial-devicetrees-v1-7-781fb3f2d9f6@cyberchaos.dev>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 11 Oct 2026 22:23:58 +0200
X-Gmail-Original-Message-ID: <CAD++jLk+2iUkJfYQckV4G79JEErH77_mOqwGaZ6TyKGawmnFLw@mail.gmail.com>
X-Gm-Features: AclHuK9cHC-ny7H2OT1BGwCBFcKBYkyqMbq7PnfdAqUY1dh82EQN4ca3xsuP3Cs
Message-ID: <CAD++jLk+2iUkJfYQckV4G79JEErH77_mOqwGaZ6TyKGawmnFLw@mail.gmail.com>
Subject: Re: [PATCH 07/10] dt-bindings: pinctrl: apple,pinctrl: Add t6041 compatible
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Hector Martin <marcan@marcan.st>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Sasha Finkelstein <k@chaosmail.tech>, Mark Kettenis <kettenis@openbsd.org>, 
	Andi Shyti <andi.shyti@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 7:00=E2=80=AFPM Yureka Lilian <yureka@cyberchaos.de=
v> wrote:

> The pin controller on the Apple Silicon T604x (M4 Pro/Max) SoCs is
> compatible with t8103. Add "apple,t6041-pinctrl" as SoC specific
> compatible under "apple,t8103-pinctrl".

No Signed-off-by?

Yours,
Linus Walleij
