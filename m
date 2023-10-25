Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8770F27EFB
	for <asahi@lists.linux.dev>; Wed, 25 Oct 2023 16:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NptSKA2J"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-d84c24a810dso5070841276.2
        for <asahi@lists.linux.dev>; Wed, 25 Oct 2023 09:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698252965; x=1698857765; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ezNV1NENiP6KBX98JXvJ/eq70zrlc01gRGtk3N/fJGc=;
        b=NptSKA2JtblDK9cLHx/uuC1sIZn24h1JeaCfivKbXzGNGvrk+hOy6VY9rsZHQBMSgC
         wW8MpgPYabHZucZFT+knaqIzAam48LW0luIUu5MNcHfFP2GWCyerTsKwd45zxdUampFI
         yg/RMgOzZ1i0tZ++YUyMS72xhZWZuV6p4FouDyx2QFgWOu1KGRuTZPS0jjVGqsIq+7gs
         bu/D/6FR5jVb71CoLA3QOipXnOPmc6BpEXXV2gZxTXsTCmu1iVnc9wL4wc7CIyOQLRb+
         IZRcEHUachlvyXiZwwEC/WT1c5p3OGAaoyR9a9bjI8gFtnpxcOzxYGCO6pBseCzbZSiv
         EfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698252965; x=1698857765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ezNV1NENiP6KBX98JXvJ/eq70zrlc01gRGtk3N/fJGc=;
        b=Cj24hkn6bAPVubt3FH9wBIDkdKlvlzfssPWKBHkf0X448FE3TIUjMMeM+xn5bfwKpV
         RXOOxrZOxRTodXUQkzDY/naN1kNmZDBJMhFUkIS1I+FUyHhkEUEXXeEnMrd34i2qMQeB
         54yDKH3/FErVEwyAKSJr50NVqVKGxvOdzrirjmbe2bnAmbU34Yj+v00Da2/5hbM5HXjq
         cM4lsgp+xMSYFf4VhiHUmj3b28liH2rGz7zp/RDG5qlJ+vEtcrX8BP4temtCgvQ8CIha
         idiS+zU+Ff6RH5t5K9YROfAC2DsPlkfDfo3hYdJ/Y9wA285E9jrZtAXfD6WljrsdG2l1
         a4cA==
X-Gm-Message-State: AOJu0YykGPuUKOD8Wn42Fk1tp0ztDMwt8VhlS4dt9zTpWnYzXxrb8uoO
	nWqROvjT4f7nrrp6Sq2mjbn1argmc+GpZVH6Ym/a+upQF6yjtQ==
X-Google-Smtp-Source: AGHT+IHyzol5ilHFal3eky2BDnngGqTplq7QvQFuTNt/cHcckhlsRBcb3ZdI/2OZ2gHb+8nVlcV+UY9Lsqa6vLfqPFs=
X-Received: by 2002:a25:d281:0:b0:d9b:453a:5426 with SMTP id
 j123-20020a25d281000000b00d9b453a5426mr15819811ybg.56.1698252965504; Wed, 25
 Oct 2023 09:56:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPDJoNv1HW-5uCj21PX3t23rJ+sbTL4Gm5pDis8HGJ-VTr4dug@mail.gmail.com>
 <20230714140201.383439-1-aliceryhl@google.com> <CANiq72n8-b992D4RbwUtuEUxXfJYQLNwfibgWSyspx-HYJ8+8A@mail.gmail.com>
 <hwqyfgbzbnquby5v6zby4u4pbyezzcsttt4ee5x7lw5etpv7se@kvarclpucc7w>
In-Reply-To: <hwqyfgbzbnquby5v6zby4u4pbyezzcsttt4ee5x7lw5etpv7se@kvarclpucc7w>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 25 Oct 2023 18:55:54 +0200
Message-ID: <CANiq72=h_NkDsXrd+6TF2fiBdo0nfCbvgwqZdDSnaCFwYEEP_w@mail.gmail.com>
Subject: Re: [PATCH] rust: kernel: str: Implement Debug for CString
To: "Ariel Miculas (amiculas)" <amiculas@cisco.com>
Cc: Alice Ryhl <aliceryhl@google.com>, 
	"ariel.miculas@gmail.com" <ariel.miculas@gmail.com>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, 
	"asahi@lists.linux.dev" <asahi@lists.linux.dev>, "benno.lossin@proton.me" <benno.lossin@proton.me>, 
	"bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>, 
	"gary@garyguo.net" <gary@garyguo.net>, "lina@asahilina.net" <lina@asahilina.net>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, "wedsonaf@gmail.com" <wedsonaf@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 25, 2023 at 6:18=E2=80=AFPM Ariel Miculas (amiculas)
<amiculas@cisco.com> wrote:
>
> Any follow-up on this? It sure would make my logging cleaner.

We were expecting a new version, but I can pick it up with e.g. the
message that Alice suggested (i.e. marking it as modified by me).

Cheers,
Miguel
