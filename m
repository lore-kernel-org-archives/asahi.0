Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A019A53445E
	for <asahi@lists.linux.dev>; Thu,  1 Oct 2026 21:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790889234; cv=none; b=CIBduHxT94XVUz+8wGln8yvNwa+NpR/Qsa+uzC0gZhY7YEX7fxcrV7RVLnlRa52rGrbNintWrBCKw1GHKPsCczpJe4pLn7ZJVqsSN9Eutaxp4RUtPBfDqPBevB/Yk8vAMxUQju9/RT0iR3UUJb3Md8WR+hT9pLyUnokM2I+sfqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790889234; c=relaxed/simple;
	bh=XyDDvvco+d3mYshhwaSSq4pDGDpCB4IF/PEVe4NawGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CCsqKEGId8Hzg8iDZW7r+6a83+UmQL8754/dCM77T9MI/bXI4BEZL8ywAB6K3VtWPTS2v18+7QrvDk+6dT+gKN4El41JWLQzpzmcKe+PEC/L3+/h4as1Jbaw19hNI27fOshlEE6RAGzUlet4opWV+V+43+n/IfcDyArCNz3Gn/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VJmeh5ks; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VJmeh5ks"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7565F1F0089A
	for <asahi@lists.linux.dev>; Thu,  1 Oct 2026 21:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790889233;
	bh=XyDDvvco+d3mYshhwaSSq4pDGDpCB4IF/PEVe4NawGo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VJmeh5ksyazvF5b+uHiFuo+Fkk6I2oEkomFcTpQ21cV7s7Ezpvo2WgVusFoCZgkcq
	 0zMsaKO6LO+hSz4EJ60U7PJejykfqbW755h946vLBB6L1w5baFM7MtYHfbgXR7s7Ic
	 DsNON4VsPVifglKVHnHekmWa1Hm32i3mwLRJlEo78moodMhXS9K15e8KCLX2R2eaL5
	 jWWTgRAFbdVHjAHmKmJTCU1aazlhC3iWjD8Ovh+PKsZrpknhpTuTwmQ2Z32CUkGIz4
	 26chOz/4enh/ta858jhMXP5Fok4BYwf53CDVQErWoh0nbDdETeMLinDeFNGQMOQnmo
	 XDskNRObVbmtw==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a776fd3b88so17268791fa.3
        for <asahi@lists.linux.dev>; Thu, 01 Oct 2026 14:13:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzyDfA5wVu0eySKej8ve/VrMJwNnOavMUCTo6USmLlsu0PR+76oibthjovOw6wLZ7GMjgEbsQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYKCHOk0o9CRPcAY7F4XUhgZoeeqGKGWBEY0uokiKuaqHkPk37tD
	uz12OobKSA43eSW6pLoLpvvjpSbukevSYEpbMBg73MJIuo+kPz/a12lNNLeS2GgD8rHVvGoRkYH
	zxid7zhtqBcLiJg+ZXRI7gWkOMiCoBLo=
X-Received: by 2002:a05:651c:210e:b0:3a6:32a5:efa0 with SMTP id
 38308e7fff4ca-3a8877c5ae7mr1272461fa.22.1790889232244; Thu, 01 Oct 2026
 14:13:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260926-apple-pinctrl-t8140-v2-0-620bd11cd2a1@cyberchaos.dev>
In-Reply-To: <20260926-apple-pinctrl-t8140-v2-0-620bd11cd2a1@cyberchaos.dev>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 23:13:39 +0200
X-Gmail-Original-Message-ID: <CAD++jLm1tFh073xxPx2WzidABvP_fRY0Bhf8DkO64W6VBQ8UYw@mail.gmail.com>
X-Gm-Features: AclHuK_bJIEK2xjDLFUNw_m3k1RB-KhI2mP3RWR1EocLD8uDhL9bs84JVwEtVgI
Message-ID: <CAD++jLm1tFh073xxPx2WzidABvP_fRY0Bhf8DkO64W6VBQ8UYw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pinctrl: apple: Add t8140-pinctrl support
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mark Kettenis <kettenis@openbsd.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2026 at 4:52=E2=80=AFPM Yureka Lilian <yureka@cyberchaos.de=
v> wrote:

> This patch series has fixes for probing the pinctrl_ap GPIO controller
> on the MacBook Neo. The previous code would crash in the regmap_init on
> this device, since reading the REG_GPIOx for certain pins causes an
> SError.
> To mitigate this, we adapt the gpio-reserved-ranges property to describe
> pins which are unusable and whose REG_GPIOx should not be accessed.
>
> Also add the new t8140 base compatible to the dt-bindings, signifying
> the different behavior of the t8140 pinctrl_ap device, and make the
> driver accept it since it now respects the gpio-reserved-ranges property.
>
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>

Patches applied!

Yours,
Linus Walleij
