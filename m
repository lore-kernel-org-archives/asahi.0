Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAC01C17
	for <asahi@lists.linux.dev>; Wed,  1 Nov 2023 06:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UiSptMRI"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9c603e235d1so1012945166b.3
        for <asahi@lists.linux.dev>; Tue, 31 Oct 2023 23:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698821993; x=1699426793; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OoRJsZQA0JRmj7+Zm7KWg2a0Vv+QGemQYHWSkunKRm8=;
        b=UiSptMRI7nTO/apYZKGpq7Q0erUtDXhd3RMUuPh4aaBAeJdl98GjMCruJ2LzV61tfi
         KNzB7wnTvaGB4mlVbWbOd3UqDzRoU5pB320CoABn0W40sJpLh5diTERBDPx9m4LswrHv
         am3WQEzR2j/r0God5s2a+4BZ2soXK7g2CFODFGZ05bpqsaHktNxN7C+0gRWtBI7IWJcu
         Moho4muEdBNiFiPC4Bq2wHRPAiNto/nA5AjhJAQLufjs9BsplxNIMFgSYMPsiIIotxVk
         YyDHaVns6gf9dy+FTh5OtIMoTayLhK32FV9T7WIqj9iZ0SWPd/BmtALOPuV0VfSjQZwx
         1QOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698821993; x=1699426793;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OoRJsZQA0JRmj7+Zm7KWg2a0Vv+QGemQYHWSkunKRm8=;
        b=Q2+J9foakeZ4x5SebuIEqdmV6yeb0yidHjbx556XIq5E2U+v4vZ0rK/4HEJmj+gyWK
         U33E++xJrd+eQxdVp+0nb0OmLWM7kJNhoOSnsO7RRfJXz3DXx2W9sKfYtUEjd2ADZ1Ck
         tzjAxZOQmWHwlbVvUOsT6naNEtcM27+jSRy48o0n9UkaaI8pXtiYvQgdn4A4D7rIR/NG
         ciAQKz/hTe9TmG0xsBJr7H227xoj0gCn2zshcRz5Xb5mS5F7aXRXWfeTgm84Oiz3aOpu
         4P+Xn1pVqSX0i6RP0reU80isGUvCVz9D7fp2lJjyXM6lCJ8mcqYxI9OPoyIriNkMri2w
         aoPQ==
X-Gm-Message-State: AOJu0YzYMgBJA0JToOXWiF0LfXb5N28k5CCbWovxg9+MIAw6ZX16+bZr
	7ItU0uhWxO9xPUL+q8V8XuYloG825oopTCDE2FM=
X-Google-Smtp-Source: AGHT+IEr42YbSo5u1ztwgfEXuJgcVFbGHH6ew8zc8QEvevYhY3xgiLLyXDW3jKmYJXFF/eUQO4FOj43/eeqO2NRVnLo=
X-Received: by 2002:a17:907:36cd:b0:9be:5ab2:73c2 with SMTP id
 bj13-20020a17090736cd00b009be5ab273c2mr1135771ejc.58.1698821992749; Tue, 31
 Oct 2023 23:59:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <9c0cff84-45b1-268f-bdad-38c16316dbc3@amd.com> <20230714-drm-sched-fixes-v1-0-c567249709f7@asahilina.net>
 <20230714-drm-sched-fixes-v1-2-c567249709f7@asahilina.net>
 <bef7ef62-3cd9-6ceb-5eb4-5ae0c0236778@amd.com> <de502b41-2864-db1e-16a0-8a5d5e0e4ad3@asahilina.net>
 <d9dc2fd5-d054-dbf3-72b7-fe9deaa46350@amd.com> <236422117088ca854a6717114de73d99b2b9ba2f@rosenzweig.io>
 <a42bd218-6eb5-6ddb-bbb4-d25118c59f40@amd.com> <7b564e55-a9b7-0585-3cf1-d1f132f9a918@asahilina.net>
 <daf48d76-ceee-c82d-a63a-e8e7770a9d83@amd.com> <f5de10fa-57d6-a3d0-1cf9-084491aa6025@asahilina.net>
 <200e9d74-7191-b1ed-e5f3-775827550853@amd.com>
In-Reply-To: <200e9d74-7191-b1ed-e5f3-775827550853@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 1 Nov 2023 16:59:40 +1000
Message-ID: <CAPM=9txcC9+ZePA5onJxtQr+nBe8UcA3_Kp5Da3zjKL7ZB4JPQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/scheduler: Fix UAF in drm_sched_fence_get_timeline_name
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Asahi Lina <lina@asahilina.net>, Luben Tuikov <luben.tuikov@amd.com>, alyssa@rosenzweig.io, 
	Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Faith Ekstrand <faith.ekstrand@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

>
> Well, to make it clear once more: Signaling a dma_fence from the
> destructor of a reference counted object is very problematic! This will
> be rejected no matter if you do that in C or in Rust.
>
> What we can do is to make it safe in the sense that you don't access
> freed up memory by using the scheduler fences even more as wrapper
> around the hardware fence as we do now. But this quite a change and
> requires a bit more than just hacking around
> drm_sched_fence_get_timeline_name().

I really think this needs to be documented if nothing else out of this thread.

Clearly nobody is going to get it right and hidden here in this
thread, this info isn't useful.

Can we have some sort of design document for the dma-fence/scheduler
interactions written and we can try and refine it with solutions on
the list, because I'm tired of people proposing things and NAK's
getting thrown around without anything to point people at.

The next NAK I see on the list will mean I block all patches from the
sender until they write a documentation patch, because seriously this
stuff is too hard for someone to just keep it in their head and expect
everyone else to understand from reading the code.

Dave.
