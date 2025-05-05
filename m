Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7021A5BAE
	for <asahi@lists.linux.dev>; Mon,  5 May 2025 09:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746435956; cv=none; b=CTjL3nt9/2TShsTCHW8z6p9DZ2PMHgMagFCu6lzPz/ayQHqmd/kNo/2aAqtdJpjh+k6WiacHEKiUL/uiZhQdVe2Et2AxEypYyuIsZMEjQmXQ4/eR6XxDv2VGJJU0qt7noQK1/wNmphavIG6hnDCgPg3L9JOvMkbzchJPzKBRFF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746435956; c=relaxed/simple;
	bh=jaVB3sx5ejThu8wEUg5nUqvMM3/yIkqZP4MpKH/Gvus=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DbUlOTYwiZLxm/PtVHz94KglojVfZeXxVjHCB83WTsdaW8zt6JsdJf9j75Ul3Xz2QjaOHkTjgWikiu/i08rRPKWmqi3I3kBAOavhsMzH5gbFeCkgmjFXdL+/EAL/cuWpVYu7wMDrncsVK2cpLADbZAJymCO/vfdUnuiG+PvdjPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A9rdbOyv; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A9rdbOyv"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5499659e669so4881140e87.3
        for <asahi@lists.linux.dev>; Mon, 05 May 2025 02:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746435951; x=1747040751; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jaVB3sx5ejThu8wEUg5nUqvMM3/yIkqZP4MpKH/Gvus=;
        b=A9rdbOyvRw5xUIZGhRShw2KBaHmcdTou9AJCjxUnRTNaOwFe+AVvttVY6JZV7qJeYe
         AM8VQHu4/d18HoDZJ7dvilosCRqXqXxHRqcNCa/+4C6XA20g/KHif/rwSEgF5f6gmzqx
         2KaMyoAGsDvnKdsn9w7rg8C94L8up+CjMaQVd0Qz77P3gS25kz0qYJMhsjYWvIkwmzXh
         +hPnXpXNy9BjtFY2YQ+LMJM4UI9XuvFLKnGIQi+uBACCC3PGm4PHfHWqbgjnVIUzw1MT
         7IhJv289/FYjLAp4r0td9u9v0u4PmHD47/4a2o9KksaRw4M+02HpcFUQcmWS6UmS8OVS
         i1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746435951; x=1747040751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jaVB3sx5ejThu8wEUg5nUqvMM3/yIkqZP4MpKH/Gvus=;
        b=FEs2Lcen4uls/VwvnNVJUgBiNejHPr7aFn33hWCxP1newXxmXmBIIs7ukFG7EiueMF
         7bkv9XdjmczgTEeyD7vwj4tgO6dg8MlcRfaGlYfOzUl4qym4Ls4AVZ9hr50G1Wr4NL9E
         KOAu4JwsgyG47hfflil4YUFDn9euA4bNay5vc3qmX3rVws0Pj6D8I/YRd/sXHRN3MJ0n
         iWg2waKzLZby4Si9kuiAHTa40PaEq5fgZXHPGZs/fk6vK7so5RBgc4+sQovHOKJyL3Hq
         oE8ngIdpMbmVO9xcI7vSz1IMGctqh2hBnAzl01rfHTdErsN7dwa7INuVGNbiZFWAbIeA
         5JMw==
X-Forwarded-Encrypted: i=1; AJvYcCUCeT8vgB84rq8rlKlnHMdNjOI/BuBarF6M2ErkTcpefJlnNcs6jriv4VqhcwfRpDGyhulqew==@lists.linux.dev
X-Gm-Message-State: AOJu0YxigV4Huaz3ARns65e0+0foIXSNHj2Ey+3NPjJrebyVQ0d/Ltkn
	iYMofQgSnbUphLOxRN1uoW/765UWAo9KYrEItzU2iM0I1p7p0DYajO8zoBHD17guKh6m/fZcBeg
	gXA5e8gzEqLlp3LWwfwgP4eG5hEZrNQbfTHca0Q==
X-Gm-Gg: ASbGncv9udQ0GxWraDNj9oenjaiVuPgeZA07DUBXJNHl4Hs7oTHKn4xprBNfQJQETyc
	OisfvuRObXDcLpTVoqVXWuI9URfTUmhxtTfznkHIpbNimlyGJrozUgGkdZ0/cFp5gQZiE69dXNS
	piEtgVSPmGNDpu9RXVdloH3A==
X-Google-Smtp-Source: AGHT+IG1Gg4cqaY2027Xkt9vszcojc1RUUWP69uzjNjCzPb0+lNxfxbfad5R/RgzScrc0f+PobFDAQA8A6a3BcrID1g=
X-Received: by 2002:a05:6512:118d:b0:54a:f76a:6f83 with SMTP id
 2adb3069b0e04-54eac200d31mr3042013e87.13.1746435951218; Mon, 05 May 2025
 02:05:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250503-smc-6-15-v4-0-500b9b6546fc@svenpeter.dev> <20250503-smc-6-15-v4-1-500b9b6546fc@svenpeter.dev>
In-Reply-To: <20250503-smc-6-15-v4-1-500b9b6546fc@svenpeter.dev>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 May 2025 11:05:40 +0200
X-Gm-Features: ATxdqUG40K92Q6cLhA-jiK9adWrE64up9leFqXIiQtBvPLIG9_nqRk1Z9BFEJZw
Message-ID: <CACRpkdbCfUEZd06yeZTNecGFPwBgJkpMH3hqkvJw4J+iSENG=Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] dt-bindings: gpio: Add Apple Mac SMC GPIO block
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 3, 2025 at 12:07=E2=80=AFPM Sven Peter via B4 Relay
<devnull+sven.svenpeter.dev@kernel.org> wrote:

> From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
>
> Add the DT binding for the Apple Mac System Management Controller GPIOs.
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Sven Peter <sven@svenpeter.dev>

LGTM
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
