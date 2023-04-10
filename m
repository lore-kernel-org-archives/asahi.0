Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772CA17D4
	for <asahi@lists.linux.dev>; Mon, 10 Apr 2023 03:42:49 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id a13so3511570ybl.11
        for <asahi@lists.linux.dev>; Sun, 09 Apr 2023 20:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681098168; x=1683690168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqy+7HgrqhTA3y3Mm7XBf4JyoweihTIc8x6wEhmraPM=;
        b=GawGlHsoA2kIbqxJQVRZov4meNamppKioPXApj9jwaZlnW0T1h2th4QNPx79j3GiR/
         F6v4c+2G+5ZB9mjWuIF8KJmB2pClE0SinH6j5NERHHNGptlEAefSQ6hhd4guBykVIjh3
         HqQYr8Fot0T7HfYUOyxUpJ/zv8Hb0Cr4lB6e3WtQSIPi5ISU3Qx1GOizP/bVfQI7s95e
         Q8Ffof529tBogs5QxsSKCwHKHnPiY3O+fHpdjkm/dFQn528bnsKmx+/nOrAfCgrCpv0u
         EzJjf5TWf92RSBwAMvhikLLUtOCx5gg7i03Gwd9RCiOXcX1ZO8vsIe2jm2KuIEylEvlv
         mt3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681098168; x=1683690168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vqy+7HgrqhTA3y3Mm7XBf4JyoweihTIc8x6wEhmraPM=;
        b=Kp1nSfIa0JEqHqGRtr4w57VTJyyrxaqdXxIAb92Y1f4Tl8vDi7MAM9EfeauFRC4bVD
         B+4YgD4sxkL8r7ocMQF7DEz5QNnSFSvqancc0tG4qr2yl4bT2I/4+zT8abz005zbEqvq
         OGTUjZ623OhX+Ci7eMs0d2pWqA5O5y95LjIZSMwNtaCxnFOPl9HxLwxYx0H8nsIW83lo
         /XayxHWStIsrgvAcU62qwuiRL6TNRyizoL/tHZvnUwYxQUBQ+hJyGYZItzyqhkYhI9sE
         OKvokhuC/bsJ989aDBElR4A2YLx71hXAAXzft/Oz3zZHUoLlzRth0aGnzbNavWqnsOvP
         wDIg==
X-Gm-Message-State: AAQBX9cp1TVpnT78p1Pg4wHdhzFmCIpVwFAy9ppY9A/Qu9pthG7xhh+q
	gQnchHfa5CN7G2ENItHWz6ErOJz12CNqxRN5wnc=
X-Google-Smtp-Source: AKy350Zg3LyywQHh550qv7aoJJHLaiYrdsf0Yzhcm0fkr1UkhpgZkbYWByN4y3ey5VlDLH0uEnvJF3KwvJHqgdhwgQY=
X-Received: by 2002:a25:dad3:0:b0:b77:e465:cb16 with SMTP id
 n202-20020a25dad3000000b00b77e465cb16mr6281632ybf.11.1681098168252; Sun, 09
 Apr 2023 20:42:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230224-rust-vec-v1-0-733b5b5a57c5@asahilina.net>
In-Reply-To: <20230224-rust-vec-v1-0-733b5b5a57c5@asahilina.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Apr 2023 05:42:37 +0200
Message-ID: <CANiq72kVpFMqk82Tx23GmBsLy3mwrPLEfPod=BvXsE-s4MCMUQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] rust: alloc: vec: Add some missing fallible try_* methods
To: Asahi Lina <lina@asahilina.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2023 at 10:12=E2=80=AFAM Asahi Lina <lina@asahilina.net> wr=
ote:
>
> Hi everyone!
>
> This short series is part of the set of dependencies for the drm/asahi
> Apple M1/M2 GPU driver.
>
> This series imports part of a commit from Miguel in
> rust-for-linux/linux, which adds missing fallible
> mutation/allocation methods to `Vec`. These are generally useful to make
> standard features available to the kernel environment, which does not
> have infallible allocation.
>
> The additions in turn depend on importing two submodules from the Rust
> stdlib, which I have attributed using the same commit message template
> used for the original import of this part of the codebase. These
> versions come from Rust 1.66, but also build on Rust 1.62 (the current
> version upstream). I added the SPDX identifiers in a separate commit to
> clearly separate the original code from subsequent changes.

I have used the 1.62.0 versions to keep things aligned.

More importantly, I matched the new fallible methods to those in
1.62.0, since the commit used to import them was quite old and there
have been changes since then.

Applied to `rust-next`. Thanks!

Cheers,
Miguel
