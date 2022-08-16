Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A016AA5
	for <asahi@lists.linux.dev>; Tue, 16 Aug 2022 18:02:33 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id dc19so20335854ejb.12
        for <asahi@lists.linux.dev>; Tue, 16 Aug 2022 11:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=uXGdesIi7LyqHlMu2dT0RxDIuJI5AzNBe4VjC5+ytdY=;
        b=BGaXGJuiB7eGotBqcqWfwy8VgrYrFL9S/Bz2cQMnHb8DGajRYxwJbBwi51UswnEen4
         qeGfJgSl2eiS9ekAhwJadkZI/p8h6CBxAi08OQH7SCDmC5kp547O/7op0YNbaXEekIdO
         A36MXq6QBuMAzvlOfavBoL7t/c3fRWsSF+dBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=uXGdesIi7LyqHlMu2dT0RxDIuJI5AzNBe4VjC5+ytdY=;
        b=Qpf9aNviK3uuyt+VQiOl99Jrq6wF0AqWHKeS/4d2gfd704QiWLB5ht1335AyUWA5h1
         hkge4lEHsfDGIWfX/hZYzPebEEGKGHWhPNvWxm/IbiQCW9NpQ/1NzDqXmMiM5pp6TDCy
         zO6P23PbvKYMJpEWUNI4zmAYnyV3wvjYguqtrxggGIio6nsuN4JgJqszH7sZH/dVDV5c
         24ZO6mTfFsSuSi6LjFctGklcEjhQuzfjFgBl4HWE+o0Uxm+99LwEVOz1MIQrgvJtXmRF
         cRc0BsQu2oEkf0huWssOcOKb567rh7AQdOmr4mg8LGsquHaMRLu6VRz8NUK1Y9Udw4Oz
         GcTg==
X-Gm-Message-State: ACgBeo3tctFgQAtmG5UbAsaIimp1TO1H3Uqu8ty6vZjzkzHUFsfNg7px
	QgLeYywa5Kr0i1VvQJ2IeD7m62pbTwGUDaejpds=
X-Google-Smtp-Source: AA6agR7sljLgfPjZgpDw8lOVcjljlKvtyMapu3n8K/unq5Q17IQINodqILNhAAd3BdomBTHD4zGc/Q==
X-Received: by 2002:a17:907:7634:b0:730:c378:b86e with SMTP id jy20-20020a170907763400b00730c378b86emr14210164ejc.647.1660672951766;
        Tue, 16 Aug 2022 11:02:31 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id kw10-20020a170907770a00b006fe0abb00f0sm3781354ejc.209.2022.08.16.11.02.30
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 11:02:30 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id z16so13509028wrh.12
        for <asahi@lists.linux.dev>; Tue, 16 Aug 2022 11:02:30 -0700 (PDT)
X-Received: by 2002:a05:6000:2a4:b0:225:162f:4cc7 with SMTP id
 l4-20020a05600002a400b00225162f4cc7mr2836760wry.274.1660672938800; Tue, 16
 Aug 2022 11:02:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220816070311.89186-1-marcan@marcan.st> <20220816140423.GC11202@willie-the-truck>
 <c545705f-ee7e-4442-ebfc-64a3baca2836@marcan.st> <20220816173654.GA11766@willie-the-truck>
 <CABdtJHt_3TKJVLhLiYMcBtvyA_DwaNapv1xHVeDdQH7cAC6YWw@mail.gmail.com>
In-Reply-To: <CABdtJHt_3TKJVLhLiYMcBtvyA_DwaNapv1xHVeDdQH7cAC6YWw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 16 Aug 2022 11:02:02 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh3dCn5a4fZuJ7cewJoG9Vrm9xSOShiwgC6MA9=yJvXPg@mail.gmail.com>
Message-ID: <CAHk-=wh3dCn5a4fZuJ7cewJoG9Vrm9xSOShiwgC6MA9=yJvXPg@mail.gmail.com>
Subject: Re: [PATCH] locking/atomic: Make test_and_*_bit() ordered on failure
To: Jon Nettleton <jon@solid-run.com>
Cc: Will Deacon <will@kernel.org>, Hector Martin <marcan@marcan.st>, 
	Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, Andrea Parri <parri.andrea@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, 
	David Howells <dhowells@redhat.com>, Jade Alglave <j.alglave@ucl.ac.uk>, 
	Luc Maranget <luc.maranget@inria.fr>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Akira Yokosawa <akiyks@gmail.com>, Daniel Lustig <dlustig@nvidia.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jonathan Corbet <corbet@lwn.net>, Tejun Heo <tj@kernel.org>, jirislaby@kernel.org, 
	Marc Zyngier <maz@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Oliver Neukum <oneukum@suse.com>, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Asahi Linux <asahi@lists.linux.dev>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 16, 2022 at 10:49 AM Jon Nettleton <jon@solid-run.com> wrote:
>
> It is moot if Linus has already taken the patch, but with a stock
> kernel config I am
> still seeing a slight performance dip but only ~1-2% in the specific
> tests I was running.

It would be interesting to hear if you can pinpoint in the profiles
where the time is spent.

It might be some random place that really doesn't care about ordering
at all, and then we could easily rewrite _that_ particular case to do
the unordered test explicitly, ie something like

-        if (test_and_set_bit()) ...
+       if (test_bit() || test_and_set_bit()) ...

or even introduce an explicitly unordered "test_and_set_bit_relaxed()" thing.

                 Linus
