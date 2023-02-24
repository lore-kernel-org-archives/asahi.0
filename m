Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3179539D
	for <asahi@lists.linux.dev>; Fri, 24 Feb 2023 14:01:21 +0000 (UTC)
Received: by mail-oo1-f47.google.com with SMTP id p6-20020a4ab386000000b005252182b0e0so649938ooo.6
        for <asahi@lists.linux.dev>; Fri, 24 Feb 2023 06:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cD2V3GFxUMbiUHqwfuQz30DRd9uey95Pb5f4mqZNz5Q=;
        b=nSQHhui9wzPmOzXMr5aqMMdc/emCD2VEKeowVCo0NrHkcplyLtFZoJHoJSFkK4z40b
         1Y5bsQqiIwdR5gofZEF35EK9avASKH36E5ex9cJE5wk26qczgQcR+g0acFXnTiiKDgxR
         PvZla0biMrFKQWZUiXoGS6VgkiqBzncTWilDH6zjbE0U2SVw1hG4kbL7ENtszZEjBb05
         qptC3JWIkQCUlwk/JXL6N42MpRNrK4D9ejBf0Lzca0apISJPaVzxW40XxUIt1LW/qq0f
         4QDj1rzPaIjMHxDN33OwyQKN9iTS0IxjFl1iPOh6pz4OLI/4YSXCYDPmBLAYfvu1N4S0
         XtLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cD2V3GFxUMbiUHqwfuQz30DRd9uey95Pb5f4mqZNz5Q=;
        b=wcqq2bv84u5kVsJKEqTgiBx52pH5pTNufb7n7NOjOGojrbYcInceawbdlhSDPJaPvM
         eg/8XEoigYXWY5GxUgnibSIg+IbGIkyLFBZYeOya3X8fSvwks1dTZN6aZyPpgGy3FO/q
         6UoX3uhK4qbBGY2w/hEkGnpZNh9F0A1JhwgdjQca1vNkZ7bpM/VQ1ctDx8yMxAihfspY
         NrCE0heMt04BV6FDeDdwa8frdMd1yT2wQvbDyBShjVQ5Pzr4b1Rz/ewDMLyfI+fpC1n0
         dT5oY8km1t/8K2Ba0kRHSpJAvQZkJvh6Xj1mu9TOQvFwjfkJErDHt4DIXGG/6PjDOgAL
         BTgQ==
X-Gm-Message-State: AO0yUKUcHnciDGuS6hm3qBe4qTzN0CKbbAbFVIB2x4AobBgA8SpJrRI7
	VWWyQZOlBqkf5RyR4+YlViQ=
X-Google-Smtp-Source: AK7set98zYboFrn/b4D2MBfz+3WRgRRGr0dXxRlba6lrQpOjcTAlP8smsxqbzioF9NIua3JNmHd9sg==
X-Received: by 2002:a05:6820:61f:b0:51f:e2ab:5535 with SMTP id e31-20020a056820061f00b0051fe2ab5535mr8142396oow.0.1677247280363;
        Fri, 24 Feb 2023 06:01:20 -0800 (PST)
Received: from tx3000mach.io (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id v14-20020a9d604e000000b0068bbf5f2e49sm4505958otj.37.2023.02.24.06.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 06:01:19 -0800 (PST)
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
To: lina@asahilina.net
Cc: alex.gaynor@gmail.com,
	asahi@lists.linux.dev,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	masahiroy@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	nicolas@fjasle.eu,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	wedsonaf@gmail.com
Subject: Re: [PATCH] rust: Enable the new_uninit feature for kernel and driver crates
Date: Fri, 24 Feb 2023 11:01:13 -0300
Message-Id: <20230224140113.745953-1-yakoyoku@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230224-rust-new_uninit-v1-1-c951443d9e26@asahilina.net>
References: <20230224-rust-new_uninit-v1-1-c951443d9e26@asahilina.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2023 at 05:09:47PM +0900, Asahi Lina wrote:=0D
> The unstable new_uninit feature enables various library APIs to create=0D
> uninitialized containers, such as `Box::assume_init()`. This is=0D
> necessary to build abstractions that directly initialize memory at the=0D
> target location, instead of doing copies through the stack.=0D
> =0D
> Will be used by the DRM scheduler abstraction in the kernel crate, and=0D
> by field-wise initialization (e.g. using `place!()` or a future=0D
> replacement macro which may itself live in `kernel`) in driver crates.=0D
=0D
Very useful to me as some constructors in the USB bindings that I'm=0D
writting might make use of unitialized memory.=0D
=0D
Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>=0D
