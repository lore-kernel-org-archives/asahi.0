Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B461D63E7
	for <asahi@lists.linux.dev>; Tue, 15 Oct 2024 23:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729034558; cv=none; b=X31VsyyDGxGmSwi79a2759Cn7Ul48JFly1P2/AA7/7tCbHR8kjx+EApiiHzW04IOz5Jdq4xUt7JcO4w08SzfbTlmi0GPDfuT8WQQsIsWEZ88BqYccgJo7NVUgGk4v5rAwDk8Pecm9uw7On2mgylke6Oq2+5Ana/qTGJJzet9Z3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729034558; c=relaxed/simple;
	bh=I523jeJXbcx4KI8RALYv3nNxeV4rQgapD1DZyvsalGc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IlrII0ucuDgjRA1Wc8P8EATESVAv9ry3TaP/88TCjQocQ6CxmxZrRTW47oNJMqlvpcpLkpMU5KvqP5l3ASYMXqCMuRfqyaO7YT4tq7B62H6l1zeITUNyf70hYJLKXaA0YOtl+LaOV3qkY/ZCDDxgje+s+qXygyWDBGSIaSf6Fbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DEHXs7zn; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DEHXs7zn"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539e681ba70so1999e87.1
        for <asahi@lists.linux.dev>; Tue, 15 Oct 2024 16:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729034555; x=1729639355; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9RUvHKuEBPAnu6MBocZm6vLF52qHvXQbIHH1GlTyCVw=;
        b=DEHXs7znAxVEA2Gd/nYY0U4Vzt6QyeJy3ne8cDwAUlJlIxm0r2/RQemx6fbBQt3kwO
         xfSAuzSYbF4gNEvMGANFQwizmROAWSMVKu5NIzFzatjOfa/Cy45EQ7BJPwwhVf84eUNa
         qdvTVbZrVPXsZkyPXtLQJ30QlKzxpdqEcmPRYg/hKe0WNvPMfx/zTyU0id5jzf9S7iBK
         vQHk6Xkjq+1naiOb96QKrgkto9ZSSY9cVsHcfmFQCk5AzoL0uxr9wcuxFtxd7Wv8npcB
         8lquGttVJS5cmdavCTxKvFl49igGH38LGdz1sVVnJZHQ3n6bqBbkDThOASXEuiiS8HXd
         gZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729034555; x=1729639355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9RUvHKuEBPAnu6MBocZm6vLF52qHvXQbIHH1GlTyCVw=;
        b=jM8rbxPQfIHuVDTmXH7iuQEmkrzW95ogC6NXFsnPB8+nHJFTvdJqcTGxHeyuT7lNgL
         /P1BFwCoLMPwfFK5aZad9zlJlmUPyu5GD7pRgrUKImI/QrZqbuCrwRDYIAQCIX4TdG/X
         JNDPyHzn9i7Ju8WH9E0btlAJ735W0bq1zFj+BVklvqNwBa8evrDSbOHQRv/VenfCFPbw
         0qBCbWv0w/wka59HpYsAcAHn6BpYJ4z/ELoJvCfh5/a5dPQ/JG89ztb7MFQChUp4Grqk
         BLoo+u75lspTgOi74hBRY0eT10bhNONWjMC+grR2+rc4RDR4e8TtuQtm4uIbMrBLwnDx
         KN4g==
X-Forwarded-Encrypted: i=1; AJvYcCUtYVdR68oEfmyi+OwhcM/g6LCVo/4V+zq/sfdLUMnSrKyz1MD+pT2pQLNLAotcEye5oQJG1A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8L5FisXvTqS66JC6TcGvHJz+I9h+WwaeC80KhvMaiMMx0UOoA
	Rkfj9q9o1BetcHRNqTk0NoRQJH1kSzCVMBXDVPCSNhU2xe/envX+rlvvszns4Y5sADmkXbegN/K
	z2HBnw7ETHxFMw+nXxcBvx0bkSgf3L3cT0BZQ
X-Google-Smtp-Source: AGHT+IHGh6PUQoy8hght4ieDSeR+Tsek80+k3WjbTEsufsVtjnaI+27i1yToDuq/77zg6Ww2K7PJe7qX4qx5sJCsaJo=
X-Received: by 2002:a05:6512:1592:b0:538:9e44:3034 with SMTP id
 2adb3069b0e04-53a04d02628mr174009e87.6.1729034554499; Tue, 15 Oct 2024
 16:22:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240925233854.90072-1-mmaurer@google.com> <20240925233854.90072-15-mmaurer@google.com>
 <ZwmlEYdS0aPVF32k@bombadil.infradead.org> <CAGSQo01o4fWYwSzZHX5dyTUKcaCSZ7z-hPQ8w63tgBPGbM_UCA@mail.gmail.com>
 <ZwmnnMmqVWLaelvQ@bombadil.infradead.org> <Zwm4lXdKB9RfPQ5M@bombadil.infradead.org>
 <Zwm4v_1wh5RwuHxF@bombadil.infradead.org>
In-Reply-To: <Zwm4v_1wh5RwuHxF@bombadil.infradead.org>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 15 Oct 2024 16:22:22 -0700
Message-ID: <CAGSQo03df-tnmwcz4nh3qtuQPKQ2zLHW0juQyKUXGsdeS7QkLA@mail.gmail.com>
Subject: Re: [PATCH v5 14/16] modules: Support extended MODVERSIONS info
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, Michael Ellerman <mpe@ellerman.id.au>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Benjamin Gray <bgray@linux.ibm.com>, Naveen N Rao <naveen@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, neal@gompa.dev, 
	marcan@marcan.st, j@jannau.net, asahi@lists.linux.dev, 
	linux-modules@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

So, the basic things I can think of to test here are:

1. The kernel can still load the previous MODVERSIONS format
2. The kernel can load the new MODVERSIONS format
3. If we artificially tweak a CRC in the previous format, it will fail to l=
oad.
4. If we artificially tweak a CRC in the new format, it will fail to load.
5. With CONFIG_EXTENDED_MODVERSIONS enabled, the kernel will build and
load modules with long symbol names, with MODVERSIONS enabled.

Is there anything else you were thinking of here, or are those the
kinds of checks you were envisioning?

On Fri, Oct 11, 2024 at 4:46=E2=80=AFPM Luis Chamberlain <mcgrof@kernel.org=
> wrote:
>
> On Fri, Oct 11, 2024 at 04:45:25PM -0700, Luis Chamberlain wrote:
> >
> > Also, just as I asked Sami, coould you split this up into patch sets?
> > One with all the cleanups and elf validation code shifts. And then the
> > other code. That will let me pick up quickly the first patch set.
>
> Oh and if you can think of ways to enhance our test covereage on all
> this as I noted to Sami, it would be greatly appreciated.
>
>   Luis
