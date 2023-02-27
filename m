Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D996AB3
	for <asahi@lists.linux.dev>; Mon, 27 Feb 2023 13:52:51 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-536c02eea4dso177663347b3.4
        for <asahi@lists.linux.dev>; Mon, 27 Feb 2023 05:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PpHoYwBSJYrD+dy9oWzkcgpva3nGOcVMTl9avKAE77k=;
        b=RMNjwlwFyEj0eQRR/s+b/9HN3KQrlK6zHKN7pnqbC9jBEyosiPM3kyuStsDITeQyvk
         Ml/TMeaxU769rgHfji9Abpixu2Z+RO6Z8YWr5F17A2vHK/r+MrAWGHERHpUPTmton7tl
         Lnp60HD0KcDhAzTfQiBc+QBREoMcGlyEVpmVMJTdOa3g5Ak9/7aQto2KyNWH7jhFsX9m
         VkimLpEHfn1AO64/s5z3rnl0iTSfHdDdAN94jsT5drIEI35IvLkZiw/kO/e1/tJycqY8
         aUi/cYMTiKYA0k8+AQALxCI5R+8+vfe1KC7yuUP3R+nN4AAaYleTTzmzHiM11AXQMnBJ
         z7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PpHoYwBSJYrD+dy9oWzkcgpva3nGOcVMTl9avKAE77k=;
        b=G2mIULfdl+HzNys42SzxmlFAZfmpG8oRd4iwXdueIgFyYTZw/u2swQANVxF7MpijwQ
         Ow4TX0l2tZVYdk/F9hTJMCrPfRPhH8R7r0OBMDfHdBBMl21YVf1DnZ4Bs9EcY8XyyPSP
         klUffmy867iBE/wannJzW9qbKM5kOMQstXW7t3wV+2YNyPZ/iU1GFwKlUr9hLb4MipHu
         CStXhH4QFvVATFfePmGD+i/G6XKqYnj3UbnjDss3DxB9nuWQvGtrOTCdgXVaqglxLYZx
         R8OS07U34Sxo5EyyAwsgcyeddCS7O8wrt7eTcu7y6DNRkMRsGKumsEx/mWhRY4TY1JQe
         63/Q==
X-Gm-Message-State: AO0yUKXAT4t2vuyu7PSOsl9Ne438jLI3WM579jc9ymIAXfvtOWasUjNf
	T70e+9vGn2ErP+K4AXHqosNTXHtPX7FZ+tXpuZU=
X-Google-Smtp-Source: AK7set98yphOPe9BepvIDu25JZbS3zDNASmaTD1t1U0BDqTOdcpo/jqpm7Ks8YTTrowrcWXJsvKGX2uES95BodH11Wg=
X-Received: by 2002:a05:690c:c1a:b0:533:9d13:a067 with SMTP id
 cl26-20020a05690c0c1a00b005339d13a067mr8132245ywb.3.1677505970814; Mon, 27
 Feb 2023 05:52:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230224-rust-error-v1-0-f8f9a9a87303@asahilina.net>
 <20230224-rust-error-v1-4-f8f9a9a87303@asahilina.net> <87a60z9qb2.fsf@metaspace.dk>
In-Reply-To: <87a60z9qb2.fsf@metaspace.dk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 27 Feb 2023 14:52:39 +0100
Message-ID: <CANiq72mxFPs7fcdPMuuhEY0a-iNsbCwc9dumbFHoJm=aiNQvLw@mail.gmail.com>
Subject: Re: [PATCH 4/5] rust: error: Add a helper to convert a C ERR_PTR to a `Result`
To: Andreas Hindborg <nmi@metaspace.dk>
Cc: Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Sven Van Asbroeck <thesven73@gmail.com>, Fox Chen <foxhlchen@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2023 at 2:43=E2=80=AFPM Andreas Hindborg <nmi@metaspace.dk>=
 wrote:
>
> For consistency, if `from_kernel_errno()` should be `from_errno()` this
> should be `from_err_ptr()` as well?

Sounds good to me.

Cheers,
Miguel
