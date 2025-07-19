Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF772236F0
	for <asahi@lists.linux.dev>; Sat, 19 Jul 2025 15:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752939728; cv=none; b=nxZ6emYKBXCYX36DpNZEqofnVZZ95rjxPL+9DSSJ0RmM//x/5K5dTx4OoI/yVi9YGOb7bCFXfi3hNMkQ1HFpAjI/GjeA89veKi/MxKOyFuI5FjgHcUmpyiuDy0mFUvdfa90Wi12+kb2WSDhu10tUvJx4JQ1WWrEIXIgci05VADk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752939728; c=relaxed/simple;
	bh=rn1nnfWM5bSta9/PZz3/I1BzLdbB7ZlLj09o7IEgKVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VBcezFNxUnNNKQd0PADPpPLkHK2kVDGUzHoczPSrdPDCwD/lWaPiGS2M0Tcuz4z0DfSV39px2US3mM6eMIuBMe5DoBTqihUKtbVYBqVhy+MCfbaaGSn4pfreALyxSRDzPVvy305AEbFRJHbCyYBeUg5dsP3dlUVkgIUepg5FYrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xBWr/AMv; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xBWr/AMv"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32b7113ed6bso23733361fa.1
        for <asahi@lists.linux.dev>; Sat, 19 Jul 2025 08:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752939725; x=1753544525; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rn1nnfWM5bSta9/PZz3/I1BzLdbB7ZlLj09o7IEgKVU=;
        b=xBWr/AMv7NziHt+rhjnW/SbEVxDUJyZKfum1sofcsCzC0Apx1JXwZyFzx8PlObmMEy
         JrkvxS9JoYq/EJ+eiS5bLXEdnHVLEWxZn6WpzHxQen+qJL/NreWhpVOt3y3J5i4FgxJ4
         lJ3xzJlZyorZwP76QsnuEiyrZTOqjYxWA87KrHs8Qg4Ju5E+KfeFeuZi8fXayWogs2eR
         OtD8s41lgB7QRQPiAWX8ZOdHkxO0mekIqOSbS3oJGRSDijDuQdGJU4uCDvYvPtiwsYev
         aSGP6+P0o/6R/Lk0ko3p4HKtUvusoaYkctlw9/QGV2wds+IX+zpO/majRxJGk+8XSM0h
         VvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752939725; x=1753544525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rn1nnfWM5bSta9/PZz3/I1BzLdbB7ZlLj09o7IEgKVU=;
        b=f1ZSp9Yow+kAOzdACRKWJGs9rdYsqNlGbrJdGOyK5j0YrfjJ5wUmAU9Yi4u+S3Tars
         lWKHVCxheTQQYAONKcrezgfKFOOSqYYmgAFGyfOELkMot3EYU5K8CYmwyXfSh4OTtnhK
         Cs4SrO/pjR9JOtdV2Fx18FLLrEmaMCdlED+dgLuxoFFZJvtH9N+yqf4z60/8IYND34ti
         MPZCPY9ac+oYH2FYAFGniMjlLmQikGZpDzKV3MTUbPwIKFaRb0V44GP95C5EI/PZxm5v
         0T1dhdTZYFNNw+AHFABeEjQ25NmxlS0Fds7i0m1CgnDzpRNhEwNhRP/yTQ27e3mkBZZB
         qvGg==
X-Forwarded-Encrypted: i=1; AJvYcCWQhKA6DO9GjAIYqNRqVuuSwt2KT8/9nRQ8BdiygJLXIDe8eYM5FKrjX6G7jFHSGp8knkY52A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyK4eX8geiY3hOTVlnuo7KqAdEw8iRg/gRRkp8bR2LkZinmeQvM
	88gQImPwBKW47WMRWfc8XJQ3l4MIj6UlJqMGrX/AA2SFE4rQ5tPAU9VApltKuAiL+vtBlHlFj40
	lhboObuegUu0Qgw0iqytACWozNdM0REgyE9jAT4eo6Q==
X-Gm-Gg: ASbGncvvk+QCPLgRQdzcpDkCOgxabfaSCFbgwQGOdAJrvXPBH2PufBDxJKUtrvrCf6B
	768UkkAYmzWt4TwdC/G6d1b5b1RSDprKQFsMIuiykODxQiOzde3r9uE0jBtf0ilpyK2jNluqvp5
	pfgYBI/QabqLBISWhmE7zvaLYaP5JEQsx6kUq4HE6eXdCwUzxWR3evWi+TUXaJKTOKCSOW332xS
	iJicmM=
X-Google-Smtp-Source: AGHT+IHz0AgUzYYyokGlt/TZ09DPKHJYVrOty6k/FTgVY5vV1r1KxHh9aV72LWBbI4MCzMrbevh/6hzgi1HVNc+Usj4=
X-Received: by 2002:a05:651c:54d:b0:32a:864a:46eb with SMTP id
 38308e7fff4ca-3308f2b7638mr46687401fa.0.1752939725118; Sat, 19 Jul 2025
 08:42:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250610-smc-6-15-v7-0-556cafd771d3@kernel.org>
 <20250610-smc-6-15-v7-6-556cafd771d3@kernel.org> <8f9fdb3e-9655-44ce-8a2f-c1628c88c929@kernel.org>
In-Reply-To: <8f9fdb3e-9655-44ce-8a2f-c1628c88c929@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 19 Jul 2025 17:41:54 +0200
X-Gm-Features: Ac12FXwAlxaX4ocIXQ1MhtIhdmA9pd8x_pk-4cH3CUUGhFSCjbZy3REqIbEaUb0
Message-ID: <CACRpkdZdz7eHVjgX-X_UwjJ_qSu5hSPeocuQ9DWSiyjNLU5AmA@mail.gmail.com>
Subject: Re: [PATCH v7 06/10] gpio: Add new gpio-macsmc driver for Apple Macs
To: Sven Peter <sven@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Hector Martin <marcan@marcan.st>, 
	Neal Gompa <neal@gompa.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, Sebastian Reichel <sre@kernel.org>, linux-kernel@vger.kernel.org, 
	Marc Zyngier <maz@kernel.org>, linux-pm@vger.kernel.org, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Conor Dooley <conor+dt@kernel.org>, 
	Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 19, 2025 at 2:59=E2=80=AFPM Sven Peter <sven@kernel.org> wrote:

> top posting on purpose: are you fine if Lee takes this commit with the
> rest through his mfd tree?

Bartosz should answer this since he's dealing with the merge
window for GPIO, but generally it's fine, and it's even using
.set_rv.

Yours,
Linus Walleij
