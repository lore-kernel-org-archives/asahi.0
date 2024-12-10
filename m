Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3216A1A0BE3
	for <asahi@lists.linux.dev>; Tue, 10 Dec 2024 12:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733834551; cv=none; b=jcA6wZ70J1mpQXOOlNNg8dArOSdgUYR/HK7PaRGFwLAamp2KO8FQOxNlR4T8WuVRraWNedW3PLuoWM3RfCezUG6iBHYOohTnmhR5tNXiX2hzrO538HwoHJtvciUEEEJgKAy4mDMWnfsfKxYAX4PaccmejxFifjOagJCturVGDv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733834551; c=relaxed/simple;
	bh=wPIrwF3e71i18xK6VAGqAKif4VNxMP81ypBpG4hr5VA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jCYYMe6mQXc43ieJjeQuF6k5iLmkpr6Jkbik9xOHZ+0JBl3z+4O7uGPTixVRvxzNb+JOxZOS4gIlMOr75tZHw0AvnzSCNhOYysnhajus9TOX3FjFT9ImTDmu4dPqsjIW5OatHE4Api5S1DRPW8p0ESBEc0CZhkSGaG3IrRFOgeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d3bbb0f09dso5728907a12.2
        for <asahi@lists.linux.dev>; Tue, 10 Dec 2024 04:42:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733834547; x=1734439347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wPIrwF3e71i18xK6VAGqAKif4VNxMP81ypBpG4hr5VA=;
        b=W47f8h+vv2Hjr9As6voDPQxeJzQmAzNoweG9ozG5OHnV/9DgP8RVmiWOYEkG+oenAh
         EWI8WPhz46IEtfrpYX7MR/Mh5GLCzDIJ9DD2PUgMHaoKGDa+Ttsztu3W6zppicmtsuy2
         K0y0D/9qbVv4JZ2ThPDT6MssSGUfdrP9SXGhlVuqTdMsK4NNpzpqz1AJdXkqkEM1vh7c
         ZN+9TGW203di+tPpnz1yqiBM5pO+H8rNCcJ/6pwwCZaMMnN+0LkeJxIW/5xfsoUno1Ko
         qaIvd1xHzBN8niDpNr7GhkifVTu9nxlwqIZA+Fy/dL3tmJ1rSE/S91gWS3CPlJyMsQ2C
         srfA==
X-Forwarded-Encrypted: i=1; AJvYcCU9lY84S6OyXVzcQFeCjtVooRHVzVokqYC2C5TjjSXGDWekHae1Sb4HbYiqUamvKzgo6IYQTQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzd2DR5afR8pUTPlaJ8Sw4oEplCpNXfZ+J5BLS8BcBs+f9gXB0e
	4EEpleg0GykvMs0ChfROnFJMAP3SalfEG7VlOeIIsHEuA5kfKJ/+/uEweRHuAUk=
X-Gm-Gg: ASbGncvjRXtTTUqKP69+VvLNkxX9/CeNZp1068i6t6kcCJELWHVn8Y60n7gtPO6LBWI
	5r8pl4zdBG5CXltYLnO9xgLp9Ot6uALgJN56n+SGuOsFMtbevPOj4iWVc538TlhuGH2kUy81ucf
	c82ICgIHkARsSfWZMp5IfUfF6viCsUdikUwY7zq8nDC+xadjeMZDCaAA3duwZJPJh0Z9DR17u0u
	+B7qSNL5pAj4pKwx/Xjv+j63FxN83DpBfsXfx65NfAna/4e7oBzW0BNJ/kQRQDkghwVyGNSrH7I
	Ls17fUfq
X-Google-Smtp-Source: AGHT+IFnnVoY9lkJ9VERKf5HihLDD+yqWxV8ix/UfQTtKJkLOJhaAcQ054gYa6rQ2M/EKb2czz4jiQ==
X-Received: by 2002:a17:906:cc2:b0:aa5:27d4:980a with SMTP id a640c23a62f3a-aa63a242b13mr1456764266b.49.1733834546692;
        Tue, 10 Dec 2024 04:42:26 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa690d82234sm253080966b.91.2024.12.10.04.42.25
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 04:42:25 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aa68b513abcso358044666b.0
        for <asahi@lists.linux.dev>; Tue, 10 Dec 2024 04:42:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUrY5ge81rqPjtPfQqXib2di1J6PuGN4T6/m0nxBGDVkHE7uMGtf9ib6tmLEkY+5vigVPd4Eg==@lists.linux.dev
X-Received: by 2002:a17:907:9548:b0:aa6:61b7:938f with SMTP id
 a640c23a62f3a-aa661b794bbmr1006237866b.6.1733834545197; Tue, 10 Dec 2024
 04:42:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241121204220.2378181-20-samitolvanen@google.com>
 <CAEg-Je-h4NitWb2ErFGCOqt0KQfXuyKWLhpnNHCdRzZdxi018Q@mail.gmail.com>
 <CANiq72m4fea15Z0fFZauz8N2madkBJ0G7Dc094OwoajnXmROOA@mail.gmail.com> <CABCJKudozEhZXLZVxVixsO5YuZg0nOEmgo3=vMyhcrEw+6Xo5w@mail.gmail.com>
In-Reply-To: <CABCJKudozEhZXLZVxVixsO5YuZg0nOEmgo3=vMyhcrEw+6Xo5w@mail.gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Tue, 10 Dec 2024 07:41:48 -0500
X-Gmail-Original-Message-ID: <CAEg-Je-58WxKXOFEDBWmZDpt8E+SaRq+kK7ZnfMER2qtnKUD=w@mail.gmail.com>
Message-ID: <CAEg-Je-58WxKXOFEDBWmZDpt8E+SaRq+kK7ZnfMER2qtnKUD=w@mail.gmail.com>
Subject: Re: [PATCH v6 00/18] Implement DWARF modversions
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	"Darrick J. Wong" <djwong@kernel.org>, Donald Zickus <dzickus@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2024 at 10:34=E2=80=AFAM Sami Tolvanen <samitolvanen@google=
.com> wrote:
>
> On Mon, Nov 25, 2024 at 4:41=E2=80=AFPM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > On Mon, Nov 25, 2024 at 2:29=E2=80=AFPM Neal Gompa <neal@gompa.dev> wro=
te:
> > >
> > > As my Acked-by was removed, I'm sorry to say that there is no point
> > > for me to provide feedback since it is unwanted.
> > >
> > > I hope it lands soon, but I also hope the people here who decided tha=
t
> > > a person's efforts aren't worth recording because they don't
> > > personally know them should reflect on this too. It's a good way to
> > > keep people from coming into the community for the long term.
> >
> > Hopefully this reply helps -- apologies to anyone if I am overstepping.
> >
> > On one side, it is true that Acked-by is typically used by people that
> > is responsible for the code one way or another, because the tag is
> > meant for them to acknowledge they are OK with the change going in,
> > and so I can see the argument that restricting it for that purpose
> > only may help avoid confusion later on reading the log.
> >
> > On the other hand, someone being willing to put their name on a patch
> > is very valuable, whoever they are, and whatever the tag name is.
> > Moreover, it is also true that, Acked-by may be used here in a "as a
> > key user downstream, this looks reasonable and satisfies our needs"
> > sense.
> >
> > Finally, sometimes new tags are invented on the fly because there is
> > no good fit, too.
> >
> > Either way, I don't think anyone wanted to disregard your efforts or
> > to be rude to you in particular, but rather wanted to keep tags usage
> > aligned to how they view them or how they use them in their subsystem.
> > The Tested-by was still wanted, so I doubt their goal was to remove
> > you from the log or to make you feel unwelcomed.
>
> Thank you for putting this more eloquently than I could, Miguel. Neal,
> I do appreciate your feedback, and I'm sorry if I didn't make it clear
> enough in my previous emails. I would very much welcome your
> Tested-by, or another suitable tag that's acceptable to both you and
> Masahiro.
>

Honestly, I don't think it's worth it if my tag is going to be
stripped simply because someone thinks I'm "unqualified". If you want
more people participating in these things, doing stuff like that is
definitely not the way to do it. It's not like people haven't had a
chance to know me or even just look me up to know I'm not just blowing
smoke. I definitely feel like I'm being disregarded. :(

The sole reason I didn't give a Reviewed-by or Tested-by is that I
didn't want to do any integration work to validate it beyond the
basics, which would have meant dipping into the Red Hat kernel symbol
tracking infrastructure. I don't have time for that right now. If
someone else does, they can be my guest. I just don't feel comfortable
giving either without *actually* going that far.



--
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
