Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3748C0B
	for <asahi@lists.linux.dev>; Tue, 21 Feb 2023 18:45:37 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1677005134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s7o81hXpRPaZhzimFfGZ066QGnt4k1qFSw88adGPwx8=;
	b=fnT0QPUEarxiCj212dWARI5nJFYCuqOixkORBq1yfkCDCIYCxVCwghD+YG5Ydrqkwwy37s
	5acNg/TNyydi+NfBOGPULStlFr3MJaCGrwLF3z9wT8wW3jOhVB7buZEQZCql1AXYm98djx
	eLTQoRi3oUdwKVAydpA0HABwuUGCcOlugqKy3NAUsNCVqnOxPVo9sanVCZvFc12LL21TGS
	Wih0IUOQFE0jQeCtqzLvuWB8rnZ651ILREE4KulumRUoMdmJ07EwO+OWyAX006n2l6MXVx
	f41SWPvSAvdw0tI9f7exLM8+2w3gLUkpnoGXYZWtWvpDCxCnxNTVqct6owB+bw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1677005134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s7o81hXpRPaZhzimFfGZ066QGnt4k1qFSw88adGPwx8=;
	b=mzh/XO0sOS9HpYMPJr37OdMYRHpsDbfka6PZWS7MoEE3meddw5xi34TiOM68hY8KYMWHZB
	8JB5jm+6He13uMCQ==
To: Asahi Lina <lina@asahilina.net>, Boqun Feng <boqun.feng@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>, John Stultz
 <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 asahi@lists.linux.dev
Subject: Re: [PATCH] rust: time: New module for timekeeping functions
In-Reply-To: <7b93bf74-abdc-f8c1-9a12-7c7f080f9e19@asahilina.net>
References: <20230221-gpu-up-time-v1-1-bf8fe74b7f55@asahilina.net>
 <87v8jvnqq4.ffs@tglx> <Y/TP6as7qqwfcI42@boqun-archlinux>
 <87h6vfnh0f.ffs@tglx> <7b93bf74-abdc-f8c1-9a12-7c7f080f9e19@asahilina.net>
Date: Tue, 21 Feb 2023 19:45:33 +0100
Message-ID: <87edqioo1e.ffs@tglx>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Feb 22 2023 at 01:31, Asahi Lina wrote:
> On 22/02/2023 01.02, Thomas Gleixner wrote:
>> I'm not rusty enough, but you really want two types:
>> 
>>     timestamp and timedelta
>> 
>> timestamp is an absolute time on a specific clock which is read via
>> now() and you can add time deltas to it. The latter is required for
>> arming an absolute timer on the clock.
>> 
>> timedelta is a relative time and completely independent of any
>> clock. That's what you get when you subtract two timestamps, but you can
>> also initialize it from a constant or some other source. timedelta can
>> be used to arm a relative timer on any clock.
>
> If all clocks end up as the same `timestamp` though, then this isn't
> fully safe, because you could subtract `timestamp`s that came from
> different clocks and the result would be meaningless. That's why the
> Rust std Instant is specifically tied to one and only one system clock
> on each platform.

Fine, but do you agree that:

      ts1 = tboot.now()
      ...
      ts2 = tboot.now()

      xb = ts2 - ts1

then the result x1 cannot be the same data type as ts1, ts2.

From a typesafety perspective

      ts1 = treal.now()
      ...
      ts2 = tboot.now()

      x = ts2 - ts1

would be an invalid operation, but

      ts1 = treal.now()
      ...
      ts2 = treal.now()

      xr = ts2 - ts1

is obviously valid.

But xb abd xr are the same datatype because they represent a time delta.

That's the same the Rust std time semantics:

       Duration = Instance - Instance           valid
       Duration = Systemtime - SystemTime       valid
       Duration = Systemtime - Instance         invalid

No?

Thanks,

        tglx


