Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02621B0F20
	for <asahi@lists.linux.dev>; Mon, 25 Nov 2024 14:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732545699; cv=none; b=q3mN3nao50eUgUtdOTF7vWKrxn4QpTBXSthsvaNvGxCiN4NqSBMtwoJFfTF+XuNtNqg47BGTalUfBKazazamwNZSK/RpsE35NYA5wWYnLQmfqsbsd9zMdxP10+neQReoPdiIO6AzHIiDmzy1IoLxKkiHWp8+g15K+21PTKFRuAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732545699; c=relaxed/simple;
	bh=hKchmO2WDRxCHT7Jx9boQ3vWleTZKJaMpXI2cFPNwo8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X/RFNCyK/+sKivdICuF4j8+W6Uo/wvCBoqkQiLT4WxCy3mnBzB7m3oR09PBaJwxkvf8zp25xytq07gwZAFO9hqiDWTEVrfWldUw9vwTExDnUG3ouFLF2BdV6SuCD6uR42XMOUkMJwzEzmQU2bhOIiy26j5vwDUOaHV1+6TrSUCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J4AP3w1Y; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4AP3w1Y"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ea93311724so687228a91.2
        for <asahi@lists.linux.dev>; Mon, 25 Nov 2024 06:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732545696; x=1733150496; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OyNHGDdr/bbhmu+9pKCigFAMTb5SHnCy56oapFhW6XY=;
        b=J4AP3w1YixGRelluO6WFp1Zf0fHTj3BL+LZ2K3VFoiVzqjOHmJNaHgozUFM6QgcAMH
         +6eMB699wZ4CUZg8TBivOwMpLFmdsYR1hBLu4wUf6VA6Dyexx6KUU/RGSTWlI1pZxYxh
         NlyqTrcSlDhNHGsxCVS2Gqsb/agyZcZEQef7cLDEWoODY+GZQK2rvxTBSTP2wTUDFWTa
         /9bJ7yrmCsjUbb4hwpdDxr5UIZdhIa1/JDZ9/gkGJI+ddYAdV2sHKpPQ4UO+IJTVW3Mt
         zklx7Y8jhQCkEX8J4/hnaI6rvY3p4X2aEikxiAVqkkXcAViFkRKu1RLf2ycAIhgY55S1
         3AjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732545696; x=1733150496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OyNHGDdr/bbhmu+9pKCigFAMTb5SHnCy56oapFhW6XY=;
        b=Oa0KnzKfcLKxpTBPKkX3MNaugC0AHBTdGwtcQgS8ykOR+dWoDAjnxcuooeiVlLLvg9
         JDoQoXd1tuDdaIAX21fHhDnsBhq/uyJpIL8uChezO6s6DPUOVD8eqbFAbpLMsr1Cv7ou
         jYguBIJCyHVBKDoreHjJtaeoQhjAQ4tass2TXAImetZ+6BeOftO8UHCD10/3sQIZmDsH
         0856TBWD7YlXGwdomWKCnv3+UxsGTJPFZjLRbNIynqtQfxKw8T5DVBpMmZupCHQv2JNu
         x+I9CJcdHdF9gukAX0VHTl3XrFJzlicRf4b67gosFrd8bsKO/+0HRVHWKmJu6u98TDTQ
         s2DA==
X-Forwarded-Encrypted: i=1; AJvYcCWGqIxO23CV/cA7xVvLCh7vSeWtG/onSklTDjL17BXziHZ5muhgP8LjHN5bKcXOtcn5nJ2GAw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyLtl7fruzczqiekxcoxNeqgHXLKH9iSxZ8K35MIllrYpJJRe5r
	m0JZ1F3j+sYD7b6Ur9kRBpXMnnFW5JxxKoroo6L2qxB1+8auR+GzASdcIGkZUQ2FvbbfLXyZRzQ
	/AX+0n8LIwG+Nsk/iwL3Cu+2yTCI=
X-Gm-Gg: ASbGnculic/uj5K5aC5+6tbEWSEf3rgjQMZPuVxcEVJeNAbExGWHYZcMLvrF/oCk6GK
	VW/nyG1qnTpMN8d5LwbVAbNUIoG3WA30=
X-Google-Smtp-Source: AGHT+IGUUfMqZ7Ksdh9fDCHJKZhC4rrxnKvWE7KOas6EI0MDojhpBH438SIr7nU6YUTcwPqa7tAeUT4MYakkcrTwWBw=
X-Received: by 2002:a17:90b:1d07:b0:2eb:12ee:cf0b with SMTP id
 98e67ed59e1d1-2ede7d8e536mr173275a91.1.1732545696207; Mon, 25 Nov 2024
 06:41:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241121204220.2378181-20-samitolvanen@google.com> <CAEg-Je-h4NitWb2ErFGCOqt0KQfXuyKWLhpnNHCdRzZdxi018Q@mail.gmail.com>
In-Reply-To: <CAEg-Je-h4NitWb2ErFGCOqt0KQfXuyKWLhpnNHCdRzZdxi018Q@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 25 Nov 2024 15:41:24 +0100
Message-ID: <CANiq72m4fea15Z0fFZauz8N2madkBJ0G7Dc094OwoajnXmROOA@mail.gmail.com>
Subject: Re: [PATCH v6 00/18] Implement DWARF modversions
To: Neal Gompa <neal@gompa.dev>
Cc: Sami Tolvanen <samitolvanen@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
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

On Mon, Nov 25, 2024 at 2:29=E2=80=AFPM Neal Gompa <neal@gompa.dev> wrote:
>
> As my Acked-by was removed, I'm sorry to say that there is no point
> for me to provide feedback since it is unwanted.
>
> I hope it lands soon, but I also hope the people here who decided that
> a person's efforts aren't worth recording because they don't
> personally know them should reflect on this too. It's a good way to
> keep people from coming into the community for the long term.

Hopefully this reply helps -- apologies to anyone if I am overstepping.

On one side, it is true that Acked-by is typically used by people that
is responsible for the code one way or another, because the tag is
meant for them to acknowledge they are OK with the change going in,
and so I can see the argument that restricting it for that purpose
only may help avoid confusion later on reading the log.

On the other hand, someone being willing to put their name on a patch
is very valuable, whoever they are, and whatever the tag name is.
Moreover, it is also true that, Acked-by may be used here in a "as a
key user downstream, this looks reasonable and satisfies our needs"
sense.

Finally, sometimes new tags are invented on the fly because there is
no good fit, too.

Either way, I don't think anyone wanted to disregard your efforts or
to be rude to you in particular, but rather wanted to keep tags usage
aligned to how they view them or how they use them in their subsystem.
The Tested-by was still wanted, so I doubt their goal was to remove
you from the log or to make you feel unwelcomed.

Two solutions here that could be OK for both sides:

  - Would you be OK with another tag name? For instance,
"Acked-by-User:" or similar? That may help the maintainer keep the
Acked-bys the way they prefer, yet record your own Acked-by in a
separate category.

  - Another idea that the maintainer may accept is an Acked-by with a
"# suffix" comment that clarifies the meaning in this particular case,
e.g.:

      Acked-by: Neal Gompa <neal@gompa.dev> # As primary consumer
(Fedora Asahi kernel maintainer).

Cheers,
Miguel
