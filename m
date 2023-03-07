Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424CDBA4F
	for <asahi@lists.linux.dev>; Tue,  7 Mar 2023 20:22:40 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-53d277c1834so90631687b3.10
        for <asahi@lists.linux.dev>; Tue, 07 Mar 2023 12:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678220559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBSyTdrPOJVHUi62H8HJoL0JClhcgKSy5jHuy2pt1Ro=;
        b=moRxMRhToGIlBlURExNXwaSqcDqloQmsfa6GGj7GDlwLRkD93O48yrUADnGC/lXSPJ
         V2GzzO1lYJkNgtJqoVmZm0aT4Sm3u3lU7Hi07XGKEzZrWMhuDxKZEopMfzNbLWhpBTRF
         7slSWL0b0G9RwjS9Zyd0L0Ud3ta6nb20QvbZuFQq7zksZtlo2337D76LNG+yePOD3SBK
         gQuDRvl5CbKHea+RINhAva920U0ekvqLvXhd6aZ8Rwkcj8C2Bd7qPEcaiPW1of7ifyW+
         /M6XgrYJklZmaQo+cVa8uBIJEv3il2+ty2MWxddrKfjJrs569x/u9QpK/pcBx2vykkDj
         dOdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678220559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OBSyTdrPOJVHUi62H8HJoL0JClhcgKSy5jHuy2pt1Ro=;
        b=aqWD3Q3KaEp+iidhO1BzL+pg1Z/ro2BCp5YsmVBvnDjyYvzJLMtn9HjLY/saXMzKvN
         SCDnN1+m0xBSyHh/pvyrBL+b2NjCmjF+NQwmgJSoUFxpXE+N5mbYeUN7EHRGLC1QCtTc
         jA4rWEUCwxOKKZiaXPCxiRmrsc7C/CW4yViFac6t2Nl42VCeVGYlV9GwUtnrxzMlsMDc
         LhRdJ+KGSBxdpA0wPx4FCDnKtmobgPj+nTWkMp90zi8SdF6Ha5r9qovFr195Rw1xJLq4
         FVOV9OCP/rWr3aOwebRJdFr/D2szYOdUfNUmSR/kdTZEarwmaSeizMisogHHQszpzKSV
         wuXQ==
X-Gm-Message-State: AO0yUKXysDFb7DvHKRNXVB5SkrTPR0qO+n+33/HR1yxORTQjxHWUxpkR
	SvkYYwZAkA9oUzIN4BJikBoAd19WU1lvmllT7aQF+j4bR8nEIA==
X-Google-Smtp-Source: AK7set+L982y6Gqt0c6yuAz3Ny1/mK3S/lN4t37WxZPkJKzOI8RPld789a+1NBfsZIEjJtxEa8/6pZZjmpfINNZCZ/M=
X-Received: by 2002:a81:ad24:0:b0:52e:bb2d:2841 with SMTP id
 l36-20020a81ad24000000b0052ebb2d2841mr9466387ywh.10.1678220559220; Tue, 07
 Mar 2023 12:22:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230224-rust-macros-v1-0-b39fae46e102@asahilina.net>
 <20230224-rust-macros-v1-2-b39fae46e102@asahilina.net> <20230225003156.4858d79e.gary@garyguo.net>
In-Reply-To: <20230225003156.4858d79e.gary@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 7 Mar 2023 21:22:28 +0100
Message-ID: <CANiq72mSjqkib1gpocT3YbWRMz1Uj68Yh5DTZjthAd+=z_4tSg@mail.gmail.com>
Subject: Re: [PATCH 2/3] rust: macros: concat_idents: Allow :: paths in the
 first argument
To: Gary Guo <gary@garyguo.net>
Cc: Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 25, 2023 at 1:32=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> It seems weird to me that this is called `concat_idents` despite
> working for more things than just idents.
>
> How about just implement a simple version of the `paste` macro instead?

Opened https://github.com/Rust-for-Linux/linux/issues/983 in case we
end up applying the patch.

Cheers,
Miguel
