Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0ACA2FB2
	for <asahi@lists.linux.dev>; Mon, 27 Feb 2023 12:10:51 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-536bf92b55cso168443347b3.12
        for <asahi@lists.linux.dev>; Mon, 27 Feb 2023 04:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TRRq/5GQqxIc46hXGY4H3v6xxg8Hsy+ok80SpKG+jLE=;
        b=IqLxFFvAKgRN8+KOe0Ns1JOXwhb2buHwYp9c+qncSQMzrQbulS72XzKIUFednkliHe
         MY7myH4FU/xEW2Yvwz4SS1Vv2Qr7LXmdoqkr3layZBlu9vGd7J8FcegnujpoIKWwsZnG
         YpEV4jSm4JVg0lRxlzhEB9lbVPG7kjgRc4LG5Q8sXVtGdsoi6JGMJUfTX/SKTlAqwLp3
         HrGrILRs2P7B0PVpvihUIFc3bJeWa3CMvMDGwgtygYIQhA1/l19YsQRoe1ku+w95Yj5v
         JSEtOfCMXqZ2Z1Z/cTfYPz61A+sRWE0UETcnsHt2dqJ669JwkLU675rGlyycCJnmG5iw
         uKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TRRq/5GQqxIc46hXGY4H3v6xxg8Hsy+ok80SpKG+jLE=;
        b=AfFJEfdUhmaeelu9hXRHvMjKyFdrnixgxO6RzVjyNX9VMEVlmimAF+LXijqRr2u6zj
         eApSAmWJlIxuHYTZEgIzIkU5u//oI+BKhMmBuDLhz8u87zNHdvjlWTCqFx7kbyR3Yh14
         6FjSkIAgyJ/LxbJ37Qf6FPZTKty+Rq0q2P0sYcjA6ydoqi7vH7a7sgVhxDZGR3JgBnTW
         ciZefTwOjPZeYr7+K/fzS4zRWVYnIgXPqFRe2GSM76eYS/hzMowj6bYQzmuTaU4SKM/u
         a9hH4ZXeunW+jAf7jryBgPVdfPdD7uNhiQwbPJ/Zmw5ij6VpyXtI6lrG1qEbOUSsifkt
         s3pg==
X-Gm-Message-State: AO0yUKUenPIVwXZuIZ1zDjFK0KghWvKvuegYc376c32pWFcoJuHOjV+u
	v1jzGcM87ETF1C8kNTtiMufZxIgPSoWzDLAUb24=
X-Google-Smtp-Source: AK7set97eDh3HLuNWh7xikVD1qnW++Lf0g7OIb1Adxk+AuKT0ePWwVzYCq74X4Mdj7MZsHvgV/ayLFmCjEX0qc+YMDA=
X-Received: by 2002:a81:af1b:0:b0:533:8080:16ee with SMTP id
 n27-20020a81af1b000000b00533808016eemr10118374ywh.10.1677499850891; Mon, 27
 Feb 2023 04:10:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230224-rust-error-v1-0-f8f9a9a87303@asahilina.net>
 <20230224-rust-error-v1-5-f8f9a9a87303@asahilina.net> <Y/lOlcSpc+d9ytq/@boqun-archlinux>
 <20230225222340.34d749ee.gary@garyguo.net> <Y/rCU1S+GDgIojNf@boqun-archlinux>
 <20230226133606.583cd1d8.gary@garyguo.net> <Y/uiAfZnfbbMrQuD@boqun-archlinux>
 <CANiq72kTiHF76T0AycM43qj4rUgQpHzBqXujdvk+H2qoDz22AQ@mail.gmail.com> <Y/vZdv6IVmrcP7wR@boqun-archlinux>
In-Reply-To: <Y/vZdv6IVmrcP7wR@boqun-archlinux>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 27 Feb 2023 13:10:39 +0100
Message-ID: <CANiq72kHe+BD1ZXjDQD_vWrpx+nBfy8fkjhHa8fx=3Bpk+Uuug@mail.gmail.com>
Subject: Re: [PATCH 5/5] rust: error: Add from_kernel_result!() macro
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, Asahi Lina <lina@asahilina.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Sven Van Asbroeck <thesven73@gmail.com>, Fox Chen <foxhlchen@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 26, 2023 at 11:13=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> =
wrote:
>
> Interesting, sounds like a missing feature in `rustfmt` or maybe we
> don't use the correct config ;-)

It may be coming [1] (I haven't tested if that one would work for us),
but in general it is hard for `rustfmt` because the contents are not
necessarily valid Rust code.

[1] https://github.com/rust-lang/rustfmt/pull/5538

> "Yeah" means they have different behaviors, right? ;-)

Yes, sorry for the confusion :)

> Thanks for finding an example! Means we did use return.
>
> For this particular API, I'd say function right now, `try` blocks if
> avaiable.

Do you mean going with the closure for the time being and `try` blocks
when they become stable? Yeah, I think that is a fair approach.

Cheers,
Miguel
