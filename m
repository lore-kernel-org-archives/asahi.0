Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E1B40B0FD
	for <asahi@lists.linux.dev>; Fri, 14 Aug 2026 07:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692247; cv=none; b=DXUxL0sKoXdMHryqMG4WFXxnmU+FYuNOcc2birFrF0jU29+BDq9qls1oP2/WiQwtT3dHhIeo1EsIgjx4fmB8vkeZCAjuu92MdoYIC01cF6W6y+z2PtkU4dJliKqflYgsw6vkCimhpSr707lP/bM/VOj+mFuqzlSL5+H7Ux3jveE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692247; c=relaxed/simple;
	bh=BKN9f9mba5XMlPWTAXN8CweS/tPQvXMpBOs+FJWbbU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N2ym7tCQOUijMPqxOiPWA6BN2Qg3EPXxBMOjfh5UJ4+NYqdhVzArgWa2ayf4ybMMVEoApPyixcWM9Om3jKkt1yXn1J6gEzsBt5Bj2q7aM1LOr4VCMnJCl0m7TiupJXy2RU3JnyhSbVC+lQsvlUYwAx4wwKdCzciBx1s+UUG7cK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iEKqK7FX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iEKqK7FX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23EA61F01561
	for <asahi@lists.linux.dev>; Fri, 14 Aug 2026 07:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786692245;
	bh=BKN9f9mba5XMlPWTAXN8CweS/tPQvXMpBOs+FJWbbU8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iEKqK7FXDAkSNHtkYLTRt3Y4M/r5fWbebShTWtHq/CtTIKjZgSsJlURV1lQXBsUMS
	 8HAaBv/qmXqU3qI0Wonv25AVNbnZAsqq3msF1/iXCkw8IKEX0sAOHmEyYgh/JUwAKl
	 S1TL61mljZPaBTtO8QbEpjyz9OlYukat2h+lQMB55Ol90JBDkiA7qvbcW8BtyC5Lg+
	 jEgOpgobtR9EwZtP+MJwLs5r8RSd8JPuZRnpcp4wgqWo3VSYH9ZSxlc6QudcCS5tUb
	 ImAo7qG5qhuMkHHevXOr9raKXy4jOYioQiqSTYvHBtGwSfdo81v86jJ8DXevjtrAiB
	 bf7wuJB5xncOQ==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aeb8c19017so895066e87.0
        for <asahi@lists.linux.dev>; Fri, 14 Aug 2026 00:24:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoNfkaKoYahNgBmp1zCQ7i58+z/WwOmUZZU4mWz6rYUGFdBKOTGrymOng3tYRRGJaTYWV+IdQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8Kk/Cjiz9lKSetWz986WhXFhDfwTWHY1Q7EI6wJUzS3Pb0F8n
	1O/b1cx77GYPhwnc2Ra9nNCfzzIlPRgiGCVX0JQ16ey7GQf1w4+6An5FUMmSLWsyFlQxtx0TYmH
	Y3W9dIwWO32Ljm9gQT+AOyW9ZWtFfpIQ=
X-Received: by 2002:a05:6512:b93:b0:5b2:d7f2:90af with SMTP id
 2adb3069b0e04-5b4591417a0mr459623e87.37.1786692243871; Fri, 14 Aug 2026
 00:24:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260811-apple-m4-initial-devicetrees-v3-0-6bf32d45ad0b@cyberchaos.dev>
 <20260811-apple-m4-initial-devicetrees-v3-1-6bf32d45ad0b@cyberchaos.dev>
In-Reply-To: <20260811-apple-m4-initial-devicetrees-v3-1-6bf32d45ad0b@cyberchaos.dev>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 14 Aug 2026 09:23:50 +0200
X-Gmail-Original-Message-ID: <CAD++jLkf=Ko-S-iPOt7toDRBb0HAEiAZMKXOTkD2sBdt31JWbA@mail.gmail.com>
X-Gm-Features: AcwNN1WiSU-hYtd-LW1Xs-Nm42vxr7uIUwiaDPkA7srTL7iPWg9d8CwHinkdzg4
Message-ID: <CAD++jLkf=Ko-S-iPOt7toDRBb0HAEiAZMKXOTkD2sBdt31JWbA@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] dt-bindings: arm: cpus: Add Apple M4 CPU core compatibles
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

> The core types of the M4 SoC no longer carry individual codenames.
> Apple's device trees re-use the 'everest' and 'sawtooth' codenames from
> the M3 generation for all later cores.
>
> Instead, we use a combination of the SoC's codename ('Donan') and the
> type of core ('e' and 'p' for the efficiency and performance cores
> respectively) as compatible for these cores.
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
