Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633E8A92D
	for <asahi@lists.linux.dev>; Tue, 21 Feb 2023 22:29:33 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-536c02c9dfbso74168667b3.11
        for <asahi@lists.linux.dev>; Tue, 21 Feb 2023 14:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WceuJ8ipts0UOpiT/1mKTzkxwZ9KCev5b/cduPZ7ipM=;
        b=mHXK3HV/KEU2F1Y65ssS2NiVXYebymD3gw8kYwgN3T+MtGvSRypgDoBFg9i5wbAFuq
         JbCBo0srDIdt9T4foDTVpysNp0D6nb4v3ocO4FzN5YEUC2wFWbSqPiN6ClqXsRrcgf+D
         kCLDrUTSu5BQm60FqYPQm1t43DKTBo7w9Ydaazdx12E2rQe78uVnI/DBwa1bGeCJMwE4
         M/nsC4ES6E31XoDVeBQI+3OSQUthFU+eBN5sd+CzDH+M8lZTuqnK4dmMq0Yysas6sU6M
         35QSPyXjSmS0bIhBKErGp+sMZ1FCeiDWJVO37eAd7Ihuw/6G+cWzx9+71oCA0ceb7h/j
         /MCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WceuJ8ipts0UOpiT/1mKTzkxwZ9KCev5b/cduPZ7ipM=;
        b=DfgFOqS8h+e3c58du5u+G30+UWyToqb1js7U9JEoy8peyP9+zcGB+tp2o9lsmaz9ep
         f/oc+g1207Ft73LEnYLizPvjm3OZjaFfZm+3wjZHZlOrWitJL4GQKcnQaF1Uzp6GISN8
         AUhAoLibW0/+rDLa02+aa1JOQ+cDC99sxQYwerq/eYTjd82Sc3P26SxUY8l8fz4XPLBB
         Ew56+0zfIfd6asyFTW3qYF+HxYZ9qUWTvmeVESDTLrAFlSufvl/ToCxiSEODTQjqGGzW
         P1trEqjXhGfILd/sngHpGebfIpYv73vhuOHRSDMF/ih3P542pUyM2jsxH2fA45NbDRZn
         FXMQ==
X-Gm-Message-State: AO0yUKVdMbsx0ZwHG7jhwG7YItegF+VL7F/gfKFou0Eggxn86x2FHhEK
	c9ZlvybRDXSMmoApc3k3/eC3wmVOn0akN0JOLQc=
X-Google-Smtp-Source: AK7set97PV68FCxlHREfjluc/eQ6TYqCrrVB9uY/b0FuFuY0Lk/twQoIDFWMEKjZxyeQ9YvhxOQ+ssHZSreZ5ahzLl8=
X-Received: by 2002:a81:66c5:0:b0:527:9733:fdee with SMTP id
 a188-20020a8166c5000000b005279733fdeemr450381ywc.490.1677018572231; Tue, 21
 Feb 2023 14:29:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230221-gpu-up-time-v1-1-bf8fe74b7f55@asahilina.net>
 <87v8jvnqq4.ffs@tglx> <Y/TP6as7qqwfcI42@boqun-archlinux> <87h6vfnh0f.ffs@tglx>
 <7b93bf74-abdc-f8c1-9a12-7c7f080f9e19@asahilina.net> <87edqioo1e.ffs@tglx>
In-Reply-To: <87edqioo1e.ffs@tglx>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 21 Feb 2023 23:29:21 +0100
Message-ID: <CANiq72n-++roTv3yDNOA=Mi_sscBZX3xPdZ6RZ0Oxx+T82pf5A@mail.gmail.com>
Subject: Re: [PATCH] rust: time: New module for timekeeping functions
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Asahi Lina <lina@asahilina.net>, Boqun Feng <boqun.feng@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 21, 2023 at 7:45 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> But xb abd xr are the same datatype because they represent a time delta.

In principle, one could also have different duration types too. For
instance, C++'s `std::chrono::duration` type is parametrized on the
representation type and the tick period, and thus an operation between
two time points like t1 - t0 returns a duration type that depends on
the type of the time points, i.e. which clock they were obtained from.

Cheers,
Miguel
