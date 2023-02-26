Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62E82560
	for <asahi@lists.linux.dev>; Sun, 26 Feb 2023 13:40:56 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-536c2a1cc07so107716597b3.5
        for <asahi@lists.linux.dev>; Sun, 26 Feb 2023 05:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=diOfltNJgTI4QcRIe1q5nwxDa2bShFvMq96Z1v8BgWA=;
        b=AkKeoB145HYWoRCQ1yjWXsdzeVkE0qiJz+4wKixkI7Ch6xKzh514t0xHZDjJKGzLoI
         qVn8ZyKf42a3Eg2B6XGEcwhmVuSl5kESZASUYfaehA223i7MXVbw1LvKvD/cJI8pg8kl
         8yh5br1o5/m8vqycAV/nIdSyOlmAlJ+KYprfo1ES02EFLF5ue0wz1gZW1jYH4CfHf2qL
         PO8UJab3vCXRQbA5MraSbP5Duc3difhxsoKMK5YQKsBQ57L6hQZVXi8xw0fM7VFJcMlJ
         A7yQ9COhtbl6qv5otPnWR6LKcvjrgx8aFrvrp5aO4SM7yzIJMLvmz8q4M5sc3lbjlEJd
         mSxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=diOfltNJgTI4QcRIe1q5nwxDa2bShFvMq96Z1v8BgWA=;
        b=sO0u/5QcTsSl1EaVG9N84wmzAow13XvyUtWkKuPeju7PZXxsa+a8dBL+LciRz0jVe/
         rBDuwtXXdnjrx/7Fm4jPS41MivTQB8FYhJ0yKNHPt02m5pKFTHhmiHNkCWVz/ueXX5WV
         WcXcuKM7a3B60rUwSqh2JJwIzAgBQYOJlp0OjK+xWoRu5V1ZBK4HHr2TbOdBtSQJpQpB
         z4xhIJC3iVfWpdeOD2arolc4t/6U7clJFWObI1EZrjBWNuyM8m3KtIVN6DkEld9ZuztB
         D9ISgJUK+hfIsZ/l1YOcV2SrEjTAISwHsvfkvXHPxRlsQdy4wWSUltUBMurusu8of4Yc
         NEzw==
X-Gm-Message-State: AO0yUKUIr40l3jVxibwfFUx6Lacgv0IvL6kh0kFlSD14DoCVCtoQKdMu
	2M0WFBGVGTeUCmsL4BRB4n53GMA7QuF0LMA9PmI=
X-Google-Smtp-Source: AK7set9rUznC6grtBh19Slp4e0aFAnHCKuGHYtL6QNpch43NKKm67TVU8yIkH3O4rF9oICebvIigo/oap6HR9vL20lE=
X-Received: by 2002:a81:ad10:0:b0:52e:bb2d:2841 with SMTP id
 l16-20020a81ad10000000b0052ebb2d2841mr8063756ywh.10.1677418855775; Sun, 26
 Feb 2023 05:40:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230224-rust-error-v1-0-f8f9a9a87303@asahilina.net>
 <20230224-rust-error-v1-5-f8f9a9a87303@asahilina.net> <Y/lOlcSpc+d9ytq/@boqun-archlinux>
 <20230225222340.34d749ee.gary@garyguo.net> <Y/rCU1S+GDgIojNf@boqun-archlinux>
In-Reply-To: <Y/rCU1S+GDgIojNf@boqun-archlinux>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 26 Feb 2023 14:40:44 +0100
Message-ID: <CANiq72m8jmW0WEmscR3+C2aiL+FCzYZXj2SrfruCu4UB98ZCYg@mail.gmail.com>
Subject: Re: [PATCH 5/5] rust: error: Add from_kernel_result!() macro
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, Asahi Lina <lina@asahilina.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Sven Van Asbroeck <thesven73@gmail.com>, Fox Chen <foxhlchen@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 26, 2023 at 3:22=E2=80=AFAM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> Hmm.. looks like the `?` only "propagating them (the errors) to the
> calling *function*":
>
>         https://doc.rust-lang.org/reference/expressions/operator-expr.htm=
l#the-question-mark-operator
>
> , so this doesn't work as we expect:
>
>         https://play.rust-lang.org/?version=3Dstable&mode=3Ddebug&edition=
=3D2021&gist=3D64c9039e1da2c436f9f4f5ea46e97e90
>
> Hope I didn't miss something subtle here..

There is `feature(try_blocks)` [1] for that:

    https://play.rust-lang.org/?version=3Dnightly&mode=3Ddebug&edition=3D20=
21&gist=3D8f40663d2ad51e04a13f2da5c4580fc0

[1] https://github.com/rust-lang/rust/issues/31436.

Cheers,
Miguel
