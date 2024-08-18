Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1E1153808
	for <asahi@lists.linux.dev>; Sun, 18 Aug 2024 21:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724016778; cv=none; b=OOWzO0Scs0asXF4fvIxPFZJAe9dlLM+wscizDgXSFOEY3OOi9xb5gMm4wLpdBb7q91ocIrejlKCdfrq+hMttP0OuHPD4YYcwmVjOJ/6M0gvopEiqsVZudm02mxiYkR0LF0P0fIKkac4qRNXBryARvvr+e+981sEehM8NhzLjCRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724016778; c=relaxed/simple;
	bh=+p3VKe9iTag8inzp/6FGohRgqxj9rctXxfCkz3gi0KU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m+MLTtaFWfGOJifDd7fyJav80TNGYh6RfED/nxrBfD3tmz+CnMHmbJBWmBQt7C/1VV0/RwXXGazWz1B0PcGVFLkKXHoZDBqVB8ObnMbbqn2cNmaDtGXUm1IwZpzgzQUWrzxSXXQrGJI9SHkbIihn14NXXl/KA84AUpJ1HjEPN8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jN5kqJ1T; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jN5kqJ1T"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2702a00aad4so1560445fac.1
        for <asahi@lists.linux.dev>; Sun, 18 Aug 2024 14:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724016776; x=1724621576; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4gkcmIIMnoTGboEDvnnK12RAaIwabyHY1LBCxMjsCOQ=;
        b=jN5kqJ1Tp8EQ3i7HGnPa19NociIS0kn4t/9I9OVqo3D/jmLNH+FfIORPrO79Fh5EYx
         dzRTsVhnk03flcK1jpHED4fX/r6Dw8G6hJd1tdlaDf27KY/4sd+lB7MgC7jQnvkPa9MP
         TBYMOoDef4GKyYaqVKoFQtLLK+gFjhYuKSGed+uuk4DhWkfTiShnKVhiX8j4Wapie5eu
         MQihWDbXBGI7pEkngI0ptEChvhrwn6Eni1kHJmXNa/leqJgFGvuTkiGpK0bTOgNsy3Aw
         vY2zn1PKPKSaowP65K9foZYLYS4dEe7iJApSW1en7KsK+/szXlK2qZwYk3l55Z2Ujlca
         F88w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724016776; x=1724621576;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4gkcmIIMnoTGboEDvnnK12RAaIwabyHY1LBCxMjsCOQ=;
        b=LFLGkh15IKJuV+E30BrB4ZzF7j8Ll0o+r5g460m+vzut9Sd6eW17dRU5f/8cXrsS6T
         UfOYEhSZBzNVnfHNgwoLJhUW5uyIQSW+MGbcOtlOD4qjN7fJIda1eVwe8a/k3bXaPImy
         /4SBf7APOKCD6BwJkLI0dkiZv2cZMFTpnEwEt4Kg6bTNTswXZ5PnLdxLMILj6sGpAd1U
         l1N4JBzPLG828FLlwyR4Ym0zICLdQT3FvjVYia3btlGJn1ktCPsba1dtulKF2lpmcvtc
         KjNbkPh+UyEVnOTYiQGDVhGWj2l7vSkfrBLf9La5HKsLIElPt/xiFWm7foyFPj/CbMDX
         cCgg==
X-Forwarded-Encrypted: i=1; AJvYcCU7ZuCvzkIrREC6/SABusRuyakM15pEpsYz8AAILUqCUcW1y4QIeIcqE2ffBgogCCeTUU3Iv4451K97UCSjMFX52ezbwHE=
X-Gm-Message-State: AOJu0Yz3IN/3+mhbVT+gbqpgLm1Vvw/FZqiPtXB/VCqHsf/YMuATJZWa
	py5P3s7tuWWqiXSBbP0Z0h3zcqv/MWO0GxGxbYlJ+h2l9CKZ6UnsNgpiQSneU2nIJZ3xGobZFhc
	dlA/SziC3UwGiuotTZ7BKRf0nXyk=
X-Google-Smtp-Source: AGHT+IHXDov//kyQ0zuShYvCYCRCy38iMkJmmUducVC0zFKVgf4GKpueR/jJ8d6PYoPybkVeSUwTdpXGDxjcmcrt0YA=
X-Received: by 2002:a05:6870:7026:b0:25e:de4:9621 with SMTP id
 586e51a60fabf-2701c3e4751mr11227618fac.24.1724016776088; Sun, 18 Aug 2024
 14:32:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240731125615.3368813-1-neal@gompa.dev>
In-Reply-To: <20240731125615.3368813-1-neal@gompa.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 18 Aug 2024 23:32:44 +0200
Message-ID: <CANiq72mSa4_=DSFUMkq129ByQFkPk_5Y0BdY6J0Skj7Npj99-w@mail.gmail.com>
Subject: Re: [PATCH v2] init/Kconfig: Only block on RANDSTRUCT for RUST
To: Neal Gompa <neal@gompa.dev>
Cc: rust-for-linux@vger.kernel.org, asahi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Asahi Lina <lina@asahilina.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 2:57=E2=80=AFPM Neal Gompa <neal@gompa.dev> wrote:
>
> When enabling Rust in the kernel, we only need to block on the
> RANDSTRUCT feature and GCC plugin. The rest of the GCC plugins
> are reasonably safe to enable.
>
> Signed-off-by: Neal Gompa <neal@gompa.dev>

Applied to `rust-next` -- thanks!

    [ Originally (years ago) we only had this restriction, but we ended up
      restricting also the rest of the GCC plugins 1) to be on the safe sid=
e,
      2) since compiler plugin support could be going away in the kernel an=
d
      3) since mixed builds are best effort so far; so I asked Neal about
      his experience enabling the other plugins -- Neal says:

        When I originally wrote this patch two years ago to get things
        working, Fedora used all the GCC plugins, so I was trying to get GC=
C +
        Rust to work while minimizing the delta on build differences. This =
was
        the combination that worked. We've been carrying this patch in the
        Asahi tree for a year now. And while Fedora does not currently have
        GCC plugins enabled because it caused issues with some third-party
        modules (I think it was the NVIDIA driver, but I'm not sure), it wa=
s
        around long enough for me to know with some confidence that it was
        fine this way.

      - Miguel ]

Cheers,
Migul
