Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0348310EE
	for <asahi@lists.linux.dev>; Wed,  1 Mar 2023 17:24:30 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id o38-20020a05600c512600b003e8320d1c11so952775wms.1
        for <asahi@lists.linux.dev>; Wed, 01 Mar 2023 09:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677691469;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNpkdoZmqWbaOAVmdJei7p+ZGXFT2prpPoc6LJ5dBsc=;
        b=H1hL0uZxcat8GWO9QXh3RBN3DAIwfBbtYifyqCAdNxaqgQICwyujdWtRJEcSeMXL/n
         PAngsJryhFCO3gp3meGjYeSwkPxGiR+BwbRDUN0TgiYiX46jMXB7xfIFxnrgr+HzfwK9
         VMaJsodlkF8yjTtTxIpOjV6MJKNFSD8gRGgTPBrp4RlJO8t8DjaDE6wgsfSGwg0p/qrH
         iPWPLrYNyb3SO5K0RdE6dly+Eg6sd9sc66SkgXj2Ff/V9la1H5qXDdShWPVw6H0wBl7h
         ReXY8rM2cQJtae0ZcBnQqP9o7y410Frlb7Y/ejnGH/zZsUZP83Lw+vccnBnrsfhr1LjU
         JlEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677691469;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sNpkdoZmqWbaOAVmdJei7p+ZGXFT2prpPoc6LJ5dBsc=;
        b=lSljOeMdrw0Wk3Rk4J6C9r/5UAQafo2/V37N+bdH4ROZJQKa+ypCjfpHchUysdehc7
         h+cPzhsfIJs7OLGXMjgs0uFu5CjUQ0s6HBIQE5+Myt/oe+EyYI8yhBvxKUcZPp/f+AaK
         QOv15yt6tnk/C7UcxBt7iIJdiXTMZKkm218h7yqrb9NLfUxXwuKpedidXVDPTjJdVpO8
         h4J5qo3+2eV3ke0TmbCFZ0LNBVOvZ4PHik8m783D4TU5sNoxB6yn+d25u/ivXvKwIEFJ
         yjxk3olF///cd1q0XLLff3efJQQVBdo6Sd0ttcLDYnL8UPAlBsn4dOv1bmMBXfexNXdi
         8QWg==
X-Gm-Message-State: AO0yUKXLWI43EWhEuA3YYRlZvEVec2jcEmTUGaQlCIGnBJ3el0lOgJle
	ssgDpn84Mj8qkJSkq/b8FcvSw3ZRxOrMAZ3nnn0=
X-Google-Smtp-Source: AK7set/qEAM/YZLlke7KZF96LN1MjYAMr6V67vMOMBAYzfxb5ReD44O7Lfw2E+IZzSi1PTzv+CFdPQ==
X-Received: by 2002:a05:600c:3acb:b0:3eb:38e6:f64f with SMTP id d11-20020a05600c3acb00b003eb38e6f64fmr5419748wms.8.1677691469184;
        Wed, 01 Mar 2023 09:24:29 -0800 (PST)
Received: from localhost (93-55-83-125.ip262.fastwebnet.it. [93.55.83.125])
        by smtp.gmail.com with ESMTPSA id g12-20020a05600c310c00b003dc49e0132asm255828wmo.1.2023.03.01.09.24.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 09:24:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Mar 2023 18:24:26 +0100
Message-Id: <CQV7ZNT6LMXI.1XG4YXSH8I7JK@vincent-arch>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>, <asahi@lists.linux.dev>
Subject: Re: [PATCH] rust: Enable the new_uninit feature for kernel and
 driver crates
From: "Vincenzo Palazzo" <vincenzopalazzodev@gmail.com>
To: "Asahi Lina" <lina@asahilina.net>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Wedson Almeida Filho"
 <wedsonaf@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Masahiro Yamada" <masahiroy@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nick Desaulniers"
 <ndesaulniers@google.com>, "Nicolas Schier" <nicolas@fjasle.eu>
References: <20230224-rust-new_uninit-v1-1-c951443d9e26@asahilina.net>
In-Reply-To: <20230224-rust-new_uninit-v1-1-c951443d9e26@asahilina.net>

> The unstable new_uninit feature enables various library APIs to create
> uninitialized containers, such as `Box::assume_init()`. This is
> necessary to build abstractions that directly initialize memory at the
> target location, instead of doing copies through the stack.
>
> Will be used by the DRM scheduler abstraction in the kernel crate, and
> by field-wise initialization (e.g. using `place!()` or a future
> replacement macro which may itself live in `kernel`) in driver crates.
>
> See [1] [2] [3] for background information.
>
> [1] https://github.com/Rust-for-Linux/linux/issues/879
> [2] https://github.com/Rust-for-Linux/linux/issues/2
> [3] https://github.com/rust-lang/rust/issues/63291
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---

Reviewed-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
