Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA9218C900
	for <asahi@lists.linux.dev>; Wed, 31 Jul 2024 08:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722414733; cv=none; b=qA624lcvW9RBuGtgLRB9s0iNOYuy5yDyevKdCcvFHDQisW1uUU8JzUCzJ7Kvi1GRFJDippAZe1kwGvE84/4CdteE9pxY4b9s4IodiB1H3SnNpqMkwCG1H8TAtZkBa+LEXM9iX42+eqTnK0kAq/Qhiy9GianfCmZt1le9tf3zims=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722414733; c=relaxed/simple;
	bh=zwBc+7j1gOA4RZxN95Rhd67uNlCz6saAi/ghZlnCYt0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ajLOCrlMycpl7v1L677zxX/xTtjWr5x27brm62DN0FEEImDBIYCyTxRqiCWKjIYSuhDX1ySpRXrE/0uF34nPM7qMZ1GCMqXMFboTnFZJFF0UW3X2XyiKN1tzqvTv/pVaczqWcXmkjts+XYdVxteWssPbXA1oodCh6E3nhz36+dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M5GQbzlT; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M5GQbzlT"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7a1be7b5d70so565241a12.0
        for <asahi@lists.linux.dev>; Wed, 31 Jul 2024 01:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722414731; x=1723019531; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iL+G1y8BebAmWAL7Z1uTpjezb81fXhMCih8TdXof3zU=;
        b=M5GQbzlT66DYr+ThmU1msl1PlFxBYEQT/wQcX/VPwhaTMmceRIcMc58XNZTpHdd5Rv
         KKOFTRzfZUt5jyHFYzf9Q3RjEeibuBceEbVrTOUfCLvVTlTVhr2s28EDySZsGSjR9KqA
         xlYy1qk6Vw4BOmSijAIo4OVvbHblCL5CuZR15qIt1+N5Q5V83woDXJHZmvY9cxsRzGPh
         OeiiT1nuTpI87aBzefLywluzNNC9HNdoC/u+Cg1o6V8HUDJkD1l1QOCDCgxQWTOVIeCi
         Z+GkIaIA3bQY+umabPsKIy8VvqT0pp5JSJYw+nMH+kL4plP6QiszthiEBqECMtSFpxlu
         GnVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722414731; x=1723019531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iL+G1y8BebAmWAL7Z1uTpjezb81fXhMCih8TdXof3zU=;
        b=kla3XIHF8fekdr7GWHwsCJhA2+f1aR/E5RRa0OTzoy4dOPqC0n7e5F+WtBvtLmIPm2
         8YlIaxiYuohSwzxtGp8E8TJ8gprQfRKb+zZDO1rab5luJpVqEo4sVL83TK1H706rJklh
         B3p3/94hOdUtf7VaCRpfJA9Rw5jqQDWfDinfarx0U4tJWO/yy3+RSQ5b5ziSBNMXcign
         wJlyiJ5HGjn9Z3xY8lXqdbmlq3y+kfqAYef0939f+emMxHBD3rCuRch+FknPNY6VeFo8
         gaBgJKN4BbEtyDw4b8dCwOEEOsjefSTlnS7X8hBzPVdTyfv9OgY5T1TYPkETXDg1Wi99
         9JNw==
X-Forwarded-Encrypted: i=1; AJvYcCW1wyIi4cn4S8xVAAinK60c1FWU3hmGzhNtDrRZmT/2Ay6Ct0wMCb7zvW/3ka+WoN8JmerKLNbnSR4DEvdEBG3Tm18Y1LE=
X-Gm-Message-State: AOJu0Ywwy0nYmJd6Nx1bgK0c5XueItBd/hTxPMGRNBALuYscdnkZXvM+
	pEEWRUFJyww06um6enMax4YT1VhYk3OSoKabFMUWLQH9jQC+zWHGYYylh0u+qpsMhKUJOBE9rYH
	NlUlQNErs56Nzi7JXG+R6HoKlrwE=
X-Google-Smtp-Source: AGHT+IFLifyxPwPs2V/mWl8Q/lMkHvc/4jKMKDeqHYBr/em7bPkFfz3c/JwkPmtAwbt0Mx9a1loSf9CNfX1otqlHP/8=
X-Received: by 2002:a17:90b:78b:b0:2cb:4c30:51bd with SMTP id
 98e67ed59e1d1-2cfcab35c67mr7433852a91.19.1722414730959; Wed, 31 Jul 2024
 01:32:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240731032030.2847151-1-neal@gompa.dev>
In-Reply-To: <20240731032030.2847151-1-neal@gompa.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 31 Jul 2024 10:31:58 +0200
Message-ID: <CANiq72nXN-pkHAG6A19JrjiL-uKpem_-8GN8RhiVgc+sKJN6wA@mail.gmail.com>
Subject: Re: [PATCH] init/Kconfig: Only block on RANDSTRUCT for RUST
To: Neal Gompa <neal@gompa.dev>
Cc: rust-for-linux@vger.kernel.org, asahi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Asahi Lina <lina@asahilina.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 5:21=E2=80=AFAM Neal Gompa <neal@gompa.dev> wrote:
>
> When enabling Rust in the kernel, we only need to block on the
> RANDSTRUCT feature and GCC plugin. The rest of the GCC plugins
> are reasonably safe to enable.

Yeah, only that one is what we had initially years ago, and then we
went the easy route since anyway the mixed builds are best effort at
the moment and GCC plugins could possibly be going away anyway.

Did you test it with the other GCC plugins enabled etc.?

> +       depends on RANDSTRUCT_NONE

Also, why is this changed?

Thanks!

Cheers,
Miguel
