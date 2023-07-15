Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE32915B8
	for <asahi@lists.linux.dev>; Sat, 15 Jul 2023 16:59:22 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-577412111f0so30671007b3.0
        for <asahi@lists.linux.dev>; Sat, 15 Jul 2023 09:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689440362; x=1692032362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vkwKqDqMbkOtqWw6yFwVR4kegIXKrWTAIScvGbyU1jU=;
        b=BnKtNdjVlvkMnku5NkPqRILy+GJTt9XtV71MlRnY3ZMlwG5fiLUlDNQlF7nbqEiJEM
         q2TNWePtkNf5MhwNDRwwl/3xmlm14pxsZpxMF/GhxrKb6Y359fXbfzSPsJVF3L+T3oSG
         GllIfhQLKJv9UNrPePC3oJD06D3edmunbmpTnBFlY+3KJMF9Cmi/gbb3Gx2cMQGtg1oL
         rxKwYNloi7wy/QAEynPlaPL8GKTnjWWwT78oB8wADtEqITLdzd6wr27/WnyfFIwsSkLv
         PEezrz6/PaWc77cuKb1O4Tazs8YURv0UJvMSYmdT0H7p/dHpYQ6ZtohUyGYjzTTxuOGm
         C+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689440362; x=1692032362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vkwKqDqMbkOtqWw6yFwVR4kegIXKrWTAIScvGbyU1jU=;
        b=K4c6RXInT5yu0TDho2TymLu2mAm24qPtOMrOtMGdFO2zAJcceRz8GidbM1Weblv1Ub
         HPP8LDnBTY6j87lftp2i0NW1ylk4MwKrGX6869t2hjuLJsUDWwtAU1QnaPn+1KOnsBX+
         DKBw5EjY+irwMISvWbGOYg7iCojgLGu6yvocFHEtN9D4bbnyF+/bHejdVcCaRx9CgZLL
         yGQrYhUcDbAGaxmWsoiJ+ZNOQ4aV0deuB7gkmktnakqrc2t4L0mTixCzMR0JljJsjCIP
         /1KZmZrFCkW7PrMzVlAm4dH3FFOmJ5tTfae5bUvz22jL61V7dAKJFfXo+XOIbcGPaJnO
         VfCg==
X-Gm-Message-State: ABy/qLaXI8vIhysUjr1+kfaZOrDI7ZKdoj3Y0VwTfPqV3B3LIxNvZGG9
	m2PVNPWhm9uhZy1AC0zj0HPo2pUJlCbM3fGqs1s=
X-Google-Smtp-Source: APBJJlFVGtaUmqAi43kd066x0bqQrwFhsufRYqWIwN/DGWquGg6EhdjPi0kmVIJV959ppuVAmflb+rDlM2qkbVsu9Zk=
X-Received: by 2002:a81:6306:0:b0:57a:3dd8:1038 with SMTP id
 x6-20020a816306000000b0057a3dd81038mr10194872ywb.12.1689440361767; Sat, 15
 Jul 2023 09:59:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230714-rust-time-v2-1-f5aed84218c4@asahilina.net> <20230714100525.2192448-1-aliceryhl@google.com>
In-Reply-To: <20230714100525.2192448-1-aliceryhl@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 15 Jul 2023 18:59:10 +0200
Message-ID: <CANiq72=NkgtT+mO4YUoqcNx3cXM1G2nJ2Y4rXihdT0paqW2QYA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: time: New module for timekeeping functions
To: Alice Ryhl <aliceryhl@google.com>
Cc: lina@asahilina.net, alex.gaynor@gmail.com, asahi@lists.linux.dev, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	gbs@canishe.com, heghedus.razvan@protonmail.com, jistone@redhat.com, 
	jstultz@google.com, linux-kernel@vger.kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, sboyd@kernel.org, tglx@linutronix.de, 
	wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2023 at 12:05=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> In that case, you should explicitly use `.wrapping_sub` instead to
> convey your intent.

Also to prevent extra code and panics with `CONFIG_RUST_OVERFLOW_CHECKS=3Dy=
`.

> I guess you could also use `abs_diff`, which takes two i64s and returns
> an u64.

I think `abs_diff` sounds best. It introduces an extra branch in its
implementation from what I see, though...

However, since it is the same branch that Lina does for returning
`None`, it should be getting removed. At least in a quick test, LLVM
generates the same code: https://godbolt.org/z/61rafzx71

Cheers,
Miguel
