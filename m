Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD4721D595
	for <asahi@lists.linux.dev>; Wed, 16 Apr 2025 01:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744767554; cv=none; b=pFcpXrRVwj7IWxPXon9I/cLonF4Jnq7MPqLIIevibxId7tQ1DIOqwiuZ+jRbtHctnmU59u5LqGjreJam5BD+W4dhSykmmEs94d/JkqBBqJTyRDJgox9Eh3SvGzwih684tqgK9NjdM1U3b+tztrQ7Ll18eiCEoZRuIq7iXyOhrcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744767554; c=relaxed/simple;
	bh=splohQJw8U1XANtyUsXhKKF8Cy9tRT9Bwe2SzN0BEbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EgmVPq+WL8jUYA3WF43ykde0mlUrhaFJ5jKX1JH/cF5plNXnpPKh+uYtqqVeFeS1oRmnaLj6KMfzxTvXuK/U/7+Cq7XPoSXOPIcDL3Zql78WFSXJEMKkBGyNEkLNg645ys2Kfd+2kRCxEWLwK1x1tlH290S32ZV1Jvgjp/r7xFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e5cd420781so12240022a12.2
        for <asahi@lists.linux.dev>; Tue, 15 Apr 2025 18:39:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744767549; x=1745372349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V1HXQ+Xi113ayzUNabjj8NTshwQmo5mZvOv0N53Neb4=;
        b=Tz/hpum4xh0Y6ShnD6q9eluHbexB2NRwqd7esyrWy4/c9cRR0DVr+2VsOIUv++aSKO
         H6beaaFE9rwDUew47H0ItWy/xJJl0DrUvh/T60KBc2/icUsWb6LeQjhrGcSprZpNHE5e
         BqbDqmItii3GrNuTZyKP1OEEIqK4RA/crK4R+fVdhRgk/BDknsGn2zH05RhzPQdcSC2e
         hkYKHwgaDTMWT7/s7ZDAGzRzaLeSdmPEBa3cOtDe6kKN3OnJg44e1fT3nlkvaLRD+srG
         E9p6CGm0oL4UJcFecgMoBBJVgYR3B1N2R0eK2nq61PAShgpBfd4PveYQ+3cjLROXd0Ro
         hNnA==
X-Forwarded-Encrypted: i=1; AJvYcCVz2EDONcdHynR11w12jlF30KwTQm4EmpFpvAvwSfayShfx2vv1sOGivEOdsrd7+H+l+zSdVA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3PZc260VeAWMLKN0HIiyMWI6Hr/EiimgwfKEBYiReH2YyQ69Q
	LlRCNYON5gU2ghucL0P3BlsPtrGch5ZbLDI+IqmCH4Wwv1kpXTtg32myGdopwI0=
X-Gm-Gg: ASbGncuQHOHiqnfpSnP7kpaoMVlbTv9EpIkFolNe3Xkf+S3fk6FFzhiZw+5JpA1R/4R
	uBD/p7L5gW3eYV5x2+gluDqqNeR7ugon+IZ/uX0dEUEsb2CeSb3gt4MKqnLuwNBlQVpnvzU0UCC
	gl+g1sr/UJ0uN/VcVilQJUYGD5SINyu/EFM/m/qc+w76H7Ohu1PzSl3MjmrUyNF3MLxvzhVX5qs
	cNDCI0bZ9huktwg5C6kcRWRbKj4ALdjibVA0ucGAFkEiNjoqC4xNAhDR2sK4MpW76+7kW/2N4E9
	0qwKwjehYGKtFUprtdhkn5k3sjuncPOSrkZ6N/YUYkyJ4EoUhOCd31Wr5S5Lj0FOEvPauNA=
X-Google-Smtp-Source: AGHT+IHGgYa8OT2zVEKEWlOwHtpisqn1pFF0ii5fgadku06LwqHINnoirVZMXCWJqGuNoNel4SRiqQ==
X-Received: by 2002:a17:907:3f17:b0:ac3:991:a631 with SMTP id a640c23a62f3a-acb382bf3d4mr91921366b.34.1744767549174;
        Tue, 15 Apr 2025 18:39:09 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3d1cea1fsm28270566b.139.2025.04.15.18.39.08
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 18:39:08 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so1087488366b.1
        for <asahi@lists.linux.dev>; Tue, 15 Apr 2025 18:39:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVPSTUwn5iGLQrtAO44nnSJSiMUXTRmMb4+i0RYvyUmOw/rHN9oAOZLxljgNCmlPUP1b753wA==@lists.linux.dev
X-Received: by 2002:a17:907:6ea1:b0:ac6:e327:8de7 with SMTP id
 a640c23a62f3a-acb3849df86mr88724666b.42.1744767548484; Tue, 15 Apr 2025
 18:39:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
In-Reply-To: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
From: Neal Gompa <neal@gompa.dev>
Date: Tue, 15 Apr 2025 21:38:32 -0400
X-Gmail-Original-Message-ID: <CAEg-Je9vfqKe8tThUNxy2hKGGMYR4F2RJaKXqaXJx8f856Oncg@mail.gmail.com>
X-Gm-Features: ATxdqUGM2YL7UPwB2q8EHrpPvcO9cfPSM4k-2kB4UVuY2Jof3nZs232BzqVAc98
Message-ID: <CAEg-Je9vfqKe8tThUNxy2hKGGMYR4F2RJaKXqaXJx8f856Oncg@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Apple/PASemi i2c error recovery fixes
To: Sven Peter <sven@svenpeter.dev>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Hector Martin <marcan@marcan.st>, linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 11:37=E2=80=AFAM Sven Peter via B4 Relay
<devnull+sven.svenpeter.dev@kernel.org> wrote:
>
> Hi,
>
> This series adds a few fixes/improvements to the error recovery for
> Apple/PASemi i2c controllers.
> The patches have been in our downstream tree and were originally used
> to debug a rare glitch caused by clock strechting but are useful in
> general. We haven't seen the controller misbehave since adding these.
>
> Best,
>
> Sven
>
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
> Changes in v2:
> - Added commit to use the correct include (bits.h instead of bitfield.h)
> - Added commit to sort includes
> - Moved timeout explanations to code instead of just the commit log
> - Made timeout recovery also work correctly in the interrupt case when
>   waiting for the condition failed
> - Used readx_poll_timeout instead of open-coded alternative
> - Link to v1: https://lore.kernel.org/r/20250222-pasemi-fixes-v1-0-d7ea33=
d50c5e@svenpeter.dev
>
> ---
> Hector Martin (3):
>       i2c: pasemi: Improve error recovery
>       i2c: pasemi: Enable the unjam machine
>       i2c: pasemi: Log bus reset causes
>
> Sven Peter (3):
>       i2c: pasemi: Use correct bits.h include
>       i2c: pasemi: Sort includes alphabetically
>       i2c: pasemi: Improve timeout handling
>
>  drivers/i2c/busses/i2c-pasemi-core.c | 114 ++++++++++++++++++++++++++++-=
------
>  drivers/i2c/busses/i2c-pasemi-pci.c  |  10 +--
>  2 files changed, 96 insertions(+), 28 deletions(-)
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250220-pasemi-fixes-916cb77404ba
>

The series looks good to me, especially the new patches.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
