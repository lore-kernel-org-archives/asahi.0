Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080F8A38
	for <asahi@lists.linux.dev>; Wed,  5 Apr 2023 11:19:59 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-54184571389so670156687b3.4
        for <asahi@lists.linux.dev>; Wed, 05 Apr 2023 04:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680693599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OVTqfRf2jpWEeoD6UNL26R0hpOD3j9XRAva3jj9aVBk=;
        b=UMTYBNcPhbAF0ABt8KophwzX/Ny6OPNn+L6EnmU5IkTiR+fwtjtTvvmlWyMYj3Pkd/
         c/AorgHXggjcy/x5fLftLDXcSRee6X3AtQ1pW2rCBk6CYlNeeb39l9Sc0PgP3d01I3hi
         qodJYbUqCHZ235SHXXOkTEXGGEHXyT2WxYP95YphXmCso64A4JEn5pUvLQzjn8+qM2mo
         ffZ5LUVWgPBrcIjs91pPf+lKHjgH0EcvEuCyvhchd69BLf5uIsTKD4aB1cF0OsfHG7q9
         zt9q5kpD8Hxo6x9MnvBm6HE/Ec1pZ6n+yeI3K4SLL9P/DBFTyptpplVjTZnPhcQNN5G2
         eRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680693599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OVTqfRf2jpWEeoD6UNL26R0hpOD3j9XRAva3jj9aVBk=;
        b=Hk4r2OFtbI9xySxLzyAO+ZKVeVxIHUqcwRAnJZcoTuHZsQfi0Z6xOfqFrJ+28PjJbz
         B3X60hz9LwKUnaW099sbqt4QLY82532Zkvc9iCX4Jto8+K7ZsE2IC8TuPGTJeNriYpAa
         O4EFTfr1W4WGG8a6Z8EaX98EUCytWIo0rAttxY0k1hWYMMFgjM0Qdpclgvl2mqXb50pV
         2Pf1ohMdpVugz5PF8kwMGzsu9Anq/mAdse3DNWGU7gY1GkKDdTqTsvkUWM2XV9/yt9GI
         qJrxnZSYpddvPLKnU4+xJd8b+59U9Qd2QUM/1pV6cskYYhtkFDO5/RzlYx/tKVtAK17Z
         dNIw==
X-Gm-Message-State: AAQBX9fGO7ZuLmTOQiM3/3DgiySJ3/NKdWi5pbVLOHCKoFj6vkjBvDyf
	JJmU4qLAogjKBifUmNGY0BnKI4qvl6fmrHsnN4M=
X-Google-Smtp-Source: AKy350bbnQi/kk0Ucraeyifb8HGzxmDoYIzCbR5PfgN3LBUwsGHhS/jbvYqgxE1Tugt8wPoVLCb1KVJOEW5vVrBJUTs=
X-Received: by 2002:a81:c509:0:b0:52e:e095:d840 with SMTP id
 k9-20020a81c509000000b0052ee095d840mr3519608ywi.0.1680693598783; Wed, 05 Apr
 2023 04:19:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-4-917ff5bc80a8@asahilina.net> <ZC1WwJDr1iqSQnYs@phenom.ffwll.local>
In-Reply-To: <ZC1WwJDr1iqSQnYs@phenom.ffwll.local>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 5 Apr 2023 13:19:47 +0200
Message-ID: <CANiq72=h9qKrpkY2K962__rs-JLsmWxPXocx040ZeDSKGf_Brw@mail.gmail.com>
Subject: Re: [PATCH RFC 04/18] rust: drm: gem: Add GEM object abstraction
To: Asahi Lina <lina@asahilina.net>, 
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

On Wed, Apr 5, 2023 at 1:08=E2=80=AFPM Daniel Vetter <daniel@ffwll.ch> wrot=
e:
>
> Uh all the rust helper wrappers for all the kernel in a single file does
> not sound good. Can we not split these up into each subsystem, and then
> maybe instead of sprinkling #ifdef all over a .c file Make the compilatio=
n
> of that file conditional on rust support (plus whatever other Kconfig gat=
e
> the other c files has already)?

Indeed, the plan is splitting the `kernel` crate and giving each
subsystem its own crate, bindings, helpers, etc.

Cheers,
Miguel
