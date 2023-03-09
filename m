Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D2DC284
	for <asahi@lists.linux.dev>; Thu,  9 Mar 2023 19:43:34 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-536bbe5f888so54516567b3.8
        for <asahi@lists.linux.dev>; Thu, 09 Mar 2023 11:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678391013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6fzFppmaiKwMNk0er/cwV+CNdXpU1VQrp0ms6icnzwQ=;
        b=farO1s2lLl1ZzC6+RaeHAywmVA8pH4+eSu+hQdD9EidYgOA19kAR9fKQcenYXFpJEq
         i3MfPhRQbdfjbJTQNjLTZ0oX0aCm2mbIAAtrCThMHktDEX0e9oq48nI4jJIUkTh2fFHZ
         npOLUp8J03k2yH2COT7eGF0K/b5oC4cSgl4AfERUion2pEb0Eg7V3CnryJnZK9Eji6Tp
         IRJRVRWutXbyz0xigxp8gKjteJPNIxdjp4OEYTCq98VHw2XoJMDQg3w3JzBR83IDH3ZK
         GlxUQ43zw/o2/dxlmiQMsf0BvLP/SsY3Py1MMc9t2nQZReVfbYfCkw7knA5L6D43CQkw
         CD6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678391013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6fzFppmaiKwMNk0er/cwV+CNdXpU1VQrp0ms6icnzwQ=;
        b=i2uHjuIbN9EOiNI/gyjlcyjBIV45LZw+fWaUKzZ0GFzbKPrgWqbZeSM2RxtBmnQSHb
         pMMPcChy8tg7jp2nZCNmsEIeEKgNN6/Ves7P8IBbLMYT7b9Gzflk5hqzW3dmm+W2xvPz
         8CofgNHloD7C9DnfuSrX9CpttXfy6kz9s0gaI8OwZ1l7SCM8fswVe0VokSMVcvGS9G9+
         NsF+gqSAsGAF/7PSn3FodxnU2XHMNAxMPVp96+gN+1ADAfwlpD9I4LoQg+Hae4VKg6My
         dImA6Xm3NEmLLxGIK/SWlp4fRhGibcXHXJK4Nvzr/TyLLn38fvcYPHkSpDWNLJlafREj
         +2BQ==
X-Gm-Message-State: AO0yUKVkfPjS4VTd3m2O9hUDTGySDEADTsJuFO1qw07EcHxohaT7z2RS
	Oyxkg4lVNCPODZC2YBSxbktcDevurPrpn470pL4=
X-Google-Smtp-Source: AK7set81OVQ0jMTTm9Fysqt7xMJGFBdLCoTZwS68fmOf8B+wf3hflmeCwvASOIQ5OHY6uzAabYbB+3iLzPcgyJVe8l4=
X-Received: by 2002:a81:a983:0:b0:52e:e095:d840 with SMTP id
 g125-20020a81a983000000b0052ee095d840mr15226417ywh.0.1678391013537; Thu, 09
 Mar 2023 11:43:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230224-rust-iopt-rtkit-v1-0-49ced3391295@asahilina.net>
 <20230224-rust-iopt-rtkit-v1-5-49ced3391295@asahilina.net>
 <Y/idMBIOfFZxXnVM@kroah.com> <CANeycqoHwp3URSPGvnNZx+9PdbC90UVFWLwg4w=JBHQnjnGUPA@mail.gmail.com>
 <ZAnB/DozWsir1cIE@kroah.com> <CANeycqrtjKMfpae_DUp-VrDZugJVO7mcbBvUBB+zAc=E6aU4tw@mail.gmail.com>
 <ZAoTNlF+bHyyGs7x@kroah.com>
In-Reply-To: <ZAoTNlF+bHyyGs7x@kroah.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 9 Mar 2023 20:43:22 +0100
Message-ID: <CANiq72nkqu+o5QvmLKvk82rJ6b6O2KdC-iYq9zFZFwVyf_Fv9A@mail.gmail.com>
Subject: Re: [PATCH 5/5] rust: device: Add a stub abstraction for devices
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, Asahi Lina <lina@asahilina.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, Arnd Bergmann <arnd@arndb.de>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 9, 2023 at 6:11=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> I don't understand, why do you need both of these?  Why can't one just
> do?  Why would you need one without the other?  I would think that
> "Device" and "RawDevice" here would be the same thing, that is a way to
> refer to a "larger" underlying struct device memory chunk in a way that
> can be passed around without knowing, or caring, what the "real" device
> type is.
>
> That sounds like a question, and would return a boolean, not a structure =
:)
>
> I don't really understand that, sorry.

To complement what Wedson wrote, perhaps this helps a bit, since there
are a few `*Device` things around (I will prefix things with the
module they are in for clarity):

  - `device::RawDevice` is a trait, not a struct. This means it is
just an interface/property/tag/feature. Then types (like structs) can
say "I support/provide/implement this trait". In this case, it
requires those types implementing `device::RawDevice` to provide a
suitable `raw_device()` method.

  - Then, you have `device::Device`. This is an actual struct,
containing a `struct device *`. It implements `device::RawDevice`, by
returning the pointer.

  - Then there are others like `platform::Device` or `amba::Device`.
They are also structs, containing e.g. `struct platform_device *` or
anything they may need. They implement `device::RawDevice` too if it
makes sense, say, by returning a pointer to the `->dev` in their C
struct.

So you have two different kinds of entities here. One is the trait,
and the others are structs that promise to implement that trait
correctly, regardless of how each struct manages to do it.

The trait can also then provide extra default functionality for those
that have implemented it. For instance, the `clk_get()` method Wedson
mentioned can be defined in the trait, and in its body we can call the
`raw_device()` to do so. `raw_device()` is available because we are
inside the trait, even if each struct implementing the trait provides
a different implementation.

Traits are sometimes named after the "main" method they contain, e.g.
`ToString` may be a trait with a `to_string()` method. Here
`device::RawDevice` has a `raw_device()` method, so it makes sense in
that way.

Wedson was suggesting `device::IsDevice` as an alternative, because
`device::Device` is taken for the ref-counted device. Of course, other
arrangements of names could be possible.

`IsDevice` uses Pascal case, so by convention it would be fairly clear
that it would not be a function returning a boolean. But one may
expect that it is a trait that implements a `is_device()` method,
though. (And if that was the case, which it isn't, one could then
indeed expect that such a method would return the boolean you
expected).

Cheers,
Miguel
