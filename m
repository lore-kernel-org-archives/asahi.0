Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A7EE4CA
	for <asahi@lists.linux.dev>; Wed, 29 Mar 2023 22:34:01 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-544f7c176easo320902287b3.9
        for <asahi@lists.linux.dev>; Wed, 29 Mar 2023 15:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680129241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4et6HdG1VD2NnaZtQOwB20B3lCP1dqelUY97Vr3DsTc=;
        b=NmC1VuSLoCqWuaLTvqnv/3t5VdAIqk7QHXYwbEvOwfC2U6rQgZr+rgsD2Ni6AbRygC
         gbF+2JeypEwggX9f1oOqCcJDKjODOijLfW0mHGUBek8WfaI602ZxIeT6vG4dXZtYA9K2
         6NKzPZxtIeIOlbEw006ulkBrsmpZt/tfkKl6geWCFqBBnsd4CTnA0b9VuLd/BDXiDpos
         oCbn84/AC0g40l+rCmbBFiUf1CE1eKCtutqLskp7d7M8pJSXLufqIpyZaAz/53+wBASO
         Hbjfu0Ciu26IwNhQzFkYV+olrFbrw6pmuOnlFkGxKl+ZKzfLf4BHjtQLIqj0IbHWPuCU
         9yLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680129241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4et6HdG1VD2NnaZtQOwB20B3lCP1dqelUY97Vr3DsTc=;
        b=BR2ah9SC8IkEdZaUmDpkIPdQFwHwwNXbo9ZHPQE3m0DgJskNZ53AqsG536XuQWtiUN
         9m544oknmFXviyF9t+9cPa5qew+YAZv/p9Oz0S77WhHbWW4RWjpIeyMefeE1DWrHR6oA
         wlkdn6YvpYsO3iUQplH5Zxz1PRT3foE4gcwX+icKy0FPnbQP/23+5ie+pGqV2/5oHRwH
         RdFHaddDmK26r4KjLro3ft04HWM5YqaLPdVgmcKxknDIyyraXubb0mH3efnDW70wQETl
         Iv+ej+xuWanXFinmB1gmrD8QneRAeYUs1fDzpESwsKHRpWIu276T56Dw7qoLJpst52ey
         bOaA==
X-Gm-Message-State: AAQBX9dfiYjImUi+GdxI068FcXeQSx9ouUkoMRh8XZlAq8f6Xydbd4ue
	jKN7kjswgkGM+89h2fR+6Ax+tyqbZWmNwRqIsd8=
X-Google-Smtp-Source: AKy350Y8Rz2RRJWrVe+IPbYbpilBV90OV+aKVmS2O6JZGTkN30VJPZJR1m7IkrvlSK/TR4cgrsRMkiXV6Z2k2+GvRhE=
X-Received: by 2002:a81:ae23:0:b0:52e:e095:d840 with SMTP id
 m35-20020a81ae23000000b0052ee095d840mr10509596ywh.0.1680129241495; Wed, 29
 Mar 2023 15:34:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230224-rust-error-v2-0-3900319812da@asahilina.net>
 <20230224-rust-error-v2-1-3900319812da@asahilina.net> <20230329213220.37d9ce85.gary@garyguo.net>
In-Reply-To: <20230329213220.37d9ce85.gary@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 30 Mar 2023 00:33:50 +0200
Message-ID: <CANiq72=u9DgsLtZ-q8+pb6=XMKnj2g=OWJvHyuY9cjbgweh-Rg@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] rust: error: Rename to_kernel_errno() -> to_errno()
To: Gary Guo <gary@garyguo.net>
Cc: Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Sven Van Asbroeck <thesven73@gmail.com>, Fox Chen <foxhlchen@gmail.com>, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 29, 2023 at 10:32=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Thanks Lina for implementing my suggestion.

I will add a `Suggested-by: you` too when I apply this, shout if you
don't want it!

Cheers,
Miguel
