Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B0F1AC44C
	for <asahi@lists.linux.dev>; Wed, 31 Jul 2024 10:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722421783; cv=none; b=rq0HqtV5DEyGZUYPmIW59XLmS16/gsRTKUcsj95Kg755ZYV43m1gcMxt3vfxRtIM/rL8VUd0lGoiWL2/7gCksDRrS0r+q/XpsbOMmkmOQN70hlglJ8geWsebMjZF5+C5sqlph6hozNEeiF1tRWOaZ++U65ms1cZ7ah6lpX/wnW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722421783; c=relaxed/simple;
	bh=FQKoFJvy1J0kZ1zvxPLIXMyfB3bHK7DfHGPCBHclF8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bxGATt+W+Dr4G4oNVtfruG8oMkX4av7qmgH3VuLi8aGqV+zzN8UEgGQwKgQETZLkZYFODD59ShBn+0GoPgh2RZt3oMakSMrE41PDBoyoE+SPb4mIldo9VEe+31AHoek8ETYFSv6mI3JIVVDiJ4jYZhAMHcYyxR8KsEnmzwCp13c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EoO7Q0T+; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EoO7Q0T+"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fd66cddd4dso49188935ad.2
        for <asahi@lists.linux.dev>; Wed, 31 Jul 2024 03:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722421781; x=1723026581; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQKoFJvy1J0kZ1zvxPLIXMyfB3bHK7DfHGPCBHclF8s=;
        b=EoO7Q0T+thanJS1Ad4Q2S5ppzsjn0HaGZ7uP4VIvPPl/lxWRR2GzeGhomFnKQHMDEL
         wa+f1TLr+xxKna2l45yoXm6W8T5xlTya2zrBrwRa7kYEvI+Pue7ia/JcxBTblfMlpEGD
         n7NrhkoSRg4bO/T9znfF7bn3q57MrOyR+8rIrxRcuuL4s+S2M8ORbsk/bvybpEOqZcAy
         MwaX1YAEt9gDaD/vs1v4Vk3rTkEDwKMxQw7GPoS0cvGtjVf+5ZPnb9Na8xAGpd42UIvr
         3pmv1W3nS0X4/aHQnaukmGezK+U2/E8fINz4Rv5KF1/ZG/9X5J/oaWREVORw/5g/ZZvY
         pZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722421781; x=1723026581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FQKoFJvy1J0kZ1zvxPLIXMyfB3bHK7DfHGPCBHclF8s=;
        b=MVT8feAa8uDNgM7zCEQQ3Aef8kxnMqoDUieaMnIZ3VtPtuckXfZvY35ZskoFiTBbyR
         9r0oD5BswZ6b6dAea8vUoNwAzmf+9nXLQck7rnHbZNE5oc30IJiY/NlGn49HMdD4vJI9
         VlBIh9D7Afb5eZFLYAAoAeYbX0QcgKzzvxEyXUG/mp14kc6xv/UNV7zNFK/HI5x4Jl6j
         pabB4ErCM4Z7zvSzS8PytKLEmP5waBomyqxYJxPNMMStTv4HS6RuOM4TjXn91jS7FfFf
         hbxNwW5eNfGfhJQtWt+nh8gdRBjErN9r92UzkbOfAoyfFze+53X3tYIucetWDU2AZ/t7
         FiYg==
X-Forwarded-Encrypted: i=1; AJvYcCVC/AjVe4xzVJWECM2NfqKQBwCOXCSXvSjbr31uEB90Ab/rDt/Su1i4LntpfwlPMkAqACtJTjCtR6rRF6IFr3DDGdEnfTs=
X-Gm-Message-State: AOJu0YxVLuzmHw7sk5bFSIWeXpsy8DsYBtf7pjtV/3bhjrRFb7ETA5gC
	QFSxhZmPt5nEWbWSJQzuND9kbq7m5Vjf8C+OVN2q4hxmi7eSajmIc4Ixcrej+n7Wsq31vmKd3OS
	C5FZfuVXM8aLepd/awDHILituvlA=
X-Google-Smtp-Source: AGHT+IE0NflDpeVCQ0wq+X8dhvb52wtmDhcGufHNYbZ38cgvgpr3oUijLRTumr7kQOgnIkK93CjLTg+jjMENYGiyclw=
X-Received: by 2002:a17:90b:4c42:b0:2c4:af69:5c39 with SMTP id
 98e67ed59e1d1-2cf7e1c1adbmr17713599a91.13.1722421781375; Wed, 31 Jul 2024
 03:29:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240731032030.2847151-1-neal@gompa.dev> <CANiq72nXN-pkHAG6A19JrjiL-uKpem_-8GN8RhiVgc+sKJN6wA@mail.gmail.com>
 <CAEg-Je_S8hAUg9Gdp7QAOxww2dvV4_OoCTV1pvxMNAAvVkQueQ@mail.gmail.com>
In-Reply-To: <CAEg-Je_S8hAUg9Gdp7QAOxww2dvV4_OoCTV1pvxMNAAvVkQueQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 31 Jul 2024 12:29:29 +0200
Message-ID: <CANiq72mibFYOpQY4RxuJf1DQAdqnAsuLW2-24MnY=JpdSoXd5w@mail.gmail.com>
Subject: Re: [PATCH] init/Kconfig: Only block on RANDSTRUCT for RUST
To: Neal Gompa <neal@gompa.dev>
Cc: rust-for-linux@vger.kernel.org, asahi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Asahi Lina <lina@asahilina.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 12:18=E2=80=AFPM Neal Gompa <neal@gompa.dev> wrote:
>
> When I originally wrote this patch two years ago to get things
> working, Fedora used all the GCC plugins, so I was trying to get GCC +
> Rust to work while minimizing the delta on build differences. This was
> the combination that worked. We've been carrying this patch in the
> Asahi tree for a year now. And while Fedora does not currently have

Just for clarity, when you say "carrying the patch for a year", does
that mean Asahi used it with the other GCC plugins enabled?

> GCC plugins enabled because it caused issues with some third-party
> modules (I think it was the NVIDIA driver, but I'm not sure), it was
> around long enough for me to know with some confidence that it was
> fine this way.

Same here: I am reading this as "yes, in Fedora we tested it for a
while with the other GCC plugins enabled, although not recently".

If so, that is great to know and we can relax things here.

> This was mostly because I wanted it to be clearer. The negation didn't
> exactly read to me the same way, but that hunk can be dropped if you want=
.

I see, that is what I suspected, but I wanted to be sure I was not
missing something.

I am ambivalent on what reads best, to be honest, so I think I prefer
to avoid the change if it is unneeded.

Thanks!

Cheers,
Miguel
