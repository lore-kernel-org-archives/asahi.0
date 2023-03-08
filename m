Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E233657
	for <asahi@lists.linux.dev>; Wed,  8 Mar 2023 20:57:17 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-536af432ee5so328630107b3.0
        for <asahi@lists.linux.dev>; Wed, 08 Mar 2023 12:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678309037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTT8n29DWNd3urgPa1kCRTbJVOAEGECiIIU8nl+Nkjg=;
        b=LfDjf6FYZTWA5GSZkgEi8KpG8mClAxawA58QJzzzQpRHpAylJ8Ui8zyXXL3vFD9LGB
         I97hm3W/sKpiwn9wm36pwbGuTvp7gRkAAtV9dhE7w3gImFb2C3uSBfhP0T6lq8/4xTHL
         FP9D3ATdgkVTTjOhLvtBgvICoSgTaaSLo/RnkFvajnSDZOmOZsiWo8u3U6kRHD3AJtni
         v87R7WGAKJ1Kvv6ZmgMM8JQpsbIj1QEZx5P1l546HIC8DV010jWiy5PDZERJdRD2M69L
         92H6LrPUqLzwL+oFb4LLSNI0bFXOLcepOkoIPG3TQBJB8ITp/V3DvyJwgeF2jpnj+Aoi
         Hgug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678309037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UTT8n29DWNd3urgPa1kCRTbJVOAEGECiIIU8nl+Nkjg=;
        b=S2Nkck2PzUoSJPAqPHAmq8noJ31cH491qSdp9Sit9bAzKmCqo9vk1UMfPAUU7hKxAB
         iUbYlEEWLomQQtUXErDpQcVAAXw0GoEUqFm78tWPZg+tZDEbmfy1EP918UxknP5+MEGS
         Feb+0K1rjDLzdvAIzq6bnlXClj7eLmxw0riCznhPAYmtFdYM58vjrjVgvGYj/uLCBs4V
         LwCVgPrmg/Er21SaAQ73e/7lIcwxTMuf1ZPz/IDzEcasuynkk+JnUqQ0AeIP0slv78cg
         6wfgb9Bi/sPsN1NaOaXpcB+8AsnUnF3ElkShi8AevNAdsbV3Ko10/F4JMpYEN9PMFDcz
         FDIw==
X-Gm-Message-State: AO0yUKXjIHFqekXAPh4Rvy+0lc3sWcOEW0lkv9PFAQDkMjTt9soOOeyq
	lsqcoDf0H1QL5qQPi555IGZuSaV9tUm2cvO2Ww0=
X-Google-Smtp-Source: AK7set+gyItpNI/8KIIH66pLospwhy4B/I9V63tct8DgMY8dLQRXpobXiGACii8Apv2vV5+Zq300kWyV7ixpz86xuEY=
X-Received: by 2002:a81:a9c8:0:b0:533:9c5b:7278 with SMTP id
 g191-20020a81a9c8000000b005339c5b7278mr12170063ywh.0.1678309037046; Wed, 08
 Mar 2023 12:57:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230224-rust-macros-v1-0-b39fae46e102@asahilina.net>
 <20230224-rust-macros-v1-2-b39fae46e102@asahilina.net> <20230225003156.4858d79e.gary@garyguo.net>
In-Reply-To: <20230225003156.4858d79e.gary@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 8 Mar 2023 21:57:06 +0100
Message-ID: <CANiq72kaLzV4qajxXjWeDGXLwobhevWcuWLdf9DsZUrc9nGymQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] rust: macros: concat_idents: Allow :: paths in the
 first argument
To: Gary Guo <gary@garyguo.net>
Cc: Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 25, 2023 at 1:32=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> It seems weird to me that this is called `concat_idents` despite
> working for more things than just idents.
>
> How about just implement a simple version of the `paste` macro instead?

We discussed this in our latest meeting: what about a change of name
to `concat_paths`? That addresses the concern plus it avoids sharing
the name with the unstable `concat_idents` which could be even more
confusing after this patch.

Cheers,
Miguel
