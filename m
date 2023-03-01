Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB68410EE
	for <asahi@lists.linux.dev>; Wed,  1 Mar 2023 17:16:33 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id v16so11201688wrn.0
        for <asahi@lists.linux.dev>; Wed, 01 Mar 2023 09:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677690992;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4NETed6QsszCCfbxUNnOzWzkjjDv/q/IkI5fEDoX4wI=;
        b=j5PAiYPlH764lcPR/m7bd58SFHRINpPSYn+8pyDy66s3KWxkMDtOrMr6HS1ftAgCsB
         KCFgPs0iZGQA0fRKL66/ZxeLPISCuAQgWgbXCseJcE+WFUVNicam9ctuQjs78sgzOI/R
         WULWUUUgLlLsiDwJ9gZQ/7xnXqNzQjS7gbUDFIu9vH0wYBSDutnBH1yxxehHwccGngjp
         dGDPw7SXtPa1TpT0Q0wZwhuH/uYHrpfLE/23eHf3gIK7pM2abGWzWjNuTnE6T9V2rLSY
         5mTlOLEayhKOeQKgzyZt0no97Y5Dk+C0BTGX6hzXfrFvy6YynpKW8UwM7/PZ7y8JWjyB
         0tOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677690992;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4NETed6QsszCCfbxUNnOzWzkjjDv/q/IkI5fEDoX4wI=;
        b=kS+O3akRmFbcUu3oLBBOtO/J0MwR7hWXr0k3OtNvd5oRg4lD5XgbgQxRd/3T0eu213
         sLI6d0toL83XUvLZyWhY1Vnr0qankLzbuCtvy0nyw3NWDalFKAXoyDbyj1kpM6B5VPYi
         FMdFySFcrwOK2kGlmPebIXGPpl7II8cfj+wiFKvP6clN2bp5eVKfir/vs2kvagFfHPni
         ZNzvcvl9+a0duKUWRhCX+gY3jHjhyTYSkZMTAQSyvwC6AQXS0OZbb2II93MFn0PkyKtS
         aCiB7JKr5udlPlMnHd0wE084uKgKq7yOgO4GGhxddzwUTF+ncTyij1Cl81lQYQ7hcI81
         o+bQ==
X-Gm-Message-State: AO0yUKXCpoYsryz49FqH2PO8Quv2wlChGk7vQQkVWQwASOagbbkqD5Eh
	TE+dDslxSwb7ft841dwnY/I=
X-Google-Smtp-Source: AK7set8n6Dv3tseaeJcVVe8S4m2p2/U1dnhpG40bkNzStOXjHpD7+sncmZigwAsWCYG7wao5G6x2DQ==
X-Received: by 2002:a05:6000:38d:b0:2c5:5ee9:6b27 with SMTP id u13-20020a056000038d00b002c55ee96b27mr4969422wrf.13.1677690991742;
        Wed, 01 Mar 2023 09:16:31 -0800 (PST)
Received: from localhost ([2001:b07:5d37:537d:5e25:9ef5:7977:d60c])
        by smtp.gmail.com with ESMTPSA id q10-20020adfea0a000000b002c567b58e9asm13303970wrm.56.2023.03.01.09.16.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 09:16:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Mar 2023 18:16:29 +0100
Message-Id: <CQV7TKRQDUHG.2RWP6Z9ERRF9B@vincent-arch>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <asahi@lists.linux.dev>
Subject: Re: [PATCH 1/3] rust: macros: Make expect_punct() return the Punct
 directly
From: "Vincenzo Palazzo" <vincenzopalazzodev@gmail.com>
To: "Asahi Lina" <lina@asahilina.net>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Wedson Almeida Filho"
 <wedsonaf@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>
References: <20230224-rust-macros-v1-0-b39fae46e102@asahilina.net>
 <20230224-rust-macros-v1-1-b39fae46e102@asahilina.net>
In-Reply-To: <20230224-rust-macros-v1-1-b39fae46e102@asahilina.net>

> This makes it mirror the way expect_ident() works, and means we can more
> easily push the result back into the token stream.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---

Reviewed-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
