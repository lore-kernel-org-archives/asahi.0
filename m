Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77051D5176
	for <asahi@lists.linux.dev>; Mon,  3 Feb 2025 09:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738573740; cv=none; b=WhNsulRAZmx+8r8BRAhpCCVwudS6va7KSMBH4k6so/DW/anEqwxZqE4hWvEGC9unJl4n5beXxaK0nMe3TRUcjrLWhSPzX6COEwjr5MCPUBolCThXGXtNyRa21qNF08FQLMOjNpgRNsHr0EKjRdWIs5Nl2MNFGv5qMgvfbO92YAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738573740; c=relaxed/simple;
	bh=RtOwM5RxJfd+VfcKZGXtlLQFSXd03HQ8e4rhtGXZjtM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qli9b3YxCMx+Kf/D8YseMT0W8STxPjTZyPzCcSsFhV09NYlh+RdD++Dz+aix+iHFsuiz5eYrc3BpE/Ba9TqKBhBSf+bJUyjzIZo2l1UMfUQKniLn6LQuhbV518verOipVqp1wo+pyy1V4c8FTTZYU7ygCkBx70Q6asng7jJSvxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gsQ6oSOe; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gsQ6oSOe"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4363ae65100so47451295e9.0
        for <asahi@lists.linux.dev>; Mon, 03 Feb 2025 01:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738573736; x=1739178536; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RtOwM5RxJfd+VfcKZGXtlLQFSXd03HQ8e4rhtGXZjtM=;
        b=gsQ6oSOeCBPPPaa0BvdGIIJ02jLqpE5ZimYLQ3g14Vd1h6Tx8qLsndyQodpx/v8+Vp
         saH3eWmHY0lB99CqmYACr0kEDqWqDxDWFHSGC7K0ljHA9QW0JrRhpWPj/Z9eyi7yhc7I
         NMTUpvsxBlN/6kExmZqGRPnZfp6TUDrlgbi7meGupf2Jx4X9iqS+AkMC9WJ4c1nQrxXp
         xJu9U/RN6ddvOpjGOO+M6P8FW8sGRw0TZUZOF4QgzylGyCDrRN/wkwykHgOekjZUNe95
         OJet9rZqodOvb0yj6mx+QyWwnIyvUysXKHUaPeH1YuLYpmkL+HPaHZN7hsf0BFD3X0dg
         hHJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738573736; x=1739178536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RtOwM5RxJfd+VfcKZGXtlLQFSXd03HQ8e4rhtGXZjtM=;
        b=lXBiJopaFSD62lTLfN9hXa7mQTqeHafcWJcHgKlqSd24BbcArzvPYNG49udaRJioka
         J9S15fdWAw+IeLlA8QxThlAW4J7k5ktZ1zBhITnPT/c78pMuOGB1BETL8TuijWre09wq
         jmUVoiRj6a7bDcUEmN9+RdF4TTS+V3DbkQUQdhF0mMkVuftp4hjsrHCb73mbTtcaqsch
         kHx2sKdPqUxAP9CybFBY8r6B2N4j9eAKuSEQMgJkTUGEdCp5ZXKnR/YnqUCwNEhobswc
         l4ATtxluboi0JCXgG+BhH0qOydUNSMtUWryUsZGImdBIaapLRaCY65sGK72ls9TbApOd
         NmhA==
X-Forwarded-Encrypted: i=1; AJvYcCUnaTco0qHBUVv+mi7BePFTOVNa/GU1zig4lbM+EGKnaVeJ5Qg/Ig4KV916fSm5HSoLA95ImQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyMspXbs8Q2Jxw9cPYHRDjxH/LC7un/s8dFAmCV4lYKJPnMNQto
	KFfnbrUCuq6jiPhzLC/hXaF1WBleayd7k0xKAXz+jYLOMH485fx/1jnihrrd1Sv/30IE5TvmeX4
	EXkPXmMCx/RZBssMS0QOL5yT90RiSW14UU7nk
X-Gm-Gg: ASbGncscw/Np9890SgACV50ln0M3CfFha9NhqfegnxNfnypG5zBO1/E3+lhq763I8oZ
	CxlZzSeywRgxxIU7MioPbpRjJN8jBQRIMFwocEUsMvgjZN84XgRIL6vq8aGSINyLY/I9KSnceKp
	866jrTPBhfDduqygILQ00X0J+1
X-Google-Smtp-Source: AGHT+IFbq1pWVjjFTT5eK9hOL6FRx5b2gIclK01nWaF+0UuNV0XQVQD1CBTLjwH7htojNlMdbttCQobb6NaNzGYfeNk=
X-Received: by 2002:a5d:588f:0:b0:386:375a:8322 with SMTP id
 ffacd0b85a97d-38c519506eamr20704188f8f.13.1738573736075; Mon, 03 Feb 2025
 01:08:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net> <20250202-rust-page-v1-6-e3170d7fe55e@asahilina.net>
In-Reply-To: <20250202-rust-page-v1-6-e3170d7fe55e@asahilina.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Feb 2025 10:08:44 +0100
X-Gm-Features: AWEUYZlZbKxfLpJhhJPVmBfowDaLOLNb2zkL0fALAziRhJs2A8Tey8gfRdFIvFA
Message-ID: <CAH5fLgjtwcd6heHST2DCrmKWRp4w6KAEOHEoSm7t02J58LSQSA@mail.gmail.com>
Subject: Re: [PATCH 6/6] rust: page: Make Page::as_ptr() pub(crate)
To: Asahi Lina <lina@asahilina.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Jann Horn <jannh@google.com>, 
	Matthew Wilcox <willy@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Danilo Krummrich <dakr@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Valentin Obst <kernel@valentinobst.de>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	airlied@redhat.com, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 2, 2025 at 2:06=E2=80=AFPM Asahi Lina <lina@asahilina.net> wrot=
e:
>
> There's no good reason for drivers to need access to the raw `struct
> page` pointer, since that should be handled by Rust abstractions. Make
> this method pub(crate) so it is only visible to the kernel crate.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>

The Rust Binder driver has a C component, so it needs various as_ptr()
methods to be public.

Alice
