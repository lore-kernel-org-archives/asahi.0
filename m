Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3FD21C164
	for <asahi@lists.linux.dev>; Thu,  5 Dec 2024 15:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733413954; cv=none; b=OyCvqEBA5U2bQypcYiCrNJoKNZXKHASOPKAdjWXHRd295JJDjWb8MKMg+UsUccZdndcC78Is9IcXh6Ggdccx+YrL09bGIezbAk0QdOy8eaNPGW4KjPSoFc2ORGGW7lD0Makj6jGIOEFtPfOCybfMHOGKlAJsQ/TkwYSxGz7rYwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733413954; c=relaxed/simple;
	bh=Kij0pMFjp1FIZECulBkulJhs69DMxK/+RRr1dTBi8Mg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ivyT9lrmL6Pp7wwW4YRemdZy1ZL+owLdmwKnhAak1TN7VIgQhyBZQ9Q6ltUojMsJhAvEB4BwQamggjKIJIaUvW1nhRewqNpKJcKuUCh0MtcikYNa+ylWZlT6Y037s1cboK7M3kfzw2IKDSJ9advtB42IzZYq6zR8oh0LJxUE++U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eAuPVZn3; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eAuPVZn3"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d1228d66a0so9957a12.1
        for <asahi@lists.linux.dev>; Thu, 05 Dec 2024 07:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733413950; x=1734018750; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vEZhIBbCBW5mV7dogz2EkqQC7Av8Las6Bo0OJgolYbA=;
        b=eAuPVZn38r95HUP2YDbzpkVXpnvxvg3eTC4rRRNa9wSQ9kuqZr+rZqf230xFdTgiO2
         uM4rGD6XNPT2iXIRwGzrq8beeO9hwSaxaOr3dmAyf4qtlraUQQvfs5dCy1Ym4EsMyHXn
         iNrxx9qm9d1c4gkgN2cq+rawXlUwCfmEREDsJtlKcG59de/XO22D19vBrP1GOFI6XI9B
         GkXOjx+tLk4OEEsgSK/3dqjTniydrKOa+NQYvlG+hrqAo3jEvsh+d1ulGNTTGTL+pKWH
         KXJxaS8pkeOx+5s+95iKbOAEgzUS1XW5oT3GE8B3cxJodlTamXQWdX9d92twvLVDY6PN
         RqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733413950; x=1734018750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vEZhIBbCBW5mV7dogz2EkqQC7Av8Las6Bo0OJgolYbA=;
        b=fj1sFWCbu8tGjB2xTSVorOf/RSaYh3qOUMa7yDbsb6shKzd2fPfQaWVrg8xC3UNZmb
         NfXjm+cSQ4XjhwqjrLLbvV/xIKXKSPJ3vMp4bdznKOSp+WoZKn9FF1TA53oVkimTNP1H
         X5tv3GQ9htr/bSBKJNvcmO1F/LP+WSF4RP5RviUAXsIIIekAMGpjL64OJBV1YUiJvB1y
         nx96aRTzTxF2vDDzJECVPo/qcTJ/41DnCyfDZ5sEeYkY8wtMKRyIEytupNDSaPV9p4Bv
         k3zAitUpH4aufP2Ghs64saoK8ra4l/FgR5H5+A9t7A1OaAoCU4crlN/WDPMv1PDUVjes
         8aeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCmLNwsiPTN9QvnNfti563KbdcV+8/HIE0FoxrgsYFqFPxI+Z8bbJQWnpj2KXNw+Cn/TL05w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyOJoF2NDR2Mvzn+ueHuk4B1lbFWONmM/fQxnmH1iURgZeOYzoG
	zslL4YDH9Rv2xwNbb4/MXY4Y2hWolV6+yDevvFVVOBbJkgSWVU0banE2zUYWvYay0RMSsHSNBID
	fY4DX8Td3ogNYLqSHi1yUxLySaQtXVgQLab8E
X-Gm-Gg: ASbGnctrnsI+pCJgEdUx8h1JUYenR1CV5/+JZWb2lyG/JlOkDEJaHuZkEMYe3qCYH47
	E2VssRFuxT7YE9GMaosCAwqpGeRNBFL06
X-Google-Smtp-Source: AGHT+IFBiLz78aKLQ7PSRqfnfxVbdQRhB246a3JGCkTy/Nk+EAvR/wwPlsqF9sjCkYVRcSQoJuYGGxEhlRPuON1Kgqo=
X-Received: by 2002:a50:ed99:0:b0:5d0:b20c:205c with SMTP id
 4fb4d7f45d1cf-5d13514ed50mr87120a12.5.1733413949872; Thu, 05 Dec 2024
 07:52:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241121204220.2378181-20-samitolvanen@google.com>
 <20241121204220.2378181-21-samitolvanen@google.com> <Z0UIdmDHYQtUTR1i@bombadil.infradead.org>
 <CAK7LNATK9rSm4AUSneq=aYbADatPL=1eUXuYRChX+WU+zNTyKw@mail.gmail.com>
 <Z0YS1hVWuozpN4Ln@bombadil.infradead.org> <CAK7LNARcECiG0TAJFmFDhmbgzQiETX0i-_mr3StDAUiGTjKnLA@mail.gmail.com>
In-Reply-To: <CAK7LNARcECiG0TAJFmFDhmbgzQiETX0i-_mr3StDAUiGTjKnLA@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 5 Dec 2024 17:51:52 +0200
Message-ID: <CABCJKuep1Fk22rpxcZbFzD0_Dhp+1Oonz123jHs8WkNKjQaekA@mail.gmail.com>
Subject: Re: [PATCH v6 01/18] tools: Add gendwarfksyms
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Dec 5, 2024 at 5:46=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> On Wed, Nov 27, 2024 at 3:26=E2=80=AFAM Luis Chamberlain <mcgrof@kernel.o=
rg> wrote:
> >
> > On Tue, Nov 26, 2024 at 12:50:48PM +0900, Masahiro Yamada wrote:
> > > On Tue, Nov 26, 2024 at 8:30=E2=80=AFAM Luis Chamberlain <mcgrof@kern=
el.org> wrote:
> > > >
> > > > On Thu, Nov 21, 2024 at 08:42:22PM +0000, Sami Tolvanen wrote:
> > > > > Add a basic DWARF parser, which uses libdw to traverse the debugg=
ing
> > > > > information in an object file and looks for functions and variabl=
es.
> > > > > In follow-up patches, this will be expanded to produce symbol ver=
sions
> > > > > for CONFIG_MODVERSIONS from DWARF.
> > > > >
> > > > > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > > > > Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
> > > > > ---
> > > > >  kernel/module/Kconfig                 |   8 ++
> > > > >  scripts/Makefile                      |   1 +
> > > > >  scripts/gendwarfksyms/.gitignore      |   2 +
> > > >
> > > > This doesn't add scripts/gendwarfksyms to MAINTAINERS
> > > > but then again   scripts/genksyms/ is not there either
> > > > but it does got to Masahiro.
> > >
> > > scripts/genksyms/ is a very old tool with no maintainer.
> > >
> > > It defaults to the maintainer of the scripts/ directory (i.e. me)
> > >
> > > > Masahiro, should we just add both to KERNEL BUILD and add
> > > > Sami as a Reviewer to help with gendwarfksyms?
> > >
> > > I think it is better to have a separate entry for
> > >
> > > F:  scripts/gendwarfksyms/
> > >
> > > with Sami as the maintainer.
> >
> > OK do you want this and the extended modversions to go through your tre=
e
> > or modules tree?
> >
> >   Luis
>
>
> I guess I can pick up them.
>
> I was just thinking about a possibility to
> make this (and the other one) less worse.

Note that I'm planning to send out v7 with the recent feedback
addressed ~mid-December when I'm back in the office, and I'm sure Matt
is also happy to make any improvements to his patches that you have in
mind.

Sami
