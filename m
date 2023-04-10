Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A225E17D4
	for <asahi@lists.linux.dev>; Mon, 10 Apr 2023 02:54:14 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id u13so3531857ybu.5
        for <asahi@lists.linux.dev>; Sun, 09 Apr 2023 19:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681095253; x=1683687253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=68hFqK4w8HaSDUtj3lg9PKOMpgnSuCAOnFcquas933k=;
        b=IjZnrt9C8yXtdC/ohkFj9vbfN0I5CrHdGt6RXZhkRTqVcM4PMjWP/8xUL9vbh8GGdo
         v454lLMWWjhwjJ+VwzO4RTWzcsPINmuMQDfY6mX3OxL3T2JUR5wc/5FIZLCPAdV2aAV1
         2nqWJ6HPIB8NtV7TS3pFPZtZQnmgfufw/AHgIz6Yzu5VN/QU1pp1FvkXrmUm+DXClkya
         jatyStfza2n5Pf+HX832FAHLOmaxuJz5KC6QlcmgrizkjCKQByCyTfEjLGbUN1xSnDmZ
         lhd2umXNlbGwYnA/By0TG4KlvBR25fY1c8TeMp/RFKkT3DtALIkJ9fKFGpKgBbmgsV/c
         Yy7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681095253; x=1683687253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=68hFqK4w8HaSDUtj3lg9PKOMpgnSuCAOnFcquas933k=;
        b=uMFdAY875c1VSgeqkL89bbLI/r7EDPA8Czo96F7i8Ii4XpyLDXpY4GAhizfapucrCY
         nrVPZ1gCE9Xd3H2coZmqY99DlHlrvq1S+OiFeX1tpWIydwOTexXVegZlzN/1NvxtegU+
         QcOzUlxRgdkz7no5I7/eHrbFMqbn6OOY8wGtvd1XswBfoGwrn/NsiIM/8VMqZmOVDVHN
         ZKd30ri1h8Y8i9O/1O/k8OmhCS5B9BFVpMLnS3BGdFNCpyp3YaydUltYn67nwFW58dXE
         4vSaUjLInS6I5zcGV8NKAU8gzQcUxIVVOnB1+K6JH9bzKXtPqDuTIeQGd10b3l968nB4
         +AcA==
X-Gm-Message-State: AAQBX9eEU2Gh6cqqvPHngY0oCIiWr1GVr7sBEsfU0tuZwP8hdTg5N0NG
	cczT/+vZ2ceF93F2hLK5SL2bSyOuhok9kptYroY=
X-Google-Smtp-Source: AKy350Zt7Ncm7oRHxX7FoJD7gllamV44wOZFNwP7hZX6GC9TeqVGMSrkLhxzsHnsz947jvbOVKIpBCQsnTS1VTe26eY=
X-Received: by 2002:a25:7781:0:b0:b8e:cad0:6e57 with SMTP id
 s123-20020a257781000000b00b8ecad06e57mr3253999ybc.11.1681095253548; Sun, 09
 Apr 2023 19:54:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230224-rust-new_uninit-v1-1-c951443d9e26@asahilina.net>
In-Reply-To: <20230224-rust-new_uninit-v1-1-c951443d9e26@asahilina.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Apr 2023 04:54:02 +0200
Message-ID: <CANiq72ma7p9q8Usos6=Opv+YwzOXKgLXj6EEBUsfY2OY7KniGg@mail.gmail.com>
Subject: Re: [PATCH] rust: Enable the new_uninit feature for kernel and driver crates
To: Asahi Lina <lina@asahilina.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2023 at 9:10=E2=80=AFAM Asahi Lina <lina@asahilina.net> wro=
te:
>
> The unstable new_uninit feature enables various library APIs to create
> uninitialized containers, such as `Box::assume_init()`. This is
> necessary to build abstractions that directly initialize memory at the
> target location, instead of doing copies through the stack.
>
> Will be used by the DRM scheduler abstraction in the kernel crate, and
> by field-wise initialization (e.g. using `place!()` or a future
> replacement macro which may itself live in `kernel`) in driver crates.
>
> See [1] [2] [3] for background information.
>
> [1] https://github.com/Rust-for-Linux/linux/issues/879
> [2] https://github.com/Rust-for-Linux/linux/issues/2
> [3] https://github.com/rust-lang/rust/issues/63291

Applied to `rust-next` (reworded to use `Link` tags). Thanks!

Cheers,
Miguel
