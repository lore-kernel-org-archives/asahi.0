Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F206FD7
	for <asahi@lists.linux.dev>; Fri, 21 Apr 2023 23:48:50 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5529f3b8623so12817637b3.2
        for <asahi@lists.linux.dev>; Fri, 21 Apr 2023 16:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682120929; x=1684712929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tLOHSowAq3qXxVnp8tQm0eq1f2X6Iz2Ob1qD9V70Jyc=;
        b=N6FlboiknJp6c3M8T/xFon/pnuArObgBjhHXYdXy6bl1PlLUyDQjS14PTHy1fKFBrg
         H+RBH0tYkzYHl46iJGFKYpFtJ75H+ecQGmLEEUb7S0pGJgAt69lH/1IS5quQ4qLwVtOf
         u+ld1xcGZYVvnFj4d15tuSkaK3IjGK78unsQvKt87YWucazsEpoMeN1iaYAOqkFi+CWm
         TQ4BgDHIdIGicv6TisI5OPxaD+b9U8Ml9PH/0mvWs+WhwytJKZAWXtnW9WLZm2M/Mj86
         +oQltTkY7/D2T0daxBxOa/5JCL3CSOG6SQ6rcu7E9bbeEPTFmVC07Lwe71fo11cFe2vW
         t7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682120929; x=1684712929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tLOHSowAq3qXxVnp8tQm0eq1f2X6Iz2Ob1qD9V70Jyc=;
        b=bi7yA2BdddFr5w/21FUsZzRusKjjffL70Y0Lyg6j5YmThg8YmEWlCNP3fsihKBJA0P
         ecERUHc4AmQQlBoNVMlg3EHNjAJ7zW2hi991/1ss7h2pKURv3PLDsKmh4zERN7O0Gzl0
         yo4WwYNd2czy9Ri0//oV6ENykOue4VRT1zDeWJDIRyNk96deh9rpsOT92whcXx+r49wN
         BV1AOTr33xMqLii1rUgUpKUCKdgrZlr/jjytXA2tH19Vi6US/U1z51MKXIiB+8qgveJZ
         6SVGATvDps7h58DMy9eBe0tXJiMSeycwH35Cydn0AucWLnstXGz5Iu3nZIEqKA7xYnKC
         tS4g==
X-Gm-Message-State: AAQBX9frp2swIV6F24J3Z8lnivmHpGYhJbjz7bJl3sWiVIwM5e+DUiL7
	eoWqX6tFWv/8vIghc7755E/ZVTS8nXDLwZBtpFg=
X-Google-Smtp-Source: AKy350YUefHIkuKUui23iIRLtVxZ0q1CQI13Km7pDYoawxBws41dSc8jEVMIOQP++qYawwQ+uNh0e0QPUs+F1eVk7RQ=
X-Received: by 2002:a81:8302:0:b0:54f:9b01:b353 with SMTP id
 t2-20020a818302000000b0054f9b01b353mr3028442ywf.9.1682120929644; Fri, 21 Apr
 2023 16:48:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230329-rust-uapi-v2-0-bca5fb4d4a12@asahilina.net>
In-Reply-To: <20230329-rust-uapi-v2-0-bca5fb4d4a12@asahilina.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 22 Apr 2023 01:48:38 +0200
Message-ID: <CANiq72kZcDfV-hz6ku93RFxg3eOYfNp1d=-GWYy97T8maoZpMQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] rust: Add uapi crate
To: Asahi Lina <lina@asahilina.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 3, 2023 at 11:34=E2=80=AFAM Asahi Lina <lina@asahilina.net> wro=
te:
>
> The first patch introduces the `uapi` crate proper and stands on its own,
> while the second patch introduces the `ioctl` module in the kernel crate
> that uses it.

Applied to `rust-next`, with added support for the `rustdoc` and
`rusttest` targets, since we want to keep those working. Thanks!

Cheers,
Miguel
