Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88ACB37AA77
	for <asahi@lists.linux.dev>; Fri, 14 Aug 2026 07:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692219; cv=none; b=twiDqG2jrXs2oYSF2nBQncXdKbXvkd4xc+493PCD68rb3NtgzkS3u+Qf/NCG31ihDH/7H4bP39OW358bsHu7/PWAegoOUej6DQgqJEAQH9NnE3FJgR4PNWk6b2EdKr2u/G6qMVgPl2srg41lV6pIvkmpNlBqS+liibhk+slAAPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692219; c=relaxed/simple;
	bh=bAbqMVMN/BsTtzWBffV3qCZS+XOlVzSdX4AUrrnqi/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nDPPpc5Lp3vJcZn2WL+x7xmq155AUCQ5JpnQlkTFYgCOC8uuPU14r1CwEgnY5RwxXnlc79ymV+IX6DpXqm78AKYClPYO6sGGi31JIH2TgOs9Tiw3ECNQBe7JWimy3QuqK4p0kz812+oOxCCbEuxKtg4oYJZaaB0RquRvF4RqWns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KJy6V0pW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KJy6V0pW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B4CD1F0155A
	for <asahi@lists.linux.dev>; Fri, 14 Aug 2026 07:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786692217;
	bh=bAbqMVMN/BsTtzWBffV3qCZS+XOlVzSdX4AUrrnqi/s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KJy6V0pWt4inxzaONO5r/SYmxSvSNcUSz5kJsa1YRGstbc6oizBjSdp/D1AnpAQ42
	 kMMdV9hOzmNV4Xl9yJnCm1QEVUQviExUvJ7ldSOaj/jv2sDTSs2H4JIZAUz1eAFA8p
	 7BCAn46mLMOmw8y9y3Dc0/62xfR43xeDWmuOTIUR3q3mxMJLgRPfRFlDMm1DIzT61Q
	 a8TrOZaPIcoEhM91+5VBpz3zoteSb698T8RBYCoHYakvBXALz3NDZi8R70lbPFzods
	 94uH9IVRy0AvQGXGayMl2CYibCn5+7Kr/zRMeIDCCBsA0ibI9DLkYri76S0VFxNow1
	 uppzM0tr2vFcg==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39c908d6cb6so6793191fa.1
        for <asahi@lists.linux.dev>; Fri, 14 Aug 2026 00:23:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoN9WFnqaVB789T55ts2K9jywny6hNsw9gRp6QtQzG+xDxLD5avEARX8HTublZyA0m+z5vorA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwIK60AilDwFvBV0LXayqu+lj51+ALzbfckJ4eZT3Gfvwhkk0/4
	vXPMF9yj+a92SeMyh88ZFQFL/w3GqaHL1KRH57n8OFKyR0ZSAkH8QwEchCyIzOBRInIviOLQb1J
	8g8AmxTgHJokPHkKRMVtP97xvM16Ujp8=
X-Received: by 2002:a05:6512:3409:b0:5ae:b136:acdc with SMTP id
 2adb3069b0e04-5b45917eafamr436015e87.35.1786692216083; Fri, 14 Aug 2026
 00:23:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260811-apple-m4-initial-devicetrees-v3-0-6bf32d45ad0b@cyberchaos.dev>
 <20260811-apple-m4-initial-devicetrees-v3-2-6bf32d45ad0b@cyberchaos.dev>
In-Reply-To: <20260811-apple-m4-initial-devicetrees-v3-2-6bf32d45ad0b@cyberchaos.dev>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 14 Aug 2026 09:23:23 +0200
X-Gmail-Original-Message-ID: <CAD++jL=wF3CVQB=8PJUZBUDS1zaXkucBjUQ0Rw1P+jHk1f0T1g@mail.gmail.com>
X-Gm-Features: AcwNN1Vqt4-grpwuqjlFcEbTAF3ktUGE_yOp_pIgiwSf_3uQeKVFZ3BJgIoiEp0
Message-ID: <CAD++jL=wF3CVQB=8PJUZBUDS1zaXkucBjUQ0Rw1P+jHk1f0T1g@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] dt-bindings: interrupt-controller: apple,aic2: Add
 apple,t8132 compatible
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Hector Martin <marcan@marcan.st>, 
	Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Sasha Finkelstein <k@chaosmail.tech>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-pwm@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 9:37=E2=80=AFPM Yureka Lilian <yureka@cyberchaos.de=
v> wrote:

> The Apple t8132 (M4) SoC uses an AIC3 as interrupt controller, same as
> the M3 predecessor.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
