Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B1E20E8
	for <asahi@lists.linux.dev>; Fri, 14 Jul 2023 14:02:04 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-c83284edf0eso1698215276.3
        for <asahi@lists.linux.dev>; Fri, 14 Jul 2023 07:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689343323; x=1691935323;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2RX/r2ODC8fCu29Ed3cujFRc453JSyfT5sPImsob4JU=;
        b=BwbXGxAdGDSa8Hh7hYoUt1tjxNITodRy4Ie5C9Ve5VjqA6Jp+nyRz/A8pfmVILcQ64
         waqrj3jD33fIlouxPLj8xVZ7jMJXPFpzZZfFIhJRa14Ko7B0PJ9XRY1ZTwTG/bpqLs6Y
         BruFqcKyT0EUFnXIdp0TIxtA3LQR0nYcxTlVMiwkz4IRgvYemxzWVSA3T8g404mRVp3+
         3dri6WPbfsCB8AwLXDoA9muP0F2W+o/cAaLBQOFQLs1sYckvS7fBVKqH65bEOBGc7dsw
         FK3QzCp5BfBLk4FUwZ4FZA1gNaX3R8wrbNX3RrAAV2tNGAFQZlGdMBItHrESM9ihMcph
         sZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689343323; x=1691935323;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2RX/r2ODC8fCu29Ed3cujFRc453JSyfT5sPImsob4JU=;
        b=C30OGifdd3Qgid8iIKuqV9Z6P7GGIUat3tgcewoeQrLhYPiCfQn61c64pVlw2Md7nD
         yAS6hNlGqdasKPvmxJ2urKiiiklr2RYlEKoieBGqtqPWUMwVxia+jpkbFfbHjxgaJmxE
         jq8SsCod0WtnZEQp1wlmi6o5K2yT1pbJq5Kw7ftoqhUoylJFws1wVoSp5pzy/JJ6ROZc
         S5GUYWMiW2zcuuC0JmZLYPCOpTtohSNfnpL2eTtdRhVcw3XwHH38gplMB9fCi3TSJJSf
         PIO456AoIFSmh3w80ARZSnM/vu8rt0WusaEDQ3XW/IRu+TD4VQU+bOJKMsCj49UNkY+r
         TlnA==
X-Gm-Message-State: ABy/qLa4d7Og4VK+CjPJ8UefVTU5+TbvxANl2UiXlzhlLxeE3Tb2YSE6
	JBMAHY7Zb5otfeFgfhMBCHJZ2HK0Jr+wIF8=
X-Google-Smtp-Source: APBJJlGzu1LO19CXBMx8FKjaV6KIVSfUtdfZqayTOkYrzFmODQN5OrWCNNNYNkUzckjgrty4qCCNo3lYvl3ikgU=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a25:d8d6:0:b0:c62:d787:3acc with SMTP id
 p205-20020a25d8d6000000b00c62d7873accmr25193ybg.2.1689343323690; Fri, 14 Jul
 2023 07:02:03 -0700 (PDT)
Date: Fri, 14 Jul 2023 14:02:01 +0000
In-Reply-To: <CAPDJoNv1HW-5uCj21PX3t23rJ+sbTL4Gm5pDis8HGJ-VTr4dug@mail.gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <CAPDJoNv1HW-5uCj21PX3t23rJ+sbTL4Gm5pDis8HGJ-VTr4dug@mail.gmail.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230714140201.383439-1-aliceryhl@google.com>
Subject: Re: [PATCH] rust: kernel: str: Implement Debug for CString
From: Alice Ryhl <aliceryhl@google.com>
To: ariel.miculas@gmail.com
Cc: alex.gaynor@gmail.com, asahi@lists.linux.dev, benno.lossin@proton.me, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	lina@asahilina.net, linux-kernel@vger.kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"

Asahi Lina <lina@asahilina.net> writes:
> On 14/07/2023 18.48, Alice Ryhl wrote:
>> Asahi Lina <lina@asahilina.net> writes:
>>> Trivial implementation.
>>>
>>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>> 
>> The commit message is a bit short, but the change itself looks fine.
>> 
>> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> 
> It's so trivial I just didn't know what else to write... suggestions 
> welcome (for this or next time I have a patch like this) ^^
> 
> ~ Lina

Adding some sort of motivation usually works quite well, e.g.:

Make it possible to use a CString with the `pr_*` macros directly, that
is, instead of

	pr_debug!("trying to open {:?}\n", &*filename);

we can now write

	pr_debug!("trying to open {:?}\n", filename);

Alice

