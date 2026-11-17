Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910197;
	b=C0a0PopJYEZBElHYXo9qsIhF278vCBEGeCCF7D/7RLAQtLn4v/fDkiZpu0qRKFtPvawl
	 DIjAT7MlbI7Dq9pu7+ocN7am+iAYzS9wHacsMYkfF1DKvCc3oWQPCZiJpiQd6WND5Ycfb
	 hUBaDG1R/IxFHb0b8Ju+LfoPnHo5JfrcwBXsI3H7qxPBmwX/OW7ENluAidiowMwXicz39
	 n7xnmFsaBCraE8SGHliB8oWERtviZobePwnNh4KEhIpkeAXvtJKCBwqkWkmSmjuUQY3sA
	 GnvR1mGwHucJR2TxBtZjBa8S0zv42m+mi4ELUoWjhu8C/IfAPgYocCP49oFt/0Q/juw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910197;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Zijtj8oRnUhmq8nJwvW4RuvRSCE2yvzPezhEDKGNnBs=;
	b=mhqiJWeKd3bwvyLbuQGcvKhdwHuACiqkbM1YxuGcnGFSwQtccFg0zqHdxPm59HwjQo7D
	 fKetDPKub5kRwc6OtFQ4Awmht1s9z0TT+5GgYFnGG4NBhQ2Zv4y1NVCxVu017P/Hvoeuz
	 ePY88WNOP1sNUrRLj1gIp0YZgiPz16p3Zici2tNX2OwwwiAMMKJYBRvFDx/ijEnBCO3HB
	 A5Hg5WbmRyGd1hGnotWknBcZ6u99dv4/Lhm/izNbJSp0zwLiskmjwDydE8u6iiwKXPWYU
	 PO8wuqp9t43fCoPitwc0tNViodOZMgd/u40Bf94M6Vltb848WAnwntGHn3Hgl5dk45w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZryeUptg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E79D606A31C
	for <asahi@lists.linux.dev>; Tue, 17 Nov 2026 10:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZryeUptg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B0D31F000C4
	for <asahi@lists.linux.dev>; Tue, 17 Nov 2026 10:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794910197;
	bh=Zijtj8oRnUhmq8nJwvW4RuvRSCE2yvzPezhEDKGNnBs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZryeUptgE+CTRECXG6PaFFIo2ynUQLFGJoEd6SIe0bh6T+R/8Ylgar/c7UC7XvKKC
	 RboUXutefAjs9UYoNbZHAKOaTW5RdZ5zVYtKi0OfrOVqV6O15XplMzPAJsgewCr4HB
	 jYy1L7eKdJ6jhTQiiqJPM67KFcuQlnIrmZewUg0LJp8wECWmle0XH2HTiWC1acvEg3
	 MYnT4y7Fn62BBVq1IiXmI2aahHYNKiTgJnPAsemi0K9G8QGaSJp9BMSiJVdz3A2V/W
	 vjdvoLdHPWv0dWGgHsG+gw8ftu2pno184/1QGkhwvlTsaCs/wqp6SdJ1kK2zoj/VIm
	 ggZq9GRKBJJsA==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ae1fd4252fso42307881fa.0
        for <asahi@lists.linux.dev>; Tue, 17 Nov 2026 02:09:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE68XTaYkrhdqtxqTZ2OrqCw/YG5DeG8ZTBStXiMcrRZvihwAbGEnHUiiyt0eHtDYK5j4yF1w==@lists.linux.dev
X-Gm-Message-State: APuU4Z+aT2iEkIwSPxpGvJ7C73d3zi1NyGgHQlpxqWXzk+HH9gYNyUH+
	eURmedQ+ogwW8Q0AT+6x0vu87eHXOnWYdoCcfguVPsdQWlF5qVLCdXebd27PoAns3Kn3UW2P5ML
	Lm9n3z2efjk3/ynr3bHRJS3gsK8rPIR8=
X-Received: by 2002:a05:6512:3e10:b0:5c0:91e:a95b with SMTP id
 2adb3069b0e04-5c17077e429mr4781706e87.14.1794910195950; Tue, 17 Nov 2026
 02:09:55 -0800 (PST)
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261106-apple-m5-initial-devicetrees-v3-0-cee55de54b2f@cyberchaos.dev>
 <20261106-apple-m5-initial-devicetrees-v3-9-cee55de54b2f@cyberchaos.dev>
In-Reply-To: <20261106-apple-m5-initial-devicetrees-v3-9-cee55de54b2f@cyberchaos.dev>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 11:09:42 +0100
X-Gmail-Original-Message-ID: <CAD++jLmvsXAZwb2ak4vumXqZTPgGNqm=fdgWEgw7VqqzvU83WQ@mail.gmail.com>
X-Gm-Features: Aa3M54oq4YzlnIadSqNmPikBx7uA231ihP8lcXU-Pc_buuhnmKKyHs_C06WfytM
Message-ID: <CAD++jLmvsXAZwb2ak4vumXqZTPgGNqm=fdgWEgw7VqqzvU83WQ@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] arm64: dts: apple: Add minimal t8142 (M5) device trees
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Hector Martin <marcan@marcan.st>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Sasha Finkelstein <k@chaosmail.tech>, Mark Kettenis <kettenis@openbsd.org>, 
	Andi Shyti <andi.shyti@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 10:24=E2=80=AFPM Yureka Lilian <yureka@cyberchaos.de=
v> wrote:

> Added device trees for the following devices:
> - apple,j704 - MacBook Pro (14-inch, M5, 2026)
> - apple,j813 - MacBook Air (13-inch, M5, 2026)
> - apple,j815 - MacBook Air (15-inch, M5, 2026)
>
> The device trees have a minimal set of devices limited to CPU cores,
> interrupt controller, watchdog, serial, pin controllers, i2c and
> framebuffer.
>
> Boot-tested on j704 with macOS 26.6 iBoot/firmware and the latest m1n1.
>
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>

Looks good!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
