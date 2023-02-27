Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7073C3A
	for <asahi@lists.linux.dev>; Mon, 27 Feb 2023 14:37:53 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id h16so26650919edz.10
        for <asahi@lists.linux.dev>; Mon, 27 Feb 2023 06:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jardeordj/XaekgQabJqF1lz2rr5vkdnESlvHbFfelw=;
        b=hganA3faGvuJFN5axMQ5JxQkgWZCh7Su32XCgEwy8s446/VNR4zAmXwj3l8/RfEnQ2
         T7HSpR309392mmAq+NSWjy2f2JRZUdYdXGx3Dc/B8G7KXAXzP1m1++viAtdWpseS8Inh
         gJ47k59fCi9TZBjO094HMYh4ah/fq3j+1vLP+bOkPQog/+bgS3no+CvGxpf0ULGy2uvY
         ygLAR2AAkauWvXKEhL0EX7B6NOVpQ4dRgFort8YAxO0zOMVFSoGmEM/3RagYU4XBhIFo
         z6fD3QFuibh+hzjwxgfJY+OrWDqLnEIS0Ru9wbpT8+O1U9bTLRxetNRMXZpllx6Sb0fZ
         IBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jardeordj/XaekgQabJqF1lz2rr5vkdnESlvHbFfelw=;
        b=tYUYakKYASI5S5/a9nS7nu526ITuYrGKZXGAIrPdYsDmy7FB9xtl8nwWdO3CfxdWV1
         /EsdrppPa8TXp+d2tds/nOu4npHH3359DJUnvaopGZ3G2G/XYIQqzxByk/RGtQG7UtE1
         GbeGPwCHVN74bLB/rZbLDDauMChV96GOhHgcug6uTEZo6zlEQMvAlBWJ+uiSO9vTzI8L
         YVNsf09FNbC4ODbqm6i5MNujZHJ8URHB9EZ2eJICse4iVbwwX4K5jfLa88s9OlTqBKfz
         jEi6JZr8fVTKgsFI3PqRVxoZ9a/PTs1k+LUmB/DWrOXD3VI1IGT8FhegFmnK84bBT+Vg
         0SLw==
X-Gm-Message-State: AO0yUKWqeMib7TS9OpbLj6vzZDvZ/bliIIJC6Eo8zx6HOBTY2h4OFp67
	VPEoRIqv0z8xPSoDsni0k13FJw==
X-Google-Smtp-Source: AK7set+x74nbvd+X2m0N2CUH9bptLVF4b0EcDroO1edwiwkWo4zu/CmTcGWNBrewdzwbDuvrN4DMDQ==
X-Received: by 2002:a17:906:8608:b0:872:82d3:4162 with SMTP id o8-20020a170906860800b0087282d34162mr28971157ejx.44.1677508672009;
        Mon, 27 Feb 2023 06:37:52 -0800 (PST)
Received: from localhost ([194.62.217.2])
        by smtp.gmail.com with ESMTPSA id kb16-20020a1709070f9000b008cae50b0115sm3263618ejc.87.2023.02.27.06.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 06:37:51 -0800 (PST)
References: <20230224-rust-new_uninit-v1-1-c951443d9e26@asahilina.net>
 <87pm9v9rmg.fsf@metaspace.dk>
 <96cb824e-8251-a329-11e5-3618a4e59bc8@asahilina.net>
User-agent: mu4e 1.9.18; emacs 28.2.50
From: Andreas Hindborg <nmi@metaspace.dk>
To: Asahi Lina <lina@asahilina.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron
 <bjorn3_gh@protonmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, asahi@lists.linux.dev
Subject: Re: [PATCH] rust: Enable the new_uninit feature for kernel and
 driver crates
Date: Mon, 27 Feb 2023 15:34:38 +0100
In-reply-to: <96cb824e-8251-a329-11e5-3618a4e59bc8@asahilina.net>
Message-ID: <875ybn9nsx.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Asahi Lina <lina@asahilina.net> writes:

> On 27/02/2023 22.09, Andreas Hindborg wrote:
>>=20
>> Asahi Lina <lina@asahilina.net> writes:
>>=20
>>> The unstable new_uninit feature enables various library APIs to create
>>> uninitialized containers, such as `Box::assume_init()`. This is
>>> necessary to build abstractions that directly initialize memory at the
>>> target location, instead of doing copies through the stack.
>>>
>>> Will be used by the DRM scheduler abstraction in the kernel crate, and
>>> by field-wise initialization (e.g. using `place!()` or a future
>>> replacement macro which may itself live in `kernel`) in driver crates.
>>>
>>> See [1] [2] [3] for background information.
>>>
>>> [1] https://github.com/Rust-for-Linux/linux/issues/879
>>> [2] https://github.com/Rust-for-Linux/linux/issues/2
>>> [3] https://github.com/rust-lang/rust/issues/63291
>>>
>>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>>> ---
>>>  rust/kernel/lib.rs     | 1 +
>>>  scripts/Makefile.build | 2 +-
>>>  2 files changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>>> index 223564f9f0cc..1118cd3e0b5f 100644
>>> --- a/rust/kernel/lib.rs
>>> +++ b/rust/kernel/lib.rs
>>> @@ -17,6 +17,7 @@
>>>  #![feature(core_ffi_c)]
>>>  #![feature(dispatch_from_dyn)]
>>>  #![feature(generic_associated_types)]
>>> +#![feature(new_uninit)]
>>>  #![feature(receiver_trait)]
>>>  #![feature(unsize)]
>>>=20=20
>>> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
>>> index a0d5c6cca76d..0f637e1ca8dc 100644
>>> --- a/scripts/Makefile.build
>>> +++ b/scripts/Makefile.build
>>> @@ -277,7 +277,7 @@ $(obj)/%.lst: $(src)/%.c FORCE
>>>  # Compile Rust sources (.rs)
>>>  # --------------------------------------------------------------------=
-------
>>>=20=20
>>> -rust_allowed_features :=3D core_ffi_c
>>> +rust_allowed_features :=3D core_ffi_c,new_uninit
>>=20
>> What is the purpose of adding the feature here? The kernel crate seems
>> to compile fine without this.
>
> It's for the upcoming DRM abstractions, as I mentioned in the commit
> message. There's so many dependencies that I'm trying to get as much as
> I can early to avoid having to review very big patchsets down the line ^^

I got confused on the different makefile rules used to build kernel
crate vs module crates. Looks good =F0=9F=91=8D

Reviewed-by: Andreas Hindborg <a.hindborg@samsung.com>

