Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D82D1E502
	for <asahi@lists.linux.dev>; Mon, 25 Nov 2024 15:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732548897; cv=none; b=eIf7Hx6Vg12HlaKd0kcPqemVAh99TP5jn8fcsmrbXUOdb162AHgCv3gUcipPQfHL02vxv1NvNwU5YQ9U8uAojVod5DX0gJhnddzOC1K2JLQbTze6+uHE1Zy0ADx8N05dssyWnCCzSA1PvmQiIeCwJo9OteLgbMEeS1TBkk3Q5B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732548897; c=relaxed/simple;
	bh=rEFJdZSwH2wd+21uchAY2/iTR59ZVMr1M18odRCoI1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B71MX8/6m4HYYFs+7DkzbsaJdNhHliOMyl+miYVolE7+2/b46E3LNUKg3eHlGKXcOtmnswH7A/hrhFK8m6NbXda2sMS628JxPWDLXFTGCDaM7tiKKm0TABnUUjziQMZrWTsF/jeWz5tvUWAs4Z5OcWSnCtm8To2v5oaEHJMMzvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TF6ReRGS; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TF6ReRGS"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d027dc53ccso12781a12.1
        for <asahi@lists.linux.dev>; Mon, 25 Nov 2024 07:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732548894; x=1733153694; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rEFJdZSwH2wd+21uchAY2/iTR59ZVMr1M18odRCoI1Q=;
        b=TF6ReRGSfq1DAqjn7Bp4H6UE+f6a5PNe1P+6RkMKjTkd2MBZS55PFcCcNdfJJhK7Fn
         GGCiBxJSgRJRptIxM19ytvCagmGHh72yChyKmNPXoo359dEwLi4dvzO9GWqqRmyIG9ZQ
         4F5Av5SVA53kkDuN/Rg2jD871N7nwyG4y4voiDYSg3ELgybCUGdMVuel4WcnKoN0MkBV
         6vkY/1oNqoSjVDuUDdV1afVWtf+s0ePKTn+kUg7w/to3qAbDiAwkp2sSN7EzG4OWl5em
         Ne5NLEVdEReRGX2K7mql3B2sHg3Nl9NNREmKVm2Jjxzan4zkTReG6cSBxZyTFvGm8vHR
         Y0zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732548894; x=1733153694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rEFJdZSwH2wd+21uchAY2/iTR59ZVMr1M18odRCoI1Q=;
        b=i/r3EPrPuSJRFRveiOeyPKjF/ETKSU9BbP4yiFLhQi+UETHTx2vhMICJfEMfHABsK3
         bH36UjWrnNLkoxpxbZLDfEbmEdFXmEs/YYYMptB50Haav6UfJtswC9LzJOCNgOzVi7/R
         ddFJ1MI35ZdTu1jhJ5QhL6553FkNbUXSDPNPELntDHCi4Q5ml31JsA770iM8tiA69/cg
         WUP/wuf812AgMz4Z0fsogmB+SuxJ6asJUeuqcPWbcTeoFW6518JO4kg7BhNSfeS+06Md
         MptkW2CnsESaNMiFow0BrPJNu9fsxCpg521XLz1ICNXZPBOn87K3n8d6SJOfNwYu1Kfu
         1OqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXikPqrT1S476OX8cISp7kjzP1EUi2JMteNHd5q38koT9kwenkzy2y1tW7cG4Is/8/BpgMKJw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzsYjcCp6ohRW5BiYLvXbhl/De8vW+j8KvSLmEzCCDYPjsH051V
	khJYqcP6YcR3KIKJ8115ui0tONu15oc/CrYAtwRIpbYFm2hp7JCAhSW+iNkyVF50jHrZYSVeyHR
	gLfUjeuHdnb9hhqti1PBuvM7v5Uyvl4MImlwA
X-Gm-Gg: ASbGncuuV1jLqXfRe2p5ZnTBWaWJEfjDnUBJZoazcoyQxdSkB+AoISGdIrpZ/wjxeyg
	EBNrspBtA9nck453ejqgg+rnjbAyi+/Pc
X-Google-Smtp-Source: AGHT+IE62Erf6kbiue7Q5RpwnMVj1FvBBMrksPcQ0CAHn5mGwDMlww3cSZdxQ5Drpgle+KMsT0aQiif1LekyY7uoXNo=
X-Received: by 2002:aa7:c504:0:b0:5d0:3dcc:16bb with SMTP id
 4fb4d7f45d1cf-5d03dcc1934mr98711a12.4.1732548893632; Mon, 25 Nov 2024
 07:34:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241121204220.2378181-20-samitolvanen@google.com>
 <CAEg-Je-h4NitWb2ErFGCOqt0KQfXuyKWLhpnNHCdRzZdxi018Q@mail.gmail.com> <CANiq72m4fea15Z0fFZauz8N2madkBJ0G7Dc094OwoajnXmROOA@mail.gmail.com>
In-Reply-To: <CANiq72m4fea15Z0fFZauz8N2madkBJ0G7Dc094OwoajnXmROOA@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 25 Nov 2024 17:34:17 +0200
Message-ID: <CABCJKudozEhZXLZVxVixsO5YuZg0nOEmgo3=vMyhcrEw+6Xo5w@mail.gmail.com>
Subject: Re: [PATCH v6 00/18] Implement DWARF modversions
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Neal Gompa <neal@gompa.dev>, Masahiro Yamada <masahiroy@kernel.org>, 
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

On Mon, Nov 25, 2024 at 4:41=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Nov 25, 2024 at 2:29=E2=80=AFPM Neal Gompa <neal@gompa.dev> wrote=
:
> >
> > As my Acked-by was removed, I'm sorry to say that there is no point
> > for me to provide feedback since it is unwanted.
> >
> > I hope it lands soon, but I also hope the people here who decided that
> > a person's efforts aren't worth recording because they don't
> > personally know them should reflect on this too. It's a good way to
> > keep people from coming into the community for the long term.
>
> Hopefully this reply helps -- apologies to anyone if I am overstepping.
>
> On one side, it is true that Acked-by is typically used by people that
> is responsible for the code one way or another, because the tag is
> meant for them to acknowledge they are OK with the change going in,
> and so I can see the argument that restricting it for that purpose
> only may help avoid confusion later on reading the log.
>
> On the other hand, someone being willing to put their name on a patch
> is very valuable, whoever they are, and whatever the tag name is.
> Moreover, it is also true that, Acked-by may be used here in a "as a
> key user downstream, this looks reasonable and satisfies our needs"
> sense.
>
> Finally, sometimes new tags are invented on the fly because there is
> no good fit, too.
>
> Either way, I don't think anyone wanted to disregard your efforts or
> to be rude to you in particular, but rather wanted to keep tags usage
> aligned to how they view them or how they use them in their subsystem.
> The Tested-by was still wanted, so I doubt their goal was to remove
> you from the log or to make you feel unwelcomed.

Thank you for putting this more eloquently than I could, Miguel. Neal,
I do appreciate your feedback, and I'm sorry if I didn't make it clear
enough in my previous emails. I would very much welcome your
Tested-by, or another suitable tag that's acceptable to both you and
Masahiro.

Sami
