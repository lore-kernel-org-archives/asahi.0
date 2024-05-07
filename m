Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F388214E2EF
	for <asahi@lists.linux.dev>; Tue,  7 May 2024 10:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715077464; cv=none; b=IeZTGAHwr6kxhhRHP4K/dHFvuwh4N/MyjofjEn7u+LzjSVNnxiFWUB1jJqyrIE6skxPon8sNiyaUSK9sS3ZgFc5VLyBgoFHAR52z+ie31xfYuu8PFXHo9dfbM6taj1JLCZZPkNTcl+Lelxq39FY89HvCUJVz0uXABaFfJQoiUrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715077464; c=relaxed/simple;
	bh=RrYjROTDfJeyKc0YGUAw8FfKa4f5MwRcggN89Y+XeJ4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MOLYUbCQ+THGSHQnXJ2aVwV1GxiVjZyJRAT/CVvXcfxx2D3OTo1vINZ77D04snd9FEy9knCfyPKykGGOPyyQtXBLANnj3cYQXKK55BM0UrA5AWAMj2dYObOFCQoRePiS5qotWfJ8W1VfePdkcX5WOQFw5bVWN9Szk5WoQQSiark=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pk8wCLp5; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pk8wCLp5"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-41ecffed96cso16366185e9.1
        for <asahi@lists.linux.dev>; Tue, 07 May 2024 03:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715077461; x=1715682261; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4YZbBZ6dudLkSPwyvQd1bbhClktoit8Kjm89gQzGu+Q=;
        b=pk8wCLp5oiEDhAlySNJMoMXH9CEfuzUR2BPoCEJ/5GQZQQbmiznFhIdq689W4ow3pR
         ZvQ35LY43zEIO07tc563Pbd0gsaXLyCEXXiAANeiQCftZwU2m96mY+N1sosFO4r7FLSW
         wBT8UO8Od78NoYEsX8+rwvEVQkwmWjeUtmTOQ6i0PBi3qgzk4/Y2OK5ips6+Aku2QggX
         HY/3aMEvXBXeERpXXdGriaANA80sl7UWnSOxwiy72kTFuFhyOscAc5aZdE/tlcZMUsSP
         kTQrHQPNzEY2xHUTLnPIlHsEePpBiSn1ngVDevAi+Mab62oOxNzCuQK09PS3Ox81jBml
         XVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715077461; x=1715682261;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4YZbBZ6dudLkSPwyvQd1bbhClktoit8Kjm89gQzGu+Q=;
        b=uq3AdnPoHvl/gy1j/wSK8vmxl6q+3K4tWI/yZGvXySG1lt9dBwc6aja2VYnaXTQkYj
         MrDSPkRZQtbb4d5b7zYnHMTF5nqdQhyKhoEOdvSEvHO1nTsM/1FXpLYgMQk48H/eVAI1
         GVrjY5Fio++onHO7Tf/h9X7tUVFMQ8oxgyIO6YApMbIj/l0nHv6HGq0kcI4czeYaQ0gz
         TBB5GQ0iw9fv3C5KzmzZkMtwXx1WoS98UyuexMqHSjRNXpJZK2WuXneY+DoXOJ+YSNr/
         VmL3veMYeoFqrypXLkEDm0Vhg9IgXD4Y+LD7b2SWinhWNkDF3eXQ9xUHgE9CogXo9Vfe
         sBIA==
X-Forwarded-Encrypted: i=1; AJvYcCWUXkDPS9CWeWBQfmW3smTZScWbYhV20dZ3Z7EK1wxMMwm/udRU0z77AVvyF9Bt/rmhpS65ciROXZ6RTAxxay8BFcQBNHI=
X-Gm-Message-State: AOJu0YzLPvZliqmuF7zzu5UTc2GmGMlbdM3Qzh7YXCl/lBvbwj8PsJwT
	EZoZbSHs8IcJNouTT5E4Ji2rWc1mzGGPStDwp+FtXMgBI4YnysJOb3sBHaMhTk0=
X-Google-Smtp-Source: AGHT+IGBnROswMr6fiz4/nCludnMfVTnbGRYLGjJVGEbGLobnst3vIfHHqoUXu/8DrmIadb42FmShQ==
X-Received: by 2002:a05:600c:3b29:b0:41b:8206:2c3e with SMTP id m41-20020a05600c3b2900b0041b82062c3emr8788581wms.40.1715077461332;
        Tue, 07 May 2024 03:24:21 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id fm9-20020a05600c0c0900b0041c23148330sm22850929wmb.10.2024.05.07.03.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 03:24:19 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 6C67E5F87D;
	Tue,  7 May 2024 11:24:18 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Will Deacon <will@kernel.org>
Cc: Hector Martin <marcan@marcan.st>,  Catalin Marinas
 <catalin.marinas@arm.com>,  Marc Zyngier <maz@kernel.org>,  Mark Rutland
 <mark.rutland@arm.com>,  Zayd Qumsieh <zayd_qumsieh@apple.com>,  Justin Lu
 <ih_justin@apple.com>,  Ryan Houdek <Houdek.Ryan@fex-emu.org>,  Mark Brown
 <broonie@kernel.org>,  Ard Biesheuvel <ardb@kernel.org>,  Mateusz Guzik
 <mjguzik@gmail.com>,  Anshuman Khandual <anshuman.khandual@arm.com>,
  Oliver Upton <oliver.upton@linux.dev>,  Miguel Luis
 <miguel.luis@oracle.com>,  Joey Gouly <joey.gouly@arm.com>,  Christoph
 Paasch <cpaasch@apple.com>,  Kees Cook <keescook@chromium.org>,  Sami
 Tolvanen <samitolvanen@google.com>,  Baoquan He <bhe@redhat.com>,  Joel
 Granados <j.granados@samsung.com>,  Dawei Li <dawei.li@shingroup.cn>,
  Andrew Morton <akpm@linux-foundation.org>,  Florent Revest
 <revest@chromium.org>,  David Hildenbrand <david@redhat.com>,  Stefan
 Roesch <shr@devkernel.io>,  Andy Chiu <andy.chiu@sifive.com>,  Josh
 Triplett <josh@joshtriplett.org>,  Oleg Nesterov <oleg@redhat.com>,  Helge
 Deller <deller@gmx.de>,  Zev Weiss <zev@bewilderbeest.net>,  Ondrej
 Mosnacek <omosnace@redhat.com>,  Miguel Ojeda <ojeda@kernel.org>,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  Asahi Linux <asahi@lists.linux.dev>
Subject: Re: [PATCH 0/4] arm64: Support the TSO memory model
In-Reply-To: <20240411132853.GA26481@willie-the-truck> (Will Deacon's message
	of "Thu, 11 Apr 2024 14:28:54 +0100")
References: <20240411-tso-v1-0-754f11abfbff@marcan.st>
	<20240411132853.GA26481@willie-the-truck>
Date: Tue, 07 May 2024 11:24:18 +0100
Message-ID: <87seythqct.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Will Deacon <will@kernel.org> writes:

> Hi Hector,
>
> On Thu, Apr 11, 2024 at 09:51:19AM +0900, Hector Martin wrote:
>> x86 CPUs implement a stricter memory modern than ARM64 (TSO). For this
>> reason, x86 emulation on baseline ARM64 systems requires very expensive
>> memory model emulation. Having hardware that supports this natively is
>> therefore very attractive. Such hardware, in fact, exists. This series
>> adds support for userspace to identify when TSO is available and
>> toggle it on, if supported.
>
> I'm probably going to make myself hugely unpopular here, but I have a
> strong objection to this patch series as it stands. I firmly believe
> that providing a prctl() to query and toggle the memory model to/from
> TSO is going to lead to subtle fragmentation of arm64 Linux userspace.
>
> It's not difficult to envisage this TSO switch being abused for native
> arm64 applications:
>
>   * A program no longer crashes when TSO is enabled, so the developer
>     just toggles TSO to meet a deadline.
>
>   * Some legacy x86 sources are being ported to arm64 but concurrency
>     is hard so the developer just enables TSO to (mostly) avoid thinking
>     about it.
>
>   * Some binaries in a distribution exhibit instability which goes away
>     in TSO mode, so a taskset-like program is used to run them with TSO
>     enabled.

These all just seem like cases of engineers hiding from their very real
problems. I don't know if its really the kernels place to avoid giving
them the foot gun. Would it assuage your concerns at all if we set a
taint flag so bug reports/core dumps indicated we were in a
non-architectural memory mode?

> In all these cases, we end up with native arm64 applications that will
> either fail to load or will crash in subtle ways on CPUs without the TSO
> feature. Assuming that the application cannot be fixed, a better
> approach would be to recompile using stronger instructions (e.g.
> LDAR/STLR) so that at least the resulting binary is portable. Now, it's
> true that some existing CPUs are TSO by design (this is a perfectly
> valid implementation of the arm64 memory model), but I think there's a
> big difference between quietly providing more ordering guarantees than
> software may be relying on and providing a mechanism to discover,
> request and ultimately rely upon the stronger behaviour.

I think the main use case here is for emulation. When we run x86-on-arm
in QEMU we do currently insert lots of extra barrier instructions on
every load and store. If we can probe and set a TSO mode I can assure
you we'll do the right thing ;-)

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
