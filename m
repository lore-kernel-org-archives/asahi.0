Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC51717D4
	for <asahi@lists.linux.dev>; Mon, 10 Apr 2023 03:47:54 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id f188so35263818ybb.3
        for <asahi@lists.linux.dev>; Sun, 09 Apr 2023 20:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681098473; x=1683690473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hl6Ldr2ffJls2zPrC5MBUC142PJZp6NGW4lSlfYrLXo=;
        b=ksvDpJOqSnK4D9i61295t8pix74Twg9CUAER6KKwgaw88XWTXMopY0cDxvrPBazEOE
         wDPov8tkV2qdZBkehRdGO8sBF86F0qlA2EA0HqV761wbJvCjZ/6uK49gMm2ib8PFsnNy
         3pazCUXTICAEL+Z3B3/Z9ESZiZIHUTyEyNLsg9iKfbiPkBfbAZbqJClyZ1kUzdtX/nUt
         i+qIhMt0P0I2/MlSB4cOIgpYwHlWk83+y2z8EbqgzJXKIaRCIBYaEuRtWYWFzqERxwLJ
         BXobngkak/04YJCo4/57fReySCxvDwcY6kAV/e6UVqOaWzmoNfPoTDT2eSRPuDn9bAAp
         gd5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681098473; x=1683690473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hl6Ldr2ffJls2zPrC5MBUC142PJZp6NGW4lSlfYrLXo=;
        b=g9IuNeg+DhKx/hpi6nvisqo68ajZ5gITc6IrMTqyKGRSEqzFB/z73C3E5rI6Bd1CfJ
         musaWrcHLjZ6VAvyhdZbEjj0GvAUoUCydpoE1cHqVvBR3ilTT7Co7/XVCi2ffzvoxETS
         JQJ7f3ZKzHEYfu8++hWwgaD/cCWqnkU5uLvKtuVKcpxhyNUI5prh8o5Fyw0seoX1Dbo+
         jXvmlIL0PE+WqyVaeDycktIWhNlELn3UGr44T5gsHQDAuIEP0iSHiPfmT68/xv3T8fvr
         rGsfAtaTB0Q4+D8t0I9OkeQY5OeRRsxlmnK0EoeUaZChrzkGA10BB3+AAjKUfl4JDOEe
         2wJg==
X-Gm-Message-State: AAQBX9fhdeGbXEg5JA9WcEg0f4JS97u0Z8pS/5iPdjA/57cuQWzsphBo
	JG0ee45AVhBBy5igj7umKjjGaRzArDIlK4piUqY=
X-Google-Smtp-Source: AKy350adDkkKnqOW4IGrkQPJIh22w8D9fGmOFWzJSCxBaRnkc8GB5Q1maI+xS6wpp75pqDl+eMIkiQqUgTNVD4ZsXqY=
X-Received: by 2002:a25:50d1:0:b0:b6b:d3f3:45af with SMTP id
 e200-20020a2550d1000000b00b6bd3f345afmr8883100ybb.1.1681098473651; Sun, 09
 Apr 2023 20:47:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230224-rust-arc-v2-0-5c97a865b276@asahilina.net>
In-Reply-To: <20230224-rust-arc-v2-0-5c97a865b276@asahilina.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Apr 2023 05:47:42 +0200
Message-ID: <CANiq72=XwyK=EgFOU1jqMCFcoyjUc63WSu498ZhKVAg5CBaV7g@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] rust: sync: Arc: Any downcasting and assume_init()
To: Asahi Lina <lina@asahilina.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Vincenzo Palazzo <vincenzopalazzodev@gmail.com>, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Benno Lossin <y86-dev@protonmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 3, 2023 at 12:01=E2=80=AFPM Asahi Lina <lina@asahilina.net> wro=
te:
>
> Hi everyone,
>
> This short series is part of the set of dependencies for the drm/asahi
> Apple M1/M2 GPU driver.
>
> The two patches simply add two missing features to the kernel Arc
> implementation which are present in the Rust std version: `Any`
> downcasting and `assume_init()`.

Applied to `rust-next`. Thanks!

Cheers,
Miguel
