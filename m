Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EED13D278
	for <asahi@lists.linux.dev>; Thu, 12 Sep 2024 16:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726157220; cv=none; b=Rbu9+osl2auGZNlrUfUSZtdWOqRkWLClT+HHI82kw6QlgEtAPw2GdvmspSzcmJniexGcJm8mqBEIfJTtas9fc7mKZ9mUKLc4ChwjjLDqQKlCcCF+izKKuyc781bZxyTtzeP758ntH1oPCxhg3AVHxAgiEqmL3ps2/iXXRbBpSyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726157220; c=relaxed/simple;
	bh=IT1o82vxgKP1FGlb30UH98pNclOmxQrMnkN0OFaimUc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R7m/wXWMuoAIrY7/D3XPeXF7heXpghEG/bYzq2g0pySPfHKht67woog/cbG0tmIewm8yCkLvRrUPu/SgO63Xls7DNTA3qd30kym0sjuFJHWD6RujeGwsmzoZ2FCysXEyMBhRGozLaLhFb1sq8vXDF3EmLCHc4zOCX8TRP45JUJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fSbbSfxR; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fSbbSfxR"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4582a5b495cso249801cf.1
        for <asahi@lists.linux.dev>; Thu, 12 Sep 2024 09:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726157218; x=1726762018; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=omr6m6gliwPRufxamwdCTWNYYmJ3FITHC3JRHgUinPo=;
        b=fSbbSfxROrrU1XPQJjKlixOfEGQIi/SQE3x+h/GwGNFrQtZ7fKMQiXU529MPeIQ8B0
         ylrmFZl44acTLneCUdDIeyEHFv2NS8edqI+iMj4UTuMMxdCE5Wj5FMXsFDosOqZZRqAx
         N4ZVt7jfCnm5nzQaA4l1BcVnLkF2lfUmvYWEKzYeeNRCjJlBFb3cd7SI7vj6FYlglEQS
         8XGr++QeWpKDJJF48GeG6JyKgX+FYXZxqhL8UIoLFDERMfiP0CM35mlodlZ2GQAS8k77
         vHbb2knaUCaET99aAGTHQeoP0eQOddBCSYlJmCIXjwy1XkE2z/895sxkqjl08mP9ooIv
         ZAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726157218; x=1726762018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=omr6m6gliwPRufxamwdCTWNYYmJ3FITHC3JRHgUinPo=;
        b=Vh5TzlBYoVRoDASDbLfqwXsTOCYQhtFwJ+VqFQ3kR5GimMFYJNA6w7boi4DXfxXBM+
         oFLxIBtWB5kWIKuK0zQmrLH7yjzZBgmWmvsl+QCNtP1UmsabZ2sZurzV9twJGwcnKN6n
         0atSf/z8jMWjAfb/L3Nl2PtUKrqMAsmT3rHTMrTB+qSMUDJVa1Fl6U2MnX7/msKL38g5
         5cfZow6pymIUCLdwq5cDhNH5cSxzvQWldm6TaJxh+i7XNoFu5m0WxU+FrFCgB38tLUrT
         plD1B9NlPZSJOEApagM5iugsZjfDDN0dy+bf7SyFvtvnruuSi/jeQ90s7oJ4andvboQ+
         9h2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW9dLyMdx4A4uT88woI22ggmSUrhvQ5MWab2+/VI5fUEaJmps3NVMyTlwZBSzHtXnqJr6KzgA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxDn2MjZ/OnZ1eYIH42Xsa1w1VFeHOSm1gqRALod+SK/Sdsnrdr
	3hDiigGyKUCIltaSVf/ndZ+8QfiePkDuty9FRUqbi/qcJ5YBSeM+8/0fGVsARWeTCsa2B9PQuUh
	BPZA4RaGlLkp1R5Zn+SqX6oNXY7xlfxVcGjsX
X-Google-Smtp-Source: AGHT+IGOGPADRaVpGoTSHr0PDggkgl8HZXldTfXyU/ZgwZHpTw+qG9d8tMyjvXLDA0IIjRFc4gXxPJ5tunVOQkpfzMo=
X-Received: by 2002:a05:622a:198b:b0:447:e0a6:9163 with SMTP id
 d75a77b69052e-458607b265amr3217081cf.14.1726157217773; Thu, 12 Sep 2024
 09:06:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-37-samitolvanen@google.com> <alpine.LSU.2.21.2408301114000.1124@pobox.suse.cz>
 <CABCJKucCWfeC0yL6Q2ZcBfef0tMd9L_gmHRJt-cUYkg_4PDtnA@mail.gmail.com> <599892ec-3cf5-4349-984b-7c94f2ba5687@suse.com>
In-Reply-To: <599892ec-3cf5-4349-984b-7c94f2ba5687@suse.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 12 Sep 2024 09:06:19 -0700
Message-ID: <CABCJKuer=O3FnLJNGMg2+-HxFJFUrccTuuHt5OiMpRsAJBvBsg@mail.gmail.com>
Subject: Re: [PATCH v2 16/19] gendwarfksyms: Add support for reserved
 structure fields
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Miroslav Benes <mbenes@suse.cz>, Masahiro Yamada <masahiroy@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 4:43=E2=80=AFAM Petr Pavlu <petr.pavlu@suse.com> wr=
ote:
>
> On 8/31/24 02:05, Sami Tolvanen wrote:
> > On Fri, Aug 30, 2024 at 9:34=E2=80=AFAM Miroslav Benes <mbenes@suse.cz>=
 wrote:
> >>
> >> yes, this is one of the approaches we use in SLES. We add kabi padding=
s
> >> to some structures in advance (see [1] as a random example) and then u=
se
> >> it later if needed.
> >>
> >> It is not the only approach. Much more often we do not have a padding =
and
> >> use alignment holes ([5]), addition of a new member to the end of a
> >> structure ([2] or [3]) and such "tricks" ([4] for a newly fully define=
d
> >> structure).
> >
> > Thanks for bringing this up! Sounds like we're also going to need a
> > way to completely exclude specific fields from the output then. I
> > think we can use a similar union approach, but instead of instructing
> > the tool to use another type, we can just indicate that the field
> > should be skipped. I'll come up with a solution for v3.
>
> It might have been mentioned previously, not sure, but one more case to
> consider is handling of enum declarations. New enumerators can be
> typically added without breaking ABI, e.g. 'enum E { OLD1, OLD2, NEW }'.
> It would be then great to have some ability to hide them from
> gendwarfksyms.
>
> I think neither of the __kabi_reserved or __gendwarfksyms_declonly
> mechanism can currently help with that.

I thought about this a bit and I wonder if we need a separate
mechanism for that, or is it sufficient to just #define any additional
hidden values you want to add instead of including them in the enum?

  enum e {
      A,
      B,
  #define C (B + 1)
  #define D (C + 1)
  };

Do you see any issues with this approach? I think Clang would complain
about this with -Wassign-enum, but I'm not sure if we even enable that
in the kernel, and as long as you don't overflow the underlying type,
which is a requirement for not breaking the ABI anyway, it should be
fine.

Sami
