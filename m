Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5167F7F477
	for <asahi@lists.linux.dev>; Sat, 19 Jul 2025 15:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752940353; cv=none; b=DBb+GgbVRPOo/2eq6Y25r595Hca4v6hmaBhyq1rPARlKLGdOHFjMVW43yVOFv5i0JYHX8epJOSt6Fna7HaVj3C9PhW+3rC0aDvu5JJwe3LjbKLvrSCvdBCdf7NEkiwDVhSdGRqKoZWC8FiUbwf+FAvi2prp7wS2JOZvm5kZpL4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752940353; c=relaxed/simple;
	bh=u5bc8PEesDrnBIXOtuFP7+ZA4bNJkI3uyCmzQ6D87WI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EoR4Kv7kkNSHZA58/Cvu8Z28DcJRuR9sJalGtKPxNEkGE0W1jskVbQ1xmXdZVW/CsyuhK1KYc8HTmpRIS+I+0WOglmgoj2NDTPan+0bypLGx2RcsCp7s7AgdUrTk7jGfykI1M8owpEf3jABRga82+j5c3ZRaDH98AE14eMeb8Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GDmMFKyL; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GDmMFKyL"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32f1aaf0d60so30547201fa.1
        for <asahi@lists.linux.dev>; Sat, 19 Jul 2025 08:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752940350; x=1753545150; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5bc8PEesDrnBIXOtuFP7+ZA4bNJkI3uyCmzQ6D87WI=;
        b=GDmMFKyLp+l4WMwGnLPbBRPwydLpk/jwpSVYScjE22+otkjYMHQLB2DOEqn5TLhzWF
         oTmkSaQa29XNq9kgvL0UcyBi2caeL2j2VjgsY5PHFLQEq+RxJSIDB+0ayzQLhrvW78vh
         vSy8/11RAM0K4khr7B/wG0Mrcy5KwGCDD/omnjdeccAG6u61FRhZy4NFtABKqP4nABAc
         DtVQcsphwYR5FwvDssixZtnXvSAh3Q252ciEy1xQhxsWNkZwgmf5rYtxIWYPlozLZk/5
         vgv4K3Vj6SPzXMJxstVHqjBErcQOHwC2Eg5pH7gn82zNoL1UQJPk2d1LbYVXM/GQClMt
         g5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752940350; x=1753545150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u5bc8PEesDrnBIXOtuFP7+ZA4bNJkI3uyCmzQ6D87WI=;
        b=eqkHvWhpgxQHDKDrb+ItDBP7jNdX+qiCnijm69AaXQaqaGuaKWlror+FXwho78KH5F
         t8In/zBa7u8WrJgy1R4pYNqwzX9KiQoVj2KcYWnxaJwHCYiooJDKPbEs8qB7VQADwlZU
         fzntWZ/1SLTI9EyaDEFUQ1HXIK+jJG0U7eJIm//rV1SYRVwbG9AdjKKEyZojQrq4J040
         LBEjDRY9Kf+C82Uuezz/9UUHhpmORsevr/Wn3J95KBCQq7airecLlrUoCn6HLebytR7L
         baMXveHm8buDCLt6cNdPYP6FtgnuVSKcELlV8tGFGS5gBguKx9j8KSmcF63HSz8N/nIO
         Vehw==
X-Forwarded-Encrypted: i=1; AJvYcCUZ5M2fNQl0zyo+5zNDeBs8Y8ETFNYCqUcUKREXIVvgBFeQYHCdD92yllNF4RKYMfkNsXnfnw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzZ7chXjSnzcu2Rt4m6CjwONQVEZs6Ehg8lS6ufzQkaMsXTJjc0
	DKlolKbCdl2DilWAe4F1+WS6hTAJVFjhr2Nf0Q9yaxFsusj67PJxEGC7bBDQIFOaFX2tvjldPoH
	uJGld/E02BcmgAVejAuaOmEr89SgGPgHBkIXfoZZqfA==
X-Gm-Gg: ASbGncs/ZE9GdSO6NlOlNlX8xwD/sncG8n8QT/O//BZAHpJq5Y42gWeg7mx2f4AaWkf
	VtM8KgFkFY7ZbOXxGQt8LEXmA916Wmg0h2mX43v+HkH1ntHIJpym0JJIE2BhOiNIYTPPH5S5ues
	KuQizZa7EkZQKCZ3rAUhVfCSMYdGQbtBWBrxQAAAb2BHtcMXvT4aTYSTlfCzXvz72rfqPvS7R8W
	GHRa4cQEibAUALONRMXpA0sJIXrRTl09VK7q90=
X-Google-Smtp-Source: AGHT+IFmiA61E4Gg0hTSxNIaahpYBE3l0iLJ8kM3KyoRS/pDDJR+mBK07r+7Ph2Rktom9ZxkS+DLG3ISTwAgRVBfuh8=
X-Received: by 2002:a2e:a550:0:b0:32a:85ad:2162 with SMTP id
 38308e7fff4ca-3309a46638amr29026981fa.7.1752940350231; Sat, 19 Jul 2025
 08:52:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250610-smc-6-15-v7-0-556cafd771d3@kernel.org>
 <20250610-smc-6-15-v7-6-556cafd771d3@kernel.org> <8f9fdb3e-9655-44ce-8a2f-c1628c88c929@kernel.org>
 <CACRpkdZdz7eHVjgX-X_UwjJ_qSu5hSPeocuQ9DWSiyjNLU5AmA@mail.gmail.com>
In-Reply-To: <CACRpkdZdz7eHVjgX-X_UwjJ_qSu5hSPeocuQ9DWSiyjNLU5AmA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 19 Jul 2025 17:52:19 +0200
X-Gm-Features: Ac12FXzcG7EoJK0F7AkshhLftC2Qw2ygudqOy-1un15EMy9NVqfotyOTu45yZjU
Message-ID: <CAMRc=McNK3fmbP2UON0EGkjM6gH_1zSHFr_PzZ9JhR7a5swLQw@mail.gmail.com>
Subject: Re: [PATCH v7 06/10] gpio: Add new gpio-macsmc driver for Apple Macs
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sven Peter <sven@kernel.org>, Lee Jones <lee@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Hector Martin <marcan@marcan.st>, 
	Neal Gompa <neal@gompa.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, Sebastian Reichel <sre@kernel.org>, linux-kernel@vger.kernel.org, 
	Marc Zyngier <maz@kernel.org>, linux-pm@vger.kernel.org, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Conor Dooley <conor+dt@kernel.org>, 
	Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 19, 2025 at 5:42=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Sat, Jul 19, 2025 at 2:59=E2=80=AFPM Sven Peter <sven@kernel.org> wrot=
e:
>
> > top posting on purpose: are you fine if Lee takes this commit with the
> > rest through his mfd tree?
>
> Bartosz should answer this since he's dealing with the merge
> window for GPIO, but generally it's fine, and it's even using
> .set_rv.

Yes, for sure. Lee typically provides all interested parties with
immutable branches after picking up complex drivers like this. I
already reviewed it but for the sake of completeness:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
