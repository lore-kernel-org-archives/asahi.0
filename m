Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2218F3D6D
	for <asahi@lists.linux.dev>; Sun, 26 Feb 2023 20:59:38 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-536bbef1c5eso124637497b3.9
        for <asahi@lists.linux.dev>; Sun, 26 Feb 2023 12:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/a3uSDlfsqZGmv0N4D8ujOHHg7vKPERtZBqNuW3pgYs=;
        b=qHaN8xbcrctTIZLJmLgSzE/JjYY4a5wt8mpHQixH3Cpthj7X6bTegUsDqKK3X0ezqc
         t+3FqVF1QElwmSLcZPo4U0OLbPpjqX/OOHrr6TrhgQcZA3ObniMc6HOvXCMAcrBx1eKz
         RCZCnNnTQwADm//81Y/FuvuNZBO/iq7QX4hd87kr4dPO8uS+FrCtjzd+mciO/pW/byUd
         FGzem7IH+wT96mdSI8IR3w72Xe4yAEwq0JQT4m34E7CxQ5jnY0G/BmhU8mqUmwiXVP19
         9vJef43XC0BjzKkLz5kep6z8dJSDCahWVeDymF6Xn6gOrtfX71S7Ht4U5zdwniWh4hCc
         sCgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/a3uSDlfsqZGmv0N4D8ujOHHg7vKPERtZBqNuW3pgYs=;
        b=Fa681j+qBgW2KqWrIOel6drrI77MKx13wmTfVx0SKp0CVvKVzzztIyyCk8iKGjI4+5
         B4uPph53CSXpLQBq/S34yZ2ZC/AYP0RfSre+a+ultzBGCSXxCgv5M1kzhqtvLz2cJ3k4
         Mxe6felT0hAAf54yTpAqzuFpjve7Zq+20ohqBWS5HTZOaC8FI7WQAZimHXbwzdF+NRoT
         GDkU8dH7jMjvQmZANX3ww5a60t/rId1q9MhAoHWUbEaLgJNtV6fKFrjcmoLHXmDtN/ZW
         flBGjJwvooijNVX+HduPYkZPYiyNVRZOPIbW9Eh76BEM5whzIvI/6nGsnW29Zr3ov+U1
         UfJw==
X-Gm-Message-State: AO0yUKVms+ZJA5C1L7jB3nS9hEyuD2YH7ALgNKKznU4AoVDc2XVHmRvT
	BObIwbPIQSIhQybFBjperumk9b/l6AQHRDt7fCE=
X-Google-Smtp-Source: AK7set/61TNdgiOUotaSqBJ3oG75bxwjctCYlnS41y9hd20++fxhpwwM2eiH4YykdQu4/DE7h9xuedSgKUzR30dWaCU=
X-Received: by 2002:a05:690c:c1a:b0:533:9d13:a067 with SMTP id
 cl26-20020a05690c0c1a00b005339d13a067mr6032856ywb.3.1677445177037; Sun, 26
 Feb 2023 12:59:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230224-rust-error-v1-0-f8f9a9a87303@asahilina.net>
 <20230224-rust-error-v1-5-f8f9a9a87303@asahilina.net> <Y/lOlcSpc+d9ytq/@boqun-archlinux>
 <20230225222340.34d749ee.gary@garyguo.net> <Y/rCU1S+GDgIojNf@boqun-archlinux>
 <20230226133606.583cd1d8.gary@garyguo.net> <Y/uiAfZnfbbMrQuD@boqun-archlinux>
In-Reply-To: <Y/uiAfZnfbbMrQuD@boqun-archlinux>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 26 Feb 2023 21:59:25 +0100
Message-ID: <CANiq72kTiHF76T0AycM43qj4rUgQpHzBqXujdvk+H2qoDz22AQ@mail.gmail.com>
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

On Sun, Feb 26, 2023 at 7:17=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> My preference to function instead of macro here is because I want to
> avoid the extra level of abstraction and make things explict, so that
> users and reviewers can understand the API behavior solely based on
> Rust's types, functions and closures: they are simpler than macros, at
> least to me ;-)

There is one extra problem with the macro: `rustfmt` does not format
the contents if called with braces (as we currently do).

So when I was cleaning some things up for v8, one of the things I did
was run manually `rustfmt` on the blocks by removing the macro
invocation, in commit 77a1a8c952e1 ("rust: kernel: apply `rustfmt` to
`from_kernel_result!` blocks").

Having said that, it does format it when called with parenthesis
wrapping the block, so we could do that if we end up with the macro.

> First, I think the macro version here is just a poor-man's try block, in
> other words, I'd expect explicit use of try blocks intead of
> `from_kernel_result` when the feature is ready. If that's the case, we
> need to change the use sites anyway.

Yeah, if we eventually get a better language feature that fits well,
then we should use it.

> Do both implementation share the same behavior?

Yeah, a `return` will return to the outer caller in the case of a
`try` block, while it returns to the closure (macro) in the other
case. Or do you mean something else?

In that case, I think one could use use a labeled block to `break`
out, not sure if `try` blocks will allow an easier way.

We have a case of such a `return` within the closure at `rust/rust` in
`file.rs`:

    from_kernel_result! {
        let off =3D match whence as u32 {
            bindings::SEEK_SET =3D> SeekFrom::Start(offset.try_into()?),
            bindings::SEEK_CUR =3D> SeekFrom::Current(offset),
            bindings::SEEK_END =3D> SeekFrom::End(offset),
            _ =3D> return Err(EINVAL),
        };
        ...
        Ok(off as bindings::loff_t)
    }

Cheers,
Miguel
