Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4565433D2
	for <asahi@lists.linux.dev>; Thu, 15 Aug 2024 20:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723754908; cv=none; b=lkLdnKPKl+MzLPTbplxZZcx6M5fUHdN3hiJaJzVUvWPiXEhE3BHiTfTk6cax/hcJ1hgc5x/JXVyxUeSwASzd1WDxPRHFXR5+Vu+y/Fe1TIElMnEwdiLQeB6U9XP6gm8P8LQK68sXz9vaF9Vvz6IaVytL/dQ4eHHIB7d4+o+VgeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723754908; c=relaxed/simple;
	bh=UWFk8iT+QX+XvTdHdEEQEkz3sro4r7bOKwiITHQ68Hw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A38FXBCIJOx5ENKK1e2p3D0zf62H6ttGm1SPM+YtWKcP+dUhWUsZKspmxR7891b6pJZbsHNsoqPk1dnl7Dyw7J3mTlbHEkqpfd7gL5WpwqFWQpbyXLA2eKsibL7Sgwt7uEtdZSGKTExjGOMEn4gX0hwM/4IqNaMrkpQ/WOyu7Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oR5PeM/h; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oR5PeM/h"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-4f51c1f9372so550628e0c.2
        for <asahi@lists.linux.dev>; Thu, 15 Aug 2024 13:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723754905; x=1724359705; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UWFk8iT+QX+XvTdHdEEQEkz3sro4r7bOKwiITHQ68Hw=;
        b=oR5PeM/hjBhx2+6/Wrl/1J28HJc8pW2hc38Nct4ZrIUT6sW7DE7xrcB/gi5RlRlI2m
         ZxynQ44SwAjDSfA5FM/tDtnCUr+aUfBrEdsZ69/q4/nJ3A3SeYnsfVac+9pgqtlIUdMw
         nW0NIELBZn8kPPKdq1o13HRPoZwzsHWoaHxgG4RrJrUONE7utqGqr4UOVS4N4mVShh5k
         K2mzJYSj1U1r1rsfAtt2t7YfvA3E7uw55J1Gw/7f0uk7r0M/ytu80dM3xZTsH+U8JtAJ
         PrF8VDIDNcU1rFqsnTANnO1RYOguVjkvnhzfhnWN0ZNhd+mO0aHvdl7rgh4YdrM8Tf9e
         JqbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723754905; x=1724359705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UWFk8iT+QX+XvTdHdEEQEkz3sro4r7bOKwiITHQ68Hw=;
        b=WS6wofS6lpeSK4bPFIi1VTM0+0DWhvlbGrjb4LLt+a96z8d1XBfj0Ma0n1R8iskRdZ
         pMHXWfSI/Sa9/NDd4xFl572VS1hEsEiK0BisG0OMjr9jQHL6wZ2adVJ/ODZ2C74cyLtG
         aoTRBBa0n36wRYAe+CM+9E4bbNew9U+pT/8CqXt3Je2bB55/FcTBLfu/Hp3CPgf2mJm3
         HmLNcKFj6UueLT+sz4r2v92PtjzD3kBVO/NvLK/UeU0Ip96EbP3p7Ffj3KgL8OEWDPxY
         9WvQS4cvANy2tL+qA1ow6hrQ4ZgyaTSeb3RZKEUu8hUNVEnf1OEat6sZ97Bckz807BJO
         Rv1Q==
X-Forwarded-Encrypted: i=1; AJvYcCU20OTfNgWk0lH6vTVzZgAvXj6HFbklP9aYsVbWwujsAGNyxTUchN4gUgqG95S2PADPuYVa8K60y4F1DkPL6Fdjzy40Y08=
X-Gm-Message-State: AOJu0YwQE/kBSOGNADTsRrDRDm79r++ofxPCK9H6lFZk9VtlAbX6hh1G
	yAt6fBumG9hLAb4Nq9H8hk4X+M84F4vF+iWdhFevRCfdxZlMk+ZzdAJMmPGqjMcPVMpZ6gRAIvF
	yQWG05/e7IZH3oWw/BpWclFVt+NHCB/KH0Vw6
X-Google-Smtp-Source: AGHT+IGVnfhBG4W19/FTRIrb1hsBS75Egz6aKroeRS9ZT/fPOBGhFknbNSjR/FE1Ln68gXD8vpeEUMfZUXOrDt+XP5Q=
X-Received: by 2002:a05:6102:f12:b0:492:773e:a362 with SMTP id
 ada2fe7eead31-4977999b09cmr1311619137.25.1723754905259; Thu, 15 Aug 2024
 13:48:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com> <CA+icZUUdevE_n4+PgwisFdpxz=7XwaMciVKn+XnDHo-=UqRZ7A@mail.gmail.com>
In-Reply-To: <CA+icZUUdevE_n4+PgwisFdpxz=7XwaMciVKn+XnDHo-=UqRZ7A@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 15 Aug 2024 20:47:49 +0000
Message-ID: <CABCJKueVBE0oZuvsDGy-etK-LcK5p5RJg_CQJQnPQ8MuMpGyEg@mail.gmail.com>
Subject: Re: [PATCH v2 00/19] Implement DWARF modversions
To: sedat.dilek@gmail.com
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sedat,

On Thu, Aug 15, 2024 at 8:14=E2=80=AFPM Sedat Dilek <sedat.dilek@gmail.com>=
 wrote:
>
> so this work is on top of Linux v6.11-rc3

Correct. git format-patch also adds the base commit to the end of the
cover letter.

> can you tag it as gendwarfksyms-v2?

Sure. Here you go:

https://github.com/samitolvanen/linux/commits/gendwarfksyms-v2/

Thanks for taking a look!

Sami
