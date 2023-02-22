Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87255384
	for <asahi@lists.linux.dev>; Wed, 22 Feb 2023 12:29:41 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id g8so8012145ybu.13
        for <asahi@lists.linux.dev>; Wed, 22 Feb 2023 04:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W+y6jYXWsto0YHDByl1yTKE6KOcfbkoNMI/hyUMcuvE=;
        b=hKd+3ILDn5umqyh3E+tUNyNXuU97ZBYVgCxEd/hL1bp5/i2R3ww9Rl8ETcvWq5EbFQ
         mK2kWKdUQuvJRUWY+yXWw2bLA6wXVt9MFu9phfUyLwMkeS4+yEYc1RmbvGW7ak1NP52Q
         7MBkM1ID9GctLiXC7H2LgyctX5pbCL/TtdOcXRnH28w7eann/7Q4JlAV23qjhSktMwaj
         WXTJoPzyxobebTg+4uz2JmAcTh/mAxuP2rG9bYCDPYeqb7GDMPVDUyCxayt9qre2UEnq
         vQHngphFvWmPJhaltMZcormFomcFpx7qEF5QeKrqWyJezP7L3zD5z5ofbLM6LUsvo36P
         BG3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W+y6jYXWsto0YHDByl1yTKE6KOcfbkoNMI/hyUMcuvE=;
        b=farkFIy9gLsZGo8auDBz0+KPU2C760fvWSUzbVgdeVJ4pEe5j/VJAShGta/ObiCJxy
         Ra27/gJBXnMfD4QPaCMXWPuc5As901lS0DVL2axeAoCe7BZOusNznWod50mZI6o4mmUc
         hAALKyooMmpy+ryIC4n7EdWvSAV9AafTk5Ziu23GIEOqjAmtnVWCp85qiOOTaMbNA95r
         hmmaA3cuuy4iiZ1JlT7x7VdFSwDVoPhiy/kJ/nKPRrojr2O2y929qprqgte/x/pdjVnt
         9qnV6vYCa/0TlZDSrQrYys/Fdinh7YtFqu7n3ZTFW13CtGuph8DLbu9/4vGbc5EZ9BmH
         x6fw==
X-Gm-Message-State: AO0yUKWa9E7ZLc+3lUGCmJhE7KdWPgHSOEOJhqQfldaNR77tDoKnOv3p
	yfYNxvEV8xHa6uIJlKzYUqp50iM4ka9s2Eg/U5A=
X-Google-Smtp-Source: AK7set/qV8h6RC3N11l2G4jmnq+35W3WK18sceJQ4Nu3CSuN3W9Z9TOL4G5XhbVHDmm4uIHggKG0+UTrgzqh0kzdV84=
X-Received: by 2002:a5b:c82:0:b0:8e3:28a8:bb5c with SMTP id
 i2-20020a5b0c82000000b008e328a8bb5cmr648282ybq.154.1677068980827; Wed, 22 Feb
 2023 04:29:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230221-gpu-up-time-v1-1-bf8fe74b7f55@asahilina.net>
 <87v8jvnqq4.ffs@tglx> <Y/TP6as7qqwfcI42@boqun-archlinux> <87h6vfnh0f.ffs@tglx>
 <7b93bf74-abdc-f8c1-9a12-7c7f080f9e19@asahilina.net> <87edqioo1e.ffs@tglx>
 <CANiq72n-++roTv3yDNOA=Mi_sscBZX3xPdZ6RZ0Oxx+T82pf5A@mail.gmail.com>
 <87o7pmmtre.ffs@tglx> <Y/WDz013yBIfQPDq@boqun-archlinux> <03e9af69-3fea-032d-6dc3-ac0ea8e57471@asahilina.net>
In-Reply-To: <03e9af69-3fea-032d-6dc3-ac0ea8e57471@asahilina.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 22 Feb 2023 13:29:29 +0100
Message-ID: <CANiq72kyULg=rPzK3QDqCJny3zjrOKzrH=v2PCTY_pUae-ODgw@mail.gmail.com>
Subject: Re: [PATCH] rust: time: New module for timekeeping functions
To: Asahi Lina <lina@asahilina.net>
Cc: Boqun Feng <boqun.feng@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, asahi@lists.linux.dev, 
	Heghedus Razvan <heghedus.razvan@protonmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 22, 2023 at 5:46 AM Asahi Lina <lina@asahilina.net> wrote:
>
> For the actual Instant type, I was thinking it makes sense to just
> internally represent it as a newtype of Duration as well. Then all the
> math becomes trivial based on Duration operations, and when we replace
> Duration with a new u64 type it'll all work out the same. Fundamentally
> that means Instant types are internally stored as the Duration between
> the epoch (e.g. system boot) subject to the way that clock ticks, which
> I think is a reasonable internal representation?

Yeah, I think that is the way to go -- that is also how C++ represents
time points as well (including libstdc++, libc++ and STL from a quick
look), as well as Abseil too.

Cheers,
Miguel
