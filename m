Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B40BA4F
	for <asahi@lists.linux.dev>; Tue,  7 Mar 2023 20:21:48 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-536b7ffdd34so266174947b3.6
        for <asahi@lists.linux.dev>; Tue, 07 Mar 2023 12:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678220508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+IY8UzAM/RZ3TeWbW0ubM4NqyIzYaaPyJwWrG0C17g=;
        b=o3XBQrg0E7Gu4Bfj1UMKOqzr+iqyEw8RAolsQ0y0e9rP5fT6Ko80YcyP4xerW3tVy2
         uXftt5CH6v5UNl5a5kGaIGmV8RHWqX5zdXXKYop5T61DkG+3qC/ueohmOU4CbyDQkfq3
         5BmOVQCR3+QizmQhtYB8KgJ9Wi/R/dwAx+lQ2Ci81vxj800rVHtLcWP2AlA6+beu/D7e
         kn1JuRPQOCWTCPY7sWHQp00cP9+fXCDJc2PK5yUE3Kytzk39Cfzx4lLa34iqNy04afwa
         9/Uc8StrmKVSvZjXNfkWUvcCeA54MwgD7xk/iD6KiIa2Ue5EQD6sF1/NT1VH+54ynche
         /LDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678220508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p+IY8UzAM/RZ3TeWbW0ubM4NqyIzYaaPyJwWrG0C17g=;
        b=QlHWbYYuHk7I0EF68vQZhwcZ9I4fmq2wJilchsYtQWmpenhpOpVJVSo04o16LrxCXF
         dZFqJrlJu2MIsz2VbJxP8sP6mW9Tg3DOfjPv2WH2Lt2KKuMR6g5GMUvOReLt8HwkRE5t
         tDiAoofuknkSEX/bNwuCnhplRHU7TNqJQhyOP8vV9lpv1SlPEBrkjQHt2z9XP3Pm4IRO
         P9J7T+cd9rf7pW7KciPDOoQIHs1CPFqVJytlbQf0NrjUc8TokPULsxGorT/Hl0EMNckx
         4h0BI2782NvJjzKV5UTwkYLJ71FlS7onIJn3gYvJkIf4xnGynILdS0TjOmRIUYPqsBY9
         0hvA==
X-Gm-Message-State: AO0yUKVhr2HRNkvJqS2Q3CP0+ByxaI0V7T0DLfkRbH28yMibCF5HEmfs
	o1FvVuGKk6B0TYVvOZGZLUQzmTXX0mK26Vcy1Ls=
X-Google-Smtp-Source: AK7set8WHeDUH2QzZ+qXXUTEET93/pMiobKm119Tu1NVq9tGU/rw9YM9TSLJVmG610ERzpj35YEYE8yjCa4xNbbiPjM=
X-Received: by 2002:a81:ad24:0:b0:52e:bb2d:2841 with SMTP id
 l36-20020a81ad24000000b0052ebb2d2841mr9465097ywh.10.1678220508034; Tue, 07
 Mar 2023 12:21:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230224-rust-error-v1-0-f8f9a9a87303@asahilina.net>
 <20230224-rust-error-v1-1-f8f9a9a87303@asahilina.net> <20230225221405.62e989c8.gary@garyguo.net>
 <CANiq72kOb9mbh4HQzH40Ey+Rax3vREsd0Nf2O0apjDpsboE6vQ@mail.gmail.com>
In-Reply-To: <CANiq72kOb9mbh4HQzH40Ey+Rax3vREsd0Nf2O0apjDpsboE6vQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 7 Mar 2023 21:21:37 +0100
Message-ID: <CANiq72=jWZS+UGx20XcdpRSWxG_CBhmB7Xyib8SCeCFYZdf4aQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] rust: error: Add Error::to_ptr()
To: Gary Guo <gary@garyguo.net>
Cc: Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Sven Van Asbroeck <thesven73@gmail.com>, Fox Chen <foxhlchen@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 26, 2023 at 3:26=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> But I don't want to block the rest of the work on this, which may need
> some extra/parallel discussion, so let's keep the helper for the time
> being. That way we can also do that change independently and justify
> the change showing the difference in performance/text, if any, in the
> commit message.

Opened https://github.com/Rust-for-Linux/linux/issues/984 to help to
remember it.

Cheers,
Miguel
