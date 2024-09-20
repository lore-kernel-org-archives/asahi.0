Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEBC17555
	for <asahi@lists.linux.dev>; Fri, 20 Sep 2024 20:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726862774; cv=none; b=SvAABjORC+eZRyFU0VKdv6yAqZx1xeuBQm9HkWOCaUuLfWSCYBBE7BN+7+uNoUgM4i93vy+7IgjX0eqBs08zZDOtKT33KPb0CQE6OjLIbGP6sblxQBEZvAAdyIVdbDBXky+RE/9rGupgYMu5KDKLQCdejvtINNcI+omjQPm5alA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726862774; c=relaxed/simple;
	bh=CBzB9DegP9xT4r54u9lCf8GGxVgSTyGf0f4wQB/TSB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gdxcleXQfYGsgIBin3urVxHQhUpBF5bQ2nU26x4/BtausxDKaaSoq7o7HNz6+2AQZ5hNPgUHhQFTpGVP/rZrzKtrTEe2UJ83N0V19lYHylBmwUeFir8IRa+0jpoU3o7R5jEuePncmy5YxpDI206P9cG1U8Ma+0Lj/d0fMklFWgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fi94N8eT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fi94N8eT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726862772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B12ZD5DrYH7h8WzDfAk/iI3QEtMDIKemU/ORBWuCezM=;
	b=fi94N8eTmpuEf/SVlbXiGz3hHwRxur099eRfDU+byiQUaJt8ZEcVSXQL8qdpDKLQFigaOr
	w8CFReJxmR5g6AMAuORIU2+b0C7Ee9XQo2oljpenfkkDaSi9GXMEAKVjZdA8wwf97A89R1
	+hV6nyVDbkXuHg/gyYycQhON6IVVpnY=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329-Ly0GeQc2N7adFhMn6lvfnQ-1; Fri, 20 Sep 2024 16:06:10 -0400
X-MC-Unique: Ly0GeQc2N7adFhMn6lvfnQ-1
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-278249679a1so2394855fac.3
        for <asahi@lists.linux.dev>; Fri, 20 Sep 2024 13:06:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726862770; x=1727467570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B12ZD5DrYH7h8WzDfAk/iI3QEtMDIKemU/ORBWuCezM=;
        b=LEIIKtE1E3c3Mb4umnok+b9UZ/47Y2w0Hk30GothZAekVLF7sv0BZSWhJBez5FmyWj
         id9iONP8TaKor3Mo1gshUCUJtrBJj/wf5Y19/uz39iwYbOEn4k0TcbYRe4cTWGb8+00e
         mR/eKaPAQ9rpJNveYtJpfPnSRPehNb8jFzi0/9SBBhoVWghI0gg9qkt2qvTpVMWjKnR0
         7cmvdU4bj48zXm0ozWrgMZqVSO3rCEw6wGf16jFMiIVBI5rvwp6Mqyfer8NF1SZmkL+g
         donk4pM0PyU4pnIoB6oTQAe+uqh2t/IdDbHeHZuYI3MAtPu4iQt9O9PM6d9EjbGCeE1x
         OI3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXIjmljp7JwDZO6HMN0Y/yYmVrEQ4laUXODRbhZj+7mhwvWt86/LPwYNBINmFY41tMhR75+Lw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyQnmFi6kSTHPLxm+GFvVePWIzE2Oxc//o1LXpumPPwUJboU+Q7
	eDo388Z/KRdOm05UXjU4c7VM0gM2+suKTNH6HAXHbwlzHKaVL10Bdp9ed2NX+HN97Ej5NF2lMQY
	Hhsgn/w34s8rBgQWFhrsdc3y6iqBRSokAZ8sBsUkrQYDncg4ABn32YyF8Rbeh92jurA6tI2pXYI
	1epggC+bf2pbGy/wrAMQwpoIfc1Ns=
X-Received: by 2002:a05:6871:3386:b0:261:16da:decb with SMTP id 586e51a60fabf-2803cf16e10mr2878963fac.11.1726862769927;
        Fri, 20 Sep 2024 13:06:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzLMErzxKrlp5+s01Bs/w34iga0hgVQrzjiKIRpy3VgDl8ZH9K2nNWMJDRDpc/rwlHypFpOm8CN4+mcEVsWpU=
X-Received: by 2002:a05:6871:3386:b0:261:16da:decb with SMTP id
 586e51a60fabf-2803cf16e10mr2878942fac.11.1726862769636; Fri, 20 Sep 2024
 13:06:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1720728319.git.jstancek@redhat.com> <27899413.1r3eYUQgxm@skuld-framework>
 <CAEg-Je_MXyP_PNj_QOu66SW_XYHy0zv0PnTTxX2qWELRG+xM_w@mail.gmail.com> <D4B7ZCR4XWCT.3TWNN24TA8PSF@iki.fi>
In-Reply-To: <D4B7ZCR4XWCT.3TWNN24TA8PSF@iki.fi>
From: Jan Stancek <jstancek@redhat.com>
Date: Fri, 20 Sep 2024 22:05:51 +0200
Message-ID: <CAASaF6zhiDdbfYkgg7wENih2Lp309eUgeu=FHZm0yYaEBt2gRg@mail.gmail.com>
Subject: Re: [PATCH 0/3] sign-file,extract-cert: switch to PROVIDER API for
 OpenSSL >= 3.0
To: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
Cc: Neal Gompa <neal@gompa.dev>, David Howells <dhowells@redhat.com>, dwmw2@infradead.org, 
	zxu@redhat.com, keyrings@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Asahi Linux <asahi@lists.linux.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, 
	Jarkko Sakkinen <jarkko@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 20, 2024 at 5:34=E2=80=AFPM Jarkko Sakkinen <jarkko.sakkinen@ik=
i.fi> wrote:
>
> On Fri Sep 20, 2024 at 2:42 PM EEST, Neal Gompa wrote:
> > On Tue, Aug 6, 2024 at 4:27=E2=80=AFPM Neal Gompa <neal@gompa.dev> wrot=
e:
> > >
> > > On Friday, July 12, 2024 3:11:13=E2=80=AFAM EDT Jan Stancek wrote:
> > > > The ENGINE interface has its limitations and it has been superseded
> > > > by the PROVIDER API, it is deprecated in OpenSSL version 3.0.
> > > > Some distros have started removing it from header files.
> > > >
> > > > Update sign-file and extract-cert to use PROVIDER API for OpenSSL M=
ajor >=3D
> > > > 3.
> > > >
> > > > Tested on F39 with openssl-3.1.1, pkcs11-provider-0.5-2,
> > > > openssl-pkcs11-0.4.12-4 and softhsm-2.6.1-5 by using same key/cert =
as PEM
> > > > and PKCS11 and comparing that the result is identical.
> > > >
> > > > Jan Stancek (3):
> > > >   sign-file,extract-cert: move common SSL helper functions to a hea=
der
> > > >   sign-file,extract-cert: avoid using deprecated ERR_get_error_line=
()
> > > >   sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >=
=3D 3
> > > >
> > > >  MAINTAINERS          |   1 +
> > > >  certs/Makefile       |   2 +-
> > > >  certs/extract-cert.c | 138 +++++++++++++++++++++++----------------=
----
> > > >  scripts/sign-file.c  | 134 +++++++++++++++++++++------------------=
--
> > > >  scripts/ssl-common.h |  32 ++++++++++
> > > >  5 files changed, 178 insertions(+), 129 deletions(-)
> > > >  create mode 100644 scripts/ssl-common.h
> > >
> > > The code looks fairly reasonable to me and behaves as expected.
> > >
> > > I have been actively using this patch set for several weeks now acros=
s
> > > linux-6.9.y and now linux-6.10.y with good success.
> > >
> > > It is in use in production for Fedora Asahi Linux kernels with good s=
uccess.
> > > Thanks for the fixes. :)
> > >
> > > Reviewed-by: Neal Gompa <neal@gompa.dev>
> > >
> >
> > Jarkko, could you please consider submitting this for inclusion into
> > 6.12? I've been carrying this for three Linux kernel rebases now
> > (6.9.y, 6.10.y, and now 6.11.y) and it seems to be just fine, and
> > without it, I cannot build kernels anymore with the OpenSSL engine API
> > disabled in Fedora and CentOS/RHEL. I also expect that the engine API
> > will disappear on other platforms in the near future given its
> > deprecated status and recently accelerated conversion of engine
> > backends to the newer provider API.
> >
> > Thanks in advance! :)
>
> Yes, I think I can. And I've yet to do 6.12 PR because I've been
> busy sorting out perf regression in the TPM driver.
>
> ERROR: need consistent spacing around '*' (ctx:WxV)
> #66: FILE: certs/extract-cert.c:69:
> +       OSSL_STORE_CTX *store;
>                       ^
>
> ERROR: need consistent spacing around '*' (ctx:WxV)
> #93: FILE: certs/extract-cert.c:96:
> +               ENGINE *e;
>                       ^
>
> ERROR: need consistent spacing around '*' (ctx:WxV)
> #199: FILE: scripts/sign-file.c:114:
> +       OSSL_STORE_CTX *store;
>                       ^
>
> ERROR: need consistent spacing around '*' (ctx:WxV)
> #229: FILE: scripts/sign-file.c:141:
> +       ENGINE *e;
>               ^
> Any ideas of these? My guess is that they are unfixable and related
> to non-kernel-standard code.

This looks like false-positive. Following will produce same error:
+#if TEST
+       ENGINE *e;
+#endif
+
$ git diff > 1.patch; ./scripts/checkpatch.pl 1.patch
ERROR: need consistent spacing around '*' (ctx:WxV)
#10: FILE: scripts/sign-file.c:217:
+       ENGINE *e;
               ^

total: 1 errors, 0 warnings, 10 lines checked

but if first type in #if block is something checkpatch recognizes,
then it reports no issues:
+#if TEST
+       int i;
+       ENGINE *e;
+#endif
+

$ git diff > 1.patch; ./scripts/checkpatch.pl 1.patch
total: 0 errors, 0 warnings, 11 lines checked

Regards,
Jan

