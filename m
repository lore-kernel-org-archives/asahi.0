Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B712D51F
	for <asahi@lists.linux.dev>; Fri, 14 Jul 2023 09:48:54 +0000 (UTC)
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-993c2d9e496so105017366b.0
        for <asahi@lists.linux.dev>; Fri, 14 Jul 2023 02:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689328133; x=1691920133;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LgB9Mhn/4by5bCjJpUEX/UcsNdb0bdjrrqXERtCyeLI=;
        b=C3GVqpZj6i0V8gkeGoO6N72GIt8HeLW1V5EMHZbZAE7/3bqd+2NE3EZ8b624qO0BD3
         jTO0ejZIZ84R7+1oKeHt05CyuT8Yx571+hljrlG5bjx1A1tD1ebv55QLpfBRWvTwo4AF
         GzCHxriMdWWJVLRQKR+UjdxcFE3HjYbbFlnfTPROo/NYJ+hrJAVz/+FBBQYzZd4j2l7+
         NJDISCiRb0ci+5wZj6nIp6DrgMm7Wj6aX5gOS4SEwwMGtbmLUrQbwlhBZT/VSrNLaG1X
         qJ5wEbRmzJVJbeja9uKq4s2N1dI/cKc9HshqAOGM81iO2tuSTFwCkfsqx/D/Rb7xc8X2
         Bqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689328133; x=1691920133;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LgB9Mhn/4by5bCjJpUEX/UcsNdb0bdjrrqXERtCyeLI=;
        b=WgcGWTmeaXcUyGZUxlGDyU4VscMMMCnBDtH9c9aB/5K9Jh/FX4ki7Z4q4OLKqaOSDf
         H43clkcJkYU3JOR+WeUIt0B58dnuyiW6hvWFlgLPGk2z1mQ2axnrs6GAgC8cVwNGCD3u
         bSKwMz8f9UwFAOFMGWfkCbVrVXcMGB3Lu3Mqeq7typJDFgaovzrGptHqZZKPWhkULtBJ
         kY3rHZSyuGLBoPoB1LYYIIjC2kCsIfJQjZoh1hoS/+URTNmYrBKS6Bhs6lwjzfpduMpR
         uM2ObWtvlIKOH5Gge8d5bEVROxgeYt9EboVFz86+9ebCg3u0uVZbU82AhD2qO3qcW23Z
         1NGA==
X-Gm-Message-State: ABy/qLbyB98Hka6myahiEGzI41iCBtq/QwYO+E/ReV7v63d4eicGTZjY
	mrArMnh06LzFI1Lv6YIBnBxzDbtk8oeC0kA=
X-Google-Smtp-Source: APBJJlFX3YPOyr7+HJnYzpBJU6w92y6qG7Iwif9vTDearcfvz9cn3ZRfZBU1/7bS7OzWLsIsm/mXxa4S1pwPyb0=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a17:907:2c78:b0:98e:10f5:db52 with SMTP
 id ib24-20020a1709072c7800b0098e10f5db52mr9590ejc.7.1689328133162; Fri, 14
 Jul 2023 02:48:53 -0700 (PDT)
Date: Fri, 14 Jul 2023 09:48:44 +0000
In-Reply-To: <20230714-cstring-debug-v1-1-4e7c3018dd4f@asahilina.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230714-cstring-debug-v1-1-4e7c3018dd4f@asahilina.net>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230714094844.2189906-1-aliceryhl@google.com>
Subject: Re: [PATCH] rust: kernel: str: Implement Debug for CString
From: Alice Ryhl <aliceryhl@google.com>
To: lina@asahilina.net
Cc: alex.gaynor@gmail.com, asahi@lists.linux.dev, benno.lossin@proton.me, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	linux-kernel@vger.kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, wedsonaf@gmail.com, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"

Asahi Lina <lina@asahilina.net> writes:
> Trivial implementation.
> 
> Signed-off-by: Asahi Lina <lina@asahilina.net>

The commit message is a bit short, but the change itself looks fine.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

