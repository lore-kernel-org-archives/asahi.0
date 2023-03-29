Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A88E4CA
	for <asahi@lists.linux.dev>; Wed, 29 Mar 2023 22:33:32 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-544f7c176easo320881577b3.9
        for <asahi@lists.linux.dev>; Wed, 29 Mar 2023 15:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680129211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+6LTpXnaShPp/aMOnarhhdVl/37J/Widlt3z574l3DQ=;
        b=hDaZdrk41ASjkEzCvgtAYPEY93vGhSPpacpR5s/Iztg0al+4OR9WwyGQjxhSKHq7UO
         LzcKz4yfdWeaSB1y70SzSaGoDXpvTCY9d8st7Iwxx/nMcsvNqg6IzabV6eDouXNXfzad
         RuOtcr1o2yH+CieYYJhc1J4qsk6NKkwUxlpMccU+BTKG8HqgUvs0COGL18+HDOlY5r9X
         VzM6DiBkqh/bI8W37K1rHojR3GgmN6zNN9vQSzG6JZDkctQS9CeeRrkpxaQPMnl4qKy+
         DnebD7e5l++CV0kpc5EDL3X4pmKdBRmTKKbcDrE9qD+HA7TgOEMZD/xw+1Ctid4mAphM
         TU3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680129211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+6LTpXnaShPp/aMOnarhhdVl/37J/Widlt3z574l3DQ=;
        b=pkt6bUyGoAoag1NF2ZDSD1weqIQGtJYTiOrwpQ4qbx0hPipE8OyIJ4YhdmA7f6zG79
         QjJ3hR9zS8XVjrPacN4574APZViWQUhI/IUj4z+2vMz2LdofCpP+4sOwNYsKAmRPskk1
         I5tyYDXMOdRs9YL6Z3vNZT6lJsBWyGXRbkgKa0iEdOQH3ZXgV3MFnRrqQ8o+Zfcy88+U
         XrK5WV/RHDbi1CHrZ64ur3J4vqi0AotVxLsbPnRasgcMXvB2TyaseVertYReWQiSkq03
         YTMwJHcRKnFeASXimVjuTvG4B205mVaZm4j+bY6XSTQQVNp1Ling6IZDQVw25iSvPUqp
         YKPg==
X-Gm-Message-State: AAQBX9cZZXRLVjbMVjnvFxq+jm9f7mdeMc4reimeh/G/D30Uz8jonK96
	E8zqSHuL4vuTRppnBSND1czDPHnD/jQHPAT+aqc=
X-Google-Smtp-Source: AKy350aXIUrzCs9LU5BXnUcMqWrHW+cLIALFyiDM1Dcp1H4b4wNsQcU8byHZ7G6UXIIDugN6++uSfCCMcUetOHypZH0=
X-Received: by 2002:a81:ac46:0:b0:533:8f19:4576 with SMTP id
 z6-20020a81ac46000000b005338f194576mr10246162ywj.0.1680129211333; Wed, 29 Mar
 2023 15:33:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230224-rust-error-v2-0-3900319812da@asahilina.net>
 <20230224-rust-error-v2-1-3900319812da@asahilina.net> <0849f870-2d95-8c3a-c7dc-2b18dcee4c65@gmail.com>
 <CANiq72ko9tY4dsK9Srte2oYQp8G=PMyLDTOR33-yNTVXmfyzeA@mail.gmail.com> <2a10a97f-70ba-5216-a527-067deda6a94e@gmail.com>
In-Reply-To: <2a10a97f-70ba-5216-a527-067deda6a94e@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 30 Mar 2023 00:33:20 +0200
Message-ID: <CANiq72n=B+OTU+gp6bVExvxhqFiuT=0A7y56AG6A4xSWXG22Gg@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] rust: error: Rename to_kernel_errno() -> to_errno()
To: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Cc: Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Sven Van Asbroeck <thesven73@gmail.com>, Fox Chen <foxhlchen@gmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 29, 2023 at 8:16=E2=80=AFPM Martin Rodriguez Reboredo
<yakoyoku@gmail.com> wrote:
>
> Ah, yes, they were supposed to have my email with it. I wasn't that
> livened up when I sent them.

No problem at all! And thanks for reviewing!

Cheers,
Miguel
