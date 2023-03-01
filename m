Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E0410EE
	for <asahi@lists.linux.dev>; Wed,  1 Mar 2023 17:23:18 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso8977619wmb.0
        for <asahi@lists.linux.dev>; Wed, 01 Mar 2023 09:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677691397;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6q//m1CEjfpqFhjrDbSC5BAypm/0jrg06FNQbMJmJ8=;
        b=Q5AonMYOod1t7I+bD5dolZMJTkTodjSawwKXEefEu63aXYaTxfAplMseOC3l6dnInt
         IY6UOPbrQM657WfCexe0c05RmFoZMKIRNlf2ZSGjbm877dCZDXL47KHXgAqjwMbqcbD+
         fFZ9h43K2djvLOWeRaVGFJCik3wxMoXdLVWrSDdC8uSB+pIRo0TlWt0zu56efQT5N5ii
         eLdOaBqu0b/Erhf0rh/zrLuLxMd7B8/NyZwPBdbutAls82wqdk0/3nyRQFCWz4hWT6Vs
         DXy5h5dGAJqTATZErkrW6WtVKrKQ/QRNIs2TU1HnPiXSkD8bGJNwOVBcQKnrC3JRvOlY
         1w0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677691397;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D6q//m1CEjfpqFhjrDbSC5BAypm/0jrg06FNQbMJmJ8=;
        b=dF/1sGxMuBV6Alhg3CHrwTCCsYHA3eAXC1JrYVRY9+oCopeFae164E0H4u/mahCwOU
         8ywDhRZ4qtzD1Y9f1N6JNLtLVh2d7+v0kDG5JPpe2yn+B14A2a5FYvH7KVUN1wGpth2/
         APxxRvQxADa68UVCZeXJgntBrFiAh4VyzmweLi9i/vjxa/rZEIuizP65RIpK5LzKEX+t
         5OObzYk4j7gNFCGWuuwjICWE/vM4IC01GLPpwHPpNAXdDos485PPhxp+yP7670GgfrSJ
         +GzENKRQQxDzorQkdnLx9aSpiluLa5k6YGMrJd5rrggjkQWxm6JI7xhXbzmkZ9O6jNjN
         Uzpg==
X-Gm-Message-State: AO0yUKXSy5GVYVJBnRO1GQqSN8vRljZYxOV46a9PGS8JGJHKEhV2jqmp
	oUKWxzL4Wgn6NrYviHObFSo=
X-Google-Smtp-Source: AK7set9yOFJ+2701IOZIcvtfhdWGpm6TIyV0B3HZ49V7YBtK3W44CkBO56vjco2DCs8k9rLV4Ur4bw==
X-Received: by 2002:a05:600c:35c4:b0:3eb:37ce:4c3e with SMTP id r4-20020a05600c35c400b003eb37ce4c3emr5775190wmq.16.1677691397284;
        Wed, 01 Mar 2023 09:23:17 -0800 (PST)
Received: from localhost ([2001:b07:5d37:537d:5e25:9ef5:7977:d60c])
        by smtp.gmail.com with ESMTPSA id h17-20020a05600c351100b003e4326a6d53sm171559wmq.35.2023.03.01.09.23.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 09:23:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Mar 2023 18:23:14 +0100
Message-Id: <CQV7YQW9HU8R.2HH07UP1OA6Y1@vincent-arch>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <asahi@lists.linux.dev>
Subject: Re: [PATCH 2/2] rust: sync: arc: Add
 UniqueArc<MaybeUninit<T>::assume_init()
From: "Vincenzo Palazzo" <vincenzopalazzodev@gmail.com>
To: "Asahi Lina" <lina@asahilina.net>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Wedson Almeida Filho"
 <wedsonaf@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>
References: <20230224-rust-arc-v1-0-568eea613a41@asahilina.net>
 <20230224-rust-arc-v1-2-568eea613a41@asahilina.net>
In-Reply-To: <20230224-rust-arc-v1-2-568eea613a41@asahilina.net>

> We can already create `UniqueArc<MaybeUninit<T>>` instances with
> `UniqueArc::try_new_uninit()` and write to them with `write()`. Add
> the missing unsafe `assume_init()` function to promote it to
> `UniqueArc<T>`, so users can do piece-wise initialization of the
> contents instead of doing it all at once as long as they keep the
> invariants (the same requirements as `MaybeUninit::assume_init()`).
>
> This mirrors the std `Arc::assume_init()` function. In the kernel,
> since we have `UniqueArc`, arguably this only belongs there since most
> use cases will initialize it immediately after creating it, before
> demoting it to `Arc` to share it.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---

Reviewed-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
