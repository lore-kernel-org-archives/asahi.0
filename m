Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7106713E03E
	for <asahi@lists.linux.dev>; Tue, 19 Nov 2024 21:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732052296; cv=none; b=cPGW7Q8r3HgDmWwqhpweOHxxUt0/k8ccoTxBJ+KuZyqIyG7WUp+5kbTSbZLQVQqQm4ufFBi44Pl51A9OtMH539JoSMOuR/wg6YsxV5j2nnXUfXoi99vB3iJJ2/dvpT2nalldOQvZTHRw1bOwrDPz3PZhgRX5d7mHey4bq9AcZkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732052296; c=relaxed/simple;
	bh=Zd2QB6z5/nO/5q32zOMmJULah0pVbTKjUr9QlGKD+V4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qCNEw212/5jqy4cxSDMpzhgvgvOoVj8cz21tNFai1JWEMUWrtturruIw3E00BlSefPMHsoF6yDj5juoGjMrNkSgmSZD8+Ansci2oIPIsHYrzPqvMKSDr3hAHP4SU7dMPtH4TDaWle/AdhnuJDK/0PuWIeD0EyVDiDu+YI6f52FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=otzO70bT; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="otzO70bT"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5cfc264b8b6so16969a12.0
        for <asahi@lists.linux.dev>; Tue, 19 Nov 2024 13:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732052293; x=1732657093; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHaLTJLv2qMAaXUVhzeSonG7VLA1CIIMmtCZ7ax6TDw=;
        b=otzO70bTBTd4UHFiDcdV/ZZ7rluwLNn6v5csasLfsx/DugrHD6QyNAvgBqlX63Ko8Q
         VJBs61TYDJ+N7nEPGcsUGRYAr8n9DZVNxAXwj5TBpKP6Sw2aTfFQyE3Nr0QOtop8nP54
         oEDBkgvtdNLjevrCyjLLl7NLtwacB9GYi3jCepTcEER+CzFTtQhNKjN1z3CWWNP4hzul
         KjU1G+FB0G9WjNR9fTv41Alws+Xofm2lli7tXEOY/ud+VUetruaoC2wGpxEPD3GLHGDP
         eqOriUuWeyZWY6rpytqlOijAiq15diOCwBz8h+Drxse3IJOzW84e4eG7fsqVlpGCeqmW
         Ih+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732052293; x=1732657093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHaLTJLv2qMAaXUVhzeSonG7VLA1CIIMmtCZ7ax6TDw=;
        b=MkONPr3hM6IboNoojlxwwH93KguC1S196Gm1q/sxx2LdFjCq/f26r+nafiVCzJnOCd
         BZGzn+d1UJIOnXTBL0KUePYDBL6mnFHVxjAQsiG4UOcB4TfRAfc6dYPXCqx2yvSLbft2
         yygEaBytFwlORaY4FjD0rkV7wAEsewP/8KHivR0giMq48K76qIv6WfNtJ0QAKH3yVlEa
         Lgn72R9p8YHKY1u42Q7NrA8E6/RG+HoavTg31LMM1oHn0rhyU5rofUaRdJdNXNfrMTLG
         RAoyCwy5FgSUyareaT/JhcvHJfBS9YmU2fvw+sMuJeNWzZbpquzk9Dp13p2ampSR0t2m
         cXpw==
X-Forwarded-Encrypted: i=1; AJvYcCUeqa2YcvOi7vqCdyzEOI89UFiw4R8iKcIVOAHUI1LinBpi+v586RjQfkrDmYKEGSkiJc+Qdw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyR9j6rVlTM0kWeLlMajFuwd6YDGQ4rhyiKOd1TyrDszbGUk/r8
	5a6f8Yy7P+1jgLsMlsDdK5OquwX3R3Ylg/OK/UwOSWYBdbyFP/Ru0euVf9+QpIFvuoqPV69DjQs
	BrifeZUW+cZ0zAnqFLa3aACNF4azwTVZ0Ff2l
X-Gm-Gg: ASbGncv/ZBY8Bn2kHV83A1+r5Oy86k5JmHXTPycez7GOf0KWFdg1GkDb/A7rrWpYufJ
	l4kpVWVy1O5bim+DT1qhscEDGgm3cKe5xA3uOpTCMct8U+KvvP2cKkYfyV9sewA==
X-Google-Smtp-Source: AGHT+IEu1TvsuhTaj4Y+Akxvvr6wi40qDULQBNFY0mTnIT/+3AaCJ0gDLLAcrNpIwNcwmpaw1b+off/DTHI6qwyqUP8=
X-Received: by 2002:a05:6402:b3a:b0:5cf:f20c:bdf0 with SMTP id
 4fb4d7f45d1cf-5cff4314190mr20664a12.4.1732052292462; Tue, 19 Nov 2024
 13:38:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241030170106.1501763-21-samitolvanen@google.com>
 <20241030170106.1501763-22-samitolvanen@google.com> <CAK7LNAShVzrE6uhXxZ7HepKhmOJYsZeigq6w19jRN3OH-T_Jyg@mail.gmail.com>
 <CABCJKueVjP8V-=3Ehi4QvQzg1FZh2unyVMDzSJ_vJ_E5EE+gLg@mail.gmail.com>
 <CAK7LNARVK1ZpGXZVTAynuo7CDjgB4uT5bQzcGiWseZfaEu7Tvw@mail.gmail.com>
 <CABCJKufVpx4dsr7A44qA0ydwTEx+3Qy_OMx9Ch6OKa4nzvRj2g@mail.gmail.com> <20241119204829.GA1926309@frogsfrogsfrogs>
In-Reply-To: <20241119204829.GA1926309@frogsfrogsfrogs>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 19 Nov 2024 13:37:35 -0800
Message-ID: <CABCJKue+n2V5vua2=Hwc1SXBdkmdLBD7ac8imt5HO1bsy7s9dw@mail.gmail.com>
Subject: Re: [PATCH v5 01/19] scripts: move genksyms crc32 implementation to a
 common include
To: "Darrick J. Wong" <djwong@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Darrick,

On Tue, Nov 19, 2024 at 12:48=E2=80=AFPM Darrick J. Wong <djwong@kernel.org=
> wrote:
>
> On Mon, Nov 18, 2024 at 09:58:09PM +0000, Sami Tolvanen wrote:
> > Hi,
> >
> > On Sat, Nov 16, 2024 at 9:09=E2=80=AFAM Masahiro Yamada <masahiroy@kern=
el.org> wrote:
> > >
> > > On Thu, Nov 14, 2024 at 2:54=E2=80=AFAM Sami Tolvanen <samitolvanen@g=
oogle.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Mon, Nov 11, 2024 at 8:06=E2=80=AFPM Masahiro Yamada <masahiroy@=
kernel.org> wrote:
> > > > >
> > > > > On Thu, Oct 31, 2024 at 2:01=E2=80=AFAM Sami Tolvanen <samitolvan=
en@google.com> wrote:
> > > > > >
> > > > > > To avoid duplication between host programs, move the crc32 code=
 to a
> > > > > > shared header file.
> > > > >
> > > > >
> > > > > Only the motivation to use this long table is to keep compatibili=
ty
> > > > > between genksyms and gendwarfksyms.
> > > > > I do not think this should be exposed to other programs.
> > > > >
> > > > >
> > > > > If you avoid the code duplication, you can do
> > > > >
> > > > > // scripts/gendwarfksyms/crc.c
> > > > > #include "../genksyms/crc.c"
> > > >
> > > > Sure, that sounds reasonable. I'll change this in the next version.
> > >
> > >
> > > BTW, is it necessary to share the same crc function
> > > between genksyms and gendwarfksyms?
> > >
> > > If CONFIG_GENKSYMS and CONFIG_GENDWARFKSYMS
> > > were able to produce the same CRC, it would be a good motivation
> > > to share the same function.
> > > However, as far as I tested, gendwarfksyms generates different CRC va=
lues.
>
> crc32() is operating on different data, right?  CONFIG_GENDWARFKSYMS
> computes a crc of the DWARF data, whereas CONFIG_GENKSYMS computes a crc
> of a magic string from ... the source code, right?  Hence the crcs will
> never match?

Correct, they will never match.

> > > > > > Suggested-by: Petr Pavlu <petr.pavlu@suse.com>
> > > > > > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > > > > > Acked-by: Neal Gompa <neal@gompa.dev>
> > > > >
> > > > > Does this Ack add any value?
> > > > >
> > > > > Acked-by is meaningful only when it is given by someone who
> > > > > maintains the relevant area or has established a reputation.
> > > > >
> > > > > $ git grep "Neal Gompa"
> > > > > $ git shortlog -n -s | grep "Neal Gompa"
> > > > >      2 Neal Gompa
> > > > >
> > > > > His Ack feels more like "I like it" rather than a qualified endor=
sement.
> > > >
> > > > Like Neal explained, an Ack from a potential user of this feature
> > > > seemed relevant, but if you don't think it's meaningful, I can
> > > > certainly drop it.
> > >
> > > Tested-by is more suitable if he wants to leave something.
> >
> > Ack. Neal, I'll drop the acks from v6, but if you end up testing that
> > series, please feel free to add your Tested-by.
>
> Just my 2 cents, but it seems rude to me to *remove* an Ack from an
> existing patchset on the grounds that person doesn't appear often in the
> kernel log.  "We won't hire you for this entry level job because you
> don't have experience" etc.
>
> Also, wouldn't Neal be one of the people shepherding this change into
> distro kernels?  He seems to show up somewhat frequently in the Fedora
> and SUSE ecosystems.
>
> Is the problem here that you all think "Acked-by" isn't appropriate from
> someone who isn't a subsystem maintainer, but the kernel doesn't seem to
> have a tag for "downstream consumer of this change says they're willing
> to put their name on the line for this"?

I certainly appreciate Neal's input, but I don't have a strong opinion
about which tag is appropriate. The documentation seems to suggest
that Acked-by is _often_ used by maintainers and focuses on that use
case, but doesn't explicitly rule out other folks acking patches
either:

https://docs.kernel.org/process/submitting-patches.html#when-to-use-acked-b=
y-cc-and-co-developed-by

Perhaps Greg, or someone else with more experience with the nuances of
acking, can clarify the policy in this situation?

Sami
