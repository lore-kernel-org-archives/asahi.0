Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E7D7FC
	for <asahi@lists.linux.dev>; Wed,  5 Apr 2023 12:32:24 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id p15so42271907ybl.9
        for <asahi@lists.linux.dev>; Wed, 05 Apr 2023 05:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680697943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQcMbra2CgBD1rOvxGpRVnkzaGjn0KHujzI1BY777uY=;
        b=MkV5dExLiNqHfiYmWMuvch56083VrvbatouYUkL58SSm+WrMUvsdZSE3XxB3d8jeJf
         EK33MHkqG3MELcpSeqXzpH2whK3o8Lmx0GixFiv1YWYv+7tRaeIgngnfWuJ/dlYntL3q
         5EMAWmxeenJFRgI1bH3bR+6XbKuOpqI4Hockj/fOTVKrWkTCss31mmnSsukYKg1k+IqN
         OkLaehmee/JjhR7r8W8jnPHDsXhFzcqjzFr6Z2qWPssKR8xHf9IYTgj2dDtB5ES4viLg
         7lFMhaiKVbLFTNAbOFF+3ByTplR68WQgItjc+07KNEyaqeeqNZwZ4frv2WtLxz60hAz8
         3V2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680697943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SQcMbra2CgBD1rOvxGpRVnkzaGjn0KHujzI1BY777uY=;
        b=e3Hlsj2dEQ7d18hQkCdvyYaCO1nh43sVZ/K2dEpwYxCdhlBRehjcrzTOI9RAOLBOPm
         io3PRnWz4hCJjXfvQz7RBM8FpwmUY0tcWHUOaUX/STg1MBLTmW2/22SMGdjewgcZ8ycH
         PNUQcFk4DDEC1j4OV0QlKQyRX+byrEpF4nqzdjwEyutmfLtX6G7ypOJf9S9mkEhq/30q
         Aj2ngSmCwxu7+nScdLnBd1LYQJeJ0ZiD0UZhn0gAhVSuXJcZlu2qW/bGxPVKjSyMcyH3
         EfQ6TJ482Oqbm/xnCeXSVe+By8VXpEXWSlaH7Fqh55Kf0G9i7Ro1Dt1jfC5tPJ9VRlgO
         9A8Q==
X-Gm-Message-State: AAQBX9eKhsCWFiOc0ykr42wvnHNG0nLJU1wv256iIOrpCjN595cGslzS
	EgLkQBAkNu0qwry6WiUEZil62CB2PLVpXMKsRtM=
X-Google-Smtp-Source: AKy350aMnNZlfVQMcWZwmVtFWd+CgIw1TUjVeCFV7ElU/MTu09D8SpK7RVipDHvOLoDOmHM2e3Wga5qC1FlXouLi1XY=
X-Received: by 2002:a25:774d:0:b0:b80:2bf9:2f78 with SMTP id
 s74-20020a25774d000000b00b802bf92f78mr4111595ybc.11.1680697943516; Wed, 05
 Apr 2023 05:32:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-4-917ff5bc80a8@asahilina.net> <ZC1WwJDr1iqSQnYs@phenom.ffwll.local>
 <CANiq72=h9qKrpkY2K962__rs-JLsmWxPXocx040ZeDSKGf_Brw@mail.gmail.com> <ZC1aEZpgZLkq8xTv@phenom.ffwll.local>
In-Reply-To: <ZC1aEZpgZLkq8xTv@phenom.ffwll.local>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 5 Apr 2023 14:32:12 +0200
Message-ID: <CANiq72=hoVw566orbDYcJyw2+SFfxpR1rdJVbbR3kkrjJUASww@mail.gmail.com>
Subject: Re: [PATCH RFC 04/18] rust: drm: gem: Add GEM object abstraction
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Asahi Lina <lina@asahilina.net>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Luben Tuikov <luben.tuikov@amd.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Karol Herbst <kherbst@redhat.com>, Ella Stanforth <ella@iglunix.org>, 
	Faith Ekstrand <faith.ekstrand@collabora.com>, Mary <mary@mary.zone>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-sgx@vger.kernel.org, 
	asahi@lists.linux.dev
Cc: Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 5, 2023 at 1:23=E2=80=AFPM Daniel Vetter <daniel@ffwll.ch> wrot=
e:
>
> Ok if this is just interim I think it's fine. Would still be good to have
> the MAINTAINERS entry though even just to cover the interim state. Least
> because I'm assuming that when things are split up you'd still want to
> keep the rust list on cc for the rust parts, even when they move into
> subsystems?

Sorry, I missed to reply the second part of your email -- replying here.

Currently, the subsystem's code is under `rust/` (though modules can
go already into other folders). One of the reasons was technical
simplicity, and a nice side effect is that we could bootstrap things
while getting C maintainers involved over time.

To accomplish that, the guidelines for contributing Rust code are that
the respective maintainers need to be at least Cc'd, even if the files
do not hit the `F:` fields for the time being -- see [1]. But, for us,
ideally, the maintainers will take the changes through their tree,
instead of going through the Rust one, since that is the end goal.

And, of course, if you already want to have `F:` fields for the Rust
code, that is even better! (Whether those should be in the same entry
or in a new one, it is up to you, of course, and whether it is a
different set of people / level of support / etc.)

Then, when the `kernel` crate split happens, we can move the code
directly under whatever folders it should be naturally, when their
maintainers are ready. For some subsystems, that may mean they do not
need any `F:` fields since they are already covered (e.g. if they did
not create a new entry for Rust code only). And for cases like yours,
where you already had `F:` fields, it means the move of the files can
be done right away as soon as the split happens.

In short, we would definitely welcome if you add `F:` fields already
(whether in existing or new entries) -- it would mean you are ahead of
the curve! :)

As for the mailing list, yes, for the time being, I ask that all
changes to please be sent to the Rust list, so that everybody that
wants to follow the Rust progress has everything in a single place, so
that we try to remain consistent in the beginning on e.g. coding
guidelines, so that Rust reviewers can help spot mistakes, and so on
and so forth.

But, as Rust grows in the kernel, as systems become non-experimental,
and as maintainers take ownership of the code, that should eventually
go away and let things be as usual with C code. Then the Rust
subsystem (and its list) will become smaller, and it will be the
subsystem (and the discussion place) for anything not covered by other
subsystems, such as core Rust abstractions and types, Rust
infrastructure and so on.

How does that sound?

[1] https://rust-for-linux.com/contributing#the-rust-subsystem (I may
reorganize this to be Rust's `P:` field, by the way)

Cheers,
Miguel
