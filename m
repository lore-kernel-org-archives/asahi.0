Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677092560
	for <asahi@lists.linux.dev>; Sun, 26 Feb 2023 13:56:19 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-536cb25982eso107061987b3.13
        for <asahi@lists.linux.dev>; Sun, 26 Feb 2023 05:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s2ts1GdBaI5yZyaOizgF74ytm6/pL7kpF7zQHufJ0bA=;
        b=VwflOH0TfCHFHLaMPZDGRDSxtmafqNNzSbRl2rpSUkyic0lIiewaF0bHQNH5KsLdeL
         2U06MboTEgDBNx4v1Nx6/CLD47KC4ITNQRlrzPlWNx0JFJwW+Ny69ucUl6NBv5vwQBOH
         fDvh/Tz0IyzaIJZSa6QdKLnJL6dyJT3n0+TuJmMQsHr0NH4DDpAzKA/tlkPWIww8bUZY
         vMjBGlpk0MK5EhDkqn2TECdylbuxwo7b5G7Di4Ob3iS5Flsh3oRrdnXuLrPBwmyza0FH
         sKKeQBvBIU28uaqDyxUynI5cuY/c+QuIO1pAOuIOF+5vObPpncAz7CaU7ZUnOokvOWyz
         MNfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s2ts1GdBaI5yZyaOizgF74ytm6/pL7kpF7zQHufJ0bA=;
        b=w3GiTf0hXdF3mRwbNktWEmcnKdBT/aKQ1Tn2Z9Kwz8PJdmRyWH4evVB+L9kCWAQU0s
         f/hUV+p4XUmxhptlKEow20+GGdpkxlf01/2xUx3rzSpQ+5e1DIzHJHhklzI/a4UAm8yJ
         y+pgTJrNApcRzqdaqdqCtcjHhi/o9nhxrcOEMHHQ+z57BsAOPj25xthDViBN07qcr4pR
         UQt1JOx0Testh2wEk/C2aFWAFzlXfX1Eyh1NLyKOTLl9IppiUhVjFLV/44MYZ7M3iK9N
         H+f+0olXL7FueEkytDmdb2Umgc4OmzGR1ASBH8xTx99UkMyFBF59ztAhw7e0YWIfLVm0
         Msow==
X-Gm-Message-State: AO0yUKUelM17MyExg3RH6sM7S46fgOZrEYVmcmWZySPZlqN08GZA45mO
	zDFDCHasRgjV+uJ3BtkQgfHUlsUkRE3Mlylm4W7UW7HC
X-Google-Smtp-Source: AK7set+3MIhcC3XotHdZeApYs7aBgp83b5XfkTiXvXlXQXkp8joYQ4fYn3WpYA8XGIWBYphJvnqD15afjNTs1frIyhk=
X-Received: by 2002:a81:af5d:0:b0:52e:cea7:f6e3 with SMTP id
 x29-20020a81af5d000000b0052ecea7f6e3mr8296596ywj.10.1677419778344; Sun, 26
 Feb 2023 05:56:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230224-rust-error-v1-0-f8f9a9a87303@asahilina.net>
 <20230224-rust-error-v1-2-f8f9a9a87303@asahilina.net> <20230225221921.4b4bc87d.gary@garyguo.net>
In-Reply-To: <20230225221921.4b4bc87d.gary@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 26 Feb 2023 14:56:07 +0100
Message-ID: <CANiq72k7jN4COyGTGUCUc9jdmYcc53FHpOSOd=uLv_NLKR9gPg@mail.gmail.com>
Subject: Re: [PATCH 2/5] rust: error: Add Error::from_kernel_errno()
To: Gary Guo <gary@garyguo.net>
Cc: Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Sven Van Asbroeck <thesven73@gmail.com>, Fox Chen <foxhlchen@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 25, 2023 at 11:19=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Maybe just `from_errno`? I don't know why `kernel` would need to be
> emphasised here.

Yeah, that sounds good to me. It is clear and we don't use "errno"
elsewhere. This identifier came from the original import, so before we
started to think about naming policies.

Though perhaps we can clean it up in a patch later, since we should
change `to_kernel_errno` below too at the same time. Or if you want to
send a quick patch for that one, I can put it in first.

Cheers,
Miguel
