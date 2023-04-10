Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C1317D4
	for <asahi@lists.linux.dev>; Mon, 10 Apr 2023 03:50:02 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id y186so3522518yby.13
        for <asahi@lists.linux.dev>; Sun, 09 Apr 2023 20:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681098601; x=1683690601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZzELvV3936iXZzgHBjpzCyX1go0GJ69vN7WBZJ+Bv8=;
        b=oYMStYGmVv3HL4vWXaCMfmE9e0uqk4VH59VWFzrCtXudhoDJbN8PmpWJi5dE1kiA3G
         So1YzteaHFY8FMz7Dsnt5ygflYfEST8dtNOROQMi24j/nKAinlEM+PAdmPiFPC9+Cx/7
         u5q33alY9hBc6JsHCfXzq7EzWgjXS4Q0LPmUd9scNGzID9zc9RzHc4ArrTIAy2H78Ufi
         UB4JHaY3vsc6U9WVMCb7CXm2fn2HtlYT98pj1qhEQ7yWagEtWnqzh6hi2FquRWeh55i6
         h+LD0OkWZ5iwXYjlkOs4tYJWqA9BDK45OTlRYavTOF58xSJhwV/8AvpcRRlAingIFstX
         ZVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681098601; x=1683690601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FZzELvV3936iXZzgHBjpzCyX1go0GJ69vN7WBZJ+Bv8=;
        b=tqpqIOBLgd3Qc43oWLbC792zfma1uzyVs6qUBA2s6sdbL7G/hmOptMpYhYnQuVu6Zf
         KPleRMMDW/8WHWC5spEMvd0SSxirFlC6PfYDcDyRks4Fw8B+b93bj03yxLf+DC7wirTv
         i/rz7Y3xaKXTd4Cd8BJCs0gxggqJYEbkbN4yLoDHyxMRfW9oEL8WQ9T3tTXLaMqvIcqp
         h9q1PPhnwHiGlynELuAl12hqmsCCAkXFxEIqXhDM3ok4B+s8KIqxItrFQ4hMBfyrhf3p
         I6WBRpdyIU7vqwBWn+p8SgeTdJ62ucTUM9LV0A/IF2slpjkpTuNwN5/Zwe8hydI6CGL2
         9aYQ==
X-Gm-Message-State: AAQBX9cPhbJpGP8K8tF0sx1ETIr+Ytkqb5JUbz/Lv14TkKvi+hQeWyaY
	a2N15rraOzuHsng0/trBvJyllWJQBEuaBQTWbBQ=
X-Google-Smtp-Source: AKy350beTI/QDlgxCjoujRd1i6AdLQRQCrsIL4G8pwbvogSpdTNDF02ae9Ouw6+ToOIU1AJR9Zxn09lripExTPu2FeQ=
X-Received: by 2002:a25:3157:0:b0:b8e:db4a:a366 with SMTP id
 x84-20020a253157000000b00b8edb4aa366mr3084603ybx.11.1681098601651; Sun, 09
 Apr 2023 20:50:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230224-rust-error-v3-0-03779bddc02b@asahilina.net>
In-Reply-To: <20230224-rust-error-v3-0-03779bddc02b@asahilina.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Apr 2023 05:49:50 +0200
Message-ID: <CANiq72=M6GcMv67GYMCmJ=FUCD03rKSP5en7TfDTFw85qudfRw@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] rust: error: Add missing wrappers to convert
 to/from kernel error codes
To: Asahi Lina <lina@asahilina.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Sven Van Asbroeck <thesven73@gmail.com>, Fox Chen <foxhlchen@gmail.com>, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 3, 2023 at 11:48=E2=80=AFAM Asahi Lina <lina@asahilina.net> wro=
te:
>
> Hi everyone!
>
> This series is part of the set of dependencies for the drm/asahi
> Apple M1/M2 GPU driver.
>
> It adds a bunch of missing wrappers in kernel::error, which are useful
> to convert to/from kernel error codes. Since these will be used by many
> abstractions coming up soon, I think it makes sense to merge them as
> soon as possible instead of bundling them with the first user. Hence,
> they have allow() tags to silence dead code warnings. These can be
> removed as soon as the first user is in the kernel crate.
>
> Getting this in first allows the subsequent abstractions to be merged in
> any order, so we don't have to worry about piecewise rebasing and fixing
> conflicts in the Error wrappers. See [1] for a complete tree with the DRM
> abstractions and all other miscellaneous work-in-progress prerequisites
> rebased on top of mainline.
>
> Most of these have been extracted from the rust-for-linux/rust branch,
> with author attribution to the first/primary author and Co-developed-by:
> for everyone else who touched the code.
>
> Attribution changes:
> - One of the patches had Miguel's old email in the tags, updated that per
>   his request.
> - Wedson's email changed from @google.com to @gmail.com (I understand
>   this is the current one).
>
> Sven: There is one patch from you in this series, do you want to send it
> yourself directly? I understand Wedson and Miguel are okay with me
> sending stuff on their behalf.
>
> [1] https://github.com/Rust-for-Linux/linux/pull/969/commits

Added (and then removed in later commits) two `#[allow(dead_code)]`s
as needed to make it compile.

Applied to `rust-next`. Thanks!

Cheers,
Miguel
