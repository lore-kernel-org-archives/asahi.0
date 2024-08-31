Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917DA2F2E
	for <asahi@lists.linux.dev>; Sat, 31 Aug 2024 00:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725062780; cv=none; b=HsdonBYVcdksgxBR+Z3pnRvKM7l8Sat3R3tSyP/edaHmXIf1SHy/B5Y9vfOGKleyAXNiLPEmUG0oCex9YXBGtFkTX8ejN9APRWK7uIJwdjE95JW816JSl6JXRI7zSxxJsLtfRA/P6+01zPcPAX7nGkU1ITZ7iSVrxVMw4sNZEOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725062780; c=relaxed/simple;
	bh=n8xcqiHEzhMcHy2TGqeuIA4zEqW0LBBlmS3A1RDmuII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RkDtcqdjFPh16TYhLw7e3eVK9+PTLJxjzh3i4D6gWxW1AbbIn3zDh3R5APWfHfy3YU6kZ/tnXRlM88k33tYs2CJuszW1XG0xUuwozs+bC6JCf7PQzJOZuQSpVaDRgBcB8BiSrwhGtupD1gIUXA4Siwrv0sv0dIDTZMQvGDBScH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2ECQ7CH2; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2ECQ7CH2"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4567fe32141so79681cf.0
        for <asahi@lists.linux.dev>; Fri, 30 Aug 2024 17:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725062777; x=1725667577; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n8xcqiHEzhMcHy2TGqeuIA4zEqW0LBBlmS3A1RDmuII=;
        b=2ECQ7CH2ERb8Ur7rZuqSggRxRMb17aYrd470HlL2R0hUZfmc+sTs280+qD8inOl7mw
         cf71zLjuHA14SpBPfef9BPvl5aWIuHSDnkzZCpa3vS7VrEsrYhdaQs5xSpjYipBFCgpj
         f1U+TL5oSFHX1YwjQfW5ooSs+FioodajLwzYTyOgFJEfcTXl3ium/4g8Kw8UjatbK4KK
         KuQDcGU+iJESmbaOJFV6jZJQL65reHpdXvC9gb6jOWdE0EJoTl+2U/0OMK+x+8yK/euf
         f2x6lvjz6LeoxD2rHtx8HetfVewUhzmkvnbDT0LTO9zK7FcqKSi56nqSMThSLSzKO1I8
         n+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725062777; x=1725667577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n8xcqiHEzhMcHy2TGqeuIA4zEqW0LBBlmS3A1RDmuII=;
        b=V02amWeEUZQcTjsTLfolCOJbMc5foyXzWCCp+Q3MzUh/jdpjlXTtZ7CUg0F9BpNi/O
         PQte1y+q1aDOf8vpgdRwBC8NpYcsHCzqbv1VXMAu2vdWjriPIzbeYEU9GnXqiSK8D1QE
         /Zy+p6XR/Y8HR8oC+Z6nD5kPS7+wgXmb0vqNgtK8pcIjNGZoF1OnKWiClxJ8BhRZPgrp
         pKlPMDVrV9pqmt7MqfwdVlUZQf6TcHnkFiCXnw1yMGdklQ9PooOAwaFnv3Jedasc2Z+m
         zFK4rDqOertePt5GA5eOm64eNeAmFHNf2PoGq6jo7dbSb9CnqPqqmosWCaazaGFj5W+s
         8O6g==
X-Forwarded-Encrypted: i=1; AJvYcCUAIh5/bWdbs+ppAlYYRpXNElC1Nj25rN/bQsdX1bltq0j7R3n07t5COEbuVMCgRjQwYyFCaw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzS/CR3rgqALfmTqLd/f4FEOc3hr8p/tfMPQSLF8CqphdiFHyX3
	xXfvPmrFK7Oq427qAeEjCzrFYgVAzyHxGukqEFJb1B4HLZjBnqVUDS5vaTL3xs29BKe+Fw4ivn2
	oo/5Zz4AdDS7jAoyHzU3xH7jfH4ZQZed9gq5U
X-Google-Smtp-Source: AGHT+IFg6NnIqNYSyCQdp+4piRmBL+jQdTn0fkJWHCEEU/fYsuOdUxONjCSJBEQ2wyGjIkWsARNyrhv7f4RZhj+2hRc=
X-Received: by 2002:ac8:5987:0:b0:447:e847:486 with SMTP id
 d75a77b69052e-457c41b4ae7mr670401cf.3.1725062777214; Fri, 30 Aug 2024
 17:06:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-37-samitolvanen@google.com> <alpine.LSU.2.21.2408301114000.1124@pobox.suse.cz>
In-Reply-To: <alpine.LSU.2.21.2408301114000.1124@pobox.suse.cz>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Sat, 31 Aug 2024 00:05:40 +0000
Message-ID: <CABCJKucCWfeC0yL6Q2ZcBfef0tMd9L_gmHRJt-cUYkg_4PDtnA@mail.gmail.com>
Subject: Re: [PATCH v2 16/19] gendwarfksyms: Add support for reserved
 structure fields
To: Miroslav Benes <mbenes@suse.cz>
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

Hi Miroslav,

On Fri, Aug 30, 2024 at 9:34=E2=80=AFAM Miroslav Benes <mbenes@suse.cz> wro=
te:
>
> yes, this is one of the approaches we use in SLES. We add kabi paddings
> to some structures in advance (see [1] as a random example) and then use
> it later if needed.
>
> It is not the only approach. Much more often we do not have a padding and
> use alignment holes ([5]), addition of a new member to the end of a
> structure ([2] or [3]) and such "tricks" ([4] for a newly fully defined
> structure).

Thanks for bringing this up! Sounds like we're also going to need a
way to completely exclude specific fields from the output then. I
think we can use a similar union approach, but instead of instructing
the tool to use another type, we can just indicate that the field
should be skipped. I'll come up with a solution for v3.

Sami
