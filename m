Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B175384
	for <asahi@lists.linux.dev>; Wed, 22 Feb 2023 12:29:06 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-536a5be71a8so122447937b3.2
        for <asahi@lists.linux.dev>; Wed, 22 Feb 2023 04:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WATwXUE02YF5fbDUCE81eH8TPnQ+aGb50aBo4hFIxNk=;
        b=QiplMiJKUkp/TB3unYMhsHDTD/GjvtyQDJwG9g4AB9HorSIemK9MXheuD28uhMh8Ks
         AMPGBsz9r8OkKQh0SqQs4teBvRVkJnFdZRcNcE/7RkOrGT2eJtRI7iXwbQWcpFO6gW/3
         3LPXCeH+qvFquFojltdc4jBWqFvp84lDKoxUsxh82a/aGX3NNKl4i8MMVd5Eer6waXiF
         MeNhluqpC4vi+0DIMGAINO7VlqHX6IYCxMJ1xlt6yh0NDh3ndRbtN7H17DDCaWQkmZ/u
         kdgjhpo22NH4PunI5qk82PmqpzCp3bhCe0iUi3OWS6sIhHr43KNfSRQM41FWJGTRg+L7
         dZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WATwXUE02YF5fbDUCE81eH8TPnQ+aGb50aBo4hFIxNk=;
        b=JhwtvN8hNzB+3RCvTagWxMsEfAwgmJ6IvbwAkR69r4ftI/snsK2mD4+PWAlwPkI8Zu
         HguhkoifdzA1cL50DIp2Mj1P1iX2unSZU7XdNea18GS4tTcRmQPeM6aoXkVhoJSqlzot
         +GoAVvHjxP/TmB5wzDtNncv3GI/BfccVxjbEbfauvqMK0po7I82c6LaSSRKR2Gberuuv
         Q6fTv+QzgUtg0GWOE6flu1p3DNmvCZQ849oFxgzrykS6i0Whp49yg0LR5Bzth9BrWE5V
         R7OxjFq5HgnjFgpNKK+WhChJm9nLokagAnXXerO7JEK7uC/AeLH2RortqHXBC7rcjBzl
         8RlQ==
X-Gm-Message-State: AO0yUKV6DglA5+Uwk9VGxxC1tti2gG480cBMq9KUBm7U94pqGAhNr6M1
	uwPvXcWeDgPkzC9nW1SnqOo+IoMxnRlgZyChW0Y=
X-Google-Smtp-Source: AK7set9iQGEwnkH6nWOLKIx3MM7kSE/R4iRhOK7Pktwfd/hIpbvEvpG36h+EpIRBkU11LdyJJUgCZPWV2Ry1J0o3GJ0=
X-Received: by 2002:a81:66c5:0:b0:527:9733:fdee with SMTP id
 a188-20020a8166c5000000b005279733fdeemr692330ywc.490.1677068945192; Wed, 22
 Feb 2023 04:29:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230221-gpu-up-time-v1-1-bf8fe74b7f55@asahilina.net>
 <87v8jvnqq4.ffs@tglx> <Y/TP6as7qqwfcI42@boqun-archlinux> <87h6vfnh0f.ffs@tglx>
 <7b93bf74-abdc-f8c1-9a12-7c7f080f9e19@asahilina.net> <87edqioo1e.ffs@tglx>
 <CANiq72n-++roTv3yDNOA=Mi_sscBZX3xPdZ6RZ0Oxx+T82pf5A@mail.gmail.com> <87o7pmmtre.ffs@tglx>
In-Reply-To: <87o7pmmtre.ffs@tglx>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 22 Feb 2023 13:28:53 +0100
Message-ID: <CANiq72=oPCO=+yksn4qKemp+OkCm-+T54DQz9f3sSD5SQQLRMQ@mail.gmail.com>
Subject: Re: [PATCH] rust: time: New module for timekeeping functions
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Asahi Lina <lina@asahilina.net>, Boqun Feng <boqun.feng@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, asahi@lists.linux.dev, 
	Heghedus Razvan <heghedus.razvan@protonmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 22, 2023 at 1:24 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> Back to time deltas (or duration types). Independent of the above it
> might make sense to be type strict about these as well. Especially if we
> go one step further and have timers based on CLOCK_* which need to be
> armed by either timestamps for absolute expiry or time deltas for
> relative to now expiry. I definitely can see a point for requiring
> matching time delta types there.

Yeah, if you think having several delta types would make sense for
some use case, or at least prevent some bugs statically (especially if
you have been similar issues in the past), then I think we should
eventually do it. Not necessarily now, of course. We should just keep
it in mind before the types get a lot of use, because it can be easier
to merge types (if they end up being unneeded) than to split them
later (double-checking each instance).

Thanks for all your feedback on this!

Cheers,
Miguel
