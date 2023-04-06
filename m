Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384B9AD29
	for <asahi@lists.linux.dev>; Thu,  6 Apr 2023 17:19:34 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-54c0c86a436so51989647b3.6
        for <asahi@lists.linux.dev>; Thu, 06 Apr 2023 10:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680801573; x=1683393573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zs6V4xSX9ZlfsxZNTadcJVx+Wo1UCjoit8XXqPB91Bs=;
        b=hynWLQyHnbgidmV91dL/pTn/bQ6Fvwdl16G4bV7a0cfNjLvqbo7ZJezWtT71601dZj
         vyA53QTaqOyxJna1YPWAZZEarfelzHGrcBwBimALxU7yhWeWk2u2q2xxUwbzmAYpGGK6
         Y7i6BYF3GFekGu174zZNzsSmnCBetspFUWvpNWr/Ek6eEcl2orfm5riHIUZvohNa2NoT
         THQ115gs41K86a86xhzjbrzfSumTJSSyT9oie6SH1KzNCEs2IgJqB2q9tj4cAvVE7IIp
         jujKfsP6+1HzIQ6+/CMRmw7bh3ZuHnygqXkvlaIM0YxkRlYY1rMhipDTo33w14rQtZ70
         /DYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680801573; x=1683393573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zs6V4xSX9ZlfsxZNTadcJVx+Wo1UCjoit8XXqPB91Bs=;
        b=OsGLzoSBYI3L9WQC+O4iudA4c7CjTORt6ZfqrYG3TKDIdmopneAXO0GUklwYEEqMKR
         LsiQqE8ikmEHjUg7+Yf84JXQkRty9fTjwTHhGzt1nveREtqJfp2QJHGZrFyyUDUxZeUT
         bMay1InYrKrgihtrDjUbbKWx/fav3d8+xti1VX49EzEDST41t0+7RFz+2c/dDoRALysA
         j2HE0B2hfT20TJwbvhLrsA+Zdv281kk5tYMdGlIiksfl/wFaSqNNpv9qsLbbhg+oF71C
         0IWO31FNJw6hyDHhgkc2Bb4VyQBTeCwy8qo8ATrLdMpJC8stxlrlJhHvaHr3ZLc9KQgG
         RO+Q==
X-Gm-Message-State: AAQBX9dGaDK7MFBD/9MfX6Y0UFU/ckYqj0jPGDv78G330cop9n7787SX
	4yjEuGpdBVBeISgEZUptOQsQQM+nS/wOngontWs=
X-Google-Smtp-Source: AKy350a/mqrWTiqYdMMX1Vw+SbgVv8dxMUMkHCqZprPzSXoQ/vKHSQZbDVIf1wpejJDyAA0MT4Wjf5VqY2/qxGwAVQw=
X-Received: by 2002:a81:c642:0:b0:546:63a:6e23 with SMTP id
 q2-20020a81c642000000b00546063a6e23mr6185709ywj.0.1680801572930; Thu, 06 Apr
 2023 10:19:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-7-917ff5bc80a8@asahilina.net> <ZC7T92F7K9XTZPZ1@phenom.ffwll.local>
 <CANiq72=E2k7+_cwYw_EjVezk0mWCRqbH4MUjsEmxWgJMh=3AEQ@mail.gmail.com> <ZC7pHlLFutMWJF1s@phenom.ffwll.local>
In-Reply-To: <ZC7pHlLFutMWJF1s@phenom.ffwll.local>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 6 Apr 2023 19:19:21 +0200
Message-ID: <CANiq72=JOtZ7cc+FDxUY+HUEccRjXp=3gjbM04kwBiFR=Ew2-g@mail.gmail.com>
Subject: Re: [PATCH RFC 07/18] rust: drm: mm: Add DRM MM Range Allocator abstraction
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Asahi Lina <lina@asahilina.net>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Luben Tuikov <luben.tuikov@amd.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Karol Herbst <kherbst@redhat.com>, Ella Stanforth <ella@iglunix.org>, 
	Faith Ekstrand <faith.ekstrand@collabora.com>, Mary <mary@mary.zone>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-sgx@vger.kernel.org, 
	asahi@lists.linux.dev
Cc: Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 6, 2023 at 5:45=E2=80=AFPM Daniel Vetter <daniel@ffwll.ch> wrot=
e:
>
> Yeah this all looks great and very hyperlinked.
>
> I think the only nit I have is that for types with two or more type
> variables (like the rbtree) what each of them should represent in the top
> intro. I can guess it's <Key, Value> and not the other way round, but
> confirmation takes quite a bit of scrolling to check with the function
> types.

Yeah, that is fair. Personally I prefer more descriptive names when
there are several or they have a special/asymmetric role.

> Otherwise I think perfect api docs.

Glad you like it!

> Just a quick comment on this, that's the same we do on the C side. Most
> overview chapters are actually DOC: sections pulled in from the code.
>
> What I meant here is that for big overview stuff (like for modesetting ho=
w
> the display pipe structures tie together as an example:
> https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#overview)
> it doesn't make sense to duplicate that in rustdoc once more.

Yeah, definitely, if it is already somewhere else for C, we shouldn't
duplicate it (that is what I meant by the "shared across C and Rust"
exception).

> Maybe drm is the exception, but if you look at our .rst files we also hav=
e
> most of our docs in the code:
>
> https://cgit.freedesktop.org/drm/drm/tree/Documentation/gpu/drm-kms-helpe=
rs.rst
>
> The rst files just provide the scaffolding because C dosn't have
> crates/modules hierarchy that would do this for you automatically.

Sorry, I was talking in general in the kernel. That
`drm-kms-helpers.rst` looks great.

From a quick grep, I think you are indeed one of the big users of
`DOC: `, which indeed map closely to what you would do in Rust without
the scaffolding need.

So I think you will like writing docs in Rust :)

Cheers,
Miguel
