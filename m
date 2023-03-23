Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CF08F6D
	for <asahi@lists.linux.dev>; Thu, 23 Mar 2023 13:05:36 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id b18so5649522ybp.1
        for <asahi@lists.linux.dev>; Thu, 23 Mar 2023 06:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679576735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gucyIJVMKP+NqT9WF5OyPIqU6hJihw7ITPbLS8iJbWI=;
        b=GOGeKOJMQko4GNrdrl0mulhsICJWZdDn90U2cKkLhGP54YTFtiZnLSOnlzxNCdR87d
         +JK8pY3IBSYeUY2u1ICxEfLMdLl/Num/+fjmL2Hh+VO087ynS7XLoAqedR3r4uwD9E8q
         zJ+m2gOMkiDGlB8e9jOsPen071tSUipsLC1Jkwb+ukVcRZ8y+3cG4GJTRXs1eoYy45YD
         Y5OByw1pywvSMjoItJhsl3UD37TQj10qN+muJ3COOPImgYlOALIHF9lOppGtnXMjjZLt
         EGGJTB7K0fJ9WAVJo3KgwdfWbrqgMlvFy3AVJ3Eh7Qard/+N5PfXMGCe/PiVmgjx5ufH
         DmFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679576735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gucyIJVMKP+NqT9WF5OyPIqU6hJihw7ITPbLS8iJbWI=;
        b=iaJPzvEd5Vq3xct4fkb/uBt0q9hGBdSGPAruSGAd0hs0jcGy3Oth2Bc4aQNm7g09AG
         vAPPhLGd1N4bvfWKRklP8dyJ76KRGzJ5uL3iDVC96egliVailQB6oUcuXBL6o97DecXe
         rlEMYkW9JWOB9ebmKPiEZwVL5NmoLawIu6KYsWh6yfLTac0xHn1z6gIDUMQonT+FBFuB
         70StEt+N+BEkV83Ljzs0OxX1LGTpl+ksPzxp/Sf0bXSqFuRQ65ha03iKHCLGodkb21UA
         WjaGvthoDfwzn3xpsOJhNp934k4yz27zOrBvAY53TUukyndVy5fNPxi4lIkbCHZW8Bf1
         DxMg==
X-Gm-Message-State: AAQBX9eiXxxDXYwyVnT09URYb+0i8GSwrjNaI7QMr8nOmtIHjr+nCek7
	B/EW/4hXYL7TT+yC5h/hIljG7zfhbqNlu2EBUn8=
X-Google-Smtp-Source: AKy350amHGvdoGB6oMTdWl9KkL9uI8iQ8PXcVN7k41xhsfQsfPgZsU8wJ6U8gAoeENI2187lnxyCHxpSc/TinLiE3pk=
X-Received: by 2002:a05:6902:100d:b0:b6d:fc53:c5c0 with SMTP id
 w13-20020a056902100d00b00b6dfc53c5c0mr2121997ybt.1.1679576735709; Thu, 23 Mar
 2023 06:05:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230224-rust-ioctl-v3-1-3c5f7a6954b5@asahilina.net>
In-Reply-To: <20230224-rust-ioctl-v3-1-3c5f7a6954b5@asahilina.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 23 Mar 2023 14:05:24 +0100
Message-ID: <CANiq72nk+KSz6X0Lxg4kc_Bui=17XhboJ6q6j8gRg7Nsshziug@mail.gmail.com>
Subject: Re: [PATCH v3] rust: ioctl: Add ioctl number manipulation functions
To: Asahi Lina <lina@asahilina.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 23, 2023 at 1:34=E2=80=AFPM Asahi Lina <lina@asahilina.net> wro=
te:
>
> Changes in v3:
> - Actually made the change intended in v2.
> - Link to v2: https://lore.kernel.org/r/20230224-rust-ioctl-v2-1-5325e76a=
92df@asahilina.net
>
> Changes in v2:
> - Changed from assert!() to build_assert!() (static_assert!() can't work
>   here)
> - Link to v1: https://lore.kernel.org/r/20230224-rust-ioctl-v1-1-5142d365=
a934@asahilina.net

It seems `#[inline(always)]` got added to a few of those, right? (The
addition looks fine to me, but just to understand if is it an omission
in the changelog, or an unintended change, or intended for another
reason).

Thanks!

Cheers,
Miguel
