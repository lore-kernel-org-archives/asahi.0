Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E324A405C9
	for <asahi@lists.linux.dev>; Thu, 15 Aug 2024 20:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723754036; cv=none; b=eOpDWYTlJGJLMfkaN8nFU0xOaVkIhoy7RLV6iuBCn7tmLe0QNbmqUP08PMNlc2WQU+EiN3GL0c8AecphZcndQYOq7+Z8voCbrf1Yp/+3Zyo3UoaSY0hiEld+vqFjcOTmZ0hsQuJx/UdTF97hFnLiXr2cSi9NxUWN+H5S8yXOxVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723754036; c=relaxed/simple;
	bh=SR+HJls7rN8EZRV4DdYxnxKWzOEinOl5EQrLPe0+yRU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AxEOWsHkIz+0Kvr5uSVPPlgDXfyIf9Qi8qgXN6NpzLfI1KCP5jIltfR8isuxCtkqgFgqRupapznFOWbn+Koa8m/cUf6YOSqYp/Ev3hKTmVISGKg2CySndJa9YB40NgKG8uPur8I61VyqBJjItutBrdtVajm7Mysdes2VIViUbqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vnp2dLif; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vnp2dLif"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-49297fca3c2so507447137.1
        for <asahi@lists.linux.dev>; Thu, 15 Aug 2024 13:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723754034; x=1724358834; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wUB5DtqEXasUqeTn5ggBGYiSPHH9LQLM5I6fa/JbtdA=;
        b=vnp2dLifx9VN6aC+Wah6ThUWj5pnNESz4R3jvzE2YHXUwCz0THB33/Jvy5i+IMhZrS
         LwubHo+opV4P4Be/LfvGiixqcVK0QhN6tEWIRkoiE9Z/PUa98Ph/1Snk441MQKjCwQfc
         fsVGjHAoSHLJySrXagqNqIrsEr0xbHxsyQ7Hd/rPnuKAi8rU6BqhIIBFsgSz9PxEdp8Y
         A/w4w1eEWTI6q3jA64wsYLwZDovdKH7XSkQw43fBLoVqNYJ9YWuk7xWC0MVKgpel0HCO
         B87/JkB/aP4l/fJ09Rel8XDt9PNixEN4bCjFyl6kSwPaK8GEpZTWqD4d+AcCRLIPH+4v
         5FPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723754034; x=1724358834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wUB5DtqEXasUqeTn5ggBGYiSPHH9LQLM5I6fa/JbtdA=;
        b=HyDGrkaFl6xUkbXmRrfqVkZ1qBUjKAssycBfYMOXlZYdC7+1S3u5MgKhPUGyLN8v88
         Eq+87x4WuP5LqY3AEYfhr9BCF+QOwcxSAm926ZkZjDGkoPZhjeGHtky8QNy/o5ESctG8
         OpPU7RQwTUnYQrINqVTxB3O2euqd/h6SD9ceg5eaFcHzQjNC6Sd5TgPb3sNwgqEpKmG5
         T90DR3c26hGzV+HDbBSwob/9cUeoL5v2l5fr7ZsB6/+pdQzzfOS9S7Kau2ReUYLXoGD/
         BCvMUsE5MbbEuEKJ6zI8bA9pDmisZdAhxmYc7pcAAtUD6cEV9mU5G3lb2tsGjHA+VJVw
         jkbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXid668XPVjGAlsGyf8E7wvE+NbjN6p6Mg+SlTIzqYFmBYV6gOGtd2nqPCk4f9ZYAv2xZ97Qy7Qi4W1CkWhvOidkMmKAQ=
X-Gm-Message-State: AOJu0Yxr8oPmIlxJT6USLwKtfGkCGsBHvDrpOm3JAvt5yN9rr7AdFY5k
	Ynj1qbXlfqqHyhFZqC3bqH14he0VpjajJYXyB03WswviZ5gLuamxSQMGQa9twbL3oCLdPOPyuuA
	jX+4APGXV+97rj34K/RQwv78nkStFtG0gVFZQ
X-Google-Smtp-Source: AGHT+IGfmuESjcg91WnDqUqkDtn8UIkv+97xiwN4+ScLJKsVEkWIs/4dVOABxE4IIaU7W5co17m4OAQqJ19lGvWOC8s=
X-Received: by 2002:a05:6102:41aa:b0:493:d41a:1185 with SMTP id
 ada2fe7eead31-497798dc938mr1347334137.17.1723754033614; Thu, 15 Aug 2024
 13:33:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240806212106.617164-1-mmaurer@google.com> <20240806212106.617164-15-mmaurer@google.com>
In-Reply-To: <20240806212106.617164-15-mmaurer@google.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 15 Aug 2024 20:33:15 +0000
Message-ID: <CABCJKufJK0WO92wnW09VTLqZk0ODxhuKQG=HbKE-va0urJU1Vg@mail.gmail.com>
Subject: Re: [PATCH v3 14/16] modules: Support extended MODVERSIONS info
To: Matthew Maurer <mmaurer@google.com>
Cc: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Michael Ellerman <mpe@ellerman.id.au>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st, j@jannau.net, 
	asahi@lists.linux.dev, Nicholas Piggin <npiggin@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Aug 6, 2024 at 9:25=E2=80=AFPM Matthew Maurer <mmaurer@google.com> =
wrote:
>
[...]
> +void modversion_ext_start(const struct load_info *info,
> +                         struct modversion_info_ext *start)
> +{
> +       unsigned int crc_idx =3D info->index.vers_ext_crc;
> +       unsigned int name_idx =3D info->index.vers_ext_name;
> +       Elf_Shdr *sechdrs =3D info->sechdrs;
> +
> +       /*
> +        * Both of these fields are needed for this to be useful
> +        * Any future fields should be initialized to NULL if absent.
> +        */
> +       if ((crc_idx =3D=3D 0) || (name_idx =3D=3D 0))

nit: The extra parentheses are not necessary.

> +               start->remaining =3D 0;
> +
> +       start->crc =3D (const s32 *)sechdrs[crc_idx].sh_addr;
> +       start->name =3D (const char *)sechdrs[name_idx].sh_addr;
> +       start->remaining =3D sechdrs[crc_idx].sh_size / sizeof(*start->cr=
c);
> +}

Is this missing an else condition or a return? Why set
start->remaining to zero and then proceed to assign a possibly invalid
value to it anyway?

Sami
