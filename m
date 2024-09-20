Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7EF13B59B
	for <asahi@lists.linux.dev>; Fri, 20 Sep 2024 11:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726832571; cv=none; b=kjJGczn0xcP17df6Po5fR8HfUs+dxpHdEU+1afZJ3xj2H+JRfw6lZNa5pbrCSb7yEneC4kNiTMYV7h4zfvKyugbpBPlB5mFLHSRfZI+KxLgXJndJ5OB4+5wGZMr6Sl8nXWeE9agO0kNtROIX4nwFaHzaDue1RKrVYHZsmIkgAyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726832571; c=relaxed/simple;
	bh=EiUrBnnPPKo3+c08LehpmkVRBmIR2Vey6Rh8ikMEH0Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WcoEhu/L3JfTiH89ovC+fPNibaAXcZbnwP769+ZCY1od7kj8p61quVvdzbeFJu9i1nFi0QPZFxOCtHTiFg4DuPWNpksJ/kcaIW98uu0RyLoYlH0qBB+OaE7dP1b/TpNAn/3lt3X9Ths260TfyIy3uountJ9n0ru1pg/cJfl2rcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2f761cfa5e6so21937451fa.0
        for <asahi@lists.linux.dev>; Fri, 20 Sep 2024 04:42:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726832567; x=1727437367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wdsT5svVcvOhG90auQdmy7PS7pzw5L+P6+hRSDptKww=;
        b=p5a3xjh2+go3sXl+Z2FuTP2ePnK3mvggYVyeKgQYrGPfUgIPeBEPJiJ+X0fgbDdhEg
         d294d9t3L3mTzzz/1NYHBk/dcI2n84O+GamIpEzJDxw8odOcP1tOEzq6tvuNNSn6wifM
         Y1HQePoeW265nr9QalUzndi/5cydDuxPomPOHcAoul8zT3ZBPJ0qX2A5aDLXG+283L/P
         f7NSGmN8TRUhj9O/EQoSMgK3zGhhj2L+qpMfquky1quN1KaMpho6lhvyTbshXVBqpGLG
         YG0wvPfdfVSWs2YgJ5Tkj87QimHmWidRZ1lpnRkg6jCcJzESl6YmQ1inMRTXZSuB5TSc
         0yow==
X-Forwarded-Encrypted: i=1; AJvYcCWlGewTdyu+Wjp0MNWSKtr91lnM0/XLmR6FwU4T52sr2WtZxOXhZhETnv4TfDiSBwESHYYFuA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyzl2blHinp2u9x7flFj0g57Otb6lNxViDJUmZjxntKchgO8pac
	HNyEdAwa0DrePIPPXf/LvnjDS8Hzhls0yFo6fMqsJb6avjJX3/wKX3L8UD2I
X-Google-Smtp-Source: AGHT+IGhCGKviyJ0dAHnaJFIAP/xmaxuSGfS6vHGh0DD+1o4+lfETUdRHx6X8J33lA409NoBgHB/Tw==
X-Received: by 2002:a05:651c:154a:b0:2f7:baac:fad7 with SMTP id 38308e7fff4ca-2f7cb342effmr16130341fa.39.1726832566870;
        Fri, 20 Sep 2024 04:42:46 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f79d3859dfsm19341891fa.82.2024.09.20.04.42.46
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Sep 2024 04:42:46 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5365392cfafso2017709e87.0
        for <asahi@lists.linux.dev>; Fri, 20 Sep 2024 04:42:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVhAQCjrWZT0ohLLK5dM03FPIc/bBH7oaz4m44Hqv1eXFkVKQDjBYY+E+DKDc3ygNZHbgGcmA==@lists.linux.dev
X-Received: by 2002:a05:6512:108f:b0:536:7cfb:6998 with SMTP id
 2adb3069b0e04-536ac2f5ba6mr1546516e87.35.1726832565794; Fri, 20 Sep 2024
 04:42:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1720728319.git.jstancek@redhat.com> <27899413.1r3eYUQgxm@skuld-framework>
In-Reply-To: <27899413.1r3eYUQgxm@skuld-framework>
From: Neal Gompa <neal@gompa.dev>
Date: Fri, 20 Sep 2024 07:42:09 -0400
X-Gmail-Original-Message-ID: <CAEg-Je_MXyP_PNj_QOu66SW_XYHy0zv0PnTTxX2qWELRG+xM_w@mail.gmail.com>
Message-ID: <CAEg-Je_MXyP_PNj_QOu66SW_XYHy0zv0PnTTxX2qWELRG+xM_w@mail.gmail.com>
Subject: Re: [PATCH 0/3] sign-file,extract-cert: switch to PROVIDER API for
 OpenSSL >= 3.0
To: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>, David Howells <dhowells@redhat.com>, dwmw2@infradead.org, 
	zxu@redhat.com, keyrings@vger.kernel.org, Jan Stancek <jstancek@redhat.com>
Cc: linux-kernel@vger.kernel.org, Asahi Linux <asahi@lists.linux.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Jarkko Sakkinen <jarkko@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 6, 2024 at 4:27=E2=80=AFPM Neal Gompa <neal@gompa.dev> wrote:
>
> On Friday, July 12, 2024 3:11:13=E2=80=AFAM EDT Jan Stancek wrote:
> > The ENGINE interface has its limitations and it has been superseded
> > by the PROVIDER API, it is deprecated in OpenSSL version 3.0.
> > Some distros have started removing it from header files.
> >
> > Update sign-file and extract-cert to use PROVIDER API for OpenSSL Major=
 >=3D
> > 3.
> >
> > Tested on F39 with openssl-3.1.1, pkcs11-provider-0.5-2,
> > openssl-pkcs11-0.4.12-4 and softhsm-2.6.1-5 by using same key/cert as P=
EM
> > and PKCS11 and comparing that the result is identical.
> >
> > Jan Stancek (3):
> >   sign-file,extract-cert: move common SSL helper functions to a header
> >   sign-file,extract-cert: avoid using deprecated ERR_get_error_line()
> >   sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >=3D 3
> >
> >  MAINTAINERS          |   1 +
> >  certs/Makefile       |   2 +-
> >  certs/extract-cert.c | 138 +++++++++++++++++++++++--------------------
> >  scripts/sign-file.c  | 134 +++++++++++++++++++++--------------------
> >  scripts/ssl-common.h |  32 ++++++++++
> >  5 files changed, 178 insertions(+), 129 deletions(-)
> >  create mode 100644 scripts/ssl-common.h
>
> The code looks fairly reasonable to me and behaves as expected.
>
> I have been actively using this patch set for several weeks now across
> linux-6.9.y and now linux-6.10.y with good success.
>
> It is in use in production for Fedora Asahi Linux kernels with good succe=
ss.
> Thanks for the fixes. :)
>
> Reviewed-by: Neal Gompa <neal@gompa.dev>
>

Jarkko, could you please consider submitting this for inclusion into
6.12? I've been carrying this for three Linux kernel rebases now
(6.9.y, 6.10.y, and now 6.11.y) and it seems to be just fine, and
without it, I cannot build kernels anymore with the OpenSSL engine API
disabled in Fedora and CentOS/RHEL. I also expect that the engine API
will disappear on other platforms in the near future given its
deprecated status and recently accelerated conversion of engine
backends to the newer provider API.

Thanks in advance! :)


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
