Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D4D73451
	for <asahi@lists.linux.dev>; Tue,  6 Aug 2024 20:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722976027; cv=none; b=oLcxx+69NCPyw9VPP8hVnsZplT0hQue4Nq3xy3mDs9hoJt1nfthajFuBVWnbitoI9EXO9805WS92gy8U/sHg5r6hPrYNEFgn+9Y32Wd8M7OrQg9kP7OPb/beRi+Q3SntyAVp8fro78JnqfTYEsJAE9GcXdiLUqbOHyNilCjo2ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722976027; c=relaxed/simple;
	bh=LIGzCfRqqebdBfRcltouWmCzar9jPj1JAuYvgrKDy8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JC/2QG4wzvbReiGLbmxeRDpIc63zpKwD45NaUR3uknw0tSnHPHsEMfdtW9pwz5ubz+Hk6T9mzb3hwZUBz3kU69H/0zUYO0EvYuzisxZaouI1lhgh7ET1aVLX1wFJ6IxQ3mAcTUX0J5ytbRBQD+jhaj7rxV3hsChIgp8eWJNMfac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6bb987d3a98so6073626d6.1
        for <asahi@lists.linux.dev>; Tue, 06 Aug 2024 13:27:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722976023; x=1723580823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uwZfXOJPvxoJ+u8XhJj/J9BXgf+sA8551y3aceuGSSs=;
        b=AIRzjK0KjjIEhD2rO57MvcKXWzWK/Acp/TvA5CFJlrFnqQfV7P2RhMYRDgI7jDpaJa
         vyl3yDhzpZVOi8u2tpyyxXhRVyFRnxW7ziDBa6Hy9rb46l8B009997WvdH1IdIqTmktn
         AofCcexoU0/EKy4hiQ8Gc5cAQPUM/DG7FlXcM55+d/hHks6JnFrT5929+jYbB+LT0lF9
         eZRbaVeN0ICVgwTxwhzO6tyfCJPFgt5VN7zHufNOxN2wgW1/rL80wqRmkxV4FjpmY15o
         E7gPedccOF0erth3BR1UqlukL6R6unCkaOeJJdaxoBrDQIUs0+lHcEllEYiupvjLqfH9
         pVLA==
X-Forwarded-Encrypted: i=1; AJvYcCUu4fUo9gKxYQ/D/SDtDgypfcNLjJ8EIGzK4OJ5A8T5DTKpRFpFMYYlbnsy4swRvqMH6VCDKsaIdCXvCAd7MwzCnaysOKE=
X-Gm-Message-State: AOJu0YwzWqj0IURE2OBB+13AjW3ZR3LUg3CfDWsIdHGLnlUfDNRS1/aJ
	k5svH2u+f7iZJp2iZ1UISW9BmOlgR/CuMxMFBljuai9AswKzZ5nU
X-Google-Smtp-Source: AGHT+IFWJRP53ZGQcILmesp11SkYwtkCw7B+T56HRmkDeDIKC0nI9Xt3v62mr8pYg6yxuQDhfxg0lA==
X-Received: by 2002:a05:6214:5546:b0:6b9:9151:d8c1 with SMTP id 6a1803df08f44-6bb9830fbb1mr191513846d6.11.1722976023490;
        Tue, 06 Aug 2024 13:27:03 -0700 (PDT)
Received: from skuld-framework.localnet ([32.221.37.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb9c83d039sm50000056d6.75.2024.08.06.13.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 13:27:03 -0700 (PDT)
From: Neal Gompa <neal@gompa.dev>
To: David Howells <dhowells@redhat.com>, dwmw2@infradead.org, zxu@redhat.com,
 keyrings@vger.kernel.org, Jan Stancek <jstancek@redhat.com>
Cc: linux-kernel@vger.kernel.org, Jan Stancek <jstancek@redhat.com>,
 Asahi Linux <asahi@lists.linux.dev>, Hector Martin <marcan@marcan.st>,
 Janne Grunau <j@jannau.net>
Subject:
 Re: [PATCH 0/3] sign-file,extract-cert: switch to PROVIDER API for OpenSSL >=
 3.0
Date: Tue, 06 Aug 2024 16:27:02 -0400
Message-ID: <27899413.1r3eYUQgxm@skuld-framework>
In-Reply-To: <cover.1720728319.git.jstancek@redhat.com>
References: <cover.1720728319.git.jstancek@redhat.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Friday, July 12, 2024 3:11:13=E2=80=AFAM EDT Jan Stancek wrote:
> The ENGINE interface has its limitations and it has been superseded
> by the PROVIDER API, it is deprecated in OpenSSL version 3.0.
> Some distros have started removing it from header files.
>=20
> Update sign-file and extract-cert to use PROVIDER API for OpenSSL Major >=
=3D
> 3.
>=20
> Tested on F39 with openssl-3.1.1, pkcs11-provider-0.5-2,
> openssl-pkcs11-0.4.12-4 and softhsm-2.6.1-5 by using same key/cert as PEM
> and PKCS11 and comparing that the result is identical.
>=20
> Jan Stancek (3):
>   sign-file,extract-cert: move common SSL helper functions to a header
>   sign-file,extract-cert: avoid using deprecated ERR_get_error_line()
>   sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >=3D 3
>=20
>  MAINTAINERS          |   1 +
>  certs/Makefile       |   2 +-
>  certs/extract-cert.c | 138 +++++++++++++++++++++++--------------------
>  scripts/sign-file.c  | 134 +++++++++++++++++++++--------------------
>  scripts/ssl-common.h |  32 ++++++++++
>  5 files changed, 178 insertions(+), 129 deletions(-)
>  create mode 100644 scripts/ssl-common.h

The code looks fairly reasonable to me and behaves as expected.

I have been actively using this patch set for several weeks now across=20
linux-6.9.y and now linux-6.10.y with good success.

It is in use in production for Fedora Asahi Linux kernels with good success=
=2E=20
Thanks for the fixes. :)

Reviewed-by: Neal Gompa <neal@gompa.dev>

=2D-=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!


