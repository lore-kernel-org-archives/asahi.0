Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC413EEA8
	for <asahi@lists.linux.dev>; Fri, 14 Jul 2023 15:02:06 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-c7a5600d04dso1932732276.3
        for <asahi@lists.linux.dev>; Fri, 14 Jul 2023 08:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689346925; x=1691938925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZZ9EOh8YDl35VB0YBYDo9hjgSAIvlerdtM+lWHSm5g=;
        b=JTzzYDbIAeBHNT3Mk2cmNycCC3b97HGw6Wa6P0kp0mxr2C0KJFDPLSxJq8Pd6EzUUh
         bIjQvzVXcsD1bkZFQ3umgFq9TqY3tY8Vprh3ciL/qkwidOnt0es1ZnABBhViELmcW8yE
         7hdoifxju13ojhAoxCW+wwfWHB4F/2wrVUxW2PJQxG+IMSqKaI+ydKOWklkKQA4Wto5C
         rogJtvx1NQYCG44jC1GrVj0i//rc8q1aYevxx9mKh/QMzrQE31PClFfhAFpn5qJoA6/B
         PFHvMyG72+PLz7aLqg3R3/vCyN/mdmHx0ftxLv9lQP4Bawm7+5d8f4tAFt0fKL0pnrXL
         xAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689346925; x=1691938925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WZZ9EOh8YDl35VB0YBYDo9hjgSAIvlerdtM+lWHSm5g=;
        b=frTy1zIJ5onL5r1AOcuUy4m76bpiYX0V3wHpQcFDI3+dIyqmz5E/Ts/MKLJLMc+zOy
         ZxJ7aKnpWm5Qj9mnz/oKaHW1v89fP9TsQp+kIqf/FVnzLjVinjNMIqmZVyIOjEu4r0Vl
         TtSlr9iISnQwScgJ2ybaOw0fgFpUZZbjUQdhDAvKEdvFYbbytvDUT9xXFFRmL4pvbqO6
         Z90pkHawPY2faV9/4ngZL3ZG4lKIzEgd/cVxk+GW0XaS09cTP7rzMIhUFuKS9DNOs8K5
         y25lclYSrop3OdWw4QrWga2JBlmOhUZV7lPg/REiMIj9mTrhSH3HGJ2p3g4sQx3MWj0/
         Fj4Q==
X-Gm-Message-State: ABy/qLYEZ7G5fTAgOQJNeQd1z6/rSLyrbKTZzhQ3wdAamzybTChXbfgj
	X4cpKMo2HYld93Z1yUuZblMwi7CZCSB4IU+BJrw=
X-Google-Smtp-Source: APBJJlERpcU28hgT0T3bIglk0iGT0bmn1uOnaSOpkfR/IyTnKpYwVO97D+A/LlLF6zHeeOjIm0fNWn+04UB37NV0GbY=
X-Received: by 2002:a25:c0c8:0:b0:c4f:43d7:7daf with SMTP id
 c191-20020a25c0c8000000b00c4f43d77dafmr4055869ybf.1.1689346925288; Fri, 14
 Jul 2023 08:02:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPDJoNv1HW-5uCj21PX3t23rJ+sbTL4Gm5pDis8HGJ-VTr4dug@mail.gmail.com>
 <20230714140201.383439-1-aliceryhl@google.com>
In-Reply-To: <20230714140201.383439-1-aliceryhl@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 14 Jul 2023 17:01:53 +0200
Message-ID: <CANiq72n8-b992D4RbwUtuEUxXfJYQLNwfibgWSyspx-HYJ8+8A@mail.gmail.com>
Subject: Re: [PATCH] rust: kernel: str: Implement Debug for CString
To: Alice Ryhl <aliceryhl@google.com>
Cc: ariel.miculas@gmail.com, alex.gaynor@gmail.com, asahi@lists.linux.dev, 
	benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, lina@asahilina.net, linux-kernel@vger.kernel.org, 
	ojeda@kernel.org, rust-for-linux@vger.kernel.org, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2023 at 4:02=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Adding some sort of motivation usually works quite well, e.g.:
>
> Make it possible to use a CString with the `pr_*` macros directly, that
> is, instead of
>
>         pr_debug!("trying to open {:?}\n", &*filename);
>
> we can now write
>
>         pr_debug!("trying to open {:?}\n", filename);

Indeed, this would be the most important bit, i.e. answering the "why?".

The "what?" and the "how?" are pretty much explained by the title, but
it is also fine giving more details (but if the implementation
requires an explanation, then it is usually best to write an actual
source code comment instead).

Cheers,
Miguel
